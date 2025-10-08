Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A77BBC56EC
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDD910E848;
	Wed,  8 Oct 2025 14:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MFAsxLEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4676F10E83C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 14:28:19 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-7900f7f4ba9so72564126d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759933698; x=1760538498; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C3nyMQNps0AyLL97xzttuk+phB0DdoZh7JjDzOjB4po=;
 b=MFAsxLEGjCRTAdsXcqihNtVC6waBb8ZYlCNYSdQlhMwUM8A83fJpW0lpgIPTODBtrk
 FPjjNaKjD24dI8fbVDpcBBhTT90YCn6fwVMnrGk/HnQ2STGx2tMi1O+dNb+/AkunXV+b
 mFx8+0o8LMkIglLKMAgUU5lXRWpOXFIjCMqlB+aGYrT7Mg3TgTspT4+nJsqAthqvb9Gi
 ODmc78XC2Jn1v69t7tTqVyFIHmkVWlPxCGyeCWy6CCITohfuwoQk8yyjvwox9D7W8SY0
 N+sHpM7qiv/TSrdYendR4j5ss/Op4gypgH8on+NiAH/ci1naS2PHbfHNZdE9+rrmB5D7
 5qNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759933698; x=1760538498;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C3nyMQNps0AyLL97xzttuk+phB0DdoZh7JjDzOjB4po=;
 b=M58a97fDzxJgpfgg6IQ4MWpPBz5u10ooUyrBzHZBQCjQoAme3SLAXdFdzyDM5k52ja
 Sz4Gqh6EmcrGQfWAwWN67y3Goca5ukbI7LKqDVUYey1QTjmMBwD4lvk5DEGNIDLxoAKj
 U1/1W4B++By6SSIss1uVPgOljai3lOT/fANKkwFDrhwKExMtv3QCbe+vI/MhgVo3roKu
 YUP1KLSiTG7Z9dh8TcTk3yzLRxj/JyeOPenerN11FtiwT4omC5fOJNN+2IvwUHuVRJog
 6MGNfWkNsyNucPx+Td1SxrDmATXYPaZMrk+K9cgpp/SlHMqYkuOVMkmc/L0uVXGrr6pk
 YvEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvMNCEBuHKgvVs/3zLCoxvu9Zf/XR5I7hzFyl+0zKyaB96hFwgOjU86oUaSpiHbMYYUWrZkS26Y0M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6EGC2vEkKxj/M87hbYM6aLASBBxbG1PtoKyXdyOGy6alQE8tG
 tffPfrv6ryst0X7OgKvuDPsB/Hc7lB/WD/n3OgkEImNMFmQ6bLRBP/2q
X-Gm-Gg: ASbGncuMFtMFzilpicEolWXQ7giGIFkVFnKmg19D2ASPB/6JxwL8a5bQFFR4Aj9aQ8L
 CZrgG4ys9P+wawJMRRKW2J3IsQbYvCAK6yZ1ni83kqi8y+M746opnC2boJBxS/6nEJs2a14LHuu
 nqZaDnW7HLMCV0OKq6qjhzIkXyKlMeAqO+FF3p3DDnTv26xERbh6UCU6LCQuAfw/8YmUWGUyr9v
 p83grocHyMkN6UejUUcOkPlsVqPZJ6MiKM+aCqdWpwaknVgfo1mybKTo2x3h6iL1OgSiVPXAF4J
 R5Lln4DtMTGqY8aEAmtJMUp+D/PSFgygrLuYDpsOEsz4aJjMFJX4rCQEPUP7fAfxR4qfpLjf2Mx
 3aLmylXicxd5hJ+GBhHN3lTHAQzeojpaOJccNRVp8Pwg=
X-Google-Smtp-Source: AGHT+IFntZefp3Ss0mi+6jECEAXuwb7eOj/bzue7nh8gRQKVbgbOiMWHYq2oEKWHI2USmbbKcqsDDg==
X-Received: by 2002:a05:6214:2a87:b0:789:d698:d384 with SMTP id
 6a1803df08f44-87b2103104bmr48809406d6.20.1759933697907; 
 Wed, 08 Oct 2025 07:28:17 -0700 (PDT)
Received: from localhost ([12.22.141.131]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-878be61f6bcsm163723216d6.65.2025.10.08.07.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 07:28:17 -0700 (PDT)
Date: Wed, 8 Oct 2025 10:28:15 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Message-ID: <aOZ0_7YQw81lyMWt@yury>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <DDC49ZIRX79X.2Q4KW0UY7WUF3@kernel.org>
 <faa99188-7ccb-4c7c-b705-3a207f5acd17@nvidia.com>
 <DDCFLM3P5MCC.NEBRVTU7X2G3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDCFLM3P5MCC.NEBRVTU7X2G3@kernel.org>
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

On Wed, Oct 08, 2025 at 12:08:59AM +0200, Danilo Krummrich wrote:

> Regarding the bitfields for page table management: Are we
> sure that we can use raw bitfields for this?

As per my current understanding we can't. Bitfields are not suitable for
direct I/O and considered as a data storage. In the current scheme:

        regs::NV_PFALCON_FALCON_DMATRFBASE::default()
            .set_base((dma_start >> 8) as u32)
            .write(bar, &E::ID);

we account for endianess in the .write() method, which would be a part
of register API, not bitfields.

FYI: ARM64 is in process of dropping BE, and Linus announced the end
of BE support for RISC-V:

https://lore.kernel.org/all/CAHk-=wgYcOiFvsJzFb+HfB4n6Wj6zM5H5EghUMfpXSCzyQVSfA@mail.gmail.com/

Thanks,
Yury
