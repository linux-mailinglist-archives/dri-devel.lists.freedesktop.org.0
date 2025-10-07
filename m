Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A08BC1E42
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B6310E6EF;
	Tue,  7 Oct 2025 15:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="lAG0BcZ4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="YDVfWEjp";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="lAG0BcZ4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="YDVfWEjp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CDB10E6E5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:20:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 59B4F1F38F;
 Tue,  7 Oct 2025 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759850423;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iQc0YRJr7IJHOyz4OppGQkW0tWxTiIJn5XmaoGwBjS4=;
 b=lAG0BcZ4FjfT3tnysBTEvSnxqZGB9x2gDzP3Sc1I3J6/TzO29zunuKpk12k1SkSFpBJv6p
 DVVwPXrURoX5HESTPo7rV2Vi/JInQJXcTG8Kre86MelbJFgZUkArGudSLZUaWR+o7TcKrv
 poWWmGmlSa9DRU2AhzOGQg0jqdU/jTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759850423;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iQc0YRJr7IJHOyz4OppGQkW0tWxTiIJn5XmaoGwBjS4=;
 b=YDVfWEjpewz5QgRZyehDGqnlndL38xs45wRXPPBvlqtB2ZfQ9j7KNuSN5HvqX1bK4E35nI
 l2NnYe1u57d40rCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759850423;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iQc0YRJr7IJHOyz4OppGQkW0tWxTiIJn5XmaoGwBjS4=;
 b=lAG0BcZ4FjfT3tnysBTEvSnxqZGB9x2gDzP3Sc1I3J6/TzO29zunuKpk12k1SkSFpBJv6p
 DVVwPXrURoX5HESTPo7rV2Vi/JInQJXcTG8Kre86MelbJFgZUkArGudSLZUaWR+o7TcKrv
 poWWmGmlSa9DRU2AhzOGQg0jqdU/jTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759850423;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iQc0YRJr7IJHOyz4OppGQkW0tWxTiIJn5XmaoGwBjS4=;
 b=YDVfWEjpewz5QgRZyehDGqnlndL38xs45wRXPPBvlqtB2ZfQ9j7KNuSN5HvqX1bK4E35nI
 l2NnYe1u57d40rCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B60DF13693;
 Tue,  7 Oct 2025 15:20:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lYhSKLYv5WjUTAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 07 Oct 2025 15:20:22 +0000
Date: Tue, 7 Oct 2025 17:20:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "airlied@gmail.com" <airlied@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
Message-ID: <20251007152021.GA139177@pevik>
References: <20251007013207.1469618-1-airlied@gmail.com>
 <d57eb562b87f9c3ead50acc81d76526e947d0ab9.camel@nvidia.com>
 <CAPM=9tx3Q4NdAc5NDGUjdjOH-ZPagKNu43+zOUZTVcpEO9zSsQ@mail.gmail.com>
 <a02a0105aed482a977b06e66391b35e5a6f39cd0.camel@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a02a0105aed482a977b06e66391b35e5a6f39cd0.camel@nvidia.com>
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 MISSING_XM_UA(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,kernel.org];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_FIVE(0.00)[5];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,imap1.dmz-prg2.suse.org:helo]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
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

Hi all,

> On Tue, 2025-10-07 at 13:31 +1000, Dave Airlie wrote:
> > We can't do that, because if we moved to 580, and distros have this
> > option on for 570, they would fail unless they had the 580 firmware,
> > so it needs to be versioned.

> Hmmm then how about making it a choice of which version to support:

> choice
>   prompt "Firmware version supported"
>   default DRM_NOUVEAU_ANY

You probably know it, in case you don't: DRM_NOUVEAU_ANY needs to be also as
config:

config DRM_NOUVEAU_ANY
	bool "Support all firmware versions"
	...

> config DRM_NOUVEAU_535_ONLY
> ...

> config DRM_NOUVEAU_535_ONLY
> ...

> endchoice

+1

> Or something like that.  I can't figure out how choices work, but the idea is that the defconfig

Kind regards,
Petr

> defaults to allowing all versions, but you can pick a specific one.

