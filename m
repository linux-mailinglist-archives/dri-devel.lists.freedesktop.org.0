Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9D8BB6820
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 13:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFED10E1EF;
	Fri,  3 Oct 2025 11:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="VwHizkjY";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Lr8UwJae";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="I08jPr+h";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="P/3dqk0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C72110E1EF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 11:01:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8BC88336C1;
 Fri,  3 Oct 2025 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759489286;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q9EHwg6nZFD1wbnALASrBA56ZW/idcZkiQjF/u0eVKc=;
 b=VwHizkjY5wku3ZDXoreZd8xDcOMhm4uNxlHJ8TtMglS5F7LMaeyYwr37U6/rJBtHu382RS
 aGWHg1aZDbwAy70bJJvPe3oGk/t1zGGcqt9Guc5dW8wP89e6+xYMLq+KANlP/v3OU+V7u+
 RvSe1t9XowE+5Emkp0o3cVv6ZbYgFe4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759489286;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q9EHwg6nZFD1wbnALASrBA56ZW/idcZkiQjF/u0eVKc=;
 b=Lr8UwJaeRzr1S5oc7Sp/g8APsIZ3MIgs5MEsWKqVm2OyOZ17wAndDtbjDgacEWFNkKxTyC
 vvJrpRec5DJ82SBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=I08jPr+h;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="P/3dqk0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759489285;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q9EHwg6nZFD1wbnALASrBA56ZW/idcZkiQjF/u0eVKc=;
 b=I08jPr+hyGM/AzWC+3u7EDuYE++zjRYL9Ub7uoh9FRL8OXIDTrk8kaulH15KAXUH2BZVVt
 ZxT07t6HcONozFCXeriUVY7eS8RX/FSIwXfbRK6NvelSLU/cZlckTWA3vpKxhZ7TUnOMo3
 yWK0+G6NB+co6vj/Rt1vP4K2tSfbZyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759489285;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q9EHwg6nZFD1wbnALASrBA56ZW/idcZkiQjF/u0eVKc=;
 b=P/3dqk0jdq8KrT+a9r10zxG1HX4A2jvNvchzjFWriwyhlIu7ti0Mb9Z/9EIWv5u05wB70t
 Pt1WtNMVpJBgAiAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0940D13990;
 Fri,  3 Oct 2025 11:01:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sVX6AAWt32jkGwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 03 Oct 2025 11:01:25 +0000
Date: Fri, 3 Oct 2025 13:01:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lyude@redhat.com, dakr@kernel.org, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] drm/nouveau: Do not include drm_fb_helper.h
Message-ID: <20251003110119.GA30176@pevik>
References: <20250930131428.111160-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930131428.111160-1-tzimmermann@suse.de>
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8BC88336C1
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim,suse.cz:email,suse.cz:replyto];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.cz:+]; MISSING_XM_UA(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
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

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr
...
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -40,7 +40,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_eld.h>
> -#include <drm/drm_fb_helper.h>
