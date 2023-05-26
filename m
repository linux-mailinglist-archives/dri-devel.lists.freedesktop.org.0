Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76138712AF7
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D35810E1D7;
	Fri, 26 May 2023 16:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 603 seconds by postgrey-1.36 at gabe;
 Fri, 26 May 2023 16:47:16 UTC
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C9910E1D7;
 Fri, 26 May 2023 16:47:16 +0000 (UTC)
Date: Fri, 26 May 2023 16:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1685119634; x=1685378834;
 bh=NpwYvQnzNZl3qhqF8fXJy1oy0+TyUFyFlA/sXcsyRJ8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=t3l5kKB9W9P5oHUqT6b3Aa4zhEOPMH/iVhwaWRfTlbE9tJtgtyCgewXEPNKd6xMRW
 ymIr/KBOS9ccHbISMDtdf0jk+kfOwjAOUQ2pgY/gzYifw/qby22qBecDXkBdjuPKpu
 nPMmb+GeYdDR+vt014IHZD6l/UGKLCnZJ/42K/kaq+QlNIIbAL7sRwzB8McjtjeuKZ
 dlniSnos//4mM4uwVMtVo+fGndFL8MrLvPIgNj/rUFuSST5T5spG9rfGeWUDBSKmkz
 nMIBmUDO/sPaGUMWBo6Ov2USQ6aH9i+R32NIWWA+bsF/1EP/gNSP35S9dCwMRnMAtB
 kCrLKZpCPAZ9Q==
To: Sebastian Wick <sebastian.wick@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 08/13] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <ck7AlC003Z2akvYa3Zq54myRV7WWeGHyYBViRs1jBoW1weqwcK-t4kYmZ7d0BcH64u65KBfaxE0cL6ajRdR-BftuIM5XOID90AKFL69XPuE=@emersion.fr>
In-Reply-To: <CA+hFU4w3yeXFNvxfFTRmzq25C5K5PMJZR_KJDT8W4wwvOaiXig@mail.gmail.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
 <20230525191809.3524-9-harry.wentland@amd.com>
 <CA+hFU4w3yeXFNvxfFTRmzq25C5K5PMJZR_KJDT8W4wwvOaiXig@mail.gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, May 26th, 2023 at 18:40, Sebastian Wick <sebastian.wick@redhat.c=
om> wrote:

> On Thu, May 25, 2023 at 9:18=E2=80=AFPM Harry Wentland harry.wentland@amd=
.com wrote:
>=20
> > We want compositors to be able to set the output
> > colorspace on DP and HDMI outputs, based on the
> > caps reported from the receiver via EDID.
>=20
>=20
> This commit message seems wrong for multiple reasons. The Colorspace
> property documentation explicitly says that user space has to check
> the sink EDID for support:
>=20
> > The expectation from userspace is that it should parse the EDID and get=
 supported colorspaces.
>=20
> The code doesn't seem to care about EDID at all. Instead it exposes
> the variants it knows how to support with e.g. the appropriate YCC
> transform when necessary, independent of the sink support.

The commit messages explains that compositors will parse the EDID.
It doesn't state that the kernel does.
