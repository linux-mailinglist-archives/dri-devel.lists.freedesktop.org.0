Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5477345570D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 09:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93966EACB;
	Thu, 18 Nov 2021 08:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8BB6EABE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 08:34:19 +0000 (UTC)
Date: Thu, 18 Nov 2021 08:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1637224456;
 bh=vfacuKJ/8pxBqZYX9U97ETpBAOFypIw5shMz2e4BuQI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=kEWhhH7ZqAVsnizPbtaisRT0gUjetqk1SpO2vZNn8ngbQP6PcYwPHdenYL62KgZOa
 yCS0GP6sWd8yuej9AcSZYx3HgY15w0CMC3IAf/an67IxMso4emPR2CcFwKoRsWOc6D
 JaTefHSzDlzHKWa3A5yaWKoDZg1wzwyesiuKurYxlB98wUrXG7YfoJfaK83XSZaneY
 zvymOLYwFIdxBFBj490NF1YWmeg8bACUmwnqvfTTdP0Y8x3c41h7Av+uzHdVw8AgwL
 wqKZdkiaFEB5AuLf5N981PDXuwsF62VOxjKMGC0jawPFOvNtA+3XMSIpFRxlaQjITd
 5CiKeDPlSFlhg==
To: Brian Norris <briannorris@chromium.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 0/2] drm: Support input-boosted panel self-refresh exit
Message-ID: <eKiIqOeH_0iCJ5qKedzwefk36VAe-8YPqi7kG52SsMs2OxEt4u1sEML07P0RQkgNR4cuj97VduO_Xa6ktp4m2pdunmQnK8hE9Zp7dDTtruw=@emersion.fr>
In-Reply-To: <20211117224841.3442482-1-briannorris@chromium.org>
References: <20211117224841.3442482-1-briannorris@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@linux.ie>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

From a user-space point-of-view, we discussed about this patch on IRC a few
days ago [1]. Since this adds a policy decision we think it'd be best to al=
low
user-space to control this behavior.

Also cc Pekka.

Thanks,

Simon

[1]: https://oftc.irclog.whitequark.org/dri-devel/2021-11-07#1636276286-163=
6273745;

> A variety of applications have found it useful to listen to
> user-initiated input events to make decisions within a DRM driver, given
> that input events are often the first sign that we're going to start
> doing latency-sensitive activities:
>
>  * Panel self-refresh: software-directed self-refresh (e.g., with
>    Rockchip eDP) is especially latency sensitive. In some cases, it can
>    take 10s of milliseconds for a panel to exit self-refresh, which can
>    be noticeable. Rockchip RK3399 Chrome OS systems have always shipped
>    with an input_handler boost, that preemptively exits self-refresh
>    whenever there is input activity.
>
>  * GPU drivers: on GPU-accelerated desktop systems, we may need to
>    render new frames immediately after user activity. Powering up the
>    GPU can take enough time that it is worthwhile to start this process
>    as soon as there is input activity. Many Chrome OS systems also ship
>    with an input_handler boost that powers up the GPU.
>
> I implement the first bullet in this series, and I also compared with
> some out-of-tree patches for the second, to ensure this could be useful
> there too.
>
> Past work on upstreaming a variety of Chromebook display patches got
> held up for this particular feature, as there was some desire to make it
> a bit more generic, for one. See the latest here:
>
>   https://lore.kernel.org/all/20180405095000.9756-25-enric.balletbo@colla=
bora.com/
>   [PATCH v6 24/30] drm/rockchip: Disable PSR on input events
>
> I significantly rewrote this to adapt it to the new common
> drm_self_refresh_helpers and to add a new drm_input_helper thin library,
> so I only carry my own authorship on this series.
>
> Admittedly, this "drm_input_helper" library is barely DRM-specific at
> all, except that all display- and GPU-related input-watchers are likely
> to want to watch similar device behavior (unlike, say, rfkill or led
> input_handler code). The approximate consensus so far seems to be that
> (a) this isn't much code; if we need it for other subsystems (like,
>     cpufreq-boost), it's easy to implement similar logic
> (b) input subsystem maintainers think the existing input_handler
>     abstraction is good enough
> So, I keep the thin input helper in drivers/gpu/drm/.
>
> v1: https://lore.kernel.org/all/20211103234018.4009771-1-briannorris@chro=
mium.org/
>
> Changes in v2:
>  - Honor CONFIG_INPUT dependency, via new CONFIG_DRM_INPUT_HELPER
>  - Remove void*; users should use container_of()
>  - Document the callback context
>  - Delay PSR re-entry, when already disabled
>  - Allow default configuration via Kconfig and modparam
>  - really CC dri-devel@lists.freedesktop.org (oops!)
>
> Brian Norris (2):
>   drm/input_helper: Add new input-handling helper
>   drm/self_refresh: Disable self-refresh on input events
>
>  drivers/gpu/drm/Kconfig                   |  22 ++++
>  drivers/gpu/drm/Makefile                  |   2 +
>  drivers/gpu/drm/drm_input_helper.c        | 143 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_self_refresh_helper.c |  98 ++++++++++++---
>  include/drm/drm_input_helper.h            |  41 +++++++
>  5 files changed, 292 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_input_helper.c
>  create mode 100644 include/drm/drm_input_helper.h
>
> --
> 2.34.0.rc1.387.gb447b232ab-goog
