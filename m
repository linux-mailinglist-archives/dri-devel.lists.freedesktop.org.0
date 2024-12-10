Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94929EC51D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF0D10E11A;
	Wed, 11 Dec 2024 06:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="LFTYlwJk";
	dkim=pass (2048-bit key; secure) header.d=sapience.com header.i=@sapience.com header.b="hbQlnC90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1837C10E2CF;
 Tue, 10 Dec 2024 15:40:54 +0000 (UTC)
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
 signature) header.d=sapience.com header.i=@sapience.com 
 header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
 header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by s1.sapience.com (Postfix) with ESMTPS id 24D39480A33;
 Tue, 10 Dec 2024 10:40:53 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1733845252;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=viGzOwcqwCLVwVxfAG1ol+YDmxSbec8Tk3SBFWFyYpk=;
 b=LFTYlwJk5MubDFS20GYYlvcmz2anq5djcHHL3+ZoQtKeXEG45UVD7wKR4ryFKqMDwd2FV
 A9xp9QYXprDidp2DA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1733845252; 
 cv=none;
 b=MKY8PRs2U9FDBok0/wh5enK2cwbcvNzLJMUUYKZFdtVVZMNmtPidOsrDCJGANMR1+y1yoyi/vYf6HoxBK4DObYU0Y5h264sW72K2rSms/iz26h875hRSTPENC0Dy8xu/fHvG4aCajcGqecaA2VXqyIgXImBM/KWjBaTZ4J/r+mVwHAXqtv2EGor3dYJxy+6NMfmOhGa/eW+3yW4OJLnyd/oPSpzM3f1YWpEUJzLPVEl3ZT6Iw5siyCvkFYlqU1VHDFSKbppQYaDjfz5UGnv+UPUFYnIJ24VjvTvqbeGVcdlATLBF1khu/GyVQAQcKRHlAF9DziYRoHBpocd2wUQAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
 t=1733845252; c=relaxed/simple;
 bh=xx9OGlyMWA+ZCfEDE/zVSR0WiOZyRnK7g97Awiaf61c=;
 h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
 MIME-Version;
 b=or5aALtWSbfta0tfHYn3uO+ntBjh2NOpr587v75Cigw7sb195BNDXTz90/20IIVx1vFX62sakhKQTx8Q9B9Wa9zuOeWSK4IdgukQ+/epu8k8ZqlHyZSUEhCHrR3GlSAJcTuGCiC3CUSwUXWVWFAKtHE8oV75yAL2lZzkDe5fbb7ZWYqW+4qUz3McL7KwlUtPWcd0734hoH3y/q8Yw4+ON1IHHu/WHexf5Q9mHg3FjbOEFmIZMCG9ZaXT78QNjrpmIdz8Un6ycoHNPpRufLM102zFnkGvjkU4BkvoMzU55yKmgE2inPyN56/A3vCKKE6iaeNEbzzctN3LDz8UtPjhDQ==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1733845252;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=viGzOwcqwCLVwVxfAG1ol+YDmxSbec8Tk3SBFWFyYpk=;
 b=hbQlnC90J5pqePwvPC1ZEcTBKYn3/EcftD7z65n+lsikCxvEGhHtlRQVw+1loKiAQagRU
 82B/n2q3s5sTiUTmhEWpV+iUv+Y28gMSX/wQ9nnYjntFIfAHk617JG2e0eQtUTqJoDsqbFI
 TJ08/10/BpcwMCjMtsoPcs3P0V46hdEu7B6z75nIz8Liy4cZpQoHWu1bPLmtkbNdXzBDcC7
 fRt+QNT6H5NqGwiGsmUSe7NLQkQIauWjBwQDdQ7aYqaQefFDDjVJ65j5T8g4jzvM+/a5Pbp
 MUtOp2/TMjIoNKqMuh2JwiF0QVFEaFHXPzSs4Ewqce4E2DB/LK53kznGSlmg==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (No client certificate requested)
 by srv8.sapience.com (Postfix) with ESMTPS id D57BA280015;
 Tue, 10 Dec 2024 10:40:52 -0500 (EST)
