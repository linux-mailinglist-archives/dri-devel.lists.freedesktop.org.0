Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947A970096
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 09:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD13910E15B;
	Sat,  7 Sep 2024 07:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="nP60fdbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 91578 seconds by postgrey-1.36 at gabe;
 Sat, 07 Sep 2024 07:36:43 UTC
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5795010E15B
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 07:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1725694571;
 bh=wbbNuQHlcHZKLoGAXFXZi3w/QmEjjpabOcO+QNLP+l4=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=nP60fdbsebjSGlCHp5YEoZ8fnoVtoFp6gK8un2qrda5BckDCDtQSivj3iu7LuNB3I
 V9op4KVFprO81LVFafFEgj6DN5GtypLNxAz06ZeaUjifw6mhIkro6W0nt2qdM0JpLR
 VPZCQizOpX4Ek4Ha4yOUq+rJksIXQ0xCPzIYsS6o=
X-QQ-mid: bizesmtpsz10t1725694568tj0imf
X-QQ-Originating-IP: Pvogud4RoUxeoLL+xYx2nsemLG0L5Cl2Co/r1leaYVo=
Received: from [10.4.11.213] ( [221.226.144.218])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 07 Sep 2024 15:36:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15775630320884027498
Message-ID: <B2DCD49E0F4D005A+e8f11666-5673-4db7-af22-e920ff2ebd6b@uniontech.com>
Date: Sat, 7 Sep 2024 15:36:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: use devm_add_action_or_reset() helper
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.c
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <F2C380666CC48547+20240907065152.1660750-1-helugang@uniontech.com>
From: HeLuang <helugang@uniontech.com>
In-Reply-To: <F2C380666CC48547+20240907065152.1660750-1-helugang@uniontech.com>
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

sorry pls just pass over this email.

--
Sincerely,
Lugang

在 2024/9/7 14:51, He Lugang 写道:
> Use devm_add_action_or_reset() to release resources in case of failure,
> because the cleanup function will be automatically called.
> 
> Signed-off-by: He Lugang <helugang@uniontech.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_freq.c  | 2 +-
>   drivers/gpu/drm/xe/xe_gt_sysfs.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 68a5778b4319..71bcd60d0866 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -237,7 +237,7 @@ int xe_gt_freq_init(struct xe_gt *gt)
>   	if (!gt->freq)
>   		return -ENOMEM;
>   
> -	err = devm_add_action(xe->drm.dev, freq_fini, gt->freq);
> +	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index a05c3699e8b9..ec2b8246204b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -51,5 +51,5 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>   
>   	gt->sysfs = &kg->base;
>   
> -	return devm_add_action(xe->drm.dev, gt_sysfs_fini, gt);
> +	return devm_add_action_or_reset(xe->drm.dev, gt_sysfs_fini, gt);
>   }
