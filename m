Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1118FBB6865
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 13:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2CE10E268;
	Fri,  3 Oct 2025 11:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="NJuH5dIM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="J/KCovOr";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="NJuH5dIM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="J/KCovOr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB0A10E233
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 11:15:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6FEDA337B0;
 Fri,  3 Oct 2025 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759490130;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r83GKtJstxQw55MsGJyXVAtOf3bzDHvaMkscHjM8kek=;
 b=NJuH5dIMXRdjgS6zeaZxlW7KoQrU7ENNqj1VdyVco3HXJw3nveiOlOlwjbMy5j1CzK262m
 p5cq6Hzx2LWjSvyrVCWKZSyrbt5+F8FQyC2WjhgkyOJqanEe5kWtei/R0oRC8zWfN6j3Kp
 sP/MxQ5mOgKmKDgdZdMVDXBhFVS2EC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759490130;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r83GKtJstxQw55MsGJyXVAtOf3bzDHvaMkscHjM8kek=;
 b=J/KCovOrv4auNdO2xkuS4DpEEjNtmrUM67UHVH5r+k3/h1BZnbLZcP2zqPAYDzcw0Ui5ow
 612V897hbDpXSRAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=NJuH5dIM;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="J/KCovOr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759490130;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r83GKtJstxQw55MsGJyXVAtOf3bzDHvaMkscHjM8kek=;
 b=NJuH5dIMXRdjgS6zeaZxlW7KoQrU7ENNqj1VdyVco3HXJw3nveiOlOlwjbMy5j1CzK262m
 p5cq6Hzx2LWjSvyrVCWKZSyrbt5+F8FQyC2WjhgkyOJqanEe5kWtei/R0oRC8zWfN6j3Kp
 sP/MxQ5mOgKmKDgdZdMVDXBhFVS2EC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759490130;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r83GKtJstxQw55MsGJyXVAtOf3bzDHvaMkscHjM8kek=;
 b=J/KCovOrv4auNdO2xkuS4DpEEjNtmrUM67UHVH5r+k3/h1BZnbLZcP2zqPAYDzcw0Ui5ow
 612V897hbDpXSRAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E322913990;
 Fri,  3 Oct 2025 11:15:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bYE6NVGw32ixHwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 03 Oct 2025 11:15:29 +0000
Date: Fri, 3 Oct 2025 13:15:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lyude@redhat.com, dakr@kernel.org, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] drm/nouveau: Do not include drm_fb_helper.h
Message-ID: <20251003111520.GB30176@pevik>
References: <20250930131428.111160-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930131428.111160-1-tzimmermann@suse.de>
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 MISSING_XM_UA(0.00)[]; ARC_NA(0.00)[]; REPLYTO_EQ_FROM(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_FIVE(0.00)[6]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:replyto,suse.cz:dkim,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 6FEDA337B0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.71
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> The driver doesn't need anything from <drm/drm_fb_helper.h>. Remove
> the include directive.

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 1 -
>  1 file changed, 1 deletion(-)

> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index e97e39abf3a2..1d4d1bb63326 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -40,7 +40,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_eld.h>
> -#include <drm/drm_fb_helper.h>
>  #include <drm/drm_fixed.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>

it looks to me that at least these 3 aren't needed either:

#include <drm/display/drm_dp_helper.h>
#include <drm/drm_atomic.h>
#include <drm/drm_fixed.h>

But maybe I miss something obvious.

Kind regards,
Petr


