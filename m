Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA6C5D7BA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43FC10EA7E;
	Fri, 14 Nov 2025 14:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FpunoxP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A9910EA7E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:10:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EBD94419C5;
 Fri, 14 Nov 2025 14:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165A5C4CEF1;
 Fri, 14 Nov 2025 14:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763129401;
 bh=zZtG6i2vyir0A4b+DouAIW94pkx+ojIExR3ZO6tDmNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FpunoxP60v+5dUxwCAazofC5RJxl/5GQQYgGMVTLCYGFWM3QLAa+iEnzuSMH7xQKB
 vTO7JnTj1oGebC55Zu2XRZuwn+w4vsKvFp2e96PwwCMvfabTcwPjo5FAhJ7L9RXHks
 BZCgmwDbnPQMrYxYvjy+Svnffy7IWC5vfyL2Ih+OOcjZWvB4qn7EnlvypYYkyvguOV
 xqMljjiEzULvxgMe0yV2+MwrRGIv0CHR6kEMs502t+DoVQUbF41P+LzG26U/Bm0m9H
 bvVha/n4L9B8aT21jsB+PLLUCD2HzS2jFqI3ourRusT9vco57R/x+McXTiJDmWfnsu
 KQoyJR5I5ewzQ==
Date: Fri, 14 Nov 2025 14:09:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pengutronix <kernel@pengutronix.de>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: apply the initial backlight state
 with sane defaults
Message-ID: <f492d4d3-751c-40a3-bb93-0e1bb192cde7@sirena.org.uk>
References: <20250731-blpwm-v1-1-0171fd31bff9@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="G9Nw75ZHFmBZf+rF"
Content-Disposition: inline
In-Reply-To: <20250731-blpwm-v1-1-0171fd31bff9@pengutronix.de>
X-Cookie: A closed mouth gathers no foot.
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


--G9Nw75ZHFmBZf+rF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 10:47:18AM +0200, Michael Grzeschik wrote:
> Currently when calling pwm_apply_might_sleep in the probe routine
> the pwm will be configured with an not fully defined state.
>=20
> The duty_cycle is not yet set in that moment. There is a final
> backlight_update_status call that will have a properly setup state.
> However this change in the backlight can create a short flicker if the
> backlight was already preinitialised.

I'm seeing the libre.computer Renegade Elite producing warnings during
boot in -next which bisect to this patch.  The warnings are:

[   24.175095] input: adc-keys as /devices/platform/adc-keys/input/input1
[   24.176612] ------------[ cut here ]------------
[   24.177048] WARNING: CPU: 0 PID: 0 at kernel/context_tracking.c:127 ct_k=
ernel_exit.constprop.0+0x98/0xa0

=2E..

[   24.190106] Call trace:
[   24.190325]  ct_kernel_exit.constprop.0+0x98/0xa0 (P)
[   24.190775]  ct_idle_enter+0x10/0x20
[   24.191096]  cpuidle_enter_state+0x1fc/0x320
[   24.191476]  cpuidle_enter+0x38/0x50
[   24.191802]  do_idle+0x1e4/0x260
[   24.192094]  cpu_startup_entry+0x34/0x3c
[   24.192444]  rest_init+0xdc/0xe0
[   24.192734]  console_on_rootfs+0x0/0x6c
[   24.193082]  __primary_switched+0x88/0x90
[   24.193445] ---[ end trace 0000000000000000 ]---

which seems a little surprising but there is some console stuff there
that looks relevant.

Full log:

    https://lava.sirena.org.uk/scheduler/job/2086528#L897

bisect log:

# bad: [0f2995693867bfb26197b117cd55624ddc57582f] Add linux-next specific f=
iles for 20251114
# good: [0612cb166982c135656540724929ca631b2dab5b] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [123cd174a3782307787268adf45f22de4d290128] ASoC: Intel: atom: Repla=
ce strcpy() with strscpy()
# good: [4d6e2211aeb932e096f673c88475016b1cc0f8ab] ASoC: Intel: boards: fix=
 HDMI playback lookup when HDMI-In capture used
# good: [1d562ba0aa7df81335bf96c02be77efe8d5bab87] spi: dt-bindings: nuvoto=
n,npcm-pspi: Convert to DT schema
# good: [1701b282ccc37f6cfbe79f6ca5ebd20040178f33] Merge branch 'kvm-arm64/=
vgic-lr-overflow' into kvmarm/next
# good: [9a2292c50d1c68ea7b95aabfcbb07cf649736384] KVM: arm64: GICv3: Set I=
CH_HCR_EL2.TDIR when interrupts overflow LR capacity
# good: [417714763ec144fa6a5af675fd5dc5aa429f67ef] KVM: arm64: GICv3: Decou=
ple ICH_HCR_EL2 programming from LRs
# good: [d78124a65a03f1483c62d8612594d5d833b8e4a5] KVM: arm64: GICv2: Extra=
ct LR computing primitive
# good: [ca30799f7c2d04400a428fbc82aa49dc2493cc1a] KVM: arm64: Turn vgic-v3=
 errata traps into a patched-in constant
# good: [df5dfcad48ca3b5aacb4daf937b7185389498394] KVM: arm64: Turn kvm_vgi=
c_vcpu_enable() into kvm_vgic_vcpu_reset()
# good: [2a69aca33cac6b191fd13c7ea16c33df680a1b0e] KVM: arm64: Add LR overf=
low handling documentation
# good: [435d529bf5cd5646c95d80b76ef1e21f8a63bd81] irqchip/gic: Add missing=
 GICH_HCR control bits
# good: [375e16720b4c8ee04a01de03fb7103ac0a7a4856] KVM: arm64: GICv3: Detec=
t and work around the lack of ICV_DIR_EL1 trapping
# good: [5bebf839b2e7a25850b3a9bd6450148769c6e95d] irqchip/gic: Expose CPU =
interface VA to KVM
# good: [2b36853d7e58fe4a2af498c1d4f5c518fe4980e8] KVM: arm64: GICv3: Avoid=
 broadcast kick on CPUs lacking TDIR
# good: [c6a5d48156340650eea707c085de540b7740186a] KVM: arm64: Invert ap_li=
st sorting to push active interrupts out
# good: [81ef83de94405eaedaf8a6b09fefdbe89029a52d] KVM: arm64: GICv3: Handl=
e LR overflow when EOImode=3D=3D0
# good: [182853c7680aaaf00fffd7cd347ae4aa50805fdf] KVM: arm64: GICv2: Handl=
e deactivation via GICV_DIR traps
# good: [170b047e15afbeaeb95a9b8c936aa5b88538c50f] KVM: arm64: selftests: v=
gic_irq: Add asymmetric SPI deaectivation test
# good: [90d527ac928cfdfc3a1b6ee91ff00d541ea3e444] KVM: arm64: GICv3: Add G=
ICv2 SGI handling to deactivation primitive
# good: [10576b2d86522cc70d8e1d8e121a2cb9c44c2ff3] KVM: arm64: Repack struc=
t vgic_irq fields
# good: [2b0d5d9b39489b9d8171896e8e24d8632c3dc807] ASoC: cs35l56: Support f=
or restoring calibration on
# good: [32172cf3cb543a04c41a1677c97a38e60cad05b6] ASoC: cs35l56: Allow res=
toring factory calibration through ALSA control
# good: [23523e9398efeee6a5741cf97052babf6fb2a808] ASoC: Intel: machine dri=
ver updates for 6.19
# good: [1d5bf23aa1e8aea43beca78dc5d69c68955e8871] ASOC: Intel: sof_sdw: ad=
d quirk for Avell B.ON (OEM rebranded NUC15)
# good: [660d946ce6fd64678b4ed6b083dfc24c0f4d5a69] ASoC: Intel: sof_sdw: Ad=
d quirk to exclude RT722 speaker
# good: [873bc94689d832878befbcadc10b6ad5bb4e0027] ASoC: Intel: sof_sdw: ad=
d codec speaker support for the SKU
# good: [dfbb57c2767dc128f6360c3e41136bff8fa6f924] ASoC: Intel: soc-acpi-pt=
l-match: add cs42l43_agg_l3_cs35l56_2 support
# good: [69f3474a01e9867dd99fc4b703fa834ea1835c7d] ASoC: cs35l56: Add contr=
ol to read CAL_SET_STATUS
# good: [f78d96c289da743d517f700d3fe7c6c43df667b5] ASoC: Intel: sof_sdw: cr=
eate BT dai link if bt_link_mask is set
# good: [38ecd1384079d5f7b6942b68496ee7e85aa9a883] ASoC: Intel: soc-acpi-in=
tel-ptl-match: Add support for rt722_l0_rt1320_l23
# good: [b3a5302484033331af37569f7277d00131694b57] ASoC: Intel: sof_rt5682:=
 Add quirk override support
# good: [772ada50282b0c80343c8989147db816961f571d] ASoC: cs35l56: Alter err=
or codes for calibration routine
# good: [4acbfcf11cbe6c46c42091b49875c7002b0bff3d] ASoC: dt-bindings: conso=
lidate simple audio codec to trivial-codec.yaml
# good: [e32c402533cc68abe20fcf3246b9ff53e1f96021] ASoC: spacemit: fix inco=
rrect error check for sspa clock
# good: [6985defd1d832f1dd9d1977a6a2cc2cef7632704] regmap: sdw-mbq: Reorder=
 regmap_mbq_context struct for better packing
# good: [66ededc694f1d06a71ca35a3c8e3689e9b85b3ce] PM: hibernate: Use atomi=
c64_t for compressed_size variable
# good: [0b6c10cb8479d0d1b7b208277df2e2afe082d4bd] PM: hibernate: Fix style=
 issues in save_compressed_image()
# good: [fb1ebb10468da414d57153ddebaab29c38ef1a78] regulator: core: disable=
 supply if enabling main regulator fails
# good: [8821c8e80a65bc4eb73daf63b34aac6b8ad69461] ACPI: CPPC: Perform fast=
 check switch only for online CPUs
# good: [2089f086303b773e181567fd8d5df3038bd85937] regulator: mt6363: Remov=
e unneeded semicolon
# good: [6951be397ca8b8b167c9f99b5a11c541148c38cb] ASoC: codecs: pm4125: re=
move duplicate code
# good: [4a58f60df578bb55a1d0adca0c356e03b2818de1] spi: enable the SpacemiT=
 K1 SoC QSPI
# good: [b6f4bd64f453183954184ffbc2b89d73ed8fb135] regulator: irq_helper: r=
eplace use of system_wq with system_dfl_wq
# good: [4db4ce15706d6423cc4cac4b05114b0469507bad] ASoC: stm32: dfsdm: don'=
t use %pK through printk
# good: [4e92abd0a11b91af3742197a9ca962c3c00d0948] spi: imx: add i.MX51 ECS=
PI target mode support
# good: [bd352547df647be8a1e6c9d4ca2b54b459f3abc1] spi: dt-bindings: fsl-qs=
pi: support SpacemiT K1
# good: [1797d254f5c4b46b295527a635af7321a3fe1318] spi: fsl-qspi: add a clo=
ck disable quirk
# good: [106d7641e55a472e7523c1f525c77fb6d420064d] spi: fsl-qspi: add optio=
nal reset support
# good: [56931105074fe7e5fc9d54e3163df3b95075643c] spi: fsl-qspi: introduce=
 sfa_size devtype data
# good: [6b398c1d3da7a673b13b1857f9fff4c15ee20cef] spi: fsl-qspi: switch pr=
edicates to bool
# good: [47d98d432f19030faf06d4b2ca7fc7493057cae1] ASoC: Merge up fixes
# good: [873a46141460d209bb62eaa0dc9e7b67bff924a6] spi: dt-bindings: fsl-qs=
pi: add optional resets
# good: [abc9a349b87ac0fd3ba8787ca00971b59c2e1257] spi: fsl-qspi: support t=
he SpacemiT K1 SoC
# good: [55d03b5b5bdd04daf9a35ce49db18d8bb488dffb] spi: imx: remove CLK cal=
culation and check for target mode
# good: [6d34b66fb726a613b98c936adee70d42aa5e4aa7] ASoC: soc-pcm: Preserve =
hw parameters from components in dpcm_runtime_setup_fe
# good: [1044821176a64a8dc7f861e878506cde34c8b658] Add support MT6316/6363/=
MT6373 PMICs regulators
# good: [6bd1ad97eb790570c167d4de4ca59fbc9c33722a] regulator: pf9453: Fix k=
ernel doc for mux_poll()
# good: [8d204b6f1f7a6d5c74e5cbf09539e6081ee0a9be] dt-bindings: arm: docume=
nt the static TPDM compatible
# good: [7a381e373a4243926a41b8e6ebbdeb90fe9afda3] ASoC: qcom: q6dsp: fixes=
 and updates
# good: [14ae052f794715c1d78113d87f3d42adf2ae24d0] coresight: tpdm: add sta=
tic tpdm support
# good: [1b0f3f9ee41ee2bdd206667f85ea2aa36dfe6e69] ASoC: SDCA: support Q7.8=
 volume format
# good: [82a224498005b2a2e8edaba8e6b89464688f20e1] rcutorture: Make TREE04 =
use CONFIG_RCU_DYNTICKS_TORTURE
# good: [f121fbbdafeb98c5961c83d23628eee96e6dc28a] rcutorture: Permit kvm-a=
gain.sh to re-use the build directory
# good: [80bde964824757f9d8f8556bdbbf7c44785f24b3] ipe: Update documentatio=
n for script enforcement
# good: [58ac42f278054fbc4c3f174524280d7263b0699a] srcu: Permit Tiny SRCU s=
rcu_read_unlock() with interrupts disabled
# good: [7139c860650535cf517a9344212ce56a21ba37f5] KVM: x86/mmu: Drop the r=
eturn code from kvm_x86_ops.remove_external_spte()
# good: [ba53f22ebe9e09f1c42f50d34f4deb27e5615f6a] Merge branch 'for-6.19' =
into for-next
# good: [6e00112d31c86029ad0440f8c29ee0d131984cda] ASoc: qcom: q6asm: Use a=
utomatic cleanup of kfree()
# good: [680c683c8f49455bcfa1604eac4e508ba96ccbfa] ASoC: qcom: q6asm-dai: U=
se guard() for spin locks
# good: [74cc4f3ea4e99262ba0d619c6a4ee33e2cd47f65] ASoC: qcom: q6adm: the t=
he copp device only during last instance
# good: [35501ac3c7d40a7bb9568c2f89d6b56beaf9bed3] coresight: ETR: Fix ETR =
buffer use-after-free issue
# good: [55094e55ae36c7566e29ae0473d205dbc9d2f4a8] ASoc: qcom: q6afe: Use a=
utomatic cleanup of kfree()
# good: [40a7c5db9020079547358f486ef12d57c1a7aa1f] dt-bindings: regulator: =
Document MediaTek MT6316 PMIC Regulators
# good: [44432315444cbbedadbb9d808c9fc8c8b21cb4bf] ASoC: qcom: q6asm-dai: u=
se q6asm_get_hw_pointer
# good: [e386c2cf3df2b62a6cc78d2f7984102b64753bee] ASoC: qcom: q6asm-dai: s=
chedule all available frames to avoid dsp under-runs
# good: [be04e96ba911fac1dc4c7f89ebb42018d167043f] cgroup/cpuset: Globally =
track isolated_cpus update
# good: [b1034a690129acd8995137bf4462470b4a2aa690] cgroup/cpuset: Ensure do=
main isolated CPUs stay in root or isolated partition
# good: [bfbb12dfa144d45575bcfe139a71360b3ce80237] ASoC: qcom: q6asm-dai: p=
erform correct state check before closing
# good: [88a5f8e628ef745bb94bdf2fa019d9f8e069ccea] ASoc: qcom: audioreach: =
Use automatic cleanup of kfree()
# good: [bcb3f6f5286b96ff0a7106d2ca7208744b20b37e] ASoc: qcom: audioreach: =
remove unused variables
# good: [3c36965df80801344850388592e95033eceea05b] regulator: Add support f=
or MediaTek MT6363 SPMI PMIC Regulators
# good: [de8e95773c48bad9d7339ccb376ad22d93932468] ASoc: qcom: q6prm: Use a=
utomatic cleanup of kfree()
# good: [950a4e5788fc7dc6e8e93614a7d4d0449c39fb8d] ASoC: qcom: q6apm-dai: s=
et flags to reflect correct operation of appl_ptr
# good: [b6a1d7243ec3a3fe1a3c2969fcd32c802fb5d2a9] ASoC: qcom: q6asm: add q=
6asm_get_hw_pointer
# good: [f678ea19e8f60b05b8d3a5bcda9a238d5355bd50] ASoC: qcom: q6asm: set r=
untime correctly for each stream
# good: [896f1e4e106449ac2b39f0ca62b6afaed540f758] ASoc: qcom: q6adm: Use a=
utomatic cleanup of kfree()
# good: [655079ac8a7721ac215a0596e3f33b740e01144a] ASoC: qcom: q6asm: Use g=
uard() for spin locks
# good: [89cf2223ee7bd83d45c6bef3ac52bedd018f77dd] ASoc: qcom: q6apm: Use a=
utomatic cleanup of kfree()
# good: [0cf064be87a6ae0708f171c6b863b26ba9453054] nvmem: Add driver for th=
e eeprom in qnap-mcu controllers
# good: [a354f030dbce17ab3cf299660a38b162d97f7151] ASoC: qcom: q6asm: handl=
e the responses after closing
# good: [b828059f86f67729aae3934650ae9e44a59ff9d8] ASoC: qcom: q6apm-dai: U=
se guard() for spin locks
# good: [81c53b52de21b8d5a3de55ebd06b6bf188bf7efd] ASoC: qcom: qdsp6: q6asm=
-dai: set 10 ms period and buffer alignment.
# good: [d0f9f5b7a3356b43f78b37b9cc3671ecc7469356] dt-bindings: regulator: =
Document MediaTek MT6363 PMIC Regulators
# good: [a87a7b3530728fb7477a74c27fc27e060bf5684f] regulator: Add support f=
or MediaTek MT6316 SPMI PMIC Regulators
# good: [4b1edbb028fb95b546893068b321a983b1ef50bc] ASoC: qcom: q6afe: Use g=
uard() for spin locks
# good: [aa897ffc396b48cc39eee133b6b43175d0df9eb5] ASoC: dt-bindings: ti,pc=
m1862: convert to dtschema
# good: [2f538ef9f6f7c3d700c68536f21447dfc598f8c8] spi: aspeed: Use devm_io=
unmap() to unmap devm_ioremap() memory
# good: [8b6faa7fddf0ae69c5f1a9315a64edee6f022037] spi: tegra210-quad: Impr=
ove timeout handling under
# good: [47955b58cf9b97fe4dc2b0d622b8ea3a2656bbf9] x86/cpufeatures: Correct=
 LKGS feature flag description
# good: [b4e002d8a7cee3b1d70efad0e222567f92a73000] spi: tegra210-quad: Fix =
timeout handling
# good: [6022eacdda8b0b06a2e1d4122e5268099b62ff5d] spi: tegra210-quad: Refa=
ctor error handling into helper functions
# good: [1149fcf75972f6918aeb05303b1aa1e38e0df6eb] tracing: Add an option t=
o show symbols in _text+offset for function profiler
# good: [3b071bdd26849172101081573a18022af108fb21] ASoC: tas2781: Replace d=
eprecated strcpy() with strscpy()
# good: [9de2057bbdfb58f4d9bb1476135317cd3fe6aa52] regulator: pf9453: optim=
ize PMIC PF9453 driver
# good: [ecaba8b7990d8c6d8ba097cd4499b3b92d9df6ea] ASoC: tas2781: Add tas58=
22 support
# good: [c4e68959af66df525d71db619ffe44af9178bb22] ASoC: dt-bindings: ti,ta=
s2781: Add TAS5822 support
# good: [af9c8092d84244ca54ffb590435735f788e7a170] regmap: i3c: Use ARRAY_S=
IZE()
# good: [380fd29d57abe6679d87ec56babe65ddc5873a37] spi: tegra210-quad: Chec=
k hardware status on timeout
# good: [e2d4f42271155045a49b89530f2c06ad8e9f1a1e] rseq: Rework the TIF_NOT=
IFY handler
# good: [a4438f06b1db15ce3d831ce82b8767665638aa2a] PCI/TSM: Report active I=
DE streams
# good: [290b633a7d8ad56f1176c4e89bce8cb5092e6cea] PCI: Establish document =
for PCI host bridge sysfs attributes
# good: [b2cfc0cd68b830dde80fce2406580e258a1e976d] uaccess: Provide put/get=
_user_inline()
# good: [947eaef21577f52db046992c887ed9698f9d883c] ASoC: max98090/91: addin=
g two virtual Mux widgets for digital mics
# good: [f47e782c45f8f0c3d7b84edd7e94bfce9eb00b64] ASoC: max98090/91: addin=
g the two virtual Mux widgets in the routes
# good: [9115815afbc3815391a82d192f9b12aaff1e4ce8] rtc: rx8025: stop settin=
g max_user_freq
# good: [84194c66aaf78fed150edb217b9f341518b1cba2] ASoC: codecs: aw88261: p=
ass pointer directly instead of passing the address
# good: [252abf2d07d33b1c70a59ba1c9395ba42bbd793e] regulator: Small cleanup=
 in of_get_regulation_constraints()
# good: [164d1037c4f86828b77a15c9071f051c5acddc93] ASoC: codecs: simplify a=
w87390_init() argument a bit
# good: [0144a2b29d95af8523c308116de65d398d6e935b] regulator: pf9453: remov=
e low power mode
# good: [2ecc8c089802e033d2e5204d21a9f467e2517df9] regulator: pf9453: remov=
e unused I2C_LT register
# good: [a2d4691b3fec6a2360e4ec953d06819ea055c3e7] regulator: pf9453: chang=
e the device ID register address
# good: [1a88479436a52452429f6d50ec5bd0a546406485] ASoC: fsl_spdif: Constif=
y some structures
# good: [d776e805f197cb055c759d190bcc249072244d1c] thunderbolt: Update NVM =
firmware upgrade documentation
# good: [bb8222b6f3586168f66ae5678fdca3179af60821] Merge patch series "targ=
et: RW/num_cmds stats improvements"
# good: [44bf8bbe29fd50ed2b8dfd1873bd22f76ca2f4d9] tools/nolibc: add the mo=
re portable inttypes.h
# good: [94a3a95f03154d8d4c6206950a7f6ef9a30baec6] regcache: Add ->populate=
() callback to separate from ->init()
# good: [44c1a444b030647803d900e60f5a8af31a782f0e] regcache: flat: Split ->=
populate() from ->init()
# good: [27fef3048fe95934f6f2f87341eb33ef6581a075] regcache: flat: Remove u=
nneeded check and error message for -ENOMEM
# good: [ed5d499b5c9cc11dd3edae1a7a55db7dfa4f1bdc] regcache: maple: Split -=
>populate() from ->init()
# good: [bda6f8749c8e0b10f083dc7a1edf169f349fb776] regcache: rbtree: Split =
->populate() from ->init()
# good: [90e69d291d195d35215b578d210fd3ce0e5a3f42] tracing: fprobe: Remove =
unused local variable
# good: [3c0c81de525d2a2718e23754a5795483167904ac] prandom: remove next_pse=
udo_random32
# good: [db66398fb03ee3599ec7387ceb5121b95e648eb3] Add support for an exter=
nal Master Clock in the
# good: [295f58fdccd05b2d6da1f4a4f81952ccb565c4dc] interconnect: qcom: sdx7=
5: Drop QPIC interconnect and BCM nodes
# good: [92ad6505a4b5e28afcc8cf5f4dd3fd137e58026b] x86/sev: Include XSS val=
ue in GHCB CPUID request
# good: [3d8096fd378b0b4dae356e6f037d03da83f559d2] ASoC: qcom: sdw: fix mem=
ory leak
# good: [f1dfbc1b5cf8650ae9a0d543e5f5335fc0f478ce] ASoC: max98090/91: fixin=
g the stream index
# good: [70713fe90439613f2ec50610cc70481f95d09279] sysctl remove __user qua=
lifier from stack_erasing_sysctl buffer argument
# good: [ecd0de438c1f0ee86cf8f6d5047965a2a181444b] spi: tle62x0: Add newlin=
e to sysfs attribute output
# good: [6ef8e042cdcaabe3e3c68592ba8bfbaee2fa10a3] ASoC: codec: wm8400: rep=
lace printk() calls with dev_*() device aware logging
# good: [44df6a7821ed393658903bf5c1da0b9921bd1025] sysctl: Move jiffies con=
verters to kernel/time/jiffies.c
# good: [e73b743bfe8a6ff4e05b5657d3f7586a17ac3ba0] ASoC: soc-core: check op=
s & auto_selectable_formats in snd_soc_dai_get_fmt() to prevent dereference=
 error
# good: [ef37146360385282b5f6a5b4bf695db30d609887] ASoC: SOF: Intel: remove=
 hyphen from AMP<index> name_prexix
# good: [9b8dde0f4b26de59f64cb824669151476f76b8ba] sysctl: Wrap do_proc_dou=
intvec with the public function proc_douintvec_conv
# good: [ca8313fd83399ea1d18e695c2ae9b259985c9e1f] x86/microcode: Mark earl=
y_parse_cmdline() as __init
# good: [cf6bf51b53252284bafc7377a4d8dbf10f048b4d] ASoC: cs4271: Add suppor=
t for the external mclk
# good: [3d66c4e14fbf4d59ca4665391d133655fa668042] tools/nolibc: add option=
 to disable runtime
# good: [1e5351ba60f5355809f30c61bbd27e97611d2be9] ASoC: cs4271: Disable re=
gulators in component_probe() error path
# good: [3cd523ba270665861647304aa30500f238ebf26e] ASoC: dt-bindings: cirru=
s,cs4271: Document mclk clock
# good: [2b4d53eb5cf32c5b7b7616f23f08471fd8b3708e] ASoC: SOF: Intel: select=
 SND_SOC_SDW_UTILS in SND_SOC_SOF_HDA_GENERIC
# good: [bcba17279327c6e85dee6a97014dc642e2dc93cc] ASoC: qcom: sdw: fix mem=
ory leak for sdw_stream_runtime
# good: [541aecd34383a85eaf7c8556779466e394554fed] ASoC: SOF: pcm: Set the =
PCM device name for HDMI
# good: [089c0a9853ae6b297adf6e2f3b94e4f75dc1f97f] tools/nolibc: remove out=
dated comment about __sysret() in mmap()
# good: [d02460317ed9c95aa2c5f6ff1c70e22e1857d95d] ASoC: qcom: sdw: remove =
redundant code
# good: [b69165a09727b653993934d700a02d32a8961327] rust: auxiliary: move pa=
rent() to impl Device
# good: [8fdb030fe283c84fd8d378c97ad0f32d6cdec6ce] ASoC: qcom: sc7280: make=
 use of common helpers
# good: [20bcda681f8597e86070a4b3b12d1e4f541865d3] ASoC: codecs: va-macro: =
fix revision checking
# good: [f9f4fda15e720686f1b2b436591ab11255e4e85e] pinctrl: mcp23s08: init =
reg_defaults from HW at probe and switch cache type
# good: [5fa671232f703a404caa05c581411ea858c4cf16] ASoC: qcom: sdm845: make=
 use of common helpers
