Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB1A6B1EFC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 09:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68A710E7AE;
	Thu,  9 Mar 2023 08:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB5D10E7AE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 08:55:07 +0000 (UTC)
Received: from localhost (unknown [213.194.153.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: rcn)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 98FF76601F5E;
 Thu,  9 Mar 2023 08:55:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678352105;
 bh=nYgiFa82gCCufozEGyI2yeBaToeM51OP28Sx8fZOeAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QV4JHmn5M85iK+ZCjqmuYiiqfnjT6etGBsizyuqaq/30OIxCq8DXBStNapKcthdHy
 /aastzkIOi2JuKNRZ2r0Y+PcDUF3JlzAUiBZc3lT+WP3MgqAT0ht8fAJPfQOX1QHEQ
 +6kEnEZDz168h8uQN8+wxx5Iyo9o1g9Dxs9MtB6s5Q3wHjo4lNeBLqnPVMBgyh1rfU
 CEDkH84ekfmtssYum8UWxY9ot6mlzJRAGB4S36hw+v+hBzcse7RBbfR0cILlQlqv3T
 Xsh8FH6cKGQV+5diqMhLdZDM2rcl7JjiOMsIh+eN05UVfO4CadiAUSRWKtKgH++VST
 QZ2y45vyLgO7w==
Date: Thu, 9 Mar 2023 09:55:01 +0100
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion
Message-ID: <20230309085501.et7ngd32u25befqu@rcn-XPS-13-9305>
References: <CGME20230109220056eucas1p26418012878272961a3a21a365192ef60@eucas1p2.samsung.com>
 <20230109220033.31202-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230109220033.31202-1-m.szyprowski@samsung.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On lun 09-01-2023 23:00:33, Marek Szyprowski wrote:
> devm_regulator_get_enable_optional() function returns 0 on success, so
> use it for the check if function succeded instead of the -ENODEV value.
> 
> Fixes: 429e87063661 ("drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 7642f740272b..534621a13a34 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -718,7 +718,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>  
>  	ret = devm_regulator_get_enable_optional(dev, "hdmi");
> -	if (ret != -ENODEV)
> +	if (ret < 0)
>  		return ret;
>  
>  	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
> -- 
> 2.39.0

This patch seems to have caused (or uncovered) a regression in the
bootrr.deferred-probe-empty test for meson-g12a-sei510. Apparently, this
causes a driver to stay in the deferred probe list after boot.

The bisection was found on mainline/master. Here's the full report:


* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
*                                                               *
* If you do send a fix, please include this trailer:            *
*   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
*                                                               *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

mainline/master bisection: baseline.bootrr.deferred-probe-empty on meson-g12a-sei510

Summary:
  Start:      fe15c26ee26e Linux 6.3-rc1
  Plain log:  https://storage.kernelci.org/mainline/master/v6.3-rc1/arm64/defconfig/clang-11/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:   https://storage.kernelci.org/mainline/master/v6.3-rc1/arm64/defconfig/clang-11/lab-baylibre/baseline-meson-g12a-sei510.html
  Result:     67d0a30128c9 drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       mainline
  URL:        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  Branch:     master
  Target:     meson-g12a-sei510
  CPU arch:   arm64
  Lab:        lab-baylibre
  Compiler:   clang-11
  Config:     defconfig
  Test case:  baseline.bootrr.deferred-probe-empty

Breaking commit found:

-------------------------------------------------------------------------------
commit 67d0a30128c9f644595dfe67ac0fb941a716a6c9
Author: Marek Szyprowski <m.szyprowski@samsung.com>
Date:   Mon Jan 9 23:00:33 2023 +0100

    drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion
    
    devm_regulator_get_enable_optional() function returns 0 on success, so
    use it for the check if function succeeded instead of the -ENODEV value.
    
    Fixes: 429e87063661 ("drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()")
    Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
    Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
    Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
    [narmstrong: s/succeeded/succeeded/ in commit message]
    Link: https://patchwork.freedesktop.org/patch/msgid/20230109220033.31202-1-m.szyprowski@samsung.com

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 7642f740272b..534621a13a34 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -718,7 +718,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
 
 	ret = devm_regulator_get_enable_optional(dev, "hdmi");
-	if (ret != -ENODEV)
+	if (ret < 0)
 		return ret;
 
 	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
-------------------------------------------------------------------------------


Git bisection log:

-------------------------------------------------------------------------------
git bisect start
# good: [307e14c039063f0c9bd7a18a7add8f940580dcc9] Merge tag '6.3-rc-smb3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6
git bisect good 307e14c039063f0c9bd7a18a7add8f940580dcc9
# bad: [fe15c26ee26efa11741a7b632e9f23b01aca4cc6] Linux 6.3-rc1
git bisect bad fe15c26ee26efa11741a7b632e9f23b01aca4cc6
# bad: [693fed981eb9bf6e70bfda66bb872e2bb8155671] Merge tag 'char-misc-6.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect bad 693fed981eb9bf6e70bfda66bb872e2bb8155671
# bad: [b72b5fecc1b8a2e595bd03d7d257c88ea3f9fd45] Merge tag 'trace-v6.3' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
git bisect bad b72b5fecc1b8a2e595bd03d7d257c88ea3f9fd45
# bad: [7dd1be30f02f7115002fe00f1f6802bbcf79f857] Merge tag 'amd-drm-next-6.3-2023-01-20' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect bad 7dd1be30f02f7115002fe00f1f6802bbcf79f857
# bad: [c37ea39c1fa880da0d7fd2c719e5c96be19f0fc5] Merge tag 'drm-misc-next-2023-01-12' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
git bisect bad c37ea39c1fa880da0d7fd2c719e5c96be19f0fc5
# good: [fe91e41a6170c9fd73fa0bf9a1a3f3cc6ee5c1d2] drm/format-helper: Remove unnecessary conversion helpers
git bisect good fe91e41a6170c9fd73fa0bf9a1a3f3cc6ee5c1d2
# good: [e045aec89d1b6cd677ec3e253d87f85d44b17559] drm/amd: Load GFX11 microcode during early_init
git bisect good e045aec89d1b6cd677ec3e253d87f85d44b17559
# bad: [9cce08cadc6ce8670280d0a042cf0b6d2987d9f9] drm/panel-edp: fix name for IVO product id 854b
git bisect bad 9cce08cadc6ce8670280d0a042cf0b6d2987d9f9
# good: [977374cf481d3bea916b2775e6ecc682b9689550] drm/vc4: plane: Add 3:3:2 and 4:4:4:4 RGB/RGBX/RGBA formats
git bisect good 977374cf481d3bea916b2775e6ecc682b9689550
# bad: [0e4dcffd331fa7d2a6ae628b51a7f418dfa90367] drm/panel: raspberrypi-touchscreen: Convert to i2c's .probe_new()
git bisect bad 0e4dcffd331fa7d2a6ae628b51a7f418dfa90367
# bad: [67d0a30128c9f644595dfe67ac0fb941a716a6c9] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion
git bisect bad 67d0a30128c9f644595dfe67ac0fb941a716a6c9
# good: [771d6539f27bd55f43d8a95d53a7eeaaffa2681c] drm/vc4: hdmi: Correct interlaced timings again
git bisect good 771d6539f27bd55f43d8a95d53a7eeaaffa2681c
# good: [ef85db911134d103a7f713eae6689dbb15c3f96a] dt-bindings: display: panel: document the Visionox VTDR6130 AMOLED DSI Panel
git bisect good ef85db911134d103a7f713eae6689dbb15c3f96a
# good: [2349183d32d83a7635baa804934813bcad13fd62] drm/panel: add visionox vtdr6130 DSI panel driver
git bisect good 2349183d32d83a7635baa804934813bcad13fd62
# first bad commit: [67d0a30128c9f644595dfe67ac0fb941a716a6c9] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion
-------------------------------------------------------------------------------


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#38919): https://groups.io/g/kernelci-results/message/38919
Mute This Topic: https://groups.io/mt/97420961/7285812
Group Owner: kernelci-results+owner@groups.io
Unsubscribe: https://groups.io/g/kernelci-results/unsub [ricardo.canuelo@collabora.com]
-=-=-=-=-=-=-=-=-=-=-=-
