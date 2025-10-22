Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D4BF9B8D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 04:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA5B10E67C;
	Wed, 22 Oct 2025 02:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lWY8C2tk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B932710E67C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:27:49 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-789fb76b466so5264273b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 19:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761100069; x=1761704869; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xqmP8PXFVjPtIGVNVJySqdODosEn/uc3qt8eNXsbPts=;
 b=lWY8C2tk+u7IUK2wVnazbhzl3Lajx6ichJ+rx7P7bY1djmtnwY0KTbseXcy4fhOQRM
 TIqZi1cqVNKLJ0S3l9TP5EkHWJ63HmaCLRX+WP7ZjheYCX1Ly6Yp1wKVkUN46dKowi4O
 7mFFya2rht9vQbPS18QXobSR7jKUXLohN7LHYz1v2UOwLlQqjyLw8Ul5iVqq+0yj3i7D
 t+Y1+xGWybA7pfUeHQkRZWAUSoTW04kK8wfbWH5u4pjrhlKVE5kXKytN+Xu9mUB0Lrc/
 1d+g5uJziBPgrg+TnflTPVzSJjvtYc6pi/guXpgOJU1+ADGVZ1fxrj8mD1OnDkGIZ1kV
 ARgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761100069; x=1761704869;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqmP8PXFVjPtIGVNVJySqdODosEn/uc3qt8eNXsbPts=;
 b=OKUrkItMuAurlQOsnHakQbMO40zyp/MxjX4f/ZpQA01UCdvAJk0TmHL+scHn0pyALb
 c8kiSm5A8UqYbgF4XOzBDVzgr2oIdmJzNT9BV8kmhCWlnbi/t9uQ6Y78L2zjOkTMBeHz
 +6LfDTQFbsb0C+59YviUY6Iq6Tfkx6VZNZHw+MOm5czCsh5szCqRn3VVihKIG6tOvcAh
 Qo5gsBVTrNXJ1KZ7CjbLG4PR5atUDgoXFa6628gXzOcSuyApr2b8YW7oK4DN8bNzYm7i
 DBF6MCPwjm9/qU0E0riufdda4KY6y4abxmMDr5gdt0h2tHvFAETaZ6X/QJg5hYL0Yfjt
 Vt+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXtBgV3LbRktcTGI8Qs1hasUUgj1YnnLMyOoTQTSzpXPpmuCU0Oj/gVxxdUvfTdKjYAmRNUPGWOvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyvde/tFZZCIsOVzKq+XAmTNLRpB12S+kMBkPAKoobJfwfLK4Jc
 DDDE0JuzCVhWKqKXe5C4fROATvoZsCOj+rfjEJslYZApwqkyBegqxLakcCU5kJD9pEk=
X-Gm-Gg: ASbGncv86YzlqRzagq0gmkV1v4kla7cz/zVtHdMRz7mt/xvY9ta4EK3fIwOzLpo5u9Q
 bHJR/Vxzj9FwJ0anuoPSxSAbkuaMb9HQ00VXEsQwxFu11a1BPxY0wCMbQMETdZNoqs9ra8yuwp3
 kAMC1yH798sdmobZ2AOrkjyZL7zwVBgdCp1dq5cfiEQAkA3X48zAFxF5A9sa7qTX+/1/rkSs8pK
 sg0LkWfTHLJv2GMnHxMoKV03R4ozTnepmra+F2fObnZkJGZSlupH5vpBWyixONHr7xS8i+P8JMa
 GYBC4H1kX0SE5DxTU/RSa+DmxaYn3KpggDIikO73zzAVKwkAHoLPcExSyfk/pjjb25lgsbCZ6AY
 EOiAqQDJ1+I82TJsCENLqItAvXypJNFeZdUlM/3ADPtvjTb05oOhnSXfgcJ7FWtDPMIKr1eKeIc
 /mEQ==
X-Google-Smtp-Source: AGHT+IEkOxWVQSWldQc/gAwbJEjuX6oOPBwr0g1WUs0jQjHOfnCn6OF8lZVM21AQiTMGEA1gGzxfjQ==
X-Received: by 2002:a05:6a20:9144:b0:334:3a1d:536 with SMTP id
 adf61e73a8af0-334a8536f36mr26023352637.17.1761100069036; 
 Tue, 21 Oct 2025 19:27:49 -0700 (PDT)
Received: from localhost ([122.172.87.183]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33e2247a7cfsm940817a91.11.2025.10.21.19.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 19:27:48 -0700 (PDT)
Date: Wed, 22 Oct 2025 07:57:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: tamird@gmail.com, Liam.Howlett@oracle.com, a.hindborg@kernel.org, 
 airlied@gmail.com, alex.gaynor@gmail.com, arve@android.com, axboe@kernel.dk, 
 bhelgaas@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
 brauner@kernel.org, broonie@kernel.org, cmllamas@google.com, dakr@kernel.org, 
 dri-devel@lists.freedesktop.org, gary@garyguo.net, gregkh@linuxfoundation.org,
 jack@suse.cz, 
 joelagnelf@nvidia.com, justinstitt@google.com, kwilczynski@kernel.org, 
 leitao@debian.org, lgirdwood@gmail.com, linux-block@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, llvm@lists.linux.dev, 
 longman@redhat.com, lorenzo.stoakes@oracle.com, lossin@kernel.org,
 maco@android.com, 
 mcgrof@kernel.org, mingo@redhat.com, mmaurer@google.com, morbo@google.com, 
 mturquette@baylibre.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 nm@ti.com, ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org,
 russ.weight@linux.dev, 
 rust-for-linux@vger.kernel.org, sboyd@kernel.org, simona@ffwll.ch,
 surenb@google.com, 
 tkjos@android.com, tmgross@umich.edu, urezki@gmail.com, vbabka@suse.cz, 
 vireshk@kernel.org, viro@zeniv.linux.org.uk, will@kernel.org
Subject: Re: [PATCH v18 14/16] rust: clk: use `CStr::as_char_ptr`
Message-ID: <rd2jyc57e5p6zjhypnxkfnjwsnihs5tsr7r55qnuwbho5jmkxh@53grgiitw725>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018180319.3615829-1-aliceryhl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018180319.3615829-1-aliceryhl@google.com>
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

On 18-10-25, 18:03, Alice Ryhl wrote:
> From: Tamir Duberstein <tamird@gmail.com>
> 
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=&[u8]>`.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/clk.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
