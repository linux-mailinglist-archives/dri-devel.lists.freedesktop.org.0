Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891AB90B975
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 20:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269CF10E490;
	Mon, 17 Jun 2024 18:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nBORirBa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="89M5oUoc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nBORirBa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="89M5oUoc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFFA10E490
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 18:18:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6906C219B8;
 Mon, 17 Jun 2024 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718648299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9y+6syuY0d4lFZbPYpRMim+4VcbHKlTIw3/agQk/TDg=;
 b=nBORirBa08jmfq2NO/U4y4YUboVTjTcpyYw7U19N5OFxFNgDRA9B19pyBpy9iMPNr2irxh
 jCQtTehWQXRQoMwiGGhy4dR7TqtlPa2V1R+PDyFXoejny05bGlw0K/OZRfgGBEY+EqNfQl
 IiCfdY9ntU6UzBUikafjKsEd+v/ji7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718648299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9y+6syuY0d4lFZbPYpRMim+4VcbHKlTIw3/agQk/TDg=;
 b=89M5oUoctl5izBKekMyc9yJIvNlUKeirgB8u3OTsv8up647yqSbjsdu/SvD9yHPXh99Uvj
 6rpX0LN28U+Qb+AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718648299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9y+6syuY0d4lFZbPYpRMim+4VcbHKlTIw3/agQk/TDg=;
 b=nBORirBa08jmfq2NO/U4y4YUboVTjTcpyYw7U19N5OFxFNgDRA9B19pyBpy9iMPNr2irxh
 jCQtTehWQXRQoMwiGGhy4dR7TqtlPa2V1R+PDyFXoejny05bGlw0K/OZRfgGBEY+EqNfQl
 IiCfdY9ntU6UzBUikafjKsEd+v/ji7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718648299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9y+6syuY0d4lFZbPYpRMim+4VcbHKlTIw3/agQk/TDg=;
 b=89M5oUoctl5izBKekMyc9yJIvNlUKeirgB8u3OTsv8up647yqSbjsdu/SvD9yHPXh99Uvj
 6rpX0LN28U+Qb+AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03EE0139AB;
 Mon, 17 Jun 2024 18:18:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zlhvNel9cGa4HQAAD6G6ig
 (envelope-from <jdelvare@suse.de>); Mon, 17 Jun 2024 18:18:17 +0000
Date: Mon, 17 Jun 2024 20:18:14 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] drm/display: Drop obsolete dependency on
 COMPILE_TEST
Message-ID: <20240617201814.73a07702@endymion.delvare>
In-Reply-To: <vsrsvmrkqnmxs3ncqv5m2gevzefiq55tr2iolxlmoehsvgcfkn@hyx37vax6r5e>
References: <20240617103018.515f0bf1@endymion.delvare>
 <xd2yybtxvzte7gwqwg2vudzvhoekqao2dle6zsuduzjzi3rsay@xhahwof2prph>
 <20240617132348.5f20bf89@endymion.delvare>
 <vsrsvmrkqnmxs3ncqv5m2gevzefiq55tr2iolxlmoehsvgcfkn@hyx37vax6r5e>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 HAS_ORG_HEADER(0.00)[];
 FREEMAIL_CC(0.00)[chromium.org,lists.freedesktop.org,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux-foundation.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 RCVD_COUNT_TWO(0.00)[2]; TO_DN_SOME(0.00)[]
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Jun 2024 14:55:22 +0300, Dmitry Baryshkov wrote:
> On Mon, Jun 17, 2024 at 01:23:48PM GMT, Jean Delvare wrote:
> > Hi Dmitry,
> > 
> > Thanks for your feedback.
> > 
> > On Mon, 17 Jun 2024 12:57:19 +0300, Dmitry Baryshkov wrote:  
> > > On Mon, Jun 17, 2024 at 10:30:30AM GMT, Jean Delvare wrote:  
> > > > Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> > > > is possible to test-build any driver which depends on OF on any
> > > > architecture by explicitly selecting OF. Therefore depending on
> > > > COMPILE_TEST as an alternative is no longer needed.    
> > > 
> > > The goal of this clause is to allow build-testing the driver with OF
> > > being disabled (meaning that some of OF functions are stubbed and some
> > > might disappear). I don't see how user-selectable OF provides the same
> > > result.  
> > 
> > Historically, the goal of this clause *was* to allow build-testing the
> > driver on architectures which did not support OF, and that did make
> > sense back then. As I understand it, building the driver without OF
> > support was never a goal per se (if it was, then the driver wouldn't be
> > set to depend on OF in the first place).
> > 
> > Some of my other submissions include the following explanation which
> > you might find useful (I ended up stripping it on resubmission after
> > being told I was being too verbose, but maybe it was needed after all):
> > 
> > It is actually better to always build such drivers with OF enabled,
> > so that the test builds are closer to how each driver will actually be
> > built on its intended target. Building them without OF may not test
> > much as the compiler will optimize out potentially large parts of the
> > code. In the worst case, this could even pop false positive warnings.
> > Dropping COMPILE_TEST here improves the quality of our testing and
> > avoids wasting time on non-existent issues.  
> 
> This doesn't seem to match the COMPILE_TEST usage that I observe in
> other places. For example, we frequently use 'depends on ARCH_QCOM ||
> COMPILE_TEST'. Which means that the driver itself doesn't make sense
> without ARCH_QCOM, but we want for it to be tested on non-ARCH_QCOM
> cases. I think the same logic applies to 'depends on OF ||
> COMPILE_TEST' clauses. The driver (DP AUX bus) depends on OF to be fully
> functional, but it should be compilable even without OF case.

The major difference is that one can't possibly enable ARCH_QCOM if
building on X86 for example. Therefore COMPILE_TEST is the only way to
let everyone (including randconfig/allmodconfig build farms) test-build
your code.

On the other hand, if you want to test-build drm_dp_aux_bus, you can
simply enable OF, because it is available on all architectures and
doesn't depend on anything. No need for COMPILE_TEST.

For clarity, I'm not advocating against the use of COMPILE_TEST,
actually if you check the history of my kernel contributions 10 years
back, you'll find commits from me adding COMPILE_TEST in addition to
arch-specific dependencies to many drivers. All I'm saying is that it
should only be used when it is the only way to enable the build.

-- 
Jean Delvare
SUSE L3 Support
