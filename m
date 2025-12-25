Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ABECDD7E8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 09:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FF910E1FD;
	Thu, 25 Dec 2025 08:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a5yyFRb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4218910E17F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 08:22:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 280A86016D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 08:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D544CC19421
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766650947;
 bh=GBIp9kX+hl2mkbN1urGov/Z/70FEgI+eflqjn/ioE4Y=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=a5yyFRb9uYBzXdPMfDY9vd4rIRPVEQsvsCeWkNpcuMRC1oFSiawSyRMjO8JH0ss+Z
 x/QqhbYn4H2K5w5BJz4Wbqbc5yjW86RK+JUdiiASMd3rYdF75g5W/ucdGbgLZeZQtJ
 M0aD3nb1BRHmorKDtA+gqJ9Vunr1cAH1IQDLNQgQjj3FSAKjIAustTvo2HAO7oejED
 BQfq3K24nxEX3VBOrl0jQxIikCIXP2lCn1R15NZhdsQx8JQtBjoCUej1u3yfR7469C
 CySkvxOuqSrDJxvFYWV0Xc9oVlUyzSzGKoOIKV0FOW4oDwBwhKze2XTGnNHiTt4ExL
 DrphkeTLbTz8w==
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-37bb8bef4cdso61387091fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 00:22:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUEGHpjPPg9hRPXBwP2XPjBwnBmCIdQ8ICDZLX4tgQRXQLjH/AA31R31M8Oj9CWCmvXgB8pv811wqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWLVM0VAZHAMImX2U4GpDzsQrvm9RsiuFuL0yVwzFky6vj33lK
 9kDk05S2UjIT8ML1JC9mqpEfjEmVVquY6KKzkkb0aYfLD/aK7phVDnrdaSGP+z/fcOGjnytloU0
 9gGmU3hN5QWgIKjs0CN9mFfkhs/ufVrM=
X-Google-Smtp-Source: AGHT+IFppeSVdlVccV8ZLOVWMT/HmjByzAPqOV4k8UjgxAxDAQTT6kTjy5H+aCpOAkmg3adrDHLP6/5j+VdObqpd5IA=
X-Received: by 2002:a05:651c:544:b0:37b:95ee:f605 with SMTP id
 38308e7fff4ca-381215af948mr71834481fa.10.1766650946149; Thu, 25 Dec 2025
 00:22:26 -0800 (PST)
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-2-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-2-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 16:22:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v64h5E+hz-G4HEBesVgu4bkFfTi5vNEpU2BQFUYHKCqY8A@mail.gmail.com>
X-Gm-Features: AQt7F2p6GeAz5pE56ddcluDZYRCFD_O3UDD7G_yS9PvFCxlCXBqEjAn8ZBftz2A
Message-ID: <CAGb2v64h5E+hz-G4HEBesVgu4bkFfTi5vNEpU2BQFUYHKCqY8A@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/sun4i: Add support for DE33 CSC
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
 sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> DE33 has channel CSC units (for each plane separately) so pipeline can
> be configured to output in desired colorspace.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
