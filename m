Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CCCC24DF9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 12:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673D410EB24;
	Fri, 31 Oct 2025 11:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="mKzbE1J+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4B710EB21
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 11:54:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-474975af41dso15675975e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 04:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761911654; x=1762516454;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HKkSRdqTp5S5/1BXHl6+ZFCr2dE8STUesgwS1+S7n98=;
 b=mKzbE1J+8nHScOm32FKyemDLx0U//snbxWCobWOpYbqIZfidUJSVmrNB2zONq+SU63
 q2o6meqmmNytbcVXqRifbOtWktjGihrAza4MMRsBv4iqE5KtgdGgXf5J6AVqa8LM8fFa
 o2QXeSD4kgFQRrfnIz/rSTpLzIHeoYN6+EO7ZEY6sy7Uj0RPv37LESdqcjSZZ8QykwtU
 UQhSRX+IMOiNmD4NGHCqv5CpoXLkwiVNXBSSyuPgco+y4IaHvWGCBayK1SEJKO6sgkeK
 J/Y1XJfGjyjHXjIUCcv/HJD+Er9fJiAjDgyLT9OWt0j1YbvUQjmwFxEff88XelSZ5q2I
 L1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761911654; x=1762516454;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HKkSRdqTp5S5/1BXHl6+ZFCr2dE8STUesgwS1+S7n98=;
 b=MjOCkUsSmWOVQv7vRijsiRuiVoHLT8D3rMM4Ar/mAiCvXJuEpb0eRtjvusppI3U2SN
 GcT06wa6Ih9HtTTxFqD+Z8zL0KxkBYzevVrrjBWU4ZzpQz1I7t8KOPCTw5dFLzIl69V1
 LoHr0ko86F6m8AqQKwT0d1DaNdPNNqmPf9FCh97FTkQAdRVpCa7pVtHO+5ZCVm0IC/pk
 y0D/24TFqAYQFjTuTVGYRpqAFtO+Mprp7FJIowgpgJ4Hgf8zE5X6vzISu88Qi3bqxQUk
 gBYFhYOfiFZ1QYUxFN054FuvMcFTTogKueZopSbvOPOX+Z+DYu5cxqGkmkC9qjFGGFll
 7xRw==
X-Gm-Message-State: AOJu0YxADQadNYi8VFKsRp4/thRe8zcnrtC2ETewP02hUUK9+KpMaB6P
 MuKWU9OCgYXDOCmFGzRdeCVNu/1ezCdMwcs9CPsDu/NFYTZvFS0ypxfU++Jqj1BpssM=
X-Gm-Gg: ASbGncs3lJptRZGcbTCuJyEey9D8Vl3HKan7ujNfDUSEid8YGnigwqtuQabXtJBXD0M
 GhX+naa3pIYPQBl97fasm2lck0uSchOStPpBavRS4NHqG1VsLkz1bXbMdaQjVo09dF6zRvdLjyd
 iKd/pMcFfaheDRvDvDInDr/AbgFiL+QOvUI9MT37sYDGTH3EQcLp7UOic5adiFXT5nVKqp82Mju
 w5Ot4FT0HVfkMJaioKUsZ9TQaOiyWa50UuPOSbrNblOfYyqAbgyv8vSbqCOJ0QZ+FSS2+bRB+tg
 JBOIpVL/dVLEsBpugXidaKopNEY6luMT/+NCc7OuPooUGuPiAkndJMcask5HocnmuHvqPEERG0o
 MTMOePoDaE84kVE+fDX4F8Qk4Czmf+mz9AmCXw+/dUvAoZ8SVxSDCC4grUjhs5FlZWVgYbW24sE
 uRh8ljy5kD3GfC+J85
X-Google-Smtp-Source: AGHT+IG+/5H9fvCUDctmf9ZUkC50CpibVvBasWK4qcR+v0QwdTFLnZ7cuh2ly+U+Hz3QL1huTHBIZQ==
X-Received: by 2002:a05:6000:4387:b0:429:8cb0:cf9d with SMTP id
 ffacd0b85a97d-429bd6ac113mr2661701f8f.48.1761911653809; 
 Fri, 31 Oct 2025 04:54:13 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728a96897sm91130385e9.11.2025.10.31.04.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 04:54:13 -0700 (PDT)
