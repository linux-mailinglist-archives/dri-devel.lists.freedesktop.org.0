Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777D9D64F5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 21:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95C010EC87;
	Fri, 22 Nov 2024 20:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="AzsDTPqT";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XZz/Zwqu";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AzsDTPqT";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XZz/Zwqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B1910EC86;
 Fri, 22 Nov 2024 20:42:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4270221240;
 Fri, 22 Nov 2024 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732308124;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHKHQCXvuPqtS8zBtf2vIiBmq70MyYsvypTSAYgkiac=;
 b=AzsDTPqT7eoeHiGQhWEj4WP5gEbXkxHzIEV42sxL+XYjq1GcEtMKEkF9eTpm++y1OcS53L
 NgTKC68IcUn8EdftJ9vPGZNPjgcZJpkQj4/fRow2065DaZqdJSyQsbPgzr1FRasW0UD7bf
 PWhkcX5WaZRySP5fqFm7kMsF3sCxbOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732308124;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHKHQCXvuPqtS8zBtf2vIiBmq70MyYsvypTSAYgkiac=;
 b=XZz/Zwqu27QgWYeUGgkJu5PLIx9ocmWILGpX51ZwduaMkHZ29nBQOgyXf0XF+TvouhrXj/
 Q0c5l2DwC/5zDaDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=AzsDTPqT;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="XZz/Zwqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732308124;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHKHQCXvuPqtS8zBtf2vIiBmq70MyYsvypTSAYgkiac=;
 b=AzsDTPqT7eoeHiGQhWEj4WP5gEbXkxHzIEV42sxL+XYjq1GcEtMKEkF9eTpm++y1OcS53L
 NgTKC68IcUn8EdftJ9vPGZNPjgcZJpkQj4/fRow2065DaZqdJSyQsbPgzr1FRasW0UD7bf
 PWhkcX5WaZRySP5fqFm7kMsF3sCxbOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732308124;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHKHQCXvuPqtS8zBtf2vIiBmq70MyYsvypTSAYgkiac=;
 b=XZz/Zwqu27QgWYeUGgkJu5PLIx9ocmWILGpX51ZwduaMkHZ29nBQOgyXf0XF+TvouhrXj/
 Q0c5l2DwC/5zDaDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8A59138A7;
 Fri, 22 Nov 2024 20:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9uhuNpvsQGefVAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 22 Nov 2024 20:42:03 +0000
Date: Fri, 22 Nov 2024 21:41:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
Message-ID: <20241122204157.GA125569@pevik>
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
 <CAF6AEGuzFNVd5fE+b+hKcC8xAOg7CrkPaYuWC6tCVmioutoOOw@mail.gmail.com>
 <CAK7LNAQDMJUYUF7BaN10bwctW7fuHmSMrrAjMmn4s7P2ys5P+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQDMJUYUF7BaN10bwctW7fuHmSMrrAjMmn4s7P2ys5P+Q@mail.gmail.com>
X-Rspamd-Queue-Id: 4270221240
X-Spam-Level: 
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linaro.org,linux-foundation.org,lists.freedesktop.org];
 DKIM_TRACE(0.00)[suse.cz:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.71
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Thu, Nov 21, 2024 at 10:49 AM Rob Clark <robdclark@gmail.com> wrote:

> > On Wed, Nov 20, 2024 at 5:17 PM Petr Vorel <pvorel@suse.cz> wrote:

> > > > On Thu, Nov 21, 2024 at 5:41 AM Petr Vorel <pvorel@suse.cz> wrote:

> > > > > It will be used in the next commit for DRM_MSM.

> > > > > Suggested-by: Rob Clark <robdclark@gmail.com>
> > > > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > > > ---
> > > > > Changes v3->v4:
> > > > > * Move definition to the end of the file


> > > > I prefer to not check the tool.

> > > Ack.

> > > > Why don't you install python3?

> > > Everybody installs it when it's required, the question is how to inform about
> > > the dependency.

> > > There build environments are minimal environments:
> > > * chroot (e.g. cross compilation)
> > > * container

> > > These are used by both developers and distros.

> > I don't think py3 is an _onerous_ dependency, but it has come up as a
> > surprise in minimal distro build environments at least once.. so I'd
> > be a fan of surfacing this dependency in a predictable/understandable
> > way (ie. I'm in favor of this patchset)


> "once" is a keyword here.

> "/bin/sh: python3: not found" provides sufficient information
> about why the compilation failed, and you know what to do
> to fix the problem.
> This is good.

> If you hide CONFIG_DRM_MSM silently
> due to missing python3, you may scratch your head
> "why drm/msm was not compiled?".
It's not on the list, but still visible in help (via search).

> This is worse.

I'm ok with this being refused. Yes, it's a trivial thing to find that python3
is not installed. I wasn't sure myself if this is really better. Having
something like "requires $(PYTHON3)" would be best solution (e.g. not disable
the config, but exit before starting to build), but of course unless this
feature is needed for many modules it does not make sense to have it.
It's because kernel mostly contains everything (unless languages like python
or any other dependency starts to be added). For this reason I like that
mconf-cfg.sh warns when missing ncurses devel files (even suggesting package
names).

Just to explain what was my motivation. CONFIG_DRM_MSM in in arm64 defconfig,
thus it will affect anybody who uses the defconfig (any distro will need to add
it).

It's needed only for Qualcomm arm64 devices only. But only for these devices
which are mainlined enough to really use CONFIG_DRM_MSM (many of them aren't in
that state).

postmarketOS is the distribution which supports Qualcomm. It stores kernel
config for each device and devices often have individual maintainer. E.g. 175x
"once" :).

Kind regards,
Petr
