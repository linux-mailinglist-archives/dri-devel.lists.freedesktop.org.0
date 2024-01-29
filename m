Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DBE83FF95
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 09:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992C111251B;
	Mon, 29 Jan 2024 08:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 613 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jan 2024 08:05:24 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3928211251B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 08:05:24 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E512F22009;
 Mon, 29 Jan 2024 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706514879;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OcDPuDxI6AGFAM73OJg3OdByb6XRoKn9BIxXoVm50Eg=;
 b=iuAouQQ5JrZzjA3PyBpQyG78kLzj1qghUdpXecNYuUPKy5rxdR375P/q/whFV4zLHreM2E
 DAun9YmyWxsusgdqYDF9Eh5FrNf8ejHUoskTob07PjYMC8Gcrj5UF/VzO/knF/hd6MaZPq
 e9XFxZqbqC/yCIxNPmleId1n81MjCZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706514879;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OcDPuDxI6AGFAM73OJg3OdByb6XRoKn9BIxXoVm50Eg=;
 b=aUEYNvl2odurgExx0gog7hIoRiBov4bu/+K52cZk9CQLPbyg5cQr+o1282tPs4T2QrYo/Q
 iz5/YsoUQDh+1jAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706514876;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OcDPuDxI6AGFAM73OJg3OdByb6XRoKn9BIxXoVm50Eg=;
 b=tuxm7eM5A8+iwM9Z+lrSnYN63//kVQ5Mqsnjo50wU5pFatYPUJIABv/ZxdQ6aNE87OBc7S
 NlRO+rtYQKoehAnbc5V3qfTo2YgyNcFr3if2E3wqsbIkGTmHgFLdETN1ADQArKxOY9dImh
 9EBX10FrfUCBehM2U6UcXIr3GPY18wE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706514876;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OcDPuDxI6AGFAM73OJg3OdByb6XRoKn9BIxXoVm50Eg=;
 b=jnciFc7zONesv0gEhWuRwz1NohpFpkMBkiPVVAFJbe8p43pAqDrsgh1jm52UbOnt2ZObGL
 VU/moVBSArAW/oCw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C26C3132FA;
 Mon, 29 Jan 2024 07:54:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Qtr4LrxZt2WxLQAAn2gu4w
 (envelope-from <dsterba@suse.cz>); Mon, 29 Jan 2024 07:54:36 +0000
Date: Mon, 29 Jan 2024 08:54:12 +0100
From: David Sterba <dsterba@suse.cz>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH next 09/11] tree-wide: minmax: Replace all the uses of
 max() for array sizes with max_const()
Message-ID: <20240129075412.GU31555@twin.jikos.cz>
References: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
 <10638249b13c43cab9a5522271aa99e2@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10638249b13c43cab9a5522271aa99e2@AcuMS.aculab.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=tuxm7eM5;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=jnciFc7z
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.33 / 50.00];
 HAS_REPLYTO(0.30)[dsterba@suse.cz]; RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; REPLYTO_ADDR_EQ_FROM(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 RCVD_COUNT_THREE(0.00)[3]; TO_DN_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.cz:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[14];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.com:email,aculab.com:email]; 
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.12)[67.06%]
X-Spam-Score: -1.33
X-Rspamd-Queue-Id: E512F22009
X-Spam-Flag: NO
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
Cc: 'Jens Axboe' <axboe@kernel.dk>, 'Netdev' <netdev@vger.kernel.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>,
 'Christoph Hellwig' <hch@infradead.org>,
 "'linux-btrfs@vger.kernel.org'" <linux-btrfs@vger.kernel.org>,
 "'Matthew Wilcox \(Oracle\)'" <willy@infradead.org>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
 'Linus Torvalds' <torvalds@linux-foundation.org>,
 "'David S . Miller'" <davem@davemloft.net>,
 'Dan Carpenter' <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 28, 2024 at 07:34:23PM +0000, David Laight wrote:
> These are the only uses of max() that require a constant value
> from constant parameters.
> There don't seem to be any similar uses of min().
> 
> Replacing the max() by max_const() lets min()/max() be simplified
> speeding up compilation.
> 
> max_const() will convert enums to int (or unsigned int) so that the
> casts added by max_t() are no longer needed.
> 
> Signed-off-by: David Laight <david.laight@aculab.com>
> ---

For

>  fs/btrfs/tree-checker.c                        | 2 +-

Acked-by: David Sterba <dsterba@suse.com>
