Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A09A21B59
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 11:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5E110E028;
	Wed, 29 Jan 2025 10:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lmTmzJkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690BD10E028
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 10:56:42 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so3478544f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 02:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148201; x=1738753001; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FosXnzccXLV0I1LGd8gcU7Ut4sPZEcpMdWT78sKoJ3I=;
 b=lmTmzJkJqEMNTWQQQrc1c+UHJEP6h4Ds3eRS05UUG+WaDHPc+PteW4qW1xXPjAJluE
 e1/5XXXAk0qbpkp0MADD/GV5Z/pS3pwUCFVFJjmdTmtHbdspB6M25Zn9S74vQ3dAQqRv
 /n1eTS+1CV25xCiM+uiwXBGjFv2mUV/Z77FD/MsevaYGazrPz8H4weD3J2J0dRyXBjJZ
 qr5ZLoSUFrvcUTUU8XbLGfsMJnIfmhnyDTfxGyfx2NVhMtq+Hg+i0WI1/hgpdyMM5WHV
 Gql9vhLFD49xIGjTZa4KoA/yaxXG+VI66oqMX36ENPzlWPj5vEh3Z6nLFXYBb1g6dRb0
 WF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148201; x=1738753001;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FosXnzccXLV0I1LGd8gcU7Ut4sPZEcpMdWT78sKoJ3I=;
 b=u+PY3RvvfTxYN66PdRZ/EL91RV/A6ftUMMjDaiHk4Gsv13CXYZVyOwqE7hnDLsqQPn
 VHuhp0zErZUM7x5KEc1BLSJiEoN3OIxjuOIe5RXsswaZ4oaiICNq7JaNgW7qOdDVKAxJ
 nkZqvfqFboUGbexgWkCMTmTHzDH0GmHf/WVfXmczWmFP3J49CjZrj/NJ83x1inhK/mUC
 Kg+usm14mtFCy3jpA4pffY6MJwAJym+C6WoeWN8pBU8827Op2iqgsx6MpMTFoqgtueDB
 oS03eoOMSfsEn7pCWcRmOqK5cLdw5qO93dfKFqDrh2aNG4bG4zWnpcpk4OiXF2hsfGOF
 Ej5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyWQp5gOmFmYtJAarUv2lw/zTYSESWv48AAORlubdpHhpo97kGRW6EyBugscsds1zF/zBH+Wfqih8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyDw8PdD/65oJSKVGM7+pANiRBIBtS9oFD58mAUv3+T0v7tMmn
 fT8/aV7rjtN+CRxoJ3CYNO14JZLjuNy5O11GflZflSgmry7LTTlO3SnDPwzQ
X-Gm-Gg: ASbGncv17mQZl7wpmGYbe5LrNs5KRkYeE9ZnN07dC9F3S9mh3jDYzU0Wk0U8oafRCBj
 Nlt/Ry2+au7/3lUgciu+d+Rh8zu1gzd2Iv+WSkQiLPE70TpATe0gxtT3OrGcxbb6BzHtjQnD9Qm
 wPT8cAZC58Y1P/mhCkSv4xAQkEMuNbZWqrdtVp+CENPxuH6m6dhMIoYLM/FBw8MIVkDZWVH50wC
 gyaXmhTIjS98T16nX52dHfDUINwbg5Wwrj0wLo7uZaAblX+NGt9eS0Y9PxXJgKa72HxOUVk+yo6
 sulTZlcKoDfsAa6Qk9FNQtTRwP52Fk6b7Rfcmwe/F37f
X-Google-Smtp-Source: AGHT+IH6skENIXQ60OxDQBSAhPlvZIj8ntXrMXYQO57C4HwGjLw4O7NNaHOpEBbMLZg8FziO87RS4A==
X-Received: by 2002:a05:6000:1884:b0:385:e8dd:b143 with SMTP id
 ffacd0b85a97d-38c5195f6bemr2182113f8f.19.1738148200405; 
 Wed, 29 Jan 2025 02:56:40 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188bf5sm16982880f8f.50.2025.01.29.02.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 02:56:40 -0800 (PST)
