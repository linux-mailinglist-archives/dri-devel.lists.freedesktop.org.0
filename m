Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A56CC30B7A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 12:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47E410E5C5;
	Tue,  4 Nov 2025 11:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d2ZDLvH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6F810E102
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 11:25:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D8FA601EA;
 Tue,  4 Nov 2025 11:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021D7C4CEF7;
 Tue,  4 Nov 2025 11:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762255530;
 bh=R5SXDE2SgNS7wmaD1Gcfg6YItf0qkGUKKDfGIAl5yu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d2ZDLvH2nhfeYRcrIHG1iKJN0Dgsp76MX3JwZ74S/qhTdg9897Rm+V45EOl1iKsRO
 midAmw7aVCsb0J3sJGikadCeaHVFTbTyVPCPtbbZty0srQbXRaSk0f3amDAqfgNf/w
 PiSSIc0EgE4UqoO6mbzcSZiaO63dsjaYe5E3M6rOFA5VQYBqGRrNwXkgSmPq1qxOvk
 nJdUjx/+4C+js17IaM1TEnoaHtPetVDo71du2hJ/hdC4Ya76C2HHSwg/98NJ0FkyHC
 J8dWButunS9s8pyeEL0Xj1odIhAIvFFJthtq035dTE57vcx5RyYxfTKDgvumwzKZ4s
 GsZyqbqHZSmVg==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vGFAL-000000007TH-0lve;
 Tue, 04 Nov 2025 12:25:33 +0100
Date: Tue, 4 Nov 2025 12:25:33 +0100
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?Q?Rapha=C3=ABl?= Gallais-Pou <rgallaispou@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: sti: fix device leaks at component probe
Message-ID: <aQnirQ2d9qLqJ68i@hovoldconsulting.com>
References: <20250922122012.27407-1-johan@kernel.org>
 <d1c2e56b-2ef9-4ab1-a4f8-3834d1857386@web.de>
 <aQj69wzTceDklx2Y@thinkstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQj69wzTceDklx2Y@thinkstation>
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

On Mon, Nov 03, 2025 at 07:56:55PM +0100, Raphaël Gallais-Pou wrote:

> diff --git i/drivers/gpu/drm/sti/sti_vtg.c w/drivers/gpu/drm/sti/sti_vtg.c
> index ee81691b3203..5193196d9291 100644
> --- i/drivers/gpu/drm/sti/sti_vtg.c
> +++ w/drivers/gpu/drm/sti/sti_vtg.c
> @@ -142,7 +142,7 @@ struct sti_vtg {
> 
>  struct sti_vtg *of_vtg_find(struct device_node *np)
>  {
> -       struct platform_device *pdev;
> +       struct platform_device *pdev __free(put_device) = NULL;

You'd need to declare the variable when looking up pdev, which is one of
the reasons I don't like the cleanup helpers. It also often makes the
code harder to reason about for no good reason (especially with some of
the more esoteric cleanup helpers).

Keep it simple.

Johan
