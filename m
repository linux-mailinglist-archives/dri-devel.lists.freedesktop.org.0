Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1813A7DF5A7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA2910E8E5;
	Thu,  2 Nov 2023 15:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 700 seconds by postgrey-1.36 at gabe;
 Thu, 02 Nov 2023 15:05:55 UTC
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EE510E8E5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 15:05:55 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 53AC1207BF;
 Thu,  2 Nov 2023 15:56:01 +0100 (CET)
Date: Thu, 2 Nov 2023 15:55:59 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 10/10] drm/tidss: Fix atomic_flush check
Message-ID: <ZUO4f/OjdYW4Paxu@francesco-nb.int.toradex.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-10-45149e0f9415@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101-tidss-probe-v1-10-45149e0f9415@ideasonboard.com>
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 01, 2023 at 11:17:47AM +0200, Tomi Valkeinen wrote:
> tidss_crtc_atomic_flush() checks if the crtc is enabled, and if not,
> returns immediately as there's no reason to do any register changes.
> 
> However, the code checks for 'crtc->state->enable', which does not
> reflect the actual HW state. We should instead look at the
> 'crtc->state->active' flag.
> 
> This causes the tidss_crtc_atomic_flush() to proceed with the flush even
> if the active state is false, which then causes us to hit the
> WARN_ON(!crtc->state->event) check.
> 
> Fix this by checking the active flag, and while at it, fix the related
> debug print which had "active" and "needs modeset" wrong way.

Candidate for stable? Add a Fixes tag?

Francesco

