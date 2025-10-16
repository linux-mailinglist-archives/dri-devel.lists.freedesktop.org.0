Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB4DBE384B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 14:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA7C10E2FA;
	Thu, 16 Oct 2025 12:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="GWCMwNFH";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ze4v26dW";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="QYCr8cDJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="qWEXVRRY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747F610E2FA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 12:55:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E76CB1F8A3;
 Thu, 16 Oct 2025 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760619335;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=62nUrie6sfMiXKNjt/iDz+UpsfCA9hzP9KGlLma+P8g=;
 b=GWCMwNFH1jN28k3hm1cKbpfzMTUVU7NOo1NW7AFglzMUUqHWeY2ZRg4mmnNWvvL6dIDQmw
 kqQ+ZJ5rn4Kmba1stQ0PrjFtAeB6+i63ystRa/vtK9O6qCuVwYMuN47BONpXnFTKzaArkD
 LO1X04daH2zmcuyRKwFoFOeKikI7CwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760619335;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=62nUrie6sfMiXKNjt/iDz+UpsfCA9hzP9KGlLma+P8g=;
 b=Ze4v26dWeRUmQ6VrCdsfY9pQOjUXhj8c6LRLk3Tz82zMd3Fdd2iszAYRtRpYbaZ+PEBspU
 dLboVX+RnKsvssDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760619334;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=62nUrie6sfMiXKNjt/iDz+UpsfCA9hzP9KGlLma+P8g=;
 b=QYCr8cDJWbdT38sWgrKQrrxhKWtsvZYuoIducrg0kn1xXedj6sSRNmZRxgMdp3D4t3Bhfu
 TRkZnhoCwnwtminkQTlGYd3WAMfQ72I+jmCwfdcyTLBq3925Ao50GucaqSOfVW2tRxP+Er
 UQ+rTsUynmSRLsrpN6iW2zngjHkabU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760619334;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=62nUrie6sfMiXKNjt/iDz+UpsfCA9hzP9KGlLma+P8g=;
 b=qWEXVRRYQ0FOGwnGpiC07Bt6pLF1JGPmnrIBCJvDO6shNmELP5E4INrXtP3W60ozEUJmKz
 SSm5I36KfGlDQ4Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72FEE13AE0;
 Thu, 16 Oct 2025 12:55:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Q14pGUbr8GimIwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 16 Oct 2025 12:55:34 +0000
Date: Thu, 16 Oct 2025 14:55:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ville =?iso-8859-2?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/i915/dmc: Use drm_WARN_ONCE()
Message-ID: <20251016125532.GA280868@pevik>
References: <20251015135042.16744-1-pvorel@suse.cz>
 <aO_goOiwQwo41tQW@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO_goOiwQwo41tQW@intel.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[7]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:replyto,imap1.dmz-prg2.suse.org:helo];
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

> On Wed, Oct 15, 2025 at 03:50:42PM +0200, Petr Vorel wrote:
> > assert_dmc_loaded() removed in 43175c92d4038 used drm_WARN_ONCE(),
> > but new assert_dmc_loaded() use drm_WARN().

> > Log is already noise quite a lot due loop over dmc->dmc_info[dmc_id]
> > array (76 logs on my machine), therefore use drm_WARN_ONCE().

> > Fixes: 43175c92d4038 ("drm/i915/dmc: Assert DMC is loaded harder")
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Ville, am I wrong and it's really needed to see all the oops for the
> > threads?

> Kinda irrelevant because this should never happen. So the real
> question we need to ask is why are you seeing this at all?

+1

> Please file a bug at
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues
> and attch the full dmesg with drm.debug=0xe passed to the kernel
> cmdline.

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15153

Kind regards,
Petr
