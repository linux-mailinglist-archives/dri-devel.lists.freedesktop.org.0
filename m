Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE2B3734D2
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 08:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A3F6E053;
	Wed,  5 May 2021 06:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD0F6E053
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 06:06:20 +0000 (UTC)
Date: Wed, 05 May 2021 06:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1620194778;
 bh=MBptRVLcSn/mM2o0IEH1iTyn5IN7dJYpDELHHQT0pcU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=T2uElwOGtjQOIFISkSKGvbs0GOD4EXJU3kn5XXbk7tnQTi3v2mv7rnQbWf+EK51JT
 4sK9oVyHinCZF6qh2PnR9xGxKc/6pgCw9ZZpX1vbq6FlVX567UMuRc7mzngumdCoFe
 XJSH37wWeGsX3oHb4YeiPhQvMitOTpIN4ZkbCqQ/3OGLPQlGDXntHLhW79f4mLhwzI
 p5vOeaRx26XN1+ORMSRSI2Q1BaHZjYIM945xVK+sb8A4Jmg5VUIZoTg99BC33uixXf
 UvjQNP6RuhzKhP0Gql1K3xJx6St1qQ7DzPqjayqwq42RTJNV5V8BZmTBLC9P1P3+Ga
 +vy5vE0bOlewA==
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: log errors in drm_gem_fb_init_with_funcs
Message-ID: <DHsra4h62pN7Jo7Pz9D7XN_l4r-atgQ2865XYSMABZ32_-TyJSRXnYRN-0I8NNm1fK_O5bjTSq6icR1Ih8U3car_dXJYKXZh184rxxCVTMg=@emersion.fr>
In-Reply-To: <20210505001442.kbo42ox7nwqwlewf@outlook.office365.com>
References: <ZS4eX0PtTuNvHezILcTWeWINOkRyMS4krXND3cIE@cp4-web-032.plabs.ch>
 <20210503142038.bs2qfzzpqefqmn57@outlook.office365.com>
 <A5W1hYEUZFa0XQrjgvtzuZPiMe44HV9sGFK0XWIVaqYbxZhbEtIkEsgCEqawVTl2pRs1ZLfC3cOq54T9thv9RTOAmHTKStqi-5GR9r-ZvvM=@emersion.fr>
 <20210505001442.kbo42ox7nwqwlewf@outlook.office365.com>
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

On Wednesday, May 5th, 2021 at 2:14 AM, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> wrote:

> > As Ville said, if things got this far and the format is unsupported, something
> > must be going wrong. I'm not confident enough to switch this to a WARN_ON,
> > though.
>
> Hi Simon, thanks for your explanation.
>
> Is it common to get "!info" equal true? If not, and imho, I think that
> WARN_ON would be good to raise attention to a possible issue.

Maybe, but:

- I don't know enough to tell.
- Should be a separate patch anyway if we want to go with this, so that
  the WARN_ON can easily be reverted if need be (without reverting the
  logging additions).
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
