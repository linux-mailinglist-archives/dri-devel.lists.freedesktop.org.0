Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC62197508
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A0F89F08;
	Mon, 30 Mar 2020 07:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9851B6E041
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 21:24:07 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7e6ee90001>; Fri, 27 Mar 2020 14:23:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 27 Mar 2020 14:24:07 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 27 Mar 2020 14:24:07 -0700
Received: from [10.20.23.181] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Mar
 2020 21:24:07 +0000
To: <dri-devel@lists.freedesktop.org>
From: Daniel Dadap <ddadap@nvidia.com>
Subject: How to handle disconnection of eDP panels due to dynamic display mux
 switches
Message-ID: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
Date: Fri, 27 Mar 2020 16:25:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585344234; bh=oLGH3b7AWZr42nfSMedcJexgpBvlyPg5n2U5PdS9E/k=;
 h=X-PGP-Universal:To:From:Subject:Message-ID:Date:User-Agent:
 MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Transfer-Encoding:Content-Language;
 b=kvTQC4UxYb521NWS9zADaOHkm0pTx/APJVxl04aQ9SxmWPlBD+8PmC5b5dpxLvtAX
 KX/c1Zg/BstaWEIsxIysEUqx8CSDhTFx/QQ54+Vld+n20hL9VjIPxygUaLdvQKUp0T
 imwkofN8WCqB+2SCiH91O7dBLe7B6ifz5LK4Xyv8l70sAzd9g70Srrd2GeulY04wwO
 iX5akQmVyFT/HMwpKMopLbch58eq1Mr+6rqVNqGAJPZW9UrIrxFvcE6in21okhwjBB
 fQF1+y/M3+PwhIxEs5bokgRgHslwLTgA+9omYsPEep+KVRLYeqX0OzCQjztvzmJHVS
 MkRbmqK+MuRKw==
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A number of hybrid GPU notebook computer designs with dual (integrated 
plus discrete) GPUs are equipped with multiplexers (muxes) that allow 
display panels to be driven by either the integrated GPU or the discrete 
GPU. Typically, this is a selection that can be made at boot time as a 
menu option in the system firmware's setup screen, and the mux selection 
stays fixed for as long as the system is running and persists across 
reboots until it is explicitly changed. However, some muxed hybrid GPU 
systems have dynamically switchable muxes which can be switched while 
the system is running.

NVIDIA is exploring the possibility of taking advantage of dynamically 
switchable muxes to enhance the experience of using a hybrid GPU system. 
For example, on a system configured for PRIME render offloading, it may 
be possible to keep the discrete GPU powered down and use the integrated 
GPU for rendering and displaying the desktop when no applications are 
using the discrete GPU, and dynamically switch the panel to be driven 
directly by the discrete GPU when render-offloading a fullscreen 
application.

We have been conducting some experiments on systems with dynamic muxes, 
and have found some limitations that would need to be addressed in order 
to support use cases like the one suggested above:

* In at least the i915 DRM-KMS driver, and likely in other DRM-KMS 
drivers as well, eDP panels are assumed to be always connected. This 
assumption is broken when the panel is muxed away, which can cause 
problems. A typical symptom is i915 repeatedly attempting to retrain the 
link, severely impacting system performance and printing messages like 
the following every five seconds or so:

[drm:intel_dp_start_link_train [i915]] *ERROR* failed to enable link 
training
[drm] Reducing the compressed framebuffer size. This may lead to less 
power savings than a non-reduced-size. Try to increase stolen memory 
size if available in BIOS.

This symptom might occur if something causes the DRM-KMS driver to probe 
the display while it's muxed away, for example a modeset or DPMS state 
change.

* When switching the mux back to a GPU that was previously driving a 
mode, it is necessary to at the very least retrain DP links to restore 
the previously displayed image. In a proof of concept I have been 
experimenting with, I am able to accomplish this from userspace by 
triggering DPMS off and then back on again; however, it would be good to 
have an in-kernel API to request that an output owned by a DRM-KMS 
driver be refreshed to resume driving a mode on a disconnected and 
reconnected display. This API would need to be accessible from outside 
of the DRM-KMS driver handling the output. One reason it would be good 
to do this within the kernel, rather than rely on e.g. DPMS operations 
in the xf86-video-modesetting driver, is that it would be useful for 
restoring the console if X crashes or is forcefully killed while the mux 
is switched to a GPU other than the one which drives the console.

Basically, we'd like to be able to do the following:

1) Communicate to a DRM-KMS driver that an output is disconnected and 
can't be used. Ideally, DRI clients such as X should still see the 
output as being connected, so user applications don't need to keep track 
of the change.
2) Request that a mode that was previously driven on a disconnected 
output be driven again upon reconnection.

If APIs to do the above are already available, I wasn't able to find 
information about them. These could be handled as separate APIs, e.g., 
one to set connected/disconnected state and another to restore an 
output, or as a single API, e.g., signal a disconnect or reconnect, 
leaving it up to the driver receiving the signal to set the appropriate 
internal state and restore the reconnected output. Another possibility 
would be an API to disable and enable individual outputs from outside of 
the DRM-KMS driver that owns them. I'm curious to hear the thoughts of 
the DRM subsystem maintainers and contributors on what the best approach 
to this would be.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
