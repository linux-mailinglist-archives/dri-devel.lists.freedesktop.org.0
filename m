Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2457882B5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 10:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0393310E12D;
	Fri, 25 Aug 2023 08:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E043310E12D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692953760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v5B8lwsoFD6d6oNzQxrjNHYLw/u2MuzlS5qZEl3sKVs=;
 b=VgHZvDKXLlYxi+fkYji0QXqxkoABdfmmmnbdU2Hm87rg4mYz7HIVNgjnXXZmPTLlnQHqkV
 iw50qLzWtRmV6+7DjS8Jj6Qhamtame55Nbk6hHSdCf0fPV9XjUYOri7mU45eqM+g1Shqp2
 cYf5zqST0auYO93+ZKPz55VKJQNko+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-rF8pCRJuOFeOHWigBfU1hw-1; Fri, 25 Aug 2023 04:55:57 -0400
X-MC-Unique: rF8pCRJuOFeOHWigBfU1hw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9963858EED;
 Fri, 25 Aug 2023 08:55:56 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DD791121319;
 Fri, 25 Aug 2023 08:55:55 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, ppaalanen@gmail.com,
 javierm@redhat.com, contact@emersion.fr
Subject: [PATCH v2] drm/plane: Add documentation about software color
 conversion.
Date: Fri, 25 Aug 2023 10:55:35 +0200
Message-ID: <20230825085545.168290-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After discussions on IRC, the consensus is that the DRM drivers should
avoid software color conversion, and only advertise the formats supported
by hardware.
Update the doc accordingly so that the rule and exceptions are clear for
everyone.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_plane.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..7215521afddd 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -140,6 +140,25 @@
  *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
  *     various bugs in this area with inconsistencies between the capability
  *     flag and per-plane properties.
+ *
+ *     All drivers must support XRGB8888, even if the hardware cannot support
+ *     it. This has become the de-facto standard and a lot of user-space assume
+ *     it will be present. If XRGB8888 is not natively supported, then it
+ *     shouldn't be the default for preferred depth or fbdev emulation.
+ *
+ *     DRM drivers should not do software color conversion in dumb buffers, and
+ *     only advertise the formats they support in hardware. This is for
+ *     performance reason, and to avoid multiple conversions in userspace and
+ *     kernel space.
+ *     But there are two exceptions:
+ *     * To support XRGB8888 if it's not supported by the hardware.
+ *     * Any driver is free to modify its internal representation of the format,
+ *       as long as it doesn't alter the visible content in any way. An example
+ *       would be to drop the padding component from a format to save some memory
+ *       bandwidth.
+ *     Extra care should be taken when doing software conversion with
+ *     DRM_CAP_DUMB_PREFER_SHADOW, there are more detailed explanation here:
+ *     https://lore.kernel.org/dri-devel/20230818162415.2185f8e3@eldfell/
  */
 
 static unsigned int drm_num_planes(struct drm_device *dev)

base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781
-- 
2.41.0

