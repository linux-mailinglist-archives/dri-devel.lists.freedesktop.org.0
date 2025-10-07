Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A8ABC28E6
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 21:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2716510E372;
	Tue,  7 Oct 2025 19:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="qoL0TY5Q";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ug7Cvqmm";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="qoL0TY5Q";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ug7Cvqmm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE13910E043
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 19:52:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 45FAF1F38F;
 Tue,  7 Oct 2025 19:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759866755;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1/6ycznNAaNzZ2Kw9ftZKFBuaKypa6S9AHLf5Pa9sGA=;
 b=qoL0TY5QaSPvWiJtSGufq7eVuQcA/6LWen9M/JjYE0PQLkdqjbT0q/t5xPLEn9JLdtJLjP
 csMO4ZWFoaACo7fT9RVozt8IRKXPO1BOwII8NlEbU+RMaNI7h+VpgvLYhJ3WW8urVno5K+
 jGaIBHOamiKF9hoXxwZmSwGghVvsusA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759866755;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1/6ycznNAaNzZ2Kw9ftZKFBuaKypa6S9AHLf5Pa9sGA=;
 b=ug7CvqmmbG8EyqlF1hrah6xb1bGpKOI+y+g3FuaeJ+e5F8328EAaQjvt0HS7aHtoiG+NH1
 CTRIpSuOwcd9JRBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759866755;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1/6ycznNAaNzZ2Kw9ftZKFBuaKypa6S9AHLf5Pa9sGA=;
 b=qoL0TY5QaSPvWiJtSGufq7eVuQcA/6LWen9M/JjYE0PQLkdqjbT0q/t5xPLEn9JLdtJLjP
 csMO4ZWFoaACo7fT9RVozt8IRKXPO1BOwII8NlEbU+RMaNI7h+VpgvLYhJ3WW8urVno5K+
 jGaIBHOamiKF9hoXxwZmSwGghVvsusA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759866755;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1/6ycznNAaNzZ2Kw9ftZKFBuaKypa6S9AHLf5Pa9sGA=;
 b=ug7CvqmmbG8EyqlF1hrah6xb1bGpKOI+y+g3FuaeJ+e5F8328EAaQjvt0HS7aHtoiG+NH1
 CTRIpSuOwcd9JRBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C100F13693;
 Tue,  7 Oct 2025 19:52:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gzQ6K4Jv5WiIHAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 07 Oct 2025 19:52:34 +0000
Date: Tue, 7 Oct 2025 21:52:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Shuhao Fu <sfual@cse.ust.hk>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH] drm/nouveau: fix bad ret code in nouveau_bo_move_prep
Message-ID: <20251007195233.GA154142@pevik>
References: <aOU9BXjYDNoPRQmf@homelab>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOU9BXjYDNoPRQmf@homelab>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[7]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -3.50
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

[ Cc Ben ]

> In `nouveau_bo_move_prep`, if `nouveau_mem_map` fails, an error code
> should be returned. Currently, it returns zero even if vmm addr is not
> correctly mapped.

> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> Fixes: 9ce523cc3bf2 ("drm/nouveau: separate buffer object backing memory from nvkm structures")
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index b96f0555ca14..f26562eafffc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -929,7 +929,7 @@ nouveau_bo_move_prep(struct nouveau_drm *drm, struct ttm_buffer_object *bo,
>  		nvif_vmm_put(vmm, &old_mem->vma[1]);
>  		nvif_vmm_put(vmm, &old_mem->vma[0]);
>  	}
> -	return 0;
> +	return ret;

LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr
