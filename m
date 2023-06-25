Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF8473D294
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 18:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB7B10E08D;
	Sun, 25 Jun 2023 16:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22E810E08D
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 16:56:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-160-50-14.reb.o2.cz
 [85.160.50.14])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34A2B4DB;
 Sun, 25 Jun 2023 18:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687712175;
 bh=A3AnVnOFjJh6d289gsuCnuuSpnAbQwPDVvq/TgXBLpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X9W6i3tIHqxN6v1VSP4xm25Qb5Q1kjths2hfrZ8s/qsvH7acskBJlTmWj9hJ9U0lp
 vQDSBTaJgBNJcDSbnJyiqS3H45vn1Cs8D5On6q4V/G387yOtzZU4jH+gDU2DABxKTA
 rMMsD0MIbGKBHfhOrP9WPgxkBYpMJdSlbyjaRSOE=
Date: Sun, 25 Jun 2023 19:56:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 24/39] drm: renesas: shmobile: Unify plane allocation
Message-ID: <20230625165651.GA13886@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <95c2af42a89c65ca603126e56c0423407dfc873f.1687423204.git.geert+renesas@glider.be>
 <20230623165038.GB2112@pendragon.ideasonboard.com>
 <CAMuHMdWsDHMn4P1g_EYKzXyisUOnhJ0Q1Nd5Wq9H_CwPvaSaWw@mail.gmail.com>
 <20230623185052.GR2112@pendragon.ideasonboard.com>
 <CAMuHMdWdeRODcAa26EKuvR3yca0hVqSUR6WBHEtr9+RBKyk_Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWdeRODcAa26EKuvR3yca0hVqSUR6WBHEtr9+RBKyk_Ow@mail.gmail.com>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 25, 2023 at 10:58:17AM +0200, Geert Uytterhoeven wrote:
> On Fri, Jun 23, 2023 at 8:50 PM Laurent Pinchart wrote:
> > On Fri, Jun 23, 2023 at 07:55:22PM +0200, Geert Uytterhoeven wrote:
> > > On Fri, Jun 23, 2023 at 6:50 PM Laurent Pinchart wrote:
> > > > On Thu, Jun 22, 2023 at 11:21:36AM +0200, Geert Uytterhoeven wrote:
> > > > > Unify primary and overlay plane allocation:
> > > > >   - Enhance shmob_drm_plane_create() so it can be used to create the
> > > > >     primary plane, too,
> > > > >   - Move overlay plane creation next to primary plane creation.
> > > > >
> > > > > As overlay plane index zero now means the primary plane, this requires
> > > > > shifting all overlay plane indices by one.
> > > >
> > > > Do you use index zero to identify the primary plane just for
> > > > shmob_drm_plane_create(), or somewhere else too ? If it's just to create
> > > > the plane, you could instead pass the plane type to the function.
> > >
> > > Index zero is just used for the creation.
> > > I guess this sort of goes together with my question below...
> > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > > Perhaps it would be better to not use dynamic allocation, but store
> > > > > "struct drm_plane primary" and "struct shmob_drm_plane planes[5]" in
> > > > > struct drm_shmob_device instead, like is done for the crtc and encoder?
> > >
> > > ... as embedding separate primary and planes[] would also get rid of
> > > the need to adjust the plane indices when converting from logical to physical
> > > overlay plane indices.
> >
> > Do they need to be embedded for that, or could you simple keep the index
> > as it is ?
> 
> If the plane type would be passed explicitly, they would not need to be
> embedded for that.
> 
> Then the question becomes: does it make sense to unify primary and
> overlay plane handling?

Good point. I don't mind much either way, it depends on how much code
duplication it would remove I suppose.

-- 
Regards,

Laurent Pinchart
