Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLYvOHLhc2lUzQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:00:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A487ACE3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933F510EBDF;
	Fri, 23 Jan 2026 21:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="Eo4RfvsH";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="YptXpZtq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E14F10E2EC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 21:00:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-5nnv.prod.antispam.mailspamprotection.com;
 s=arckey; t=1769202029; 
 b=kiqdopyXfzZeEsLhR9naeaO2EgT2A4RJezf3PcpwAQosy9U34vBYRWYChDOXul5UIKF2mjOYy0
 jOUhKBndyjAwrHrwP+pAP8DkWATs3z/Js9uxJauoDUyBQK+wzCC4ZeRZzZMABakcaPz/P8YlNV
 UvC8rl01ynixml36i4vMtiAt7nRclNyk/HPDBRIPcSJym6aFcKLZIjUoaIDMxLoOccWIaBmHtv
 GOGxLPqMA7JQ9D7i1y3D85FIdjuerzC2W7vLVmdMNtW75VEL0eq0UVtZuChHy6EjfXQqjW6IWC
 nNjPRPcZeWeGzorAwTPdpdnxnFy5iLHlX8oCJB37dvDYYw==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-5nnv.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-5nnv.prod.antispam.mailspamprotection.com;
 s=arckey; t=1769202029; 
 bh=CqTT7cWwu16mdwerni7Oo2LG+q1ewbjk+4Q9cn4O3e8=;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
 From:Date:DKIM-Signature:DKIM-Signature;
 b=Qjj8rTp0CSJIk4Ta/uz8YsXuqt6hLnGRhLipRfWDp6cbGoUTGW0eyq+tmfDrSiFnAFt6kZo4sh
 ht6BBEE8Q9kNwpIdhlnQ4LlUQzA1SAHYvF4+75qiNJM9+6ZWJtLyNSF6WBACfrZD7+vKpmWGbm
 zPd7PJOlX/gcTf3nZMPg2ezNkmvq2KMK13jckSCPmlAixEB/f4vrM/b40R5pb9lNfCoxmkAGIp
 +K5lP980f6UuYrqeWSI0nff+BmrzgD745oxZh7Y7a5lSUjgLMb2zrso1S5YJaO/HVWde7kIeJZ
 e7TPkLQ0QBUjFTgwMjC8TrXtZ5R/hVG4geUvYGvz2Hc0dQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 List-Unsubscribe:Content-Transfer-Encoding;
 bh=Znn4tqkGUcgabiI24TDvOgOm/7lC7GjaaWy+L2yLzEo=; b=Eo4RfvsH8IcBeb05S9kWWiyU7L
 IgUwhjnPsj6DgndG9z3d+DVN2Zpf9QmaW0JhLC0la9vgGF6Junak0Zu5n5+FKtB2Do+4c1IU5QZ/k
 peFhz0dLaYWv7OoDrr2Ma1iQom++F+074nwyfxFrqlGGUC6s6grJvpbYH/ugi50nKbKE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-5nnv.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vjOGX-00000001RZj-2uZ6
 for dri-devel@lists.freedesktop.org; Fri, 23 Jan 2026 21:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=Znn4tqkGUcgabiI24TDvOgOm/7lC7GjaaWy+L2yLzEo=; b=YptXpZtq7nyKAA4PvGMA9BW93E
 qZ5b9FYlt4RZUVG9AaFPW4zrBs8FiXdTcISXeAOwHoR6OW12L0lYYPGKnbqh9lSG5zged0lWnO13O
 tig57yRqhIyonmaPd5Vm1YKOYJ8T9+CZXnkDjK+SpBMlTXJWp+7TqUJy1GFG4zgsFB1g=;
Received: from [95.251.204.145] (port=63454 helo=bywater)
 by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.1) (envelope-from <francesco@valla.it>)
 id 1vjOFy-000000003Ws-3AwI; Fri, 23 Jan 2026 20:59:50 +0000
