Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB628BF9B7B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 04:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE9A10E571;
	Wed, 22 Oct 2025 02:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r2w3KeJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D528B10E571
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:27:31 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-33badfbbc48so7636022a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 19:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761100051; x=1761704851; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7Kynz5f6kQn3G9h5f1VDmHPl6BLtsPQWnOh0t3sfi0M=;
 b=r2w3KeJ9VaVRDpd9af72gPcpFBC95a89HuWEcCxcL7GY5D9u6dZ9D8KAenz/51nWsf
 FmY9ZHIvXBvVmXpiRuvz3529oZZcUNJ9QqLdcpNKw7uKdsJbljWCI9ogxq0SOVR3u+7y
 YiBdlgCBJxWJ5F3fPyyZyZ0BI+ysCWF9kywK2qT/Cfaz6Y3sKTTiUxD6lpzZL7i3T6Cm
 1FZzHCfJ98fX0IMLGDTBtK6VH3zPoA910bzWjxJYHuqGOA/pqvJj6fVo4JZs5wswJ6n0
 Aia9aUFtPhlVcHndpJjMNpr9pKQmatnEEDG3xeO2vl7XnfyZO9GCTrbDEXwPG9TCtT9C
 JsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761100051; x=1761704851;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Kynz5f6kQn3G9h5f1VDmHPl6BLtsPQWnOh0t3sfi0M=;
 b=EnDhdQvr1G/qcGRc2piAEAsPOHMfbxcN0GMMbTqzKFzj/S+gB+qzd+BATYHdNnLFjf
 gAB6eS/OQKJ2Bbn6VLQPlxPBfut2/ObZ18ogLk9lRuLfHx5efLJ0y9JFXiW9MNBVq3go
 qiRy4dHVq6liQzNmHDAmNvnCBnU7F/2WWBp6Rz44ZdKfPLLM5f4eE4FkheW3uiW753bi
 4EPsRO46YoOL406rLTQfmaUHpd9RuPZEfq1FTyCf88Eyat6Thks13A71r9TuAnNKPsgo
 SeWqHqjjYRVZ8fjHlXryOgRXoyHss9P5gELkvyDOZliGdL7CP9bh3G6G4ZG+Nvo1gEir
 3CaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWheSvPiHT20edv9FwfhC0pc4Boom3ZcyvVFn37ehXTVfikYB4akv+PgrhISObjf796Yhe7l8QWDLo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgHS6aiSBzk089i8JqBcYsID2WtEYVeqfHRvcJHWXfrZ4Nodp3
 aVfESb4/77dke57xDEioeq1UNLc5VqjBSK8o1jbrA/EkRrh0oV/jfA+XZx86ph58F9g=
X-Gm-Gg: ASbGncuPPvw8jQAhQ7CiIRbB9YFZrgVAVq0wFoofKbxXAkgzFqLuTOtEvEx8XWv4l78
 5j/V+zCI6+htP+ISH9ZJpBM/m0cIX574smHxTPwxmGgY2B0Mq+bd6JtXoCwh9cOOQbnUJ/jLER3
 CV2MsK9ls9aHB0C7mYR1vs12PoLMUaB4v1NxmOAYuBlR5hU/N5MTQ/Ijx52f6NkxrNj0hlcX+S2
 bGrXpg61/XURYjwn4hnKDd5otGtKLx0UuXSXxIt+K3PvOqwtl9v+WirPzy8mAzdHnwuGPlhE6T7
 hIQfPlKAJjcjzlGneBJZ0rdAQxlZjpJ1UADtayTq2HBDfHFwy+BKREVCSsEw+3ffTl/1r5gnBH3
 a8XaX3iutpFuQOHaMnPIT9NiolmrwC2RkZ5MAZ1vwluMPrG4BDEKRahoMTxhdEkQdUWlkhrBT1s
 B5WFfI8d7U3D4rq/1nznXfFYo=
X-Google-Smtp-Source: AGHT+IFJLVFpIR1aWCyZCFOIKnAA6a58lXYXHZeAFELxfkfneTEN5uN4Dh2U6O2etE9y+Y+gRJvc9A==
X-Received: by 2002:a17:90b:1dc6:b0:32e:64ca:e84a with SMTP id
 98e67ed59e1d1-33bcf888575mr30106334a91.12.1761100051119; 
 Tue, 21 Oct 2025 19:27:31 -0700 (PDT)
Received: from localhost ([122.172.87.183]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33e223f11e1sm981092a91.12.2025.10.21.19.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 19:27:30 -0700 (PDT)
Date: Wed, 22 Oct 2025 07:57:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v18 11/16] rust: opp: fix broken rustdoc link
Message-ID: <gcdcwpotzidrksmsnyvesnojcylbb2fqpiue4fijhj2cmayli5@7lpyessslxka>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018-cstr-core-v18-11-ef3d02760804@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-cstr-core-v18-11-ef3d02760804@gmail.com>
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

On 18-10-25, 13:45, Tamir Duberstein wrote:
> Correct the spelling of "CString" to make the link work.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/opp.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
