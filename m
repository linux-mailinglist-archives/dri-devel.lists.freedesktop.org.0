Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC6C738B5E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF7110E248;
	Wed, 21 Jun 2023 16:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D6110E12B;
 Wed, 21 Jun 2023 16:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7N1WGqrBp9+Iyd9D5V8/dIUPWAJST/ymDiHP/MT87cU=; b=o07VQPVi9DxX8NeSU3/wRUxC29
 ZghLkZmPcHzGlLIPJVG2DdQJTySQ3/NmK56V9HaOW3EdUlGypKtqhBDFmUALv51pmUB7tB4S6xLQS
 e8cWIMP6Ej3DDz+aApI2sXtz/yJ3ESanrbsghXC+wuVl4KNRZinBqgkFv3BEL2KytxmMYBdjrkfLW
 LNubJDlTgHWL6VYsRzy8sB0VXZWQ4GGhYwTERXoEzDChNVWfvvKq83wh3TaBpUpS6WzVn4pY13sqx
 e96rsJ59toY+P4cwRD8gComf4mOTwDgOqHC6plK8QUEhgn8UgnDPDMBtOVyRa14LCIMfoZPUaHMZ3
 nAHWr5og==;
Received: from [179.113.218.86] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qC0mP-001O6B-Ol; Wed, 21 Jun 2023 18:34:01 +0200
Message-ID: <ab9ebe98-f583-234d-4901-ae570fb89d9f@igalia.com>
Date: Wed, 21 Jun 2023 13:33:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v3 2/4] drm: Create DRM_IOCTL_GET_RESET
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230621005719.836857-1-andrealmeid@igalia.com>
 <20230621005719.836857-3-andrealmeid@igalia.com>
 <20230621110931.6f3c8914@eldfell>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20230621110931.6f3c8914@eldfell>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 21/06/2023 05:09, Pekka Paalanen escreveu:
> On Tue, 20 Jun 2023 21:57:17 -0300
> André Almeida <andrealmeid@igalia.com> wrote:
> 
>> Create a new DRM ioctl operation to get the numbers of resets for a
>> given context. The numbers reflect just the resets that happened after
>> the context was created, and not since the machine was booted.
>>
>> Create a debugfs interface to make easier to test the API without real
>> resets.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c |  2 ++
>>   drivers/gpu/drm/drm_ioctl.c   | 58 +++++++++++++++++++++++++++++++++++
>>   include/drm/drm_device.h      |  3 ++
>>   include/drm/drm_drv.h         |  3 ++
>>   include/uapi/drm/drm.h        | 21 +++++++++++++
>>   include/uapi/drm/drm_mode.h   | 15 +++++++++
>>   6 files changed, 102 insertions(+)
> 
> ...
> 
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index a87bbbbca2d4..a84559aa0d77 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -1169,6 +1169,27 @@ extern "C" {
>>    */
>>   #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
>>   
>> +/**
>> + * DRM_IOCTL_GET_RESET - Get information about device resets
>> + *
>> + * This operation requests from the device information about resets. It should
>> + * consider only resets that happens after the context is created, therefore,
>> + * the counter should be zero during context creation.
>> + *
>> + * dev_reset_count tells how many resets have happened on this device, and
>> + * ctx_reset_count tells how many of such resets were caused by this context.
>> + *
>> + * Flags can be used to tell if a reset is in progress, and userspace should
>> + * wait until it's not in progress anymore to be able to create a new context;
>> + * and to tell if the VRAM is considered lost. There's no safe way to clean this
>> + * flag so if a context see this flag set, it should be like that until the end
>> + * of the context.
> 
> Is "this flag" the VRAM_LOST? Or any flag?
> 
> Does this mean that not all resets are fatal to the context? Is there
> any kind of reset that should not be fatal to a context? All the
> rendering APIs seem to assume that any reset is fatal and the context
> must be destroyed.

I got this flag from the `AMDGPU_CTX_OP_QUERY_STATE2` operation, and 
it's used to notify that the reset was fatal for a giving context, 
although the idea of non-fatal resets seems to be a bit controversial 
for now, so I think it will be better if I leave this flag for latter 
improvements of the API.

> 
>> + */
>> +#define DRM_IOCTL_GET_RESET		DRM_IOWR(0xCF, struct drm_get_reset)
>> +
>> +#define DRM_RESET_IN_PROGRESS	0x1
>> +#define DRM_RESET_VRAM_LOST	0x2
> 
> Ok, so the dmabuf lost is being communicated here, but how would a
> userspace process know on which device a dmabuf resides on?
> 
> Let's assume process A uses device 1 to draw, exports a dmabuf, sends
> it to process B which imports it to device 2. Device 1 resets and loses
> VRAM contents. How would process B notice that the dmabuf is lost when
> it never touches device 1 itself?
> 
>> +
>>   /*
>>    * Device specific ioctls should only be in their respective headers
>>    * The device specific ioctl range is from 0x40 to 0x9f.
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index 43691058d28f..c3257bd1af9c 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -1308,6 +1308,21 @@ struct drm_mode_rect {
>>   	__s32 y2;
>>   };
>>   
>> +/**
>> + * struct drm_get_reset - Get information about a DRM device resets
>> + * @ctx_id: the context id to be queried about resets
>> + * @flags: flags
>> + * @dev_reset_count: global counter of resets for a given DRM device
>> + * @ctx_reset_count: of all the resets counted by this device, how many were
>> + * caused by this context.
>> + */
>> +struct drm_get_reset {
>> +	__u32 ctx_id;
>> +	__u32 flags;
>> +	__u64 dev_reset_count;
>> +	__u64 ctx_reset_count;
>> +};
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
> 
> Thanks,
> pq
