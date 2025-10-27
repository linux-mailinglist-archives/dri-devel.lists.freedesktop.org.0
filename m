Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E82EC0FBB3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767EE10E52B;
	Mon, 27 Oct 2025 17:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cjJgdn31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D662210E52B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:43:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 086346146B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94BDC4AF09
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761587028;
 bh=nS2ceydtY7arO53figgNl3Skob7MFYJcnB/okNLIQQo=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=cjJgdn31XIKVTvn/EQRmDwJvDk+eUYujuuM1rf4nIDHf8QMPJnsaHb8ZwxrF2X4w7
 FN0rCQrr22UjMCXMMgvOCfwTtIIaq8QQuJHGtcJtp1zYhWg7OlI7c3y7HLJAE9kgPt
 vQYvgjVvfu1tubtbxXnq+MD4JJDp/ev7VlBbHkVjeKVBPME8BlPWj8AA403wkDCBDb
 D5NU2EANOWv/4e4ipiDfu3b2owrASECX4K6qOre8VZbpFj9Y2Xdym8XURQurHZFHg6
 Fhl3bvO0LfuVtgI5uP+4Du5TuyeHhVsjdV9i9H+HE0oDjHCEtkR5OMQnFDjdmxDloj
 pDnqcStXCz6/Q==
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-378d50162e0so57553701fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTtxk4woGhwq15D8VlVjXk+x/oQEseRcH2SN0y1sQbLgWvBOqJKwwMHXAYNQS5In+VN/VYjMAkyZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSuHGWkWhlVIAJAMLwYSc4p+8yRPmCXZA1dXO+ex6iPBEDzoQE
 /D6YzyQP4Ky2RDw9wS1O2YU4wxVFng8FQ3y9R6VdVN08AhvErKXLA4S0KiHi+/F07RInrhbw9JL
 OUMMh87IOQFWv7wIEgowz+stfz0h6hLs=
X-Google-Smtp-Source: AGHT+IFUgpNOk2/lm1vINh6P/T+9hrDdSIGL0HQ0DNlL7efemsNxiG/a9dBuTEttStk6lJAJUQFTUsvRn5K8JymcC2E=
X-Received: by 2002:a05:651c:4112:20b0:378:de30:74e6 with SMTP id
 38308e7fff4ca-3790774baa7mr1284371fa.25.1761587027036; Mon, 27 Oct 2025
 10:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-17-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-17-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:43:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v6545EkcOCXYj2GzVNh0NK2CzqLEgHA+3yA0WcHu9jDiMw@mail.gmail.com>
X-Gm-Features: AWmQ_bl_-VKJDXdC4sK8FJlKiPnwMqUHPzZ_DuY_Cd04DihfBUomCFRnXNe5gis
Message-ID: <CAGb2v6545EkcOCXYj2GzVNh0NK2CzqLEgHA+3yA0WcHu9jDiMw@mail.gmail.com>
Subject: Re: [PATCH 16/30] drm/sun4i: ui_layer: use layer struct instead of
 multiple args
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
> This change is equally a cleanup (less arguments) and preparation for
> DE33 separate plane driver. It will introduce additional register space.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
