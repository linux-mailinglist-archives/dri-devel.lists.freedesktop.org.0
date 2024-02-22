Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36A485F836
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 13:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C25210E695;
	Thu, 22 Feb 2024 12:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="P99dHe+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0C710E695
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 12:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1708605022; x=1708864222;
 bh=/zjdeokAXXc51kin+LXGaABzN8yJLm4slbleR8eYzsk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=P99dHe+5Gaa1O4KlUyBLDXFFW8f6Zo73lspXctVk3YkA62W8XdyKXxQPdUkASDp1/
 0zIfff04ai07BnwvOpEEVTK9nH0yuPvqzx1iU3aD9052gP9FbnRGd8Wgl36Ot50buh
 0b9jrej100n/HdDJ5MqI3TpHHJ1b3EmmwqQ6TDthN/6vlA9eG41sWoXuTqAfYpVPVe
 ip3bx+hXs7QUGpvN/lZ6qPc/7PrGI8BG+SUvWgnKkgWABJoIRZOHttRtmtMPG579EM
 NfNrmxmghJGMnILjleUa2FyKAd2tzkWMKWOr/oDsyjbY7c0CTJzrrEbGuhlUSI5u7U
 EfrySeHLxPrUw==
Date: Thu, 22 Feb 2024 12:29:59 +0000
To: Dave Airlie <airlied@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Erik Kurzinger <ekurzinger@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 david1.zhou@amd.com, ashafer@nvidia.com, jajones@nvidia.com,
 kbrenneman@nvidia.com, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 1/3] drm/syncobj: call drm_syncobj_fence_add_wait when
 WAIT_AVAILABLE flag is set
Message-ID: <-kYls9Qx1Nyj-5GFlL8fK4EKlIqEeYU7koqHhhwq_-dI4v20bBZjvQgtOKlWJmJWHHOI_iwG_tXK52XZnngu9LaBiITunVGkmLWQseoolcw=@emersion.fr>
In-Reply-To: <dyAN0pawQuaRE4ckt-EloeZNpk4PUTAJVfn53LYehF688ctlZONwKy5IwZyL_1AuUZb6vUS8K1dMQXREZqPctc4D4dlehvqV-4te6rJGgnY=@emersion.fr>
References: <20240119163208.3723457-1-ekurzinger@nvidia.com>
 <ZbKkfKHwYriYtSDY@phenom.ffwll.local>
 <31d1599c-e3ba-469d-b4bc-0548ef961247@nvidia.com>
 <CAPM=9txvnaUukNgA80E2+-JuK3SkjVmGm=3S5ZCHauSg0D1Smw@mail.gmail.com>
 <xhFNe5iTIrtv6DeYlgWrwDdU2jxTR3nxMIeEzqRpizETQnuKY-xvTg5ovEY7p-Zee8L2FwRaLdg5lSyEIksbFCOKJHVvndJFeZ-iMMXlyL4=@emersion.fr>
 <dyAN0pawQuaRE4ckt-EloeZNpk4PUTAJVfn53LYehF688ctlZONwKy5IwZyL_1AuUZb6vUS8K1dMQXREZqPctc4D4dlehvqV-4te6rJGgnY=@emersion.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, February 22nd, 2024 at 11:34, Simon Ser <contact@emersion.fr> =
wrote:

> On Thursday, February 22nd, 2024 at 11:32, Simon Ser contact@emersion.fr =
wrote:
>=20
> > Thanks, pushed to drm-misc-next!
>=20
> As I write this, I realize I should've pushed the first patch to
> drm-misc-fixes instead=E2=80=A6 Sorry about the fuss=E2=80=A6
>=20
> Sima, Dave, what is the right thing to do here? Push a duplicate commit
> to drm-misc-fixes? (I know that's not a great thing to do=E2=80=A6)

I've cherry-picked the fix to drm-misc-fixes with Maxime's ACK.
