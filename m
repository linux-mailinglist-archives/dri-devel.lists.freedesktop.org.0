Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7233517D46
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 08:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA7E10FE18;
	Tue,  3 May 2022 06:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8173510FE17;
 Tue,  3 May 2022 06:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651558950; x=1683094950;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9rozSHJTQpveWLPC038n9XzE+Ln+2sSYbGUtHjYRAhI=;
 b=giYLrYG4AKX/Vd3kEewv6B3lJo1qX5yp9cHdRz3Cp+vZr2WLb2Z4WCSd
 hzkwy6IIkIJdNd8P6KcyGntvA5qpX0czyqrsdLPRKY4Gpi7eqklvpe9nq
 NI1TMXidPMqWlVm2YkcJfPyhZmKGG3BxXSdFjv4gU2Ub3YlpF1lBG++ve
 u48sIQYSN21YD/9hHfmSWU9CKp7h5wGJNrhGpYS7YVQkG5nFjdW97JIjh
 /i5Pfpr04llimBlJyWFAtYBlsbY25sHiamL4ufX1YqM3iGLLIUUa0Mx6d
 zGX3xn/HgZ1c9kzdEcHgTWR7LmkyJley0SjyWtPTT8QRJOZizEI51tXLc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="330399312"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="330399312"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 23:22:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="653145775"
Received: from alwohlse-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.11.126])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 23:22:29 -0700
Date: Mon, 2 May 2022 23:22:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 03/11] drm/i915/pvc: Define MOCS table for PVC
Message-ID: <20220503062229.5q75lqaxftr64dcf@ldmartin-desk2>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-4-matthew.d.roper@intel.com>
 <20220502210328.x6jvlln2e6x7zxlc@ldmartin-desk2>
 <YnBJmselMqaM3zNE@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YnBJmselMqaM3zNE@mdroper-desk1.amr.corp.intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>, Fei Yang <fei.yang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 02:14:02PM -0700, Matt Roper wrote:
>On Mon, May 02, 2022 at 02:03:28PM -0700, Lucas De Marchi wrote:
>> On Mon, May 02, 2022 at 09:34:09AM -0700, Matt Roper wrote:
>> > From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>...
>> > @@ -2002,11 +2002,18 @@ engine_fake_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>> > 	 * Streamers on Gen12 onward platforms.
>> > 	 */
>> > 	if (GRAPHICS_VER(engine->i915) >= 12) {
>> > -		mocs = engine->gt->mocs.uc_index;
>> > +		if (HAS_L3_CCS_READ(engine->i915) &&
>> > +		    engine->class == COMPUTE_CLASS)
>> > +			mocs_r = engine->gt->mocs.wb_index;
>> > +		else
>> > +			mocs_r = engine->gt->mocs.uc_index;
>>
>> shouldn't we add a warning in get_mocs_settings() if HAS_L3_CCS_READ(engine->i915)
>> and mocs.wb_index is 0 (since index 0 shouldn't really be used in latest
>> platforms)?
>
>We should be careful about that assumption...index 0 is valid on DG2
>today, although HAS_L3_CCS_READ() doesn't apply there.  And a couple
>platforms in the future we're also going to have index 0 being valid on
>a platform where HAS_L3_CCS_READ() is true (bspec 71582).  Index 0 would
>still be the wrong entry to pick for WB behavior there, but it is a
>legitimate entry in general.

ok, but comment is more about "forgetting to initialize it in
get_mocs_settings() and then using it here". Using 0 as "it was not
initialized" may be an easy way to do that.

Lucas De Marchi