Message-ID: <c7c1d564ed3d6612c132f0e5e9f45a18306877e0.camel@sapience.com>
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
From: Genes Lists <lists@sapience.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jani Nikula
 <jani.nikula@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-kernel@vger.kernel.org, 	akpm@linux-foundation.org,
 torvalds@linux-foundation.org, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, bingbu.cao@intel.com, Rodrigo Vivi	
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Tue, 10 Dec 2024 10:40:52 -0500
In-Reply-To: <2024121001-senator-raffle-a371@gregkh>
References: <2024120917-vision-outcast-85f2@gregkh>
 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
 <Z1fqitbWlmELb5pj@kekkonen.localdomain> <87seqvzzg6.fsf@intel.com>
 <c1805642a6c5da6fef3927c70358c8cb851d2784.camel@sapience.com>
 <87bjxjzpwn.fsf@intel.com> <2024121001-senator-raffle-a371@gregkh>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
 protocol="application/pgp-signature"; boundary="=-Xc8d1025CSmc9deeZWxz"
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Dec 2024 06:58:14 +0000
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


--=-Xc8d1025CSmc9deeZWxz
Content-Type: multipart/alternative; boundary="=-ATW+YCb9hWsFseu7CJ2a"

--=-ATW+YCb9hWsFseu7CJ2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-12-10 at 13:37 +0100, Greg Kroah-Hartman wrote:
> > t's a clue nonetheless.
>=20
> 'git bisect' would be nice to run if possible...

Done:

a) One (hopefully) small caveat :
the very first bisect hit the 6.12.2 bug of missing commit b23decf8ac91
("sched: Initialize idle tasks only once").
I applied the commit and continued.

b) Result :

6ac269abab9ca5ae910deb2d3ca54351c3467e99 is the first bad commit
commit 6ac269abab9ca5ae910deb2d3ca54351c3467e99 (HEAD)
Author: Bingbu Cao <bingbu.cao@intel.com>
Date: Wed Oct 16 15:53:01 2024 +0800

media: ipu6: not override the dma_ops of device in driver

[ Upstream commit daabc5c64703432c4a8798421a3588c2c142c51b ]

DMA ops are a helper for architectures and not for drivers to override
the
DMA implementation. Driver should not override the DMA implementation.

This patch removes the dma_ops override from auxiliary device and adds
driver-internal helpers that use the actual DMA mapping APIs.

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and
MMU table")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
[Sakari Ailus: Fix the commit message a little.]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>

drivers/media/pci/intel/ipu6/ipu6-bus.c | 6 --
drivers/media/pci/intel/ipu6/ipu6-buttress.c | 21 +++++--
drivers/media/pci/intel/ipu6/ipu6-cpd.c | 18 +++---
drivers/media/pci/intel/ipu6/ipu6-dma.c | 195
+++++++++++++++++++++++++++++---------------------------------
drivers/media/pci/intel/ipu6/ipu6-dma.h | 34 ++++++++++-
drivers/media/pci/intel/ipu6/ipu6-fw-com.c | 14 ++---
6 files changed, 156 insertions(+), 132 deletions(-)

c) git bisect log

git bisect start
# status: waiting for both good and bad commits
# good: [d390303b28dabbb91b2d32016a4f72da478733b9] Linux 6.12.1
git bisect good d390303b28dabbb91b2d32016a4f72da478733b9
# status: waiting for bad commit, 1 good commit known
# bad: [61baee2dc5341c936e7fa7b1ca33c5607868de69] Linux 6.12.4
git bisect bad 61baee2dc5341c936e7fa7b1ca33c5607868de69
# bad: [2bc07714dc955a91d2923a440ea02c3cb3376b10] virtiofs: use pages
instead of pointer for kernel direct IO
git bisect bad 2bc07714dc955a91d2923a440ea02c3cb3376b10
# bad: [6f2648838ce1a9f2c432e84e38dec5d38412a551] wifi: wilc1000: Set
MAC after operation mode
git bisect bad 6f2648838ce1a9f2c432e84e38dec5d38412a551
# good: [e20117a105d4174c2daf4d6da17b92d757487e60] media: i2c:
max96717: clean up on error in max96717_subdev_init()
git bisect good e20117a105d4174c2daf4d6da17b92d757487e60
# bad: [74f21be9990a42dc2357bcf87a13e16c6998b90e] drm/vc4: hdmi: Avoid
hang with debug registers when suspended
git bisect bad 74f21be9990a42dc2357bcf87a13e16c6998b90e
# good: [dfdd0e8ff65dfc4183b622c3ffd8d8c5d572ca34] dt-bindings: cache:
qcom,llcc: Fix X1E80100 reg entries
git bisect good dfdd0e8ff65dfc4183b622c3ffd8d8c5d572ca34
# good: [b0cd515202cb31c89d7de46b103a7ff2de9de02b] media: ipu6: Fix DMA
and physical address debugging messages for 32-bit
git bisect good b0cd515202cb31c89d7de46b103a7ff2de9de02b
# bad: [3d48d0fbaaa74a04fb9092780a3f83dc4f3f8160] HID: hyperv:
streamline driver probe to avoid devres issues
git bisect bad 3d48d0fbaaa74a04fb9092780a3f83dc4f3f8160
# bad: [e3692460675bfe07f677711ead09a7a43934aa2f] pwm: Assume a
disabled PWM to emit a constant inactive output
git bisect bad e3692460675bfe07f677711ead09a7a43934aa2f
# bad: [11b0543efe54357b94dccb88dac2099c59358cd4] media: ipu6: remove
architecture DMA ops dependency in Kconfig
git bisect bad 11b0543efe54357b94dccb88dac2099c59358cd4
# bad: [6ac269abab9ca5ae910deb2d3ca54351c3467e99] media: ipu6: not
override the dma_ops of device in driver
git bisect bad 6ac269abab9ca5ae910deb2d3ca54351c3467e99
# first bad commit: [6ac269abab9ca5ae910deb2d3ca54351c3467e99] media:
ipu6: not override the dma_ops of device in driver




