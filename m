Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762929D4904
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 09:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED1710E89D;
	Thu, 21 Nov 2024 08:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="WTfy/D8l";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="sHoe/EPT";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="WTfy/D8l";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="sHoe/EPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D906710E3E8;
 Thu, 21 Nov 2024 01:17:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 33ACB218E8;
 Thu, 21 Nov 2024 01:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732151843;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLQJlwjvQ2Dbsxi9xrvB3E+w9FqEmidg2MsLHAlaruU=;
 b=WTfy/D8lXXnS1RCYj/kN8ybXIRGdK9y77RgIIzyC2F+xZxevqn2DN5XCMEVnC/Do6cMl0H
 M2AJae9CvW7tMxtUVDf0Ipiqi8tjNeii2nWDh9zG2MCCsJ8B8NebR1eH2oOVVAu9q8jRFX
 271J45VO7uiuqFTr+2DFW7/HtOhaQy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732151843;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLQJlwjvQ2Dbsxi9xrvB3E+w9FqEmidg2MsLHAlaruU=;
 b=sHoe/EPT2FszmRf+WJP9eUtps0tEwuPNJ1TVh409aaJnFORCnA18Tw2+KbajPc5Kla0CRO
 QcJELP0LMHFpTNDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732151843;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLQJlwjvQ2Dbsxi9xrvB3E+w9FqEmidg2MsLHAlaruU=;
 b=WTfy/D8lXXnS1RCYj/kN8ybXIRGdK9y77RgIIzyC2F+xZxevqn2DN5XCMEVnC/Do6cMl0H
 M2AJae9CvW7tMxtUVDf0Ipiqi8tjNeii2nWDh9zG2MCCsJ8B8NebR1eH2oOVVAu9q8jRFX
 271J45VO7uiuqFTr+2DFW7/HtOhaQy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732151843;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLQJlwjvQ2Dbsxi9xrvB3E+w9FqEmidg2MsLHAlaruU=;
 b=sHoe/EPT2FszmRf+WJP9eUtps0tEwuPNJ1TVh409aaJnFORCnA18Tw2+KbajPc5Kla0CRO
 QcJELP0LMHFpTNDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93B9A1376E;
 Thu, 21 Nov 2024 01:17:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cNZzHyKKPme0XgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 21 Nov 2024 01:17:22 +0000
Date: Thu, 21 Nov 2024 02:17:20 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
Message-ID: <20241121011720.GA69389@pevik>
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
X-Spam-Score: -3.50
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MISSING_XM_UA(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_SEVEN(0.00)[9];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,linux-foundation.org,lists.freedesktop.org,gmail.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto,suse.cz:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Mailman-Approved-At: Thu, 21 Nov 2024 08:40:20 +0000
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

> On Thu, Nov 21, 2024 at 5:41 AM Petr Vorel <pvorel@suse.cz> wrote:

> > It will be used in the next commit for DRM_MSM.

> > Suggested-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Changes v3->v4:
> > * Move definition to the end of the file


> I prefer to not check the tool.

Ack.

> Why don't you install python3?

Everybody installs it when it's required, the question is how to inform about
the dependency.

There build environments are minimal environments:
* chroot (e.g. cross compilation)
* container

These are used by both developers and distros.

Kind regards,
Petr

> >  init/Kconfig | 3 +++
> >  1 file changed, 3 insertions(+)

> > diff --git a/init/Kconfig b/init/Kconfig
> > index fbd0cb06a50a..c77e45484e81 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -2047,3 +2047,6 @@ config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> >  # <asm/syscall_wrapper.h>.
> >  config ARCH_HAS_SYSCALL_WRAPPER
> >         def_bool n
> > +
> > +config HAVE_PYTHON3
> > +       def_bool $(success,$(PYTHON3) -V)
> > --
> > 2.45.2
