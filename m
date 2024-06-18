Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8740F90C43D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2E910E593;
	Tue, 18 Jun 2024 07:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mtOSRoMr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lrg/+Qv5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jy93tFFO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+7EGzvDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60BF10E593
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:20:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF7EB219C9;
 Tue, 18 Jun 2024 07:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718695255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vehq4PYItKvzftbPvn8mEXGExku9NKmaCQmgSXWZctU=;
 b=mtOSRoMriNQ23wuwKaamR6OeDpglH7cdE7Tmj4Ej1BlehnOAqEUfFqiCb/pA8huSZ6nAQP
 gT/++QJ4N9T4b3bY1wAZX4gNrcy4jAZpQJ1rpCIi4bY2KMMpEnCCfrsU3BGJ/nBJMWKmGe
 9EqtW3YVx3e0XxO54oat5PqThN7p5+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718695255;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vehq4PYItKvzftbPvn8mEXGExku9NKmaCQmgSXWZctU=;
 b=lrg/+Qv5FfzKo2v70Gl2VbCF0Ov8GlyolvrhIn+LEuD3UsAaoeRRN3me34x+jumCFFWmc3
 xkwa3xat0orbRBBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718695253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vehq4PYItKvzftbPvn8mEXGExku9NKmaCQmgSXWZctU=;
 b=Jy93tFFOqclTNDd2VZp+5+cYhr9Yd47HLN2rutAS+B2G23DTB/xuMLdlcoi70IEjR3fsb3
 7+x5ZNRCDc0yyKTKkdTEhaLKMJAyMFZNoC85VCqAfpqWcWQ6mUSMQwwPLavS+HBDA5aCzD
 Sk9b9db8Gd0e/yNTNaQSLdRfgMP9jP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718695253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vehq4PYItKvzftbPvn8mEXGExku9NKmaCQmgSXWZctU=;
 b=+7EGzvDA3aXqbVeQfGzuW4Qj7M/g7/cLuYR/yrER251/eVJQ9hUFnM93/gnkj5m5wHAs6/
 t4dZG3ruMCNDlyDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3497A13AA0;
 Tue, 18 Jun 2024 07:20:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hHPVBVQ1cWaobgAAD6G6ig
 (envelope-from <jdelvare@suse.de>); Tue, 18 Jun 2024 07:20:52 +0000
Date: Tue, 18 Jun 2024 09:20:48 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Doug Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH RESEND] drm/display: Drop obsolete dependency on
 COMPILE_TEST
Message-ID: <20240618092048.510215ff@endymion.delvare>
In-Reply-To: <CAD=FV=X4qVDTOdMFQeEiJi2DD=tuEj66vP35XQKrSj5-r_YADQ@mail.gmail.com>
References: <20240617103018.515f0bf1@endymion.delvare>
 <xd2yybtxvzte7gwqwg2vudzvhoekqao2dle6zsuduzjzi3rsay@xhahwof2prph>
 <20240617132348.5f20bf89@endymion.delvare>
 <vsrsvmrkqnmxs3ncqv5m2gevzefiq55tr2iolxlmoehsvgcfkn@hyx37vax6r5e>
 <20240617201814.73a07702@endymion.delvare>
 <jbqbn6zaqq7j5htxuqxb34tjrf5lnqabkh5ywtnklhd4owyc3h@ztvolr6hjrti>
 <CAD=FV=X4qVDTOdMFQeEiJi2DD=tuEj66vP35XQKrSj5-r_YADQ@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_TLS_ALL(0.00)[];
 HAS_ORG_HEADER(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linaro.org,lists.freedesktop.org,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux-foundation.org,huawei.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email, imap1.dmz-prg2.suse.org:helo]
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

Hi Doug,

On Mon, 17 Jun 2024 19:12:05 -0700, Doug Anderson wrote:
> On Mon, Jun 17, 2024 at 3:26=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, Jun 17, 2024 at 08:18:14PM GMT, Jean Delvare wrote: =20
> > > The major difference is that one can't possibly enable ARCH_QCOM if
> > > building on X86 for example. Therefore COMPILE_TEST is the only way to
> > > let everyone (including randconfig/allmodconfig build farms) test-bui=
ld
> > > your code.
> > >
> > > On the other hand, if you want to test-build drm_dp_aux_bus, you can
> > > simply enable OF, because it is available on all architectures and
> > > doesn't depend on anything. No need for COMPILE_TEST. =20
> >
> > I'd probably let Doug respond, what was his intention. =20
>=20
> Is this me? This looks like a straight revert of commit 876271118aa4
> ("drm/display: Fix build error without CONFIG_OF")
>=20
> I don't personally have anything against removing COMPILE_TEST for
> this given that I wasn't the one who added it, but make sure it's not
> going to cause randconfig issues.

Thanks for pointing this commit to my attention, I wasn't aware. This
means that my proposed patch is incomplete and would indeed break
randconfig. I'll send a v2.

--=20
Jean Delvare
SUSE L3 Support
