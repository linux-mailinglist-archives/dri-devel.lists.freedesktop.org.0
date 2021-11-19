Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6EC457256
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 17:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911EA6EB22;
	Fri, 19 Nov 2021 16:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F233A6EB22
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 16:04:32 +0000 (UTC)
Date: Fri, 19 Nov 2021 16:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1637337869;
 bh=QojxD/0YrTv2uaylvR47nM7Wd+++N7DJSh0Pn4+2mjY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=k8XFjbLgPsp72FXpR19qilma7MsWiYt10a+YiC0yIFIAWB2BK7oE2NNBh7Jd9+ao4
 EulU3u+WZE7ashHIae7cHaufgfPpe6SjbW1AsBeTRAvCNE9AvpNO4C5cFQoOlQZ9G/
 iRnnQTSfqtJo7Gp9OP90Q8o0w4tLhMnSllvojTJBYmTib1mXZFZhgkrZytBlr0zUiz
 S1fQIl2QpBMNEHC6BqRzn1ynZuN3WJ+rSViGmiGu9Y/rMkEPNz9zqe4C76bEGYy2gT
 eDW3ny8mlUUJN8/XrCvl86L3UGUFK56NS4qTwEjbFw7Fn6fpg2Xk20Hxz1Ec3VRobm
 dqutuLHsdUGbg==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <98236dpcx39iOz8xAYrwGLfiLdwgUlljrbBgHL3wd8A0Wz4KzRk3PR8s_tb5Rxu4eScKI4483kB6Vhv-T64CJYOeQqwXlqo2c-64HvoS5cg=@emersion.fr>
In-Reply-To: <YZfIgd8s7uGXAD2X@phenom.ffwll.local>
References: <20211117224841.3442482-1-briannorris@chromium.org>
 <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <20211118123928.545dec8a@eldfell>
 <CAF6AEGuc9JbOsC4Lrvoqo8VzMHq+7ru7Y6_UwoZaGV2wHQ6E5g@mail.gmail.com>
 <20211119115419.505155b5@eldfell> <YZfIgd8s7uGXAD2X@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Brian Norris <briannorris@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, November 19th, 2021 at 16:53, Daniel Vetter <daniel@ffwll.ch> wr=
ote:

> Random idea ... should we perhaps let userspace connect the boosting? I.e=
.
> we do a bunch of standardized boost targets (render clocks, display sr
> exit), and userspace can then connect it to whichever input device it
> wants to?

On IRC we discussed having user-space hand over a FD to the kernel. When th=
e FD
becomes readable, the kernel triggers the boost.

This would let user-space use e.g. an input device, an eventfd, or an epoll=
 FD
with any combination of these as the boost signal.
