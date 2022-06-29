Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C79E5605B8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60AC10E3A4;
	Wed, 29 Jun 2022 16:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4248A10E3A4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 16:23:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C79061AC0;
 Wed, 29 Jun 2022 16:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF816C341C8;
 Wed, 29 Jun 2022 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656519836;
 bh=RFV17kA2etM59yr+SN253bVf49eBdGjyy0t6B21oRjo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cGr5NPOZVjoOE9RiyqdUubbitwp2BzC8tMvMAchRhOZ3AwMNZOD6GZRS6IePuY2ym
 88NyXFPS3JBVchIAXJh5ullSO22rYW5Hb5jmqdMInVOFc+PkCtAMrCt4Y43CpMQT/U
 sxLBtnHOT6tZhVfystwT9SGmEr2bx6COWmnT16ySPc/cDlxOD+4aJAEq9mymcmAzl5
 8rBBb4wIwf0xWhOENpfmIHGp2nRY/l8aVuGxJ5IuRJwSqH/Avqb7be/UD8XUBnXoLQ
 VX2yCnpK0z0fYjL62FBOewa8Y/hkS9djRysBIzQQpUOvC85ML8nRm17EcGWgfJgIqH
 Hf7b6rO7jXDwg==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 00/96] Refactor non_legacy_dai_naming flag
Message-Id: <165651983041.2058781.2369056940647429242.b4-ty@kernel.org>
Date: Wed, 29 Jun 2022 17:23:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, airlied@linux.ie,
 cezary.rojewski@intel.com, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, nicolas.ferre@microchip.com, vkoul@kernel.org,
 jarkko.nikula@bitmer.com, kernel@pengutronix.de, shawnguo@kernel.org,
 daniel@zonque.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022 15:32:53 +0100, Charles Keepax wrote:
> Historically, the legacy DAI naming scheme was applied to platform
> drivers and the newer scheme to CODEC drivers. During componentisation
> the core lost the knowledge of if a driver was a CODEC or platform, they
> were all now components. To continue to support the legacy naming on
> older platform drivers a flag was added to the snd_soc_component_driver
> structure, non_legacy_dai_naming, to indicate to use the new scheme and
> this was applied to all CODECs as part of the migration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/96] ASoC: soc-component: Add legacy_dai_naming flag
        commit: 1c348f748b4dd7711c5564a8fce0842529498dff
[02/96] soundwire: intel: Migrate to new style legacy DAI naming flag
        commit: ca68202098a4416501cc9b5d68a54de22d754766
[03/96] drm/vc4: Migrate to new style legacy DAI naming flag
        commit: db827cb34ca38f4106f7c667bea3bbb48bc73552
[04/96] ASoC: img: Migrate to new style legacy DAI naming flag
        commit: 5f9d69986014945b826c712081678446c1f10fd7
[05/96] ASoC: spear: Migrate to new style legacy DAI naming flag
        commit: eeb021ee8fab0baae82e3784664666fd6b826e89
[06/96] ASoC: jz4740-i2c: Migrate to new style legacy DAI naming flag
        commit: 2bebc3b622c3c300eb3a3f603473429d8264c3b6
[07/96] ASoC: ep93xx: Migrate to new style legacy DAI naming flag
        commit: fe58b58330434ffad5fa0bc97e177aa93a9a6222
[08/96] ASoC: stm32: Migrate to new style legacy DAI naming flag
        commit: 36f07985f81b7482dceb8e650d2ce1f0222294d1
[09/96] ASoC: bcm: Migrate to new style legacy DAI naming flag
        commit: b9a0db0ae5247d92f379107a9c479f881914999d
[10/96] ASoC: sh: Migrate to new style legacy DAI naming flag
        commit: f712ff57a27090baff61f92bdb6521e8781d5e6b
[11/96] ASoC: tegra: Migrate to new style legacy DAI naming flag
        commit: 3172582c10540d4bf1caac1c39c903793648db8f
[12/96] ASoC: hisilicon: Migrate to new style legacy DAI naming flag
        commit: bf6dacb784f0efb5a225f6560d693fa71c7fda64
[13/96] ASoC: xilinx: Migrate to new style legacy DAI naming flag
        commit: bd486b070b1e24b38b3d6d7e33abffe4a18e3296
[14/96] ASoC: sunxi: Migrate to new style legacy DAI naming flag
        commit: f450b5dbce413b276e6c9215b40868b905c7b634
[15/96] ASoC: Intel: Migrate to new style legacy DAI naming flag
        commit: 725cf3bc6009b7fa156b73982eddf23c71767fbb
