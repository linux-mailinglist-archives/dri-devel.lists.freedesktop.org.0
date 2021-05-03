Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F337168D
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 16:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69F26E0E4;
	Mon,  3 May 2021 14:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53786E0E4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 14:25:44 +0000 (UTC)
Date: Mon, 03 May 2021 14:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1620051942;
 bh=XEVOd7l6vRG7DgP8WCUtzG/aXAK1PU2dKKrV4cd75zU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=WfrUTFheelLrao/lrtajUz2ZVzkTakGpc7kDcbEqZDUrubywC/D7SbFDsxmrKrx8M
 8jpLqiLo38+iKDLV+spTxApdjH2moSYUw2rUQO2F5xla2DMtL5EKZgen9t6n9Z8SHV
 XkbE2Ea25exOfmCeqAD/BUobfCa3fkzYBlO1HvBiaY/wgyL3Pffb74KkhpFIAG7jaS
 YXMS8UZH55C+lw2TMXQHNYfm79MpENtiNfHTjSTRja8Ef/5TNHgVI5/2ZltmRQNFEC
 xyi9tjl8ujMf7SvgpjVwgTvKKBPMVMp2OSvzFuupdi766ZQhe72K23bKSu9NI5egsO
 PaShru/5+oXMw==
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: log errors in drm_gem_fb_init_with_funcs
Message-ID: <A5W1hYEUZFa0XQrjgvtzuZPiMe44HV9sGFK0XWIVaqYbxZhbEtIkEsgCEqawVTl2pRs1ZLfC3cOq54T9thv9RTOAmHTKStqi-5GR9r-ZvvM=@emersion.fr>
In-Reply-To: <20210503142038.bs2qfzzpqefqmn57@outlook.office365.com>
References: <ZS4eX0PtTuNvHezILcTWeWINOkRyMS4krXND3cIE@cp4-web-032.plabs.ch>
 <20210503142038.bs2qfzzpqefqmn57@outlook.office365.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, May 3rd, 2021 at 4:20 PM, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> wrote:

> > diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > index 109d11fb4cd4..aeb808a0ba54 100644
> > --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > @@ -155,8 +155,10 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
> >  	int ret, i;
> >
> >  	info = drm_get_format_info(dev, mode_cmd);
> > -	if (!info)
> > +	if (!info) {
> > +		drm_dbg_kms(dev, "Failed to get FB format info\n");
>
> Just for curiosity,
> Why not say something like "FB format is not supported" by the driver?
> I'm asking because the kernel-doc for drm_get_format_info says "NULL if
> the format is unsupported".

As Ville said, if things got this far and the format is unsupported, something
must be going wrong. I'm not confident enough to switch this to a WARN_ON,
though.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
