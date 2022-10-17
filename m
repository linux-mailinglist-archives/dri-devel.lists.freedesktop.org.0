Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07027600DC1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 13:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A04210E3E2;
	Mon, 17 Oct 2022 11:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0275310E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 11:29:15 +0000 (UTC)
Received: from p508fc122.dip0.t-ipconnect.de ([80.143.193.34]
 helo=phil.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1okOIy-0007hW-1b; Mon, 17 Oct 2022 13:29:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>, John Keeping <john@metanate.com>
Subject: Re: [BUG] [PATCH] drm/rockchip: use generic fbdev setup
Date: Mon, 17 Oct 2022 13:29:11 +0200
Message-ID: <2220890.jZfb76A358@phil>
In-Reply-To: <Y00o3M7SKAB/w9sW@donbot>
References: <20211029115014.264084-1-john@metanate.com>
 <d814394b-86c3-beb1-ddd4-04c65004f138@gmail.com> <Y00o3M7SKAB/w9sW@donbot>
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 17. Oktober 2022, 12:05:16 CEST schrieb John Keeping:
> Hi Johan,
> 
> On Mon, Oct 17, 2022 at 10:11:32AM +0200, Johan Jonker wrote:
> > Your patch contribution causes a kernel panic on MK808 with Rockchip rk3066a SoC.
> > Would you like to contribute to fix this issue?
> > The assumtion that drm_fbdev_generic_setup() does what rockchip_drm_fbdev_init did is not true!
> > A revert makes it work again.
> 
> It looks like there are 3 different ways to end up with -ENOMEM here,
> can you track down whether you're hitting one of the cases in
> rockchip_gem_prime_vmap() or if it's the iosys_map_is_null case in
> drm_gem_vmap()?
> 
> I guess the memory usage increases slightly using the generic code and
> RK3066 has less memory available.

also rk3066 and rk3188 do not have an iommu, so rely
on cma allocations.


Heiko


