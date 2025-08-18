Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E5DB29D69
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 11:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D28A10E1CC;
	Mon, 18 Aug 2025 09:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="3MZrsQky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1319A10E1CC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 09:16:29 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45a1b004a31so26497235e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755508587; x=1756113387;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5uLKx4iguI8kGPc2AmysFSfdfkA+TlT9pFoZ/+x9ucE=;
 b=3MZrsQkydxMAqDc6+4NZXYB+lhQ0vNa5StRg9Nxo30zRXw+pXokUKQ0P2GWir/j+4h
 OG3YGRa2bcQ/U5zKG0M1LA3RVVQRQhZVIaSTsKZg+b05PkTPfSKVA1seCaTnfyFgowIw
 B8+//IriNX5zM6qcOS6PJtc0+TfnTHGWV2NgXRN7p5TKEvGQH4eZ0xpUOWWJHzqWmy6r
 mIXLzCfVWQ0ToYT61tsPmA7Oz9j7QAUL5sA+oavoxTpEgDzd98Wh//EerDcKL5rXpJuD
 FEbnQQ/EoJcLC9NiKpOR3PrOUlp+ZkuI4XbBrix+mUlql1oA5K+CxXf0KpV14cIcF4NE
 UD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755508587; x=1756113387;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5uLKx4iguI8kGPc2AmysFSfdfkA+TlT9pFoZ/+x9ucE=;
 b=qanpMnp2eRTvmXzbWOjk8yYL5OY/HzsBhHFyhd2g34mODmG7GY4cQOPF7Jx9RFiqzH
 w8lzoixuHJEH9RuiN8Ibyxq/szDMupIzLrHclV/ozjeakeMORCfy4MxSxPIMWpBH0MI6
 wFHhN+61YSvQ+m/jMufYOanDxNCP4WKmtr28AGKAl/A47pIyZDunkxmvlM582LbI8H2Y
 ZODf0NBRoffN3Zp73y7c855PGZHlEVEqtufWJDgyMGyz736F1q0HH1sR3V6fi2IGAsDm
 I28mpfbSQfW+WP3t3j8dNz4Zljnr0AgPSD8kf7GEwAZstogT6AUyU59dyXcIRerWroAb
 94+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK5rbEKDilqkONpcK6vnYf02BrOdCPuGMs2ZseWAQ9yvDXsbJegyn0cRGuoj+CAt/JhjbbqCUrvdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFBrKxNY4ufrfhQFVlm5c+62sYXi3tCpGky70qBe6YxNN6+tdp
 G4ombDQz7ic6GOi3IRX+9qVTrxymB7rmhlHfkbd+fOQWBEwaOGHyap4b/3SYs/OOjS1cK5+o5KQ
 wdxLuuc0=
X-Gm-Gg: ASbGncuyfkP87odxYbOphRmPeTorYRmzD6zvmrXaRmgs4BFt9H26RUDwTxSahgOvpJx
 ivKA9OpT7zbqEQmoXaIYvIDjpQ/1uiegbZrhLtzBQ9SZPOGdznvR7QmfakhHdUm0OwJT6TAbFhq
 ps84kwKc0Ag/H+jLGbreFF1RS6feQmoh+zfijqyNDxSoaGbQM2kD5T3VD0kXtw62FDxMwGXZRlR
 uRb+/NL6MEcwbYwZ8ZWO0joF6h0/BmrSbKIRmrge0TlZkbBOo/qY12r8eu7HXvcV9X8SmPZWt6c
 cCYrUaKUnfb/p8MHDJOzEogBiDFZM+1iNg3A4E+HgPz+c3Xi048n0VN8ofRXEacO9FoFUYbE+wX
 XmRbiHzClF0dU5F2F2ZzBeXEriacgkpuIeAUsVL0u3jUlkl5LFzIXKbuP3fnPfxXq2W0c+qrrdv
 XpAHBOtg==
X-Google-Smtp-Source: AGHT+IHDUhr5tbZW68XtBaWVE5750X38A7H/faFXckj5O/o+hqZwSOPx/6BzSCyybhISbzqKROogNA==
X-Received: by 2002:a05:600c:45c6:b0:43c:fcbc:9680 with SMTP id
 5b1f17b1804b1-45a2185dad9mr83576675e9.25.1755508587052; 
 Mon, 18 Aug 2025 02:16:27 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb68079341sm11907856f8f.50.2025.08.18.02.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 02:16:26 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:16:24 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH 2/2] backlight: mp3309c: Initialize backlight properties
 without memset
Message-ID: <aKLvaP55PIVhyFSc@aspen.lan>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
 <14514a1b0d3df6438aa10bb74f1c4fc2367d9987.1751361465.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14514a1b0d3df6438aa10bb74f1c4fc2367d9987.1751361465.git.u.kleine-koenig@baylibre.com>
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

On Tue, Jul 01, 2025 at 11:22:37AM +0200, Uwe Kleine-König wrote:
> Assigning values to a struct using a compound literal (since C99) also
> guarantees that all unspecified struct members are empty-initialized, so
> it properly replaces the memset to zero.
>
> The code looks a bit nicer and more idiomatic (though that might be
> subjective?). The resulting binary is a bit smaller. On ARCH=arm with
> an allnoconfig + minimal changes to enable the mp3309c driver the
> difference is 12 bytes.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
