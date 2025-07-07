Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179EAFBAF0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 20:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A393F10E508;
	Mon,  7 Jul 2025 18:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C6REVKvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D6510E508;
 Mon,  7 Jul 2025 18:42:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 739F15C4A98;
 Mon,  7 Jul 2025 18:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E0CC4CEE3;
 Mon,  7 Jul 2025 18:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751913718;
 bh=VyGs5PKx52yoiBVtgnovPQ07XxMfBUWsD+MHEUA48vU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=C6REVKvtCYc7MWdRfIeluPdb/GOwgKpsiMcDFbZDmLAfD860z8iRtTy814Z/iAGPc
 DLaJmNcZnktYDXI4S2ZKzUP/knaF8HvyRehoxUGBeSlgDFG1C89JsQJcfCrNwERkUu
 4iwSWfm8m8ar7jE7B0MJXuaHrnD7GqDb1sxTMKkOHxSKTrcHZuiNfSJYoxx2+xIwA0
 8thR3svEA84jQ09mrNDGbuHpbyfSx3rSrNf2yRuCbyGvHxXE3Yph58CdARkEsjCdm2
 HO8paJBrX5C/4gEsO8Pp6vaEomFb46lPi54TBQR7VF1Mr3vwuRwGMD9CQQhueyle6b
 uo6THNVeB8Gxw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 20:41:52 +0200
Message-Id: <DB61KWU2AA5I.1UJPI77S2BSFL@kernel.org>
Subject: Re: [PATCH v4 2/7] drm/gpuvm: Kill drm_gpuva_init()
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank
 Binns" <frank.binns@imgtec.com>, "Matt Coster" <matt.coster@imgtec.com>,
 "Karol Herbst" <kherbst@redhat.com>, "Lyude Paul" <lyude@redhat.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, "Steven Price"
 <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <asahi@lists.linux.dev>, "Asahi Lina"
 <lina@asahilina.net>
To: "Caterina Shablia" <caterina.shablia@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-3-caterina.shablia@collabora.com>
In-Reply-To: <20250707170442.1437009-3-caterina.shablia@collabora.com>
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

On Mon Jul 7, 2025 at 7:04 PM CEST, Caterina Shablia wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> drm_gpuva_init() only has one internal user, and given we are about to
> add new optional fields, it only add maintenance burden for no real
> benefit, so let's kill the thing now.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>