[16/96] ASoC: meson: Migrate to new style legacy DAI naming flag
        commit: d8572da099247860e97b27a7fddc9d80a71b8c25
[17/96] ASoC: sti-uniperf: Migrate to new style legacy DAI naming flag
        commit: ad483da7b0a17fdf4df0bd75b2cf29b5650ca2f7
[18/96] ASoC: amd: Migrate to new style legacy DAI naming flag
        commit: 0bc1e7d1fc3c50cf1eb62cd3c8d2b73c5f6d83fe
[19/96] ASoC: atmel: Migrate to new style legacy DAI naming flag
        commit: 7593e00807fb62e9f5e7367fc2500428cc317ff0
[20/96] ASoC: fsl: Migrate to new style legacy DAI naming flag
        commit: 1e63fcc74ace9824f3529eeabbb8f1881a7d3800
[21/96] ASoC: xtensa: Migrate to new style legacy DAI naming flag
        commit: f257dea1c589fa3f558502b3ac7b1c09699a73ab
[22/96] ASoC: adi: Migrate to new style legacy DAI naming flag
        commit: 9a34161a0bc90df825694195659d894e80afe7a3
[23/96] ASoC: dwc: Migrate to new style legacy DAI naming flag
        commit: e740ef3d9418db78ac7a8a24071933f9146af6e4
[24/96] ASoC: qcom: Migrate to new style legacy DAI naming flag
        commit: 8135d0290a9a1f1f752bb374f93a017b2074d09b
[25/96] ASoC: test-component: Migrate to new style legacy DAI naming flag
        commit: d73130ba523b88a3edb097ae3eb9f93df844b5e2
[26/96] ASoC: rockchip: Migrate to new style legacy DAI naming flag
        commit: d48a77173534df90788075e76fa88c52b7395a1e
[27/96] ASoC: au1x: Migrate to new style legacy DAI naming flag
        commit: 8e750817a1943b49d81c633f48370bce93bab98c
[28/96] ASoC: pxa: Migrate to new style legacy DAI naming flag
        commit: 05603f15b67a517c05ee2e2298e9accb8b7f1794
[29/96] ASoC: sof: Migrate to new style legacy DAI naming flag
        commit: a718ba30038402e6daa311c566d9be39e4ab3f05
[30/96] ASoC: ux500: Migrate to new style legacy DAI naming flag
        commit: 768be0d633d9ff668a7ca4ba3b8e3eebea328cb8
[31/96] ASoC: ti: Migrate to new style legacy DAI naming flag
        commit: 39c84e77da04f66f20fc54c6c6f49a5863bace5d
[32/96] ASoC: mxs-saif: Migrate to new style legacy DAI naming flag
        commit: 4cc4e22843e9bec6e9083d85e8a0bfed85fe5423
[33/96] ASoC: samsung: Migrate to new style legacy DAI naming flag
        commit: f7bfa516a39a111a5d3b6473cdac20ee6075358c
[34/96] ASoC: core: Switch core to new DAI naming flag
        commit: 129f055a2144ab588a43c2e66d21a1f55ce54f81
[35/96] media: TDA1997x: Remove now redundant non_legacy_dai_naming flag
        commit: 55b566ded44db29e9c1ab61623c60ade4600301e
[36/96] ASoC: fsl: Remove now redundant non_legacy_dai_naming flag
        commit: 89836f00429b5c3dedb2e2f30262e53847b82ad0
[37/96] ASoC: meson: Remove now redundant non_legacy_dai_naming flag
        commit: 9455e289246d8769631e6bec78c0c2ef40171b70
[38/96] ASoC: pistachio: Remove now redundant non_legacy_dai_naming flag
        commit: 7e91c90863df7387b9e1f04d9bfc2a43c77d2a46
[39/96] ASoC: samsung: Remove now redundant non_legacy_dai_naming flag
        commit: 752044db5b54c867dadfbd0daea90f1b9ecb21f1
[40/96] ASoC: soc-utils: Remove now redundant non_legacy_dai_naming flag
        commit: 0f91b4de756415382c10c502010c7536500a1632
[41/96] ASoC: sunxi: Remove now redundant non_legacy_dai_naming flag
        commit: 4c6391f59c459e7cf8d584299d0746cb681c2cb7
[42/96] ASoC: tegra: Remove now redundant non_legacy_dai_naming flag
        commit: 63c0ec9ebfec499d603993ea8244907bfbe39598
[43/96] ASoC: test-component: Remove now redundant non_legacy_dai_naming flag
        commit: 485c5924f262d4aef720c508ee2ff3cb8e2e531b
