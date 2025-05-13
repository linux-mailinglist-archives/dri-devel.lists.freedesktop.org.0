Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F17AB583C
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 17:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C09910E066;
	Tue, 13 May 2025 15:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M7ZLybk0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D930D10E066;
 Tue, 13 May 2025 15:16:09 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-2c12b7af278so4302240fac.0; 
 Tue, 13 May 2025 08:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747149369; x=1747754169; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0uh/PTXJRbMcazwRaWv8Bo4RnC9VvZ9wH65449hEE1k=;
 b=M7ZLybk0vtdzd8WNJj7MZLw3RPNg1+YNLPIhu4httNSv/+cPW3udQYukdehXh/HMNT
 MoiFoYx+woYMl/FITUTgktHys51ziDYb461thfIW+91Mgg2osppqvwIu3IuT6n1k0/MO
 oTHsSbXto/GJN6G1jJxiMua2tbjSiN9j0K70Ps+U5n1kMyFoGELvLjqXc/u/LyPfEAtn
 dzf0AkFPn1R0bIarJTgIjeToke8xoj7jCd5llWuUGdM5Lc90djujPHRfWqynjPZBWzIK
 UM769RMzc4tSj0zn4R9g2TIL37swHWwKnzYbfroK2Jm59dPGbswg2Ll48bE0cymS/zXi
 JCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747149369; x=1747754169;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0uh/PTXJRbMcazwRaWv8Bo4RnC9VvZ9wH65449hEE1k=;
 b=kyohHGOtBwEZSVy3934ni/gQh5MZDk/arKbdahtkQTsPZL1Wa5tSgi7OfcDRTGcGwP
 AZdb/9MVzTDlM4f9Zp5NVYdHQmZKnQjrji2Lpa/p2yDBDVV29R9e/jwQYjLTIJax+feN
 3K4Bxwq1u2/bZa1dsWWE5BxXp5N6pte+mSvwid7ccPQY67kB0jgHgXFHc0OJ/PeLEl0a
 HqaoXQDTVOrnqIN+ZD9hmzMdQt8s1BgQX+KLIfXazpE6x5xcUvtQNyid16mJn5xe2Ln7
 jsnJ87yjjD7/jHrqghnWaUUk4TwbIqtvp0sZCyun5zahh59ouefkVi+El6UagO/Idbh/
 Axsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNSl5ODvOG8AA46k0VDeLKyjO0KnvGySfZlMkWm25aCrAkJCwKDdCgb02JPdHfKwksG1qfq60VTQ==@lists.freedesktop.org,
 AJvYcCXX8yX2Shwrd5FbmfJ+w+SP65xw+cKUEQ11Py31VcMlVm9Vj2T/qRSYfF9P1qXMRgBHZV4PGIMuG0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+4RzyHjLs1kxxbHLy93Zxv4sWq58VDKnOy3PbWvTSMjdOwxFu
 DHLs00ZjunsRlnMcVGyUJZvuIuxNULkhNAW61+aT7TZ6sJXWbtlY
X-Gm-Gg: ASbGncuCxwpZ/hkxNcZhSQ47KhH7mJ2CrDBT8eOpm1RZfh3wPbPx1aNjzmPLoitvXPv
 rUfv2ZkyZyeqUCWpT07OmVXVzezdHWAiNl87Wfx9rP+btooW41xUDl5nZtx3c0XxTk7x55hq5Dv
 NLphoq9O0jCM9rKvtFs3o1bGsE2xMp+SGV7XKKBTNX/LedIDo2ozrTGHdD2vwFubIwatPQslCmH
 c0hqxMiQAVXuUolBsQx99tYlhS8nbSUCjSPpFLTxzaiZVLIqZwxeyzawQwcAIUpnuXjefvulyZe
 caaWRk5zNRvhv/RU15q+OoW/7sj9D2nF26HBQopvDM9bVKjWxTa8EvcdPTwK8+J7uv1RKT2uxxM
 XYFDr9in1c9TI0+2UPsSgBy7Zis1c
X-Google-Smtp-Source: AGHT+IGbr/uZ7r4cS/fBNvQYU2fhVqEpCiBt00je02tqMC1tSmemGmi5CB3JGNk1qdmVKM7wKn0FCw==
X-Received: by 2002:a05:6871:e086:b0:2c4:1b1c:42c3 with SMTP id
 586e51a60fabf-2e005bc46camr2217682fac.9.1747149368576; 
 Tue, 13 May 2025 08:16:08 -0700 (PDT)
Received: from my-computer (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2dba0b7f856sm2270445fac.45.2025.05.13.08.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 08:16:08 -0700 (PDT)
Date: Tue, 13 May 2025 10:15:24 -0500
From: Andrew Ballance <andrewjballance@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, bhelgaas@google.com,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, me@kloenk.dev,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, daniel.almeida@collabora.com,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 00/11] rust: add support for Port io
Message-ID: <aCNiDPgMGZ-tD66n@my-computer>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
 <ff526b49-a033-450d-9e48-699187167712@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff526b49-a033-450d-9e48-699187167712@app.fastmail.com>
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

On Fri, May 09, 2025 at 07:53:31AM +0200, Arnd Bergmann wrote:
> Can you describe here why you want to support both "Io" and "PortIo"
> cases separately? I don't think we need to micro-optimize for
> legacy ISA devices any more, so I'd hope the "Io" path would be
> sufficient to cover the common outliers (ata, uart, vga, ipmi, ne2000)
> that need the iomap indirection and also the legacy devices that only
> need port I/O (floppy, x86 platform devices, ...).

Yeah, we probably don`t need the `PortIo` type and can rely on `Io` for
port io. I`ll remove it for the v2.

Best regards
Andrew Ballance
