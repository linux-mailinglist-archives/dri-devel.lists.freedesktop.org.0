Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5180DCCD845
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 21:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A08510EB43;
	Thu, 18 Dec 2025 20:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="R1dB4sf9";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="KLmC+XZw";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="m2AV1reB";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="pGDrHNC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C7010EB43
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 20:24:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EB6BC3369D;
 Thu, 18 Dec 2025 20:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1766089457;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZU3BqqLGPheJCdDQ8t7eYRIzLyzYKNVYksKlHPTuHA4=;
 b=R1dB4sf9mfAcw1P82r/QTHuIgH19/quEpfUcEo5CoxRmcxmeOhMAL9sNxu+aLUQdtjk+Qr
 xNP7apmpi/TcA7PnbOZufSTn2BH6wh9c2Aj67bZjcNdfjBNR/ZYdWS/jLBUk9YKCCRukEN
 w6Q5d1P5LaGUmcHEkncpUf67VEOVm+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1766089457;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZU3BqqLGPheJCdDQ8t7eYRIzLyzYKNVYksKlHPTuHA4=;
 b=KLmC+XZwpbrArd/ao1ybzSdWTPPeBFBUDROsAdiz8sVViknkWMc8xHtzLHZfXfdodGQNic
 7jI/yHM0QK6VrcAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1766089456;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZU3BqqLGPheJCdDQ8t7eYRIzLyzYKNVYksKlHPTuHA4=;
 b=m2AV1reBAqK9FeMAHaWwTK9XebHo0jm9URZaUepPWYOZ8b9ZcikgTgeu5hdyDLGUAnnG0R
 dM4zVexojF1Whwd/pTCtZN6yATuocMtRG+J4eyxv+lGP7kXT3mtsiqKXB8A3N6TzvqWrKb
 dcrLW53N2ye4J6uzRvvJ94ZnOAxgXvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1766089456;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZU3BqqLGPheJCdDQ8t7eYRIzLyzYKNVYksKlHPTuHA4=;
 b=pGDrHNC0P3Nmn3AtGB7C3W1HNHv65Jg6IkWKCOh4Lq/5vmzef6hwPzH5RyrrbfGrGgXdoi
 vTpYiq187cf9rgAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C6CB33EA63;
 Thu, 18 Dec 2025 20:24:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IvFKMPBiRGnUWQAAD6G6ig
 (envelope-from <dsterba@suse.cz>); Thu, 18 Dec 2025 20:24:16 +0000
Date: Thu, 18 Dec 2025 21:24:15 +0100
From: David Sterba <dsterba@suse.cz>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: cleanup local -Wno-type-limits exceptions
Message-ID: <20251218202415.GQ3195@twin.jikos.cz>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218-remove_wtype-limits-v1-2-735417536787@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-remove_wtype-limits-v1-2-735417536787@kernel.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spamd-Result: default: False [-2.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 HAS_REPLYTO(0.30)[dsterba@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[lkml]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[20]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linux.intel.com,suse.de,ffwll.ch,fb.com,suse.com,linux-foundation.org,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; REPLYTO_ADDR_EQ_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,suse.cz:replyto];
 RCVD_COUNT_TWO(0.00)[2]; REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.50
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
Reply-To: dsterba@suse.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 18, 2025 at 07:50:02PM +0100, Vincent Mailhol wrote:
> Now that -Wno-type-limits is globally deactivated, there is no need
> for local exceptions anymore.
> 
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---

>  fs/btrfs/Makefile        | 1 -

Acked-by: David Sterba <dsterba@suse.com>
