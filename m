Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82664621B36
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58BB10E4E8;
	Tue,  8 Nov 2022 17:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A35610E4E8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K7hR3kcY9SxHZtoP6I8WOetvo7/nxlSyWlDLbOd9cE0=; b=sF7V8SO+MpZ0/+pI4UY1NIrlwL
 eNtZnW/HAn/DSrDlb7g+lgJcIeCPFx3IvnDDlfZOl98lSS4feNSppwQokKpBGSxfe8w9u1UR2VRbN
 ry2jKn/pqWHqX6AuIgV/qeNm37xpGgfP8gK5wOloYoRj7OxvafWocV0ggYgD6dgfQzuCuGBN8QDUS
 JL/0AczqPR+4I3B3u5sFLIrh1CL90CeeZg//rBtImU0FJhHLD7sTcUiUMYm9RRWoStrFEvYDtEMin
 EAvqNOfUeXiKyTxUeEqHBkr5vc/gKLOxuRyIqghivu4izISkDEAQigP+PHqELb/CfNGzcsHebbdJw
 t8W5Zrdw==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1osSnw-00EVxA-R3; Tue, 08 Nov 2022 18:54:33 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/2] Balance mutex_init and mutex_destroy calls
Date: Tue,  8 Nov 2022 14:54:23 -0300
Message-Id: <20221108175425.39819-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
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
Cc: "Juan A . Suarez" <jasuarez@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces some changes to assure the correct resource release on
the V3D driver, especially the mutex. Currently, the V3D has no mutex_destroy()
calls, which means that a mutex is being instantiated, but it is not being
released by the end of its use.

So, use the DRM-managed mutex_init variants when possible to manage the mutex
release and add mutex_destroy() calls when not possible.

Best Regards,
- Maíra Canal

v1 -> v2: https://lore.kernel.org/dri-devel/20221107224656.278135-1-mcanal@igalia.com/T/#m3c23e3f21fe6aaae51138c746c74e94b2a7b3bfc

- Move mutex_destroy() to v3d_perfmon_put() (Daniel Vetter).
- Add mutex_destroy() on error case in v3d_perfmon_create_ioctl() (Daniel Vetter).
- Add Daniel Vetter's tags.

Maíra Canal (2):
  drm/v3d: switch to drmm_mutex_init
  drm/v3d: add missing mutex_destroy

 drivers/gpu/drm/v3d/v3d_gem.c     | 17 +++++++++++++----
 drivers/gpu/drm/v3d/v3d_perfmon.c |  6 +++++-
 2 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.38.1

