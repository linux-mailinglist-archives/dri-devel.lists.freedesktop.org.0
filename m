Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF37E5089
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 07:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF0210E04B;
	Wed,  8 Nov 2023 06:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net
 [46.105.56.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF06910E04B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 06:54:50 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.20.172])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 409752DDD6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 06:54:48 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-mcdch (unknown [10.110.208.112])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DDD3C1FDFD;
 Wed,  8 Nov 2023 06:54:45 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.105])
 by ghost-submission-6684bf9d7b-mcdch with ESMTPSA
 id 6yACMbUwS2WPBwsA+VWt7Q
 (envelope-from <jose.pekkarinen@foxhound.fi>); Wed, 08 Nov 2023 06:54:45 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0062025b92b-b4e0-4a0d-8579-cd97c65636dc,
 CA30051851D9204B2894E18F048F6C805596AA31)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 87.94.109.40
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, skhan@linuxfoundation.org
Subject: [PATCH] drm/amd/pm: replace 1-element arrays with flexible-array
 members
Date: Wed,  8 Nov 2023 08:54:35 +0200
Message-Id: <20231108065436.13969-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3510274434799740609
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddukedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpedtudethfeghfegfffhtdeuhedukeduudeuieeiteegkedtudegvdektefftedvffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekjedrleegrddutdelrdegtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 amd-gfx@lists.freedesktop.org, linux-kernel-mentees@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following case seems to be safe to be replaced with a flexible array
to clean up the added coccinelle warning. This patch will just do it.

drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h:76:38-63: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
index c7b61222d258..1ce4087005f0 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
@@ -73,7 +73,7 @@ struct smu8_register_index_data_pair {
 
 struct smu8_ih_meta_data {
 	uint32_t command;
-	struct smu8_register_index_data_pair register_index_value_pair[1];
+	struct smu8_register_index_data_pair register_index_value_pair[];
 };
 
 struct smu8_smumgr {
-- 
2.39.2

