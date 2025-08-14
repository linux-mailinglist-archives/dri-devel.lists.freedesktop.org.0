Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60880B25A62
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 06:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F7010E205;
	Thu, 14 Aug 2025 04:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IQvcdyWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88B810E205
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 04:15:38 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-76e2eb20a64so700772b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755144938; x=1755749738; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=34KWmLyAieUzqtSrdM5jM6hi2YW8C3abPtgGolrQZzs=;
 b=IQvcdyWGyYFC9QsnOOC9BVPx3ikASsy/5vFQzdPitdY054pWOEEVoyU6tJiOEZKme1
 ICxKnQRVA4YTgOC8RMMVl3QMUUX9fS3ixN7hmvZ2cRx+dvorHQ/WXql12wz4Ppjy4geD
 t8weVQW0XnYQf/94mRPbKsNyHgGWy/HBI0/36YjuXYQFNSnnWvu35RPtLZwaz3XaiH2R
 HbwqcAHIxM+8h5KjPlPFhc0tykCN9NO8yxXnWbglOckRkFvvABOZsqTbfbyR4u7tomnC
 IV3oaDGjsPzYbv09pf+LFpeiQLpkbwpFIR8awei6NP4wJOrfUQDKfsaLFML4DjTiFpZd
 7LRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755144938; x=1755749738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=34KWmLyAieUzqtSrdM5jM6hi2YW8C3abPtgGolrQZzs=;
 b=eV3le7pl4BXoVDocl1QsUVZEJ3XaIwpGQ2RiMaUYZSODitD0r8cIcyUceHMjykwZz5
 UvODIm2uPEZOVW5ccQRbdMVls+lrf/EUql2HG96oiUVqiLt0QhG/Z8PE1GNVsrxwuNF1
 neyv1H8AkJIITVcD0NOCjp48L0qskR2BNdRFUPahoF/av6nfRhK1LHSnS1kNbDas2zj+
 /lnSSuP6zOIBW5KZjZ9YRrnEVxmwl04RDnwOEL5XYTay3zgj8OxFmor8enejc9YXtO6X
 wp8uGquYGtTuqagIlKA4BrEUVXqX1Qn5aNWPcbAYyR3hoJKT3L1wxhsMU2hoRJj4+TG+
 CGSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfRvNt7D7jUGIFpf4N9S1h0vWyrdVhmL4PQdXQE2z2eKd3SUPpEvF2cyzm/t7thUhK3aXQ5wXoxZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2+IKYk6ZC/kwq5+6BJdnH8PLf9hQqVaqIskLejOPyT70ilhfH
 NQ3II1e8N99nEaWRXzID6GZA8VpgRMHtraj9tuE/vTe0vkWDcbFK87K4f1Xjc3Z4iFI=
X-Gm-Gg: ASbGnctlGmChlZdHxB90gIhfusC2LtGFi2eZAfnVO9wQn6Z7TZsIKJ+JL0XWYeynQAP
 F/HC525lGUv9uKtDOOXfnbHfOwSMpnnwJGbUMZ6mRBA5ivNPTIn86tk2zsEr5u3hYTYhZsFMMp/
 XX/mWQbx0zLOQbk8Ip1ZXpe5ejBN4Liv6uq/2upYbx60NyW70TPnotN6Jh/BYt9GmA3VIhTeknL
 t6LaudBb+1V7TLR4NIYtOssUzR4QAAp/tiWPiQoaFihgTkYj5U/ppVDL0uJfSFXEpGCiDmF4ztn
 MV2/6IzP+armeFNLWbRcGyo3lCFEGJHCwkHbB18CJ0k86cgq/bxGb7kTlsIIe3N6xSI46BZ7FRq
 0lDA5vioSeHXMcAU65by2dyngUq+mxac5Hy4=
X-Google-Smtp-Source: AGHT+IFKmQVKtrRTGaZ8hTWhd7nE8H1E8AgUXml21TmSiOXRMbfiiTxpX/j+26/xYc1Zfc3ne6Vv/g==
X-Received: by 2002:a05:6a20:7d8b:b0:240:1204:dd5 with SMTP id
 adf61e73a8af0-240bcfbba85mr2301691637.8.1755144938050; 
 Wed, 13 Aug 2025 21:15:38 -0700 (PDT)
Received: from localhost ([122.172.87.165]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd9795200sm31652911b3a.114.2025.08.13.21.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 21:15:37 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:45:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 04/19] rust: clk: replace `kernel::c_str!` with
 C-Strings
Message-ID: <20250814041535.l7yj2wm4ae3l4k7p@vireshk-i7>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
 <20250813-core-cstr-cstrings-v2-4-00be80fc541b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-core-cstr-cstrings-v2-4-00be80fc541b@gmail.com>
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

On 13-08-25, 11:59, Tamir Duberstein wrote:
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  rust/kernel/clk.rs | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
