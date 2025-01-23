Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFD5A1AB4C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 21:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600A610E3F5;
	Thu, 23 Jan 2025 20:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="P5Q18y8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77C110E89A;
 Thu, 23 Jan 2025 20:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1737664197; x=1737923397;
 bh=RVqRFpAnQmJGx18Jv5nWC13Ayl3utNNfhzSexsasRrQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=P5Q18y8/rZmRsST5ZbjnYGegvI8xVReXpwcgnKA6hW0S5HavRzu3r1eZDWvpjDXed
 06iOoZDcXAKyEKrT/Tynx8/ffaOg9LZMpxv+DfmDGahFQmdoUqfii5zLWGTbnS731k
 bZ55d0W6KpooaM5eH7xB4cQLjRzRCT4ekORUQWtBQ5DPQLsFfBvmcZg3Res/8JGinq
 t4kSuA1EzlpC3FAD5z9PudVHcZs1DvhlLABvHJ4p11pSCiKpoKP8MVxhdPFVhf1nko
 tMxaMOkJm97F6jw3uk9BzlIWsn4qf1CnZF24hrYUGHm1V3p5svS0QCAshoN7jIVgU3
 VUljr52GfiXug==
Date: Thu, 23 Jan 2025 20:29:54 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Subject: Re: [V7 23/45] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Message-ID: <sF1AfVacnN5kYcy-GpkeioLrmPaNOC3FB1VNH1q9sYLRVWQ6fSt1p-cZ1RZlzjlIKGm85H3wiT_nxKeKiOCqgnYZ2oaLeoSu5K4RjzBYEDU=@emersion.fr>
In-Reply-To: <f6354255-c6b0-4558-bce6-a153ddc8ceee@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-24-alex.hung@amd.com>
 <jvy2Hqze-awB760FG1skr9viS1MfGpXrAOrJiwgHdtEQ_4eB4cLVMCzL-2zax_-kG8ZtLWrVxQ3vscFfN2jHU09AvlBPhN7ax_u7hTGKTyw=@emersion.fr>
 <f6354255-c6b0-4558-bce6-a153ddc8ceee@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 7665a8d6672d678801e6baf1418d72409d9bdf2a
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, January 22nd, 2025 at 22:05, Harry Wentland <harry.wentland@a=
md.com> wrote:

> On 2025-01-15 02:56, Simon Ser wrote:
>=20
> > Is this "ignore" something we could do at the core DRM level, instead
> > of doing it in all drivers? e.g. by silently ignoring user-space reques=
ts
> > to set the property?
>=20
> I think it'd be better to reject setting the property. The problem
> is that a client without the COLOR_PIPELINE client cap might have
> set these properties and we'll want to ignore that when we are
> programming a commit with a color pipeline.
>=20
> Since it's the drivers that decide on the programming based on
> the states it's up to each driver to ignore the deprecated
> properties.

Right. Maybe the "plane_color_pipeline" field could be renamed to
e.g. "ignore_plane_color_space_and_encoding" to make it clearer what
drivers are expected to do based on this? Either way, sounds good.
