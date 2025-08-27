Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB839B38083
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD0D10E7A5;
	Wed, 27 Aug 2025 11:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tq/v59Bq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEB110E7A5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 11:07:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3040460267;
 Wed, 27 Aug 2025 11:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059DFC4CEEB;
 Wed, 27 Aug 2025 11:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756292829;
 bh=5vc03eMdvfqUUzzsPyybym0chBJOvTR9mHKfK8sn/Mk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tq/v59Bqjlgc3M5JdTW7wXZ6GBEBRNFnB9DeN40LVuy7vzlGFa6VwSJzi7GzG4Uo6
 AHv6Lt64WZzcE0XJzrxvWOL1/bdOn9Xj9sTBigEwFiVBQGINm9/76qUzvzcz82m6CF
 +Wh5y7YbUBIua8/enihnhUPiRZh5hZSm9HnAzw0VLgdqtDfAJHO2z/0GUzunJIYq+H
 F8GPfWtAJq5qJJ74sAHnu88HWVT3FjiAgEekN+29kE0hjW0ZB7UyH845zU9sWlCT1Z
 aBliCueagNgS2kBCWlhcJ7QECiBtF1ecrGNliGv7Qz3Az32eF/M6nY+XVUSO1KlT9F
 +QNFCH5m5IePw==
Date: Wed, 27 Aug 2025 12:07:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/9] drm/sysfb: Blit to CRTC destination format
Message-ID: <f9ad2978-7bd7-48af-bdcc-2eed85f0b8b6@sirena.org.uk>
References: <20250714151513.309475-1-tzimmermann@suse.de>
 <20250714151513.309475-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zvruAmYNhudLNGt/"
Content-Disposition: inline
In-Reply-To: <20250714151513.309475-5-tzimmermann@suse.de>
X-Cookie: <<<<< EVACUATION ROUTE <<<<<
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


--zvruAmYNhudLNGt/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 05:13:04PM +0200, Thomas Zimmermann wrote:
> Use the color format stored in struct drm_sysfb_crtc_state for
> color-format conversion instead of the scanout-buffer format
> announced by firmware. Currently, both values are identical.

This patch, which is in -next as
061963cd9e5b60672695e9a592be440469a6bf72, breaks boot on the original
Raspberry Pi.  We get an oops after initialising the console:

[    4.057189] Console: switching to colour dummy device 80x30
[    4.057903] 8<--- cut here ---
[    4.057990] Unable to handle kernel NULL pointer dereference at virtual =
address 00000048 when read

=2E..

[    4.423159] Call trace:=20
[    4.423196]  drm_sysfb_plane_helper_atomic_disable from drm_atomic_helpe=
r_commit_planes+0x188/0x274
[    4.434958]  drm_atomic_helper_commit_planes from drm_atomic_helper_comm=
it_tail+0x30/0x68
[    4.443259]  drm_atomic_helper_commit_tail from commit_tail+0x144/0x154
[    4.449984]  commit_tail from drm_atomic_helper_commit+0xfc/0x10c
[    4.456183]  drm_atomic_helper_commit from drm_atomic_commit+0xc4/0xf4
[    4.462842]  drm_atomic_commit from drm_framebuffer_remove+0x220/0x4f0
[    4.469495]  drm_framebuffer_remove from drm_mode_rmfb_work_fn+0x70/0x78
[    4.476306]  drm_mode_rmfb_work_fn from process_scheduled_works+0x198/0x=
290
[    4.483378]  process_scheduled_works from worker_thread+0x16c/0x1f8

Full log:

   https://lava.sirena.org.uk/scheduler/job/1741780#L776

Bisect log, with links to additional logs:

# bad: [3c642997252eef4449cb6b6e02af3dc22515d817] Add linux-next specific f=
iles for 20250827
# good: [f51af24f910debef214edf108f7efad30874bc4f] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [a12b74d2bd4724ee1883bc97ec93eac8fafc8d3c] ASoC: tlv320aic32x4: use=
 dev_err_probe() for regulators
