Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727BFBB45EE
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 17:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6C210E7FF;
	Thu,  2 Oct 2025 15:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KuW9ZfC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5DE10E7FF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 15:33:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4BBBF1A10A6;
 Thu,  2 Oct 2025 15:33:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1FD936062C;
 Thu,  2 Oct 2025 15:33:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DA6A2102F17FA; 
 Thu,  2 Oct 2025 17:33:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759419233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k+1LiZdujVey+bphMk0ViassNao8HXzl/x5/6BvKxv4=;
 b=KuW9ZfC15+F2q6S7zoLQrivAKuihRyzzhksmV6+vjOXwtFvIFzkF2jDYtsZoXTGnvs57p0
 UqOb93tG33xgehEr9MAK4CGCv2XF7y8CZ07yOmcxDS7mgu8sWCnL7vX1mROwSfeTn074ja
 rUsYnnKJ+VITEucvH2naCLfFgSLP+NuO4PicowvpK5J6u3DeVKs4Tr90D5mmjAsrdFZJQ2
 crRGyIK31jy7QuqqKoU3hTnHKtM8U4Zm2Oro8eraOYzrZduo+qCMCoGX3UK4J1s5nutvKo
 N1QSo9PJgeJxH2hlNe5SdqOeTRDU4BNJTyNR52Chg4Rw3Mvrcz3lqPYSRshwxw==
Date: Thu, 2 Oct 2025 17:33:31 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] drm/bridge: lock the encoder chain in scoped
 for_each loops
Message-ID: <20251002173331.3d06d7d3@booty>
In-Reply-To: <202509301358.38036b85-lkp@intel.com>
References: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-4-23b62c47356a@bootlin.com>
 <202509301358.38036b85-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hello,

On Tue, 30 Sep 2025 14:16:23 +0800
kernel test robot <oliver.sang@intel.com> wrote:

> [  674.477504][    C1] watchdog: BUG: soft lockup - CPU#1 stuck for 626s! [swapper/0:1]
> [  674.477539][    C1] CPU#1 Utilization every 96s during lockup:
> [  674.477543][    C1] 	#1: 100% system,	  1% softirq,	  1% hardirq,	  0% idle
> [  674.477549][    C1] 	#2: 100% system,	  1% softirq,	  1% hardirq,	  0% idle
> [  674.477553][    C1] 	#3: 100% system,	  0% softirq,	  1% hardirq,	  0% idle
> [  674.477557][    C1] 	#4: 100% system,	  1% softirq,	  1% hardirq,	  0% idle
> [  674.477561][    C1] 	#5: 100% system,	  1% softirq,	  1% hardirq,	  0% idle
...
> [ 674.477713][ C1] drm_atomic_add_encoder_bridges (drivers/gpu/drm/drm_atomic.c:1319 (discriminator 1025)) 

The one reported is an actual bug, causing an infinite loop when the
encoder bridge chain is empty. Took a while to reproduce and debug, but
the fix is very simple:

 #define drm_for_each_bridge_in_chain_scoped(encoder, bridge)                           \
        for (struct drm_bridge *bridge __free(drm_bridge_encoder_chain_unlock) =        \
-                    list_first_entry(&drm_encoder_chain_lock(encoder)->bridge_chain,   \
+                    list_first_entry_or_null(&drm_encoder_chain_lock(encoder)->bridge_chain,   \

Fix queued for v2.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
