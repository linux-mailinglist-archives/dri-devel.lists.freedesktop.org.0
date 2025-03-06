Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E9DA54CBF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D63210E997;
	Thu,  6 Mar 2025 13:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YOqqeLXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4299710E997;
 Thu,  6 Mar 2025 13:59:11 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-224100e9a5cso11445635ad.2; 
 Thu, 06 Mar 2025 05:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741269551; x=1741874351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=gcMj47LDDJL0C0ekfxA2WdyVcUGhX6i6MQXT5ot4g4M=;
 b=YOqqeLXQzNsfCzaqzMHBkmVhZo0qK1VPoKgNB7yUzzdjCdrvVAO/hdqzs5vdwrrdf8
 dk0EgCTRLPfbZGki5a17/D+UmZaKDM+9h56Zkbz3YEcRQRMabh124/5CWvzOP7Moz+5h
 3oA1L7zYAihKFwiMFQwMw+U3sswvL/kSxVOZAua3g6yMOA7sygmK0n03tihmCz/Bza2d
 yQrSj6AsAKiHK1E0cASVKm899E5WJvzrHV9GQcMG5Tr02ocb5u4f+hZzVLc2F/yyOtxI
 rv98BJbh309GVQIIm/2HhqQMb+YeuzJqfyZf1MM3C509kUuIPRvqpMiuY7/lCgMN8txm
 9PRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741269551; x=1741874351;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gcMj47LDDJL0C0ekfxA2WdyVcUGhX6i6MQXT5ot4g4M=;
 b=Hx4z+uxFTJUyuTy1S5r+pmPnbhOz3C16GCVLL1ywbBT2aRcZe1r7tacrZcAHpEylhN
 x3ctU1UVY6tImUu4GQiXzXmr91u9wo6g4gZmTSpbHz79s+nXRSxl7vUjsXJ+8Youz4CV
 b8bTJKmRf3/Tx4B8sXwgMmRJzrytZh/d6lEPg/8f0eNvRqufMaaBMSoNSuKgWk90+UuP
 ukAJ6GB/KeiiQs4wlX84k9+6+ZQhjZSjw2dT8bhjhT0RqJTAdiYJFe/7805yYgnmLy+y
 lVRlH2n0z586oaoXYhCEp/hxU1kJ1T29AMfJ0E62jLD5oXrBWmvBfcNEJZCKpguPHkzJ
 1GXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkA6qPw738L+pkkCLTa8MKk3wThqgHUW97jmN469TOuZERCzgy6RqN5kUjOxb99555LvcVgTa0CQ==@lists.freedesktop.org,
 AJvYcCWPMidHb8CMyrzwo356LNUH0nGwTXlWHOUhWaQaBL/+JQxeF6J0T/X+N8pmeNpGlnp+EHS4qeWfrDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyzvv4v+oqJvRUcstUVFpY/h9+f7nRQLjen89x5hZRUeAePC0qo
 0Zr9KoMEd1aBEouEXFIL2YFxzpMNS0n4tgg/qC1fLrJoK4ARxkeC
X-Gm-Gg: ASbGncuSYSymKjbitYvjLfCR39puMZ8SGPGz1h+ovDN/yBAIA8dW4QOoi9ewG1h42lx
 Ivz/WSmmlwhwK0cNKRwqYGdZbxLrGeZxu0mM6E6Qm0wm6n8lcZwdVdr1t8GPVYJxuHfZGF4pCq7
 oIHl3k+EvaHOQxoSeFAdtsiq1MB3e7OyUplCh2+oeZvv4YfoMN9MRwzWRBleXNqEDTzFfcEvp8x
 rgUoly+j05oim6tBRSMNb0WZkMyj1h+wWLrJzfyEPOup0ESf92dTL0NZi1eU8a9gTuxf7BXieCp
 dBW0ApF5jsF9YzXcUPZjMStjk7mdDYNutdpZ/TWBtb61PrK3Scx3+XG8BNz6zmbYCKw1l6dhuuR
 M/B0xdBMLA+jecNWp3bR/WZGC+dA=
X-Google-Smtp-Source: AGHT+IFqC7dar9vSI6YGsXxKnsXEPE0Q3GPt4+bYPBgIONPD8wz2KSMdMkJPHp0sptOtsCw8Cul/TQ==
X-Received: by 2002:a05:6a20:4305:b0:1e0:dcc5:164d with SMTP id
 adf61e73a8af0-1f34944ed8bmr12193897637.8.1741269550654; 
 Thu, 06 Mar 2025 05:59:10 -0800 (PST)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp.
 [153.160.176.131]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28bbf3ab0sm76581a12.9.2025.03.06.05.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 05:59:10 -0800 (PST)
Date: Thu, 06 Mar 2025 22:59:02 +0900 (JST)
Message-Id: <20250306.225902.541492197262171384.fujita.tomonori@gmail.com>
To: dakr@kernel.org
Cc: fujita.tomonori@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 corbet@lwn.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add initial documentation
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z8mm4fJQxXMiN5tu@cassiopeiae>
References: <20250304173555.2496-6-dakr@kernel.org>
 <20250306.215638.838863448505767234.fujita.tomonori@gmail.com>
 <Z8mm4fJQxXMiN5tu@cassiopeiae>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
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

On Thu, 6 Mar 2025 14:45:05 +0100
Danilo Krummrich <dakr@kernel.org> wrote:

> On Thu, Mar 06, 2025 at 09:56:38PM +0900, FUJITA Tomonori wrote:
>> On Tue,  4 Mar 2025 18:34:52 +0100
>> Danilo Krummrich <dakr@kernel.org> wrote:
>> 
>> > +Delay / Sleep abstractions
>> > +--------------------------
>> > +
>> > +Rust abstractions for the kernel's delay() and sleep() functions.
>> > +
>> > +There is some ongoing work from FUJITA Tomonori [1], which has not seen any updates
>> > +since Oct. 24.
>> > +
>> > +| Complexity: Beginner
>> > +| Link: https://lore.kernel.org/netdev/20241001112512.4861-2-fujita.tomonori@gmail.com/ [1]
>> 
>> I posted v11 last month.
>> 
>> https://lore.kernel.org/netdev/20250220070611.214262-1-fujita.tomonori@gmail.com/
> 
> Thanks for letting me know.
> 
> I think I lost track of this because in v1 the series was named "add delay
> abstraction (sleep functions)" and with v2 it was switched to "rust: Add IO
> polling" and I was searching for subsequent patch series with the "delay"
> keyword.

I see.

During the review process, I changed the subject due to the consensus
that, in most cases, device drivers should use read_poll_timeout
instead of calling the sleep function directly.

> Anyways, AFAICS you ended up with adding fsleep(). I think nova-core will need
> control over having a busy loop or actually re-schedule.

I plan to add read_poll_timeout_atomic() with delay functions:

https://lore.kernel.org/netdev/20250228.080550.354359820929821928.fujita.tomonori@gmail.com/

delay functions need Delta struct in the patchset so the patchset
needs to be merged first.
