Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD226C84FA7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A4F10E3BF;
	Tue, 25 Nov 2025 12:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h8lTTqGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA0E10E3BF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:35:10 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-477a219db05so32310365e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 04:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764074109; x=1764678909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=siB9qFjab8fX+nGosH2txh4HIYoNVo3aqhU42WS03o0=;
 b=h8lTTqGZ3Z0pC+zTKSa3n9JQPVEZ+tm4mhQWUxtMt4DQO1bPyeDKce4DWgPOjRBOmM
 9PP27t9s694YJ84AJNx6UyoVNKiBzMHAeKcXsii8+SYGUb9nyJQktHN0Z6Mlo7tWEep1
 OYa2ehPDejwKssUvf8SPXFNRkFDJDOjurVJT05Q1b8kM3Nwdc1Dbk6o9KWyWy2QnomaG
 Y1fQe3Zyk2hGbYPpuzOGyAgDAHf+i8WmxFA4/ipDfE/F5k0ls5Y/IeyI0dfbCXhzCNMk
 MDMxCVuYR/8Y4EZIP4qtQt9uE28/L3r2BRZNKkuO8+Pm3vShXfsev1h1kmijkwIKEBBu
 OuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764074109; x=1764678909;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=siB9qFjab8fX+nGosH2txh4HIYoNVo3aqhU42WS03o0=;
 b=F8IGSMlZKqUpMXETpl8C3w/ST3MhCb20rMtJ19Gjq8MM7kr+xqFrJLXw1a7boNURu7
 1Rh8gZY7UKns81s8CoJhIc9hHgd18Kr32vQ931OrvJbH2kSyZ6JKkq+pAV27LUg/ViZq
 Ex84fbBq3QiTmHQBtOLRw/jiSfQWioStJ3PXhUIkKvdfSEpJ9IUgowmISKY+KLLpdIEu
 4LC6GkeDg646yfwT3nGvne58/0+9KVMwz6qZbke2k7IqtgTVaMFCa8eR1fPpE1NbPRE2
 eEo8q1UrQHxdXvWixK51QGxj8WXaaWlBTW6UL+XhGZdyKA6SA0XPEHatPJ6IMylqd0GB
 NvQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKOVQ69p7MBhwALgvbi43+UtIRztfYiPRdQHJiOs3EvR+HLJZiiMAACrV3acupT/rgano+sAOnVp8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKVQnnlKwmsnLibNEGZ+aS7jkqkeJ5yNMSIWL1VeWjuDR7yAFV
 1QMCU9zubvAucBAaWQcnYaST1pm9oWDlV60J9bCdJgOEWwM9D89JDyUx
X-Gm-Gg: ASbGncu4UrUC5JlH9FJc8Z/TEYAx4GZrFb20Uq6XE36AtWXgJKVsmCyqt6S0Ghq1+vg
 BgI6LdL9H4rnkyU2qJnIOmJlHY/ORnppNXHUGnwOFlz117OOq7dFuGObP/qGsLsCnDW2c6WEwLc
 0fPw2abiN9OYuIKxJgcXYkb9yNScV6T8NE4D1x9pCC2MeU+ltqKSbSXEy4F4ObcO37KZA9MpZVt
 EADky11d10EuaC9t5dbmu4B3lRj2BrDy4YibsQc/+k48sWqAEsDGoej9BMOZ09Bp6PUBrR9M4Af
 ELok6YlfBzglYZ7w4MvwQqt91+2TddNNGHS/4v4PicQF5WGjZYiELb161Cmy2LK4Co0poUcwfHt
 qJUmSN3AQeo6RwFCda9wzVMSv3qP8M94iwu+na02/ZbEoxV3tS7/5jVrHrOvxUQNBW82UzR1ncZ
 53NNbV52n4qGN72ETo/moLHRqrpCBDz0GdBgcAEFz6pHduhQ0IKIvNWoHLXNTJag==
X-Google-Smtp-Source: AGHT+IGiAByXWX/VuXJ575rRIj6bTeEbAlnebab6FY0vB4jAmRqS6rohlKvvoUgeChvVCplBX1c2lg==
X-Received: by 2002:a05:600c:1d1b:b0:477:9671:3a42 with SMTP id
 5b1f17b1804b1-477c1133e4bmr159739175e9.35.1764074109236; 
 Tue, 25 Nov 2025 04:35:09 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c?
 ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb919bsm33941871f8f.34.2025.11.25.04.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 04:35:08 -0800 (PST)
Message-ID: <1f8b5e97-1f3c-46f8-8328-449c159b7d66@gmail.com>
Date: Tue, 25 Nov 2025 12:35:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 00/11] Add dmabuf read/write via io_uring
To: Anuj gupta <anuj1072538@gmail.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <CACzX3Au7PW2zFFLmtNgW10wq+Kp-bp66GXUVCUCfS4VvK3tDYw@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CACzX3Au7PW2zFFLmtNgW10wq+Kp-bp66GXUVCUCfS4VvK3tDYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/24/25 13:35, Anuj gupta wrote:
> This series significantly reduces the IOMMU/DMA overhead for I/O,
> particularly when the IOMMU is configured in STRICT or LAZY mode. I
> modified t/io_uring in fio to exercise this path and tested with an
> Intel Optane device. On my setup, I see the following improvement:
> 
> - STRICT: before = 570 KIOPS, after = 5.01 MIOPS
> - LAZY: before = 1.93 MIOPS, after = 5.01 MIOPS
> - PASSTHROUGH: before = 5.01 MIOPS, after = 5.01 MIOPS
> 
> The STRICT/LAZY numbers clearly show the benefit of avoiding per-I/O
> dma_map/dma_unmap and reusing the pre-mapped DMA addresses.

Thanks for giving it a run. Looks indeed promising, and I believe
that was the main use case Keith was pursuing. I'll fix up the
build problems for v3

-- 
Pavel Begunkov