# good: [f840737d1746398c2993be34bfdc80bdc19ecae2] ASoC: SOF: imx: Remove t=
he use of dev_err_probe()
# good: [d78e48ebe04e9566f8ecbf51471e80da3adbceeb] ASoC: dt-bindings: Minor=
 whitespace cleanup in example
# good: [96bcb34df55f7fee99795127c796315950c94fed] ASoC: test-component: Us=
e kcalloc() instead of kzalloc()
# good: [c232495d28ca092d0c39b10e35d3d613bd2414ab] ASoC: dt-bindings: omap-=
twl4030: convert to DT schema
# good: [27848c082ba0b22850fd9fb7b185c015423dcdc7] spi: s3c64xx: Remove the=
 use of dev_err_probe()
# good: [ec0be3cdf40b5302248f3fb27a911cc630e8b855] regulator: consumer.rst:=
 document bulk operations
# good: [da9881d00153cc6d3917f6b74144b1d41b58338c] ASoC: qcom: audioreach: =
add support for SMECNS module
# good: [c1dd310f1d76b4b13f1854618087af2513140897] spi: SPISG: Use devm_kca=
lloc() in aml_spisg_clk_init()
# good: [2a55135201d5e24b80b7624880ff42eafd8e320c] ASoC: Intel: avs: Stream=
line register-component function names
# good: [550bc517e59347b3b1af7d290eac4fb1411a3d4e] regulator: bd718x7: Use =
kcalloc() instead of kzalloc()
# good: [0056b410355713556d8a10306f82e55b28d33ba8] spi: offload trigger: ad=
i-util-sigma-delta: clean up imports
# good: [cf65182247761f7993737b710afe8c781699356b] ASoC: codecs: wsa883x: H=
andle shared reset GPIO for WSA883x speakers
# good: [90179609efa421b1ccc7d8eafbc078bafb25777c] spi: spl022: use min_t()=
 to improve code
# good: [daf855f76a1210ceed9541f71ac5dd9be02018a6] ASoC: es8323: enable DAP=
M power widgets for playback DAC
# good: [48124569bbc6bfda1df3e9ee17b19d559f4b1aa3] spi: remove unneeded 'fa=
st_io' parameter in regmap_config
# good: [258384d8ce365dddd6c5c15204de8ccd53a7ab0a] ASoC: es8323: enable DAP=
M power widgets for playback DAC and output
# good: [6d068f1ae2a2f713d7f21a9a602e65b3d6b6fc6d] regulator: rt5133: Fix s=
pelling mistake "regualtor" -> "regulator"
# good: [a46e95c81e3a28926ab1904d9f754fef8318074d] ASoC: wl1273: Remove
# good: [0e62438e476494a1891a8822b9785bc6e73e9c3f] ASoC: Intel: sst: Remove=
 redundant semicolons
