Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0224877A3AD
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 00:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B538890FE;
	Sat, 12 Aug 2023 22:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA02890FE
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Aug 2023 22:33:52 +0000 (UTC)
Received: from i53875bbf.versanet.de ([83.135.91.191] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qUxB1-0002Ra-IZ; Sun, 13 Aug 2023 00:33:43 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v2 0/5] drm/rockchip: Fix crtc duplicate state and crtc
 reset funcs
Date: Sun, 13 Aug 2023 00:33:42 +0200
Message-ID: <2475986.usQuhbGJ8B@diego>
In-Reply-To: <17046b61-5188-28e3-41fc-dad36d76584f@kwiboo.se>
References: <20230621223311.2239547-1-jonas@kwiboo.se>
 <17046b61-5188-28e3-41fc-dad36d76584f@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonas,

Am Samstag, 12. August 2023, 16:18:05 CEST schrieb Jonas Karlman:
> Please consider reviewing and merging this series [2], and also [3].

during the last months my testfarm aquired some issues, I'm still
working on fixing, so my testing is way limited right now.

> drm/rockchip: Fix crtc duplicate state and crtc reset funcs
> [2] https://lore.kernel.org/all/20230621223311.2239547-1-jonas@kwiboo.se/

Though this one looked easy and when going through the code looked
quite right.


> drm/rockchip: vop: Add NV15, NV20 and NV30 support
> [3] https://lore.kernel.org/all/20230618220122.3911297-1-jonas@kwiboo.se/

I guess I need to track down someone on IRC to tell me if these new NVxx
types look correct, because I don't have too much clue about those drm-formats
yet. Hopefully I'll get to that on monday.


Heiko


> On 2023-06-22 00:33, Jonas Karlman wrote:
> > This series fixes a reset of state in duplicate state crtc funcs for VOP
> > driver, a possible crash and ensure crtc reset helper is called in VOP2
> > driver.
> > 
> > Patch 1 use kmemdup instead of kzalloc to duplicate the crtc state.
> > Patch 2 change to use crtc and plane cleanup helpers directly.
> > Patch 3 adds a null guard for allocation failure.
> > Patch 4 adds a crash guard for empty crtc state.
> > Patch 5 adds a missing call to crtc reset helper.
> > 
> > This is the next part of an ongoing effort to upstream HDMI 2.0 support
> > used in LibreELEC for the past 3+ years.
> > 
> > Changes in v2:
> > - Handle possible allocation failure in crtc reset funcs
> > - Collect r-b tags
> > 
> > This series is also available at [1].
> > 
> > [1] https://github.com/Kwiboo/linux-rockchip/commits/next-20230621-duplicate-state
> > 
> > Jonas Karlman (5):
> >   drm/rockchip: vop: Fix reset of state in duplicate state crtc funcs
> >   drm/rockchip: vop: Use cleanup helper directly as destroy funcs
> >   drm/rockchip: vop: Fix call to crtc reset helper
> >   drm/rockchip: vop2: Don't crash for invalid duplicate_state
> >   drm/rockchip: vop2: Add missing call to crtc reset helper
> > 
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 24 +++++-------
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 39 ++++++++++----------
> >  2 files changed, 28 insertions(+), 35 deletions(-)
> > 
> 
> 




