Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C2753DD93
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 20:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C28911AA78;
	Sun,  5 Jun 2022 18:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 495 seconds by postgrey-1.36 at gabe;
 Sun, 05 Jun 2022 18:10:29 UTC
Received: from mr4.vodafonemail.de (mr4.vodafonemail.de [145.253.228.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C70411AA97
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 18:10:29 +0000 (UTC)
Received: from smtp.vodafone.de (unknown [10.0.0.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mr4.vodafonemail.de (Postfix) with ESMTPS id 4LGPb82zSkz1y1F
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 18:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
 s=vfde-mb-mr2-21dec; t=1654452132;
 bh=OJ/Ix7jnR2N49gq79WAofwQ17TNbUYVxDpW30W5KbHU=;
 h=Message-ID:Date:User-Agent:Content-Language:To:From:Subject:
 Content-Type:From;
 b=gEz8wGFO9FWw8lY03Msl7nFOdomWG5BqcZ4M5TF37fhIRObwKmXSfbftbSC38wkKG
 QJR9T0GhJVL+waK6PwUCGpLbChaWqzj9tz0udQsvI4O4Qa01Mp875AX19kDpnf4koO
 Qb5czwVtah9m3YUWzAfGqdLSk8h5RPYBCIziW5kM=
Received: from schreibtisch (p4ff31527.dip0.t-ipconnect.de [79.243.21.39])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.vodafone.de (Postfix) with ESMTPSA id 4LGPb733dfzHnHV
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 18:02:08 +0000 (UTC)
Message-ID: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
Date: Sun, 5 Jun 2022 20:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
From: Peter Mattern <pmattern@arcor.de>
Subject: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 2738
X-purgate-ID: 155817::1654452131-62FFB3FA-0B0108CF/0/0
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

Hello.

As of Linux 5.18.0, module vc4 apparently isn't working on Raspberry Pi 
3B any more.

If a monitor is attached to the device, the boot messages show up as 
usual, but right when KMS starts, the screen turns black. Similarly, the 
screen also turns black when the module is blacklisted at boot time and 
loaded from the running system.
The problem looks quite similar to the one posted some months ago in [1].

Unfortunately, looking through systemd's journal didn't seem to yield 
any real hint. Nevertheless, the results from grepping vc4 are
→ 5.17.1
 > kernel: vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
 > kernel: rc rc0: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0
 > kernel: input: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0/input0
 > kernel: vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
 > kernel: vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
 > kernel: vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
 > kernel: vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops 
[vc4])
 > kernel: vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops 
[vc4])
 > kernel: vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops 
[vc4])
 > kernel: vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
 > kernel: fb0: switching to vc4 from simple
 > kernel: [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
 > kernel: vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
 > systemd-logind[338]: Watching system buttons on /dev/input/event0 (vc4)
→ 5.18.0
 > kernel: fb0: switching to vc4 from simple
 > kernel: vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
 > kernel: rc rc0: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0
 > kernel: input: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0/input0
 > kernel: vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
 > kernel: vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
 > kernel: vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
 > kernel: vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops 
[vc4])
 > kernel: vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops 
[vc4])
 > kernel: vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops 
[vc4])
 > kernel: vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
 > kernel: [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
 > kernel: vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
 > systemd-logind[337]: Watching system buttons on /dev/input/event0 (vc4)

Regards,

Peter Mattern

[1] 
https://lists.freedesktop.org/archives/dri-devel/2022-January/339458.html

