Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4AC30D7B
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 12:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA8910E102;
	Tue,  4 Nov 2025 11:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ecuZbr++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BC310E5C8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 11:57:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi
 [82.203.160.149])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 365E61771;
 Tue,  4 Nov 2025 12:55:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1762257338;
 bh=mil6O1YCCtchDDrpgObPO3pcuYJvfkebwXhtm8/K8PU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ecuZbr++hco180IzLOTqZrWzhP4piHeawlW+MVvnAG33cGs3h5N0Qih/J82OzWOc1
 n3+3aYdGeXpoRtnKjqEZyGjzLzQ8BwmPbvRtRYy2E8UwbvwV8uPW7tQceFezAyX69Q
 WfcRw5qaKu+PWusL/FfIcQ+iJz8bzZUvVo/ofCHs=
Date: Tue, 4 Nov 2025 13:57:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: airlied@gmail.com, alok.a.tiwari@oracle.com,
 dri-devel@lists.freedesktop.org, geert+renesas@glider.be,
 linux-renesas-soc@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, magnus.damm@gmail.com,
 mripard@kernel.org, simona@ffwll.ch,
 tomi.valkeinen+renesas@ideasonboard.com, tzimmermann@suse.de,
 alok.a.tiwarilinux@gmail.com
Subject: Re: [PATCH next] drm: rcar-du: fix incorrect return in
 rcar_du_crtc_cleanup()
Message-ID: <20251104115729.GB27255@pendragon.ideasonboard.com>
References: <20251017191634.1454201-1-alok.a.tiwari@oracle.com>
 <176098000464.199266.533603860929790380@ping.linuxembedded.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176098000464.199266.533603860929790380@ping.linuxembedded.co.uk>
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

On Mon, Oct 20, 2025 at 06:06:44PM +0100, Kieran Bingham wrote:
> Quoting Alok Tiwari (2025-10-17 20:16:21)
> > The rcar_du_crtc_cleanup() function has a void return type, but
> > incorrectly uses a return statement with a call to drm_crtc_cleanup(),

I don't know if it's incorrect as such, but it makes the code more
readable.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > which also returns void.
> > 
> > Remove the return statement to ensure proper function semantics.
> > No functional change intended.
> > 
> > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> > ---
> >  drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> > index 7e175dbfd892..22bcd7db4195 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> > @@ -993,7 +993,7 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crtc)
> 
> This cleanup is called through .destroy which is:
> 	void (*destroy)(struct drm_crtc *crtc);
> 
> >         rcar_du_crtc_crc_cleanup(rcrtc);
> >  
> > -       return drm_crtc_cleanup(crtc);
> > +       drm_crtc_cleanup(crtc);
> 
> and drm_crtc_cleanup is:
> 	void drm_crtc_cleanup(struct drm_crtc *crtc)
> 
> So it certainly can't return anything:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> >  }
> >  
> >  static void rcar_du_crtc_reset(struct drm_crtc *crtc)

-- 
Regards,

Laurent Pinchart