# good: [37533933bfe92cd5a99ef4743f31dac62ccc8de0] regulator: remove unneed=
ed 'fast_io' parameter in regmap_config
# good: [5c36b86d2bf68fbcad16169983ef7ee8c537db59] regmap: Remove superfluo=
us check for !config in __regmap_init()
# good: [714165e1c4b0d5b8c6d095fe07f65e6e7047aaeb] regulator: rt5133: Add R=
T5133 PMIC regulator Support
# good: [9c45f95222beecd6a284fd1284d54dd7a772cf59] spi: spi-qpic-snand: han=
dle 'use_ecc' parameter of qcom_spi_config_cw_read()
# good: [bab4ab484a6ca170847da9bffe86f1fa90df4bbe] ASoC: dt-bindings: Conve=
rt brcm,bcm2835-i2s to DT schema
# good: [b832b19318534bb4f1673b24d78037fee339c679] spi: loopback-test: Don'=
t use %pK through printk
# good: [8c02c8353460f8630313aef6810f34e134a3c1ee] ASoC: dt-bindings: realt=
ek,alc5623: convert to DT schema
# good: [6b7e2aa50bdaf88cd4c2a5e2059a7bf32d85a8b1] spi: spi-qpic-snand: rem=
ove 'clr*status' members of struct 'qpic_ecc'
# good: [2291a2186305faaf8525d57849d8ba12ad63f5e7] MAINTAINERS: Add entry f=
or FourSemi audio amplifiers
# good: [a54ef14188519a0994d0264f701f5771815fa11e] regulator: dt-bindings: =
Clean-up active-semi,act8945a duplication
# good: [cf25eb8eae91bcae9b2065d84b0c0ba0f6d9dd34] ASoC: soc-component: unp=
ack snd_soc_component_init_bias_level()
# good: [595b7f155b926460a00776cc581e4dcd01220006] ASoC: Intel: avs: Condit=
ional-path support
# good: [a1d0b0ae65ae3f32597edfbb547f16c75601cd87] spi: spi-qpic-snand: avo=
id double assignment in qcom_spi_probe()
# good: [3059067fd3378a5454e7928c08d20bf3ef186760] ASoC: cs48l32: Use PTR_E=
RR_OR_ZERO() to simplify code
# good: [9a200cbdb54349909a42b45379e792e4b39dd223] rust: regulator: impleme=
nt Send and Sync for Regulator<T>
# good: [2d86d2585ab929a143d1e6f8963da1499e33bf13] ASoC: pxa: add GPIOLIB_L=
EGACY dependency
# good: [886f42ce96e7ce80545704e7168a9c6b60cd6c03] regmap: mmio: Add missin=
g MODULE_DESCRIPTION()
# good: [162e23657e5379f07c6404dbfbf4367cb438ea7d] regulator: pf0900: Add P=
MIC PF0900 support
git bisect start '3c642997252eef4449cb6b6e02af3dc22515d817' 'f51af24f910deb=
ef214edf108f7efad30874bc4f' 'a12b74d2bd4724ee1883bc97ec93eac8fafc8d3c' 'f84=
0737d1746398c2993be34bfdc80bdc19ecae2' 'd78e48ebe04e9566f8ecbf51471e80da3ad=
bceeb' '96bcb34df55f7fee99795127c796315950c94fed' 'c232495d28ca092d0c39b10e=
35d3d613bd2414ab' '27848c082ba0b22850fd9fb7b185c015423dcdc7' 'ec0be3cdf40b5=
302248f3fb27a911cc630e8b855' 'da9881d00153cc6d3917f6b74144b1d41b58338c' 'c1=
dd310f1d76b4b13f1854618087af2513140897' '2a55135201d5e24b80b7624880ff42eafd=
8e320c' '550bc517e59347b3b1af7d290eac4fb1411a3d4e' '0056b410355713556d8a103=
06f82e55b28d33ba8' 'cf65182247761f7993737b710afe8c781699356b' '90179609efa4=
21b1ccc7d8eafbc078bafb25777c' 'daf855f76a1210ceed9541f71ac5dd9be02018a6' '4=
8124569bbc6bfda1df3e9ee17b19d559f4b1aa3' '258384d8ce365dddd6c5c15204de8ccd5=
3a7ab0a' '6d068f1ae2a2f713d7f21a9a602e65b3d6b6fc6d' 'a46e95c81e3a28926ab190=
4d9f754fef8318074d' '0e62438e476494a1891a8822b9785bc6e73e9c3f' '37533933bfe=
92cd5a99ef4743f31dac62ccc8de0' '5c36b86d2bf68fbcad16169983ef7ee8c537db59' '=
714165e1c4b0d5b8c6d095fe07f65e6e7047aaeb' '9c45f95222beecd6a284fd1284d54dd7=
a772cf59' 'bab4ab484a6ca170847da9bffe86f1fa90df4bbe' 'b832b19318534bb4f1673=
b24d78037fee339c679' '8c02c8353460f8630313aef6810f34e134a3c1ee' '6b7e2aa50b=
daf88cd4c2a5e2059a7bf32d85a8b1' '2291a2186305faaf8525d57849d8ba12ad63f5e7' =
'a54ef14188519a0994d0264f701f5771815fa11e' 'cf25eb8eae91bcae9b2065d84b0c0ba=
0f6d9dd34' '595b7f155b926460a00776cc581e4dcd01220006' 'a1d0b0ae65ae3f32597e=
dfbb547f16c75601cd87' '3059067fd3378a5454e7928c08d20bf3ef186760' '9a200cbdb=
54349909a42b45379e792e4b39dd223' '2d86d2585ab929a143d1e6f8963da1499e33bf13'=
 '886f42ce96e7ce80545704e7168a9c6b60cd6c03' '162e23657e5379f07c6404dbfbf436=
