Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924B685DEE1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 15:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CD910E75B;
	Wed, 21 Feb 2024 14:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="FmhYO+ZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4BC10E75B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1708525351; bh=LF3mPKz82wFKYBnS3pkUFExa+8tzUpNv+iiGbb7Kggc=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=FmhYO+ZNYNU0FoScZxKn01rd9HtaMosC2AF9CFkg2IIDbNUYYYGRJBlLI/ow9fhuN
 S7NpSsbC2rZGeJcs2D1NrTfoiWxgMXo7Bk3eqLWovOtIHd/rcRtGcL8axGhaxSRoB4
 yrUAFDB3bdUZb7RnkypcZNqX5O+tiL9d3yyixMLo=
Date: Wed, 21 Feb 2024 15:22:30 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/sun4i: Fix layer zpos change/atomic modesetting
Message-ID: <6n6fnjl3dw4dnmoygh3u72ebbubotpqyg67cwkuataw2vw6lwm@bhxrtjewjso6>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240216190430.1374132-1-megi@xff.cz>
 <20240216190430.1374132-4-megi@xff.cz>
 <inuhwnlexpt6dpre4uailtvytjhms4uqeerzehbntczurhcxol@fc4nvkdwffdd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <inuhwnlexpt6dpre4uailtvytjhms4uqeerzehbntczurhcxol@fc4nvkdwffdd>
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

Hi Maxime,

On Wed, Feb 21, 2024 at 02:45:20PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Feb 16, 2024 at 08:04:26PM +0100, Ondřej Jirman wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> > 
> > Identical configurations of planes can lead to different (and wrong)
> > layer -> pipe routing at HW level, depending on the order of atomic
> > plane changes.
> > 
> > For example:
> > 
> > - Layer 1 is configured to zpos 0 and thus uses pipe 0. No other layer
> >   is enabled. This is a typical situation at boot.
> > 
> > - When a compositor takes over and layer 3 is enabled,
> >   sun8i_ui_layer_enable() will get called with old_zpos=0 zpos=1, which
> >   will lead to incorrect disabling of pipe 0 and enabling of pipe 1.
> > 
> > What happens is that sun8i_ui_layer_enable() function may disable
> > blender pipes even if it is no longer assigned to its layer.
> > 
> > To correct this, move the routing setup out of individual plane's
> > atomic_update into crtc's atomic_update, where it can be calculated
> > and updated all at once.
> > 
> > Remove the atomic_disable callback because it is no longer needed.
> > 
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> 
> I don't have enough knowledge about the mixers code to comment on your
> patch, so I'll let Jernej review it. However, this feels to me like the
> pipe assignment is typically the sort of things that should be dealt
> with device-wide, and in atomic_check.

Yes, this is what this patch does. It moves blender setup from individual
planes' attomic commits to a single place in crtc atomic commit.

kind regards,
	o.

> If I'm talking non-sense, it would be great to mention at least why that
> can't be an option in the commit log.
> 
> Maxime


