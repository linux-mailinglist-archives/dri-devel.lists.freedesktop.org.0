Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9EE7538BA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AD010E877;
	Fri, 14 Jul 2023 10:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEA410E871
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:49:32 +0000 (UTC)
Date: Fri, 14 Jul 2023 10:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689331770; x=1689590970;
 bh=lK0iS2UapPB8sCf4f8pDHhPJ7J9ifDIXC7H1HplnbKQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=aTR4t/1zirrIZrLm3b8gg7vjOfy+80crXN+lX3bAsGat9bQU9zMucibqIOW6ov5WP
 94Nw/ihIcfIJ7u8+xJyrpd3cT9Ny1yYn15hXh4h/Oppj7O/pslwDFVeaM658GZk8Oy
 94KmrnzxC9eR/NuvPSUnaG4hBsSC6850yc3Zj1mu6WNIdW/S4bfprnBpN7YZaqXy3M
 nECQweNzQvoxjLuB+H+ubdf1PaLGiyBlOG1/JsG31nzf2nXsEF85+55khzwn7JrwA3
 AF1Pm5e4efDSFvB2NFfpNZFn/B88HPiG2FiLheXfNjBeLTGhLMRRiTV8zvaeTimAjk
 Fif7k1Ch09ATA==
To: James Zhu <James.Zhu@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: support up to 128 drm devices
Message-ID: <c88Kg1rgzVYygiXgbR3f__64x_iRp-Rmi0_rcxt5ESYAb4ozORo-S702HMhpHROqFbLB2ndtSztHncVP92Qy0geKq3YJh15adc9KlVT8lAA=@emersion.fr>
In-Reply-To: <wBFta68Nq7iIaszeM9WT6v04l1DSIEs2cM-dOQ3uMWbFM2B74j43LU4Vm3VvzLrTfJRtZ8zM2c3AAxtMsqKcVlNtBuaJlITqtIRZzBuT56M=@emersion.fr>
References: <20230630115651.354849-1-James.Zhu@amd.com>
 <wBFta68Nq7iIaszeM9WT6v04l1DSIEs2cM-dOQ3uMWbFM2B74j43LU4Vm3VvzLrTfJRtZ8zM2c3AAxtMsqKcVlNtBuaJlITqtIRZzBuT56M=@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: jamesz@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, July 14th, 2023 at 12:31, Simon Ser <contact@emersion.fr> wrote:

> Before this patch, 0..63 are for primary, 64..127 are for control (never
> exposed by the kernel), 128..191 are for render, 2048..2112 are for accel=
.
> After this patch, 0..127 are for primary, 64..191 are for control (never
> exposed by the kernel), 128..255 are for render, 2048..2176 are for accel=
.

Correction: reading the code, accel is handled separately.

Additional find: the kernel creates sysfs control nodes because old
user-space reads them to figure out whether a device is DRIVER_MODESET.