Date: Fri, 23 Jan 2026 21:59:47 +0100
From: Francesco Valla <francesco@valla.it>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/3] drm: client: add splash client
Message-ID: <aXPhQ-KQOBobMBMh@bywater>
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
 <20260106-drm_client_splash-v2-1-6e86a7434b59@valla.it>
 <20260122-scallop-of-original-domination-3a554a@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-scallop-of-original-domination-3a554a@houat>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 374b30fd9507109a598aa165777cdaf6
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vjOGX-00000001RZj-2uZ6-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-5nnv.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_ALLOW(-1.00)[outgoing.instance-europe-west4-5nnv.prod.antispam.mailspamprotection.com:s=arckey:i=1];
	R_DKIM_REJECT(1.00)[antispam.mailspamprotection.com:s=default,valla.it:s=default];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[valla.it : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:jfalempe@redhat.com,m:javierm@redhat.com,m:sam@ravnborg.org,m:mario.limonciello@amd.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-embedded@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[francesco@valla.it,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,redhat.com,ravnborg.org,amd.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[antispam.mailspamprotection.com:-,valla.it:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francesco@valla.it,dri-devel-bounces@lists.freedesktop.org];
	HAS_X_SOURCE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_X_ANTIABUSE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.988];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 48A487ACE3
X-Rspamd-Action: no action

Hi Maxime,

On Thu, Jan 22, 2026 at 02:36:56PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Jan 06, 2026 at 03:25:40PM +0100, Francesco Valla wrote:
> > Add a DRM client that draws a simple splash, with possibility to show:
> > 
> >   - a colored background;
> >   - a static BMP image (loaded as firmware);
> >   - the logo provided by EFI BGRT.
> > 
> > The client is not meant to replace a full-featured bootsplash, but
> > rather to remove some complexity (and hopefully boot time) on small
> > embedded platforms or on systems with a limited scope (e.g: recovery
> > or manufacturing images).
> > 
> > The background color can be set either at build time from a dedicated
> > config option or at runtime through the drm_client_lib.splash_color
> > command line parameter. Any color in RGB888 format can be used.
> > 
> > If enabled, the static BMP image is loaded using the kernel firmware
> > infrastructure; a valid BMP image with 24bpp color and no compression
> > is expected. The name of the image can be set through the
> > drm_client_lib.splash_bmp kernel command line parameter, with the
> > default being 'drm_splash.bmp'.
> > 
> > Just like the existing DRM clients, the splash can be enabled from the
> > kernel command line using drm_client_lib.active=splash.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/gpu/drm/clients/Kconfig               |  79 ++-
> >  drivers/gpu/drm/clients/Makefile              |   1 +
> >  drivers/gpu/drm/clients/drm_client_internal.h |   9 +
> >  drivers/gpu/drm/clients/drm_client_setup.c    |   8 +
> >  drivers/gpu/drm/clients/drm_splash.c          | 883 ++++++++++++++++++++++++++
> >  5 files changed, 979 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
> > index 6096c623d9d5b1a3d4a40d986c45aad2f8277767..dd8cd6cacd1166932eb3890dd816b9ae2d26330f 100644
> > --- a/drivers/gpu/drm/clients/Kconfig
> > +++ b/drivers/gpu/drm/clients/Kconfig
> > @@ -12,6 +12,7 @@ config DRM_CLIENT_LIB
> >  config DRM_CLIENT_SELECTION
> >  	tristate
> >  	depends on DRM
> > +	select DRM_CLIENT_LIB if DRM_CLIENT_SPLASH
> >  	select DRM_CLIENT_LIB if DRM_CLIENT_LOG
> >  	select DRM_CLIENT_LIB if DRM_FBDEV_EMULATION
> >  	help
> > @@ -85,10 +86,79 @@ config DRM_CLIENT_LOG
> >  	  If you only need logs, but no terminal, or if you prefer userspace
> >  	  terminal, say "Y".
> >  
> > +config DRM_CLIENT_SPLASH
> > +	bool "Display graphic splash"
> > +	depends on DRM_CLIENT_SELECTION
> > +	select DRM_CLIENT
> > +	select DRM_CLIENT_SETUP
> > +	select DRM_DRAW
> > +	help
> > +	  This enables a splash drm client, able to display either a plain
> > +	  color or a static image until the userspace is ready to take over.
> > +	  The splash will be displayed on all screens available at boot, if
> > +	  any, or on the ones part of the first hotplug event.
> > +
> > +config DRM_CLIENT_SPLASH_BACKGROUND_COLOR
> > +	hex "Splash background color"
> > +	depends on DRM_CLIENT_SPLASH
> > +	default 0x000000
> > +	help
> > +	  The default splash background color, in RGB888 format.
> > +
> > +	  The color can be overridden through the drm_client_lib.splash_color
> > +	  kernel command line parameter.
> > +
> > +config DRM_CLIENT_SPLASH_BMP_SUPPORT
> > +	bool
> > +
> > +choice
> > +	prompt "Splash source"
> > +	depends on DRM_CLIENT_SPLASH
> > +	default DRM_CLIENT_SPLASH_SRC_COLOR
> > +	help
> > +	  Selects the source for the splash graphic.
> > +
> > +config DRM_CLIENT_SPLASH_SRC_COLOR
> > +	bool "Solid color"
> > +	help
> > +	  Use a solid color as splash. The color is selected through the
> > +	  DRM_CLIENT_SPLASH_BACKGROUND_COLOR config option.
> > +
> > +	  The image will be loaded using the firmware loading facility the
> > +	  kernel provides.
> > +
> > +config DRM_CLIENT_SPLASH_SRC_BMP
> > +	bool "BMP image"
> > +	select DRM_CLIENT_SPLASH_BMP_SUPPORT
> > +	select FW_LOADER
> > +	help
> > +	  Use a BMP (bitmap) image as splash. If the image is smaller than the
> > +	  display(s), it will be centered and the color specified through the
> > +	  DRM_CLIENT_SPLASH_BACKGROUND_COLOR config option will be used as
> > +	  background.
> > +
> > +	  The image will be loaded using the firmware loading facility the
> > +	  kernel provides; it shall use 24 bits per pixel and shall not be
> > +	  compressed. The name of the file can be set through the
> > +	  drm_client_lib.splash_bmp command line parameter, with the default
> > +	  being 'drm_splash.bmp'.
> > +
> > +config DRM_CLIENT_SPLASH_SRC_BGRT
> > +	bool "EFI BGRT"
> > +	select DRM_CLIENT_SPLASH_BMP_SUPPORT
> > +	depends on EFI
> > +	help
> > +	  Use the BGRT image provided by the EFI bootloader. If the image is
> > +	  smaller than the display(s), it will be centered and the color
> > +	  specified through the DRM_CLIENT_SPLASH_BACKGROUND_COLOR config
> > +	  option will be used as background.
> > +
> > +endchoice
> 
> I'm not sure we should consider it a xor choice. If we do, that means
> that it's effectively unusable by distros, since you don't know ahead of
> time if the platform it's going to boot on will have a BGRT or not.
> 
> Trying BGRT, and then falling back to either an image or a solid
> background would be easier to work with.
>

Thanks for the feedback!

Also considering that BGRT requires some logic to work properly, which
is not present in this version (and here I am referring mostly to the
rotation/positioning quirks), I think I'll go down this very route for
the next version and get rid of the function pointer logic.
The idea was to avoid ifdefs _and_ be open for future expansions, but
in the end it would probably look ugly.

> Maxime

Regards,
Francesco

