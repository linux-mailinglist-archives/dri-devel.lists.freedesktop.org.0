Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE35292E72
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 21:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5506EA47;
	Mon, 19 Oct 2020 19:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 438 seconds by postgrey-1.36 at gabe;
 Mon, 19 Oct 2020 06:28:38 UTC
Received: from qq.com (out203-205-251-73.mail.qq.com [203.205.251.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544E46E8D4;
 Mon, 19 Oct 2020 06:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1603088915; bh=jB0wedGqDMjnWzKTLqVfs8k0nBO/DhZPoNNePfjSkNE=;
 h=From:To:Cc:Subject:Date;
 b=wYGeJt8xJ+t0pPV7EMpMFz7QaY7A0mfncOul/hYzHbq0NmXodyZvf8rtVDJBjmN3X
 Zlsfpn7xQxb3xERLwvTtLqLuXvdjcJoZg/wpP4z3/1YVODuXkpLp9zm72sFO3/tGTf
 lCNMlkLwd0pLOk5fd3pwtG4Yg/G5vUN8dUoxguKM=
Received: from localhost.localdomain ([36.112.86.14])
 by newxmesmtplogicsvrsza6.qq.com (NewEsmtp) with SMTP
 id 541A4EC1; Mon, 19 Oct 2020 14:21:01 +0800
X-QQ-mid: xmsmtpt1603088461tu3sorx09
Message-ID: <tencent_6CDB3D2D9BB1A93DCB856F2AD38C59F93F05@qq.com>
X-QQ-XMAILINFO: MVL33v9tKviNV3DhlxslmIKw3J8kUW/1Izdwa/SBANxfFnfSsVw5ppWnoqGAsN
 QVrrlMQR4pFcZ70dtRV6TB6kuKvU93kxe69R1GuLNxgBsbQw1+fU1RrEI9OU/K5lE4KR0rmq7WIu
 o07QsWGydoKZsG77Zsjil/no+htvZ7M/ms/Uc0QvdX3uU0K/2koBe69ulBazRvho82Co2vjF9YW8
 3yWdkvkrsocDNCJJnJ/oRx78cwIOoNt/6At3PBspFTPFvxbN0HtGLeMGlxgu9glnCUx5EObz+iEN
 Ezmbfx2pTN5PxHQRaob7jMhIxEaX7IRCkOF9RAsCoqSXpiPl9WAZhnbwJfjIPvF1jRUfuF+it749
 NF98jNzPJpoAgwQxPjcDMLDa8KExT6ibISolHVw7NbD3Hs7mAVcaEYT4FkH1nCZV1H1RZnK/B1aN
 huSWTcdc57pmWANPMMYPvqrUR21l6wc5MCIZwVre4aNefKvP7FW/V8n9/ESGKyXxmRfRGZRk9AZ5
 yeFUeThby6ODy1v7eSw7Wpxk0e+RbUP2kx0CVmIMdrTwmH4kGOuIXo1Y2wbICRFkhSN75pN2ndmH
 NmMObuAvtZUGZchMLzOQMg9MexCuUvd7IoYVUAYFl5sRjf8JpVufpWZWx83rwX6simEDg8vFOMJF
 hI70WO9LQtHYA0HxkqrIrdlR5NtFyXYNNISs9/t1WGmFSRGjtY1c7hB8nzjL+CQoHn1ie5Q1q+PL
 Z96oaV45mAeTVwx0lNepf2cOkitvlhGzYTAnp5f6CliYvR2p8UdH3A6CrwDqYWYlQGTBDRGk1WCk
 oABdrkGiMpzNSdIzBsoBAw8uLR1VrG0CM=
From: estherbdf <603571786@qq.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: fix a possible NULL pointer dereference in
 bios_parser_get_src_obj()
Date: Mon, 19 Oct 2020 14:20:48 +0800
X-OQ-MSGID: <1603088448-3529-1-git-send-email-603571786@qq.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Mon, 19 Oct 2020 19:28:29 +0000
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
Cc: estherbdf <603571786@qq.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why] the func  bios_parser_get_src_obj () is similar to  bios_parser_get_dst_obj () which is fixed by the commit<a8f976473196>("drm/amd/display: Banch of smatch error and warning fixes in DC").
the symbol 'id' is uninitialized and it is not checked before dereference it,may lead to null pointer dereference.
[How] Initialized variable explicitly with NULL and add sanitizer.

Signed-off-by: estherbdf <603571786@qq.com>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
index 008d4d1..94c6cca 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
@@ -190,7 +190,7 @@ static enum bp_result bios_parser_get_src_obj(struct dc_bios *dcb,
 	struct graphics_object_id *src_object_id)
 {
 	uint32_t number;
-	uint16_t *id;
+	uint16_t *id = NULL;
 	ATOM_OBJECT *object;
 	struct bios_parser *bp = BP_FROM_DCB(dcb);
 
@@ -206,7 +206,7 @@ static enum bp_result bios_parser_get_src_obj(struct dc_bios *dcb,
 
 	number = get_src_obj_list(bp, object, &id);
 
-	if (number <= index)
+	if (number <= index || !id)
 		return BP_RESULT_BADINPUT;
 
 	*src_object_id = object_id_from_bios_object_id(id[index]);
-- 
1.9.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
