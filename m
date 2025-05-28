Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976A9AC6470
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 10:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F7910E5B1;
	Wed, 28 May 2025 08:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="K3IkmPC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2868E10E59B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 08:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=p4GyEZl+mDR1sWV2pSIz0EJuWrr/vpkKFxzXESdLPaQ=; b=K3IkmPC+zp6tbdNaTD+hv7BgP7
 sd/kwRnbL+FP54irW/4WRt0zocJHvy9mLWHqWRNLsJlQ5kbRj2sCnYX5tPTFt1nisi7z2OUoyQoS4
 EfhsWFL+ofX8EnldVfikRNLiWIFe7nEErqt3+EG/Z64H+zglwyRTbQDGt8W/lNxvgcN3Ke/Ef5xyD
 a8s6Utls3q+ituZ5oJV01DoKVevRzJoQkzlcReWKaTAK4esuIoebCRv4x4jkkn3ydP9GUdG3/BY5V
 eJMygR9ak1i9+vVusehns8htyZwzh+Rs2vn0wtHO/STN3GkwseZC+8XRCuhlK+2cGCISrB70gy/+O
 DgqX4KCA==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uKC88-0005bl-T8; Wed, 28 May 2025 10:27:20 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Wed, 28 May 2025 10:27:19 +0200
Message-ID: <9453742.CDJkKcVGEf@diego>
In-Reply-To: <64499337-fc61-42b0-8c50-7749b2036c54@rock-chips.com>
References: <20250528134245.13dc84aa@canb.auug.org.au>
 <64499337-fc61-42b0-8c50-7749b2036c54@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi,

Am Mittwoch, 28. Mai 2025, 09:17:13 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Damon Ding:
> On 2025/5/28 11:42, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the drm-misc tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function 'analog=
ix_dp_probe':
> > drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1589:17: error: labe=
l 'err_disable_clk' used but not defined
> >   1589 |                 goto err_disable_clk;
> >        |                 ^~~~
> >=20
> > Caused by commit
> >=20
> >    6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary calls=
 to clk_disable_unprepare() during probing")
> >=20
> > I have used the drm-misc tree from next-20250527 for today.
> >=20
>=20
> Oh, I have found the same compile error after rebasing.
>=20
> I have removed the 'err_disable_clk' flag and made it return=20
> ERR_PTR(ret) in:
> https://lore.kernel.org/all/20250310104114.2608063-7-damon.ding@rock-chip=
s.com/
>=20
> Likely a small merge conflict bug. Will patch it later. ;-)

I have sent in a patch for that issue yesterday, in

https://lore.kernel.org/dri-devel/20250527225120.3361663-1-heiko@sntech.de/


Heiko


