Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F5BC2BBF
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 23:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E915510E12B;
	Tue,  7 Oct 2025 21:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="tc1cRKtx";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="aPxvBVdt";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="tc1cRKtx";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="aPxvBVdt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B730A10E12B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 21:23:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 33EE8336F1;
 Tue,  7 Oct 2025 21:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759872209;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fSW6s0xFTBjNpOrglwzoHKOoMpDQchDWIDZB/oPFhRw=;
 b=tc1cRKtx6tL8LoF7fN/wSJukiw0lfxeERLcCDxrpswbM6n5eqZgeEGbx0TF0kaPvqc8aIc
 XwVUWX7E8vw0fqjUOnJq27K3lBZDRhnXqQgsLzf5WSIpSIb8ZtF+cKL+GN192kjgEWNuJm
 Dq5Do2khlOOMj0jAAgCc6a1Jspg2b9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759872209;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fSW6s0xFTBjNpOrglwzoHKOoMpDQchDWIDZB/oPFhRw=;
 b=aPxvBVdtmPLMCzW5SW71b19JlqaStxWuHxcePDu/iU9wmbpeYwGvBrEJi2humL/HQz5OjL
 PD1MpQPrpR0AetAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759872209;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fSW6s0xFTBjNpOrglwzoHKOoMpDQchDWIDZB/oPFhRw=;
 b=tc1cRKtx6tL8LoF7fN/wSJukiw0lfxeERLcCDxrpswbM6n5eqZgeEGbx0TF0kaPvqc8aIc
 XwVUWX7E8vw0fqjUOnJq27K3lBZDRhnXqQgsLzf5WSIpSIb8ZtF+cKL+GN192kjgEWNuJm
 Dq5Do2khlOOMj0jAAgCc6a1Jspg2b9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759872209;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fSW6s0xFTBjNpOrglwzoHKOoMpDQchDWIDZB/oPFhRw=;
 b=aPxvBVdtmPLMCzW5SW71b19JlqaStxWuHxcePDu/iU9wmbpeYwGvBrEJi2humL/HQz5OjL
 PD1MpQPrpR0AetAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB7DB13693;
 Tue,  7 Oct 2025 21:23:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wdEfHc+E5WhSNQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 07 Oct 2025 21:23:27 +0000
Date: Tue, 7 Oct 2025 23:23:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Alexandr Sapozhnkiov <alsp705@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10] gpu/i915: fix error return in mmap_offset_attach()
Message-ID: <20251007212325.GA160168@pevik>
References: <20251002084828.11-1-alsp705@gmail.com>
 <ris5iw6gdn7squdjpo5kapdyd7jqwbzy3kbpnzspp7jhpm4tlj@osq47p45ydcv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ris5iw6gdn7squdjpo5kapdyd7jqwbzy3kbpnzspp7jhpm4tlj@osq47p45ydcv>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[13]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,intel.com,ursulin.net,ffwll.ch,lists.freedesktop.org,vger.kernel.org,linuxtesting.org];
 MISSING_XM_UA(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
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

> Hi,

> On Thu, Oct 02, 2025 at 11:48:26AM +0300, Alexandr Sapozhnkiov wrote:
> > From: Alexandr Sapozhnikov <alsp705@gmail.com>

> > In the drm_vma_node_allow function, kmalloc may 
> > return NULL, in which case the file element will not be 
> > added to the mmo->vma_node list. It would be good to 
> > not ignore this event, but at least log an error message.

> > Found by Linux Verification Center (linuxtesting.org) with SVACE.

> > Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)

> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > index a2195e28b625..adaef8f09d59 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > @@ -706,8 +706,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
> >  	mmo = insert_mmo(obj, mmo);
> >  	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
> >  out:
> > -	if (file)
> > -		drm_vma_node_allow_once(&mmo->vma_node, file);
> > +	if (file) {
> > +		err = drm_vma_node_allow_once(&mmo->vma_node, file);
> > +		if (err)
> > +			goto err;
> > +	}

> NACK here! You have received several reviews on this patch and
> didn't react to them. Please, read carefully the reviews you
> received and send a second version of the patch.

> Please do use versioning properly in your title and add a
> changelog.

> Before sending patches, please read the documentation[*].

> Andi

> [*] https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html

Maybe read the latest version.
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Kind regards,
Petr

> >  	return mmo;

> >  err:
> > -- 
> > 2.43.0

