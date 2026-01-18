Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E323D3982E
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 17:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7449310E2D6;
	Sun, 18 Jan 2026 16:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="cU5f6YR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4514410E2D6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 16:58:28 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7cfd6f321b5so2114918a34.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 08:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1768755507; x=1769360307;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bv4mJ1WA5PkVw1gpZVpA4eWj7mOEd86WM3sQnHXBrw8=;
 b=cU5f6YR2dJGWdWaF2X+VveVrfcYSbTEx7VvkB5Fm3tx7cfPmFza6XQ/krNY8kvThCd
 29kv8vYvBHsuFG+Qc9bvDrTWwZ93s98bkcm6kopegh5gFZmTAQnzxw25Mc2fTZ9oWvAQ
 XibhfxbDIcM9Fx2hj3upHCgu+pdFmOw+tLDYnjVDC0XvjABbnjV/+bdkx/pzGKoN0m4y
 4wBMI5E7Qo+8rqFaUS1SajRHClveaEoMAt8ReAEctWO9N1TFgzy90Slg7JbRuEmsLgdv
 wv3IzNEBhy/EdkFN3s8Lf6V6kbcDH7KwpyHTOBaVFMYoNiFP1yTxSh5tH5IbPd1m5BWZ
 rq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768755507; x=1769360307;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bv4mJ1WA5PkVw1gpZVpA4eWj7mOEd86WM3sQnHXBrw8=;
 b=UjhfXEqTQQUGRPP+iGpB9F8vt4rIX3EQg0J1EKQmHF1uMBnkxuBuYuICZU+Q9Bq/Sc
 YildqTOzOg/pHBKTTjtRgFl9uXfly8++IfjE+JQympfaVn/KjCcsehzQ7Nvkl0Nn71LA
 yRtYkX+i2/XBIfsjRMOliXOR44qEs1Zfu5nq1KFQa4boTOMNDw73AAwVHSQg/GopD/Ba
 awoOf20e+jIXssyTWkQgFG7VobMtOVqFDRIos6U5ddKDoo4Ya02B83lyaPunp3IXe84x
 PIR11ZLHP8F2tN1/L9mBSL/c3B/SAXqR47BKMtA7YmFDy02NlJCbwyccwIzDcLWa2mtD
 gOww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMu+Pno6eRQm68oCjkXkI420YBS7Nso9T6YHfjxV5tduEV7PTyPvtJiG4jM/1ahvaCcwwjUWtzxk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcErw1/1A92KiJin/E7VlTMYU8t8EJrtU9pLLD/Pr9TxwRTk5s
 FqedWOKZ+emAVFwcepBsn9ZljVgvHFvZ1CZLxtVeHoO991SI9QpAigFbirY+EECQTQw=
X-Gm-Gg: AY/fxX7cgwNwtadG0P/XUCK4sU7YuIU6kl+6YhVtOWrVtQai2uamFX/QSZZlzF6zHLf
 4uG5+yzb5OWvt4kKQsEXG/A7WE5JWqazOu2K9qJ4WVgV9/IeyxWa0wslcPuiDbx1eO/R6g65pVY
 xzVcVg2GVdg9peKTB21IfTToZBf6YRNJn7JJ5xBw8te+yhpSo4n9gzwUcq2N+S95rOXKh1PvI+g
 Vq79ms4do8Xl5l2erIXHzMNDNzZ2gMyW3LdazLd51WY+07qQYsktE71w3HX/lOqmKODmYbfEvWZ
 Gh410sZUdDYz27hsjLpEf7TqQdVMn7DPQH0O18FTaaR6BjFZD76L0uvtAvLam0sdwhAHBHo4Jb/
 zxMrRd5mVvqwVMtzq8M/9fd3l9Hyf2SnrETTZI8Gjg/NPKqxkXJS/oHENRTAou0lwUCP1DJVPoB
 vGyz3eGgJAjpyNZF1LVOWpJlYigHhmBHYMCcJuBVNlmQBs2Qr5dknKdutkhM406983Etu0XA==
X-Received: by 2002:a05:6830:3156:b0:7cf:d213:7ecf with SMTP id
 46e09a7af769-7cfdee7a81amr4387364a34.32.1768755506711; 
 Sun, 18 Jan 2026 08:58:26 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cfdf0efe41sm5290925a34.11.2026.01.18.08.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 08:58:26 -0800 (PST)
Message-ID: <184b3699-1eb6-4701-b827-47b34e997af2@kernel.dk>
Date: Sun, 18 Jan 2026 09:58:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_types=3A_reuse_common_phys=5Fvec_type_instead_of_DM?=
 =?UTF-8?Q?ABUF_open=E2=80=91coded_variant?=
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Ankit Agrawal
 <ankita@nvidia.com>, Matthew Wilcox <willy@infradead.org>
References: <20260107-convert-to-pvec-v1-1-6e3ab8079708@nvidia.com>
 <20260114121819.GB10680@unreal> <20260116101455.45e39650@shazbot.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260116101455.45e39650@shazbot.org>
Content-Type: text/plain; charset=UTF-8
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

On 1/16/26 10:14 AM, Alex Williamson wrote:
> On Wed, 14 Jan 2026 14:18:19 +0200
> Leon Romanovsky <leon@kernel.org> wrote:
> 
>> On Wed, Jan 07, 2026 at 11:14:14AM +0200, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>
>>> After commit fcf463b92a08 ("types: move phys_vec definition to common header"),
>>> we can use the shared phys_vec type instead of the DMABUF?specific
>>> dma_buf_phys_vec, which duplicated the same structure and semantics.
>>>
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>> ---
>>> Alex,
>>>
>>> According to diffstat, VFIO is the subsystem with the largest set of changes,
>>> so it would be great if you could take it through your tree.
>>>
>>> The series is based on the for-7.0/blk-pvec shared branch from Jens:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=for-7.0/blk-pvec
>>>
>>> Thanks
>>> ---  
>>
>> Alex,
>>
>> Could you please move this patch forward? We have the RDMA series [1] that
>> depends on this rename, and I would like to base it on the shared branch.
>>
>> [1] https://lore.kernel.org/all/20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com/
> 
> I tried to ping Jens regarding why the branch with this code hasn't
> been merged into their for-next branch, maybe you have more traction.
> Thanks,

I get a lot of emails, and pings inside existing series don't always get
seen... Usually better to do a forward for a ping, then it's a lot more
likely to get seen sooner.

-- 
Jens Axboe
