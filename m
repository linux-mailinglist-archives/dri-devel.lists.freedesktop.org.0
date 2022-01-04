Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C252484F43
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 09:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4936310E74D;
	Wed,  5 Jan 2022 08:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C4B10E12C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 01:31:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t26so72914882wrb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 17:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8RP2kK8mapgiU76wbNQ3ZzyNp6SxXEgsjV0c/YCw1uI=;
 b=BzsjoeWUpRtaow9lliq1z5o0NSx/KUJZhMrWzA7WV9G0k/wHDbGy7mJfgMHJ0dEreS
 owAD6keYzzRBaUxrc8JkT0DhY1llK+YHOpHADfYot1Rjjsi4WP+SXIFeoNdqcIIB4t0o
 UhIa2KDl4D1F6qhkzFVHr/Yge9UGZavDH7Ya9xrQeqGArYZyMfDF+uxevZk4l0Ou9xhb
 v9oobErj6QIRTJJ6jt2gCEvUjccfle3ocxD/hQ709un/aHn62iL5vZfAsEvWOnfgTXfu
 M/bROZCwh8uFNHzASafE+Vqw4A6XEI/K0mAKt95mkws2seCVlxMUrTMqAMWfZT/5mJCJ
 nNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8RP2kK8mapgiU76wbNQ3ZzyNp6SxXEgsjV0c/YCw1uI=;
 b=6/oIGKYOylRn0wZnl99J9EWPNpas05VO4HnORsWfmoAgmrjXbZ7R31CObhS6WuhH62
 bILRU99G9TDSNRqo+Mm2fZZ+bNWGD3BrPnNyKIbz4Bi4tGKq1Uxqm/hw8j1UjBsK0X3+
 aBwVdeFlFk9QtLj7Fp7SWmo/D7fv7L3HoUYth1EzQEPIPjBaTdP9o8K+9O4W9ddscQ/b
 iFkDWO3GZi64u0mTyAItapewm4f5N6IGlNW+b3eEkhllU3Wr5/+0OZRSXnvz26z9yx6B
 PnFFHOdCtoCDstuE9cXXle/kYfFTPIZHhyavoRa7Ipx9koxhbOjJs7Ov+C+IHLD7RKeq
 h2pw==
X-Gm-Message-State: AOAM530NtR1UKl+ERrFiqoJS6JX2QBai05Ui07woYm4v/riGOnNY0LrE
 Vh8YIBX6dFeVHml3ElvJObc=
X-Google-Smtp-Source: ABdhPJxTdhXdLdajpyQarHz4T17XD/qWUXBHu90i572ts9V4z3pQq0i4Iw6rDc4/I+4sQ/D9J7oNnw==
X-Received: by 2002:a5d:5310:: with SMTP id e16mr39755747wrv.91.1641259897334; 
 Mon, 03 Jan 2022 17:31:37 -0800 (PST)
Received: from [192.168.254.53] ([103.105.48.220])
 by smtp.gmail.com with ESMTPSA id u14sm35694797wrf.39.2022.01.03.17.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 17:31:36 -0800 (PST)
Message-ID: <59c748b5-245a-c2d0-0b9f-d412687c72ab@gmail.com>
Date: Tue, 4 Jan 2022 09:31:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH RESEND] dma-buf: heaps: Fix mutex lock area and generalize
 struct dma_heap_attachment
Content-Language: en-US
To: John Stultz <john.stultz@linaro.org>
References: <20211229070713.218548-1-o451686892@gmail.com>
 <CALAqxLXtUcign2gETHg=z24qYOFSALRjWNnJqqY6rk=gsfVwaw@mail.gmail.com>
From: Weizhao Ouyang <o451686892@gmail.com>
In-Reply-To: <CALAqxLXtUcign2gETHg=z24qYOFSALRjWNnJqqY6rk=gsfVwaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 05 Jan 2022 08:24:54 +0000
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>, linaro-mm-sig@lists.linaro.org,
 Laura Abbott <labbott@kernel.org>, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for reply.

On 2022/1/4 02:45, John Stultz wrote:
> On Tue, Dec 28, 2021 at 11:09 PM Weizhao Ouyang <o451686892@gmail.com> wrote:
>> Fix cma_heap_buffer mutex lock area to protect vmap_cnt and vaddr. And
>> move struct dma_heap_attachment to dma-heap.h so that vendor dma heaps
>> can use it, the same behaviour as struct dma_buf_attachment.
>>
> Hey!
>   Thanks for submitting this patch! Apologies for the slow reply (was
> out for the holidays).
>
> This patch is combining two changes in one patch, so they need to be
> split up. The locking change looks sane, but moving the
> dma_heap_attachment may need some extra justification as changing
> upstream code just to support out of tree code isn't usually done (if
> there was some benefit to the in-tree code, that would be fine
> though).
>
> I'd also be eager to try to get the vendor heap to be merged, assuming
> we can also merge an upstream user for it.
Yeap moving the dma_heap_attachment need more sufficient reason, and
it should add a private area to adapt vendor heap change if we move it
to in-tree code. So just drop the idea now :)

I will send a new patch to clarify the locking change later.

Thanks,
Weizhao