Message-ID: <6e35b319-211c-45fc-9ff8-090618273a6b@ursulin.net>
Date: Fri, 31 Oct 2025 11:54:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gem: Fix NULL pointer dereference in
 eb_release_vmas()
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 =?UTF-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
References: <20251031105259.72927-2-krzysztof.niemiec@intel.com>
 <z4o2gk3i6zeocib4geu3swv2elxdmrgmvqvbgxmu5l2uhsb35r@nqnlnndzozvi>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <z4o2gk3i6zeocib4geu3swv2elxdmrgmvqvbgxmu5l2uhsb35r@nqnlnndzozvi>
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


On 31/10/2025 11:42, Krzysztof Karas wrote:
> Hi Krzysztof,
> 
>> Set eb->vma[i+1].vma to NULL to prevent eb_release_vmas() from
>> processing unitialized data, leading to a potential NULL dereference.
>>
>> During the execution of eb_lookup_vmas(), the eb->vma array is
>> successively filled up with struct eb_vma objects. This process includes
>> calling eb_add_vma(), which might fail; however, even in the event of
>> failure, eb->vma[i].vma is set for the currently processes buffer.
> processes -> processed
> 
>>
>> If eb_add_vma() fails, eb_lookup_vmas() returns with an error, which
>> prompts a call to eb_release_vmas() to clean up the mess. Since
>> eb_lookup_vmas() might fail during processing any (possibly not first)
>> buffer, eb_release_vmas() checks whether a buffer's vma is NULL to know
>> which one has failed first. The NULL is set if the vma cannot be set or
>> is invalid in some way, but during and after the eb_add_vma() call, it
>> is set to a valid pointer for the currently processed eb_vma.
>>
>> This means that during the check in eb_release_vmas(), the buffer that
>> failed eb_add_vma() (say, eb->vma[i]) is processed (and rightfully so,
>> since the vma associated with it still needs cleanup), but eb->vma[i+1]
>> is left completely uninitialized (since the loop was broken prematurely
>> after failing on eb_add_vma() for eb->vma[i]). Therefore
>> eb->vma[i+1].vma has junk in it, and if that junk is not NULL, that vma
>> will be processed by eb_release_vmas(), leading to memory corruption.
>>
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062
>>
>> Reported-by: 김강민 <km.kim1503@gmail.com>
>> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
>> ---
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 39c7c32e1e74..0f8f02e22c03 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -960,18 +960,27 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>>   		}
>>   
>>   		err = eb_add_vma(eb, &current_batch, i, vma);
>> -		if (err)
>> +		if (err) {
>> +			if (i + 1 < eb->buffer_count) {
>> +				/*
>> +				 * Execbuffer code expects last vma entry to be NULL,
>> +				 * since we already initialized this entry,
>> +				 * set the next value to NULL or we mess up
>> +				 * cleanup handling.
>> +				 */
>> +				eb->vma[i + 1].vma = NULL;
>> +			}
>> +
>>   			return err;
>> +		}
>>   
>>   		if (i915_gem_object_is_userptr(vma->obj)) {
>>   			err = i915_gem_object_userptr_submit_init(vma->obj);
>>   			if (err) {
>>   				if (i + 1 < eb->buffer_count) {
>>   					/*
>> -					 * Execbuffer code expects last vma entry to be NULL,
>> -					 * since we already initialized this entry,
>> -					 * set the next value to NULL or we mess up
>> -					 * cleanup handling.
>> +					 * Set the next vma to null, for the same
> null -> NULL to be more explicit and to match the previous
> comment.
> 
>> +					 * reason as above.
>>   					 */
>>   					eb->vma[i + 1].vma = NULL;
>>   				}
> 
> After above are addressed (maybe during merge, to avoid
> re-sending?):
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Could you please also figure out the right Fixes: / stable?

I initially suspected either 544460c33821 or ed29c2691188 could be 
related. In any case bug looks serious enough to warrant backporting for 
stable.

Regards,

Tvrtko