7cb438ea7d'
# test job: [a12b74d2bd4724ee1883bc97ec93eac8fafc8d3c] https://lava.sirena.=
org.uk/scheduler/job/1734135
# test job: [f840737d1746398c2993be34bfdc80bdc19ecae2] https://lava.sirena.=
org.uk/scheduler/job/1727230
# test job: [d78e48ebe04e9566f8ecbf51471e80da3adbceeb] https://lava.sirena.=
org.uk/scheduler/job/1706206
# test job: [96bcb34df55f7fee99795127c796315950c94fed] https://lava.sirena.=
org.uk/scheduler/job/1699727
# test job: [c232495d28ca092d0c39b10e35d3d613bd2414ab] https://lava.sirena.=
org.uk/scheduler/job/1699713
# test job: [27848c082ba0b22850fd9fb7b185c015423dcdc7] https://lava.sirena.=
org.uk/scheduler/job/1693185
# test job: [ec0be3cdf40b5302248f3fb27a911cc630e8b855] https://lava.sirena.=
org.uk/scheduler/job/1694260
# test job: [da9881d00153cc6d3917f6b74144b1d41b58338c] https://lava.sirena.=
org.uk/scheduler/job/1693330
# test job: [c1dd310f1d76b4b13f1854618087af2513140897] https://lava.sirena.=
org.uk/scheduler/job/1693130
# test job: [2a55135201d5e24b80b7624880ff42eafd8e320c] https://lava.sirena.=
org.uk/scheduler/job/1685827
# test job: [550bc517e59347b3b1af7d290eac4fb1411a3d4e] https://lava.sirena.=
org.uk/scheduler/job/1685690
# test job: [0056b410355713556d8a10306f82e55b28d33ba8] https://lava.sirena.=
org.uk/scheduler/job/1685834
# test job: [cf65182247761f7993737b710afe8c781699356b] https://lava.sirena.=
org.uk/scheduler/job/1687590
# test job: [90179609efa421b1ccc7d8eafbc078bafb25777c] https://lava.sirena.=
org.uk/scheduler/job/1685811
# test job: [daf855f76a1210ceed9541f71ac5dd9be02018a6] https://lava.sirena.=
org.uk/scheduler/job/1685552
# test job: [48124569bbc6bfda1df3e9ee17b19d559f4b1aa3] https://lava.sirena.=
org.uk/scheduler/job/1670240
# test job: [258384d8ce365dddd6c5c15204de8ccd53a7ab0a] https://lava.sirena.=
org.uk/scheduler/job/1673449
# test job: [6d068f1ae2a2f713d7f21a9a602e65b3d6b6fc6d] https://lava.sirena.=
org.uk/scheduler/job/1673208
# test job: [a46e95c81e3a28926ab1904d9f754fef8318074d] https://lava.sirena.=
org.uk/scheduler/job/1673819
# test job: [0e62438e476494a1891a8822b9785bc6e73e9c3f] https://lava.sirena.=
org.uk/scheduler/job/1669629
# test job: [37533933bfe92cd5a99ef4743f31dac62ccc8de0] https://lava.sirena.=
org.uk/scheduler/job/1669021
# test job: [5c36b86d2bf68fbcad16169983ef7ee8c537db59] https://lava.sirena.=
org.uk/scheduler/job/1667994
# test job: [714165e1c4b0d5b8c6d095fe07f65e6e7047aaeb] https://lava.sirena.=
org.uk/scheduler/job/1667749
# test job: [9c45f95222beecd6a284fd1284d54dd7a772cf59] https://lava.sirena.=
org.uk/scheduler/job/1667650
# test job: [bab4ab484a6ca170847da9bffe86f1fa90df4bbe] https://lava.sirena.=
org.uk/scheduler/job/1664754
# test job: [b832b19318534bb4f1673b24d78037fee339c679] https://lava.sirena.=
org.uk/scheduler/job/1659321
# test job: [8c02c8353460f8630313aef6810f34e134a3c1ee] https://lava.sirena.=
org.uk/scheduler/job/1659043
# test job: [6b7e2aa50bdaf88cd4c2a5e2059a7bf32d85a8b1] https://lava.sirena.=
org.uk/scheduler/job/1656611
# test job: [2291a2186305faaf8525d57849d8ba12ad63f5e7] https://lava.sirena.=
org.uk/scheduler/job/1655785
# test job: [a54ef14188519a0994d0264f701f5771815fa11e] https://lava.sirena.=
org.uk/scheduler/job/1656081
# test job: [cf25eb8eae91bcae9b2065d84b0c0ba0f6d9dd34] https://lava.sirena.=
org.uk/scheduler/job/1653063
# test job: [595b7f155b926460a00776cc581e4dcd01220006] https://lava.sirena.=
org.uk/scheduler/job/1653171
# test job: [a1d0b0ae65ae3f32597edfbb547f16c75601cd87] https://lava.sirena.=
org.uk/scheduler/job/1653632
# test job: [3059067fd3378a5454e7928c08d20bf3ef186760] https://lava.sirena.=
org.uk/scheduler/job/1653613
# test job: [9a200cbdb54349909a42b45379e792e4b39dd223] https://lava.sirena.=
org.uk/scheduler/job/1653627
# test job: [2d86d2585ab929a143d1e6f8963da1499e33bf13] https://lava.sirena.=
org.uk/scheduler/job/1653200
# test job: [886f42ce96e7ce80545704e7168a9c6b60cd6c03] https://lava.sirena.=
org.uk/scheduler/job/1653187
# test job: [162e23657e5379f07c6404dbfbf4367cb438ea7d] https://lava.sirena.=
org.uk/scheduler/job/1653604
# test job: [3c642997252eef4449cb6b6e02af3dc22515d817] https://lava.sirena.=
org.uk/scheduler/job/1741780
# bad: [3c642997252eef4449cb6b6e02af3dc22515d817] Add linux-next specific f=
iles for 20250827
git bisect bad 3c642997252eef4449cb6b6e02af3dc22515d817
# test job: [7902969a2e75fae35b04772a3e75a29737d463bd] https://lava.sirena.=
org.uk/scheduler/job/1741974
# good: [7902969a2e75fae35b04772a3e75a29737d463bd] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
git bisect good 7902969a2e75fae35b04772a3e75a29737d463bd
# test job: [c72c1b7d500f2e37ae06630ee20add5b68c7723c] https://lava.sirena.=
org.uk/scheduler/job/1742110
# bad: [c72c1b7d500f2e37ae06630ee20add5b68c7723c] Merge branch 'for-next' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
git bisect bad c72c1b7d500f2e37ae06630ee20add5b68c7723c
# test job: [9f26ae24e6a8435d88cfb8c01f7d02c348eb4868] https://lava.sirena.=
org.uk/scheduler/job/1742182
# good: [9f26ae24e6a8435d88cfb8c01f7d02c348eb4868] Merge branch 'drm-next' =
of https://gitlab.freedesktop.org/drm/kernel.git
git bisect good 9f26ae24e6a8435d88cfb8c01f7d02c348eb4868
# test job: [257ad6623adaf1685878a0d8724d5c40aa838e93] https://lava.sirena.=
org.uk/scheduler/job/1742260
# bad: [257ad6623adaf1685878a0d8724d5c40aa838e93] Merge branch 'drm-next' o=
f https://gitlab.freedesktop.org/agd5f/linux.git
git bisect bad 257ad6623adaf1685878a0d8724d5c40aa838e93
# test job: [615471b860d628f7e7d9ffdf4b92477493e0a31c] https://lava.sirena.=
org.uk/scheduler/job/1742299
# good: [615471b860d628f7e7d9ffdf4b92477493e0a31c] drm/amd/pm: Remove cache=
 logic from SMUv13.0.12
