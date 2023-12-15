Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CDF8144C9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 10:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8684A10E9A4;
	Fri, 15 Dec 2023 09:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 585 seconds by postgrey-1.36 at gabe;
 Fri, 15 Dec 2023 09:43:59 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E831810E9A4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 09:43:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.242.8.170])
 by mail.ispras.ru (Postfix) with ESMTPSA id 6598540F1DC5;
 Fri, 15 Dec 2023 09:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 6598540F1DC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1702632851;
 bh=ccZp27R6c7ZeC11LFGMLzR031473jv38nkI+1DlG12s=;
 h=From:To:Cc:Subject:Date:From;
 b=JfA8lXMPcs09R7jTJgYkxAHZzWmAGdt7d5I+s5lhruo3caq4xyvs64vuUx0iCks+8
 9oG9jWmNemVAgjdODNZjkiSCklUag4h9oKtkvK9G+kE/UPQBBT9q6TICKEhcplpKdJ
 VW7vFwzrpmYyBVD25+EeUcU0Xg6SJ57aHsXDc95M=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: put drm_gem_object ref on error in tegra_fb_create
Date: Fri, 15 Dec 2023 12:33:55 +0300
Message-ID: <20231215093356.12067-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Cc: Terje Bergstrom <tbergstrom@nvidia.com>, lvc-project@linuxtesting.org,
 linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Arto Merilainen <amerilainen@nvidia.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inside tegra_fb_create(), drm_gem_object_lookup() increments ref count of
the found object. But if the following size check fails then the last
found object's ref count should be put there as the unreferencing loop
can't detect this situation.

Found by Linux Verification Center (linuxtesting.org).

Fixes: de2ba664c30f ("gpu: host1x: drm: Add memory manager and fb")
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/gpu/drm/tegra/fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index a719af1dc9a5..46170753699d 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -159,6 +159,7 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 
 		if (gem->size < size) {
 			err = -EINVAL;
+			drm_gem_object_put(gem);
 			goto unreference;
 		}
 
-- 
2.43.0

