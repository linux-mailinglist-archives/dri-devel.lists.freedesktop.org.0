Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8AC9E5D93
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 18:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4A510EF4A;
	Thu,  5 Dec 2024 17:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qnOSplhG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C2E10EF4A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VC5Q5VhFolVQqOIeMPRL/FD6EJNcWK177zOjwgVshSs=; b=qnOSplhGAwD0/CQJCVadhWwi4j
 Wi3d5iq0iDyueagbW/Wyo4SNkHD8I2b46A/tQ+gT7fzCJbeHC6ClA74Ph90wYNLqUllK4y2Rp7lyD
 88g+yNE7ixLDuTkwiifLxv7iaRprHFE8Unf0MURujgs4MOZd+Tr9uXe/uli0kA/u8Z0rEXPykT/wW
 eR1nvt91A2jiMGnKdBqr6ykNhXIWtBltNo1f9CBp3Euurs88+BsHRkNXBT4xzrs4qXKG1s2OObORT
 Ld10eXu53U6MwAN2njrmcSMplfaifzQEJI4QhEEh6JXUFKMVgPNK8VHgrTjN6BygVmyaGY597T2Ke
 oiuCHhzg==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tJFuj-00H4rx-GA; Thu, 05 Dec 2024 18:45:21 +0100
Message-ID: <700f1ec7-cbe3-4d8d-a694-40350918df52@igalia.com>
Date: Thu, 5 Dec 2024 14:45:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Enable Performance Counters before clearing them
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241204122831.17015-1-mcanal@igalia.com>
 <2c2af0bb388fd740f72d8e4521feb41feac86319.camel@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <2c2af0bb388fd740f72d8e4521feb41feac86319.camel@igalia.com>
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

On 04/12/24 09:36, Iago Toral wrote:
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Thanks for reviewing! Applied to misc/kernel.git (drm-misc-fixes).

Best Regards,
- Maíra

> 
> El mié, 04-12-2024 a las 09:28 -0300, Maíra Canal escribió:
>> On the Raspberry Pi 5, performance counters are not being cleared
>> when `v3d_perfmon_start()` is called, even though we write to the
>> CLR register. As a result, their values accumulate until they
>> overflow.
>>
>> The expected behavior is for performance counters to reset to zero
>> at the start of a job. When the job finishes and the perfmon is
>> stopped, the counters should accurately reflect the values for that
>> specific job.
>>
>> To ensure this behavior, the performance counters are now enabled
>> before being cleared. This allows the CLR register to function as
>> intended, zeroing the counter values when the job begins.
>>
>> Fixes: 26a4dc29b74a ("drm/v3d: Expose performance counters to
>> userspace")
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_perfmon.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c
>> b/drivers/gpu/drm/v3d/v3d_perfmon.c
>> index b4c3708ea781..c49abb90954d 100644
>> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
>> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
>> @@ -255,9 +255,9 @@ void v3d_perfmon_start(struct v3d_dev *v3d,
>> struct v3d_perfmon *perfmon)
>>   		V3D_CORE_WRITE(0, V3D_V4_PCTR_0_SRC_X(source),
>> channel);
>>   	}
>>   
>> +	V3D_CORE_WRITE(0, V3D_V4_PCTR_0_EN, mask);
>>   	V3D_CORE_WRITE(0, V3D_V4_PCTR_0_CLR, mask);
>>   	V3D_CORE_WRITE(0, V3D_PCTR_0_OVERFLOW, mask);
>> -	V3D_CORE_WRITE(0, V3D_V4_PCTR_0_EN, mask);
>>   
>>   	v3d->active_perfmon = perfmon;
>>   }
> 

