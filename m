Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA67C0FC43
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0951910E53A;
	Mon, 27 Oct 2025 17:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QCZeA/46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273E510E543
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:49:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5273C6147D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9F3C19423
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761587371;
 bh=jc/356FpIO5fq3wbVBLhYJF7QyfRlww33yCqXERm6yM=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=QCZeA/46aNC46Zyq3ct1c+oD9mKTL+B9dRwtAlaNovacqBG5F4WahIvB1DsTB1Vu4
 yndEirqDSXI3CyHqUq/OlsjcvelXE+dTfJk/2pFEEmOY/nAc57OU8w7KyvQKkIgNiz
 ea8VUPJu0Pm3HXibBhkAGvcbEcLdlJD14bcrR3hqXWOYtBAhKXanDLpMTMUeCRc6EK
 oUEiOQQeRTwnq82cqfFV7zzElGKdE8xOTlc00KE6FCBOfp8rLu9e7Fhxp2ZTsW450x
 iNdSKwmDyAGKMSTxmsKFSoaD/snKr5amwSbQyVIZNZa42i2Gj0vyEnr6bGe3sfoQB6
 RcpIcTQyxd+iA==
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-378cfbf83f2so54766641fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:49:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWF2RiF2pbFfBFCysYnDuZ2VSl1BLDkLQfFC/rU6Cx9dhv4RJhkaS03+bsD3CLGr4kxsCe5JTn+3so=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy18UnfYnK1H3eYLd5Ck4dyyHt2YEscs3QOViRWeflF93JuZYkq
 0TDW1DxG5+0sbp+jmwAe/JFWDLFGELnUUNwEaVYMzxFGl30yCRwuk2KY+NdsF/cR6Bir80MpehP
 GUU6h/k5POrRPCVXHQu3OhS5auGNyvq8=
X-Google-Smtp-Source: AGHT+IGvL3+rmUcT/vmlGB6JqgMLiakuW0wtgocLdITSs5J6YhIhu+bJ3QUjjP/Dh4NLN0bmdcv0CpnIkj1evrKbsNk=
X-Received: by 2002:a05:651c:234c:10b0:378:e097:e16e with SMTP id
 38308e7fff4ca-3790777de3cmr1218271fa.36.1761587369224; Mon, 27 Oct 2025
 10:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-19-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-19-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:49:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v65aY11Hi5JN1PEMyFCoYK9Z11V=xYXLcSLqQizwdVOarA@mail.gmail.com>
X-Gm-Features: AWmQ_bkqzQW934j8vgxNIiz1K6pixo4CW7R1IQZPgknoWpc_MwhACwyMTj6ZI0U
Message-ID: <CAGb2v65aY11Hi5JN1PEMyFCoYK9Z11V=xYXLcSLqQizwdVOarA@mail.gmail.com>
Subject: Re: [PATCH 18/30] drm/sun4i: ui_scaler: use layer instead of mixer
 for args
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Layer related peripherals should take layer struct as a input. This
> looks cleaner and also necessary for proper DE33 support later.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
