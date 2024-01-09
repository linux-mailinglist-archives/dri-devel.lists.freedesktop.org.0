Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3C1828B46
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 18:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD1610E4AC;
	Tue,  9 Jan 2024 17:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CCF10E4AC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lBcrNyw+LS6Xvu+7DYRwNZDJ7NoM+bZnPj2FbcAbHw4=; b=GmRn/KYRHTMFbOaVP6TYKWK/mC
 4GomibyzDMvzLK5tk46famvKYU0pe0GTtH6KtpHwy6jxeIbs/xRbkN1neykVlOT5ovkdYHnMixKpQ
 r6WrnfbLPJBMTnx6qQq4UjSMgRKhuvUSxQvOXCPPKYPR5fIHx55NrzJlAO3N/WIgm2igKTmiodW2Q
 oTe7QmLOr0yK20+hfRQTvIeNfIc3xjWwZpRPY+Fg2SktvvgiDa+HuO0bzWQnB3qJjzqpuI9PduJPk
 yk2Wox/oHahlSathjRdwqFnYMTeQS1viUhNQ5qW/zmpc0sn6+OJIjitmwtvE3SB11hnAVvuEBbLYp
 gaZueqpQ==;
Received: from [179.234.233.159] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rNFvy-004gXL-Rm; Tue, 09 Jan 2024 18:30:39 +0100
Message-ID: <6a6df07b-0789-40c2-bbb2-f280d2182859@igalia.com>
Date: Tue, 9 Jan 2024 14:30:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Fix support for register debugging on the RPi 4
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20240109113126.929446-1-mcanal@igalia.com>
 <bd40825bd189fa80bf4ec28492ce76f909299b29.camel@igalia.com>
Content-Language: en-US
From: Maira Canal <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <bd40825bd189fa80bf4ec28492ce76f909299b29.camel@igalia.com>
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/24 09:07, Iago Toral wrote:
> Thanks Maíra!
> 
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Applied to drm-misc/drm-misc-next-fixes!

Best Regards,
- Maíra

> 
> El mar, 09-01-2024 a las 08:30 -0300, Maíra Canal escribió:
>> RPi 4 uses V3D 4.2, which is currently not supported by the register
>> definition stated at `v3d_core_reg_defs`. We should be able to
>> support
>> V3D 4.2, therefore, change the maximum version of the register
>> definition to 42, not 41.
>>
>> Fixes: 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D
>> 7.x")
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_debugfs.c | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c
>> b/drivers/gpu/drm/v3d/v3d_debugfs.c
>> index f843a50d5dce..94eafcecc65b 100644
>> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
>> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
>> @@ -62,9 +62,9 @@ static const struct v3d_reg_def v3d_core_reg_defs[]
>> = {
>>   	REGDEF(33, 71, V3D_PTB_BPCA),
>>   	REGDEF(33, 71, V3D_PTB_BPCS),
>>
>> -	REGDEF(33, 41, V3D_GMP_STATUS(33)),
>> -	REGDEF(33, 41, V3D_GMP_CFG(33)),
>> -	REGDEF(33, 41, V3D_GMP_VIO_ADDR(33)),
>> +	REGDEF(33, 42, V3D_GMP_STATUS(33)),
>> +	REGDEF(33, 42, V3D_GMP_CFG(33)),
>> +	REGDEF(33, 42, V3D_GMP_VIO_ADDR(33)),
>>
>>   	REGDEF(33, 71, V3D_ERR_FDBGO),
>>   	REGDEF(33, 71, V3D_ERR_FDBGB),
>> @@ -74,13 +74,13 @@ static const struct v3d_reg_def
>> v3d_core_reg_defs[] = {
>>
>>   static const struct v3d_reg_def v3d_csd_reg_defs[] = {
>>   	REGDEF(41, 71, V3D_CSD_STATUS),
>> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG0(41)),
>> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG1(41)),
>> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG2(41)),
>> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG3(41)),
>> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG4(41)),
>> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG5(41)),
>> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG6(41)),
>> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG0(41)),
>> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG1(41)),
>> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG2(41)),
>> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG3(41)),
>> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG4(41)),
>> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG5(41)),
>> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG6(41)),
>>   	REGDEF(71, 71, V3D_CSD_CURRENT_CFG0(71)),
>>   	REGDEF(71, 71, V3D_CSD_CURRENT_CFG1(71)),
>>   	REGDEF(71, 71, V3D_CSD_CURRENT_CFG2(71)),
>> --
>> 2.43.0
>>
>>
> 