--=20
Gene


--=-ATW+YCb9hWsFseu7CJ2a
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Tue, 2024-12-10 at 13:37 +0100, Greg Kroah-Har=
tman wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bord=
er-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div=
>t's a clue nonetheless.<br></div></blockquote><div><br></div><div>'git bis=
ect' would be nice to run if possible...<br></div></blockquote><div><br></d=
iv><div>Done:</div><div><br></div><div>a) One (hopefully) small caveat :</d=
iv><div>  the very first bisect hit the 6.12.2 bug of missing commit b23dec=
f8ac91</div><div>  ("sched: Initialize idle tasks only once").</div><div>  =
I applied the commit and continued.</div><div><br></div><div>b) Result :</d=
iv><div><br></div><div>6ac269abab9ca5ae910deb2d3ca54351c3467e99 is the firs=
t bad commit</div><div>commit 6ac269abab9ca5ae910deb2d3ca54351c3467e99 (HEA=
D)</div><div>Author: Bingbu Cao &lt;<a href=3D"mailto:bingbu.cao@intel.com"=
>bingbu.cao@intel.com</a>&gt;</div><div>Date:   Wed Oct 16 15:53:01 2024 +0=
800</div><div><br></div><div>    media: ipu6: not override the dma_ops of d=
evice in driver</div><div><br></div><div>    [ Upstream commit daabc5c64703=
432c4a8798421a3588c2c142c51b ]</div><div><br></div><div>    DMA ops are a h=
elper for architectures and not for drivers to override the</div><div>    D=
MA implementation. Driver should not override the DMA implementation.</div>=
<div><br></div><div>    This patch removes the dma_ops override from auxili=
ary device and adds</div><div>    driver-internal helpers that use the actu=
al DMA mapping APIs.</div><div><br></div><div>    Fixes: 9163d83573e4 ("med=
ia: intel/ipu6: add IPU6 DMA mapping API and MMU table")</div><div>    Sign=
ed-off-by: Bingbu Cao &lt;<a href=3D"mailto:bingbu.cao@intel.com">bingbu.ca=
o@intel.com</a>&gt;</div><div>    Reviewed-by: Christoph Hellwig &lt;<a hre=
f=3D"mailto:hch@lst.de">hch@lst.de</a>&gt;</div><div>    [Sakari Ailus: Fix=
 the commit message a little.]</div><div>    Signed-off-by: Sakari Ailus &l=
t;<a href=3D"mailto:sakari.ailus@linux.intel.com">sakari.ailus@linux.intel.=
com</a>&gt;</div><div>    Signed-off-by: Hans Verkuil &lt;<a href=3D"mailto=
:hverkuil@xs4all.nl">hverkuil@xs4all.nl</a>&gt;</div><div>    Signed-off-by=
: Sasha Levin &lt;<a href=3D"mailto:sashal@kernel.org">sashal@kernel.org</a=
>&gt;</div><div><br></div><div> drivers/media/pci/intel/ipu6/ipu6-bus.c    =
  |   6 --</div><div> drivers/media/pci/intel/ipu6/ipu6-buttress.c |  21 ++=
+++--</div><div> drivers/media/pci/intel/ipu6/ipu6-cpd.c      |  18 +++---<=
/div><div> drivers/media/pci/intel/ipu6/ipu6-dma.c      | 195 +++++++++++++=
++++++++++++++++---------------------------------</div><div> drivers/media/=
pci/intel/ipu6/ipu6-dma.h      |  34 ++++++++++-</div><div> drivers/media/p=
ci/intel/ipu6/ipu6-fw-com.c   |  14 ++---</div><div> 6 files changed, 156 i=
nsertions(+), 132 deletions(-)</div><div><br></div><div>c) git bisect log</=
div><div><br></div><div>git bisect start</div><div># status: waiting for bo=
th good and bad commits</div><div># good: [d390303b28dabbb91b2d32016a4f72da=
478733b9] Linux 6.12.1</div><div>git bisect good d390303b28dabbb91b2d32016a=
4f72da478733b9</div><div># status: waiting for bad commit, 1 good commit kn=
own</div><div># bad: [61baee2dc5341c936e7fa7b1ca33c5607868de69] Linux 6.12.=
4</div><div>git bisect bad 61baee2dc5341c936e7fa7b1ca33c5607868de69</div><d=
iv># bad: [2bc07714dc955a91d2923a440ea02c3cb3376b10] virtiofs: use pages in=
stead of pointer for kernel direct IO</div><div>git bisect bad 2bc07714dc95=
5a91d2923a440ea02c3cb3376b10</div><div># bad: [6f2648838ce1a9f2c432e84e38de=
c5d38412a551] wifi: wilc1000: Set MAC after operation mode</div><div>git bi=
sect bad 6f2648838ce1a9f2c432e84e38dec5d38412a551</div><div># good: [e20117=
a105d4174c2daf4d6da17b92d757487e60] media: i2c: max96717: clean up on error=
 in max96717_subdev_init()</div><div>git bisect good e20117a105d4174c2daf4d=
