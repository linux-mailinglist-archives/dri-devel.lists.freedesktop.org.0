Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89464A49EF8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9290B10ECFA;
	Fri, 28 Feb 2025 16:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="crjVsU99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F1F10ECFA;
 Fri, 28 Feb 2025 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1740760611; x=1741365411; i=markus.elfring@web.de;
 bh=P3aAi1K30diMwcSyotdSLBi8iQUEl+hDB2tmHvN4WgM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
 Subject:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=crjVsU99nW/CZBMET6nlxo5P5Ve71G2x3ctFqiGmxnvi7FsxwgfQXyv5sn6OWVsb
 x4qIMcrgrPve+oNy2UrDX5r6tSg0n1lSWr+zn5uco0QIgDtF+27/LMp+dXSoSRyS2
 5CMin+pvn3H63SnHPS1vPtrLOaEIURSr+hsFC5kieFfAA0rPDZpeH+tb67yq+02AJ
 SLaehROwWbAceE2iVSDbnQ/l6015TwXCK9FmDiRiYd7eQsnK2PUIcHEMlfCfZN7uk
 5MQQwEL21T+XVl81aMuZRHZZK8OcXMkSw42rTjlB9PBChlON+Ylqkpj/KEjiVzmt6
 D946/tidGDGJjMRPYQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.27]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MSZHv-1th5Lf3hO5-00Hx7y; Fri, 28
 Feb 2025 17:36:50 +0100
Message-ID: <225be170-472d-40c1-95ed-71b452740ae7@web.de>
Date: Fri, 28 Feb 2025 17:36:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Qasim Ijaz <qasdev00@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/radeon: Simplify maximum determination in
 radeon_uvd_calc_upll_dividers()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pQnRLfx8v4G9J+knpTzjK8SoUNS8MlolvSv3lkROWsw5FtuoZvC
 jejqbXK5eiAEUA/Wy3nz448SRf7fWzTID2DWCqDZk4gpGPTOppr9sNw80VIGYfnyk/hBve/
 MNEtXyvm5MDb4NTUi0brMno2VkKUjZLkPkSn3SG1mbtIUZ6Zc5zQUgAJJVWUt6893KWyP0h
 fhxSENApa2wuLnjbLweRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IoqzqYMsVKE=;8IMPCWVo7UO+jbp8zxoV4K9CIxH
 WUT5+Lqmgwmg9nmcLw7B62FBoZSApUZoLbTAR08MqOnYrR8NIPjp9H3hVMDqGbXcF1aZWmfh4
 9DJRGCpInmZXDQmzmF0QLWtBhjeD7nZcwTabq/nthTdMszLW7jtGpixi9g+/UIradL1uPk+Un
 8CKHNaCau95MOeD2QdI31+1Xu4OopBONfv5QhYKzH4qRYuBxuIAdhKzAtrRmgS6uVIatXLvy1
 zFN0nJHP/Xf8ouS4JzlVspTzNCQjen8K7495sn52gU4Q8xdZ+35q+Qk8/8tFxvW0hB849yGHs
 nPyZd0yxVJl9X3u9gdxtXibEeVrth5sUHVCRspdBF9JVAwuafg+Tjm0/6afVMYgvZx3ifCir1
 i11NcSYwA1Do044NNc0slPpIenXy9SOClbe+MzyyhZhRJRURrsXs+cPbzilwO6g1z0y2mFroS
 g8RTkPjpNf0+bjVyjtZPNNrMzRQmdmxGtL4LAeMRGksCAW6z1DlglCcGLGGSrXC84QabDukpQ
 vLcbn/izySG8Em5eBzNFfD5eRctBnH5fjY0Rq1BJHpSO9kv9hUr2o/tvTR94rXGsC0qpdA0y0
 IXNMY7vDiW3TCoOFiSAaQiXVagS3lEyW9af+Vm5LtntRizcm/Bi0/r0U3yomEQpOrHTP1N82V
 Dwzdht/SZUWDz85cvDj9AbGj9UZAnMkuD0SPaJY4KlreyIqDM4Dgjd8g7OAKKNZ3Vex3oMpM5
 OTunsUnTg4uj7+QG5wlcPmn3AZQ4Ui5dpMWdUdCO9NYHoSi9+VCL60J4VoCqGWdP1/dV+H771
 a7+wyQSedToNCdNfc3/VuWxVdqcXEvxMKmvD3Y50JONzJyV7cdnZ3R4swNo4qA2bp/MMdixZC
 1xz2af6rOp4rtK/wUT5mfbk2Re1wpccXrZXl42RPI+T+S8o01DuUcZ4sqOfc2cwB8xQlzL2Fd
 +OxUKL0u1lap4P71NQ9Ff2MnMgLtCoT408b4/7nTl8KF0evcN3GZsn5T/N7WL9Dg8dvrUj7va
 vBEivYCkNtF23WB2PttWtQZMS0LwiDZ4DyyWdpGsGPg1tNRsvPBxoAb5L4zFJ93IQ2PcYMdsq
 rXrKccO9wGsLZI47/FUf0ClRHNfUpVJO5yRJ/G26YdvBXb2Dxg9aFnGA6bOrEOdN1VRWlfa/6
 QXg87qVTASNpsvb1iuSXUadOGUDMl0/rUumy6IWUTffs5ySH9FBAwMyx01meX2y2gcBQLE2GC
 LxpIO/8N5+ammdtWZLxtb1+xzFZ82eusr4uMbyOFatsQZbX//2IEWCJU/u85y4YCqrb/StABr
 NUGd5KblsU8y+nFupKcH72vo+HijS5+6PV5Mwc0lVH49vg2HHA006eDF7X0fxqqFkLG27+Y2a
 vnvANt8zRWDhTpU8NZO0aY2CyJCoS6Xhqg1r5qDMgmjS4bU0lzcdsPndYTV4ifzBIXZH2hY0b
 3x+GMY8rBnsiXlSRihqzpU2pUyUs=
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Feb 2025 17:32:45 +0100

Replace nested max() calls by single max3() call in this
function implementation.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/radeon/radeon_uvd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/=
radeon_uvd.c
index 058a1c8451b2..ded5747a58d1 100644
=2D-- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -961,7 +961,7 @@ int radeon_uvd_calc_upll_dividers(struct radeon_device=
 *rdev,
 	unsigned optimal_score =3D ~0;

 	/* loop through vco from low to high */
-	vco_min =3D max(max(vco_min, vclk), dclk);
+	vco_min =3D max3(vco_min, vclk, dclk);
 	for (vco_freq =3D vco_min; vco_freq <=3D vco_max; vco_freq +=3D 100) {

 		uint64_t fb_div =3D (uint64_t)vco_freq * fb_factor;
=2D-
2.48.1

