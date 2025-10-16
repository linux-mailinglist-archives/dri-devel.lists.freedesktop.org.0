Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB141BE21FA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DD910E2DA;
	Thu, 16 Oct 2025 08:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="JmwB9YU3";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WNXRSSLy";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JmwB9YU3";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="WNXRSSLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812DC10E2DA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:21:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4581E21992;
 Thu, 16 Oct 2025 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760602873;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qNtRHXW1ZEHasrajMZinxSaj7H8IKNLZBLBe6Cv+2ss=;
 b=JmwB9YU3Tegva1W3+6Ham+5n4ZniEv8INBGjWUbUXaspxEMy2MpV3XaCV0QsP1UJoHEsv3
 FDmlMWeKnzWbCnKEpnwuvRsw2hRdibct1MwVzDpoXnueZ8Xbeerov3BZHGsGtNRoQEcj0+
 dr6NgwgT/LWRbx29BZzVArhpxXD+9lU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760602873;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qNtRHXW1ZEHasrajMZinxSaj7H8IKNLZBLBe6Cv+2ss=;
 b=WNXRSSLyPc/yXBDwlGIvD4YO96X6kcVYsRXs1UVazRWKY11L9KM4JIp7lZO4qtqtpu/b6O
 Gq7o/pj8lBNnFdDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760602873;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qNtRHXW1ZEHasrajMZinxSaj7H8IKNLZBLBe6Cv+2ss=;
 b=JmwB9YU3Tegva1W3+6Ham+5n4ZniEv8INBGjWUbUXaspxEMy2MpV3XaCV0QsP1UJoHEsv3
 FDmlMWeKnzWbCnKEpnwuvRsw2hRdibct1MwVzDpoXnueZ8Xbeerov3BZHGsGtNRoQEcj0+
 dr6NgwgT/LWRbx29BZzVArhpxXD+9lU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760602873;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qNtRHXW1ZEHasrajMZinxSaj7H8IKNLZBLBe6Cv+2ss=;
 b=WNXRSSLyPc/yXBDwlGIvD4YO96X6kcVYsRXs1UVazRWKY11L9KM4JIp7lZO4qtqtpu/b6O
 Gq7o/pj8lBNnFdDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8700C1376E;
 Thu, 16 Oct 2025 08:21:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id w9vCHPiq8GipDwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 16 Oct 2025 08:21:12 +0000
Date: Thu, 16 Oct 2025 10:21:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?iso-8859-2?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] mei: intel_lb_mei_interface.h: mark struct member with
 kernel-doc
Message-ID: <20251016082110.GA256560@pevik>
References: <20251016035942.1148176-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016035942.1148176-1-rdunlap@infradead.org>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,intel.com,linux.intel.com,ursulin.net,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.cz:replyto];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
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

...
> Use correct kernel-doc notation to prevent 3 kernel-doc warnings.
> @push_payload is a struct member here, not a function, so use '@'
> and ':' in its description.

>  struct intel_lb_component_ops {
>  	/**
> -	 * push_payload - Sends a payload to the authentication firmware
> +	 * @push_payload: Sends a payload to the authentication firmware

Obviously correct.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

>  	 * @dev: Device struct corresponding to the mei device
>  	 * @type: Payload type (see &enum intel_lb_type)
>  	 * @flags: Payload flags bitmap (e.g. %INTEL_LB_FLAGS_IS_PERSISTENT)
