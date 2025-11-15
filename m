Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E3BC60775
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 15:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8FC10E074;
	Sat, 15 Nov 2025 14:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jdd9DKqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F74010E074
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 14:47:45 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so5122951a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 06:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763218063; x=1763822863; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6zCF2VwvteQ2rlCgNAvg5npcthhroXaHgp98itk06Lc=;
 b=jdd9DKqqhkc1ATSWYhFLFr2XarEyLg6fX5Qhs4JgNLUoquNDEEleAbACraPGsYHxoB
 821vQsvMJRSxNZESOu8dl4SIxh88BhNR7+dTtfVd1+u/ZuJj+sevH81TWb25qaKfY0yw
 1f1ly7bkWGzYOPxs/661lrKPGRn054mlHfAsw1qR3kvE4XxyuluoCwI1LuwYSP3ZnNJ2
 UOpkAcKuwBwwT2qrYuMpT6X5RYnmc9XiMROFxLOvSizCxLQQcfc10J5K1kP8LZ98q7F5
 EQZd5wcotyej14Ve4gV8tojfH3yEQJ99M+Z0F09SsA29bzlfQ9pT6OEUYl/Z8uqqdW2M
 3d4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763218063; x=1763822863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6zCF2VwvteQ2rlCgNAvg5npcthhroXaHgp98itk06Lc=;
 b=m14fk4h0FpIvEBFpK1BLgUqJVhUaCxjFWDKH3ezlJGsWBfEQtIhKhs0ts0zVSoedBk
 v63Ig0lFkYpnqX+DsWB6LAGg7illnniSR0200Yqv4OFJLKyFobIr/B9qSJkdyKsAgVZa
 CuEoeqnN6ensgW6wu4VkfMDYP0mYzEg9oh/9Q6P2AUHYQNYLpADf+4qIJqG9bbWRHSGk
 vwo3T9nyl3p0xB62eJaxhFbyxqbw4cbJJ1lLCuZ5cUV5VGLVX4XHWRRBpgtLT8n0BJ85
 O5DX2zTEZYyu47/bJiOYibadvsDfIlBGL1SW5Ybpn+aQzwmK+E95jT5oBDQlNusoM+gb
 VE/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYvtZ9L87bprt1lQ4kFl3JjFwJ3XEDOF53ygFZMaMoQp65kfiP2Ia/jCUTapnRPKr+mEotvFfo46c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+V9HAXrwh73q5UhbN1FX5pIzwGigE9oypEVGpZG6gd4J9/DBZ
 /cYdTZavbZKtdZZgtGjPaQPawytU+psGPtLCYBEawdcdfLtynPwkNtpu
X-Gm-Gg: ASbGnctQ7Bytd1lw5L6yYzJfSi0JMD2GtohU1jfVgPSZMoJX4ZyWMsNVXJt7Vexxpm7
 C/G2YdRkvQWasqgYfPi4FsV+fucs25jbeGsX+fzMCiPtmCzVXEQa6bLzUpNcv5zNVhUungnZVBM
 HTAE7RQGjsXqoj9W+EG30nMdwacaSrMg8R8Z0QKBFSQctiMdxd6cQ38FM+ZovIQ6wkEHCh75a+h
 VLmd8yHyacFNgxWooQHPp5ETwdIWE6gNfwrs+WkX0M5U/MT+F2tJwUO3YLuhUj/QJvM122i6TDq
 H4okLBXTDpQQV6+YjEt/ythCwFNur+Epeclxq3xPETSsi8BpvusZTlcfkmpi/8dvGjNAHIyasiX
 DbwYYvH4EyrAyhZrqy9k7/9B86Y7MUkqgr9WOE4Ae8Gf1ZQtp/Gl4NqzK5pwKYHINzRK3WNUHCD
 ushu671MRbn4p1TsPX7Tx+9pGMvJ73QMypAKgV1cliwqbM8kkDWIXvYpAue8DvtdlCVzy49QKNM
 5AM5w==
X-Google-Smtp-Source: AGHT+IGrjk6XSc2vCyw9UdPnvD0sBuH/IPACkYBi6rv/j+NdjGAC/UWtwwJ0hdXjpnf0qvoLJ3aa0A==
X-Received: by 2002:a05:6402:42c8:b0:63b:ee26:546d with SMTP id
 4fb4d7f45d1cf-64350e20abamr5640955a12.12.1763218063485; 
 Sat, 15 Nov 2025 06:47:43 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d7335sm5917548a12.4.2025.11.15.06.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 06:47:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat, 15 Nov 2025 15:47:41 +0100
Message-ID: <2804739.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-3-jernej.skrabec@gmail.com>
 <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne sobota, 15. november 2025 ob 15:40:27 Srednjeevropski standardni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> <jernej.skrabec@gmail.com> wrote:
> >
> > YUV formats need scaler support due to chroma upscaling, but that's not
> > yet supported in the driver. Remove them from supported list until
> > DE33 scaler is properly supported.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20
> I assume a fixes tag isn't needed because technically DE33 support isn't
> there yet?
>=20

There is no user of DE33 bindings yet, so yes.

Best regards
Jernej



