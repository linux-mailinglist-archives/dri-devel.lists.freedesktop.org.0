Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB3330EDC2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 08:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C306ECEA;
	Thu,  4 Feb 2021 07:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B226ECEA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 07:53:19 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id y9so3635139ejp.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 23:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=J5U7ZYjn0rPv+kixT24fufumtWsmbJ865vX1gjaUF0g=;
 b=KswjM1SUYJoTfbNOQjudNoUn3epf+FgmwInfQV6P8D1wCRR3k/JPEqKz0WMeFwWl2u
 EtYRsJ0ITHV+Rn4hVd6MrPfmX+j6SEGOH7q1mPrs7m2PkRZzag7JCDeWJNhtFqzZSjxX
 bt3bMmVwLRMbqoNMBP69aDKbprQaMM07TtRNJGxLfEdSbFQgAhulGu5zstTSnL/PouTV
 z5JaLL6FOgYf14roRI0afyz3a4I8Hv4YWhX/oYfesI/sm22W0jTpjrsXSWYC1Rf+KH60
 /ApBI5MIIDz2fpAwj034PDrnzqqtBL1JXloPTCkxb7LFOusGN5A7z2ao80vvQNtjE5lO
 5Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=J5U7ZYjn0rPv+kixT24fufumtWsmbJ865vX1gjaUF0g=;
 b=L9Lldr3MOwsSab/yvEDFo+bl6MZ/GjG7IwP5oZ58BmLlqVULGB8QmS8kbRdcQvzTdS
 HbsfsSFmprX4cksIVDzXpRNJ6jSvlxZKpyvR3TxISQzertEntRVW7/g3EllnTa3PAuSA
 LtNXgvql9cVCpSXYiRICBTjIEYiuRRSuPE42XvML7osY44gsIf3d/fsBPUVzGxsclUjm
 ocjOe/Ym67WVUwXmlFfIsJhUt+41t2v9H3nxl/jgK+GZYfLF/ByBRbIgl4Sms1IEKQ8c
 hMmEqr7LmfeuBu6QJyWFoAiGf9pa9/PcRgQgTxvizyxcsoiePkXCJKCtA8ZDp1YRDZgQ
 tTCw==
X-Gm-Message-State: AOAM531yjA+rs11Mg9jf4jF1CKBKw2R1Sa1aTbxH2+xID27nYKmsaR7k
 zBtCPHp5lzmWbsybt39mouY=
X-Google-Smtp-Source: ABdhPJxmOioRMuyDm1Puy9HUCj+qibrAoLklBS9/vQschT6m+hlxaFoBzExrk2acsmkXA8jSOENf/g==
X-Received: by 2002:a17:907:9810:: with SMTP id
 ji16mr6686661ejc.394.1612425198446; 
 Wed, 03 Feb 2021 23:53:18 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p16sm2010968edw.44.2021.02.03.23.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 23:53:17 -0800 (PST)
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] mm: replace BUG_ON in vm_insert_page
 with a return of an error
To: Suren Baghdasaryan <surenb@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203015553.GX308988@casper.infradead.org>
 <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
 <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <96fb8d14-fd9d-c21d-fa9d-81748421c6d3@gmail.com>
Date: Thu, 4 Feb 2021 08:53:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
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
Reply-To: christian.koenig@amd.com
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Sandeep Patil <sspatil@google.com>,
 Liam Mark <lmark@codeaurora.org>, Minchan Kim <minchan@kernel.org>,
 Android Kernel Team <kernel-team@android.com>,
 James Jones <jajones@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>, Linux MM <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.02.21 um 21:20 schrieb Suren Baghdasaryan:
> [SNIP]
> If there is a reason to set this flag other than historical use of
> carveout memory then we wanted to catch such cases and fix the drivers
> that moved to using dmabuf heaps. However maybe there are other
> reasons and if so I would be very grateful if someone could explain
> them. That would help me to come up with a better solution.

Well one major reason for this is to prevent accounting of DMA-buf pages.

So you are going in circles here and trying to circumvent an intentional 
behavior.

Daniel is right that this is the completely wrong approach and we need 
to take a step back and think about it on a higher level.

Going to replay to his mail as well.

Regards,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
