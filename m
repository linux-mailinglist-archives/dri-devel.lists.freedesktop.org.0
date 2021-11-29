Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12A946152C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C186FA3C;
	Mon, 29 Nov 2021 12:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D6F6FA3C;
 Mon, 29 Nov 2021 12:33:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so12312419wmb.0; 
 Mon, 29 Nov 2021 04:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=kaVxrwVEtTbeJnjXaUCkv6CWik1QhuxvLenwaFBoirs=;
 b=MzOePiOjeO+9rFJW/L3ufzaJ7aKVgdNabJCBa6WE8ZEnnwH6f8+5Z78eXo0rpwV4Ad
 GEvf2aPlvvv41C3hoczdLVz1AQSV1BOfwF037XOeV3b6NIlU+FBGCDlLjbuvPwVrWxnq
 eJLVi7gEgz5LAAv8HzFFEowHs2Trev1dgRD6JNNHt32Rm40lyrlvMuKyNFIZYZXjwzoe
 lL7NVJ2Kl03vdei7y9db0iQQFFo0C0YkyWkaBllxyq020DI214nux4gb5Tev3CBscfRL
 flNvUi4wz6lD4uyJtbv2TE54ncvrztXiYz+AxlcKBP84Gc6OwolXBw5das0l4Yh911u0
 xCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kaVxrwVEtTbeJnjXaUCkv6CWik1QhuxvLenwaFBoirs=;
 b=7ZzcLrVlso3yKHtBIOl172gPo6qwDnot/aWJkK6EAcsrcT166aOiBpPbtjO+EBw0zz
 7CBGyB/llrVuCRNdQ6fev5JiYSk37WK/2MXR9JZLu5PPNgCzhDVn+l7ZprSC+Btn4eXX
 O15coqVnlcLemKFqnNfqW2vl3TwXRdFCxHYwux95AX3p8UmzYNv5PkSq0v0QOzfx8oia
 JnYbq8+A5tLeeoISD4QgC1F5//++Ro7H79joDXZRWq5EQ30FkSnnZmWWP3kPD2BFJpBG
 pNvU0Z5rIJ3loz+9D8G0/fROFH3hrgJMDH6obA+5Aq92bExN8XX8ZitDUtCCd6Jqu0qJ
 tYxw==
X-Gm-Message-State: AOAM531ozbLa/Y7GVaLO/W5OnTe1jX9B1w97CmLVQCKixp5BfOfXCm1B
 77o8TkZFLPDAW6s+Qb+MmQVIb/7TahU=
X-Google-Smtp-Source: ABdhPJzwL5Z1wVujNmmTgEoXqYcxg5hOojSUWfwHYUFW9PF1AvtSDxZzvw3c/34O/ChA2rjQvZQaiQ==
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr9595438wmh.115.1638189232627; 
 Mon, 29 Nov 2021 04:33:52 -0800 (PST)
Received: from [192.168.178.21] (p57b0b77b.dip0.t-ipconnect.de.
 [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id bg34sm19068692wmb.47.2021.11.29.04.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 04:33:52 -0800 (PST)
Subject: Re: [PATCH] dma_fence_array: Fix PENDING_ERROR leak in
 dma_fence_array_signaled()
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@intel.com>
References: <20211129073533.414008-1-thomas.hellstrom@linux.intel.com>
 <4fd0eee6-342f-fb31-717c-901440f38c35@gmail.com>
 <58ca11648ab29d96b84640760d2acc3ac2d39d19.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e4d8e272-8175-4298-f227-240febc0bda0@gmail.com>
Date: Mon, 29 Nov 2021 13:33:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <58ca11648ab29d96b84640760d2acc3ac2d39d19.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linaro-mm-sig@lists.linaro.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.11.21 um 13:23 schrieb Thomas Hellström:
> Hi, Christian,
>
> On Mon, 2021-11-29 at 09:21 +0100, Christian König wrote:
>> Am 29.11.21 um 08:35 schrieb Thomas Hellström:
>>> If a dma_fence_array is reported signaled by a call to
>>> dma_fence_is_signaled(), it may leak the PENDING_ERROR status.
>>>
>>> Fix this by clearing the PENDING_ERROR status if we return true in
>>> dma_fence_array_signaled().
>>>
>>> Fixes: 1f70b8b812f3 ("dma-fence: Propagate errors to dma-fence-
>>> array container")
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
>>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> How are the dma-buf / dma-fence patches typically merged? If i915 is
> the only fence->error user, could we take this through drm-intel to
> avoid a backmerge for upcoming i915 work?

Well that one here looks like a bugfix to me, so either through 
drm-misc-fixes ore some i915 -fixes branch sounds fine to me.

If you have any new development based on that a backmerge of the -fixes 
into your -next branch is unavoidable anyway.

Regards,
Christian.

>
> /Thomas
>
>
>>> ---
>>>    drivers/dma-buf/dma-fence-array.c | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-
>>> buf/dma-fence-array.c
>>> index d3fbd950be94..3e07f961e2f3 100644
>>> --- a/drivers/dma-buf/dma-fence-array.c
>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>> @@ -104,7 +104,11 @@ static bool dma_fence_array_signaled(struct
>>> dma_fence *fence)
>>>    {
>>>          struct dma_fence_array *array = to_dma_fence_array(fence);
>>>    
>>> -       return atomic_read(&array->num_pending) <= 0;
>>> +       if (atomic_read(&array->num_pending) > 0)
>>> +               return false;
>>> +
>>> +       dma_fence_array_clear_pending_error(array);
>>> +       return true;
>>>    }
>>>    
>>>    static void dma_fence_array_release(struct dma_fence *fence)
>

