Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F97E2A1E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 17:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7245F10E109;
	Mon,  6 Nov 2023 16:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0219910E358;
 Mon,  6 Nov 2023 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699288855; x=1730824855;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=W6TBX3wq5n6LG78ZXRmLyTkh51LstlH+EyHwK5EG/UU=;
 b=IPRVuF4lSBU/EodqejFw1cIt6lALlEgmAdvdm+ab9HhXklQuWqHBpF3R
 L12kgTJW9lfaXAc9XJOU8OruD9HCPyddxCU2Tc03M8rWAG7TCwBMsxyCH
 WQ6qGa937/HCkFEfQQ7hJCalxcc45HJausSGgkN3ylLhVOrJtRKQHSU1y
 yxNWIu4LEb6cnGHOQxxPoY2JM0CA0PiguVdMGQA3c7x2iALS7UKeDoA4b
 rS8i/PJ9yagkwCjECbnhkLTmtvCqr+EPNtM3kJJg6h9kFj4yZ3dVmK82K
 4S+u157SqLWH5rtfswGWjkdpO2+eoCMirD8SKdVHqTE+EWtWHyvOS2i8g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="453620458"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="453620458"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 08:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="10502671"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 08:40:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
In-Reply-To: <a2310260-ba15-428e-9fd1-08abb9565b18@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
 <87sf5jyvkt.fsf@intel.com>
 <a2310260-ba15-428e-9fd1-08abb9565b18@gmail.com>
Date: Mon, 06 Nov 2023 18:40:39 +0200
Message-ID: <87h6lyzvg8.fsf@intel.com>
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Nov 2023, Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
> On 11/6/23 16:53, Jani Nikula wrote:
>> On Fri, 03 Nov 2023, Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
>>> sparse static analysis tools generate a warning with this message
>>> "Using plain integer as NULL pointer". In this case this warning is
>>> being shown because we are trying to intialize a pointer to NULL using
>>> integer value 0.
>>>
>>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>>> ---
>>>   drivers/gpu/drm/radeon/clearstate_evergreen.h | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/radeon/clearstate_evergreen.h b/drivers/gpu/drm/radeon/clearstate_evergreen.h
>>> index 63a1ffbb3ced..3b645558f133 100644
>>> --- a/drivers/gpu/drm/radeon/clearstate_evergreen.h
>>> +++ b/drivers/gpu/drm/radeon/clearstate_evergreen.h
>>> @@ -1049,7 +1049,7 @@ static const struct cs_extent_def SECT_CONTEXT_defs[] =
>>>       {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
>>>       {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
>>>       {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
>>> -    { 0, 0, 0 }
>>> +    { NULL, 0, 0 }
>> 
>> Random drive-by comment:
>> 
>> I'd just use {} as the sentinel.
>> 
>> BR,
>> Jani.
>> 
>>>   };
>>>   static const u32 SECT_CLEAR_def_1[] =
>>>   {
>>> @@ -1060,7 +1060,7 @@ static const u32 SECT_CLEAR_def_1[] =
>>>   static const struct cs_extent_def SECT_CLEAR_defs[] =
>>>   {
>>>       {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
>>> -    { 0, 0, 0 }
>>> +    { NULL, 0, 0 }
>>>   };
>>>   static const u32 SECT_CTRLCONST_def_1[] =
>>>   {
>>> @@ -1070,11 +1070,11 @@ static const u32 SECT_CTRLCONST_def_1[] =
>>>   static const struct cs_extent_def SECT_CTRLCONST_defs[] =
>>>   {
>>>       {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
>>> -    { 0, 0, 0 }
>>> +    { NULL, 0, 0 }
>>>   };
>>>   static const struct cs_section_def evergreen_cs_data[] = {
>>>       { SECT_CONTEXT_defs, SECT_CONTEXT },
>>>       { SECT_CLEAR_defs, SECT_CLEAR },
>>>       { SECT_CTRLCONST_defs, SECT_CTRLCONST },
>>> -    { 0, SECT_NONE }
>>> +    { NULL, SECT_NONE }
>>>   };
>>> --
>>> 2.39.2
>>>
>> 
> Hi, Thanks for dropping by and the suggestion. I thought of using NULL 
> instead of {} is because, first the warning itself says that 0 is used 
> to intialize pointers with NULL, and second due this link 
> https://www.spinics.net/lists/linux-sparse/msg10066.html where linus is 
> talking about not using 0 NULL intialization of pointer variable and he 
> thinks this is a legitimate issue and not some false positive

But... {} is neither of those things. It's empty initialization instead
of 0. It's valid in GCC and C23, and used all over the place in the
kernel.

BR,
Jani.



-- 
Jani Nikula, Intel
