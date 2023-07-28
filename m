Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91C9767096
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 17:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBBA10E71D;
	Fri, 28 Jul 2023 15:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5120410E71B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 15:31:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 846CC62183;
 Fri, 28 Jul 2023 15:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B03CC433C9;
 Fri, 28 Jul 2023 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690558315;
 bh=K6AA+vN45Net0ZpJHQ+4pBn99WhKXqI87QPut7I/m8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mXENTxOxDoAS6oHWOIpD9ej7WQ6KZ2hnIpR9Nnak9jPfL4uatWv+mADAFZWrD+src
 szSgXEqgr+Z5QpnirLO3q36oKICF06z2FMzAOQUxv2kjBYUWQP12VICa0Tpu1y+Em3
 9qx16EnekEKcl0ZCUPz6NH4+fUTnG+kQq6KSguSGc0jLICbKKmcqD77/ZMrvo4oKNT
 F1CITcfN65gUPuy1o4gpmx+FYpGEmV7Vhz20+xOpfRz5v5dLhcbtEsAqrgQHOn0a+e
 m6YBzFWtdkbaQlhKhL/GcHgvhMKkGVFFQ9s1P7yt1DQw6cQ0lVGiIsCF7iJDndCXvi
 MDDWiuPo2zr2Q==
Date: Fri, 28 Jul 2023 17:31:48 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 00/11] drm/panel and i2c-hid: Allow panels and
 touchscreens to power sequence together
Message-ID: <nn6cs4zvf27cxmtd3qcficyoyalcxi2iry6kgszb5oraplgaxy@sryeyseucdb3>
References: <20230727171750.633410-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727171750.633410-1-dianders@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Jul 27 2023, Douglas Anderson wrote:
> 
> The big motivation for this patch series is mostly described in the patch
> ("drm/panel: Add a way for other devices to follow panel state"), but to
> quickly summarize here: for touchscreens that are connected to a panel we
> need the ability to power sequence the two device together. This is not a
> new need, but so far we've managed to get by through a combination of
> inefficiency, added costs, or perhaps just a little bit of brokenness.
> It's time to do better. This patch series allows us to do better.
> 
> Assuming that people think this patch series looks OK, we'll have to
> figure out the right way to land it. The panel patches and i2c-hid
> patches will go through very different trees and so either we'll need
> an Ack from one side or the other or someone to create a tag for the
> other tree to pull in. This will _probably_ require the true drm-misc
> maintainers to get involved, not a lowly committer. ;-)
> 
> Version 4 of this series adds a new patch that suspends i2c-hid
> devices at remove time even for non panel-followers to make things
> consistent. It also attempts to isolate the panel follower code a bit
> more as per Benjamin's feedback on v3 and adds an item to the DRM todo
> list as per Maxime's request. As per Maxime's response to my v3 cover
> letter, I added his Reviewed-by tag to all 10 patches that were part
> of v3 (but left it off of the new i2c-hid patch in v4).
> 
> Version 3 of this series was a long time coming after v2. Maxime and I
> had a very long discussion trying to figure out if there was a beter
> way and in the end we didn't find one so he was OK with the series in
> general [1]. After that got resolved, I tried to resolve Benjamin's
> feedback but got stuck [2]. Eventually I made my best guess. The end
> result was a v3 that wasn't that different from v2 but that had a tiny
> bit more code split out.
> 
> Version 2 of this patch series didn't change too much. At a high level:
> * I added all the forgotten "static" to functions.
> * I've hopefully made the bindings better.
> * I've integrated into fw_devlink.
> * I cleaned up a few descriptions / comments.
> 
> As far as I can tell, as of v4 everyone is on the same page that this
> patch series looks like a reasonable solution to the problem and we
> just need to get all the nits fixed and figure out how to land it.

Thanks a lot for the new version. I like it much more on the HID side:

for the HID part:
Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>

I wouldn't mind having this series taken from the drm tree if that is
easier. i2c-hid is a low patch rate driver, so having it updated through
DRM should not be an issue.

In that case:
Acked-by: Benjamin Tissoires <bentiss@kernel.org>

Cheers,
Benjamin

> 
> [1] https://lore.kernel.org/r/gkwymmfkdy2p2evz22wmbwgw42ii4wnvmvu64m3bghmj2jhv7x@4mbstjxnagxd
> [2] https://lore.kernel.org/r/CAD=FV=VbdeomBGbWhppY+5TOSwt64GWBHga68OXFwsnO4gg4UA@mail.gmail.com
> 
> Changes in v4:
> - Document further cleanup in the official DRM todo list.
> - ("Suspend i2c-hid devices in remove") new for v4.
> - Move panel follower alternative checks to wrapper functions.
> - Rebase atop ("Suspend i2c-hid devices in remove").
> 
> Changes in v3:
> - Add is_panel_follower() as a convenience for clients.
> - Add "depends on DRM || !DRM" to Kconfig to avoid randconfig error.
> - Split more of the panel follower code out of the core.
> 
> Changes in v2:
> - Move the description to the generic touchscreen.yaml.
> - Update the desc to make it clearer it's only for integrated devices.
> - Add even more text to the commit message.
> - A few comment cleanups.
> - ("Add a devlink for panel followers") new for v2.
> - i2c_hid_core_initial_power_up() is now static.
> - i2c_hid_core_panel_prepared() and ..._unpreparing() are now static.
> - ihid_core_panel_prepare_work() is now static.
> - Improve documentation for smp_wmb().
> 
> Douglas Anderson (11):
>   dt-bindings: HID: i2c-hid: Add "panel" property to i2c-hid backed
>     touchscreens
>   drm/panel: Check for already prepared/enabled in drm_panel
>   drm/panel: Add a way for other devices to follow panel state
>   of: property: fw_devlink: Add a devlink for panel followers
>   HID: i2c-hid: Switch to SYSTEM_SLEEP_PM_OPS()
>   HID: i2c-hid: Rearrange probe() to power things up later
>   HID: i2c-hid: Make suspend and resume into helper functions
>   HID: i2c-hid: Suspend i2c-hid devices in remove
>   HID: i2c-hid: Support being a panel follower
>   HID: i2c-hid: Do panel follower work on the system_wq
>   arm64: dts: qcom: sc7180: Link trogdor touchscreens to the panels
> 
>  .../bindings/input/elan,ekth6915.yaml         |   5 +
>  .../bindings/input/goodix,gt7375p.yaml        |   5 +
>  .../bindings/input/hid-over-i2c.yaml          |   2 +
>  .../input/touchscreen/touchscreen.yaml        |   7 +
>  Documentation/gpu/todo.rst                    |  24 ++
>  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |   1 +
>  .../dts/qcom/sc7180-trogdor-homestar.dtsi     |   1 +
>  .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |   1 +
>  .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |   1 +
>  .../qcom/sc7180-trogdor-quackingstick.dtsi    |   1 +
>  .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   1 +
>  drivers/gpu/drm/drm_panel.c                   | 218 ++++++++++-
>  drivers/hid/i2c-hid/Kconfig                   |   2 +
>  drivers/hid/i2c-hid/i2c-hid-core.c            | 349 +++++++++++++-----
>  drivers/of/property.c                         |   2 +
>  include/drm/drm_panel.h                       |  94 +++++
>  16 files changed, 617 insertions(+), 97 deletions(-)
> 
> -- 
> 2.41.0.487.g6d72f3e995-goog
> 
