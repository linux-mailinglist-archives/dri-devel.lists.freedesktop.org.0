Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F28D1061
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 00:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6CE10E028;
	Mon, 27 May 2024 22:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C7810E028
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 22:52:16 +0000 (UTC)
Received: from i5e86193d.versanet.de ([94.134.25.61] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sBjC4-0005YB-Ez; Tue, 28 May 2024 00:51:52 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Val Packett <val@packett.cool>
Cc: stable@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/rockchip: vop: clear DMA stop bit upon vblank
 on RK3066
Date: Tue, 28 May 2024 00:51:51 +0200
Message-ID: <2972856.VdNmn5OnKV@diego>
In-Reply-To: <BF06ES.TD22854ZPLB92@packett.cool>
References: <2024051930-canteen-produce-1ba7@gregkh> <1817371.3VsfAaAtOV@diego>
 <BF06ES.TD22854ZPLB92@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Hey,

Am Dienstag, 28. Mai 2024, 00:13:59 CEST schrieb Val Packett:
> On Mon, May 27 2024 at 22:43:18 +02:00:00, Heiko St=FCbner=20
> <heiko@sntech.de> wrote:
> > Am Montag, 27. Mai 2024, 09:16:33 CEST schrieb Val Packett:
> >>  On the RK3066, there is a bit that must be cleared, otherwise
> >>  the picture does not show up
> >> on the display (at least for RGB).
> >>=20
> >>  Fixes: f4a6de8 ("drm: rockchip: vop: add rk3066 vop definitions")
> >>  Cc: stable@vger.kernel.org
> >>  Signed-off-by: Val Packett <val@packett.cool>
> >>  ---
> >>  v2: doing this on vblank makes more sense; added fixes tag
> >=20
> > can you give a rationale for this please?
> >=20
> > I.e. does this dma-stop bit need to be set on each vblank that happens
> > to push this frame to the display somehow?
>=20
>=20
> The only things I'm 100% sure about:
>=20
> - that bit is called dma_stop in the Android kernel's header;
> - without ever setting that bit to 1, it was getting set to 1 by the=20
> chip itself, as logging the register on flush was showing a 1 in that=20
> position (it was the only set bit - I guess others aren't readable=20
> after cfg_done?);
> - without clearing it "between" frames, the whole screen is always=20
> filled with noise, the picture is not visible.
>=20
> The rest is at least a bit (ha) speculative:
>=20
> As I understand from what the name implies, the hardware sets it to=20
> indicate that it has scanned out the frame and is waiting for=20
> acknowledgment (clearing) to be able to scan out the next frame. I=20
> guess it's a redundant synchronization mechanism that was removed in=20
> later iterations of the VOP hardware block.
>=20
> I've been trying to see if moving where I clear the bit affects the=20
> sort-of-tearing-but-vertical glitches that sometimes happen, especially=20
> early on after the system has just booted, but that seems to be=20
> completely unrelated pixel clock craziness (the Android kernel runs the=20
> screen at 66 fps, interestingly).
>=20
> I'm fairly confident that both places are "correct". The reason I'm=20
> more on the side of vblank now is that it made logical sense to me when=20
> I thought about it more: acknowledging that the frame has been scanned=20
> out is a reaction to the frame having been scanned out. It's a=20
> consequence of *that* that the acknowledgment is required for the next=20
> frame to be drawn.
>=20
> Unless we can get the opinion of someone closely familiar with this=20
> decade-old hardware, we only have this reasoning to go off of :)

Actually that reasoning was exactly what I was hoping for :-) .
And it actually also makes perfect sense.

I was somehow thinking this needs to be set only when starting output
and not as sort of an Ack.

Could you do a v3 with:
=2D the findings from above slightly condensed in the commit message
  It's really helpful when someone stumbles onto that commit 10 years
  from now and can get this really helpful explanation from the commit
  message.
=2D sending it as a _new_ thread
  Having v2 as reply to v1 patches confuses tooling that then can't
  distinguish what is actually part of this v2


Thanks a lot
Heiko


