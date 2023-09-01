Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 789B878FA55
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 10:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BA510E1D0;
	Fri,  1 Sep 2023 08:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D58910E751;
 Fri,  1 Sep 2023 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693558653; x=1725094653;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YaK0sBSfP+2sKQEf7Aebu7iHWoATcebhuYBSjbJ2WD0=;
 b=Wq3rJWJH+g3jAtw5OZWeQYZH/UMVnIl8WKaCzjAWxC4oLLVSAn+YXuQq
 aEFpL+dwMJdB5nVZ+m41yDlfdZPEkxavyPoa91bPUjByiH3asDwfuGoE5
 HE1PViTecILH5J7gJDOSemS10RGinQgaum8xKCHmQETw6TRtY8dkurdeq
 QlHNaECAHxhi0arajPynI/yxvcuOvJcDh0wIVVArV2VH6UJUJSyNpKda+
 /+Oa7zcLmq1jjdIoKaA87YLXt3wkzqT/qZkH1xn/FQ049bWeES2dI7Etb
 CWqlZxkUQDEeK/4qj65qaeHlNrO4KncMdHXMMYErLFQua1d8KZAvNgJdQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379957732"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="379957732"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 01:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="774918806"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="774918806"
Received: from shochwel-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.58.219])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 01:57:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/6] drm, cec and edid updates
In-Reply-To: <6i3idgngjlyez6y7zleqrt54r7f4c3urifgerizhzoarwdilv2@auwk3cedxv2t>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692884619.git.jani.nikula@intel.com>
 <8734zzjb9v.fsf@intel.com>
 <6i3idgngjlyez6y7zleqrt54r7f4c3urifgerizhzoarwdilv2@auwk3cedxv2t>
Date: Fri, 01 Sep 2023 11:57:24 +0300
Message-ID: <87wmxai83v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 01 Sep 2023, Maxime Ripard <mripard@kernel.org> wrote:
> On Thu, Aug 31, 2023 at 09:51:24PM +0300, Jani Nikula wrote:
>> On Thu, 24 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> > Avoid accessing the raw edid directly. Pre-parse the source physical
>> > address during normal EDID parsing and use that for CEC.
>> >
>> > Jani Nikula (6):
>> >   drm/edid: add drm_edid_is_digital()
>> >   drm/i915/display: use drm_edid_is_digital()
>> >   drm/edid: parse source physical address
>> >   drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
>> >   drm/i915/cec: switch to setting physical address directly
>> 
>> Maarten, Maxime, Thomas, ack for merging patches 1, 3 and 4 via via
>> drm-intel?
>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks for all the reviews and acks, pushed the series to
drm-intel-next.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
