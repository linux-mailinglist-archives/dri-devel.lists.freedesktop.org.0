Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E037F84E2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 20:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FB110E374;
	Fri, 24 Nov 2023 19:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F8210E374
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 19:46:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2D62DCE2BDC;
 Fri, 24 Nov 2023 19:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A37C433C8;
 Fri, 24 Nov 2023 19:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700855213;
 bh=Lh3HwY/b7OgZdLgEYvxR/BK2codpIRRolyXRRFsmkA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q1TeqK+R7WpZrlSDMwr2q5pUslqvDxUZQ/UjxaJG+a+2rZfxsGXQNrT1gBW/xcg3d
 feK85zHpN7c7s/J3L4BZY4s2cA12sCo1tZooLL/uUINxBnte0yNzB5tKcEUnJIIzBE
 dQnZNWfWK6iDwM+O19xWtf5vMHsVzVU2FWUEdS9fSdbjh6V1DsTH4k5fw+TRbQQ0nf
 1aXJ55F30UiQwH8Hn3BRQl8vU5RxrySYTod89qXmE3ZC/5x4zNd3j3XC96nr9aYH3H
 FB7zwZ+dS2iFk0yunM1KYvxTWoySec2R9fGQCplSue259exrB4xj8nui3qSPromI0v
 ZIx0g3lb7WiRQ==
Date: Fri, 24 Nov 2023 19:46:46 +0000
From: Simon Horman <horms@kernel.org>
To: Alexey Makhalov <amakhalov@vmware.com>
Subject: Re: [PATCH 4/6] input/vmmouse: Use vmware_hypercall API
Message-ID: <20231124194646.GW50352@kernel.org>
References: <20231122233058.185601-1-amakhalov@vmware.com>
 <20231122233058.185601-5-amakhalov@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231122233058.185601-5-amakhalov@vmware.com>
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
Cc: pv-drivers@vmware.com, dri-devel@lists.freedesktop.org, namit@vmware.com,
 hpa@zytor.com, timothym@vmware.com, dave.hansen@linux.intel.co, x86@kernel.org,
 mingo@redhat.com, linux-graphics-maintainer@vmware.com,
 linux-input@vger.kernel.org, richardcochran@gmail.com,
 virtualization@lists.linux.dev, mripard@kernel.org, akaher@vmware.com,
 jsipek@vmware.com, tglx@linutronix.de, netdev@vger.kernel.org,
 dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org, bp@alien8.d,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 03:30:49PM -0800, Alexey Makhalov wrote:
> Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
> Eliminate arch specific code. No functional changes intended.
> 
> Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>

Hi Alexey,

it is not strictly related to this patch, but I notice than an x86_64
allmodconfig build with W=1 using gcc-13 fails to compile this file.

It appears that the problem relates to both priv->phys and
psmouse->ps2dev.serio->phys being 32 bytes.


drivers/input/mouse/vmmouse.c: In function ‘vmmouse_init’:
drivers/input/mouse/vmmouse.c:455:53: error: ‘/input1’ directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Werror=format-truncation=]
  455 |         snprintf(priv->phys, sizeof(priv->phys), "%s/input1",
      |                                                     ^~~~~~~
drivers/input/mouse/vmmouse.c:455:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
  455 |         snprintf(priv->phys, sizeof(priv->phys), "%s/input1",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  456 |                  psmouse->ps2dev.serio->phys);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

...