git bisect good 615471b860d628f7e7d9ffdf4b92477493e0a31c
# test job: [e3bd536580fe553d5768673660b1745ff1bb3b91] https://lava.sirena.=
org.uk/scheduler/job/1742396
# good: [e3bd536580fe553d5768673660b1745ff1bb3b91] drm/radeon: Use vmalloc_=
array and vcalloc to simplify code
git bisect good e3bd536580fe553d5768673660b1745ff1bb3b91
# test job: [9d3cc361252ee8ff60d7277a97950300e0340ec4] https://lava.sirena.=
org.uk/scheduler/job/1742517
# good: [9d3cc361252ee8ff60d7277a97950300e0340ec4] drm/amd/display: Conside=
r sink max slice width limitation for dsc
git bisect good 9d3cc361252ee8ff60d7277a97950300e0340ec4
# test job: [efe927b9702643a1d80472664c2642f0304cb608] https://lava.sirena.=
org.uk/scheduler/job/1742628
# good: [efe927b9702643a1d80472664c2642f0304cb608] drm/msm: fix msm_gem_vma=
_new() allocations for managed GPUVMs
git bisect good efe927b9702643a1d80472664c2642f0304cb608
# test job: [b3c7edd5e50e0e92ead8794b084e92d89002dd6f] https://lava.sirena.=
org.uk/scheduler/job/1742784
# bad: [b3c7edd5e50e0e92ead8794b084e92d89002dd6f] drm/format-helper: Add XR=
GB8888-to-RGB332 to drm_fb_blit()
git bisect bad b3c7edd5e50e0e92ead8794b084e92d89002dd6f
# test job: [d6d05e2af796ca25094f80a73d8841505d54368b] https://lava.sirena.=
org.uk/scheduler/job/1742821
# good: [d6d05e2af796ca25094f80a73d8841505d54368b] video: screen_info: Add =
pixel-format helper for linear framebuffers
git bisect good d6d05e2af796ca25094f80a73d8841505d54368b
# test job: [061963cd9e5b60672695e9a592be440469a6bf72] https://lava.sirena.=
org.uk/scheduler/job/1742968
# bad: [061963cd9e5b60672695e9a592be440469a6bf72] drm/sysfb: Blit to CRTC d=
estination format
git bisect bad 061963cd9e5b60672695e9a592be440469a6bf72
# test job: [31eea29d727ce35b747e68c6be350ca07b7ecd9b] https://lava.sirena.=
org.uk/scheduler/job/1743040
# good: [31eea29d727ce35b747e68c6be350ca07b7ecd9b] drm/sysfb: Find screen_i=
nfo format with helpers
git bisect good 31eea29d727ce35b747e68c6be350ca07b7ecd9b
# first bad commit: [061963cd9e5b60672695e9a592be440469a6bf72] drm/sysfb: B=
lit to CRTC destination format

--zvruAmYNhudLNGt/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiu5tkACgkQJNaLcl1U
h9CzTQf/Zf0zTVsSkW6QHNf90Lw5Xrg1yY+nryc15qSJCuIQp5ZEfuTiUWTQ2i7u
PzacbDE4OICApX6cAGpcNPM+8lxecjqddANXqnYCI/3dUlrCb8fvGUWcb9EGQ0I0
afpofmY8ZAMXvAuuDY/1H4jVfVnrf0F7v42rRK7gtyq9uC7egwzEz0MyUkutq5Wl
BfsVQUGFsgfVEkt+P2yqv4pM3RQ9Au3ANK3XZqWq60ZQe+qyjq+2EaLKoeXh93qw
uWN6LRJf5yjFWvTWajYMIk0pSwokUINlKXZaRKsArw8bDgmQJQcRpJ9IsL7e5FEI
No5+q8LfyNotx+FNLxjh3ZqvER9Q7A==
=TEoA
-----END PGP SIGNATURE-----

--zvruAmYNhudLNGt/--
