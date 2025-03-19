Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF46A68949
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 11:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AFC10E041;
	Wed, 19 Mar 2025 10:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rSiThVBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D45C10E041
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 10:20:17 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso3645431f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742379616; x=1742984416; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
 b=rSiThVBa34YtaOYkvmdUDYZKqTcaq4tarqupYLPanTmg5cEIEx839xvqem4b3XUn+8
 uTE4UiS7E+alG0mY8yz6PkZ4YhpZGX805GuG+K3U3FfuxTFQVt6hH0Z4BpKuUzj0iS+A
 u2fpk9Cs6BG6qyVrlfjDVlM8BL2sIC2ENUrFJcxWcklTAvZV5yaSavziqQWb/+LLUoPi
 0MtKGSz/yMAodmKwv6Z9dgihXSavUu5nacbd5GIq+YVepJSICVLpbCRpWDDws1tVuzAI
 368e6dZ2sTgwTREZeGhwNOmPEyOTSXt7gY4bpjAUvtNTXK5leqDsCSpZa7fmCpLEAYvj
 P2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742379616; x=1742984416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWxtYxkS3ZmfTDBR3Ubow/eGPhpGRxs9B2tOpbPHly4=;
 b=H2XD1n50cx8W9rIy8ycVsxfR1HgVfivfExGftFa38SZnYl0JjTrqe1Gk2mBdu1y/Hf
 Ltt7eObS+7Qrjz/ChAFzHtrG77X0yFGfeu3c+va/iC2ywV2bEhgf8Oli55NdX1LDqNye
 E5RYCVlRR2zJ4Z+nIYN7tDGQ1vakM0sWd0jyTpdR24yyZjbc2/mcWuEXghNvFm8vxeOy
 sGNpmbgm1DK+m+Fz3Sj4zv608GDbXlUAc9by4IErUmpgDVgFZG3GXlBtavmfIgncPy+T
 FzlhMoLv6il9dpIYnZ23SFagV4a1BJu0wmuMkVs+9gUsFoncXe+D6Hfzsxnwznum0U6E
 1vFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuasVz/CaHqJ6IMXh2sgmmlZh4VCakDC+zlB/BRyNo5x78DJDGqHHdyndB5ctGIMVSXr1pj7pjKJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys0IM50iwCDY+AMFNnYrjcRyZfgwkGbCwwTekTToNFqEMP94so
 Cam+XKIVYh7Z1U3I0c1UX2C5A2C3etvEC3ks8YVFv4grgbWy7UoFnpzZ+Iz7laU=
X-Gm-Gg: ASbGnctyd3G9edzUTM/ITVJ7GJmU+ihLdizweKGWdQYUvE+vMgVzpizuBtI++f2K5f2
 gL0+AKnfECU/4EyZO788hIhcAS+LoI1yl7gT7PzNrC9TddoOh4ytfNgv2KeYOZiDP/d0lg5f8n+
 d4l6DBEv8mpaNm6Z5RhX/CdAYEeXa5uaQFzes+E4Op8micAhYF5IXAiKtyx78ncSJ/pcv9KjGU5
 n5ESLu+WDNVZulVGrsx/n58oAeLd/Dn7TbdtGFRHXatusO8U1vVx5nv7oqdiwRSBo0mw5Zuyfha
 b31yWKw1FXS7y6yDJhMDvZES1dtn9YiFzYxWvu+ZXKRDZqquIA==
X-Google-Smtp-Source: AGHT+IHjcG6/IeV2BOfDblPqcpvGjw3L7kajd7hg9EDti/4DwNoU0L0nZRG8X9Tat0FLH2nt55nwLg==
X-Received: by 2002:a05:6000:1541:b0:390:e655:f998 with SMTP id
 ffacd0b85a97d-399739ca2a8mr1441536f8f.26.1742379615798; 
 Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395c7df3506sm21189338f8f.11.2025.03.19.03.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 03:20:15 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:20:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Will Deacon <will@kernel.org>, Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
Message-ID: <fc197abf-e65a-439f-9d35-83f4665519f3@stanley.mountain>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
 <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
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

On Wed, Mar 19, 2025 at 09:05:27AM +0100, Christophe Leroy wrote:
> 
> Doesn't sparse and/or checkpatch complain about 0 being used in lieu of NULL
> ?

Sparse does have a "Using plain integer as NULL pointer" warning, yes.

I can't apply this patchset and I haven't been following the conversation
closely (plus I'm pretty stupid as well) so I'm not sure if it will
trigger here...

regards,
dan carpenter