[44/96] ASoC: topology: KUnit: Remove now redundant non_legacy_dai_naming flag
        commit: 7cfb102a55556f5f165a2150a6f77a5aa7257599
[45/96] ASoC: uniphier: Remove now redundant non_legacy_dai_naming flag
        commit: 36e79a44b12e4ce2d8659f47dbcce42690919567
[46/96] ASoC: ad*: Remove now redundant non_legacy_dai_naming flag
        commit: d9e7ddb98604de6470a0fe4f9e2434a55ca35730
[47/96] ASoC: ak*: Remove now redundant non_legacy_dai_naming flag
        commit: 410e73a5338d72c31a32a50c1629d81d8ce6a71f
[48/96] ASoC: alc*: Remove now redundant non_legacy_dai_naming flag
        commit: 60d28b5c47c7f02bb52fc5e52a84d669b9b54dbc
[49/96] ASoC: cs*: Remove now redundant non_legacy_dai_naming flag
        commit: ff946fd98bffe5de450047f54a27492827186b75
[50/96] ASoC: da*: Remove now redundant non_legacy_dai_naming flag
        commit: c03a5b4c419799676013cb0c58c03e00ebe21a61
[51/96] ASoC: es*: Remove now redundant non_legacy_dai_naming flag
        commit: f0b163b4d5a215f610bd64eb8ab8a8906e53bec6
[52/96] ASoC: max*: Remove now redundant non_legacy_dai_naming flag
        commit: d2d3219ebe568fe4ee90ac748939304f7e05a8ec
[53/96] ASoC: msm*: Remove now redundant non_legacy_dai_naming flag
        commit: 736f48714c1b85b0b1f6c88af07989a5828531c9
[54/96] ASoC: nau*: Remove now redundant non_legacy_dai_naming flag
        commit: c2fd88f0029172679917ebc536cfdc4b8fabe168
[55/96] ASoC: pcm*: Remove now redundant non_legacy_dai_naming flag
        commit: 8d4470b8d08b4aab5136cc3265eb0b05d2a1c72d
[56/96] ASoC: rt*: Remove now redundant non_legacy_dai_naming flag
        commit: a524837ddd11bc20ec59d033d0260707cfa3cb99
[57/96] ASoC: spdif: Remove now redundant non_legacy_dai_naming flag
        commit: 792a8a944e7aa3f6ae0733429ba9937d7029ee4b
[58/96] ASoC: ssm*: Remove now redundant non_legacy_dai_naming flag
        commit: a4311a5b1502f747576e5995d1b5ab04f60033f9
[59/96] ASoC: sta*: Remove now redundant non_legacy_dai_naming flag
        commit: 402f437b43870e65377bb97240ee3911858547cb
[60/96] ASoC: tas*: Remove now redundant non_legacy_dai_naming flag
        commit: 02bcc2be4c12763dd4c524e67973afe4d8ea6d4c
[61/96] ASoC: tfa*: Remove now redundant non_legacy_dai_naming flag
        commit: c91f7e94ce931f058543174a409bb082208cae4a
[62/96] ASoC: tlv320*: Remove now redundant non_legacy_dai_naming flag
        commit: 04f3d715df3a463985dc25e55a55dbd970dd77b7
[63/96] ASoC: twl*: Remove now redundant non_legacy_dai_naming flag
        commit: 5947b42cbe0ee580c31f7f327119e7f7c703c25c
[64/96] ASoC: uda*: Remove now redundant non_legacy_dai_naming flag
        commit: 792008f6df86f7e5f861ef80fd4d6eb444a4aa92
[65/96] ASoC: wm*: Remove now redundant non_legacy_dai_naming flag
        commit: 02004449dbe6ec05b5b64a88824939b8fe474b82
[66/96] ASoC: 88pm860x: Remove now redundant non_legacy_dai_naming flag
        commit: 4c90eebd97c519361f32e11de991e299f5b47e3d
[67/96] ASoC: ab8500: Remove now redundant non_legacy_dai_naming flag
        commit: bb426d37dcd9a1474f785fea434875233d24e537
[68/96] ASoC: ac97: Remove now redundant non_legacy_dai_naming flag
        commit: 96b409c94d6766ae8faa9f07fabc3694ddb7d018
[69/96] ASoC: ads117x: Remove now redundant non_legacy_dai_naming flag
        commit: e556a108e0aab4688cb0c7b1c0517e3fab8b5eb4
[70/96] ASoC: bd28623: Remove now redundant non_legacy_dai_naming flag
        commit: 310288271f55ae0edccd01257c9fdf460dd45e30
