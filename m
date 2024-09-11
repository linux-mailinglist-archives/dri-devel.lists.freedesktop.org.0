Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ACE974EC1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 11:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0533A10E987;
	Wed, 11 Sep 2024 09:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="NPkueXy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F05310E987;
 Wed, 11 Sep 2024 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1726047439;
 bh=hS9PvT3pixMACdmF08Aw+1OmmFH6l8k4RIyoV22oG44=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=NPkueXy/FQycNDZ00KfSkJx3q+p8mOcBjxidYKlhsZNIYExBuBCFrf105P1TVPDdT
 j0rPxT+H3GFyvRKuscJ3P2BCI4AW2FCSx1MI2X52WMrEUDPN8pSboRvgkHlP4Focoh
 eDk5hIQCWn4GLflMJhdHifYspSmI/UVmKNBHeZlA=
X-QQ-mid: bizesmtpsz10t1726047435t21smw
X-QQ-Originating-IP: Ge0Kpt3pDoLPdSN79qu7ZZpbL3pemk4Tz9lvFU3tLQI=
Received: from [10.4.11.213] ( [221.226.144.218])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 11 Sep 2024 17:37:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6003562393121779390
Message-ID: <F528E203CF5ECE52+1674ad12-e278-4527-82b6-395f9e91cd76@uniontech.com>
Date: Wed, 11 Sep 2024 17:37:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: use devm_add_action_or_reset() helper
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <BE0644D06348D90D+20240907065439.1661032-1-helugang@uniontech.com>
 <ZuCWoP1LeqlRPvaQ@intel.com>
From: HeLuang <helugang@uniontech.com>
In-Reply-To: <ZuCWoP1LeqlRPvaQ@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
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



在 2024/9/11 02:57, Rodrigo Vivi 写道:
> On Sat, Sep 07, 2024 at 02:54:39PM +0800, He Lugang wrote:
>> Use devm_add_action_or_reset() to release resources in case of failure,
>> because the cleanup function will be automatically called.
>>
>> Signed-off-by: He Lugang <helugang@uniontech.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_freq.c  | 2 +-
>>   drivers/gpu/drm/xe/xe_gt_sysfs.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index 68a5778b4319..71bcd60d0866 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -237,7 +237,7 @@ int xe_gt_freq_init(struct xe_gt *gt)
>>   	if (!gt->freq)
>>   		return -ENOMEM;
>>   
>> -	err = devm_add_action(xe->drm.dev, freq_fini, gt->freq);
>> +	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
> 
> you need to move this to a lower point then...
> otherwise fini function will try to remove the sysfs files that
> hadn't been created.
OK,thanks for your reply!
> 
>>   	if (err)
>>   		return err;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> index a05c3699e8b9..ec2b8246204b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> @@ -51,5 +51,5 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>>   
>>   	gt->sysfs = &kg->base;
>>   
>> -	return devm_add_action(xe->drm.dev, gt_sysfs_fini, gt);
>> +	return devm_add_action_or_reset(xe->drm.dev, gt_sysfs_fini, gt);
> 
> this one looks right indeed.
> 
>>   }
>> -- 
>> 2.45.2
>>
> 
