Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A3A6DDC65
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 15:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57DD10E318;
	Tue, 11 Apr 2023 13:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Tue, 11 Apr 2023 13:42:30 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EB110E2F5;
 Tue, 11 Apr 2023 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681220529; i=markus.elfring@web.de;
 bh=MdVoBfc/dINhWnEEIR/uciIViBWA6WiKvA2ZgQLTO6U=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=LJvC47Keh162g60XJxLk25jMiGsplj3uqBrXyV0WKxPlF5qGl+XdM7ARKYR5L71JE
 1b9sMiQ65irha7oV82FWxVd4SzME7q8Whi317lDv4PnsOw1kXFpGuEW4nErDoDKXwh
 srg2XlbsAsWku69qqHL86adLV4o4uCHza6M8I5TdHSA812He42XG5StoVU8k/9s3hl
 Czk1Swjq4qpPdFy1emDuRxtwyt5sLqD2W3ID4nex/yAb4gvSSaHzxvLU6UPzyScouf
 fC28gyJvIjIpvem0ns93BHSZbbX0py8Nn5TECeaFfKbqUtsryNqEB4kp+smxkEyNS0
 SdPkXCb0MBGSA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MidHP-1qGMD93cff-00fjHF; Tue, 11
 Apr 2023 15:42:09 +0200
Message-ID: <0d4b92ab-f7c2-4f18-f3c3-c0f82ba47fc8@web.de>
Date: Tue, 11 Apr 2023 15:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 1/5] drm/amdgpu: Move a variable assignment behind a null
 pointer check in amdgpu_ras_interrupt_dispatch()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alan Liu <HaoPing.Liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Candice Li <candice.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Tom Rix <trix@redhat.com>, Victor Zhao <Victor.Zhao@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Zhan Liu <zhan.liu@amd.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
In-Reply-To: <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:25febEqWetoQFrH/VBrwzBfTZugoK4sRWe5E4/QkInoeM7mmYZD
 TAwrXHKHDI9pkIADa8o8P5ZXEeWc53/5VA2ElTgbNWnpDUpzd8KvpK80DhfwPvGN6e/Ecpa
 L9+Oy8j2pqZgtAhQTdDKZu2mzIKAq5DryqasE9YtyWkeT+b93vSX8KPc6BszT3hKXYoZxt3
 YG8zPMqts/i/f6BWFEEog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rk04CgmiAgM=;BjHW4/lmZCg4/XhetZVbD0uiU/7
 6xo7boTMuwYxpNVQsDmg37k+mhVfwgK5T6tbTthJjc0R7/TjZokWwAWgzkefPt3epO9/9BFOz
 pq6Toe1LfbPOPTR9QwrFxd7tRD+hBXGelxeor5euggerPKgvKDOZIBEGgN/ZsnNRVvnN6LxpM
 GCvhcL6GPK+D/uNk7iv+5wMnPH1IflQ+A3xOz15LXHDSAC7uQ/isKCWKST1PvUnkptJSrzw7u
 jgZxR3QI2WA58N4n/5HSx7zdm3lF5f8/5Zwg5BL+PW8b98YV0PrnNoTAp441+7ML71OpHpMOR
 lnaUfJx+yl0S70j42GgynhWHDdDtkut9hqIRZMa0oXvKQFN0mIc0xs6ZSY3Gg1LwiZ7WZPrvm
 LAIGAk89jrFoT6UdclsdWvyBgCdAdJX9f7uZQaABpBAROIiGBdtLcBx3SVtMwtm7wDStJSO4O
 BdkDzyZv3GgsCH3+73vMXdZW3nkrcfkC6dL9ptxhozWkd5NB6JR9X4CmOILZHMuP3UHzqoe2b
 +pcCtRRz5/g6lUxZ//771PTzwsKgYdzMs8tZG1Zmi97T9BfjeJzYMepSU21RFXrmXC+VZUpD7
 MJooViMRuqTey1bP3pfiM6KcMcR9HEx7Wz9IGQyCN5J3rG50x4/+68j7rtPepA04tNUdW9Pi3
 nuzTspL78ixzLw785rGRZ6TvI3Neu8IqHNPznd3h43PSjN6EcN6kxkUKivkYvEOCfjvr+Nby8
 QMyPvW1rypdAYWpla7LvgjIbatJJwbm73kwgrB6LtPB7qTZ752KgSTWM3jnb6abcl3VwatFsu
 b/C5xu/WxV6e7ectsHQj2L/ZU7i92GUREA0WKGNCBB6DFdX8U9kaLRspS4rmDfME6lKPGHvgO
 PpOl9b+2/01y1F71kTEcQDT5NcZ4755N8bC96sTBRKI/EWyg7aza/YCEk
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Tue, 11 Apr 2023 10:52:48 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Camdgpu_ras_interrupt_dispatch=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cdata=E2=80=9D behind the null pointer check.

This issue was detected by using the Coccinelle software.

Fixes: c030f2e4166c3f5597c7e7a70bcd9ab383695de4 ("drm/amdgpu: add amdgpu_r=
as.c to support ras (v2)")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ras.c
index 4069bce9479f..a920c7888d07 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1730,11 +1730,12 @@ int amdgpu_ras_interrupt_dispatch(struct amdgpu_de=
vice *adev,
 		struct ras_dispatch_if *info)
 {
 	struct ras_manager *obj =3D amdgpu_ras_find_obj(adev, &info->head);
-	struct ras_ih_data *data =3D &obj->ih_data;
+	struct ras_ih_data *data;

 	if (!obj)
 		return -EINVAL;

+	data =3D &obj->ih_data;
 	if (data->inuse =3D=3D 0)
 		return 0;

=2D-
2.40.0

