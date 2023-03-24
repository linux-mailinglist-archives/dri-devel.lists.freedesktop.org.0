Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A98A6C828B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 17:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9387910E02F;
	Fri, 24 Mar 2023 16:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECFE10E02F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jBDooVBexRrdbZwQR6ss45YPhKNjAqcWwgnbYGjpCfE=; b=soMI8nPV2MPm5NmDvq6+qUQuuQ
 YseAmJceNC7nkaNW7XazO6RROgFs4TgJCTICPWgweKm6+R2NdwJskBFROA6/acg8vlt33jYaK57MI
 ArzUmxH33d17HhHoae1RyT+rwTmJt4dBsIEQNBwXe0H2xtlFk3pjiIscyVARD2aHDPDOygL04pqe7
 NCTdtl11Yz08jz/YULdpjVx6WFnXT26kJ9dG1+GOj1858Xl6t2a3dYoK/0UTpa+gj4qNbZVWwbb3f
 1pq5hHabkx4fvCebRQPWQDaU2tjKRPDdGJwfUfJ9wTuYXT0pk1Eywn/Mp0jpLtMn6wLY9N2e/nvEC
 wibtEpEA==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pfkWq-005bt9-JZ; Fri, 24 Mar 2023 17:44:37 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v2 0/2] Update the handling of the primary plane
Date: Fri, 24 Mar 2023 13:42:24 -0300
Message-Id: <20230324164226.256084-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset focus on the proper handling of the primary plane after the
modifications introduced in commit bc0d7fdefec6 ("drm: vkms: Supports to the
case where primary plane doesn't match the CRTC"). Before this commit, the
composition was executed on top of the primary plane. Therefore, the primary
plane needed to cover the entire CRTC and it needed to be visible. After commit
bc0d7fdefec6, this is no longer necessary, as the composition is now executed on
top of the CRTC. So, remove those restrictions to the primary plane.

This patchset increased the vkms IGT test coverage. The following tests are now
passing:

- igt@kms_atomic_transition@plane-toggle-modeset-transition
- igt@kms_atomic_transition@modeset-transition
- igt@kms_atomic_transition@modeset-transition-fencing
- igt@kms_atomic_transition@modeset-transition-nonblocking
- igt@kms_atomic_transition@modeset-transition-nonblocking-fencing
- igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
- igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a
- igt@kms_universal_plane@universal-plane-pipe-a-functional

Moreover, this patchset was tested with the vkms IGT testlist and all tests
passed successfully.

Best Regards,
- Maíra Canal

v1 -> v2: https://lore.kernel.org/dri-devel/20230320195558.134768-1-mcanal@igalia.com/T/

* Introduce a second patch to allow the primary plane to be positioned.

---

Maíra Canal (2):
  drm/vkms: remove the need for the primary plane to be visible
  drm/vkms: allow the primary plane to be positioned

 drivers/gpu/drm/vkms/vkms_plane.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

-- 
2.39.2