# good: [e2ff7154813a3834692703852604b2099ecf043a] ASoC: tas2783: Fix build=
 for SoundWire API update
# good: [9c7f7262bc1affb9b9acd2ec2fb1f6314d5d474c] regmap: add flat cache w=
ith sparse validity
# good: [28039efa4d8e8bbf98b066133a906bd4e307d496] MAINTAINERS: remove obso=
lete file entry in DIALOG SEMICONDUCTOR DRIVERS
# good: [e062bdfdd6adbb2dee7751d054c1d8df63ddb8b8] regmap: warn users about=
 uninitialized flat cache
# good: [ac479277c24c859553a6db340aa1518d320bc5e2] Add support for Cirrus L=
ogic CS530x DAC and CODEC
# good: [6e8146909eae3a42807c750ad84e3fa29c192822] Sndcard compatible for q=
rb2210/qcm2290
# good: [a4619aadb308db0418b56b237019dc5ab928aa0b] ALSA: cs35l56: Add suppo=
rt for factory calibration
# good: [060028c7fcdd7bc1c6ed61fb25380c0d6c36475b] ASoC: spacemit: fix buil=
d warning and error
# good: [eda4a53f8fe021328c468175a02da8d7ad155494] Add SDCA UMP/FDL support
# good: [b90871cba6eda108d5df88bf9932723b9a445690] serial: sc16is7xx: chang=
e conditional operator indentation
# good: [250eddd69da21999007fd09e17a7c43b92cc6220] allwinner: a523: Enable =
I2S and SPDIF TX
# good: [7915d513e22db3226bfc7d5428b6dd6faa3ce181] usb: dwc3: apple: Only s=
upport a single reset controller
# good: [dc74a00c7661a14a672ea7660caca5c4aa661a79] regulator: pca9450: add =
input supply links
# good: [66fecfa91deb536a12ddf3d878a99590d7900277] ASoC: spacemit: use `dep=
ends on` instead of `select`
# good: [f034c16a4663eaf3198dc18b201ba50533fb5b81] ASoC: spacemit: add fail=
ure check for spacemit_i2s_init_dai()
# good: [7a78e387654f20e798ceab5bae9c1f5557416431] ASoC: spacemit: add fail=
ure check for spacemit_i2s_init_dai()
# good: [67e4b0dfcc6702a31fbb6a3015c0dc867e295eb4] ASoC: dt-bindings: allwi=
nner,sun4i-a10-i2s: Add compatible for A523
# good: [4a5ac6cd05a7e54f1585d7779464d6ed6272c134] ASoC: sun4i-spdif: Suppo=
rt SPDIF output on A523 family
# good: [6ddcd78aa7f85e1d94ab7f90c72d1ad0c0c7b6ea] ASoC: dt-bindings: allwi=
nner,sun4i-a10-spdif: Add compatible for A523
# good: [258e7d28a3dcd389239f9688058140c1a418b549] genirq: Add affinity to =
percpu_devid interrupt requests
# good: [013a3a66f25af3fb614f45df43983657514944c4] regmap: sdw-mbq: Don't a=
ssume the regmap device is the SoundWire slave
# good: [46a3df50b0cab466099515f2375b01c5be4fb95c] ALSA: hda/cs35l56: Creat=
e debugfs files for factory calibration
# good: [715159314dfafee66e6deb50b4e3431539a919d8] ASoC: SDCA: Rename Sound=
Wire struct device variables
# good: [7159816707dc7040fe3ac4fa3d7ac3d173bd772a] ASoC: SDCA: Pass SoundWi=
re slave to HID
# good: [cf6290eebe3cc4eb677d11aa061d10cb1df12ab9] ASoC: cs-amp-lib-test: A=
dd cases for factory calibration helpers
# good: [0a5e9769d088bd1d8faf01207210911b9341b62c] ASoC: SDCA: Parse XU Ent=
ity properties
# good: [12aa3160c10a3179c73c4f99a2d5aec0fd907d0c] ASoC: SDCA: Add early IR=
Q handling
# good: [0723affa1bee50c3bd7ca00e00dee07fcef224b8] ASoC: SDCA: Add completi=
on for FDL start and stop
# good: [c7b6c6b60594fd1efe35c61bc6a2176b25263ccc] ASoC: SDCA: Force some S=
DCA Controls to be volatile
# good: [4c33cef58965eb655a0ac8e243aa323581ec025f] regulator: pca9450: link=
 regulator inputs to supply groups
# good: [3cde66094575a5b1310a7631d28761bd3dfcea63] gpio: loongson-64bit: Sw=
itch to dynamic allocate GPIO base in byte mode
# good: [8d557cc4867f2008f440c54b4423464301a1ef4b] ASoC: SDCA: Factor out a=
 helper to find SDCA IRQ data
# good: [cdd27fa3298ad2f39788804f7d09ab31af2b416c] ASoC: cs-amp-lib: Add he=
lpers for factory calibration
# good: [86df0030b71d7172317d957df17524a7fd6232d4] regulator: dt-bindings: =
nxp,pca9450: document input supplies
# good: [56bbda23d4bece7ce998666118a068e4f71d59fb] ASoC: SDCA: Update exter=
nally_requested flag to cover all requests
# good: [191a27faf53edf9e9101901e402bfee49c44073c] ASoC: cs35l56: Create de=
bugfs files for factory calibration
# good: [64670a6c062c4d183c366d46e71ee76395af6a15] ALSA: hda/cs35l56: Set c=
al_index to the amp index
# good: [1afc05996299b4546e8be9b13c89f78e19912c7d] ASoC: cs35l56: Read sili=
con ID during initialization and save it
# good: [dfe7c3401ed3d3bd8e61be8d6d452896513eb52e] ASoC: SDCA: Rely less on=
 the ASoC component in IRQ handling
# good: [390c05f47d0749b24db65586482308c5fd680fe5] ASoC: SDCA: Pass device =
register map from IRQ alloc to handlers
# good: [ef042df96d0e1089764f39ede61bc8f140a4be00] ASoC: SDCA: Add HID butt=
on IRQ
# good: [aed760df8e8ebc2035561e53bef184e6a8240610] slab: convert setup_slub=
_debug() to use __core_param_cb()
# good: [e92e25f777483b7cc3e170214cc84337d7a415cf] ASoC: SDCA: Add UMP time=
out handling for FDL
# good: [7b6be935e7eff06025e18cea4c6620194450abe2] ASoC: SDCA: Parse Functi=
on Reset max delay
# good: [daab108504be73182c16a72b9cfe47ac3b1928ca] ASoC: SDCA: Add UMP buff=
er helper functions
# good: [12dc929c6cc5fb5f82d6f245ceb3548b4c800121] remoteproc: core: Remove=
 unused export of rproc_va_to_pa
# good: [aeaf27ec6571527e750eed84bb3865a0664ae316] ASoC: SDCA: Add FDL-spec=
ific IRQ processing
# good: [c4d096c3ca425562192a3626c30e82651d0f2c1c] ASoC: SDCA: Add SDCA FDL=
 data parsing
# good: [f7097161e94cd39df7a8848ad0de5f394124ed69] ASoC: cs35l56: Add commo=
n code for factory calibration
# good: [907364ea3db47530751add6d2d62122ca17329cb] ASoC: SDCA: Add manual P=
M runtime gets to IRQ handlers
# good: [f1b26faafdc3bb9afd8d3b67089980ef34c7f7db] remoteproc: core: Sort h=
eader includes
# good: [2b62e66626f05e277c8fdeb50d4c1e0cbab2fe0e] ASoC: cs-amp-lib: Add fu=
nction to write calibration to UEFI
# good: [71f7990a34cdb11f82d3cbbcddaca77a55635466] ASoC: SDCA: Add FDL libr=
ary for XU entities
# good: [4795375d8aa072e9aacb0b278e6203c6ca41816a] ASoC: cs-amp-lib-test: A=
dd test cases for cs_amp_set_efi_calibration_data()
# good: [959400caf51eb31f95d1ab754a285b5546ebd3e4] ASoC: cs-amp-lib: Return=
 attributes from cs_amp_get_efi_variable()
# good: [ef24466ee1912997c2bd526194006bbca424c24f] ASoC: cs35l56: Add calib=
ration command to store into UEFI
# good: [c63b2315b9cc6b705205c73dcf4591cfeb9a25ae] ASoC: cs530x: Add CODEC =
and DAC support
# good: [ca4d49f8a21c37be7e5aed80100ca6b13ac3cf9d] ASoC: cs530x: Update the=
 copyright headers
# good: [e973dfe9259095fb509ab12658c68d46f0e439d7] ASoC: qcom: sm8250: add =
qrb2210-sndcard compatible string
# good: [e7434adf0c53a84d548226304cdb41c8818da1cb] ASoC: cs530x: Add SPI bu=
s support for cs530x parts
# good: [d29479abaded34b2b1dab2e17efe96a65eba3d61] ASoC: renesas: fsi: Cons=
tify struct fsi_stream_handler
# good: [38ff69586bbb3a823dd501972e17075374b685a1] ASoC: cs530x: Rename i2c=
 related structures
# good: [bb65cb96f64e9b4ea2bbd41e4591f3da91414fdb] ASoC: dt-bindings: sound=
: cirrus: cs530x: Add SPI bus support
# good: [ddbcd2f396116581ad035fb76a99fc2ed865a85f] ASoC: cs530x: Correct co=
nstant naming
# good: [77a58ba7c64ccca20616aa03599766ccb0d1a330] spi: spi-mem: Trace exec=
_op
# good: [1e0722a77b4e263854a812c9c106ddef8fd56720] ASoC: cs530x: Sort #incl=
ude directives and tydy up whitespaces
# good: [9957614d2b79578b6f9a2512bfbb2bc7bbdc43ce] ASoC: dt-bindings: sound=
: cirrus: cs530x: Add cs530x
# good: [f97ebfda8da28a77a0218a448829451ba7e30d5d] ASoC: cs530x: Remove unu=
sed struct members and constants
# good: [d68eb9096fb065cc0cb5218ae651f54b08de5831] Merge 6.18-rc3 into stag=
ing-next
# good: [01313661b248c5ba586acae09bff57077dbec0a5] regulator: Let raspberry=
pi drivers depend on ARM
# good: [e7ab858390f24a23ba0827066382ba0e6a8e4379] ASoC: cs530x: Correct MC=
LK reference frequency values
# good: [ee4407e1288ab85be16bacc45195b8bb23d44760] ASoC: dt-bindings: qcom,=
sm8250: add QRB2210 soundcard
# good: [c37c3e5e390dcd52cbe6178ac53f5a6131ef6f8c] ASoC: cs530x: Check the =
DEVID matches the devtype
# good: [3941abb26ff327e53e1e8b873cab3ed3d5103eab] ASoC: cs530x: Rename bit=
field to reflect common use for ADC and DAC
# good: [c06a017439110debd335b6864bc2d69835624235] leds: upboard: Fix modul=
e alias
# good: [e30f8e61e2518a837837daa26cda3c8cc30f3226] tracing: Add a tracepoin=
t verification check at build time
# good: [8d4f9b5ff333183e398811bad6f68d1a7f23f967] dt-bindings: fix redunda=
nt quotes on fsl,imx6q-vdoa.yaml
# good: [986e9104b14720bafa2d37dd6217da8151ee4cb8] dt-bindings: bus: don't =
check node names
# good: [2914f6ea90772ce4a8311a6d5b3ab94e3cd31b12] ASoC: soc_sdw_utils: add=
 cs35l57 support
# good: [2528c15f314ece50218d1273654f630d74109583] ASoC: max98090/91: addin=
g DAPM routing for digital output for max98091
# good: [098456f3141bf9e0c0d8973695ca38a03465ccd6] Merge tag 'drm-misc-next=
-2025-10-21' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
# good: [c17fa4cbc546c431ccf13e9354d5d9c1cd247b7c] ASoC: sdw_utils: add nam=
e_prefix for rt1321 part id
# good: [edf5c8920240dcafe830908549a0edee4ba3b4b0] ASoC: SOF: Fix function =
topology name check in profile info output
# good: [fd5ef3d69f8975bad16c437a337b5cb04c8217a2] spi: spi-qpic-snand: mak=
e qcom_spi_ecc_engine_ops_pipelined const
# good: [f76dbe127f1b5910e37dfe307d2de5c13d61ed89] regulator: dt-bindings: =
qcom,rpmh: Add support for PMR735D
# good: [310bf433c01f78e0756fd5056a43118a2f77318c] ASoC: max98090/91: fixin=
g a space
# good: [d054cc3a2ccfb19484f3b54d69b6e416832dc8f4] regulator: rpmh-regulato=
r: Add RPMH regulator support for PMR735D
# good: [7c69694cec869e3bf7c810fd94f860253aeb8053] spi: dt-bindings: don't =
check node names
# good: [d227a8b3e715963b7c034971c3b467d5430a2cab] usb: typec: ps883x: Fix =
missing mutex_unlock()
# good: [108fba26698a75bb8e1acc21553a6860313aebd2] ASoC: Merge up fixes
# good: [638bae3fb225a708dc67db613af62f6d14c4eff4] ASoC: max98090/91: added=
 DAPM widget for digital output for max98091
# good: [45392fd4394cb8d4b39ba0f144651aba05b7b2a7] misc: amd-sbi: Add suppo=
rt for Turin platform
# good: [b9a7c9599120185ae65424cb93ab8af7b9024cf9] misc: amd-sbi: Add helpe=
r function to prepare I3C support
# good: [9ce084e579bf550ee92b1ecbadf1c29a76c1062c] rust: regulator: use `CS=
tr::as_char_ptr`
# good: [4c987d67b31f93ac88f4be6dfec6a169997fc2c8] eeprom: at25: fram: Fix =
chip range in comment
# good: [18e4a02963b7582207b8a7b25d053f40ac206e4d] misc: amd-sbi: Extend su=
pport for MCAMSR protocol for rev 0x21
# good: [1dcd763ba1f62c1305a03bc7d5bd1d44c20a4f5e] rust: clk: use `CStr::as=
_char_ptr`
# good: [6a4f29bc66294d44d61a294e5bdc623eae74587b] ASoC: dt-bindings: don't=
 check node names
# good: [965a39a9627bfaee5a4f7471097439da19008338] rust: opp: use `CStr::as=
_char_ptr`
# good: [900da53226121c1e710ca95857806a136ab281a2] ASoC: rockchip: i2s-tdm:=
 Omit a variable reassignment in rockchip_i2s_tdm_probe()
# good: [5cd5f8fc29fa1b6d7c0a8f2b0a95b896ecadfa42] ASoC: SOF: Intel: add hy=
phen between name and index to amp name_prefix
# good: [ecba655bf54a661ffe078856cd8dbc898270e4b5] ASoC: fsl_aud2htx: add I=
EC958_SUBFRAME_LE format in supported list
# good: [2880c42a0de68e9eb979e5331fbd5b2c79e093ad] ASoC: amd: ps: Propagate=
 the PCI subsystem Vendor and
# good: [e0fb9464295bca2aa92835d02147d3265a83689a] ASoC: use snd_kcontrol_c=
hip() instead of
# good: [8c465b1669bfeaaf0ebd504b96d689e2a2810874] ASoC: spacemit: add i2s =
support to K1 SoC
# good: [df900536e85819f6168783d5f6b3908d47811fdd] gpio: rename gpio_chip_h=
wgpio() to gpiod_hwgpio()
# good: [2497a7116ff9a051d0e78885a27a52213bc2841d] rust: lock: Pin the inne=
r data
# good: [335482a53a5766d20d7a14f0532859a7e84cec0a] Merge tag 'drm-xe-next-2=
025-10-20' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
# good: [17e5a9b77716564540d81f0c1e6082d28cf305c9] KVM: selftests: Forceful=
ly override ARCH from x86_64 to x86
# good: [fb4f1cb3e04d706bc7d02dc6ed9e5baafa903de9] MAINTAINERS: Panfrost: A=
dd Steven Price and Adrian Larumbe
# good: [1c9986e782de45bf32fb4f886a40c1393d169568] dt-bindings: iio: imu: s=
mi330: Add binding
# good: [7ea0468380216c10b73633b976d33efa8c12d375] accel/amdxdna: Support f=
irmware debug buffer
# good: [3d7c626716aae6e96d7d463f184a09df4cd4bdb2] drm/panfrost: Check sgt =
to know whether pages are already mapped
# good: [29dc539d74abd1ec4e509fda29bc821f3586d333] KVM: selftests: Report s=
tacktraces SIGBUS, SIGSEGV, SIGILL, and SIGFPE by default
# good: [182a258b5ec4a45170e776d3a0c0bccfc4fab998] Documentation: kvm: Fix =
ordering
# good: [7e1906643a7374529af74b013bba35e4fa4e6ffc] ASoC: codecs: va-macro: =
Clean up on error path in probe()
# good: [f5a6fa189ad2e73d25e31de3cc7f0bf81907c986] KVM: s390: Replace sprin=
tf with snprintf for buffer safety
# good: [9e851421266baaedf86f8a31b62aeda0c72a88d8] ASoC: codecs: wm8990: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [601e7b30670a25b4cadfb05bded9345126d82b58] ASoC: mediatek: mt8195: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [a7aa34438d6367a34555e8cda99ba379ef52938b] ASoC: codecs: sgtl5000: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [504219ea359c4545176f76bab77e0ba38a8629d7] ASoC: codecs: sta32x: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [ccf4bead907d8be7212e69adeca64a078712d8a6] ASoC: codecs: wm8985: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [ba93cda8cc9eb426c801aa8dca8a0e3874de958f] ASoC: codecs: tas2781: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [b9b68f3a262bce63d4d363f08b345481e4f9d23b] ASoC: mediatek: mt8183: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [7e4cdef1ef8f8a3baa6806d42f6ee2f64d75cc17] ASoC: uniphier: use snd_=
kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [a31e9992873ebf3ff66699ee13fdf847891746c6] ASoC: codecs: tscs42xx: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [661584c295d75ff72fae3569e4f0439325b9835e] ASoC: codecs: wcd938x: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [f4ae2720f353fe58b02f49cc935933dd9ccc8ce4] ASoC: codecs: wcd939x: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [8b412d3233c69a8545ca771c2b4e25774a4a90b0] ASoC: codecs: wm8958: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [386db878776142f262c5997424832090ebe5c196] ASoC: codecs: wm5110: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [3576a8d214386e314e83c36c13eb098433896fbc] ASoC: codecs: wm8996: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [6c8f8e79a3f796106b6de386b2055441b8256efb] ASoC: codecs: wm2000: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [88b0ee610790877bd9e3efcf8f29efd53eac894e] ASoC: codecs: wm_hubs: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [7b0c32cbed761335b0fa7f3db232ad69bc23ce69] samples: rust: debugfs: =
use `core::ffi::CStr` method names
# good: [fcc6ae5198bc13860053ea6e1fb7ca85415c77d0] ASoC: codecs: wm8580: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [6047387ab92acfc77dd981df27adca36b0c2e9ea] ASoC: codecs: rt5670: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [ae7ac6bbf0fa4475cd169b9ad2e7f751a7cb73f3] ASoC: codecs: uda1334: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [c387ff80f77e6832952fb92d511bfcfda6766a54] ASoC: codecs: wm8991: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [64d1d87d185e0cccdaff573e16af074193045167] ASoC: codecs: tas5805m: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [c5c6d972d6450350ecf6b1c6dc7ec7e1462bd221] ASoC: codecs: wcd934x: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [5ab215f2b60ec988e63ddde421eecc6ced137064] ASoC: codecs: rt9123: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [94cd5e54fe56165a2ac7a1ac7b3599a14b9497c0] ASoC: mediatek: mt8192: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [a6531a0414ed50cbbe6244e82fec4d432a207842] ASoC: codecs: tlv320dac3=
3: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [9846cb5a9d06c476c503abfa840251ad3c06414e] ASoC: codecs: wm8400: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [161e3c824e63eec6515f2c7d36fba391647ccf89] ASoC: codecs: wm8904: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [c293d36d1037fc63430f9c4ec7e3fd1e42a50c0e] ASoC: codecs: wm_adsp: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [6e3e296c564399f17e8c99623f8ba608b8fe1b7d] ASoC: codecs: tfa989x: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [d7e1399884a65e868f7b121b8ca5d613cfac6538] ASoC: codecs: rt711-sdca=
: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [bc78514e84035d1a596eb558ce9da9dd5269a85e] ASoC: codecs: wcd937x: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [308eee447306e885254bca4bc23b9f90534feb1a] ASoC: tegra: tegra210: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [d742ebcfe524dc54023f7c520d2ed2e4b7203c19] ASoC: soc.h: remove snd_=
soc_kcontrol_component()
# good: [2c688df0fd19d02146e031502c701c184b86cd0e] ASoC: codecs: rt5665: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [9bce11a336f0d5694340f85bdca81179a02eaa81] ASoC: intel: catpt: use =
snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [96b67f9204fb63168076142777e3cfc2dd236d8c] ASoC: mediatek: common: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [3cba794c8fec8e1d5da6c3c91fafdf490de4b24f] ASoC: codecs: sma1307: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [5190935a1b93940c28cc4f484e17662246648f66] ASoC: codecs: wsa883x: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [41a6e1032c799184586d3c5ecb594cc05b844dc7] ASoC: codecs: wm8960: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [ca6731ad2a4fd1e5fc549d53d4f99445fd552f97] ASoC: rockchip: use snd_=
kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [01511c18f713b7579133f451332a1ccbb634e389] ASoC: codecs: tas571x: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [9a1e055bb51d17a44e6e46e2af922dd0d9a1fe2a] ASoC: codecs: tscs454: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [f72e15146ea024f849143a1d4c65f351cdd12488] ASoC: codecs: wm8731: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [37d9425fc9f19eb92abdcf96189e74e163b94619] ASoC: codecs: tas5086: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [b573898b82abf8d2736c90b14d76f65f9bc8d1f1] ASoC: codecs: twl4030: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [0d58897657a9a31f4817a9596a200815f8c8e602] ASoC: codecs: wm8994: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [2d54738a39b49fc46b4b22472388d74fc698b87f] ASoC: intel: atom: use s=
nd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [a233cb3fe736647ab2a43aeb3ef1fb9a2a0744cf] ASoC: codecs: sta350: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [ecc35b2977af71d5fceef68ca723409cd9592bc3] ASoC: codecs: tlv320aic2=
3: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [f793a6e08f5487b4f1e1207cc4952adc753c1f4b] ASoC: mediatek: mt8188: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [801955fd9248ea5659189b0464e9e4ff0952a11a] ASoC: codecs: wsa884x: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [09b29035fb5c93fa0db24df165081cc27239b1f0] ASoC: codecs: rt5659: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [1a1a66c2cee604dedbd4de3ca7d8e3c38d7de05c] ASoC: codecs: wm8955: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [2191593d061cfee48763d67e69ccb1d27655ee62] ASoC: codecs: rt5631: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [024530ea1a3b6e8c64baa76f046345800b99a1bd] ASoC: codecs: wm5102: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [c7ade18aad3e63e732a93efb5580a4b2e8563d0c] ASoC: codecs: sma1303: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [db1bcf18fe320ff4988a196f969ca739f9c3da95] ASoC: codecs: tas2562: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [c59fe12fa2acb1613eb77fe2d690ab76107bd4a4] ASoC: codecs: twl6040: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [7a0fefe28cc5a127cb63aafb5fe85852d198ee7a] ASoC: codecs: wm8753: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [18096d761f6be5a981f3480f7907859f3a431a0b] ASoC: codecs: wm8903: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [c8e43faeb4a608f45e362c55a1687f3249479a04] ASoC: codecs: wsa881x: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [7e1393622591631673c419197dda2d5ff14aacc1] ASoC: codecs: tas5720: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [73f64a4803f1e092ed83f4e96225f35c42fe4be1] ASoC: fsl: use snd_kcont=
rol_chip() instead of snd_soc_kcontrol_component()
# good: [6bc24a7d35ceaffa0f7551b7bd13b495a27e203c] ASoC: codecs: wcd9335: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [b56580c7ba8ae7ef585a7deefbb137212be6f1f0] ASoC: codecs: tlv320adcx=
140: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [844db7d7e7200e303fa3974e8dae5350646813d1] ASoC: codecs: wm9081: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [95972dd17b189647e96605f4edf2177a8876eb4e] ASoC: codecs: wm8350: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [3314ee8db5411e1f9adc0172ebe425c8a8066cab] ASoC: codecs: wm8962: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [74fdbce5fe88f9204634e3923c86a84c3a505ecd] ASoC: codecs: wm8983: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [626cf62777735ca51a8d88d8dc2e234b56d4f3a7] ASoC: tegra: tegra186: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [b5e0fc69e42b23e86b32f4810a41ff6b842d6426] ASoC: mediatek: mt8186: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [d98fdbdf8bc654242d94616a7bfc233c67b43866] ASoC: codecs: tlv320adc3=
xxx: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [8f1d72f84e85a8757a0981040654be1fd18ea6e3] ASoC: codecs: cs42l84: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [2673034a1911c215f67c64d0b844563f7903a677] ASoC: codecs: max9867: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [1ad2f1c5662fabafc8df405a2e480ba45cdaf054] ASoC: codecs: rt1318: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [46c4e08bb11aeae95c364fa610ac6348896b881a] ASoC: codecs: cs530x: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [2041666b8f4320da1f7b8efacaafab40a745e126] ASoC: codecs: mt6359: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [8b5cc56389d08debb225d94a35e62e11a80a9b4f] ASoC: codecs: da7210: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [c34209ba43623c2ea2593ee332f4e4f6b47fb921] ASoC: codecs: max98088: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [344af572f088e2bb1248bb752ea3a532f7fa4208] ASoC: codecs: ak4641: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [73978d274eba0d9081bc9b5aedebb0bc6abb832c] ASoC: dt-bindings: Add b=
indings for SpacemiT K1
# good: [fce217449075d59b29052b8cdac567f0f3e22641] ASoC: spacemit: add i2s =
support for K1 SoC
# good: [2f0a334df0fd8e0793a7dbea40fca0d4a48dc927] ASoC: codecs: da7218: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [b1daca0396b91a9b436b0654b8aae6a8220aa51b] ASoC: codecs: madera: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [6950709b6658fadc7db860a4ec33de8c5226c728] ASoC: codecs: rt1011: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [afcf45b7555fcc8e2fc177e8d4e7a2d9d79b13eb] ASoC: codecs: aw88261: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [3a071bb34cea8e97e403c7946a1fc03de164f70c] ASoC: codecs: ntp8835: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [be9342c57e28d8e42638e4f234d8727da9ee609e] ASoC: codecs: max98925: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [ddd1705b62c6920b77d8cfcccc695e99dde25ad7] ASoC: codecs: da9055: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [a5e7aaee483c7022e96181ce899944b8c7b1f1e0] ASoC: codecs: fs210x: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [e621116150c5983dde75195f0eb2ea22baf4e87c] ASoC: codecs: cs42l51: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [11c13a65e82afb830fa0f7df2fcf3ed415e6fa1b] ASoC: codecs: lpass-rx-m=
acro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [e7ed084f4cd49806b9ff91d800c6422f96f6f5ea] ASoC: codecs: lpass-tx-m=
acro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [ccbfc923fe935b4f1e3b1e51df828e07473faff9] ASoC: codecs: cs42l43: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [cf9d07738fd94e1c3cf0c3ffb61f4d2d1e4d0c57] ASoC: greybus: use snd_k=
control_chip() instead of snd_soc_kcontrol_component()
# good: [205a7f5c6ec0051248384e7440fb17d3f3aee372] ASoC: codecs: aw88081: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [d9f08106c16a32cb9514986351754d36f3b3c7df] ASoC: codecs: pcm1681: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [a2aa8c0a2f1cbc5be1cb6195038e4484d2af38d9] ASoC: codecs: cs4271: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [c4ec2c9d7329b509e10c8980e4077f823ce68df6] ASoC: codecs: pcm6240: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [7e90cf82a33827e174d3955d3ede1b3e7bb56325] ASoC: codecs: nau8810: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [92ba8c4c78810b991b697af1087ba31226aa5871] ASoC: codecs: ak4458: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [5366dcebe65bf1dc82a7362e505b69d441b5f755] ASoC: codecs: idt821034:=
 use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [13c4c81b7bc819d533c6e0aaa1bf495cd0dfd8f6] ASoC: codecs: es8328: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [0bfe0c0a9aa7edb88f571bfbfc8f4546d6b311cb] ASoC: codecs: cs4234: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [455f2f9509b0034f32979bcdbc5441579c3a1d0a] ASoC: codecs: 88pm860x: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [14af3d3c4d2d8d01d91049576a59590d9c586f3a] ASoC: codecs: nau8822: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [52a87e0b5ec1f7316293773f7859996d123b3ea7] ASoC: codecs: lpass-va-m=
acro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [776b160f3234f85899eb3c8d454c37176484facb] ASoC: codecs: pcm512x: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [f2b55e567172ccb248e66e8a0f1c7380279127f1] ASoC: codecs: cros_ec: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [f7fbe0ea5f03d918418e6ad28d61bcae52bb2d22] ASoC: codecs: cs35l45: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [2e6db9d197ed161702434c6c14b1c65bdef51a2c] ASoC: codecs: ak4619: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [4b5e66fc0315b9a85ce817b97a1f33829eeadd29] ASoC: codecs: da7219: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [404e8bfcb9d6a8b6af4745f23906a7382b7eb4c4] ASoC: codecs: aw88166: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [211367ef1d4031a29fa8e07f430155d68802e8ec] ASoC: codecs: cs43130: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [eb52e20b15eac1c230fb81f7481f6f1299c2a9b8] ASoC: codecs: cs48l32: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [73e86fbf251708bb2766fff746eea0ebb6fe0747] ASoC: codecs: da732x: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [e548389df744bd28db1ba3923b6ee74ba6f73926] ASoC: codecs: max98095: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [c0a750ce364b248efc0f4b993904dcef194612cf] ASoC: codecs: cs42l42: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [6dcc15ed9e1b0ce6b1f3f53af33e2afaf0a53fa0] ASoC: codecs: pm4125: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [3c9e6dccede1146d53f940ff8b25ceee275c0686] ASoC: codecs: msm8916-wc=
d-digital: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [fe0b3f564f9b1ecd74180c296129486d840bc3f9] ASoC: codecs: lpass-wsa-=
macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [fd27a636d3746ae20e0853f4fa48b93080a2a43d] ASoC: codecs: bd28623: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [aab1301cfde344f966bbc442a4e655867ab56768] ASoC: amd: ps: Propagate=
 the PCI subsystem Vendor and Device IDs
# good: [c5f73c6679ef675fdb4e35dbc8ae0ec59eb0526c] ASoC: atmel: use snd_kco=
ntrol_chip() instead of snd_soc_kcontrol_component()
# good: [dc5aa86741789d6dcc0c24dcff5f3ba8fbecccf9] ASoC: codecs: max98090: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [3a3271a52075d4dc34f403c0ed850801cdc4bd4d] ASoC: codecs: da7213: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [3815962969c811bbfa32c7d503246f9abace38cb] ASoC: codecs: cs35l36: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [13b2c42b0dcf539a1ddf18374792a7a49a7afa4d] ASoC: codecs: max98390: =
use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [800c666497e045c3152da516fdd6bc2392571a90] ASoC: codecs: peb2466: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [db25c438f9e02c0f1566d54840640d23f59a3d4f] ASoC: codecs: aw87390: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [0c933edebd96961529e01686ce6930be5decf400] ASoC: codecs: max9768: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [3827b34564951febc0ffa7ce93c1d9c05888e53b] ASoC: codecs: ab8500: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [62b175d6ff19de91544c9047dcaec8a33a5759a1] ASoC: codecs: arizona: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [ee4ac04e3ccd7f4d54e767b7ab5a4067f9737fff] ASoC: codecs: max9759: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [40c729f0a3fa14845d733f5572c283728bea0c32] ASoC: codecs: aw88399: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [9549a29371c5548a4eb0d43622a25d6bc989337f] ASoC: codecs: cs47l15: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [a43676fa0585a9988e44ec000649d20c2649a3e4] ASoC: codecs: aw88395: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [ef464d9c418741ac83a33c7662db3cffda655b4f] ASoC: codecs: mt6358: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [6658472a3e2de08197acfe099ba71ee0e2505ecf] ASoC: amd: amd_sdw: Prop=
agate the PCI subsystem Vendor and Device IDs
# good: [ac7db529b6c2d748102cef60da29f5ea281a757e] ASoC: codecs: mt6660: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [b805b4e062fa216302f86bd66485734683a51236] ASoC: codecs: rt1015: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [3c000883d110b381fca21572147a8c0463ba4a25] ASoC: codecs: adav80x: u=
se snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [a014442252380abd19a81ae27fdfc29b988203c6] ASoC: codecs: cs4270: us=
e snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
# good: [7484e7cd8ab1b78a958a000cc8581cfa1e93daa1] bpf: mark vma->{vm_mm,vm=
_file} as __safe_trusted_or_null
# good: [32e0fa9e01475beba9eeb0a5fdda69762be11947] drm/xe/xe3p_xpc: Add sup=
port for compute walker for non-MSIx
# good: [52ecd48b8d3f5206049758d95ca5b291397b3209] drm/i915/dp: Add helper =
to get min sdp guardband
# good: [1553d6c58870476f29ec0bf43f264094553d1407] drm/xe/xe3p_lpm: Handle =
MCR steering
# good: [a10f5cc3ac9b05c764e87ae13de9a716ff519903] KVM: x86/mmu: Move "dumm=
y root" helpers to spte.h
# good: [7910d69376cde30e5871970d97d1a2e360568474] drm/client: Remove holds=
_console_lock parameter from suspend/resume
# good: [b959e7d402ab74c9e54d9bebfb93aef04dae24c7] x86/hyperv: Add trampoli=
ne asm code to transition from hypervisor
# good: [5677aa6a08c1df8bc1ec71516fe1ced9b7cb545f] HID: intel-ish-hid: ipc:=
 Separate hibernate callbacks in dev_pm_ops
# good: [0cdb2b1b7edaefb54773d790c7b5c2e4ac7db60d] spi: airoha: driver fixe=
s & improvements
# good: [3e9c967f30a6dc57e4386c85ee5b75caee7246e8] hwmon: (mr75203) Drop un=
necessary include file
# good: [0cc08c8130ac8f74419f99fe707dc193b7f79d86] spi: aspeed: Fix an IS_E=
RR() vs NULL bug in probe()
# good: [75616264e0cca5ead432df7236653056b35cb0fc] hwmon: (i5500_temp) Drop=
 unnecessary include files
# good: [233a22687411ea053a4b169c07324ee6aa33bf38] spi: airoha: unify dirma=
p read/write code
# good: [b1fc226edf8680882a5bf89038bdc55afa2ac80d] media: stm32: dma2d: Dro=
p unneeded v4l2_m2m_get_vq() NULL check
# good: [661856ca131c8bf6724905966e02149805660abe] spi: airoha: remove unne=
cessary restriction length
# good: [0743acf746a81e0460a56fd5ff847d97fa7eb370] spi: airoha: buffer must=
 be 0xff-ed before writing
# good: [fb81b5cecb8553e3ca2b45288cf340d43c9c2991] spi: airoha: set custom =
sector size equal to flash page size
# good: [7350f8dc15bfbb7abf1ce4babea6fcace1c574c5] spi: airoha: remove unne=
cessary switch to non-dma mode
# good: [80b09137aeab27e59004383058f8cc696a9ee048] spi: airoha: support of =
dualio/quadio flash reading commands
# good: [902c0ea18a97b1a6eeee5799cb1fd9a79ef9208e] spi: airoha: avoid readi=
ng flash page settings from SNFI registers during driver startup
# good: [93b2838c6e79bc263e6129d88c5ab043dd793d28] Add Audio Support for Ka=
anapali MTP Boards
# good: [d1ff30df1d9a4eb4c067795abb5e2a66910fd108] spi: airoha: reduce the =
number of modification of REG_SPI_NFI_CNFG and REG_SPI_NFI_SECCUS_SIZE regi=
sters
# good: [e8fd8080e7a9c8c577e5dec5bd6d486a3f14011c] media: i2c: max96717: Us=
e %pe format specifier
# good: [70eec454f2d6cdfab547c262781acd38328e11a1] spi: airoha: avoid setti=
ng of page/oob sizes in REG_SPI_NFI_PAGEFMT
# good: [5263cd81578f99a00b2dd7de1da2b570b96a1b7c] rpmh-regulators: Update =
rpmh-regulator driver and
# good: [367ca0688e4218e51c3d4dfdf3ef5657a62cf88d] ASoC: dt-bindings: qcom,=
sm8250: Add kaanapali sound card
# good: [281c97376cfcfc8cef4f5ed5dd961a1b39f5a25e] ASoC: codecs: va-macro: =
Rework version checking
# good: [d77daa49085b067137d0adbe3263f75a7ee13a1b] spi: aspeed: fix spellin=
g mistake "triming" -> "trimming"
# good: [79eaabc61dfbf5a4b680f42d3a113d05333c3960] irqchip/riscv-imsic: Emb=
ed the vector array in lpriv
# good: [4673dbe9837e3eb2fecdd12f0953006c31636aac] ASoC: qcom: sc8280xp: Ad=
d support for Kaanapali
# good: [15afe57a874eaf104bfbb61ec598fa31627f7b19] ASoC: dt-bindings: qcom:=
 Add Kaanapali LPASS macro codecs
# good: [6455ad5346c9cf755fa9dda6e326c4028fb3c853] sched: Move sched_class:=
:prio_changed() into the change pattern
# good: [f80ea8566917c4bb680911db839a170873e5d17c] dmaengine: idxd: drain A=
TS translations when disabling WQ
# good: [abfc01077df66593f128d966fdad1d042facc9ac] sched: Fix do_set_cpus_a=
llowed() locking
# good: [1e570e77392f43a3cdab2849d1f81535f8a033e2] ASoC: mxs-saif: support =
usage with simple-audio-card
# good: [5021ccb44dc6a22a3508316442d1304371ca55db] drm/i915: Reject modes w=
ith linetime > 64 usec
# good: [9b685058ca936752285c5520d351b828312ac965] irqchip/qcom-irq-combine=
r: Fix section mismatch
# good: [942b8db965006cf655d356162f7091a9238da94e] sched: Fix migrate_disab=
le_switch() locking
# good: [0d7f4e99217f6f715c7064c67eae8d9d09313b14] drm/i915/display: Introd=
uce dp/psr_compute_config_late()
# good: [4c95380701f58b8112f0b891de8d160e4199e19d] sched/ext: Fold balance_=
scx() into pick_task_scx()
# good: [bc2c39600212979b6fc836113bde1b707c02f442] dmaengine: sh: Kconfig: =
Drop ARCH_R7S72100/ARCH_RZG2L dependency
# good: [46a177fb01e52ec0e3f9eab9b217a0f7c8909eeb] sched: Add locking comme=
nts to sched_class methods
# good: [00a155c691befdb10bea52c91d4c8c930bdaf73a] Merge branch 'objtool/co=
re' of https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux
# good: [6621b0f118d500092f5f3d72ddddb22aeeb3c3a0] ASoC: codecs: rt5670: us=
e SOC_VALUE_ENUM_SINGLE_DECL for DAC2 L/R MX-1B
# good: [c1afb0350069c3be137b5692923ad13d69648970] Add tegra264 audio devic=
e tree support
# good: [3ba5c78fe7c5d60edae0c47361f191d40c5c1cf0] auxdisplay: linedisp: su=
pport attribute attachment to auxdisplay devices
# good: [835dfb12fc389f36eb007657f163bd1c539dcd45] regulator: dt-bindings: =
rpmh-regulator : Add compatibles for PMH01XX & PMCX0102
# good: [6a8cdef7dc2a4c0dbde3f7d7100b3d99712a766b] regulator: rpmh-regulato=
r: Add support for new resource name format
# good: [65efe5404d151767653c7b7dd39bd2e7ad532c2d] regulator: rpmh-regulato=
r: Add RPMH regulator support for Glymur
# good: [79c36ecfc8994011ab0a973d3b4148aa5d9e0c91] ASoC: use sof_sdw as def=
ault Intel SOF SDW machine
# good: [1356c98ef911e14ccfaf374800840ce5bdcb3bbd] regulator: dt-bindings: =
rpmh-regulator: Update pmic-id DT prop info for new CMD-DB
# good: [42277a1f86a14172c673a249bdc9e757065ca5a1] Merge branch 'for-6.19' =
into for-next
# good: [cee2c8396d9c8e834fe28929bc1d8153d7e9897f] ASoC: use sof_sdw as def=
ault Intel SOF SDW machine
# good: [9a4bbd20a879b66dddb563698345b0ae24d810a6] hwmon: (tmp108) Drop mut=
ex.h include
# good: [fb25114cd760c13cf177d9ac37837fafcc9657b5] regulator: sy7636a: add =
gpios and input regulator
# good: [2c05ca02621837af7cd8fab6ae7421b9cd5dff6e] objtool: Add elf_create_=
reloc() and elf_init_reloc()
# good: [03c19a99ee69f4680d7da11c164ac655b4946b99] objtool: Add elf_create_=
file()
# good: [a758314f71ba90cca2a5813bbf96c4954a15b613] spi: offload: Add offset=
 parameter
# good: [6eaee77923ddf04beedb832c06f983679586361c] bus: mhi: host: pci_gene=
ric: Add Telit FE990B40 modem support
# good: [0b0eb7702a9fa410755e86124b4b7cd36e7d1cb4] ASoC: replace use of sys=
tem_wq with system_dfl_wq
# good: [7d9c2924f61dcabcbc5868bec6054ab4f4de01d1] spi: aspeed: Improve clo=
ck, timing and address
# good: [ed44a5625f304ff14d01acfa086e77b5262a842f] x86/cpu/topology: Make p=
rimary thread mask available with SMP=3Dn
# good: [7c2575a6406fb85946b05d8dcc856686d3156354] objtool/klp: Add --debug=
 option to show cloning decisions
# good: [92a42edd347c3b5a9045bb137a33204c6ddc0803] Add target mode support =
for the DesignWare SPI
# good: [1986798af745e90669cdac753da5d1e43dc8ebcb] dt-bindings: ipmi: Conve=
rt nuvoton,npcm750-kcs-bmc to DT schema
# good: [0d83da43b1e1c8ce19f2bb10f54a0fdf795364f7] objtool/klp: Add --check=
sum option to generate per-function checksums
# good: [c2bc11f1f204ef916ec96e45cf329e42873b37d6] platform/x86:intel/pmc: =
Relocate lpm_req_guid to pmc_reg_map
# good: [433e294c3c5b5d2020085a0e36c1cb47b694690a] regulator: core: forward=
 undervoltage events downstream by default
# good: [50062baa536bcac03804cf04579c71b9351e829c] perf print-events: Remov=
e print_symbol_events
# good: [dd590d4d57ebeeb826823c288741f2ed20f452af] objtool/klp: Introduce k=
lp diff subcommand for diffing object files
# good: [4cdee7888f42f5573b380ddfa9da43208e759bdc] objtool: Fix "unexpected=
 end of section" warning for alternatives
# good: [9b7eacac22693d9177402c9d63e1c1747653d28c] interval_tree: Sync inte=
rval_tree_generic.h with tools
# good: [4109043bff31f95d3da9ace33eb3c1925fd62cbd] modpost: Ignore unresolv=
ed section bounds symbols
# good: [68e71067ec9ad08e1e51c06123a155d0814aff7c] s390/vmlinux.lds.S: Prev=
ent thunk functions from getting placed with normal text
# good: [9ebb662fab38a5942100e597b48de5ec9d5e714d] objtool: Fix broken erro=
r handling in read_symbols()
# good: [9f14f1f91883aa2bfd6663161d2002c8ce937c43] compiler.h: Make address=
able symbols less of an eyesore
# good: [25eac74b6bdbf6d15911b582e747e8ad12fcbf8f] objtool: Add section/sym=
bol type helpers
# good: [a1526bcfcb6cb7cb601b9ff8e24d08881ef9afb8] objtool: Mark prefix fun=
ctions
# good: [122679ebf90eeff97c5f793ed9a289197e0fbb2c] x86/kprobes: Remove STAC=
K_FRAME_NON_STANDARD annotation
# good: [81cf39be3559f3cebef6ad7b0893c06bf5a5847e] objtool: Add empty symbo=
ls to the symbol tree again
# good: [6b4679fcbfdf6f27f8455f9c7050ab6c46c6c5e0] scripts/faddr2line: Use =
/usr/bin/env bash for portability
# good: [3e4b5f66cf1a7879a081f5044ff1796aa33cb999] objtool: Check for missi=
ng annotation entries in read_annotate()
# good: [2b91479776b66cd815e339d420abbf4ae047bfb2] objtool: Resurrect --bac=
kup option
# good: [34244f784c6d062af184944a25f40ab50dfdb67a] objtool: Const string cl=
eanup
# good: [07e1c3fd86d7a2ddce3ebc6b7390590c8524a484] objtool: Make find_symbo=
l_containing() less arbitrary
# good: [c9e9b85d41f9079d6a10faabf70a0b18d5c0f177] objtool: Fix weak symbol=
 hole detection for .cold functions
# good: [72567c630d32bc31f671977f78228c80937ed80e] objtool: Fix weak symbol=
 detection
# good: [c2a3e7af31107a2e1dff92b0601d525466dc21b7] objtool: Fix interval tr=
ee insertion for zero-length symbols
# good: [2bb23cbf3f21919ba17cf63404ec0224bd8bf4fb] objtool: Propagate elf_t=
runcate_section() error in elf_write()
# good: [a040ab73dfd1bc8198848a438f77497d8d03fba9] objtool: Simplify reloc =
offset calculation in unwind_read_hints()
# good: [c2d420796a427dda71a2400909864e7f8e037fd4] elfnote: Change ELFNOTE(=
) to use __UNIQUE_ID()
# good: [6717e8f91db71641cb52855ed14c7900972ed0bc] kbuild: Remove 'kmod_' p=
refix from __KBUILD_MODNAME
# good: [1ba9f8979426590367406c70c1c821f5b943f993] vmlinux.lds: Unify TEXT_=
MAIN, DATA_MAIN, and related macros
# good: [3049fc4b5f1d2320a84e2902b3ac5a735f60ca04] x86/alternative: Refacto=
r INT3 call emulation selftest
# good: [41d24d78589705f85cbe90e5a8c1b55ea05557a2] objtool: Fix x86 addend =
calculation
# good: [b37491d72b43c3a322d396c2d8e951a10be70c17] interval_tree: Fix ITSTA=
TIC usage for *_subtree_search()
# good: [d0ff153cca85520a2a14ee4edf44f6183b2e0e74] drm/xe: Check for primar=
y GT before looking up Wa_22019338487
# good: [afb026b6d35c79f6f47752147327932827aeac8c] compiler: Tweak __UNIQUE=
_ID() naming
# good: [bf770d6d2097a52d87f4d9c88d0b05bd3998d7de] x86/module: Improve relo=
cation error messages
# good: [7f47685b150dbc20f881d029a7366a81b1d66322] ASoC: SOF: Intel: use so=
f_sdw as default SDW machine driver
# good: [225d70b8074502acee3943bf0c2e839e867cd38c] ASoC: SOF: don't check t=
he existence of dummy topology
# good: [506cbe36a2ac7b504a2362476dc53cd548b7a29e] ASoC: soc_sdw_utils: exp=
ort asoc_sdw_get_dai_type
# good: [0d202ae0256e8e7dcea862ead5904fa27cf4ce6a] ASoC: SOF: add platform =
name into sof_intel_dsp_desc
# good: [3180c7b1575d635851f0ceab6bdb176bb15e69dd] ASoC: soc-acpi: make som=
e variables of acpi adr and link adr non-const
# good: [aa1ee85ce3576defd29f2a389d7508d2036af977] ASoC: soc_sdw_utils: add=
 name_prefix to asoc_sdw_codec_info struct
# good: [50292f9af8ec06dd1679943cddc3b59844266b9e] drm/xe: Move 'vm_max_lev=
el' flag back to platform descriptor
# good: [bb940b13998c40d55e186f0cf5d65c592ea1677a] ASoC: SOF: Don't print t=
he monolithic topology name if function topology may be used
# good: [a312acdcec57b3955fbf1f3057c13a6d38e4aa2a] drm: atmel-hlcdc: fix at=
mel_xlcdc_plane_setup_scaler()
# good: [55f8b5a96597a7b88c323a7de7228f9eae8c9943] ASoC: Intel: export sof_=
sdw_get_tplg_files
# good: [7e7e2c6e2a1cb250f8d03bb99eed01f6d982d5dd] ASoC: sof-function-topol=
ogy-lib: escalate the log when missing function topoplogy
# good: [0f60b8508ca2ac685e0400cd802d1251a9d67ee4] mshv: Introduce new hype=
rcall to map stats page for L1VH partitions
# good: [0bd0a4a1428baaf4447e95f0832492d9e3d64961] KVM: TDX: Replace kmallo=
c + copy_from_user with memdup_user in tdx_td_init()
# good: [9259607ec7100118cc5c608d97c9d406501e861e] KVM: Explicitly allocate=
/setup irqfd cleanup as per-CPU workqueue
# good: [b83fb1b14c06bdd765903ac852ba20a14e24f227] spi: offload: Add offset=
 parameter
# good: [99c159279c6dfa2c4867c7f76875f58263f8f43b] ASoC: SOF: don't check t=
he existence of dummy topology
# good: [3c89238ca35bfe176ba34bc688541f90f6fa7bdb] ASoc: tas2783A: Remove u=
nneeded variable assignment
# good: [4ebe64f507ca921c5109eb37eae6058b77413d93] ASoC: tas2781: Add TAS58=
02, TAS5815, and TAS5828
# good: [29fa213c6ab00c6749db47b47e384cab760c109e] ASoC: dt-bindings: ti,ta=
s2781: Add TAS5802, TAS5815, and TAS5828
# good: [5ed60e45c59d66e61586a10433e2b5527d4d72b5] ASoC: soc_sdw_utils: exp=
ort asoc_sdw_get_dai_type
# good: [64d87ccfae3326a9561fe41dc6073064a083e0df] spi: aspeed: Only map ne=
cessary address window region
# good: [fe8cc44dd173cde5788ab4e3730ac61f3d316d9c] spi: dw: add target mode=
 support
# good: [efb79de36e947d136517bac14c139d494fcc72fa] spi: aspeed: Improve tim=
ing calibration algorithm for AST2600 platform
# good: [31dcc7e1f8a9377d8fd9f967f84c121c5ba8f89c] spi: aspeed: Update cloc=
k selection strategy
# good: [4d410ba9aa275e7990a270f63ce436990ace1bea] dt-bindings: sound: Upda=
te ADMAIF bindings for tegra264
# good: [4412ab501677606436e5c49e41151a1e6eac7ac0] spi: dt-bindings: spi-qp=
ic-snand: Add IPQ5332 compatible
# good: [5e537031f322d55315cd384398b726a9a0748d47] ASoC: codecs: Fix the er=
ror of excessive semicolons
# good: [9797329220a2c6622411eb9ecf6a35b24ce09d04] ASoC: sof-function-topol=
ogy-lib: escalate the log when missing function topoplogy
# good: [6937ff42f28a13ffdbe2d1f5b9a51a35f626e93a] ASoC: SOF: add platform =
name into sof_intel_dsp_desc
# good: [454cd43a283f7697297c52981c7a499a16725656] spi: dt-bindings: spi-qp=
ic-snand: Add IPQ5424 compatible
# good: [89c13ea3ab6ddf2b526915aa4190aec72cd202ed] pinctrl: mediatek: Add s=
upport for MT6878 pinctrl
# good: [ea97713903784286ef1ce45456f404ed288f19b1] ASoC: soc_sdw_utils: add=
 name_prefix to asoc_sdw_codec_info struct
# good: [b546e0023a203e7edf9377ac8f4f490a6965afd6] spi: aspeed: Centralize =
address decoding region management
# good: [0586b53d4a0c7c5a132629f99da934cc674ea4cd] spi: aspeed: Add per-pla=
tform adjust_window callback for decoding range
# good: [630a185fd06109193574d10f38b29812986c21de] spi: aspeed: Force defau=
lt address decoding range assignment for each CS
# good: [d25de16477657f9eddd4be9abd409515edcc3b9e] ASoC: soc-acpi: make som=
e variables of acpi adr and link adr non-const
# good: [b926b15547d29a88932de3c24a05c12826fc1dbc] spi: dw: rename the spi =
controller to ctlr
# good: [2b92b98cc4765fbb0748742e7e0dd94d15d6f178] ASoC: SOF: Don't print t=
he monolithic topology name if function topology may be used
# good: [7196fc4e482928a276da853e2687f31cd8ea2611] ASoC: Intel: export sof_=
sdw_get_tplg_files
# good: [6277a486a7faaa6c87f4bf1d59a2de233a093248] regulator: dt-bindings: =
Convert Dialog DA9211 Regulators to DT schema
# good: [5226d19d4cae5398caeb93a6052bfb614e0099c7] ASoC: SOF: Intel: use so=
f_sdw as default SDW machine driver
# good: [a3a8c9c18f6904a777ff21f300d3da8c2b214c80] usb: vhci-hcd: Replace p=
r_*() with dev_*() logging
# good: [561f0ed96a626c53fbd9a06ce2de6349fd0c31d2] staging: rtl8723bs: sdio=
: clarify OQT free page comment
# good: [f85d4062bc6894747495136e7fc020a28a875a15] drm/xe: Fix copyright an=
d function naming in xe_ttm_sys_mgr
# good: [807c42dd8028d71222dfce035c2e87aaecbf623f] drm/xe: Don't change LRC=
 ring head on job resubmission
# good: [7e1fe102c8517a402327c37685357fbe279b3278] drm/xe/guc: Track pendin=
g-enable source in submission state
# good: [fe3a615dadd398f73cde00a5ba32389958242dec] drm/xe/vf: Kickstart aft=
er resfix in VF post migration recovery
# good: [f1029b9dde253f37c548f0c848022521a3b92732] drm/xe/vf: Don't allow G=
T reset to be queued during VF post migration recovery
# good: [3379655524e613eb690d4c296ba0d2711a815f86] drm: atmel-hlcdc: replac=
e dev_* print functions with drm_* variants
# good: [bc3eeb42597a514a0b5286f085d91c8b34e4a532] selftests/bpf: Test dire=
ct packet access on non-linear skbs
# good: [1f95871207db4439a3116e9a86f5b5658a5157c4] drm/dp: Add helpers to q=
uery the branch DSC max throughput/line-width
# good: [7b8373c80ac322403f18ff6578e346d3c149197c] ptr_ring: support peekin=
g at last produced entry
# good: [4bcd18bbf51ce84924a2c6a126eda65f5b27d25b] drm/vc4: Switch to drm_a=
tomic_get_new_crtc_state()
# good: [653ce3a3f683673cb3f8904e08bffc144dd0e972] drm/atomic: Switch to dr=
m_atomic_get_new_crtc_state()
# good: [59fedf46f782c024b74ceab7868e13f0e0f10c45] drm/ast: Split ast_detec=
t_tx_chip() per chip generation
# good: [cc7e1a9b596c9d9dc3324c056cf8162e9fca2765] drm/i915/irq: duplicate =
HAS_FBC() for irq error mask usage
# good: [683bb2424cd5be17cca02067b038e9da5aa68dc6] drm/solomon: Use drm_WAR=
N_ON_ONCE instead of WARN_ON
# good: [4076125074ea41c581e4659cf2e1217a12f9b0ee] drm/tidss: Convert to dr=
m logging
# good: [6684aba0780da9f505c202f27e68ee6d18c0aa66] XArray: Add extra debugg=
ing check to xas_lock and friends
# good: [be2ba2fef1676861b295053c2a567b057e9031b9] bugs/sh: Concatenate 'co=
nd_str' with '__FILE__' in __WARN_FLAGS(), to extend WARN_ON/BUG_ON output
# good: [447c98c1ca4a4b0d43be99f76c558c09956484f3] tools/power turbostat: A=
dd idle governor statistics reporting
# good: [407b9076c147669318a58bbd54185b03055dc9a6] bugs/x86: Extend _BUG_FL=
AGS() with the 'cond_str' parameter
# good: [6c177775dcc5e70a64ddf4ee842c66af498f2c7c] Merge branch 'next/drive=
rs' into for-next
# good: [8e5d9f916a9678e2dcbed2289b87efd453e4e052] smack: deduplicate xattr=
 setting in smack_inode_init_security()
# good: [6dde339a3df80a57ac3d780d8cfc14d9262e2acd] landlock: Minor comments=
 improvements
git bisect start '0f2995693867bfb26197b117cd55624ddc57582f' '0612cb166982c1=
35656540724929ca631b2dab5b' '123cd174a3782307787268adf45f22de4d290128' '4d6=
e2211aeb932e096f673c88475016b1cc0f8ab' '1d562ba0aa7df81335bf96c02be77efe8d5=
bab87' '1701b282ccc37f6cfbe79f6ca5ebd20040178f33' '9a2292c50d1c68ea7b95aabf=
cbb07cf649736384' '417714763ec144fa6a5af675fd5dc5aa429f67ef' 'd78124a65a03f=
1483c62d8612594d5d833b8e4a5' 'ca30799f7c2d04400a428fbc82aa49dc2493cc1a' 'df=
5dfcad48ca3b5aacb4daf937b7185389498394' '2a69aca33cac6b191fd13c7ea16c33df68=
0a1b0e' '435d529bf5cd5646c95d80b76ef1e21f8a63bd81' '375e16720b4c8ee04a01de0=
3fb7103ac0a7a4856' '5bebf839b2e7a25850b3a9bd6450148769c6e95d' '2b36853d7e58=
fe4a2af498c1d4f5c518fe4980e8' 'c6a5d48156340650eea707c085de540b7740186a' '8=
1ef83de94405eaedaf8a6b09fefdbe89029a52d' '182853c7680aaaf00fffd7cd347ae4aa5=
0805fdf' '170b047e15afbeaeb95a9b8c936aa5b88538c50f' '90d527ac928cfdfc3a1b6e=
e91ff00d541ea3e444' '10576b2d86522cc70d8e1d8e121a2cb9c44c2ff3' '2b0d5d9b394=
89b9d8171896e8e24d8632c3dc807' '32172cf3cb543a04c41a1677c97a38e60cad05b6' '=
23523e9398efeee6a5741cf97052babf6fb2a808' '1d5bf23aa1e8aea43beca78dc5d69c68=
955e8871' '660d946ce6fd64678b4ed6b083dfc24c0f4d5a69' '873bc94689d832878befb=
cadc10b6ad5bb4e0027' 'dfbb57c2767dc128f6360c3e41136bff8fa6f924' '69f3474a01=
e9867dd99fc4b703fa834ea1835c7d' 'f78d96c289da743d517f700d3fe7c6c43df667b5' =
'38ecd1384079d5f7b6942b68496ee7e85aa9a883' 'b3a5302484033331af37569f7277d00=
131694b57' '772ada50282b0c80343c8989147db816961f571d' '4acbfcf11cbe6c46c420=
91b49875c7002b0bff3d' 'e32c402533cc68abe20fcf3246b9ff53e1f96021' '6985defd1=
d832f1dd9d1977a6a2cc2cef7632704' '66ededc694f1d06a71ca35a3c8e3689e9b85b3ce'=
 '0b6c10cb8479d0d1b7b208277df2e2afe082d4bd' 'fb1ebb10468da414d57153ddebaab2=
9c38ef1a78' '8821c8e80a65bc4eb73daf63b34aac6b8ad69461' '2089f086303b773e181=
567fd8d5df3038bd85937' '6951be397ca8b8b167c9f99b5a11c541148c38cb' '4a58f60d=
f578bb55a1d0adca0c356e03b2818de1' 'b6f4bd64f453183954184ffbc2b89d73ed8fb135=
' '4db4ce15706d6423cc4cac4b05114b0469507bad' '4e92abd0a11b91af3742197a9ca96=
2c3c00d0948' 'bd352547df647be8a1e6c9d4ca2b54b459f3abc1' '1797d254f5c4b46b29=
5527a635af7321a3fe1318' '106d7641e55a472e7523c1f525c77fb6d420064d' '5693110=
5074fe7e5fc9d54e3163df3b95075643c' '6b398c1d3da7a673b13b1857f9fff4c15ee20ce=
f' '47d98d432f19030faf06d4b2ca7fc7493057cae1' '873a46141460d209bb62eaa0dc9e=
7b67bff924a6' 'abc9a349b87ac0fd3ba8787ca00971b59c2e1257' '55d03b5b5bdd04daf=
9a35ce49db18d8bb488dffb' '6d34b66fb726a613b98c936adee70d42aa5e4aa7' '104482=
1176a64a8dc7f861e878506cde34c8b658' '6bd1ad97eb790570c167d4de4ca59fbc9c3372=
2a' '8d204b6f1f7a6d5c74e5cbf09539e6081ee0a9be' '7a381e373a4243926a41b8e6ebb=
deb90fe9afda3' '14ae052f794715c1d78113d87f3d42adf2ae24d0' '1b0f3f9ee41ee2bd=
d206667f85ea2aa36dfe6e69' '82a224498005b2a2e8edaba8e6b89464688f20e1' 'f121f=
bbdafeb98c5961c83d23628eee96e6dc28a' '80bde964824757f9d8f8556bdbbf7c44785f2=
4b3' '58ac42f278054fbc4c3f174524280d7263b0699a' '7139c860650535cf517a934421=
2ce56a21ba37f5' 'ba53f22ebe9e09f1c42f50d34f4deb27e5615f6a' '6e00112d31c8602=
9ad0440f8c29ee0d131984cda' '680c683c8f49455bcfa1604eac4e508ba96ccbfa' '74cc=
4f3ea4e99262ba0d619c6a4ee33e2cd47f65' '35501ac3c7d40a7bb9568c2f89d6b56beaf9=
bed3' '55094e55ae36c7566e29ae0473d205dbc9d2f4a8' '40a7c5db9020079547358f486=
ef12d57c1a7aa1f' '44432315444cbbedadbb9d808c9fc8c8b21cb4bf' 'e386c2cf3df2b6=
2a6cc78d2f7984102b64753bee' 'be04e96ba911fac1dc4c7f89ebb42018d167043f' 'b10=
34a690129acd8995137bf4462470b4a2aa690' 'bfbb12dfa144d45575bcfe139a71360b3ce=
80237' '88a5f8e628ef745bb94bdf2fa019d9f8e069ccea' 'bcb3f6f5286b96ff0a7106d2=
ca7208744b20b37e' '3c36965df80801344850388592e95033eceea05b' 'de8e95773c48b=
ad9d7339ccb376ad22d93932468' '950a4e5788fc7dc6e8e93614a7d4d0449c39fb8d' 'b6=
a1d7243ec3a3fe1a3c2969fcd32c802fb5d2a9' 'f678ea19e8f60b05b8d3a5bcda9a238d53=
55bd50' '896f1e4e106449ac2b39f0ca62b6afaed540f758' '655079ac8a7721ac215a059=
6e3f33b740e01144a' '89cf2223ee7bd83d45c6bef3ac52bedd018f77dd' '0cf064be87a6=
ae0708f171c6b863b26ba9453054' 'a354f030dbce17ab3cf299660a38b162d97f7151' 'b=
828059f86f67729aae3934650ae9e44a59ff9d8' '81c53b52de21b8d5a3de55ebd06b6bf18=
8bf7efd' 'd0f9f5b7a3356b43f78b37b9cc3671ecc7469356' 'a87a7b3530728fb7477a74=
c27fc27e060bf5684f' '4b1edbb028fb95b546893068b321a983b1ef50bc' 'aa897ffc396=
b48cc39eee133b6b43175d0df9eb5' '2f538ef9f6f7c3d700c68536f21447dfc598f8c8' '=
8b6faa7fddf0ae69c5f1a9315a64edee6f022037' '47955b58cf9b97fe4dc2b0d622b8ea3a=
2656bbf9' 'b4e002d8a7cee3b1d70efad0e222567f92a73000' '6022eacdda8b0b06a2e1d=
4122e5268099b62ff5d' '1149fcf75972f6918aeb05303b1aa1e38e0df6eb' '3b071bdd26=
849172101081573a18022af108fb21' '9de2057bbdfb58f4d9bb1476135317cd3fe6aa52' =
'ecaba8b7990d8c6d8ba097cd4499b3b92d9df6ea' 'c4e68959af66df525d71db619ffe44a=
f9178bb22' 'af9c8092d84244ca54ffb590435735f788e7a170' '380fd29d57abe6679d87=
ec56babe65ddc5873a37' 'e2d4f42271155045a49b89530f2c06ad8e9f1a1e' 'a4438f06b=
1db15ce3d831ce82b8767665638aa2a' '290b633a7d8ad56f1176c4e89bce8cb5092e6cea'=
 'b2cfc0cd68b830dde80fce2406580e258a1e976d' '947eaef21577f52db046992c887ed9=
698f9d883c' 'f47e782c45f8f0c3d7b84edd7e94bfce9eb00b64' '9115815afbc3815391a=
82d192f9b12aaff1e4ce8' '84194c66aaf78fed150edb217b9f341518b1cba2' '252abf2d=
07d33b1c70a59ba1c9395ba42bbd793e' '164d1037c4f86828b77a15c9071f051c5acddc93=
' '0144a2b29d95af8523c308116de65d398d6e935b' '2ecc8c089802e033d2e5204d21a9f=
467e2517df9' 'a2d4691b3fec6a2360e4ec953d06819ea055c3e7' '1a88479436a5245242=
9f6d50ec5bd0a546406485' 'd776e805f197cb055c759d190bcc249072244d1c' 'bb8222b=
6f3586168f66ae5678fdca3179af60821' '44bf8bbe29fd50ed2b8dfd1873bd22f76ca2f4d=
9' '94a3a95f03154d8d4c6206950a7f6ef9a30baec6' '44c1a444b030647803d900e60f5a=
8af31a782f0e' '27fef3048fe95934f6f2f87341eb33ef6581a075' 'ed5d499b5c9cc11dd=
3edae1a7a55db7dfa4f1bdc' 'bda6f8749c8e0b10f083dc7a1edf169f349fb776' '90e69d=
291d195d35215b578d210fd3ce0e5a3f42' '3c0c81de525d2a2718e23754a5795483167904=
ac' 'db66398fb03ee3599ec7387ceb5121b95e648eb3' '295f58fdccd05b2d6da1f4a4f81=
952ccb565c4dc' '92ad6505a4b5e28afcc8cf5f4dd3fd137e58026b' '3d8096fd378b0b4d=
ae356e6f037d03da83f559d2' 'f1dfbc1b5cf8650ae9a0d543e5f5335fc0f478ce' '70713=
fe90439613f2ec50610cc70481f95d09279' 'ecd0de438c1f0ee86cf8f6d5047965a2a1814=
44b' '6ef8e042cdcaabe3e3c68592ba8bfbaee2fa10a3' '44df6a7821ed393658903bf5c1=
da0b9921bd1025' 'e73b743bfe8a6ff4e05b5657d3f7586a17ac3ba0' 'ef3714636038528=
2b5f6a5b4bf695db30d609887' '9b8dde0f4b26de59f64cb824669151476f76b8ba' 'ca83=
13fd83399ea1d18e695c2ae9b259985c9e1f' 'cf6bf51b53252284bafc7377a4d8dbf10f04=
8b4d' '3d66c4e14fbf4d59ca4665391d133655fa668042' '1e5351ba60f5355809f30c61b=
bd27e97611d2be9' '3cd523ba270665861647304aa30500f238ebf26e' '2b4d53eb5cf32c=
5b7b7616f23f08471fd8b3708e' 'bcba17279327c6e85dee6a97014dc642e2dc93cc' '541=
aecd34383a85eaf7c8556779466e394554fed' '089c0a9853ae6b297adf6e2f3b94e4f75dc=
1f97f' 'd02460317ed9c95aa2c5f6ff1c70e22e1857d95d' 'b69165a09727b653993934d7=
00a02d32a8961327' '8fdb030fe283c84fd8d378c97ad0f32d6cdec6ce' '20bcda681f859=
7e86070a4b3b12d1e4f541865d3' 'f9f4fda15e720686f1b2b436591ab11255e4e85e' '5f=
a671232f703a404caa05c581411ea858c4cf16' 'e2ff7154813a3834692703852604b2099e=
cf043a' '9c7f7262bc1affb9b9acd2ec2fb1f6314d5d474c' '28039efa4d8e8bbf98b0661=
33a906bd4e307d496' 'e062bdfdd6adbb2dee7751d054c1d8df63ddb8b8' 'ac479277c24c=
859553a6db340aa1518d320bc5e2' '6e8146909eae3a42807c750ad84e3fa29c192822' 'a=
4619aadb308db0418b56b237019dc5ab928aa0b' '060028c7fcdd7bc1c6ed61fb25380c0d6=
c36475b' 'eda4a53f8fe021328c468175a02da8d7ad155494' 'b90871cba6eda108d5df88=
bf9932723b9a445690' '250eddd69da21999007fd09e17a7c43b92cc6220' '7915d513e22=
db3226bfc7d5428b6dd6faa3ce181' 'dc74a00c7661a14a672ea7660caca5c4aa661a79' '=
66fecfa91deb536a12ddf3d878a99590d7900277' 'f034c16a4663eaf3198dc18b201ba505=
33fb5b81' '7a78e387654f20e798ceab5bae9c1f5557416431' '67e4b0dfcc6702a31fbb6=
a3015c0dc867e295eb4' '4a5ac6cd05a7e54f1585d7779464d6ed6272c134' '6ddcd78aa7=
f85e1d94ab7f90c72d1ad0c0c7b6ea' '258e7d28a3dcd389239f9688058140c1a418b549' =
'013a3a66f25af3fb614f45df43983657514944c4' '46a3df50b0cab466099515f2375b01c=
5be4fb95c' '715159314dfafee66e6deb50b4e3431539a919d8' '7159816707dc7040fe3a=
c4fa3d7ac3d173bd772a' 'cf6290eebe3cc4eb677d11aa061d10cb1df12ab9' '0a5e9769d=
088bd1d8faf01207210911b9341b62c' '12aa3160c10a3179c73c4f99a2d5aec0fd907d0c'=
 '0723affa1bee50c3bd7ca00e00dee07fcef224b8' 'c7b6c6b60594fd1efe35c61bc6a217=
6b25263ccc' '4c33cef58965eb655a0ac8e243aa323581ec025f' '3cde66094575a5b1310=
a7631d28761bd3dfcea63' '8d557cc4867f2008f440c54b4423464301a1ef4b' 'cdd27fa3=
298ad2f39788804f7d09ab31af2b416c' '86df0030b71d7172317d957df17524a7fd6232d4=
' '56bbda23d4bece7ce998666118a068e4f71d59fb' '191a27faf53edf9e9101901e402bf=
ee49c44073c' '64670a6c062c4d183c366d46e71ee76395af6a15' '1afc05996299b4546e=
8be9b13c89f78e19912c7d' 'dfe7c3401ed3d3bd8e61be8d6d452896513eb52e' '390c05f=
47d0749b24db65586482308c5fd680fe5' 'ef042df96d0e1089764f39ede61bc8f140a4be0=
0' 'aed760df8e8ebc2035561e53bef184e6a8240610' 'e92e25f777483b7cc3e170214cc8=
4337d7a415cf' '7b6be935e7eff06025e18cea4c6620194450abe2' 'daab108504be73182=
c16a72b9cfe47ac3b1928ca' '12dc929c6cc5fb5f82d6f245ceb3548b4c800121' 'aeaf27=
ec6571527e750eed84bb3865a0664ae316' 'c4d096c3ca425562192a3626c30e82651d0f2c=
1c' 'f7097161e94cd39df7a8848ad0de5f394124ed69' '907364ea3db47530751add6d2d6=
2122ca17329cb' 'f1b26faafdc3bb9afd8d3b67089980ef34c7f7db' '2b62e66626f05e27=
7c8fdeb50d4c1e0cbab2fe0e' '71f7990a34cdb11f82d3cbbcddaca77a55635466' '47953=
75d8aa072e9aacb0b278e6203c6ca41816a' '959400caf51eb31f95d1ab754a285b5546ebd=
3e4' 'ef24466ee1912997c2bd526194006bbca424c24f' 'c63b2315b9cc6b705205c73dcf=
4591cfeb9a25ae' 'ca4d49f8a21c37be7e5aed80100ca6b13ac3cf9d' 'e973dfe9259095f=
b509ab12658c68d46f0e439d7' 'e7434adf0c53a84d548226304cdb41c8818da1cb' 'd294=
79abaded34b2b1dab2e17efe96a65eba3d61' '38ff69586bbb3a823dd501972e17075374b6=
85a1' 'bb65cb96f64e9b4ea2bbd41e4591f3da91414fdb' 'ddbcd2f396116581ad035fb76=
a99fc2ed865a85f' '77a58ba7c64ccca20616aa03599766ccb0d1a330' '1e0722a77b4e26=
3854a812c9c106ddef8fd56720' '9957614d2b79578b6f9a2512bfbb2bc7bbdc43ce' 'f97=
ebfda8da28a77a0218a448829451ba7e30d5d' 'd68eb9096fb065cc0cb5218ae651f54b08d=
e5831' '01313661b248c5ba586acae09bff57077dbec0a5' 'e7ab858390f24a23ba082706=
6382ba0e6a8e4379' 'ee4407e1288ab85be16bacc45195b8bb23d44760' 'c37c3e5e390dc=
d52cbe6178ac53f5a6131ef6f8c' '3941abb26ff327e53e1e8b873cab3ed3d5103eab' 'c0=
6a017439110debd335b6864bc2d69835624235' 'e30f8e61e2518a837837daa26cda3c8cc3=
0f3226' '8d4f9b5ff333183e398811bad6f68d1a7f23f967' '986e9104b14720bafa2d37d=
d6217da8151ee4cb8' '2914f6ea90772ce4a8311a6d5b3ab94e3cd31b12' '2528c15f314e=
ce50218d1273654f630d74109583' '098456f3141bf9e0c0d8973695ca38a03465ccd6' 'c=
17fa4cbc546c431ccf13e9354d5d9c1cd247b7c' 'edf5c8920240dcafe830908549a0edee4=
ba3b4b0' 'fd5ef3d69f8975bad16c437a337b5cb04c8217a2' 'f76dbe127f1b5910e37dfe=
307d2de5c13d61ed89' '310bf433c01f78e0756fd5056a43118a2f77318c' 'd054cc3a2cc=
fb19484f3b54d69b6e416832dc8f4' '7c69694cec869e3bf7c810fd94f860253aeb8053' '=
d227a8b3e715963b7c034971c3b467d5430a2cab' '108fba26698a75bb8e1acc21553a6860=
313aebd2' '638bae3fb225a708dc67db613af62f6d14c4eff4' '45392fd4394cb8d4b39ba=
0f144651aba05b7b2a7' 'b9a7c9599120185ae65424cb93ab8af7b9024cf9' '9ce084e579=
bf550ee92b1ecbadf1c29a76c1062c' '4c987d67b31f93ac88f4be6dfec6a169997fc2c8' =
'18e4a02963b7582207b8a7b25d053f40ac206e4d' '1dcd763ba1f62c1305a03bc7d5bd1d4=
4c20a4f5e' '6a4f29bc66294d44d61a294e5bdc623eae74587b' '965a39a9627bfaee5a4f=
7471097439da19008338' '900da53226121c1e710ca95857806a136ab281a2' '5cd5f8fc2=
9fa1b6d7c0a8f2b0a95b896ecadfa42' 'ecba655bf54a661ffe078856cd8dbc898270e4b5'=
 '2880c42a0de68e9eb979e5331fbd5b2c79e093ad' 'e0fb9464295bca2aa92835d02147d3=
265a83689a' '8c465b1669bfeaaf0ebd504b96d689e2a2810874' 'df900536e85819f6168=
783d5f6b3908d47811fdd' '2497a7116ff9a051d0e78885a27a52213bc2841d' '335482a5=
3a5766d20d7a14f0532859a7e84cec0a' '17e5a9b77716564540d81f0c1e6082d28cf305c9=
' 'fb4f1cb3e04d706bc7d02dc6ed9e5baafa903de9' '1c9986e782de45bf32fb4f886a40c=
1393d169568' '7ea0468380216c10b73633b976d33efa8c12d375' '3d7c626716aae6e96d=
7d463f184a09df4cd4bdb2' '29dc539d74abd1ec4e509fda29bc821f3586d333' '182a258=
b5ec4a45170e776d3a0c0bccfc4fab998' '7e1906643a7374529af74b013bba35e4fa4e6ff=
c' 'f5a6fa189ad2e73d25e31de3cc7f0bf81907c986' '9e851421266baaedf86f8a31b62a=
eda0c72a88d8' '601e7b30670a25b4cadfb05bded9345126d82b58' 'a7aa34438d6367a34=
555e8cda99ba379ef52938b' '504219ea359c4545176f76bab77e0ba38a8629d7' 'ccf4be=
ad907d8be7212e69adeca64a078712d8a6' 'ba93cda8cc9eb426c801aa8dca8a0e3874de95=
8f' 'b9b68f3a262bce63d4d363f08b345481e4f9d23b' '7e4cdef1ef8f8a3baa6806d42f6=
ee2f64d75cc17' 'a31e9992873ebf3ff66699ee13fdf847891746c6' '661584c295d75ff7=
2fae3569e4f0439325b9835e' 'f4ae2720f353fe58b02f49cc935933dd9ccc8ce4' '8b412=
d3233c69a8545ca771c2b4e25774a4a90b0' '386db878776142f262c5997424832090ebe5c=
196' '3576a8d214386e314e83c36c13eb098433896fbc' '6c8f8e79a3f796106b6de386b2=
055441b8256efb' '88b0ee610790877bd9e3efcf8f29efd53eac894e' '7b0c32cbed76133=
5b0fa7f3db232ad69bc23ce69' 'fcc6ae5198bc13860053ea6e1fb7ca85415c77d0' '6047=
387ab92acfc77dd981df27adca36b0c2e9ea' 'ae7ac6bbf0fa4475cd169b9ad2e7f751a7cb=
73f3' 'c387ff80f77e6832952fb92d511bfcfda6766a54' '64d1d87d185e0cccdaff573e1=
6af074193045167' 'c5c6d972d6450350ecf6b1c6dc7ec7e1462bd221' '5ab215f2b60ec9=
88e63ddde421eecc6ced137064' '94cd5e54fe56165a2ac7a1ac7b3599a14b9497c0' 'a65=
31a0414ed50cbbe6244e82fec4d432a207842' '9846cb5a9d06c476c503abfa840251ad3c0=
6414e' '161e3c824e63eec6515f2c7d36fba391647ccf89' 'c293d36d1037fc63430f9c4e=
c7e3fd1e42a50c0e' '6e3e296c564399f17e8c99623f8ba608b8fe1b7d' 'd7e1399884a65=
e868f7b121b8ca5d613cfac6538' 'bc78514e84035d1a596eb558ce9da9dd5269a85e' '30=
8eee447306e885254bca4bc23b9f90534feb1a' 'd742ebcfe524dc54023f7c520d2ed2e4b7=
203c19' '2c688df0fd19d02146e031502c701c184b86cd0e' '9bce11a336f0d5694340f85=
bdca81179a02eaa81' '96b67f9204fb63168076142777e3cfc2dd236d8c' '3cba794c8fec=
8e1d5da6c3c91fafdf490de4b24f' '5190935a1b93940c28cc4f484e17662246648f66' '4=
1a6e1032c799184586d3c5ecb594cc05b844dc7' 'ca6731ad2a4fd1e5fc549d53d4f99445f=
d552f97' '01511c18f713b7579133f451332a1ccbb634e389' '9a1e055bb51d17a44e6e46=
e2af922dd0d9a1fe2a' 'f72e15146ea024f849143a1d4c65f351cdd12488' '37d9425fc9f=
19eb92abdcf96189e74e163b94619' 'b573898b82abf8d2736c90b14d76f65f9bc8d1f1' '=
0d58897657a9a31f4817a9596a200815f8c8e602' '2d54738a39b49fc46b4b22472388d74f=
c698b87f' 'a233cb3fe736647ab2a43aeb3ef1fb9a2a0744cf' 'ecc35b2977af71d5fceef=
68ca723409cd9592bc3' 'f793a6e08f5487b4f1e1207cc4952adc753c1f4b' '801955fd92=
48ea5659189b0464e9e4ff0952a11a' '09b29035fb5c93fa0db24df165081cc27239b1f0' =
'1a1a66c2cee604dedbd4de3ca7d8e3c38d7de05c' '2191593d061cfee48763d67e69ccb1d=
27655ee62' '024530ea1a3b6e8c64baa76f046345800b99a1bd' 'c7ade18aad3e63e732a9=
3efb5580a4b2e8563d0c' 'db1bcf18fe320ff4988a196f969ca739f9c3da95' 'c59fe12fa=
2acb1613eb77fe2d690ab76107bd4a4' '7a0fefe28cc5a127cb63aafb5fe85852d198ee7a'=
 '18096d761f6be5a981f3480f7907859f3a431a0b' 'c8e43faeb4a608f45e362c55a1687f=
3249479a04' '7e1393622591631673c419197dda2d5ff14aacc1' '73f64a4803f1e092ed8=
3f4e96225f35c42fe4be1' '6bc24a7d35ceaffa0f7551b7bd13b495a27e203c' 'b56580c7=
ba8ae7ef585a7deefbb137212be6f1f0' '844db7d7e7200e303fa3974e8dae5350646813d1=
' '95972dd17b189647e96605f4edf2177a8876eb4e' '3314ee8db5411e1f9adc0172ebe42=
5c8a8066cab' '74fdbce5fe88f9204634e3923c86a84c3a505ecd' '626cf62777735ca51a=
8d88d8dc2e234b56d4f3a7' 'b5e0fc69e42b23e86b32f4810a41ff6b842d6426' 'd98fdbd=
f8bc654242d94616a7bfc233c67b43866' '8f1d72f84e85a8757a0981040654be1fd18ea6e=
3' '2673034a1911c215f67c64d0b844563f7903a677' '1ad2f1c5662fabafc8df405a2e48=
0ba45cdaf054' '46c4e08bb11aeae95c364fa610ac6348896b881a' '2041666b8f4320da1=
f7b8efacaafab40a745e126' '8b5cc56389d08debb225d94a35e62e11a80a9b4f' 'c34209=
ba43623c2ea2593ee332f4e4f6b47fb921' '344af572f088e2bb1248bb752ea3a532f7fa42=
08' '73978d274eba0d9081bc9b5aedebb0bc6abb832c' 'fce217449075d59b29052b8cdac=
567f0f3e22641' '2f0a334df0fd8e0793a7dbea40fca0d4a48dc927' 'b1daca0396b91a9b=
436b0654b8aae6a8220aa51b' '6950709b6658fadc7db860a4ec33de8c5226c728' 'afcf4=
5b7555fcc8e2fc177e8d4e7a2d9d79b13eb' '3a071bb34cea8e97e403c7946a1fc03de164f=
70c' 'be9342c57e28d8e42638e4f234d8727da9ee609e' 'ddd1705b62c6920b77d8cfcccc=
695e99dde25ad7' 'a5e7aaee483c7022e96181ce899944b8c7b1f1e0' 'e621116150c5983=
dde75195f0eb2ea22baf4e87c' '11c13a65e82afb830fa0f7df2fcf3ed415e6fa1b' 'e7ed=
084f4cd49806b9ff91d800c6422f96f6f5ea' 'ccbfc923fe935b4f1e3b1e51df828e07473f=
aff9' 'cf9d07738fd94e1c3cf0c3ffb61f4d2d1e4d0c57' '205a7f5c6ec0051248384e744=
0fb17d3f3aee372' 'd9f08106c16a32cb9514986351754d36f3b3c7df' 'a2aa8c0a2f1cbc=
5be1cb6195038e4484d2af38d9' 'c4ec2c9d7329b509e10c8980e4077f823ce68df6' '7e9=
0cf82a33827e174d3955d3ede1b3e7bb56325' '92ba8c4c78810b991b697af1087ba31226a=
a5871' '5366dcebe65bf1dc82a7362e505b69d441b5f755' '13c4c81b7bc819d533c6e0aa=
a1bf495cd0dfd8f6' '0bfe0c0a9aa7edb88f571bfbfc8f4546d6b311cb' '455f2f9509b00=
34f32979bcdbc5441579c3a1d0a' '14af3d3c4d2d8d01d91049576a59590d9c586f3a' '52=
a87e0b5ec1f7316293773f7859996d123b3ea7' '776b160f3234f85899eb3c8d454c371764=
84facb' 'f2b55e567172ccb248e66e8a0f1c7380279127f1' 'f7fbe0ea5f03d918418e6ad=
28d61bcae52bb2d22' '2e6db9d197ed161702434c6c14b1c65bdef51a2c' '4b5e66fc0315=
b9a85ce817b97a1f33829eeadd29' '404e8bfcb9d6a8b6af4745f23906a7382b7eb4c4' '2=
11367ef1d4031a29fa8e07f430155d68802e8ec' 'eb52e20b15eac1c230fb81f7481f6f129=
9c2a9b8' '73e86fbf251708bb2766fff746eea0ebb6fe0747' 'e548389df744bd28db1ba3=
923b6ee74ba6f73926' 'c0a750ce364b248efc0f4b993904dcef194612cf' '6dcc15ed9e1=
b0ce6b1f3f53af33e2afaf0a53fa0' '3c9e6dccede1146d53f940ff8b25ceee275c0686' '=
fe0b3f564f9b1ecd74180c296129486d840bc3f9' 'fd27a636d3746ae20e0853f4fa48b930=
80a2a43d' 'aab1301cfde344f966bbc442a4e655867ab56768' 'c5f73c6679ef675fdb4e3=
5dbc8ae0ec59eb0526c' 'dc5aa86741789d6dcc0c24dcff5f3ba8fbecccf9' '3a3271a520=
75d4dc34f403c0ed850801cdc4bd4d' '3815962969c811bbfa32c7d503246f9abace38cb' =
'13b2c42b0dcf539a1ddf18374792a7a49a7afa4d' '800c666497e045c3152da516fdd6bc2=
392571a90' 'db25c438f9e02c0f1566d54840640d23f59a3d4f' '0c933edebd96961529e0=
1686ce6930be5decf400' '3827b34564951febc0ffa7ce93c1d9c05888e53b' '62b175d6f=
f19de91544c9047dcaec8a33a5759a1' 'ee4ac04e3ccd7f4d54e767b7ab5a4067f9737fff'=
 '40c729f0a3fa14845d733f5572c283728bea0c32' '9549a29371c5548a4eb0d43622a25d=
6bc989337f' 'a43676fa0585a9988e44ec000649d20c2649a3e4' 'ef464d9c418741ac83a=
33c7662db3cffda655b4f' '6658472a3e2de08197acfe099ba71ee0e2505ecf' 'ac7db529=
b6c2d748102cef60da29f5ea281a757e' 'b805b4e062fa216302f86bd66485734683a51236=
' '3c000883d110b381fca21572147a8c0463ba4a25' 'a014442252380abd19a81ae27fdfc=
29b988203c6' '7484e7cd8ab1b78a958a000cc8581cfa1e93daa1' '32e0fa9e01475beba9=
eeb0a5fdda69762be11947' '52ecd48b8d3f5206049758d95ca5b291397b3209' '1553d6c=
58870476f29ec0bf43f264094553d1407' 'a10f5cc3ac9b05c764e87ae13de9a716ff51990=
3' '7910d69376cde30e5871970d97d1a2e360568474' 'b959e7d402ab74c9e54d9bebfb93=
aef04dae24c7' '5677aa6a08c1df8bc1ec71516fe1ced9b7cb545f' '0cdb2b1b7edaefb54=
773d790c7b5c2e4ac7db60d' '3e9c967f30a6dc57e4386c85ee5b75caee7246e8' '0cc08c=
8130ac8f74419f99fe707dc193b7f79d86' '75616264e0cca5ead432df7236653056b35cb0=
fc' '233a22687411ea053a4b169c07324ee6aa33bf38' 'b1fc226edf8680882a5bf89038b=
dc55afa2ac80d' '661856ca131c8bf6724905966e02149805660abe' '0743acf746a81e04=
60a56fd5ff847d97fa7eb370' 'fb81b5cecb8553e3ca2b45288cf340d43c9c2991' '7350f=
8dc15bfbb7abf1ce4babea6fcace1c574c5' '80b09137aeab27e59004383058f8cc696a9ee=
048' '902c0ea18a97b1a6eeee5799cb1fd9a79ef9208e' '93b2838c6e79bc263e6129d88c=
5ab043dd793d28' 'd1ff30df1d9a4eb4c067795abb5e2a66910fd108' 'e8fd8080e7a9c8c=
577e5dec5bd6d486a3f14011c' '70eec454f2d6cdfab547c262781acd38328e11a1' '5263=
cd81578f99a00b2dd7de1da2b570b96a1b7c' '367ca0688e4218e51c3d4dfdf3ef5657a62c=
f88d' '281c97376cfcfc8cef4f5ed5dd961a1b39f5a25e' 'd77daa49085b067137d0adbe3=
263f75a7ee13a1b' '79eaabc61dfbf5a4b680f42d3a113d05333c3960' '4673dbe9837e3e=
b2fecdd12f0953006c31636aac' '15afe57a874eaf104bfbb61ec598fa31627f7b19' '645=
5ad5346c9cf755fa9dda6e326c4028fb3c853' 'f80ea8566917c4bb680911db839a170873e=
5d17c' 'abfc01077df66593f128d966fdad1d042facc9ac' '1e570e77392f43a3cdab2849=
d1f81535f8a033e2' '5021ccb44dc6a22a3508316442d1304371ca55db' '9b685058ca936=
752285c5520d351b828312ac965' '942b8db965006cf655d356162f7091a9238da94e' '0d=
7f4e99217f6f715c7064c67eae8d9d09313b14' '4c95380701f58b8112f0b891de8d160e41=
99e19d' 'bc2c39600212979b6fc836113bde1b707c02f442' '46a177fb01e52ec0e3f9eab=
9b217a0f7c8909eeb' '00a155c691befdb10bea52c91d4c8c930bdaf73a' '6621b0f118d5=
00092f5f3d72ddddb22aeeb3c3a0' 'c1afb0350069c3be137b5692923ad13d69648970' '3=
ba5c78fe7c5d60edae0c47361f191d40c5c1cf0' '835dfb12fc389f36eb007657f163bd1c5=
39dcd45' '6a8cdef7dc2a4c0dbde3f7d7100b3d99712a766b' '65efe5404d151767653c7b=
7dd39bd2e7ad532c2d' '79c36ecfc8994011ab0a973d3b4148aa5d9e0c91' '1356c98ef91=
1e14ccfaf374800840ce5bdcb3bbd' '42277a1f86a14172c673a249bdc9e757065ca5a1' '=
cee2c8396d9c8e834fe28929bc1d8153d7e9897f' '9a4bbd20a879b66dddb563698345b0ae=
24d810a6' 'fb25114cd760c13cf177d9ac37837fafcc9657b5' '2c05ca02621837af7cd8f=
ab6ae7421b9cd5dff6e' '03c19a99ee69f4680d7da11c164ac655b4946b99' 'a758314f71=
ba90cca2a5813bbf96c4954a15b613' '6eaee77923ddf04beedb832c06f983679586361c' =
'0b0eb7702a9fa410755e86124b4b7cd36e7d1cb4' '7d9c2924f61dcabcbc5868bec6054ab=
4f4de01d1' 'ed44a5625f304ff14d01acfa086e77b5262a842f' '7c2575a6406fb85946b0=
5d8dcc856686d3156354' '92a42edd347c3b5a9045bb137a33204c6ddc0803' '1986798af=
745e90669cdac753da5d1e43dc8ebcb' '0d83da43b1e1c8ce19f2bb10f54a0fdf795364f7'=
 'c2bc11f1f204ef916ec96e45cf329e42873b37d6' '433e294c3c5b5d2020085a0e36c1cb=
47b694690a' '50062baa536bcac03804cf04579c71b9351e829c' 'dd590d4d57ebeeb8268=
23c288741f2ed20f452af' '4cdee7888f42f5573b380ddfa9da43208e759bdc' '9b7eacac=
22693d9177402c9d63e1c1747653d28c' '4109043bff31f95d3da9ace33eb3c1925fd62cbd=
' '68e71067ec9ad08e1e51c06123a155d0814aff7c' '9ebb662fab38a5942100e597b48de=
5ec9d5e714d' '9f14f1f91883aa2bfd6663161d2002c8ce937c43' '25eac74b6bdbf6d159=
11b582e747e8ad12fcbf8f' 'a1526bcfcb6cb7cb601b9ff8e24d08881ef9afb8' '122679e=
bf90eeff97c5f793ed9a289197e0fbb2c' '81cf39be3559f3cebef6ad7b0893c06bf5a5847=
e' '6b4679fcbfdf6f27f8455f9c7050ab6c46c6c5e0' '3e4b5f66cf1a7879a081f5044ff1=
796aa33cb999' '2b91479776b66cd815e339d420abbf4ae047bfb2' '34244f784c6d062af=
184944a25f40ab50dfdb67a' '07e1c3fd86d7a2ddce3ebc6b7390590c8524a484' 'c9e9b8=
5d41f9079d6a10faabf70a0b18d5c0f177' '72567c630d32bc31f671977f78228c80937ed8=
0e' 'c2a3e7af31107a2e1dff92b0601d525466dc21b7' '2bb23cbf3f21919ba17cf63404e=
c0224bd8bf4fb' 'a040ab73dfd1bc8198848a438f77497d8d03fba9' 'c2d420796a427dda=
71a2400909864e7f8e037fd4' '6717e8f91db71641cb52855ed14c7900972ed0bc' '1ba9f=
8979426590367406c70c1c821f5b943f993' '3049fc4b5f1d2320a84e2902b3ac5a735f60c=
a04' '41d24d78589705f85cbe90e5a8c1b55ea05557a2' 'b37491d72b43c3a322d396c2d8=
e951a10be70c17' 'd0ff153cca85520a2a14ee4edf44f6183b2e0e74' 'afb026b6d35c79f=
6f47752147327932827aeac8c' 'bf770d6d2097a52d87f4d9c88d0b05bd3998d7de' '7f47=
685b150dbc20f881d029a7366a81b1d66322' '225d70b8074502acee3943bf0c2e839e867c=
d38c' '506cbe36a2ac7b504a2362476dc53cd548b7a29e' '0d202ae0256e8e7dcea862ead=
5904fa27cf4ce6a' '3180c7b1575d635851f0ceab6bdb176bb15e69dd' 'aa1ee85ce3576d=
efd29f2a389d7508d2036af977' '50292f9af8ec06dd1679943cddc3b59844266b9e' 'bb9=
40b13998c40d55e186f0cf5d65c592ea1677a' 'a312acdcec57b3955fbf1f3057c13a6d38e=
4aa2a' '55f8b5a96597a7b88c323a7de7228f9eae8c9943' '7e7e2c6e2a1cb250f8d03bb9=
9eed01f6d982d5dd' '0f60b8508ca2ac685e0400cd802d1251a9d67ee4' '0bd0a4a1428ba=
af4447e95f0832492d9e3d64961' '9259607ec7100118cc5c608d97c9d406501e861e' 'b8=
3fb1b14c06bdd765903ac852ba20a14e24f227' '99c159279c6dfa2c4867c7f76875f58263=
f8f43b' '3c89238ca35bfe176ba34bc688541f90f6fa7bdb' '4ebe64f507ca921c5109eb3=
7eae6058b77413d93' '29fa213c6ab00c6749db47b47e384cab760c109e' '5ed60e45c59d=
66e61586a10433e2b5527d4d72b5' '64d87ccfae3326a9561fe41dc6073064a083e0df' 'f=
e8cc44dd173cde5788ab4e3730ac61f3d316d9c' 'efb79de36e947d136517bac14c139d494=
fcc72fa' '31dcc7e1f8a9377d8fd9f967f84c121c5ba8f89c' '4d410ba9aa275e7990a270=
f63ce436990ace1bea' '4412ab501677606436e5c49e41151a1e6eac7ac0' '5e537031f32=
2d55315cd384398b726a9a0748d47' '9797329220a2c6622411eb9ecf6a35b24ce09d04' '=
6937ff42f28a13ffdbe2d1f5b9a51a35f626e93a' '454cd43a283f7697297c52981c7a499a=
16725656' '89c13ea3ab6ddf2b526915aa4190aec72cd202ed' 'ea97713903784286ef1ce=
45456f404ed288f19b1' 'b546e0023a203e7edf9377ac8f4f490a6965afd6' '0586b53d4a=
0c7c5a132629f99da934cc674ea4cd' '630a185fd06109193574d10f38b29812986c21de' =
'd25de16477657f9eddd4be9abd409515edcc3b9e' 'b926b15547d29a88932de3c24a05c12=
826fc1dbc' '2b92b98cc4765fbb0748742e7e0dd94d15d6f178' '7196fc4e482928a276da=
853e2687f31cd8ea2611' '6277a486a7faaa6c87f4bf1d59a2de233a093248' '5226d19d4=
cae5398caeb93a6052bfb614e0099c7' 'a3a8c9c18f6904a777ff21f300d3da8c2b214c80'=
 '561f0ed96a626c53fbd9a06ce2de6349fd0c31d2' 'f85d4062bc6894747495136e7fc020=
a28a875a15' '807c42dd8028d71222dfce035c2e87aaecbf623f' '7e1fe102c8517a40232=
7c37685357fbe279b3278' 'fe3a615dadd398f73cde00a5ba32389958242dec' 'f1029b9d=
de253f37c548f0c848022521a3b92732' '3379655524e613eb690d4c296ba0d2711a815f86=
' 'bc3eeb42597a514a0b5286f085d91c8b34e4a532' '1f95871207db4439a3116e9a86f5b=
5658a5157c4' '7b8373c80ac322403f18ff6578e346d3c149197c' '4bcd18bbf51ce84924=
a2c6a126eda65f5b27d25b' '653ce3a3f683673cb3f8904e08bffc144dd0e972' '59fedf4=
6f782c024b74ceab7868e13f0e0f10c45' 'cc7e1a9b596c9d9dc3324c056cf8162e9fca276=
5' '683bb2424cd5be17cca02067b038e9da5aa68dc6' '4076125074ea41c581e4659cf2e1=
217a12f9b0ee' '6684aba0780da9f505c202f27e68ee6d18c0aa66' 'be2ba2fef1676861b=
295053c2a567b057e9031b9' '447c98c1ca4a4b0d43be99f76c558c09956484f3' '407b90=
76c147669318a58bbd54185b03055dc9a6' '6c177775dcc5e70a64ddf4ee842c66af498f2c=
7c' '8e5d9f916a9678e2dcbed2289b87efd453e4e052' '6dde339a3df80a57ac3d780d8cf=
c14d9262e2acd'
# test job: [123cd174a3782307787268adf45f22de4d290128] https://lava.sirena.=
org.uk/scheduler/job/2078988
# test job: [4d6e2211aeb932e096f673c88475016b1cc0f8ab] https://lava.sirena.=
org.uk/scheduler/job/2078010
# test job: [1d562ba0aa7df81335bf96c02be77efe8d5bab87] https://lava.sirena.=
org.uk/scheduler/job/2078435
# test job: [1701b282ccc37f6cfbe79f6ca5ebd20040178f33] https://lava.sirena.=
org.uk/scheduler/job/2080809
# test job: [9a2292c50d1c68ea7b95aabfcbb07cf649736384] https://lava.sirena.=
org.uk/scheduler/job/2081197
# test job: [417714763ec144fa6a5af675fd5dc5aa429f67ef] https://lava.sirena.=
org.uk/scheduler/job/2080946
# test job: [d78124a65a03f1483c62d8612594d5d833b8e4a5] https://lava.sirena.=
org.uk/scheduler/job/2081049
# test job: [ca30799f7c2d04400a428fbc82aa49dc2493cc1a] https://lava.sirena.=
org.uk/scheduler/job/2081099
# test job: [df5dfcad48ca3b5aacb4daf937b7185389498394] https://lava.sirena.=
org.uk/scheduler/job/2081000
# test job: [2a69aca33cac6b191fd13c7ea16c33df680a1b0e] https://lava.sirena.=
org.uk/scheduler/job/2081132
# test job: [435d529bf5cd5646c95d80b76ef1e21f8a63bd81] https://lava.sirena.=
org.uk/scheduler/job/2081657
# test job: [375e16720b4c8ee04a01de03fb7103ac0a7a4856] https://lava.sirena.=
org.uk/scheduler/job/2081033
# test job: [5bebf839b2e7a25850b3a9bd6450148769c6e95d] https://lava.sirena.=
org.uk/scheduler/job/2081078
# test job: [2b36853d7e58fe4a2af498c1d4f5c518fe4980e8] https://lava.sirena.=
org.uk/scheduler/job/2081068
# test job: [c6a5d48156340650eea707c085de540b7740186a] https://lava.sirena.=
org.uk/scheduler/job/2080852
# test job: [81ef83de94405eaedaf8a6b09fefdbe89029a52d] https://lava.sirena.=
org.uk/scheduler/job/2081125
# test job: [182853c7680aaaf00fffd7cd347ae4aa50805fdf] https://lava.sirena.=
org.uk/scheduler/job/2080968
# test job: [170b047e15afbeaeb95a9b8c936aa5b88538c50f] https://lava.sirena.=
org.uk/scheduler/job/2080880
# test job: [90d527ac928cfdfc3a1b6ee91ff00d541ea3e444] https://lava.sirena.=
org.uk/scheduler/job/2081282
# test job: [10576b2d86522cc70d8e1d8e121a2cb9c44c2ff3] https://lava.sirena.=
org.uk/scheduler/job/2081286
# test job: [2b0d5d9b39489b9d8171896e8e24d8632c3dc807] https://lava.sirena.=
org.uk/scheduler/job/2075663
# test job: [32172cf3cb543a04c41a1677c97a38e60cad05b6] https://lava.sirena.=
org.uk/scheduler/job/2075097
# test job: [23523e9398efeee6a5741cf97052babf6fb2a808] https://lava.sirena.=
org.uk/scheduler/job/2075601
# test job: [1d5bf23aa1e8aea43beca78dc5d69c68955e8871] https://lava.sirena.=
org.uk/scheduler/job/2074854
# test job: [660d946ce6fd64678b4ed6b083dfc24c0f4d5a69] https://lava.sirena.=
org.uk/scheduler/job/2074778
# test job: [873bc94689d832878befbcadc10b6ad5bb4e0027] https://lava.sirena.=
org.uk/scheduler/job/2074857
# test job: [dfbb57c2767dc128f6360c3e41136bff8fa6f924] https://lava.sirena.=
org.uk/scheduler/job/2074905
# test job: [69f3474a01e9867dd99fc4b703fa834ea1835c7d] https://lava.sirena.=
org.uk/scheduler/job/2075108
# test job: [f78d96c289da743d517f700d3fe7c6c43df667b5] https://lava.sirena.=
org.uk/scheduler/job/2074688
# test job: [38ecd1384079d5f7b6942b68496ee7e85aa9a883] https://lava.sirena.=
org.uk/scheduler/job/2074762
# test job: [b3a5302484033331af37569f7277d00131694b57] https://lava.sirena.=
org.uk/scheduler/job/2074533
# test job: [772ada50282b0c80343c8989147db816961f571d] https://lava.sirena.=
org.uk/scheduler/job/2069203
# test job: [4acbfcf11cbe6c46c42091b49875c7002b0bff3d] https://lava.sirena.=
org.uk/scheduler/job/2069276
# test job: [e32c402533cc68abe20fcf3246b9ff53e1f96021] https://lava.sirena.=
org.uk/scheduler/job/2060081
# test job: [6985defd1d832f1dd9d1977a6a2cc2cef7632704] https://lava.sirena.=
org.uk/scheduler/job/2059076
# test job: [66ededc694f1d06a71ca35a3c8e3689e9b85b3ce] https://lava.sirena.=
org.uk/scheduler/job/2085450
# test job: [0b6c10cb8479d0d1b7b208277df2e2afe082d4bd] https://lava.sirena.=
org.uk/scheduler/job/2085255
# test job: [fb1ebb10468da414d57153ddebaab29c38ef1a78] https://lava.sirena.=
org.uk/scheduler/job/2059842
# test job: [8821c8e80a65bc4eb73daf63b34aac6b8ad69461] https://lava.sirena.=
org.uk/scheduler/job/2085271
# test job: [2089f086303b773e181567fd8d5df3038bd85937] https://lava.sirena.=
org.uk/scheduler/job/2058259
# test job: [6951be397ca8b8b167c9f99b5a11c541148c38cb] https://lava.sirena.=
org.uk/scheduler/job/2055912
# test job: [4a58f60df578bb55a1d0adca0c356e03b2818de1] https://lava.sirena.=
org.uk/scheduler/job/2057870
# test job: [b6f4bd64f453183954184ffbc2b89d73ed8fb135] https://lava.sirena.=
org.uk/scheduler/job/2057900
# test job: [4db4ce15706d6423cc4cac4b05114b0469507bad] https://lava.sirena.=
org.uk/scheduler/job/2055869
# test job: [4e92abd0a11b91af3742197a9ca962c3c00d0948] https://lava.sirena.=
org.uk/scheduler/job/2055856
# test job: [bd352547df647be8a1e6c9d4ca2b54b459f3abc1] https://lava.sirena.=
org.uk/scheduler/job/2054835
# test job: [1797d254f5c4b46b295527a635af7321a3fe1318] https://lava.sirena.=
org.uk/scheduler/job/2054670
# test job: [106d7641e55a472e7523c1f525c77fb6d420064d] https://lava.sirena.=
org.uk/scheduler/job/2054792
# test job: [56931105074fe7e5fc9d54e3163df3b95075643c] https://lava.sirena.=
org.uk/scheduler/job/2054795
# test job: [6b398c1d3da7a673b13b1857f9fff4c15ee20cef] https://lava.sirena.=
org.uk/scheduler/job/2054815
# test job: [47d98d432f19030faf06d4b2ca7fc7493057cae1] https://lava.sirena.=
org.uk/scheduler/job/2054460
# test job: [873a46141460d209bb62eaa0dc9e7b67bff924a6] https://lava.sirena.=
org.uk/scheduler/job/2054402
# test job: [abc9a349b87ac0fd3ba8787ca00971b59c2e1257] https://lava.sirena.=
org.uk/scheduler/job/2054688
# test job: [55d03b5b5bdd04daf9a35ce49db18d8bb488dffb] https://lava.sirena.=
org.uk/scheduler/job/2053847
# test job: [6d34b66fb726a613b98c936adee70d42aa5e4aa7] https://lava.sirena.=
org.uk/scheduler/job/2053689
# test job: [1044821176a64a8dc7f861e878506cde34c8b658] https://lava.sirena.=
org.uk/scheduler/job/2053111
# test job: [6bd1ad97eb790570c167d4de4ca59fbc9c33722a] https://lava.sirena.=
org.uk/scheduler/job/2053832
# test job: [8d204b6f1f7a6d5c74e5cbf09539e6081ee0a9be] https://lava.sirena.=
org.uk/scheduler/job/2064258
# test job: [7a381e373a4243926a41b8e6ebbdeb90fe9afda3] https://lava.sirena.=
org.uk/scheduler/job/2053100
# test job: [14ae052f794715c1d78113d87f3d42adf2ae24d0] https://lava.sirena.=
org.uk/scheduler/job/2065504
# test job: [1b0f3f9ee41ee2bdd206667f85ea2aa36dfe6e69] https://lava.sirena.=
org.uk/scheduler/job/2053805
# test job: [82a224498005b2a2e8edaba8e6b89464688f20e1] https://lava.sirena.=
org.uk/scheduler/job/2065854
# test job: [f121fbbdafeb98c5961c83d23628eee96e6dc28a] https://lava.sirena.=
org.uk/scheduler/job/2059447
# test job: [80bde964824757f9d8f8556bdbbf7c44785f24b3] https://lava.sirena.=
org.uk/scheduler/job/2064048
# test job: [58ac42f278054fbc4c3f174524280d7263b0699a] https://lava.sirena.=
org.uk/scheduler/job/2062177
# test job: [7139c860650535cf517a9344212ce56a21ba37f5] https://lava.sirena.=
org.uk/scheduler/job/2061946
# test job: [ba53f22ebe9e09f1c42f50d34f4deb27e5615f6a] https://lava.sirena.=
org.uk/scheduler/job/2057827
# test job: [6e00112d31c86029ad0440f8c29ee0d131984cda] https://lava.sirena.=
org.uk/scheduler/job/2050127
# test job: [680c683c8f49455bcfa1604eac4e508ba96ccbfa] https://lava.sirena.=
org.uk/scheduler/job/2049809
# test job: [74cc4f3ea4e99262ba0d619c6a4ee33e2cd47f65] https://lava.sirena.=
org.uk/scheduler/job/2050052
# test job: [35501ac3c7d40a7bb9568c2f89d6b56beaf9bed3] https://lava.sirena.=
org.uk/scheduler/job/2063934
# test job: [55094e55ae36c7566e29ae0473d205dbc9d2f4a8] https://lava.sirena.=
org.uk/scheduler/job/2050050
# test job: [40a7c5db9020079547358f486ef12d57c1a7aa1f] https://lava.sirena.=
org.uk/scheduler/job/2049300
# test job: [44432315444cbbedadbb9d808c9fc8c8b21cb4bf] https://lava.sirena.=
org.uk/scheduler/job/2049835
# test job: [e386c2cf3df2b62a6cc78d2f7984102b64753bee] https://lava.sirena.=
org.uk/scheduler/job/2050178
# test job: [be04e96ba911fac1dc4c7f89ebb42018d167043f] https://lava.sirena.=
org.uk/scheduler/job/2065434
# test job: [b1034a690129acd8995137bf4462470b4a2aa690] https://lava.sirena.=
org.uk/scheduler/job/2061798
# test job: [bfbb12dfa144d45575bcfe139a71360b3ce80237] https://lava.sirena.=
org.uk/scheduler/job/2049902
# test job: [88a5f8e628ef745bb94bdf2fa019d9f8e069ccea] https://lava.sirena.=
org.uk/scheduler/job/2050060
# test job: [bcb3f6f5286b96ff0a7106d2ca7208744b20b37e] https://lava.sirena.=
org.uk/scheduler/job/2049807
# test job: [3c36965df80801344850388592e95033eceea05b] https://lava.sirena.=
org.uk/scheduler/job/2049475
# test job: [de8e95773c48bad9d7339ccb376ad22d93932468] https://lava.sirena.=
org.uk/scheduler/job/2050073
# test job: [950a4e5788fc7dc6e8e93614a7d4d0449c39fb8d] https://lava.sirena.=
org.uk/scheduler/job/2050159
# test job: [b6a1d7243ec3a3fe1a3c2969fcd32c802fb5d2a9] https://lava.sirena.=
org.uk/scheduler/job/2050124
# test job: [f678ea19e8f60b05b8d3a5bcda9a238d5355bd50] https://lava.sirena.=
org.uk/scheduler/job/2050120
# test job: [896f1e4e106449ac2b39f0ca62b6afaed540f758] https://lava.sirena.=
org.uk/scheduler/job/2050074
# test job: [655079ac8a7721ac215a0596e3f33b740e01144a] https://lava.sirena.=
org.uk/scheduler/job/2049675
# test job: [89cf2223ee7bd83d45c6bef3ac52bedd018f77dd] https://lava.sirena.=
org.uk/scheduler/job/2050088
# test job: [0cf064be87a6ae0708f171c6b863b26ba9453054] https://lava.sirena.=
org.uk/scheduler/job/2064581
# test job: [a354f030dbce17ab3cf299660a38b162d97f7151] https://lava.sirena.=
org.uk/scheduler/job/2050135
# test job: [b828059f86f67729aae3934650ae9e44a59ff9d8] https://lava.sirena.=
org.uk/scheduler/job/2049774
# test job: [81c53b52de21b8d5a3de55ebd06b6bf188bf7efd] https://lava.sirena.=
org.uk/scheduler/job/2050126
# test job: [d0f9f5b7a3356b43f78b37b9cc3671ecc7469356] https://lava.sirena.=
org.uk/scheduler/job/2050116
# test job: [a87a7b3530728fb7477a74c27fc27e060bf5684f] https://lava.sirena.=
org.uk/scheduler/job/2049576
# test job: [4b1edbb028fb95b546893068b321a983b1ef50bc] https://lava.sirena.=
org.uk/scheduler/job/2050004
# test job: [aa897ffc396b48cc39eee133b6b43175d0df9eb5] https://lava.sirena.=
org.uk/scheduler/job/2048862
# test job: [2f538ef9f6f7c3d700c68536f21447dfc598f8c8] https://lava.sirena.=
org.uk/scheduler/job/2048827
# test job: [8b6faa7fddf0ae69c5f1a9315a64edee6f022037] https://lava.sirena.=
org.uk/scheduler/job/2048842
# test job: [47955b58cf9b97fe4dc2b0d622b8ea3a2656bbf9] https://lava.sirena.=
org.uk/scheduler/job/2064423
# test job: [b4e002d8a7cee3b1d70efad0e222567f92a73000] https://lava.sirena.=
org.uk/scheduler/job/2044590
# test job: [6022eacdda8b0b06a2e1d4122e5268099b62ff5d] https://lava.sirena.=
org.uk/scheduler/job/2044511
# test job: [1149fcf75972f6918aeb05303b1aa1e38e0df6eb] https://lava.sirena.=
org.uk/scheduler/job/2065026
# test job: [3b071bdd26849172101081573a18022af108fb21] https://lava.sirena.=
org.uk/scheduler/job/2043975
# test job: [9de2057bbdfb58f4d9bb1476135317cd3fe6aa52] https://lava.sirena.=
org.uk/scheduler/job/2043543
# test job: [ecaba8b7990d8c6d8ba097cd4499b3b92d9df6ea] https://lava.sirena.=
org.uk/scheduler/job/2044102
# test job: [c4e68959af66df525d71db619ffe44af9178bb22] https://lava.sirena.=
org.uk/scheduler/job/2044068
# test job: [af9c8092d84244ca54ffb590435735f788e7a170] https://lava.sirena.=
org.uk/scheduler/job/2043638
# test job: [380fd29d57abe6679d87ec56babe65ddc5873a37] https://lava.sirena.=
org.uk/scheduler/job/2044676
# test job: [e2d4f42271155045a49b89530f2c06ad8e9f1a1e] https://lava.sirena.=
org.uk/scheduler/job/2061621
# test job: [a4438f06b1db15ce3d831ce82b8767665638aa2a] https://lava.sirena.=
org.uk/scheduler/job/2064533
# test job: [290b633a7d8ad56f1176c4e89bce8cb5092e6cea] https://lava.sirena.=
org.uk/scheduler/job/2061079
# test job: [b2cfc0cd68b830dde80fce2406580e258a1e976d] https://lava.sirena.=
org.uk/scheduler/job/2060079
# test job: [947eaef21577f52db046992c887ed9698f9d883c] https://lava.sirena.=
org.uk/scheduler/job/2038214
# test job: [f47e782c45f8f0c3d7b84edd7e94bfce9eb00b64] https://lava.sirena.=
org.uk/scheduler/job/2038595
# test job: [9115815afbc3815391a82d192f9b12aaff1e4ce8] https://lava.sirena.=
org.uk/scheduler/job/2062991
# test job: [84194c66aaf78fed150edb217b9f341518b1cba2] https://lava.sirena.=
org.uk/scheduler/job/2038369
# test job: [252abf2d07d33b1c70a59ba1c9395ba42bbd793e] https://lava.sirena.=
org.uk/scheduler/job/2038670
# test job: [164d1037c4f86828b77a15c9071f051c5acddc93] https://lava.sirena.=
org.uk/scheduler/job/2038669
# test job: [0144a2b29d95af8523c308116de65d398d6e935b] https://lava.sirena.=
org.uk/scheduler/job/2038601
# test job: [2ecc8c089802e033d2e5204d21a9f467e2517df9] https://lava.sirena.=
org.uk/scheduler/job/2038642
# test job: [a2d4691b3fec6a2360e4ec953d06819ea055c3e7] https://lava.sirena.=
org.uk/scheduler/job/2038588
# test job: [1a88479436a52452429f6d50ec5bd0a546406485] https://lava.sirena.=
org.uk/scheduler/job/2038664
# test job: [d776e805f197cb055c759d190bcc249072244d1c] https://lava.sirena.=
org.uk/scheduler/job/2061644
# test job: [bb8222b6f3586168f66ae5678fdca3179af60821] https://lava.sirena.=
org.uk/scheduler/job/2059974
# test job: [44bf8bbe29fd50ed2b8dfd1873bd22f76ca2f4d9] https://lava.sirena.=
org.uk/scheduler/job/2039978
# test job: [94a3a95f03154d8d4c6206950a7f6ef9a30baec6] https://lava.sirena.=
org.uk/scheduler/job/2029134
# test job: [44c1a444b030647803d900e60f5a8af31a782f0e] https://lava.sirena.=
org.uk/scheduler/job/2029130
# test job: [27fef3048fe95934f6f2f87341eb33ef6581a075] https://lava.sirena.=
org.uk/scheduler/job/2029137
# test job: [ed5d499b5c9cc11dd3edae1a7a55db7dfa4f1bdc] https://lava.sirena.=
org.uk/scheduler/job/2029058
# test job: [bda6f8749c8e0b10f083dc7a1edf169f349fb776] https://lava.sirena.=
org.uk/scheduler/job/2029135
# test job: [90e69d291d195d35215b578d210fd3ce0e5a3f42] https://lava.sirena.=
org.uk/scheduler/job/2063599
# test job: [3c0c81de525d2a2718e23754a5795483167904ac] https://lava.sirena.=
org.uk/scheduler/job/2059229
# test job: [db66398fb03ee3599ec7387ceb5121b95e648eb3] https://lava.sirena.=
org.uk/scheduler/job/2026675
# test job: [295f58fdccd05b2d6da1f4a4f81952ccb565c4dc] https://lava.sirena.=
org.uk/scheduler/job/2061036
# test job: [92ad6505a4b5e28afcc8cf5f4dd3fd137e58026b] https://lava.sirena.=
org.uk/scheduler/job/2064400
# test job: [3d8096fd378b0b4dae356e6f037d03da83f559d2] https://lava.sirena.=
org.uk/scheduler/job/2026745
# test job: [f1dfbc1b5cf8650ae9a0d543e5f5335fc0f478ce] https://lava.sirena.=
org.uk/scheduler/job/2025491
# test job: [70713fe90439613f2ec50610cc70481f95d09279] https://lava.sirena.=
org.uk/scheduler/job/2060236
# test job: [ecd0de438c1f0ee86cf8f6d5047965a2a181444b] https://lava.sirena.=
org.uk/scheduler/job/2026141
# test job: [6ef8e042cdcaabe3e3c68592ba8bfbaee2fa10a3] https://lava.sirena.=
org.uk/scheduler/job/2025982
# test job: [44df6a7821ed393658903bf5c1da0b9921bd1025] https://lava.sirena.=
org.uk/scheduler/job/2064669
# test job: [e73b743bfe8a6ff4e05b5657d3f7586a17ac3ba0] https://lava.sirena.=
org.uk/scheduler/job/2026452
# test job: [ef37146360385282b5f6a5b4bf695db30d609887] https://lava.sirena.=
org.uk/scheduler/job/2025920
# test job: [9b8dde0f4b26de59f64cb824669151476f76b8ba] https://lava.sirena.=
org.uk/scheduler/job/2065044
# test job: [ca8313fd83399ea1d18e695c2ae9b259985c9e1f] https://lava.sirena.=
org.uk/scheduler/job/2064694
# test job: [cf6bf51b53252284bafc7377a4d8dbf10f048b4d] https://lava.sirena.=
org.uk/scheduler/job/2023016
# test job: [3d66c4e14fbf4d59ca4665391d133655fa668042] https://lava.sirena.=
org.uk/scheduler/job/2064686
# test job: [1e5351ba60f5355809f30c61bbd27e97611d2be9] https://lava.sirena.=
org.uk/scheduler/job/2022826
# test job: [3cd523ba270665861647304aa30500f238ebf26e] https://lava.sirena.=
org.uk/scheduler/job/2022876
# test job: [2b4d53eb5cf32c5b7b7616f23f08471fd8b3708e] https://lava.sirena.=
org.uk/scheduler/job/2022865
# test job: [bcba17279327c6e85dee6a97014dc642e2dc93cc] https://lava.sirena.=
org.uk/scheduler/job/2021268
# test job: [541aecd34383a85eaf7c8556779466e394554fed] https://lava.sirena.=
org.uk/scheduler/job/2023092
# test job: [089c0a9853ae6b297adf6e2f3b94e4f75dc1f97f] https://lava.sirena.=
org.uk/scheduler/job/2062333
# test job: [d02460317ed9c95aa2c5f6ff1c70e22e1857d95d] https://lava.sirena.=
org.uk/scheduler/job/2021536
# test job: [b69165a09727b653993934d700a02d32a8961327] https://lava.sirena.=
org.uk/scheduler/job/2060032
# test job: [8fdb030fe283c84fd8d378c97ad0f32d6cdec6ce] https://lava.sirena.=
org.uk/scheduler/job/2021532
# test job: [20bcda681f8597e86070a4b3b12d1e4f541865d3] https://lava.sirena.=
org.uk/scheduler/job/2023087
# test job: [f9f4fda15e720686f1b2b436591ab11255e4e85e] https://lava.sirena.=
org.uk/scheduler/job/2057355
# test job: [5fa671232f703a404caa05c581411ea858c4cf16] https://lava.sirena.=
org.uk/scheduler/job/2021479
# test job: [e2ff7154813a3834692703852604b2099ecf043a] https://lava.sirena.=
org.uk/scheduler/job/2023213
# test job: [9c7f7262bc1affb9b9acd2ec2fb1f6314d5d474c] https://lava.sirena.=
org.uk/scheduler/job/2020325
# test job: [28039efa4d8e8bbf98b066133a906bd4e307d496] https://lava.sirena.=
org.uk/scheduler/job/2020473
# test job: [e062bdfdd6adbb2dee7751d054c1d8df63ddb8b8] https://lava.sirena.=
org.uk/scheduler/job/2020147
# test job: [ac479277c24c859553a6db340aa1518d320bc5e2] https://lava.sirena.=
org.uk/scheduler/job/2016809
# test job: [6e8146909eae3a42807c750ad84e3fa29c192822] https://lava.sirena.=
org.uk/scheduler/job/2016646
# test job: [a4619aadb308db0418b56b237019dc5ab928aa0b] https://lava.sirena.=
org.uk/scheduler/job/2016757
# test job: [060028c7fcdd7bc1c6ed61fb25380c0d6c36475b] https://lava.sirena.=
org.uk/scheduler/job/2016671
# test job: [eda4a53f8fe021328c468175a02da8d7ad155494] https://lava.sirena.=
org.uk/scheduler/job/2018211
# test job: [b90871cba6eda108d5df88bf9932723b9a445690] https://lava.sirena.=
org.uk/scheduler/job/2063114
# test job: [250eddd69da21999007fd09e17a7c43b92cc6220] https://lava.sirena.=
org.uk/scheduler/job/2016687
# test job: [7915d513e22db3226bfc7d5428b6dd6faa3ce181] https://lava.sirena.=
org.uk/scheduler/job/2063323
# test job: [dc74a00c7661a14a672ea7660caca5c4aa661a79] https://lava.sirena.=
org.uk/scheduler/job/2016079
# test job: [66fecfa91deb536a12ddf3d878a99590d7900277] https://lava.sirena.=
org.uk/scheduler/job/2015594
# test job: [f034c16a4663eaf3198dc18b201ba50533fb5b81] https://lava.sirena.=
org.uk/scheduler/job/2015542
# test job: [7a78e387654f20e798ceab5bae9c1f5557416431] https://lava.sirena.=
org.uk/scheduler/job/2015591
# test job: [67e4b0dfcc6702a31fbb6a3015c0dc867e295eb4] https://lava.sirena.=
org.uk/scheduler/job/2011293
# test job: [4a5ac6cd05a7e54f1585d7779464d6ed6272c134] https://lava.sirena.=
org.uk/scheduler/job/2011296
# test job: [6ddcd78aa7f85e1d94ab7f90c72d1ad0c0c7b6ea] https://lava.sirena.=
org.uk/scheduler/job/2011168
# test job: [258e7d28a3dcd389239f9688058140c1a418b549] https://lava.sirena.=
org.uk/scheduler/job/2061244
# test job: [013a3a66f25af3fb614f45df43983657514944c4] https://lava.sirena.=
org.uk/scheduler/job/2010603
# test job: [46a3df50b0cab466099515f2375b01c5be4fb95c] https://lava.sirena.=
org.uk/scheduler/job/2009757
# test job: [715159314dfafee66e6deb50b4e3431539a919d8] https://lava.sirena.=
org.uk/scheduler/job/2010548
# test job: [7159816707dc7040fe3ac4fa3d7ac3d173bd772a] https://lava.sirena.=
org.uk/scheduler/job/2010376
# test job: [cf6290eebe3cc4eb677d11aa061d10cb1df12ab9] https://lava.sirena.=
org.uk/scheduler/job/2009852
# test job: [0a5e9769d088bd1d8faf01207210911b9341b62c] https://lava.sirena.=
org.uk/scheduler/job/2011038
# test job: [12aa3160c10a3179c73c4f99a2d5aec0fd907d0c] https://lava.sirena.=
org.uk/scheduler/job/2010914
# test job: [0723affa1bee50c3bd7ca00e00dee07fcef224b8] https://lava.sirena.=
org.uk/scheduler/job/2010874
# test job: [c7b6c6b60594fd1efe35c61bc6a2176b25263ccc] https://lava.sirena.=
org.uk/scheduler/job/2010326
# test job: [4c33cef58965eb655a0ac8e243aa323581ec025f] https://lava.sirena.=
org.uk/scheduler/job/2009440
# test job: [3cde66094575a5b1310a7631d28761bd3dfcea63] https://lava.sirena.=
org.uk/scheduler/job/2063701
# test job: [8d557cc4867f2008f440c54b4423464301a1ef4b] https://lava.sirena.=
org.uk/scheduler/job/2010950
# test job: [cdd27fa3298ad2f39788804f7d09ab31af2b416c] https://lava.sirena.=
org.uk/scheduler/job/2009777
# test job: [86df0030b71d7172317d957df17524a7fd6232d4] https://lava.sirena.=
org.uk/scheduler/job/2009936
# test job: [56bbda23d4bece7ce998666118a068e4f71d59fb] https://lava.sirena.=
org.uk/scheduler/job/2010540
# test job: [191a27faf53edf9e9101901e402bfee49c44073c] https://lava.sirena.=
org.uk/scheduler/job/2009807
# test job: [64670a6c062c4d183c366d46e71ee76395af6a15] https://lava.sirena.=
org.uk/scheduler/job/2009781
# test job: [1afc05996299b4546e8be9b13c89f78e19912c7d] https://lava.sirena.=
org.uk/scheduler/job/2009817
# test job: [dfe7c3401ed3d3bd8e61be8d6d452896513eb52e] https://lava.sirena.=
org.uk/scheduler/job/2011037
# test job: [390c05f47d0749b24db65586482308c5fd680fe5] https://lava.sirena.=
org.uk/scheduler/job/2010804
# test job: [ef042df96d0e1089764f39ede61bc8f140a4be00] https://lava.sirena.=
org.uk/scheduler/job/2010158
# test job: [aed760df8e8ebc2035561e53bef184e6a8240610] https://lava.sirena.=
org.uk/scheduler/job/2065706
# test job: [e92e25f777483b7cc3e170214cc84337d7a415cf] https://lava.sirena.=
org.uk/scheduler/job/2010573
# test job: [7b6be935e7eff06025e18cea4c6620194450abe2] https://lava.sirena.=
org.uk/scheduler/job/2010233
# test job: [daab108504be73182c16a72b9cfe47ac3b1928ca] https://lava.sirena.=
org.uk/scheduler/job/2010908
# test job: [12dc929c6cc5fb5f82d6f245ceb3548b4c800121] https://lava.sirena.=
org.uk/scheduler/job/2066289
# test job: [aeaf27ec6571527e750eed84bb3865a0664ae316] https://lava.sirena.=
org.uk/scheduler/job/2011018
# test job: [c4d096c3ca425562192a3626c30e82651d0f2c1c] https://lava.sirena.=
org.uk/scheduler/job/2011006
# test job: [f7097161e94cd39df7a8848ad0de5f394124ed69] https://lava.sirena.=
org.uk/scheduler/job/2009745
# test job: [907364ea3db47530751add6d2d62122ca17329cb] https://lava.sirena.=
org.uk/scheduler/job/2010271
# test job: [f1b26faafdc3bb9afd8d3b67089980ef34c7f7db] https://lava.sirena.=
org.uk/scheduler/job/2062234
# test job: [2b62e66626f05e277c8fdeb50d4c1e0cbab2fe0e] https://lava.sirena.=
org.uk/scheduler/job/2009922
# test job: [71f7990a34cdb11f82d3cbbcddaca77a55635466] https://lava.sirena.=
org.uk/scheduler/job/2011061
# test job: [4795375d8aa072e9aacb0b278e6203c6ca41816a] https://lava.sirena.=
org.uk/scheduler/job/2009932
# test job: [959400caf51eb31f95d1ab754a285b5546ebd3e4] https://lava.sirena.=
org.uk/scheduler/job/2009820
# test job: [ef24466ee1912997c2bd526194006bbca424c24f] https://lava.sirena.=
org.uk/scheduler/job/2009836
# test job: [c63b2315b9cc6b705205c73dcf4591cfeb9a25ae] https://lava.sirena.=
org.uk/scheduler/job/2007602
# test job: [ca4d49f8a21c37be7e5aed80100ca6b13ac3cf9d] https://lava.sirena.=
org.uk/scheduler/job/2008725
# test job: [e973dfe9259095fb509ab12658c68d46f0e439d7] https://lava.sirena.=
org.uk/scheduler/job/2008133
# test job: [e7434adf0c53a84d548226304cdb41c8818da1cb] https://lava.sirena.=
org.uk/scheduler/job/2007974
# test job: [d29479abaded34b2b1dab2e17efe96a65eba3d61] https://lava.sirena.=
org.uk/scheduler/job/2008541
# test job: [38ff69586bbb3a823dd501972e17075374b685a1] https://lava.sirena.=
org.uk/scheduler/job/2007667
# test job: [bb65cb96f64e9b4ea2bbd41e4591f3da91414fdb] https://lava.sirena.=
org.uk/scheduler/job/2007601
# test job: [ddbcd2f396116581ad035fb76a99fc2ed865a85f] https://lava.sirena.=
org.uk/scheduler/job/2008724
# test job: [77a58ba7c64ccca20616aa03599766ccb0d1a330] https://lava.sirena.=
org.uk/scheduler/job/2007439
# test job: [1e0722a77b4e263854a812c9c106ddef8fd56720] https://lava.sirena.=
org.uk/scheduler/job/2008213
# test job: [9957614d2b79578b6f9a2512bfbb2bc7bbdc43ce] https://lava.sirena.=
org.uk/scheduler/job/2008863
# test job: [f97ebfda8da28a77a0218a448829451ba7e30d5d] https://lava.sirena.=
org.uk/scheduler/job/2007366
# test job: [d68eb9096fb065cc0cb5218ae651f54b08de5831] https://lava.sirena.=
org.uk/scheduler/job/2063235
# test job: [01313661b248c5ba586acae09bff57077dbec0a5] https://lava.sirena.=
org.uk/scheduler/job/2008892
# test job: [e7ab858390f24a23ba0827066382ba0e6a8e4379] https://lava.sirena.=
org.uk/scheduler/job/2008714
# test job: [ee4407e1288ab85be16bacc45195b8bb23d44760] https://lava.sirena.=
org.uk/scheduler/job/2008201
# test job: [c37c3e5e390dcd52cbe6178ac53f5a6131ef6f8c] https://lava.sirena.=
org.uk/scheduler/job/2008319
# test job: [3941abb26ff327e53e1e8b873cab3ed3d5103eab] https://lava.sirena.=
org.uk/scheduler/job/2007884
# test job: [c06a017439110debd335b6864bc2d69835624235] https://lava.sirena.=
org.uk/scheduler/job/2064738
# test job: [e30f8e61e2518a837837daa26cda3c8cc30f3226] https://lava.sirena.=
org.uk/scheduler/job/2065610
# test job: [8d4f9b5ff333183e398811bad6f68d1a7f23f967] https://lava.sirena.=
org.uk/scheduler/job/2061397
# test job: [986e9104b14720bafa2d37dd6217da8151ee4cb8] https://lava.sirena.=
org.uk/scheduler/job/2063309
# test job: [2914f6ea90772ce4a8311a6d5b3ab94e3cd31b12] https://lava.sirena.=
org.uk/scheduler/job/1999965
# test job: [2528c15f314ece50218d1273654f630d74109583] https://lava.sirena.=
org.uk/scheduler/job/1997621
# test job: [098456f3141bf9e0c0d8973695ca38a03465ccd6] https://lava.sirena.=
org.uk/scheduler/job/2012894
# test job: [c17fa4cbc546c431ccf13e9354d5d9c1cd247b7c] https://lava.sirena.=
org.uk/scheduler/job/2000016
# test job: [edf5c8920240dcafe830908549a0edee4ba3b4b0] https://lava.sirena.=
org.uk/scheduler/job/1995973
# test job: [fd5ef3d69f8975bad16c437a337b5cb04c8217a2] https://lava.sirena.=
org.uk/scheduler/job/1996187
# test job: [f76dbe127f1b5910e37dfe307d2de5c13d61ed89] https://lava.sirena.=
org.uk/scheduler/job/1995964
# test job: [310bf433c01f78e0756fd5056a43118a2f77318c] https://lava.sirena.=
org.uk/scheduler/job/1996061
# test job: [d054cc3a2ccfb19484f3b54d69b6e416832dc8f4] https://lava.sirena.=
org.uk/scheduler/job/1995870
# test job: [7c69694cec869e3bf7c810fd94f860253aeb8053] https://lava.sirena.=
org.uk/scheduler/job/1996179
# test job: [d227a8b3e715963b7c034971c3b467d5430a2cab] https://lava.sirena.=
org.uk/scheduler/job/2057749
# test job: [108fba26698a75bb8e1acc21553a6860313aebd2] https://lava.sirena.=
org.uk/scheduler/job/1992096
# test job: [638bae3fb225a708dc67db613af62f6d14c4eff4] https://lava.sirena.=
org.uk/scheduler/job/1992019
# test job: [45392fd4394cb8d4b39ba0f144651aba05b7b2a7] https://lava.sirena.=
org.uk/scheduler/job/2066133
# test job: [b9a7c9599120185ae65424cb93ab8af7b9024cf9] https://lava.sirena.=
org.uk/scheduler/job/2061604
# test job: [9ce084e579bf550ee92b1ecbadf1c29a76c1062c] https://lava.sirena.=
org.uk/scheduler/job/1995024
# test job: [4c987d67b31f93ac88f4be6dfec6a169997fc2c8] https://lava.sirena.=
org.uk/scheduler/job/2061053
# test job: [18e4a02963b7582207b8a7b25d053f40ac206e4d] https://lava.sirena.=
org.uk/scheduler/job/2067044
# test job: [1dcd763ba1f62c1305a03bc7d5bd1d44c20a4f5e] https://lava.sirena.=
org.uk/scheduler/job/2006979
# test job: [6a4f29bc66294d44d61a294e5bdc623eae74587b] https://lava.sirena.=
org.uk/scheduler/job/1985055
# test job: [965a39a9627bfaee5a4f7471097439da19008338] https://lava.sirena.=
org.uk/scheduler/job/2061730
# test job: [900da53226121c1e710ca95857806a136ab281a2] https://lava.sirena.=
org.uk/scheduler/job/1985196
# test job: [5cd5f8fc29fa1b6d7c0a8f2b0a95b896ecadfa42] https://lava.sirena.=
org.uk/scheduler/job/1985054
# test job: [ecba655bf54a661ffe078856cd8dbc898270e4b5] https://lava.sirena.=
org.uk/scheduler/job/1985124
# test job: [2880c42a0de68e9eb979e5331fbd5b2c79e093ad] https://lava.sirena.=
org.uk/scheduler/job/1985696
# test job: [e0fb9464295bca2aa92835d02147d3265a83689a] https://lava.sirena.=
org.uk/scheduler/job/1985700
# test job: [8c465b1669bfeaaf0ebd504b96d689e2a2810874] https://lava.sirena.=
org.uk/scheduler/job/1985760
# test job: [df900536e85819f6168783d5f6b3908d47811fdd] https://lava.sirena.=
org.uk/scheduler/job/2062034
# test job: [2497a7116ff9a051d0e78885a27a52213bc2841d] https://lava.sirena.=
org.uk/scheduler/job/2058552
# test job: [335482a53a5766d20d7a14f0532859a7e84cec0a] https://lava.sirena.=
org.uk/scheduler/job/2012833
# test job: [17e5a9b77716564540d81f0c1e6082d28cf305c9] https://lava.sirena.=
org.uk/scheduler/job/2061702
# test job: [fb4f1cb3e04d706bc7d02dc6ed9e5baafa903de9] https://lava.sirena.=
org.uk/scheduler/job/2011859
# test job: [1c9986e782de45bf32fb4f886a40c1393d169568] https://lava.sirena.=
org.uk/scheduler/job/2058969
# test job: [7ea0468380216c10b73633b976d33efa8c12d375] https://lava.sirena.=
org.uk/scheduler/job/2012878
# test job: [3d7c626716aae6e96d7d463f184a09df4cd4bdb2] https://lava.sirena.=
org.uk/scheduler/job/2011048
# test job: [29dc539d74abd1ec4e509fda29bc821f3586d333] https://lava.sirena.=
org.uk/scheduler/job/2060987
# test job: [182a258b5ec4a45170e776d3a0c0bccfc4fab998] https://lava.sirena.=
org.uk/scheduler/job/2064776
# test job: [7e1906643a7374529af74b013bba35e4fa4e6ffc] https://lava.sirena.=
org.uk/scheduler/job/1978635
# test job: [f5a6fa189ad2e73d25e31de3cc7f0bf81907c986] https://lava.sirena.=
org.uk/scheduler/job/2064082
# test job: [9e851421266baaedf86f8a31b62aeda0c72a88d8] https://lava.sirena.=
org.uk/scheduler/job/1976337
# test job: [601e7b30670a25b4cadfb05bded9345126d82b58] https://lava.sirena.=
org.uk/scheduler/job/1975841
# test job: [a7aa34438d6367a34555e8cda99ba379ef52938b] https://lava.sirena.=
org.uk/scheduler/job/1976311
# test job: [504219ea359c4545176f76bab77e0ba38a8629d7] https://lava.sirena.=
org.uk/scheduler/job/1976714
# test job: [ccf4bead907d8be7212e69adeca64a078712d8a6] https://lava.sirena.=
org.uk/scheduler/job/1977613
# test job: [ba93cda8cc9eb426c801aa8dca8a0e3874de958f] https://lava.sirena.=
org.uk/scheduler/job/1975425
# test job: [b9b68f3a262bce63d4d363f08b345481e4f9d23b] https://lava.sirena.=
org.uk/scheduler/job/1976167
# test job: [7e4cdef1ef8f8a3baa6806d42f6ee2f64d75cc17] https://lava.sirena.=
org.uk/scheduler/job/1976321
# test job: [a31e9992873ebf3ff66699ee13fdf847891746c6] https://lava.sirena.=
org.uk/scheduler/job/1975707
# test job: [661584c295d75ff72fae3569e4f0439325b9835e] https://lava.sirena.=
org.uk/scheduler/job/1976884
# test job: [f4ae2720f353fe58b02f49cc935933dd9ccc8ce4] https://lava.sirena.=
org.uk/scheduler/job/1977608
# test job: [8b412d3233c69a8545ca771c2b4e25774a4a90b0] https://lava.sirena.=
org.uk/scheduler/job/1976949
# test job: [386db878776142f262c5997424832090ebe5c196] https://lava.sirena.=
org.uk/scheduler/job/1977222
# test job: [3576a8d214386e314e83c36c13eb098433896fbc] https://lava.sirena.=
org.uk/scheduler/job/1976919
# test job: [6c8f8e79a3f796106b6de386b2055441b8256efb] https://lava.sirena.=
org.uk/scheduler/job/1975776
# test job: [88b0ee610790877bd9e3efcf8f29efd53eac894e] https://lava.sirena.=
org.uk/scheduler/job/1977508
# test job: [7b0c32cbed761335b0fa7f3db232ad69bc23ce69] https://lava.sirena.=
org.uk/scheduler/job/2060512
# test job: [fcc6ae5198bc13860053ea6e1fb7ca85415c77d0] https://lava.sirena.=
org.uk/scheduler/job/1976986
# test job: [6047387ab92acfc77dd981df27adca36b0c2e9ea] https://lava.sirena.=
org.uk/scheduler/job/1977174
# test job: [ae7ac6bbf0fa4475cd169b9ad2e7f751a7cb73f3] https://lava.sirena.=
org.uk/scheduler/job/1975367
# test job: [c387ff80f77e6832952fb92d511bfcfda6766a54] https://lava.sirena.=
org.uk/scheduler/job/1976970
# test job: [64d1d87d185e0cccdaff573e16af074193045167] https://lava.sirena.=
org.uk/scheduler/job/1977663
# test job: [c5c6d972d6450350ecf6b1c6dc7ec7e1462bd221] https://lava.sirena.=
org.uk/scheduler/job/1977178
# test job: [5ab215f2b60ec988e63ddde421eecc6ced137064] https://lava.sirena.=
org.uk/scheduler/job/1976715
# test job: [94cd5e54fe56165a2ac7a1ac7b3599a14b9497c0] https://lava.sirena.=
org.uk/scheduler/job/1976990
# test job: [a6531a0414ed50cbbe6244e82fec4d432a207842] https://lava.sirena.=
org.uk/scheduler/job/1976778
# test job: [9846cb5a9d06c476c503abfa840251ad3c06414e] https://lava.sirena.=
org.uk/scheduler/job/1976922
# test job: [161e3c824e63eec6515f2c7d36fba391647ccf89] https://lava.sirena.=
org.uk/scheduler/job/1976306
# test job: [c293d36d1037fc63430f9c4ec7e3fd1e42a50c0e] https://lava.sirena.=
org.uk/scheduler/job/1976388
# test job: [6e3e296c564399f17e8c99623f8ba608b8fe1b7d] https://lava.sirena.=
org.uk/scheduler/job/1977001
# test job: [d7e1399884a65e868f7b121b8ca5d613cfac6538] https://lava.sirena.=
org.uk/scheduler/job/1977587
# test job: [bc78514e84035d1a596eb558ce9da9dd5269a85e] https://lava.sirena.=
org.uk/scheduler/job/1976876
# test job: [308eee447306e885254bca4bc23b9f90534feb1a] https://lava.sirena.=
org.uk/scheduler/job/1977532
# test job: [d742ebcfe524dc54023f7c520d2ed2e4b7203c19] https://lava.sirena.=
org.uk/scheduler/job/1977210
# test job: [2c688df0fd19d02146e031502c701c184b86cd0e] https://lava.sirena.=
org.uk/scheduler/job/1977002
# test job: [9bce11a336f0d5694340f85bdca81179a02eaa81] https://lava.sirena.=
org.uk/scheduler/job/1976249
# test job: [96b67f9204fb63168076142777e3cfc2dd236d8c] https://lava.sirena.=
org.uk/scheduler/job/1977535
# test job: [3cba794c8fec8e1d5da6c3c91fafdf490de4b24f] https://lava.sirena.=
org.uk/scheduler/job/1977096
# test job: [5190935a1b93940c28cc4f484e17662246648f66] https://lava.sirena.=
org.uk/scheduler/job/1977490
# test job: [41a6e1032c799184586d3c5ecb594cc05b844dc7] https://lava.sirena.=
org.uk/scheduler/job/1975790
# test job: [ca6731ad2a4fd1e5fc549d53d4f99445fd552f97] https://lava.sirena.=
org.uk/scheduler/job/1977689
# test job: [01511c18f713b7579133f451332a1ccbb634e389] https://lava.sirena.=
org.uk/scheduler/job/1975383
# test job: [9a1e055bb51d17a44e6e46e2af922dd0d9a1fe2a] https://lava.sirena.=
org.uk/scheduler/job/1977170
# test job: [f72e15146ea024f849143a1d4c65f351cdd12488] https://lava.sirena.=
org.uk/scheduler/job/1975811
# test job: [37d9425fc9f19eb92abdcf96189e74e163b94619] https://lava.sirena.=
org.uk/scheduler/job/1977162
# test job: [b573898b82abf8d2736c90b14d76f65f9bc8d1f1] https://lava.sirena.=
org.uk/scheduler/job/1977154
# test job: [0d58897657a9a31f4817a9596a200815f8c8e602] https://lava.sirena.=
org.uk/scheduler/job/1977265
# test job: [2d54738a39b49fc46b4b22472388d74fc698b87f] https://lava.sirena.=
org.uk/scheduler/job/1976115
# test job: [a233cb3fe736647ab2a43aeb3ef1fb9a2a0744cf] https://lava.sirena.=
org.uk/scheduler/job/1976319
# test job: [ecc35b2977af71d5fceef68ca723409cd9592bc3] https://lava.sirena.=
org.uk/scheduler/job/1977172
# test job: [f793a6e08f5487b4f1e1207cc4952adc753c1f4b] https://lava.sirena.=
org.uk/scheduler/job/1976066
# test job: [801955fd9248ea5659189b0464e9e4ff0952a11a] https://lava.sirena.=
org.uk/scheduler/job/1976036
# test job: [09b29035fb5c93fa0db24df165081cc27239b1f0] https://lava.sirena.=
org.uk/scheduler/job/1977011
# test job: [1a1a66c2cee604dedbd4de3ca7d8e3c38d7de05c] https://lava.sirena.=
org.uk/scheduler/job/1975943
# test job: [2191593d061cfee48763d67e69ccb1d27655ee62] https://lava.sirena.=
org.uk/scheduler/job/1977659
# test job: [024530ea1a3b6e8c64baa76f046345800b99a1bd] https://lava.sirena.=
org.uk/scheduler/job/1976934
# test job: [c7ade18aad3e63e732a93efb5580a4b2e8563d0c] https://lava.sirena.=
org.uk/scheduler/job/1977606
# test job: [db1bcf18fe320ff4988a196f969ca739f9c3da95] https://lava.sirena.=
org.uk/scheduler/job/1976360
# test job: [c59fe12fa2acb1613eb77fe2d690ab76107bd4a4] https://lava.sirena.=
org.uk/scheduler/job/1976873
# test job: [7a0fefe28cc5a127cb63aafb5fe85852d198ee7a] https://lava.sirena.=
org.uk/scheduler/job/1976035
# test job: [18096d761f6be5a981f3480f7907859f3a431a0b] https://lava.sirena.=
org.uk/scheduler/job/1976952
# test job: [c8e43faeb4a608f45e362c55a1687f3249479a04] https://lava.sirena.=
org.uk/scheduler/job/1977196
# test job: [7e1393622591631673c419197dda2d5ff14aacc1] https://lava.sirena.=
org.uk/scheduler/job/1976629
# test job: [73f64a4803f1e092ed83f4e96225f35c42fe4be1] https://lava.sirena.=
org.uk/scheduler/job/1977218
# test job: [6bc24a7d35ceaffa0f7551b7bd13b495a27e203c] https://lava.sirena.=
org.uk/scheduler/job/1975407
# test job: [b56580c7ba8ae7ef585a7deefbb137212be6f1f0] https://lava.sirena.=
org.uk/scheduler/job/1976128
# test job: [844db7d7e7200e303fa3974e8dae5350646813d1] https://lava.sirena.=
org.uk/scheduler/job/1976344
# test job: [95972dd17b189647e96605f4edf2177a8876eb4e] https://lava.sirena.=
org.uk/scheduler/job/1976252
# test job: [3314ee8db5411e1f9adc0172ebe425c8a8066cab] https://lava.sirena.=
org.uk/scheduler/job/1977619
# test job: [74fdbce5fe88f9204634e3923c86a84c3a505ecd] https://lava.sirena.=
org.uk/scheduler/job/1976051
# test job: [626cf62777735ca51a8d88d8dc2e234b56d4f3a7] https://lava.sirena.=
org.uk/scheduler/job/1976994
# test job: [b5e0fc69e42b23e86b32f4810a41ff6b842d6426] https://lava.sirena.=
org.uk/scheduler/job/1977687
# test job: [d98fdbdf8bc654242d94616a7bfc233c67b43866] https://lava.sirena.=
org.uk/scheduler/job/1975597
# test job: [8f1d72f84e85a8757a0981040654be1fd18ea6e3] https://lava.sirena.=
org.uk/scheduler/job/1974391
# test job: [2673034a1911c215f67c64d0b844563f7903a677] https://lava.sirena.=
org.uk/scheduler/job/1977913
# test job: [1ad2f1c5662fabafc8df405a2e480ba45cdaf054] https://lava.sirena.=
org.uk/scheduler/job/1977115
# test job: [46c4e08bb11aeae95c364fa610ac6348896b881a] https://lava.sirena.=
org.uk/scheduler/job/1976327
# test job: [2041666b8f4320da1f7b8efacaafab40a745e126] https://lava.sirena.=
org.uk/scheduler/job/1977108
# test job: [8b5cc56389d08debb225d94a35e62e11a80a9b4f] https://lava.sirena.=
org.uk/scheduler/job/1977638
# test job: [c34209ba43623c2ea2593ee332f4e4f6b47fb921] https://lava.sirena.=
org.uk/scheduler/job/1977303
# test job: [344af572f088e2bb1248bb752ea3a532f7fa4208] https://lava.sirena.=
org.uk/scheduler/job/1977786
# test job: [73978d274eba0d9081bc9b5aedebb0bc6abb832c] https://lava.sirena.=
org.uk/scheduler/job/1977998
# test job: [fce217449075d59b29052b8cdac567f0f3e22641] https://lava.sirena.=
org.uk/scheduler/job/1976880
# test job: [2f0a334df0fd8e0793a7dbea40fca0d4a48dc927] https://lava.sirena.=
org.uk/scheduler/job/1977384
# test job: [b1daca0396b91a9b436b0654b8aae6a8220aa51b] https://lava.sirena.=
org.uk/scheduler/job/1977569
# test job: [6950709b6658fadc7db860a4ec33de8c5226c728] https://lava.sirena.=
org.uk/scheduler/job/1977342
# test job: [afcf45b7555fcc8e2fc177e8d4e7a2d9d79b13eb] https://lava.sirena.=
org.uk/scheduler/job/1974682
# test job: [3a071bb34cea8e97e403c7946a1fc03de164f70c] https://lava.sirena.=
org.uk/scheduler/job/1977940
# test job: [be9342c57e28d8e42638e4f234d8727da9ee609e] https://lava.sirena.=
org.uk/scheduler/job/1977710
# test job: [ddd1705b62c6920b77d8cfcccc695e99dde25ad7] https://lava.sirena.=
org.uk/scheduler/job/1975033
# test job: [a5e7aaee483c7022e96181ce899944b8c7b1f1e0] https://lava.sirena.=
org.uk/scheduler/job/1974607
# test job: [e621116150c5983dde75195f0eb2ea22baf4e87c] https://lava.sirena.=
org.uk/scheduler/job/1977302
# test job: [11c13a65e82afb830fa0f7df2fcf3ed415e6fa1b] https://lava.sirena.=
org.uk/scheduler/job/1976396
# test job: [e7ed084f4cd49806b9ff91d800c6422f96f6f5ea] https://lava.sirena.=
org.uk/scheduler/job/1977152
# test job: [ccbfc923fe935b4f1e3b1e51df828e07473faff9] https://lava.sirena.=
org.uk/scheduler/job/1976522
# test job: [cf9d07738fd94e1c3cf0c3ffb61f4d2d1e4d0c57] https://lava.sirena.=
org.uk/scheduler/job/1977194
# test job: [205a7f5c6ec0051248384e7440fb17d3f3aee372] https://lava.sirena.=
org.uk/scheduler/job/1977934
# test job: [d9f08106c16a32cb9514986351754d36f3b3c7df] https://lava.sirena.=
org.uk/scheduler/job/1976963
# test job: [a2aa8c0a2f1cbc5be1cb6195038e4484d2af38d9] https://lava.sirena.=
org.uk/scheduler/job/1974523
# test job: [c4ec2c9d7329b509e10c8980e4077f823ce68df6] https://lava.sirena.=
org.uk/scheduler/job/1977330
# test job: [7e90cf82a33827e174d3955d3ede1b3e7bb56325] https://lava.sirena.=
org.uk/scheduler/job/1977079
# test job: [92ba8c4c78810b991b697af1087ba31226aa5871] https://lava.sirena.=
org.uk/scheduler/job/1976133
# test job: [5366dcebe65bf1dc82a7362e505b69d441b5f755] https://lava.sirena.=
org.uk/scheduler/job/1977109
# test job: [13c4c81b7bc819d533c6e0aaa1bf495cd0dfd8f6] https://lava.sirena.=
org.uk/scheduler/job/1976369
# test job: [0bfe0c0a9aa7edb88f571bfbfc8f4546d6b311cb] https://lava.sirena.=
org.uk/scheduler/job/1977270
# test job: [455f2f9509b0034f32979bcdbc5441579c3a1d0a] https://lava.sirena.=
org.uk/scheduler/job/1977087
# test job: [14af3d3c4d2d8d01d91049576a59590d9c586f3a] https://lava.sirena.=
org.uk/scheduler/job/1976723
# test job: [52a87e0b5ec1f7316293773f7859996d123b3ea7] https://lava.sirena.=
org.uk/scheduler/job/1977277
# test job: [776b160f3234f85899eb3c8d454c37176484facb] https://lava.sirena.=
org.uk/scheduler/job/1975395
# test job: [f2b55e567172ccb248e66e8a0f1c7380279127f1] https://lava.sirena.=
org.uk/scheduler/job/1975135
# test job: [f7fbe0ea5f03d918418e6ad28d61bcae52bb2d22] https://lava.sirena.=
org.uk/scheduler/job/1977652
# test job: [2e6db9d197ed161702434c6c14b1c65bdef51a2c] https://lava.sirena.=
org.uk/scheduler/job/1977711
# test job: [4b5e66fc0315b9a85ce817b97a1f33829eeadd29] https://lava.sirena.=
org.uk/scheduler/job/1976633
# test job: [404e8bfcb9d6a8b6af4745f23906a7382b7eb4c4] https://lava.sirena.=
org.uk/scheduler/job/1977335
# test job: [211367ef1d4031a29fa8e07f430155d68802e8ec] https://lava.sirena.=
org.uk/scheduler/job/1977537
# test job: [eb52e20b15eac1c230fb81f7481f6f1299c2a9b8] https://lava.sirena.=
org.uk/scheduler/job/1976313
# test job: [73e86fbf251708bb2766fff746eea0ebb6fe0747] https://lava.sirena.=
org.uk/scheduler/job/1977257
# test job: [e548389df744bd28db1ba3923b6ee74ba6f73926] https://lava.sirena.=
org.uk/scheduler/job/1976080
# test job: [c0a750ce364b248efc0f4b993904dcef194612cf] https://lava.sirena.=
org.uk/scheduler/job/1977299
# test job: [6dcc15ed9e1b0ce6b1f3f53af33e2afaf0a53fa0] https://lava.sirena.=
org.uk/scheduler/job/1976599
# test job: [3c9e6dccede1146d53f940ff8b25ceee275c0686] https://lava.sirena.=
org.uk/scheduler/job/1977339
# test job: [fe0b3f564f9b1ecd74180c296129486d840bc3f9] https://lava.sirena.=
org.uk/scheduler/job/1975456
# test job: [fd27a636d3746ae20e0853f4fa48b93080a2a43d] https://lava.sirena.=
org.uk/scheduler/job/1977094
# test job: [aab1301cfde344f966bbc442a4e655867ab56768] https://lava.sirena.=
org.uk/scheduler/job/1975660
# test job: [c5f73c6679ef675fdb4e35dbc8ae0ec59eb0526c] https://lava.sirena.=
org.uk/scheduler/job/1977080
# test job: [dc5aa86741789d6dcc0c24dcff5f3ba8fbecccf9] https://lava.sirena.=
org.uk/scheduler/job/1976292
# test job: [3a3271a52075d4dc34f403c0ed850801cdc4bd4d] https://lava.sirena.=
org.uk/scheduler/job/1975743
# test job: [3815962969c811bbfa32c7d503246f9abace38cb] https://lava.sirena.=
org.uk/scheduler/job/1977567
# test job: [13b2c42b0dcf539a1ddf18374792a7a49a7afa4d] https://lava.sirena.=
org.uk/scheduler/job/1977141
# test job: [800c666497e045c3152da516fdd6bc2392571a90] https://lava.sirena.=
org.uk/scheduler/job/1975145
# test job: [db25c438f9e02c0f1566d54840640d23f59a3d4f] https://lava.sirena.=
org.uk/scheduler/job/1976516
# test job: [0c933edebd96961529e01686ce6930be5decf400] https://lava.sirena.=
org.uk/scheduler/job/1977566
# test job: [3827b34564951febc0ffa7ce93c1d9c05888e53b] https://lava.sirena.=
org.uk/scheduler/job/1977889
# test job: [62b175d6ff19de91544c9047dcaec8a33a5759a1] https://lava.sirena.=
org.uk/scheduler/job/1974544
# test job: [ee4ac04e3ccd7f4d54e767b7ab5a4067f9737fff] https://lava.sirena.=
org.uk/scheduler/job/1976691
# test job: [40c729f0a3fa14845d733f5572c283728bea0c32] https://lava.sirena.=
org.uk/scheduler/job/1975772
# test job: [9549a29371c5548a4eb0d43622a25d6bc989337f] https://lava.sirena.=
org.uk/scheduler/job/1975957
# test job: [a43676fa0585a9988e44ec000649d20c2649a3e4] https://lava.sirena.=
org.uk/scheduler/job/1975113
# test job: [ef464d9c418741ac83a33c7662db3cffda655b4f] https://lava.sirena.=
org.uk/scheduler/job/1976692
# test job: [6658472a3e2de08197acfe099ba71ee0e2505ecf] https://lava.sirena.=
org.uk/scheduler/job/1977738
# test job: [ac7db529b6c2d748102cef60da29f5ea281a757e] https://lava.sirena.=
org.uk/scheduler/job/1977331
# test job: [b805b4e062fa216302f86bd66485734683a51236] https://lava.sirena.=
org.uk/scheduler/job/1975691
# test job: [3c000883d110b381fca21572147a8c0463ba4a25] https://lava.sirena.=
org.uk/scheduler/job/1977357
# test job: [a014442252380abd19a81ae27fdfc29b988203c6] https://lava.sirena.=
org.uk/scheduler/job/1977528
# test job: [7484e7cd8ab1b78a958a000cc8581cfa1e93daa1] https://lava.sirena.=
org.uk/scheduler/job/1979641
# test job: [32e0fa9e01475beba9eeb0a5fdda69762be11947] https://lava.sirena.=
org.uk/scheduler/job/2011855
# test job: [52ecd48b8d3f5206049758d95ca5b291397b3209] https://lava.sirena.=
org.uk/scheduler/job/1978296
# test job: [1553d6c58870476f29ec0bf43f264094553d1407] https://lava.sirena.=
org.uk/scheduler/job/2011221
# test job: [a10f5cc3ac9b05c764e87ae13de9a716ff519903] https://lava.sirena.=
org.uk/scheduler/job/2066373
# test job: [7910d69376cde30e5871970d97d1a2e360568474] https://lava.sirena.=
org.uk/scheduler/job/1978291
# test job: [b959e7d402ab74c9e54d9bebfb93aef04dae24c7] https://lava.sirena.=
org.uk/scheduler/job/2063525
# test job: [5677aa6a08c1df8bc1ec71516fe1ced9b7cb545f] https://lava.sirena.=
org.uk/scheduler/job/1978913
# test job: [0cdb2b1b7edaefb54773d790c7b5c2e4ac7db60d] https://lava.sirena.=
org.uk/scheduler/job/1965951
# test job: [3e9c967f30a6dc57e4386c85ee5b75caee7246e8] https://lava.sirena.=
org.uk/scheduler/job/1978818
# test job: [0cc08c8130ac8f74419f99fe707dc193b7f79d86] https://lava.sirena.=
org.uk/scheduler/job/1965727
# test job: [75616264e0cca5ead432df7236653056b35cb0fc] https://lava.sirena.=
org.uk/scheduler/job/1982505
# test job: [233a22687411ea053a4b169c07324ee6aa33bf38] https://lava.sirena.=
org.uk/scheduler/job/1965104
# test job: [b1fc226edf8680882a5bf89038bdc55afa2ac80d] https://lava.sirena.=
org.uk/scheduler/job/1978405
# test job: [661856ca131c8bf6724905966e02149805660abe] https://lava.sirena.=
org.uk/scheduler/job/1965159
# test job: [0743acf746a81e0460a56fd5ff847d97fa7eb370] https://lava.sirena.=
org.uk/scheduler/job/1965140
# test job: [fb81b5cecb8553e3ca2b45288cf340d43c9c2991] https://lava.sirena.=
org.uk/scheduler/job/1965038
# test job: [7350f8dc15bfbb7abf1ce4babea6fcace1c574c5] https://lava.sirena.=
org.uk/scheduler/job/1965138
# test job: [80b09137aeab27e59004383058f8cc696a9ee048] https://lava.sirena.=
org.uk/scheduler/job/1965077
# test job: [902c0ea18a97b1a6eeee5799cb1fd9a79ef9208e] https://lava.sirena.=
org.uk/scheduler/job/1964991
# test job: [93b2838c6e79bc263e6129d88c5ab043dd793d28] https://lava.sirena.=
org.uk/scheduler/job/1964760
# test job: [d1ff30df1d9a4eb4c067795abb5e2a66910fd108] https://lava.sirena.=
org.uk/scheduler/job/1965057
# test job: [e8fd8080e7a9c8c577e5dec5bd6d486a3f14011c] https://lava.sirena.=
org.uk/scheduler/job/1978853
# test job: [70eec454f2d6cdfab547c262781acd38328e11a1] https://lava.sirena.=
org.uk/scheduler/job/1965100
# test job: [5263cd81578f99a00b2dd7de1da2b570b96a1b7c] https://lava.sirena.=
org.uk/scheduler/job/1964747
# test job: [367ca0688e4218e51c3d4dfdf3ef5657a62cf88d] https://lava.sirena.=
org.uk/scheduler/job/1962951
# test job: [281c97376cfcfc8cef4f5ed5dd961a1b39f5a25e] https://lava.sirena.=
org.uk/scheduler/job/1962788
# test job: [d77daa49085b067137d0adbe3263f75a7ee13a1b] https://lava.sirena.=
org.uk/scheduler/job/1962888
# test job: [79eaabc61dfbf5a4b680f42d3a113d05333c3960] https://lava.sirena.=
org.uk/scheduler/job/1979574
# test job: [4673dbe9837e3eb2fecdd12f0953006c31636aac] https://lava.sirena.=
org.uk/scheduler/job/1962994
# test job: [15afe57a874eaf104bfbb61ec598fa31627f7b19] https://lava.sirena.=
org.uk/scheduler/job/1962963
# test job: [6455ad5346c9cf755fa9dda6e326c4028fb3c853] https://lava.sirena.=
org.uk/scheduler/job/2023288
# test job: [f80ea8566917c4bb680911db839a170873e5d17c] https://lava.sirena.=
org.uk/scheduler/job/2058821
# test job: [abfc01077df66593f128d966fdad1d042facc9ac] https://lava.sirena.=
org.uk/scheduler/job/2023503
# test job: [1e570e77392f43a3cdab2849d1f81535f8a033e2] https://lava.sirena.=
org.uk/scheduler/job/1962444
# test job: [5021ccb44dc6a22a3508316442d1304371ca55db] https://lava.sirena.=
org.uk/scheduler/job/1978956
# test job: [9b685058ca936752285c5520d351b828312ac965] https://lava.sirena.=
org.uk/scheduler/job/1981303
# test job: [942b8db965006cf655d356162f7091a9238da94e] https://lava.sirena.=
org.uk/scheduler/job/2023551
# test job: [0d7f4e99217f6f715c7064c67eae8d9d09313b14] https://lava.sirena.=
org.uk/scheduler/job/1980244
# test job: [4c95380701f58b8112f0b891de8d160e4199e19d] https://lava.sirena.=
org.uk/scheduler/job/2023221
# test job: [bc2c39600212979b6fc836113bde1b707c02f442] https://lava.sirena.=
org.uk/scheduler/job/1979202
# test job: [46a177fb01e52ec0e3f9eab9b217a0f7c8909eeb] https://lava.sirena.=
org.uk/scheduler/job/2023309
# test job: [00a155c691befdb10bea52c91d4c8c930bdaf73a] https://lava.sirena.=
org.uk/scheduler/job/1980628
# test job: [6621b0f118d500092f5f3d72ddddb22aeeb3c3a0] https://lava.sirena.=
org.uk/scheduler/job/1960014
# test job: [c1afb0350069c3be137b5692923ad13d69648970] https://lava.sirena.=
org.uk/scheduler/job/1959194
# test job: [3ba5c78fe7c5d60edae0c47361f191d40c5c1cf0] https://lava.sirena.=
org.uk/scheduler/job/1982231
# test job: [835dfb12fc389f36eb007657f163bd1c539dcd45] https://lava.sirena.=
org.uk/scheduler/job/1960211
# test job: [6a8cdef7dc2a4c0dbde3f7d7100b3d99712a766b] https://lava.sirena.=
org.uk/scheduler/job/1960055
# test job: [65efe5404d151767653c7b7dd39bd2e7ad532c2d] https://lava.sirena.=
org.uk/scheduler/job/1960025
# test job: [79c36ecfc8994011ab0a973d3b4148aa5d9e0c91] https://lava.sirena.=
org.uk/scheduler/job/1959153
# test job: [1356c98ef911e14ccfaf374800840ce5bdcb3bbd] https://lava.sirena.=
org.uk/scheduler/job/1960004
# test job: [42277a1f86a14172c673a249bdc9e757065ca5a1] https://lava.sirena.=
org.uk/scheduler/job/1978418
# test job: [cee2c8396d9c8e834fe28929bc1d8153d7e9897f] https://lava.sirena.=
org.uk/scheduler/job/1959177
# test job: [9a4bbd20a879b66dddb563698345b0ae24d810a6] https://lava.sirena.=
org.uk/scheduler/job/1978258
# test job: [fb25114cd760c13cf177d9ac37837fafcc9657b5] https://lava.sirena.=
org.uk/scheduler/job/1960194
# test job: [2c05ca02621837af7cd8fab6ae7421b9cd5dff6e] https://lava.sirena.=
org.uk/scheduler/job/1980895
# test job: [03c19a99ee69f4680d7da11c164ac655b4946b99] https://lava.sirena.=
org.uk/scheduler/job/1980514
# test job: [a758314f71ba90cca2a5813bbf96c4954a15b613] https://lava.sirena.=
org.uk/scheduler/job/1957732
# test job: [6eaee77923ddf04beedb832c06f983679586361c] https://lava.sirena.=
org.uk/scheduler/job/2061663
# test job: [0b0eb7702a9fa410755e86124b4b7cd36e7d1cb4] https://lava.sirena.=
org.uk/scheduler/job/1957613
# test job: [7d9c2924f61dcabcbc5868bec6054ab4f4de01d1] https://lava.sirena.=
org.uk/scheduler/job/1957766
# test job: [ed44a5625f304ff14d01acfa086e77b5262a842f] https://lava.sirena.=
org.uk/scheduler/job/2061877
# test job: [7c2575a6406fb85946b05d8dcc856686d3156354] https://lava.sirena.=
org.uk/scheduler/job/2059550
# test job: [92a42edd347c3b5a9045bb137a33204c6ddc0803] https://lava.sirena.=
org.uk/scheduler/job/1957778
# test job: [1986798af745e90669cdac753da5d1e43dc8ebcb] https://lava.sirena.=
org.uk/scheduler/job/2064155
# test job: [0d83da43b1e1c8ce19f2bb10f54a0fdf795364f7] https://lava.sirena.=
org.uk/scheduler/job/2058715
# test job: [c2bc11f1f204ef916ec96e45cf329e42873b37d6] https://lava.sirena.=
org.uk/scheduler/job/2061137
# test job: [433e294c3c5b5d2020085a0e36c1cb47b694690a] https://lava.sirena.=
org.uk/scheduler/job/1957570
# test job: [50062baa536bcac03804cf04579c71b9351e829c] https://lava.sirena.=
org.uk/scheduler/job/1978277
# test job: [dd590d4d57ebeeb826823c288741f2ed20f452af] https://lava.sirena.=
org.uk/scheduler/job/1978510
# test job: [4cdee7888f42f5573b380ddfa9da43208e759bdc] https://lava.sirena.=
org.uk/scheduler/job/1979448
# test job: [9b7eacac22693d9177402c9d63e1c1747653d28c] https://lava.sirena.=
org.uk/scheduler/job/1982807
# test job: [4109043bff31f95d3da9ace33eb3c1925fd62cbd] https://lava.sirena.=
org.uk/scheduler/job/1978978
# test job: [68e71067ec9ad08e1e51c06123a155d0814aff7c] https://lava.sirena.=
org.uk/scheduler/job/1979556
# test job: [9ebb662fab38a5942100e597b48de5ec9d5e714d] https://lava.sirena.=
org.uk/scheduler/job/1989496
# test job: [9f14f1f91883aa2bfd6663161d2002c8ce937c43] https://lava.sirena.=
org.uk/scheduler/job/1979250
# test job: [25eac74b6bdbf6d15911b582e747e8ad12fcbf8f] https://lava.sirena.=
org.uk/scheduler/job/2061473
# test job: [a1526bcfcb6cb7cb601b9ff8e24d08881ef9afb8] https://lava.sirena.=
org.uk/scheduler/job/1980495
# test job: [122679ebf90eeff97c5f793ed9a289197e0fbb2c] https://lava.sirena.=
org.uk/scheduler/job/1979627
# test job: [81cf39be3559f3cebef6ad7b0893c06bf5a5847e] https://lava.sirena.=
org.uk/scheduler/job/1983041
# test job: [6b4679fcbfdf6f27f8455f9c7050ab6c46c6c5e0] https://lava.sirena.=
org.uk/scheduler/job/1981878
# test job: [3e4b5f66cf1a7879a081f5044ff1796aa33cb999] https://lava.sirena.=
org.uk/scheduler/job/1978813
# test job: [2b91479776b66cd815e339d420abbf4ae047bfb2] https://lava.sirena.=
org.uk/scheduler/job/2059302
# test job: [34244f784c6d062af184944a25f40ab50dfdb67a] https://lava.sirena.=
org.uk/scheduler/job/1982574
# test job: [07e1c3fd86d7a2ddce3ebc6b7390590c8524a484] https://lava.sirena.=
org.uk/scheduler/job/1980569
# test job: [c9e9b85d41f9079d6a10faabf70a0b18d5c0f177] https://lava.sirena.=
org.uk/scheduler/job/1982650
# test job: [72567c630d32bc31f671977f78228c80937ed80e] https://lava.sirena.=
org.uk/scheduler/job/1980592
# test job: [c2a3e7af31107a2e1dff92b0601d525466dc21b7] https://lava.sirena.=
org.uk/scheduler/job/1981642
# test job: [2bb23cbf3f21919ba17cf63404ec0224bd8bf4fb] https://lava.sirena.=
org.uk/scheduler/job/1982690
# test job: [a040ab73dfd1bc8198848a438f77497d8d03fba9] https://lava.sirena.=
org.uk/scheduler/job/1984187
# test job: [c2d420796a427dda71a2400909864e7f8e037fd4] https://lava.sirena.=
org.uk/scheduler/job/1979347
# test job: [6717e8f91db71641cb52855ed14c7900972ed0bc] https://lava.sirena.=
org.uk/scheduler/job/1979194
# test job: [1ba9f8979426590367406c70c1c821f5b943f993] https://lava.sirena.=
org.uk/scheduler/job/1979166
# test job: [3049fc4b5f1d2320a84e2902b3ac5a735f60ca04] https://lava.sirena.=
org.uk/scheduler/job/1980820
# test job: [41d24d78589705f85cbe90e5a8c1b55ea05557a2] https://lava.sirena.=
org.uk/scheduler/job/2060901
# test job: [b37491d72b43c3a322d396c2d8e951a10be70c17] https://lava.sirena.=
org.uk/scheduler/job/1982124
# test job: [d0ff153cca85520a2a14ee4edf44f6183b2e0e74] https://lava.sirena.=
org.uk/scheduler/job/2011091
# test job: [afb026b6d35c79f6f47752147327932827aeac8c] https://lava.sirena.=
org.uk/scheduler/job/1984255
# test job: [bf770d6d2097a52d87f4d9c88d0b05bd3998d7de] https://lava.sirena.=
org.uk/scheduler/job/1982867
# test job: [7f47685b150dbc20f881d029a7366a81b1d66322] https://lava.sirena.=
org.uk/scheduler/job/1954222
# test job: [225d70b8074502acee3943bf0c2e839e867cd38c] https://lava.sirena.=
org.uk/scheduler/job/1954377
# test job: [506cbe36a2ac7b504a2362476dc53cd548b7a29e] https://lava.sirena.=
org.uk/scheduler/job/1954132
# test job: [0d202ae0256e8e7dcea862ead5904fa27cf4ce6a] https://lava.sirena.=
org.uk/scheduler/job/1954421
# test job: [3180c7b1575d635851f0ceab6bdb176bb15e69dd] https://lava.sirena.=
org.uk/scheduler/job/1954196
# test job: [aa1ee85ce3576defd29f2a389d7508d2036af977] https://lava.sirena.=
org.uk/scheduler/job/1954226
# test job: [50292f9af8ec06dd1679943cddc3b59844266b9e] https://lava.sirena.=
org.uk/scheduler/job/1980267
# test job: [bb940b13998c40d55e186f0cf5d65c592ea1677a] https://lava.sirena.=
org.uk/scheduler/job/1954229
# test job: [a312acdcec57b3955fbf1f3057c13a6d38e4aa2a] https://lava.sirena.=
org.uk/scheduler/job/1980646
# test job: [55f8b5a96597a7b88c323a7de7228f9eae8c9943] https://lava.sirena.=
org.uk/scheduler/job/1954415
# test job: [7e7e2c6e2a1cb250f8d03bb99eed01f6d982d5dd] https://lava.sirena.=
org.uk/scheduler/job/1954338
# test job: [0f60b8508ca2ac685e0400cd802d1251a9d67ee4] https://lava.sirena.=
org.uk/scheduler/job/2060999
# test job: [0bd0a4a1428baaf4447e95f0832492d9e3d64961] https://lava.sirena.=
org.uk/scheduler/job/2065109
# test job: [9259607ec7100118cc5c608d97c9d406501e861e] https://lava.sirena.=
org.uk/scheduler/job/2057684
# test job: [b83fb1b14c06bdd765903ac852ba20a14e24f227] https://lava.sirena.=
org.uk/scheduler/job/1946876
# test job: [99c159279c6dfa2c4867c7f76875f58263f8f43b] https://lava.sirena.=
org.uk/scheduler/job/1947477
# test job: [3c89238ca35bfe176ba34bc688541f90f6fa7bdb] https://lava.sirena.=
org.uk/scheduler/job/1946889
# test job: [4ebe64f507ca921c5109eb37eae6058b77413d93] https://lava.sirena.=
org.uk/scheduler/job/1946962
# test job: [29fa213c6ab00c6749db47b47e384cab760c109e] https://lava.sirena.=
org.uk/scheduler/job/1946530
# test job: [5ed60e45c59d66e61586a10433e2b5527d4d72b5] https://lava.sirena.=
org.uk/scheduler/job/1947437
# test job: [64d87ccfae3326a9561fe41dc6073064a083e0df] https://lava.sirena.=
org.uk/scheduler/job/1947227
# test job: [fe8cc44dd173cde5788ab4e3730ac61f3d316d9c] https://lava.sirena.=
org.uk/scheduler/job/1947171
# test job: [efb79de36e947d136517bac14c139d494fcc72fa] https://lava.sirena.=
org.uk/scheduler/job/1947145
# test job: [31dcc7e1f8a9377d8fd9f967f84c121c5ba8f89c] https://lava.sirena.=
org.uk/scheduler/job/1947466
# test job: [4d410ba9aa275e7990a270f63ce436990ace1bea] https://lava.sirena.=
org.uk/scheduler/job/1947827
# test job: [4412ab501677606436e5c49e41151a1e6eac7ac0] https://lava.sirena.=
org.uk/scheduler/job/1950276
# test job: [5e537031f322d55315cd384398b726a9a0748d47] https://lava.sirena.=
org.uk/scheduler/job/1946728
# test job: [9797329220a2c6622411eb9ecf6a35b24ce09d04] https://lava.sirena.=
org.uk/scheduler/job/1947423
# test job: [6937ff42f28a13ffdbe2d1f5b9a51a35f626e93a] https://lava.sirena.=
org.uk/scheduler/job/1947497
# test job: [454cd43a283f7697297c52981c7a499a16725656] https://lava.sirena.=
org.uk/scheduler/job/1946606
# test job: [89c13ea3ab6ddf2b526915aa4190aec72cd202ed] https://lava.sirena.=
org.uk/scheduler/job/1979462
# test job: [ea97713903784286ef1ce45456f404ed288f19b1] https://lava.sirena.=
org.uk/scheduler/job/1947599
# test job: [b546e0023a203e7edf9377ac8f4f490a6965afd6] https://lava.sirena.=
org.uk/scheduler/job/1947559
# test job: [0586b53d4a0c7c5a132629f99da934cc674ea4cd] https://lava.sirena.=
org.uk/scheduler/job/1947343
# test job: [630a185fd06109193574d10f38b29812986c21de] https://lava.sirena.=
org.uk/scheduler/job/1947575
# test job: [d25de16477657f9eddd4be9abd409515edcc3b9e] https://lava.sirena.=
org.uk/scheduler/job/1948503
# test job: [b926b15547d29a88932de3c24a05c12826fc1dbc] https://lava.sirena.=
org.uk/scheduler/job/1947152
# test job: [2b92b98cc4765fbb0748742e7e0dd94d15d6f178] https://lava.sirena.=
org.uk/scheduler/job/1947586
# test job: [7196fc4e482928a276da853e2687f31cd8ea2611] https://lava.sirena.=
org.uk/scheduler/job/1947427
# test job: [6277a486a7faaa6c87f4bf1d59a2de233a093248] https://lava.sirena.=
org.uk/scheduler/job/1947029
# test job: [5226d19d4cae5398caeb93a6052bfb614e0099c7] https://lava.sirena.=
org.uk/scheduler/job/1947576
# test job: [a3a8c9c18f6904a777ff21f300d3da8c2b214c80] https://lava.sirena.=
org.uk/scheduler/job/1979355
# test job: [561f0ed96a626c53fbd9a06ce2de6349fd0c31d2] https://lava.sirena.=
org.uk/scheduler/job/1978384
# test job: [f85d4062bc6894747495136e7fc020a28a875a15] https://lava.sirena.=
org.uk/scheduler/job/1980271
# test job: [807c42dd8028d71222dfce035c2e87aaecbf623f] https://lava.sirena.=
org.uk/scheduler/job/1981883
# test job: [7e1fe102c8517a402327c37685357fbe279b3278] https://lava.sirena.=
org.uk/scheduler/job/1982089
# test job: [fe3a615dadd398f73cde00a5ba32389958242dec] https://lava.sirena.=
org.uk/scheduler/job/1978718
# test job: [f1029b9dde253f37c548f0c848022521a3b92732] https://lava.sirena.=
org.uk/scheduler/job/1981366
# test job: [3379655524e613eb690d4c296ba0d2711a815f86] https://lava.sirena.=
org.uk/scheduler/job/1982342
# test job: [bc3eeb42597a514a0b5286f085d91c8b34e4a532] https://lava.sirena.=
org.uk/scheduler/job/1981886
# test job: [1f95871207db4439a3116e9a86f5b5658a5157c4] https://lava.sirena.=
org.uk/scheduler/job/1979930
# test job: [7b8373c80ac322403f18ff6578e346d3c149197c] https://lava.sirena.=
org.uk/scheduler/job/2064986
# test job: [4bcd18bbf51ce84924a2c6a126eda65f5b27d25b] https://lava.sirena.=
org.uk/scheduler/job/1979370
# test job: [653ce3a3f683673cb3f8904e08bffc144dd0e972] https://lava.sirena.=
org.uk/scheduler/job/1979351
# test job: [59fedf46f782c024b74ceab7868e13f0e0f10c45] https://lava.sirena.=
org.uk/scheduler/job/1979192
# test job: [cc7e1a9b596c9d9dc3324c056cf8162e9fca2765] https://lava.sirena.=
org.uk/scheduler/job/1981478
# test job: [683bb2424cd5be17cca02067b038e9da5aa68dc6] https://lava.sirena.=
org.uk/scheduler/job/1979756
# test job: [4076125074ea41c581e4659cf2e1217a12f9b0ee] https://lava.sirena.=
org.uk/scheduler/job/1979492
# test job: [6684aba0780da9f505c202f27e68ee6d18c0aa66] https://lava.sirena.=
org.uk/scheduler/job/1738725
# test job: [be2ba2fef1676861b295053c2a567b057e9031b9] https://lava.sirena.=
org.uk/scheduler/job/1738886
# test job: [447c98c1ca4a4b0d43be99f76c558c09956484f3] https://lava.sirena.=
org.uk/scheduler/job/1647268
# test job: [407b9076c147669318a58bbd54185b03055dc9a6] https://lava.sirena.=
org.uk/scheduler/job/2061342
# test job: [6c177775dcc5e70a64ddf4ee842c66af498f2c7c] https://lava.sirena.=
org.uk/scheduler/job/1774050
# test job: [8e5d9f916a9678e2dcbed2289b87efd453e4e052] https://lava.sirena.=
org.uk/scheduler/job/1980284
# test job: [6dde339a3df80a57ac3d780d8cfc14d9262e2acd] https://lava.sirena.=
org.uk/scheduler/job/1647205
# test job: [0f2995693867bfb26197b117cd55624ddc57582f] https://lava.sirena.=
org.uk/scheduler/job/2085448
# bad: [0f2995693867bfb26197b117cd55624ddc57582f] Add linux-next specific f=
iles for 20251114
git bisect bad 0f2995693867bfb26197b117cd55624ddc57582f
# test job: [a1cf23e6c2c8a4733ffc7e1fddb961583d0a4a23] https://lava.sirena.=
org.uk/scheduler/job/2085567
# good: [a1cf23e6c2c8a4733ffc7e1fddb961583d0a4a23] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
git bisect good a1cf23e6c2c8a4733ffc7e1fddb961583d0a4a23
# test job: [591b51e7a4b21fc213bb1049d16bb8bdb235fcb6] https://lava.sirena.=
org.uk/scheduler/job/2085841
# good: [591b51e7a4b21fc213bb1049d16bb8bdb235fcb6] Merge branch 'for-linux-=
next' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect good 591b51e7a4b21fc213bb1049d16bb8bdb235fcb6
# test job: [ecc185cf2b220c3a5ba510b7af6f026e7e33ed26] https://lava.sirena.=
org.uk/scheduler/job/2085933
# bad: [ecc185cf2b220c3a5ba510b7af6f026e7e33ed26] Merge branch 'master' of =
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
git bisect bad ecc185cf2b220c3a5ba510b7af6f026e7e33ed26
# test job: [d97b26367e4f472e1965278dc4e19bc02ad6ca9c] https://lava.sirena.=
org.uk/scheduler/job/2086009
# good: [d97b26367e4f472e1965278dc4e19bc02ad6ca9c] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git
git bisect good d97b26367e4f472e1965278dc4e19bc02ad6ca9c
# test job: [37d697d359d5fd342cdf7eed9d891be9cbb320d6] https://lava.sirena.=
org.uk/scheduler/job/2086168
# bad: [37d697d359d5fd342cdf7eed9d891be9cbb320d6] Merge branch 'next' of ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
git bisect bad 37d697d359d5fd342cdf7eed9d891be9cbb320d6
# test job: [362454de12e9aad0b41c8989e7b9c0b39858757d] https://lava.sirena.=
org.uk/scheduler/job/2086037
# bad: [362454de12e9aad0b41c8989e7b9c0b39858757d] Merge branch 'for-next' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
git bisect bad 362454de12e9aad0b41c8989e7b9c0b39858757d
# test job: [c72431af0034acd67ff07cef5ccb757bf0b288f0] https://lava.sirena.=
org.uk/scheduler/job/2086226
# good: [c72431af0034acd67ff07cef5ccb757bf0b288f0] Merge branch 'next' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
git bisect good c72431af0034acd67ff07cef5ccb757bf0b288f0
# test job: [3d4f6898bf70e927a1f8992ef8ddc3440338370b] https://lava.sirena.=
org.uk/scheduler/job/2086279
# skip: [3d4f6898bf70e927a1f8992ef8ddc3440338370b] Merge branch 'for-mfd-ne=
xt' of https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
git bisect skip 3d4f6898bf70e927a1f8992ef8ddc3440338370b
# test job: [92ec7e7b86ec0aff9cd7db64d9dce50a0ea7c542] https://lava.sirena.=
org.uk/scheduler/job/2086312
# good: [92ec7e7b86ec0aff9cd7db64d9dce50a0ea7c542] power: supply: cw2015: C=
heck devm_delayed_work_autocancel() return code
git bisect good 92ec7e7b86ec0aff9cd7db64d9dce50a0ea7c542
# test job: [1810b210872ffc9985febca0880702a7102aad31] https://lava.sirena.=
org.uk/scheduler/job/2086374
# good: [1810b210872ffc9985febca0880702a7102aad31] mfd: bd718x7: Use regmap=
_reg_range() for pmic_status_range
git bisect good 1810b210872ffc9985febca0880702a7102aad31
# test job: [1cda37798599692cb553fdb4e93faa294e1a151b] https://lava.sirena.=
org.uk/scheduler/job/2086388
# good: [1cda37798599692cb553fdb4e93faa294e1a151b] Documentation: power: rt=
9756: Document exported sysfs entries
git bisect good 1cda37798599692cb553fdb4e93faa294e1a151b
# test job: [67d8eed26eadb1edd4873d24889be26aa9b73fe5] https://lava.sirena.=
org.uk/scheduler/job/2086421
# bad: [67d8eed26eadb1edd4873d24889be26aa9b73fe5] backlight: led-bl: Add de=
vlink to supplier LEDs
git bisect bad 67d8eed26eadb1edd4873d24889be26aa9b73fe5
# test job: [d95963e309bc1211e28051314e72638d98225614] https://lava.sirena.=
org.uk/scheduler/job/2086465
# good: [d95963e309bc1211e28051314e72638d98225614] backlight: ktd2801: Depe=
nd on GPIOLIB
git bisect good d95963e309bc1211e28051314e72638d98225614
# test job: [c596a53cb0c607ccff34aac30ada774aa28b7dc0] https://lava.sirena.=
org.uk/scheduler/job/2086528
# bad: [c596a53cb0c607ccff34aac30ada774aa28b7dc0] backlight: pwm_bl: Apply =
the initial backlight state with sane defaults
git bisect bad c596a53cb0c607ccff34aac30ada774aa28b7dc0
# first bad commit: [c596a53cb0c607ccff34aac30ada774aa28b7dc0] backlight: p=
wm_bl: Apply the initial backlight state with sane defaults

--G9Nw75ZHFmBZf+rF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkXODMACgkQJNaLcl1U
h9CGnwf+IQNMP+POTKxhNKkuQDrrzKCn+OqMtGVTqYXhHWjUhBg3BkB2x+QKeCiA
Af5CUKs6JPo8S4ORmVjzgEBdvYAdRFNQXo+SVlupik2pByMoHz2ojYvzK3f/r+ER
K5TGFaZ6yeAJ29tU9MGIdr7ceKMS0PFSrtUTHz/V6i4mB8N08QtwBDvTaKbFzz5R
mWbwKuFcXJ9WQj5TdAmB8MZq08wlAARyRvicZoZ/l2drmw5muHzUAEA5cEVSMLiZ
h4nhXzrL80+ta8OyYbSW27BayWRWFpc7jT6vWOQxVcQIOoyKIsRddklv77hNcw/F
KxmXJz4uGcWPf+Ec3f0xT/q6gomgaQ==
=Omel
-----END PGP SIGNATURE-----

--G9Nw75ZHFmBZf+rF--
