Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id L3fHGKW4mGn3LQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 20:40:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85FD16A63D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 20:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE0010E830;
	Fri, 20 Feb 2026 19:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BJX3k5q1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A66710E830
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 19:40:16 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4376de3f128so1658578f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 11:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771616415; x=1772221215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nyHPZhc6MnyvbtV+6dNUEPdByvvgCMiVIv5VMP5WfV4=;
 b=BJX3k5q1ZK2SDBAHsdxR4tmd7M8qEd1Jn/WkCFXydiZSAGVZ9TTmSzcJHw4bHrbYWh
 ydxBLfbe+ETyvEz9pwedFF/9rv4lB+7BAJwIexU9QVASc760BPEuTNC4Qf2wSELk8ErN
 AMDQzGPKcMbrgCYyOUTsrNxMEZ1KBKrBxHLtYRnLMxAxO5ilGIctMPC2WuwKUTGThWg4
 gUDFEHDl4zUQMeg4Bg/VtX+DnGk22T2IA1Nq6niJzY0jkPwQe/PEvwVer51EUoqf/6Hp
 FpLS4tdKJgqkEqbrNktkoBsaBvN6grt06zRMh7CnZFveiUbesuNPbo50dKzhdVcJn2TW
 vNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771616415; x=1772221215;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nyHPZhc6MnyvbtV+6dNUEPdByvvgCMiVIv5VMP5WfV4=;
 b=PnmAX2Luue7crIh8X29+fYMBgfvSLrOE8F0AIgVINn0NRCnG9ZraPFT61YQwSSq11W
 WgnttHZk+o7S+NkCxl6jDAYE1nRDCyk9sy7y+2zsaqXEQvlTuVqpzg/S+yQlKIJbSPiy
 FF9+9N4S/05ycxoOOaOUPujBhJdz4SeBryo6DsnSl1aqA3uMyCgSLfgjn5ieK8JF2RFF
 WybdL6kKbzTJ0VU5oTLiW+AASy1b2oQ8ZoFFY1o4oIWeTw+0mdkwMAB28lpofOTrO9IS
 whxubVoN1lOBWVTUmPhdJEE71ufvFKcnJZqetGUmv0Ull5HtMFz3XKh40YF5M6vAXdMW
 BTsQ==
X-Gm-Message-State: AOJu0Yw6KIEqjEykOtFfwV38isE5NcKHLbRfHJORo+9cWE9VLKsj3QT7
 Z7lu246z+LeUysRYfinyCLCIUndBp2ME3Ipxl1e5OvQ4UYF4qgUKa83M
X-Gm-Gg: AZuq6aJ3dKUipbZ2h/3nlf/VAJ8HfCxiRuuOBSx6RRvnVhrfc9F8R4LM2Vw2RWUHbuk
 uwzbq045LSUP0eJSukxcFrYmUa91W4UYZPaqGeEjFVdwLpM1sQvLMQ2rWHTYhDzpCjztsj1Y4/N
 LGUnV+pdSvh1OEPrkvX2FZ6I3AypZpq2V4798wcbag0MAcbc+1MQ75jB6mcCN1Xq6TQfu38n55z
 dzZwggCX125e0z4Ghb5nFonme3ZYddpP4NLgReQ2ncOJA+n7zNuR740IokrMIhLfe/ekmYa6NcV
 E1Xhxnf49VA3RqVSPZHup4mRfVY7kGs603FSzX1lMszw5L1Ifc40SIhvnoHA6x7Ii9wLIliUOp8
 1IOpm/0zlOE6W0wQP8iRPZ1FQd91kOGh7qAohE+dmx/vWPbeiV3/fN/Fmsk0BLgAGypYAF0PQ+9
 92onlCOQEm0+ynyUvFA/yYEgrfUemV3Uliu9rlw6a15Fa0I3upMOorPFl9+KM=
X-Received: by 2002:a05:6000:2910:b0:437:8111:e2d0 with SMTP id
 ffacd0b85a97d-4396f1562efmr1811172f8f.8.1771616414667; 
 Fri, 20 Feb 2026 11:40:14 -0800 (PST)
Received: from [10.247.12.125] ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d40004sm177552f8f.21.2026.02.20.11.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Feb 2026 11:40:14 -0800 (PST)
Message-ID: <4a4afe2c-a592-432c-a46c-3446878501c9@gmail.com>
Date: Fri, 20 Feb 2026 19:40:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] drm/syncobj: Add flag
 DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20260220022631.2205037-1-yiconghui@gmail.com>
 <20260220022631.2205037-2-yiconghui@gmail.com>
 <d27ae98b-b401-4110-b233-a8da2dd3de05@amd.com>
 <9b952d44-6fc6-4594-9e16-78d529290c9d@gmail.com>
 <c61bde06-51fe-4909-b9e6-5edb619ad031@amd.com>
Content-Language: en-US
From: Yicong Hui <yiconghui@gmail.com>
In-Reply-To: <c61bde06-51fe-4909-b9e6-5edb619ad031@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B85FD16A63D
X-Rspamd-Action: no action

On 2/20/26 5:07 PM, Christian König wrote:
> On 2/20/26 18:05, Yicong Hui wrote:
>>>> +
>>>>    /**
>>>>     * dma_fence_chain_find_seqno - find fence chain node by seqno
>>>>     * @pfence: pointer to the chain node where to start
>>>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>>>> index 2d4ab745fdad..322f64b72775 100644
>>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>>> @@ -1654,14 +1654,17 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>>    {
>>>>        struct drm_syncobj_timeline_array *args = data;
>>>>        struct drm_syncobj **syncobjs;
>>>> +    unsigned int valid_flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED |
>>>> +                   DRM_SYNCOBJ_QUERY_FLAGS_ERROR;
>>>>        uint64_t __user *points = u64_to_user_ptr(args->points);
>>>> +    uint64_t __user *handles = u64_to_user_ptr(args->handles);
>>>>        uint32_t i;
>>>>        int ret;
>>>>          if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>>>>            return -EOPNOTSUPP;
>>>>    -    if (args->flags & ~DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
>>>> +    if (args->flags & ~valid_flags)
>>>>            return -EINVAL;
>>>>          if (args->count_handles == 0)
>>>> @@ -1680,6 +1683,22 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>>            uint64_t point;
>>>
>>> Make a local variable "int error" here.
>>>
>>> ...
>>>
>>>> +            int64_t error = 0;
>>>
>>> The error code is an int and only 32bits.
>> Understood, will change that!
>>
>>>
>>>> +
>>>> +            if (fence)
>>>> +                error = dma_fence_chain_find_error(fence);
>>>> +
>>>> +            ret = copy_to_user(&handles[i], &error, sizeof(int64_t));
>>>
>>> The handles are also only 32bits!
>> Ah, that's my mistake. Was thrown off by the __u64 in the struct definition but it is obvious now that it is a u32. Fixed as well!
>>
>>>
>>>> +            ret = ret ? -EFAULT : 0;
>>>> +            if (ret) {
>>>> +                dma_fence_put(fence);
>>>> +                break;
>>>> +            }
>>>> +
>>>> +        }
>>>> +
>>>>            chain = to_dma_fence_chain(fence);
>>>>            if (chain) {
>>>
>>> In this code path whenever point is assigned something do a "error = dma_fence_get_status(fence);" and then eventually copy the error to userspace after copying the point.
>>>
>>
>> Hi! Were you thinking something that looks a little bit like this?
> 
> Yeah that looks like what I had in mind to.
> 
> Thanks,
> Christian.
> 

Hi! What should I do at this point? Send a v3, or..?

Thanks!
Yicong
