Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B06D120EB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 11:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104B310E081;
	Mon, 12 Jan 2026 10:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BA9cg3I8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2DE10E081
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tSgfLTASpP1GqUhpscZ+xd7ZapIOB78e/RoLFV+TwmM=; b=BA9cg3I84Ghcy7cNnb04dkJLBR
 Rvem8dhcgr5N8fmx90vy0CJokJyR4xhjxJbBi5PZKwxnVe0XPRj2N8jZHTt4Lhw09JOrhnxDAErH6
 sbcIjQg9CxlWWpxm4Nfe7nh2TwIG6VAk80sMf0rrUz661P/C09siqag7Bt8HDuFysRUR0+33WtAMP
 IqPAkkf6iYvKjkWEBqWJXyjACt8bl0EzdLe33ot8LaNJJMLMnbR+Pfxp69LjYKqXOGAvy2PoUDq+H
 1nhZJ/fRAQCaPN3BbmyG+qIY1485bEwTNNa1KmiM2IsAY9DLa8Pi1ToPrz2aJOWWpLaaHpR/otkXs
 6bnI6+BQ==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vfFYk-004Mhy-C9; Mon, 12 Jan 2026 11:54:06 +0100
Message-ID: <84c6fd9e-9b7e-4e6c-8f2d-4fc17afb3e43@igalia.com>
Date: Mon, 12 Jan 2026 07:53:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/v3d: Convert v3d logging to device-based DRM
 helpers
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia.com>
 <20260109-v3d-drm-debug-v1-2-02041c873e4d@igalia.com>
 <67d99227733bbb662550a20a9a6f27bf5a62d956.camel@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <67d99227733bbb662550a20a9a6f27bf5a62d956.camel@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Iago,

On 12/01/26 04:57, Iago Toral wrote:
> El vie, 09-01-2026 a las 15:35 -0300, Maíra Canal escribió:
> (...)
>> @@ -126,9 +126,9 @@ v3d_reset(struct v3d_dev *v3d)
>>   {
>>   	struct drm_device *dev = &v3d->drm;
>>   
>> -	DRM_DEV_ERROR(dev->dev, "Resetting GPU for hang.\n");
>> -	DRM_DEV_ERROR(dev->dev, "V3D_ERR_STAT: 0x%08x\n",
>> -		      V3D_CORE_READ(0, V3D_ERR_STAT));
>> +	drm_warn(dev, "Resetting GPU for hang.\n");
>> +	drm_warn(dev, "V3D_ERR_STAT: 0x%08x\n", V3D_CORE_READ(0,
>> V3D_ERR_STAT));
>> +
> 
> These look like they should be drm_err, no?

Actually, I decided to change to a warning as a GPU reset is not always
an error. For example, we have the DRM_GPU_SCHED_STAT_NO_HANG scenario,
in which the GPU isn't actually hung. Also, sometimes we have GPU resets
that recover the GPU and the user doesn't see any disruption.

I believe a warning is a good compromise between an error and a debug
message, but I'm fine with changing it back to an error if you believe
it's more suitable.

> 
> (...)
> 
> 
>>   static int
>> -v3d_get_multisync_post_deps(struct drm_file *file_priv,
>> +v3d_get_multisync_post_deps(struct v3d_dev *v3d,
> 
> Same comment as in the previous patch. Again, not necessarily against
> it.

I'll address it in v2. Thanks!

> 
>> +			    struct drm_file *file_priv,
>>   			    struct v3d_submit_ext *se,
>>   			    u32 count, u64 handles)
>>   {
>> @@ -346,7 +347,7 @@ v3d_get_multisync_post_deps(struct drm_file
>> *file_priv,
>>   
>>   		if (copy_from_user(&out, post_deps++, sizeof(out)))
>> {
>>   			ret = -EFAULT;
>> -			DRM_DEBUG("Failed to copy post dep
>> handles\n");
>> +			drm_dbg(&v3d->drm, "Failed to copy post dep
>> handles\n");
> 
> I think we have a lot of these kind of things as dbg that sould
> probably be err, no? Not sure if that is very relevant though, but we
> can fix that separately if we want to.

I have the impression that those messages are more useful for us,
developers, than the end user. For such reason, I believe that a debug
message is more suitable, as the userspace will (hopefully) handle the
errno gracefully and in case of a bug, we can use ``drm.debug`` to
investigate it without swamping the user's kernel log.

Best regards,
- Maíra

> 
> Iago
> 
>>   			goto fail;
>>   		}
>>   

