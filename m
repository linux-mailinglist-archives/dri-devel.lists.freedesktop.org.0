Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165BD914974
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 14:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3C610E40F;
	Mon, 24 Jun 2024 12:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CED10E40F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 12:12:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sLiYz-0006zw-Ca; Mon, 24 Jun 2024 14:12:49 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sLiYy-004e4o-VG; Mon, 24 Jun 2024 14:12:48 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1sLiYy-0008KA-2v;
 Mon, 24 Jun 2024 14:12:48 +0200
Message-ID: <a5be9585b293590561ef3999049c62008652300c.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: don't block scheduler when GPU is still
 active
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  patchwork-lst@pengutronix.de,
 kernel@pengutronix.de
Date: Mon, 24 Jun 2024 14:12:48 +0200
In-Reply-To: <20240621195919.491217-1-l.stach@pengutronix.de>
References: <20240621195919.491217-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

On Fr, 2024-06-21 at 21:59 +0200, Lucas Stach wrote:
> Since 45ecaea73883 ("drm/sched: Partial revert of 'drm/sched: Keep
> s_fence->parent pointer'") still active jobs aren't put back in the
> pending list on drm_sched_start(), as they don't have a active
> parent fence anymore, so if the GPU is still working and the timeout
> is extended, all currently active jobs will be freed.
>=20
> To avoid prematurely freeing jobs that are still active on the GPU,
> don't block the scheduler until we are fully committed to actually
> reset the GPU.
>=20
> As the current job is already removed from the pending list and
> will not be put back when drm_sched_start() isn't called, we must
> make sure to put the job back on the pending list when extending
> the timeout.
>=20
> Cc: stable@vger.kernel.org #6.0
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
