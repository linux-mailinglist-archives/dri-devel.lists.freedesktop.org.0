Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC3E9A3A8D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 11:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D7810E36B;
	Fri, 18 Oct 2024 09:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ahAgEk0z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oFuBjuHY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ahAgEk0z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oFuBjuHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4C010E36B;
 Fri, 18 Oct 2024 09:54:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 01AAD21DC1;
 Fri, 18 Oct 2024 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729245278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFYRTWF15ddtTIFg4BWAxR2N8EgXFZHV0oxaHhkdnNg=;
 b=ahAgEk0zvzSSIQKUL6A814A0FQh5Ipctfq0BhVfFC8alaHTg9S3ZROEvSpX5X1LaJNClvf
 bnXj8udeOg2oRFZCCdQWjyeAt9bw/y0LPKVxsJPZXpEhrq03imopMPJ5oVnLZ3+kcamyn8
 7oL7HdULCISOdNBdsUb8otGpzlKxZpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729245278;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFYRTWF15ddtTIFg4BWAxR2N8EgXFZHV0oxaHhkdnNg=;
 b=oFuBjuHYSo7tV4kOJ8li0gcK975SC1ZvJIbYPhgffUBCO35Nj+nWZFcPS8hCL7ul1hMgE9
 DblcD2auLZisyjCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729245278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFYRTWF15ddtTIFg4BWAxR2N8EgXFZHV0oxaHhkdnNg=;
 b=ahAgEk0zvzSSIQKUL6A814A0FQh5Ipctfq0BhVfFC8alaHTg9S3ZROEvSpX5X1LaJNClvf
 bnXj8udeOg2oRFZCCdQWjyeAt9bw/y0LPKVxsJPZXpEhrq03imopMPJ5oVnLZ3+kcamyn8
 7oL7HdULCISOdNBdsUb8otGpzlKxZpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729245278;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFYRTWF15ddtTIFg4BWAxR2N8EgXFZHV0oxaHhkdnNg=;
 b=oFuBjuHYSo7tV4kOJ8li0gcK975SC1ZvJIbYPhgffUBCO35Nj+nWZFcPS8hCL7ul1hMgE9
 DblcD2auLZisyjCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 506CC13680;
 Fri, 18 Oct 2024 09:54:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id l1ChEV0wEmcvYwAAD6G6ig
 (envelope-from <jdelvare@suse.de>); Fri, 18 Oct 2024 09:54:37 +0000
Date: Fri, 18 Oct 2024 11:54:35 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, YueHaibing
 <yuehaibing@huawei.com>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, freedreno
 <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/display: Drop obsolete dependency on COMPILE_TEST
Message-ID: <20241018115435.3632cb10@endymion.delvare>
In-Reply-To: <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>
References: <20241015134606.5b87093e@endymion.delvare>
 <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; HAS_ORG_HEADER(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,huawei.com,quicinc.com,linaro.org,poorly.run,somainline.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
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

On Tue, 15 Oct 2024 09:06:04 -0700, Doug Anderson wrote:
> On Tue, Oct 15, 2024 at 4:46=E2=80=AFAM Jean Delvare <jdelvare@suse.de> w=
rote:
> > Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> > is possible to test-build any driver which depends on OF on any
> > architecture by explicitly selecting OF. Therefore depending on
> > COMPILE_TEST as an alternative is no longer needed.
> >
> > To avoid reintroducing the randconfig bug originally fixed by commit
> > 876271118aa4 ("drm/display: Fix build error without CONFIG_OF"),
> > DRM_MSM which selects DRM_DISPLAY_DP_HELPER must explicitly depend
> > on OF. This is consistent with what all other DRM drivers are doing.
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> > For regular builds, this is a no-op, as OF is always enabled on
> > ARCH_QCOM and SOC_IMX5. So this change only affects test builds. As
> > explained before, allowing test builds only when OF is enabled
> > improves the quality of these test builds, as the result is then
> > closer to how the code is built on its intended targets.
> >
> > Changes in v3:
> > * Rebase on top of kernel v6.11.
> > Changes in v2:
> > * Let DRM_MSM depend on OF so that random test builds won't break.
> >
> >  drivers/gpu/drm/display/Kconfig |    2 +-
> >  drivers/gpu/drm/msm/Kconfig     |    1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > --- linux-6.11.orig/drivers/gpu/drm/display/Kconfig
> > +++ linux-6.11/drivers/gpu/drm/display/Kconfig
> > @@ -3,7 +3,7 @@
> >  config DRM_DISPLAY_DP_AUX_BUS
> >         tristate
> >         depends on DRM
> > -       depends on OF || COMPILE_TEST
> > +       depends on OF
> >
> >  config DRM_DISPLAY_HELPER
> >         tristate
> > --- linux-6.11.orig/drivers/gpu/drm/msm/Kconfig
> > +++ linux-6.11/drivers/gpu/drm/msm/Kconfig
> > @@ -6,6 +6,7 @@ config DRM_MSM
> >         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
> >         depends on COMMON_CLK
> >         depends on IOMMU_SUPPORT
> > +       depends on OF =20
>=20
> Perhaps nobody landed this because you're missing the msm maintainers
> as specified by `./scripts/get_maintainer.pl -f
> drivers/gpu/drm/msm/Kconfig` ? I've added them here. It seems like
> we'd at least need an Ack by those guys since this modified the
> msm/Kconfig...

You are right. The fix originally only touched
drivers/gpu/drm/display/Kconfig and I forgot to update the maintainers
list for v2 when drivers/gpu/drm/msm/Kconfig had to be modified as
well. Thank you for noticing and getting the right people involved,
this clearly made a difference :-)

> FWIW I haven't spent massive time studying this, but what you have
> here looks reasonable. I'm happy at least with this from a DP AUX bus
> perspective:
>=20
> Acked-by: Douglas Anderson <dianders@chromium.org>
>=20
> Presumably landing this via drm-misc makes the most sense after MSM
> guys give it an Ack.

Thanks,
--=20
Jean Delvare
SUSE L3 Support
