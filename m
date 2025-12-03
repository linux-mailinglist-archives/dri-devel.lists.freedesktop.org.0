Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21C3C9D8FF
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 03:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096EA10E06E;
	Wed,  3 Dec 2025 02:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vRreKgKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9AB10E06E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 02:18:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (p100198.f.east.v6connect.net
 [221.113.100.198])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3945AB5;
 Wed,  3 Dec 2025 03:16:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764728180;
 bh=nbhD/gJt0xzvyf/ivwEZpU1nTzxjFkl17xY/nkr6DBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vRreKgKG0r/og+VBnXUtIOVo7Ngfv+ogJAA6A4KKGekyMhJ3Bb0NBXe8MNrVArOew
 ETqhz+XqfIcBORSeEdjGgkVM7zHzfvfzKg4sbCy8b147SO4XSO79Oq04dcOj6pr7+e
 GSBx2GBCZdTe8ab/kzhIOOvIdS3RSgJYQsrxsT0k=
Date: Wed, 3 Dec 2025 11:17:38 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Message-ID: <20251203021738.GI8219@pendragon.ideasonboard.com>
References: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
 <20251202063403.GA18267@pendragon.ideasonboard.com>
 <CAD++jLn5NmPubNm_hv9xCSvbY9pAKj_GLFWC1Hq5YP6ZHP=UZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLn5NmPubNm_hv9xCSvbY9pAKj_GLFWC1Hq5YP6ZHP=UZg@mail.gmail.com>
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

On Tue, Dec 02, 2025 at 09:35:26PM +0100, Linus Walleij wrote:
> On Tue, Dec 2, 2025 at 7:34 AM Laurent Pinchart wrote:
> > We now have a third platform broken by
> > c9b1150a68d9362a0827609fc0dc1664c0d8bfe1, see [1]. I think this calls
> > for a revert, to give us the time to implement a correct solution.
> >
> > [1] https://lore.kernel.org/r/CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvCnfF3pBRA@mail.gmail.com
> 
> This is a mess.
> 
> But OK let's see if we can deal with the mess.
> 
> I will make an RFT patch for Rockchip as well and resend at the
> tail of the patch series if we want to try to fix also that one.

What bothers me here is that we're rushing to fix three different
platforms, with others possibly broken as well, in a way that nobody
really likes. That's why I think a revert would be better, to give us
the time to then design a proper solution.

-- 
Regards,

Laurent Pinchart
