Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF79F620291
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 23:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B079410E58C;
	Mon,  7 Nov 2022 22:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACE910E58C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 22:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N58UJpNNAExktwhfZVLTshsZnQ2VVILEtn44kEC8lhE=; b=aBTAUl7EESx7XqVKDnD6YS7wbj
 8/vNDRacf5mqYJTrbPEn+ZEhFXJmKIZAq537t3odJDE2x9hKTX4hzTkK7xoRewIxuTHz8ZvfINQrM
 8trMpHc+FYEYh7MumOFYd1uACya663nsFCtK+imVa5c8s5MUnC/OMtBVwau/H2gHIgO72gc6C/R30
 0TIQq5EfB2xhLe/DIl5cY16ASG6VjyDD6zFlb2o3GUfMdcSSLVuaQJdyZ72u60AfEzfC6UG12gsOq
 nRz7jSuoVzZvGAH3/X8FK7M3fX26tTWljUqPeUX93a5wrs4tpIao/81IOQvcYU8lPh9l+dowMw558
 AvVFSEzA==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1osAuz-00E9qX-5g; Mon, 07 Nov 2022 23:48:37 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/v3d: add missing mutex_destroy
Date: Mon,  7 Nov 2022 19:46:56 -0300
Message-Id: <20221107224656.278135-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107224656.278135-1-mcanal@igalia.com>
References: <20221107224656.278135-1-mcanal@igalia.com>
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

v3d_perfmon_open_file() instantiates a mutex for a particular file
instance, but it never destroys it by calling mutex_destroy() in
v3d_perfmon_close_file().

Similarly, v3d_perfmon_create_ioctl() instantiates a mutex for a
particular perfmon, but it never destroys it by calling mutex_destroy()
in v3d_perfmon_destroy_ioctl().

So, add the missing mutex_destroy on both cases.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_perfmon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index 48aaaa972c49..292c73544255 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -113,6 +113,7 @@ void v3d_perfmon_close_file(struct v3d_file_priv *v3d_priv)
 	idr_for_each(&v3d_priv->perfmon.idr, v3d_perfmon_idr_del, NULL);
 	idr_destroy(&v3d_priv->perfmon.idr);
 	mutex_unlock(&v3d_priv->perfmon.lock);
+	mutex_destroy(&v3d_priv->perfmon.lock);
 }
 
 int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
@@ -177,6 +178,7 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 	if (!perfmon)
 		return -EINVAL;
 
+	mutex_destroy(&perfmon->lock);
 	v3d_perfmon_put(perfmon);
 
 	return 0;
-- 
2.38.1