Message-ID: <25c09c95-869e-488a-a031-f4faa8aa6307@gmail.com>
Date: Wed, 29 Jan 2025 11:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix timeout handling in dma_resv_wait_timeout
To: Lucas Stach <l.stach@pengutronix.de>, marek.olsak@amd.com,
 sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250128100833.8973-1-christian.koenig@amd.com>
 <6681c5a71cadaee237dc4bf47e12ffd0bfdd89b0.camel@pengutronix.de>
 <af78559c-057a-4d70-ab05-fcc943dce2e6@gmail.com>
 <e21418ab4f1e82d322569ef2d4a481c564a1040c.camel@pengutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <e21418ab4f1e82d322569ef2d4a481c564a1040c.camel@pengutronix.de>
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

Am 28.01.25 um 15:41 schrieb Lucas Stach:
> Am Dienstag, dem 28.01.2025 um 15:28 +0100 schrieb Christian König:
>> Am 28.01.25 um 11:48 schrieb Lucas Stach:
>>> Hi Christian,
>>>
>>> Am Dienstag, dem 28.01.2025 um 11:08 +0100 schrieb Christian König:
>>>> Even the kerneldoc says that with a zero timeout the function should not
>>>> wait for anything, but still return 1 to indicate that the fences are
>>>> signaled now.
>>>>
>>>> Unfortunately that isn't what was implemented, instead of only returning
>>>> 1 we also waited for at least one jiffies.
>>>>
>>>> Fix that by adjusting the handling to what the function is actually
>>>> documented to do.
>>>>
>>>> Reported-by: Marek Olšák <marek.olsak@amd.com>
>>>> Reported-by: Lucas Stach <l.stach@pengutronix.de>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Cc: <stable@vger.kernel.org>
>>>> ---
>>>>    drivers/dma-buf/dma-resv.c | 11 ++++++-----
>>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>>> index 5f8d010516f0..ae92d9d2394d 100644
>>>> --- a/drivers/dma-buf/dma-resv.c
>>>> +++ b/drivers/dma-buf/dma-resv.c
>>>> @@ -684,11 +684,12 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
>>>>    	dma_resv_iter_begin(&cursor, obj, usage);
>>>>    	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>>    
>>>> -		ret = dma_fence_wait_timeout(fence, intr, ret);
>>>> -		if (ret <= 0) {
>>>> -			dma_resv_iter_end(&cursor);
>>>> -			return ret;
>>>> -		}
>>>> +		ret = dma_fence_wait_timeout(fence, intr, timeout);
>>>> +		if (ret <= 0)
>>>> +			break;
>>>> +
>>>> +		/* Even for zero timeout the return value is 1 */
>>>> +		timeout = min(timeout, ret);
>>> This min construct and the comment confused me a bit at first. I think
>>> it would be easier to read as
>>>
>>> /* With a zero timeout dma_fence_wait_timeout makes up a
>>>    * positive return value for already signaled fences.
>>>    */
>>> if (timeout)
>>> 	timeout = ret;
>> Good point, going to change that.
>>
>>> Also please change the initialization of ret on top of the function to
>>> ret = 1 so it has the right value when no fences are present. Now that
>>> you use the timeout variable for the fence wait, there is no point in
>>> initializing ret to the timeout.
>> When no fences are present returning 1 would be incorrect if the timeout
>> value was non zero.
>>
>> Only when the timeout value is zero we should return 1 to indicate that
>> there is nothing to wait for.
>>
> Uh, yea didn't think about this.
>
> Honestly, making up this positive return value requires one to think
> really hard about those code paths. This would all be much cleaner and
> the chaining of multiple waits, like in the function changed here,
> would be much more natural when a 0 return would also be treated as a
> ordinary successful wait and timeouts would be signaled with ETIMEDOUT.
> But that's a large change with lots of callsites to audit, maybe for
> another day.

Yeah, I've suggested that before as well.

But the wait_event_timeout* interfaces follows the same convention: 
https://elixir.bootlin.com/linux/v6.12.11/source/include/linux/wait.h#L393

So we used with that for some reason. My educated guess is that it made 
migration easier because drivers were using wait_event_timeout* before 
dma_resv/dma_fence was invented.

Regards,
Christian.

>
> Regards,
> Lucas

