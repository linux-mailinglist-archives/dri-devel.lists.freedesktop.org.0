Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2111AAF991
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 14:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C5E10E38D;
	Thu,  8 May 2025 12:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeH2cMMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C986D10E38D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 12:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746706595; x=1778242595;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7X3Ofin17uEXRiWR2/7qF07FRRAOt7jou2NssZWBl6g=;
 b=jeH2cMMHPr0GCyIUIuPPjPxiTyFyW2c6h5+qZEFoUvkJ59eZAdOhN6z5
 Vd7j+G5Lgh4pgd2/316bXE7YMdc5OZEXtdbL/eSN+yUkZq4qL3m/4Ly2M
 m3FZMXsDbnmfYy3OLTnnEx5qSL3fvDSF0Xkb5tE4r+B+LbQjJIvAEtWha
 Pj5JqnCLHa7OGlHygFpwKaRPn6qBrH1O+8+chfwO2IoVrGBgHYAjAL2ZB
 VAeTjFUqCaVVD4O3XcYIPZ3QoR1siL1GF2ADmyFrQrvMKDVup1GcJJOsA
 y1AZ6SpYB4pIESh09amk6VhTWFwA56PlY9D5AuBJZU4WXnjDf5ZIjHJRy w==;
X-CSE-ConnectionGUID: B8CWpAa1QISsUD0cdE1rHg==
X-CSE-MsgGUID: GnDmuwNEQoGNNru4TrSdNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52293830"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="52293830"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 05:16:33 -0700
X-CSE-ConnectionGUID: TkJmIs6ESgGmq2EEtRNiMA==
X-CSE-MsgGUID: pKn7x70CTz2Q/Gwd5rNzlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="136206747"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 05:16:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/dp: Fix Write_Status_Update_Request AUX request format
In-Reply-To: <CO6PR12MB5489386C2D4F5D6DC49FF27AFC8BA@CO6PR12MB5489.namprd12.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250427095053.875064-1-Wayne.Lin@amd.com>
 <877c2rv7k3.fsf@intel.com>
 <CO6PR12MB5489386C2D4F5D6DC49FF27AFC8BA@CO6PR12MB5489.namprd12.prod.outlook.com>
Date: Thu, 08 May 2025 15:16:29 +0300
Message-ID: <878qn7ti02.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 08 May 2025, "Lin, Wayne" <Wayne.Lin@amd.com> wrote:
> [Public]
>
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@intel.com>
>> Sent: Thursday, May 8, 2025 4:19 PM
>> To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org
>> Cc: ville.syrjala@linux.intel.com; Limonciello, Mario <Mario.Limonciello@amd.com>;
>> Wentland, Harry <Harry.Wentland@amd.com>; Lin, Wayne
>> <Wayne.Lin@amd.com>; stable@vger.kernel.org
>> Subject: Re: [PATCH] drm/dp: Fix Write_Status_Update_Request AUX request
>> format
>>
>> On Sun, 27 Apr 2025, Wayne Lin <Wayne.Lin@amd.com> wrote:
>> > +                   /*
>> > +                    * When I2C write firstly get defer and get ack after
>> > +                    * retries by wirte_status_update, we have to return
>> > +                    * all data bytes get transferred instead of 0.
>> > +                    */
>>
>> My brain gives me syntax and parse error here. ;)
>
> Appreciate for the feedback, Jani.
> Could you elaborate more on your concerns please?
>
> Since Write_Status_Update_Request is address only request. Data length
> is 0. When I2C write request completes, reply for
> Write_Status_Update_Request from DPRx will be ACK only (i.e. data
> length is 0).
>
> Is your concern about returning 0 from aux->transfer?
> My thoughts is drm_dp_i2c_do_msg() is designed to handle I2C-Over-Aux
> reply data, and aux->transfer() is handling hw specific manipulation and
> return transferred bytes. For Write_Status_Update_Request request itself,
> nothing new to be transferred. I think drm_dp_i2c_do_msg() should be
> responsible for determining the correct transferred data bytes under this
> case. Or do you expect aux->transfer to memorize the data length of
> write request?

My concern is that I don't understand what the comment is trying to say.

"when i2c write firstly get defer" - what does it mean?

"wirte_status_update" - typo

"we have to" - why?

"return all data bytes get transferred" - what does it mean?

>
> Thanks!
>>
>> BR,
>> Jani.
>>
>> --
>> Jani Nikula, Intel
> --
> Wayne Lin

-- 
Jani Nikula, Intel
