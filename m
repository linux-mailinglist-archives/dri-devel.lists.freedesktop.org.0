Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C8CFAB1B
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 20:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2941510E07B;
	Tue,  6 Jan 2026 19:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YXhW6i9C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F0110E07B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 19:32:37 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-431048c4068so83486f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 11:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767727956; x=1768332756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A5ExmjzRt11H31bMlKYOhViS+00PGFmBw8wszOB9k6Y=;
 b=YXhW6i9CT8/eTbuxteHpNhhNzjXxCAw70mou9MeuVs8PhjRIwBl/5ggwqs5xhg9UbO
 VqsifULHj7/yJQVwB7bNJi+b0KR/98s01hwsue/bgcgrNCj+nQw9VWegLp5naMTp5I8L
 JtEteDn7VZeQElE//TrqLF+50r6xMjinuTTRf81+tjU5hq6rXkbX0MM204xDe/1Ar6yp
 r4pssUqqO87JwRseWNLUaH6s1mpqo+0L/fQzxV70pZ6Gqjdkyw3NJmmRR/QZQ4ZS9Nvy
 vBiPHX8naTnr8I8WR2paRZ7lTxsHBgnlb0MFt/6s07npXRE9ca0NWC3HXYwT6mMskuT/
 leFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767727956; x=1768332756;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A5ExmjzRt11H31bMlKYOhViS+00PGFmBw8wszOB9k6Y=;
 b=hffys6BulxlYIPSHbl8eUDdBTO0DEH8QBsHRGGjEWJutKUJ9zGowDXq0seEy4JTFCV
 rYQWCDfbdMZtw12B0lpl6b0fn8li5TfRhtIQ4I6wTsVBu02BCGb2UKJdaryOvO8B6gq4
 VPRp4bEVSAnngizeFpaGyUaDOgW5Hk97VvByj5ZYN8ptRG3K1TcE81c1S2q1Ue5ps2AU
 XYo/LE7c8Qk0E3Jt+eCUPSY38sJmeNvVwC3rUxukhBk9sP72J7OGCLi5TP/JyLKpJ8iN
 K9BO2qvp2n5gNSJEuOR4uvmrbfXB1Sfpba9dUov9dOJ6fD898YSp7N73juEw3y9WY4HG
 6Leg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV39I/svB1OmLzC2TgscB0kTpgBjqx7A5bmt6cM/RXaWYFMZTPMnKzO1KkyYB86Bb0YMuQehszXQpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhbsku+UmbzmOynAsFIIyBAXAuD8G9ds1BWwr5OZE5AXCQ2dzL
 k/m/nE28bdZAeKfR6zzznGokhW1YZ8htKQ8FPscgs9LXl5smCGxjySve
X-Gm-Gg: AY/fxX48CE1svM3pQJ88XMM5NtkdDmxBtPh5J9mvFbmFtJ6cs8fbtyENVruLEHOyZK6
 mM2B9fORwgcsJqXwU5TAPjVDrgJt5xyTcNfIIUr8iJe0Hm1cSPisse4ftp9c7NALnFblSbZqNSF
 ITrlQhKiUAnrS8CGjnk2K4p3FZ1nPn2rV0eKI0ryJr5VLaQMfnnpevtChKTMtig+r0+JlQtfCZH
 WR1cWhbRChuCfY1fkk3t1X7rxdmba1PzuvNeRDU4ZxeifNvyG+kKPv9U++yl2seODu5Qa1ybbKa
 MArXDH6RuitH06eo5epCqRxh9iJ0TA474xnctCJTrWPto7XyWlA2ZhIkDi5wwpPMK35cyR/c2Br
 ntFQ/6m5abXMHH0aUFmiQ17jNcoZknOxJ3yupsa69H0p+ZDk8AhDLZe30LUxZ7PdfGvm6t+rze8
 yMzcD4VbSU6oCA15zDXnjhXysP7oYgpNEmU0cUxiCZxayocDqQsDMj2tLBQAb+yLC/okgCiTUF4
 5BuJ1BqC/7+XI+puEBTzHNhN1SWh7IpXM0BYXq437cOLTfeyc1mJDalwVkey/vB
X-Google-Smtp-Source: AGHT+IFIh4UFL5ktKvizijTqM9ls5ooe70zcSXJi12HfQ2Im3m/BSeK/gwa0FGVa9q2qDIVhMmmdpg==
X-Received: by 2002:a05:6000:3104:b0:431:cf0:2e8b with SMTP id
 ffacd0b85a97d-432c3778e47mr273696f8f.29.1767727956009; 
 Tue, 06 Jan 2026 11:32:36 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c?
 ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e6784sm5933503f8f.19.2026.01.06.11.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 11:32:35 -0800 (PST)
Message-ID: <275fdece-d056-4960-a068-870237949774@gmail.com>
Date: Tue, 6 Jan 2026 19:32:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 10/11] io_uring/rsrc: add dmabuf-backed buffer
 registeration
To: Ming Lei <ming.lei@redhat.com>
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 David Wei <dw@davidwei.uk>
References: <cover.1763725387.git.asml.silence@gmail.com>
 <b38f2c3af8c03ee4fc5f67f97b4412ecd8588924.1763725388.git.asml.silence@gmail.com>
 <aVnGja6w4e_tgZjK@fedora>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aVnGja6w4e_tgZjK@fedora>
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

On 1/4/26 01:46, Ming Lei wrote:
> On Sun, Nov 23, 2025 at 10:51:30PM +0000, Pavel Begunkov wrote:
>> Add an ability to register a dmabuf backed io_uring buffer. It also
>> needs know which device to use for attachment, for that it takes
>> target_fd and extracts the device through the new file op. Unlike normal
>> buffers, it also retains the target file so that any imports from
>> ineligible requests can be rejected in next patches.
>>
>> Suggested-by: Vishal Verma <vishal1.verma@intel.com>
>> Suggested-by: David Wei <dw@davidwei.uk>
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
>> ---
...
>> +	dmabuf = dma_buf_get(rb->dmabuf_fd);
>> +	if (IS_ERR(dmabuf)) {
>> +		ret = PTR_ERR(dmabuf);
>> +		dmabuf = NULL;
>> +		goto err;
>> +	}
>> +
>> +	params.dmabuf = dmabuf;
>> +	params.dir = DMA_BIDIRECTIONAL;
>> +	token = dma_token_create(target_file, &params);
>> +	if (IS_ERR(token)) {
>> +		ret = PTR_ERR(token);
>> +		goto err;
>> +	}
>> +
> 
> This way looks less flexible, for example, the same dma-buf may be used
> on IOs to multiple disks, then it needs to be registered for each target
> file.

It can probably be done without associating with a specific subsystem /
file on registration, but that has a runtime tracking cost; and I don't
think it's better. There is also a question of sharing b/w files when
it can be shared, e.g. files of the same filesystem, but I'm leaving it
for follow up work, it's not needed for nvme, and using one of the files
for registration should be reasonable.

-- 
Pavel Begunkov

