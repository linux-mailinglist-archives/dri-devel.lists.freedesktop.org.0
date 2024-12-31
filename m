Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBA59FF124
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 18:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6D810E0DE;
	Tue, 31 Dec 2024 17:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="YdHDOcMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25BD10E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 17:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=PPkjV7ktSl0QuJ5tN6//D3SfMmk9UXFqZNpi44kbjCo=; b=YdHDOcMguw1DWRYhsbOl9+NDLD
 2lceLSCGwG2sE1GfL8BNf73KK48g6KFX1iIfGeXEmJmPAu/usLKSIfwidGcL3zAci9eCvtywWtjX/
 2zQMpx2feqKHkIu6b2z2kNs9wDdqF2EIlWtPAF0Kjf7QbYB0KrDgWqAlGB8s1hp6Rr4IiC984udmT
 aoX9SOJ4fcwA0yrOMCxdL+CbBJJdTF3beuHF5e33km2WyrTP0QCknXuusrh+00tANQzIe0l/cMFLb
 uFa4nYj/mr2316Zr1jLpHahDrZzIFaFpQB5VvDGSaqIYxEtBzP23/omAfK1ZoizwbOZL9Ny/OqS0Q
 R2sNimuA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tSgSD-00000008K3H-06KX; Tue, 31 Dec 2024 17:55:18 +0000
Message-ID: <993b1c6d-6614-42b5-a64e-0061117fc1d0@infradead.org>
Date: Tue, 31 Dec 2024 09:54:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Simona Vetter
 <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi--

On 12/31/24 2:39 AM, Luca Ceresoli wrote:
> Document in detail the new refcounted bridges as well as the "legacy" way.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v5.
> ---
>  Documentation/gpu/drm-kms-helpers.rst |   6 ++
>  drivers/gpu/drm/drm_bridge.c          | 122 ++++++++++++++++++++++++++++++++++
>  2 files changed, 128 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 8cf2f041af4704875910ce8228ae04615d0f21bd..ca2cfef2101988933e1464fe146997c1a661a117 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -151,6 +151,12 @@ Overview
>  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
>     :doc: overview
>  
> +Bridge lifecycle
> +----------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> +   :doc: bridge lifecycle
> +
>  Display Driver Integration
>  --------------------------
>  
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 6255ef59f73d8041a8cb7f2c6e23e5a67d1ae926..e9f138aa5b3270b4e3a1a56dc8d4b7e5f993c929 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -60,6 +60,128 @@
>   * encoder chain.
>   */
>  
> +/**
> + * DOC: bridge lifecycle
> + *
> + * Allocation, initializion and teardown of a bridge can be implemented in

                  initialization

> + * one of two ways: *refcounted* mode and *legacy* mode.
> + *
> + * In **refcounted** mode:
> + *
> + * - each &struct drm_bridge is reference counted since its instantiation
> + * - any code taking a pointer to a bridge has get and put APIs to refcount
> + *   it and so ensure the bridge won't be deallocated while using it
> + * - deallocation is done when the last put happens and the refcount drops
> + *   to zero
> + * - the driver instantiating the bridge also holds a reference, but the
> + *   allocated struct can survive it
> + *
> + * A bridge using refcounted mode is called a *refcounted bridge*.
> + *
> + * In **legacy** mode the &struct drm_bridge lifetime is tied to the device
> + * instantiating it: it is allocated on probe and freed on removal. Any
> + * other kernel entities holding a pointer to the bridge could incur in
> + * use-after-free in case the bridge is deallocated at runtime.
> + *
> + * Legacy mode used to be the only one until refcounted bridges were
> + * introduced, hance the name. It is still fine in case the bridges are a

                  hence

> + * fixed part of the pipeline, i.e. if the bridges are removed only when
> + * tearing down the entire card. Refcounted bridges support both that case
> + * and the case of more dynamic hardware with bridges that can be removed
> + * at runtime without tearing down the entire card.
> + *
> + * Usage of refcounted bridges happens in two sides: the driver
> + * implementing the bridge and the code using the bridge.
> + *
> + * For *drivers implemeting the bridge*, in both refcounted and legacy

                   implementing

> + * modes the common and expected pattern is that the driver declares a
> + * driver-specific struct embedding a &struct drm_bridge. E.g.::


-- 
~Randy