[71/96] ASoC: bt-sco: Remove now redundant non_legacy_dai_naming flag
        commit: 8c657358f685cec541d7ad3c54f899a65f56783e
[72/96] ASoC: cpcap: Remove now redundant non_legacy_dai_naming flag
        commit: 35c5013ce7ca3ad55974e3517273a0e42140b5e7
[73/96] ASoC: cq93vc: Remove now redundant non_legacy_dai_naming flag
        commit: 73a3dca65cbe5e7de20f3453b6881acf3fb3cfbe
[74/96] ASoC: cx20442: Remove now redundant non_legacy_dai_naming flag
        commit: a0b6e4048228829485a43247c12c7774531728c4
[75/96] ASoC: dmic: Remove now redundant non_legacy_dai_naming flag
        commit: 4eaf75fa427262289a2bc34d3fcfbc602ebbacfa
[76/96] ASoC: gtm601: Remove now redundant non_legacy_dai_naming flag
        commit: 33b179e7513c30f03277f5de2a845e940a9bde9c
[77/96] ASoC: hdac_hdmi: Remove now redundant non_legacy_dai_naming flag
        commit: f02a7d11998eefe8c5627b93627469a0aab8d3da
[78/96] ASoC: hdmi-codec: Remove now redundant non_legacy_dai_naming flag
        commit: f5f8019371b42c742d9777052c189e89a0745319
[79/96] ASoC: ics43432: Remove now redundant non_legacy_dai_naming flag
        commit: e8f88be5c1548791397dadf2250fb5dcc9461f10
[80/96] ASoC: inno_rk3036: Remove now redundant non_legacy_dai_naming flag
        commit: 1f1ee5ae7a8b3d30cbfe18561a4e3b7430e96c9f
[81/96] ASoC: Intel: avs: Remove now redundant non_legacy_dai_naming flag
        commit: 22afe04dd84a63440e69dfc7f0e670404fbce831
[82/96] ASoC: isabelle: Remove now redundant non_legacy_dai_naming flag
        commit: 328bd81743f0823d9604b0098c95f071e7d02805
[83/96] ASoC: jz4740: Remove now redundant non_legacy_dai_naming flag
        commit: dd213681c801fd9d26aef95f4eb563c38f4967f9
[84/96] ASoC: lm49453: Remove now redundant non_legacy_dai_naming flag
        commit: 191889406df931cc2e40abf0a0de141b098f0481
[85/96] ASoC: lochnagar: Remove now redundant non_legacy_dai_naming flag
        commit: 34b89b309441f7f45f68d7ec3633ee3d50921bc8
[86/96] ASoC: mc13783: Remove now redundant non_legacy_dai_naming flag
        commit: 139db4ad9e0b793ffd3f4f23976bf72d5e4e6703
[87/96] ASoC: ml26124: Remove now redundant non_legacy_dai_naming flag
        commit: 7e6fcd7f6223ab32bdccc5e22cdec780cde305c3
[88/96] ASoC: rk817: Remove now redundant non_legacy_dai_naming flag
        commit: 2e938b8edfedb73efd07545a58fe51bb7fc48a56
[89/96] ASoC: sgtl5000: Remove now redundant non_legacy_dai_naming flag
        commit: 81ed3cb8d93936fe32b2b5c213dd56d8ecae7be8
[90/96] ASoC: si476x: Remove now redundant non_legacy_dai_naming flag
        commit: 89571b892e74b9724e155774576651cd675b4110
[91/96] ASoC: stac9766: Remove now redundant non_legacy_dai_naming flag
        commit: e5257aa583b6d9f80e3aaa3ed6fc68c1b1b5925a
[92/96] ASoC: sti-sas: Remove now redundant non_legacy_dai_naming flag
        commit: 20b1894d16547dcd99f190f5a0604a06a0c4479f
[93/96] ASoC: tscs42xx: Remove now redundant non_legacy_dai_naming flag
        commit: c06fb318493a059ac2c47937761d048f9ab1b542
[94/96] ASoC: wl1273: Remove now redundant non_legacy_dai_naming flag
        commit: 11c8bfaacbcd6c8251f65101d5ceeb173a76b1a3
[95/96] ASoC: zl38060: Remove now redundant non_legacy_dai_naming flag
        commit: 4a7a283a41dad608ce32c4ed623cc2caf68150c4
[96/96] ASoC: soc-component: Remove non_legacy_dai_naming flag
        commit: 01936221278c5af60d82b8e78ca74caa491c0d31

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
