Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B81E47EAF86
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 12:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE6310E200;
	Tue, 14 Nov 2023 11:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 6.mo575.mail-out.ovh.net (6.mo575.mail-out.ovh.net
 [46.105.63.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8465810E200
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 11:53:26 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.20.113])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id D5C3A26E71
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 11:34:06 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-b2n22 (unknown [10.110.103.249])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C796C1FD91;
 Tue, 14 Nov 2023 11:34:03 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.106])
 by ghost-submission-6684bf9d7b-b2n22 with ESMTPSA
 id zqp4KytbU2UpiAAAZEbziQ
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 14 Nov 2023 11:34:03 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006f8a2c5f3-9a69-4238-9eb7-c409d0b8b06f,
 39B655737E19CE8DAD14488E69459E8CEBC9C448)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 83.100.46.156
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org
Subject: [PATCH] drm/amd/display: fix ptr comparison to 0
Date: Tue, 14 Nov 2023 13:33:56 +0200
Message-Id: <20231114113356.127779-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6570188909338076865
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudefvddgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeeftdelueetieetvdettdetueeivedujeefffdvteefkeelhefhleelfeetteejjeenucfkphepuddvjedrtddrtddruddpkeefrddutddtrdegiedrudehiedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
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
Cc: stylon.wang@amd.com, charlene.liu@amd.com, daniel.miess@amd.com,
 Qingqing.Zhuo@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 dri-devel@lists.freedesktop.org, yang.lee@linux.alibaba.com,
 colin.i.king@gmail.com, linux-kernel-mentees@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch will address the following coccinelle warning where a pointer
is compared to 0 instead of NULL.

drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c:5423:19-20: WARNING comparing pointer to 0

Fixes: 7966f319c66d9 ("drm/amd/display: Introduce DML2")
Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
 drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index 510be909cd75..7dceaa486841 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -5420,7 +5420,7 @@ static void CalculateOutputLink(
 					*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 13500, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
 												OutputFormat, DSCInputBitPerComponent, NumberOfDSCSlices, (dml_uint_t)AudioSampleRate, AudioSampleLayout, ODMModeNoDSC, ODMModeDSC, RequiredSlots);
 
-					if (OutBpp == 0 && PHYCLKD32PerState < 20000 / 32 && DSCEnable == dml_dsc_enable_if_necessary && ForcedOutputLinkBPP == 0) {
+					if (OutBpp == NULL && PHYCLKD32PerState < 20000 / 32 && DSCEnable == dml_dsc_enable_if_necessary && ForcedOutputLinkBPP == 0) {
 						*RequiresDSC = true;
 						LinkDSCEnable = true;
 						*OutBpp = TruncToValidBPP((1 - Downspreading / 100) * 13500, OutputLinkDPLanes, HTotal, HActive, PixelClockBackEnd, ForcedOutputLinkBPP, LinkDSCEnable, Output,
-- 
2.39.2

