Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AB1C80352
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163E310E220;
	Mon, 24 Nov 2025 11:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LbNxNmIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C6010E21E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:30:09 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso32166435e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 03:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763983807; x=1764588607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FIrNcMo3OIORc59oYq11M7V6LWyQ4cuR88/fqcwGDYI=;
 b=LbNxNmISzrlaydsD9uyHGyJQC3MLC0NqM0hOAdFqi/BI1S0PkHvksOIh4dsbh8VPae
 QWOzIpcas1oLGfnzZGEO07ZC6Hntz8pKyCcXjEFSJmrOG/6llarkekEAn+ax76y2YiHd
 po4AyHjxqTNBHuH30jzi/6qbCOuxCtd2G3jlcGKp6SFtie9llisS5CeX9uSxAg9nT1ZC
 HcIAOfTWRrWax9W613CMKYZHxCHh8d/j2y35jhh2ewuz8EViX00uxMlHkngaNpcrNxWH
 OTIgu0kV/EG7+1tp9NfvqBAzsLuxdd96KX69g0GOtNCtlL/PgnDCbG7+j0VQ7oGKOkSg
 c5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763983807; x=1764588607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FIrNcMo3OIORc59oYq11M7V6LWyQ4cuR88/fqcwGDYI=;
 b=N9pZgeg5zbxAL0suwtcNhpOkO0PGbQQdkacpYXMAjsdVJG75CsuwUQu8XKd88xFlTW
 3StssDMWFmeqifZDcqpdKzB5mihXeE6iK090J0azwu4DXtQxtQeXGnb7XJTs/INBOAD9
 w0QVbaHwHMa5GAhEto0j5eb1FhGXtxuTEvid5/U4pqUSVxWLTFU+9NXxZOif04b4nvJg
 f7YtsbXg4rjegTgRaHPx3jdpQt+IIyWtwHwPLaFTmfHyxXQN1U9LSBuRAxMW/wTHwOA6
 EFqnLXdJcmLt+ld+stu7MgAh0ywe9TcQcbgBIEpXybbcbTXylvBe7bnArxHVwLS3DQ8j
 Ewdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUgKxnhE0TN/BWR8xvh0+Vh15ALccH0Nxa6qudT2kzY4knq9IxDdvpUFY5bgyTeZ+8iJ8KeJuyh+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6QK3HZFOeACsxzKs6KqAiSlj002rAeVWyGR0gfcA1hIW+1hDU
 vZcVSq1nx2YcUTRRhKqeUSh+G2ct7QeKoYf9vadE6qLYkq68Y4HdoMAs
X-Gm-Gg: ASbGnctJF62owh1Xd4uwF6lu8lB3PdrIOWw5AKihjFhyDMdAgfIfO+utn84ATPzUtGr
 EVaRMa/dpwubwm9ab37VelsGJ027/9GLJAEZfE0q+oLT79M3vss5SSDSCvB90GkgHICMGmVZHx4
 zV7S0qf1mEkC0guqnVUslPegAkd05IpdwgvhlZsCpQ71Hqv6CfBiOJ4Leh1ulvtwA5nmIQ7OKbc
 ywytH988MU6d3MZJY7knyB/31bqCrDJefRC/GAyxuWmbZkV8/pcK1sbClFVV5403Cluobb2PEYa
 lJ7q/PJwGxdlrVtFbBV42NkqWqsHngAiH7qhjheKccDRPNyvVz/+MjumL9H6kYZaP7lEyI6WXgX
 /VyllvI66tPpDM7gzBMFouxMnUlpQ9h7ljpXr3zx801KXC4uCRCxUrRB5sRIUprFhpYfyA7NRL6
 O3iBK0g/jfYOC2EU5thwgv2fZzdn1/tHoUt/wtwydFN6u65RXn0oZV2hla311gEkSIjQfszQSV
X-Google-Smtp-Source: AGHT+IH4rhfkRALzBtaC9gdxzf7gjncNKNUbJLJsQNk7iBQd1pjAZr0TQJP790c1nQt2gF0ktavqUA==
X-Received: by 2002:a05:600c:1d14:b0:477:9d88:2da6 with SMTP id
 5b1f17b1804b1-477c026ed62mr113061345e9.0.1763983807185; 
 Mon, 24 Nov 2025 03:30:07 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c?
 ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e432sm27351895f8f.9.2025.11.24.03.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 03:30:06 -0800 (PST)
Message-ID: <905ff009-0e02-4a5b-aa8d-236bfc1a404e@gmail.com>
Date: Mon, 24 Nov 2025 11:30:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 00/11] Add dmabuf read/write via io_uring
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org
Cc: Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <fd10fe48-f278-4ed0-b96b-c4f5a91b7f95@amd.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <fd10fe48-f278-4ed0-b96b-c4f5a91b7f95@amd.com>
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

On 11/24/25 10:33, Christian König wrote:
> On 11/23/25 23:51, Pavel Begunkov wrote:
>> Picking up the work on supporting dmabuf in the read/write path.
> 
> IIRC that work was completely stopped because it violated core dma_fence and DMA-buf rules and after some private discussion was considered not doable in general.
> 
> Or am I mixing something up here?

The time gap is purely due to me being busy. I wasn't CC'ed to those private
discussions you mentioned, but the v1 feedback was to use dynamic attachments
and avoid passing dma address arrays directly.

https://lore.kernel.org/all/cover.1751035820.git.asml.silence@gmail.com/

I'm lost on what part is not doable. Can you elaborate on the core
dma-fence dma-buf rules?

> Since I don't see any dma_fence implementation at all that might actually be the case.

See Patch 5, struct blk_mq_dma_fence. It's used in the move_notify
callback and is signaled when all inflight IO using the current
mapping are complete. All new IO requests will try to recreate the
mapping, and hence potentially wait with dma_resv_wait_timeout().

> On the other hand we have direct I/O from DMA-buf working for quite a while, just not upstream and without io_uring support.

Have any reference?

-- 
Pavel Begunkov

