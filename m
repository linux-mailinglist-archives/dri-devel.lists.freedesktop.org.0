Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACA242F18D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 14:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5606E6E30D;
	Fri, 15 Oct 2021 12:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BC06E30D;
 Fri, 15 Oct 2021 12:57:03 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e3so26130660wrc.11;
 Fri, 15 Oct 2021 05:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=K7gsPVJQCeXWBCpGF1GEldNyINPbSWQ/6+B1Ys661c0=;
 b=OQSqAFiO1RiBCo88BhlVSFgFriYtTV8A8ce2Y/2Qi4T2reSk69E8oMuIdy2aRraIoG
 ZeBtE3v4/0DXAQ6wMRifwwM1usHHRD9DcqG3nmq7ffyQpX5eCXZcj+8yHYzv7r9aSwok
 69VXp2VyL5TiT6VILFZfy7lZ63MtE8yQK8CdKI0ksf8CWgWLRk9I/s5jh+GMJFP0DYrm
 xxSb/xaJqB9rXDC3kObrNN9xZezArb34+l4DB51VJbMvlNBABGTIsA9wked1Yb6TjYaf
 yjpdntpvp1y2nPMPn/zX4mqIalekeT6rqeFL2NaBCCJySioU3l2OUClL/zAxPYtTU6Jz
 Hb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=K7gsPVJQCeXWBCpGF1GEldNyINPbSWQ/6+B1Ys661c0=;
 b=XxBIBGJ5/EbzHLtXy/cmdX76hu4fO/RoEXIBigzhf30V3eT/foRmhUvaPetx3WGnq2
 hrilt+DgYW6MYXmSipWEfwJi0QzyUTYwe+XDiGuluo0/qroEoN0rsfuSqJj6zxiAXHRl
 20SbLomhNjDvgzialqELiHZE7VPehn6iS8+i+8hAi4Jl1ou9spa229Hvj48QZddKqb5t
 00XV5oCeFD5RONdfI9lzY4gNEdlz/GRbgLppwml0wVRMmgH68AzR5gbWBo+OvrbcvYUb
 OUHhOb9WCUNIR2ySb/DIY/OvjjcgbyQWsXM29CiPdlVTEJLyLzvH1frhG5yzcwRI/NMw
 1u0w==
X-Gm-Message-State: AOAM530VWxmF+lAeJ3WQlTz32kmd9yJTc8OjKZFWWZghOUMz49p2ppRp
 OKCj1AeGoaAlsIExbtncscr8NxEvC9Q=
X-Google-Smtp-Source: ABdhPJwgXwn4QWqlTUa6s1tP3zFbUDUMWqnUk/1eYpk4nau0DzaixRIZbgKH9ZBimALoiJg5ZK+kWg==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr14312983wrr.76.1634302622203; 
 Fri, 15 Oct 2021 05:57:02 -0700 (PDT)
Received: from ?IPv6:2a02:8109:333f:edd8:ffec:a915:d03e:f264?
 ([2a02:8109:333f:edd8:ffec:a915:d03e:f264])
 by smtp.gmail.com with ESMTPSA id w5sm4767366wra.87.2021.10.15.05.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 05:57:01 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH 2/2] dma-buf: Fix dma_resv_test_signaled.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20211015115720.79958-1-maarten.lankhorst@linux.intel.com>
 <20211015115720.79958-3-maarten.lankhorst@linux.intel.com>
 <ebf0714c-2f49-a0ad-1861-16394ade468d@amd.com>
 <9b7e43bb-e175-0aff-2cc1-cc10236fe8e5@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <06fa85f5-3664-4da4-bde8-6d7d2f199251@gmail.com>
Date: Fri, 15 Oct 2021 14:56:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9b7e43bb-e175-0aff-2cc1-cc10236fe8e5@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 15.10.21 um 14:52 schrieb Maarten Lankhorst:
> Op 15-10-2021 om 14:07 schreef Christian König:
>> Am 15.10.21 um 13:57 schrieb Maarten Lankhorst:
>>> Commit 7fa828cb9265 ("dma-buf: use new iterator in dma_resv_test_signaled")
>>> accidentally forgot to test whether the dma-buf is actually signaled, breaking
>>> pretty much everything depending on it.
>> NAK, the dma_resv_for_each_fence_unlocked() returns only unsignaled fences. So the code is correct as it is.
> That seems like it might cause some unexpected behavior when that function is called with one of the fence locks held, if it calls dma_fence_signal().
>
> Could it be changed to only test the signaled bit, in which case this patch would still be useful?

That's exactly what I suggested as well, but Daniel was against that 
because of concerns around barriers.

> Or at least add some lockdep annotations, that fence->lock might be taken. So any hangs would at least be easy to spot with lockdep.

That should be trivial doable.

Christian.

>
> ~Maarten
>
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

