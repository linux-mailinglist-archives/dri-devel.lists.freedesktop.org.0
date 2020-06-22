Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C2B20410A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 22:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FB66E8F1;
	Mon, 22 Jun 2020 20:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28496E8F6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 20:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592856491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8VYE8zT0ZZk/gQDPSYsv+TzjOnRAhnxP4MI/7fpLnk=;
 b=AMU/HKr3clEfxkKp3NPJFdbPrVYcFYnI7ASPK3nKV5E4CYidJm0iMBKtd3skQeAxGKhQbY
 hQiGkd8YJoL/GOyIhQSEkFV6IQ0F39D8WDXdvbBDqfJGrULVPK2Fj9cz7Ecq5vBJLvlJ4g
 PIrScEzY0a77Vohk8wQslgVXvNJt/b4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-3s15gR-KNumnjuFOuEV44A-1; Mon, 22 Jun 2020 16:08:06 -0400
X-MC-Unique: 3s15gR-KNumnjuFOuEV44A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07A108005AD;
 Mon, 22 Jun 2020 20:08:05 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-166.rdu2.redhat.com
 [10.10.117.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BF9D5C1BD;
 Mon, 22 Jun 2020 20:08:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [RFC v5 04/10] drm/nouveau/kms/nv140-: Don't modify depth in state
 during atomic commit
Date: Mon, 22 Jun 2020 16:07:24 -0400
Message-Id: <20200622200730.120716-5-lyude@redhat.com>
In-Reply-To: <20200622200730.120716-1-lyude@redhat.com>
References: <20200622200730.120716-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we modify the depth value stored in the atomic state when
performing a commit in order to workaround the fact we haven't
implemented support for depths higher then 10 yet. This isn't idempotent
though, as it will happen every atomic commit where we modify the OR
state even if the head's depth in the atomic state hasn't been modified.

Normally this wouldn't matter, since we don't modify OR state outside of
modesets, but since the CRC capture region is implemented as part of the
OR state in hardware we'll want to make sure all commits modifying OR
state are idempotent so as to avoid changing the depth unexpectedly.

So, fix this by simply not writing the reduced depth value we come up
with to the atomic state.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c | 11 +++++++----
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c | 11 +++++++----
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
index 4a9a32b89f746..9ef3c603fc43e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -27,17 +27,20 @@ static void
 headc37d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
 	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
+	u8 depth;
 	u32 *push;
+
 	if ((push = evo_wait(core, 2))) {
 		/*XXX: This is a dirty hack until OR depth handling is
 		 *     improved later for deep colour etc.
 		 */
 		switch (asyh->or.depth) {
-		case 6: asyh->or.depth = 5; break;
-		case 5: asyh->or.depth = 4; break;
-		case 2: asyh->or.depth = 1; break;
-		case 0:	asyh->or.depth = 4; break;
+		case 6: depth = 5; break;
+		case 5: depth = 4; break;
+		case 2: depth = 1; break;
+		case 0:	depth = 4; break;
 		default:
+			depth = asyh->or.depth;
 			WARN_ON(1);
 			break;
 		}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 859131a8bc3c8..97141eb8e75ab 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -27,17 +27,20 @@ static void
 headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
 	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
+	u8 depth;
 	u32 *push;
+
 	if ((push = evo_wait(core, 2))) {
 		/*XXX: This is a dirty hack until OR depth handling is
 		 *     improved later for deep colour etc.
 		 */
 		switch (asyh->or.depth) {
-		case 6: asyh->or.depth = 5; break;
-		case 5: asyh->or.depth = 4; break;
-		case 2: asyh->or.depth = 1; break;
-		case 0:	asyh->or.depth = 4; break;
+		case 6: depth = 5; break;
+		case 5: depth = 4; break;
+		case 2: depth = 1; break;
+		case 0:	depth = 4; break;
 		default:
+			depth = asyh->or.depth;
 			WARN_ON(1);
 			break;
 		}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
