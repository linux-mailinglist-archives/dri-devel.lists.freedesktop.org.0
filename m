Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28345B452F1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F7010EB43;
	Fri,  5 Sep 2025 09:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="t2Pj2yOr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C6010EB43
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 09:20:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A00274E40736;
 Fri,  5 Sep 2025 09:20:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A3F76060B;
 Fri,  5 Sep 2025 09:20:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C6A9102F084F; 
 Fri,  5 Sep 2025 11:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757064027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9SxE9sHDRS+9jmnuto9qFXALvnli23FpNOccQlHrm8I=;
 b=t2Pj2yOrnRPaACwjPy8UfjKJsdcHolIzvCn5joWL897l4FY1ZUmmkz8dRVweeqoONTiTAm
 EJy3rt6p1bi05Ah5mrbZDwMyry/6iR2RRpFR+oYgsFEFN0l56CfM+1OKkQxwLavmLCVT0w
 FWRGw9y8yKdELSvdHYOwdPBrst09mKjlLZcwQdcPWmpzJf9vVHALjDF646uT0ahtDJgG+V
 4is/A6SZiy9ztsteTQHV20xpP/wXAwwViys8FuVUXe7d1Yi5WHPBVLboX4ZQlx5cGP6zRF
 /jGw1/5JblnaYpdv9ujKH6pFyG0wHbsbni2Jkp0xBVs8x0msNikR2TxbM7JOyg==
Date: Fri, 5 Sep 2025 11:20:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 09/37] drm/atomic: Document __drm_planes_state state
 pointer
Message-ID: <20250905112025.267d97e9@booty>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-9-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-9-de98fc5f6d66@kernel.org>
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

On Tue, 02 Sep 2025 11:35:08 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> While the old and new state pointers are somewhat self-explanatory, the
> state pointer and its relation to the other two really isn't.
> 
> Now that we've cleaned up everything and it isn't used in any
> modesetting path, we can document what it's still useful for: to free
> the right state when we free the global state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
