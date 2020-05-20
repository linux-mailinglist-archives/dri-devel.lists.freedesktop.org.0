Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF01DB4D5
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 15:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE03A6E84A;
	Wed, 20 May 2020 13:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53686E84A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 13:20:51 +0000 (UTC)
Date: Wed, 20 May 2020 13:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1589980848;
 bh=9PzBzxgOepbrWDcV1O549aR/DgblLE7XeOrdg+N4Rpw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Le2TOLWtfEHv4MKZyWgbXiU2A8tKOy6XOwF8Zn/1xyIiqjoCl6ALVL548FqiYPXvD
 Ir2Q32HleQer9sWkL7M9GIOpSjYT6uKq3xlpU9izao4co5+nb4cT+uggQa1mG2Je0S
 Pj7N44wu4sS+vAH9ElUX7ZkrIvztHNOhaI7uh9cU=
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <4Qkv4p0V0uG4sZ8LjizVLq6bLbZ8U1xAwQ0riB72aHH3sT_ZJYz9QzDFPWCko8PfcA-VGBFkGtCn1n9YfKYqo_vwzvE3BVQUlxyBq61GZ08=@emersion.fr>
In-Reply-To: <20200520125556.GY206103@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200520125556.GY206103@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, May 20, 2020 2:55 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> Maybe we should add an explicit note that there's no guarantee about the
> new chardev minor this new device will get, it could both inherit the
> existing one (you can't open the old one anymore anyway) or get a new one?
>
> Or does userspace want a guarantee, i.e. as long as there's still a handle
> open kernel guarantees to not recycle the chardev minor (which is what we
> currently do). In that case better to add that to your list of guarantees
> above.

The are race conditions to consider too, e.g.

- Compositor sends /dev/dri/card0 to a client
- card0 goes away
- Another device takes card0
- Client receives /dev/dri/card0 and then starts using it, but it's the
  wrong device

At first glance these seem like edge-cases that almost never happen.
However I've seen these happen in practice with connectors, especially
with docks.

One solution would be to number minor numbers like PIDs: don't recycle
card0 before we've reached the upper minor number limit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