6da17b92d757487e60</div><div># bad: [74f21be9990a42dc2357bcf87a13e16c6998b9=
0e] drm/vc4: hdmi: Avoid hang with debug registers when suspended</div><div=
>git bisect bad 74f21be9990a42dc2357bcf87a13e16c6998b90e</div><div># good: =
[dfdd0e8ff65dfc4183b622c3ffd8d8c5d572ca34] dt-bindings: cache: qcom,llcc: F=
ix X1E80100 reg entries</div><div>git bisect good dfdd0e8ff65dfc4183b622c3f=
fd8d8c5d572ca34</div><div># good: [b0cd515202cb31c89d7de46b103a7ff2de9de02b=
] media: ipu6: Fix DMA and physical address debugging messages for 32-bit</=
div><div>git bisect good b0cd515202cb31c89d7de46b103a7ff2de9de02b</div><div=
># bad: [3d48d0fbaaa74a04fb9092780a3f83dc4f3f8160] HID: hyperv: streamline =
driver probe to avoid devres issues</div><div>git bisect bad 3d48d0fbaaa74a=
04fb9092780a3f83dc4f3f8160</div><div># bad: [e3692460675bfe07f677711ead09a7=
a43934aa2f] pwm: Assume a disabled PWM to emit a constant inactive output</=
div><div>git bisect bad e3692460675bfe07f677711ead09a7a43934aa2f</div><div>=
# bad: [11b0543efe54357b94dccb88dac2099c59358cd4] media: ipu6: remove archi=
tecture DMA ops dependency in Kconfig</div><div>git bisect bad 11b0543efe54=
357b94dccb88dac2099c59358cd4</div><div># bad: [6ac269abab9ca5ae910deb2d3ca5=
4351c3467e99] media: ipu6: not override the dma_ops of device in driver</di=
v><div>git bisect bad 6ac269abab9ca5ae910deb2d3ca54351c3467e99</div><div># =
first bad commit: [6ac269abab9ca5ae910deb2d3ca54351c3467e99] media: ipu6: n=
ot override the dma_ops of device in driver</div><div><br></div><div><br></=
div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #=
729fcf solid;padding-left:1ex"></blockquote><div><br></div><div><span><pre>=
-- <br></pre><div><span style=3D"background-color: inherit;">Gene</span></d=
iv><div><br></div></span></div></body></html>

--=-ATW+YCb9hWsFseu7CJ2a--

--=-Xc8d1025CSmc9deeZWxz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ1hhBAAKCRA5BdB0L6Ze
20+rAP97KbKEdNUT4x2dEC2CJCla1VPNBrE7XB17L954YKeHFQEA+apfQps2aZhO
ydg+2W3peknkjwV0D4x6Hjvl13T0Fw4=
=AmRv
-----END PGP SIGNATURE-----

--=-Xc8d1025CSmc9deeZWxz--
