Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F46241D789
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 12:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CBD6EB60;
	Thu, 30 Sep 2021 10:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2AB6EB60
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 10:19:43 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6D53040DD7; 
 Thu, 30 Sep 2021 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632997181;
 bh=3HqHjju1V6qHP4N5Fhu3jHizcZDAmcAuKPY+5zu5uUA=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=DFRDD/IITmkIue9vNoR3GTyvYtqoCl6x8xNqCh44bOrIaKBe5ViQ72pzhF6bTUzRX
 QOQbRPbmQsAdXhHoAKdXcN9IX5FajlToixLg62JCJLkHn6MoQcuthfwpEd7yknMeZW
 S7ouknTJ6ZkUf25UoKwzDButS2mUuLkbi02jvpT3lYNqiZXfzCOfhWOT02bFkPcE/b
 sq48NTIIKEHq/0/96U8MR55YEeDWu69UiAAPI4PwdedbZnfF0LR1qLSfzIEiabLTle
 VH3y2WHtIop8PjVnRD0Qu10XNDd0K7iEuofStKZzOxethnuJ91bdBGD/QknAKCERqX
 l2TP0jwsOo0Jg==
From: Colin King <colin.king@canonical.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nicholas Verne <nverne@chromium.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/virtio: fix potential integer overflow on shift of
 a int
Date: Thu, 30 Sep 2021 11:19:41 +0100
Message-Id: <20210930101941.16546-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

The left shift of unsigned int 32 bit integer constant 1 is evaluated
using 32 bit arithmetic and then assigned to a signed 64 bit integer.
In the case where i is 32 or more this can lead to an overflow. Fix
this by shifting the value 1ULL instead.

Addresses-Coverity: ("Uninitentional integer overflow")
Fixes: 8d6b006e1f51 ("drm/virtio: implement context init: handle VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 5618a1d5879c..b3b0557d72cf 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -819,7 +819,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 	if (vfpriv->ring_idx_mask) {
 		valid_ring_mask = 0;
 		for (i = 0; i < vfpriv->num_rings; i++)
-			valid_ring_mask |= 1 << i;
+			valid_ring_mask |= 1ULL << i;
 
 		if (~valid_ring_mask & vfpriv->ring_idx_mask) {
 			ret = -EINVAL;
-- 
2.32.0

