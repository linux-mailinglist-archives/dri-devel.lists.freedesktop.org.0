Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8D7726FC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 16:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F0E10E0D4;
	Mon,  7 Aug 2023 14:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C02910E179
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691417097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5rN4TuXpD7zxt0PGq2G/wQLxpFfmmbRRV0YPSvDLMA=;
 b=GXr5/6Tbr5z3EImZmrCoXbSWqkpN2jmzVcElj1wP0jPY1OmB61jQy7dBjA7JXfszGfgAih
 /HzOHq0bSw999l1Mw372hOE9CEsucfefj1uIBIbqBc92z2YgC6VkASCYuVro8Z8B9lS560
 EWM8meEsWLtc4h2JjXF+nD+Fggl61oI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-P3lIXv21OgKW8nylsb5g6g-1; Mon, 07 Aug 2023 10:04:53 -0400
X-MC-Unique: P3lIXv21OgKW8nylsb5g6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86B9110726DE;
 Mon,  7 Aug 2023 14:04:26 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7661440C7;
 Mon,  7 Aug 2023 14:04:24 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, ppaalanen@gmail.com,
 javierm@redhat.com
Subject: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
Date: Mon,  7 Aug 2023 15:45:15 +0200
Message-ID: <20230807140317.26146-2-jfalempe@redhat.com>
In-Reply-To: <20230807140317.26146-1-jfalempe@redhat.com>
References: <20230807140317.26146-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
not do software color conversion, and only advertise the supported formats.
Update the doc accordingly so that the rule and exceptions are clear for
everyone.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 include/uapi/drm/drm_fourcc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8db7fd3f743e..00a29152da9f 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -38,6 +38,13 @@ extern "C" {
  * fourcc code, a Format Modifier may optionally be provided, in order to
  * further describe the buffer's format - for example tiling or compression.
  *
+ * DRM drivers should not do software color conversion, and only advertise the
+ * format they support in hardware. But there are two exceptions:
+ * The first is to support XRGB8888 if the hardware doesn't support it, because
+ * it's the de facto standard for userspace applications.
+ * The second is to drop the unused bits when sending the data to the hardware,
+ * to improve the bandwidth, like dropping the "X" in XRGB8888.
+ *
  * Format Modifiers
  * ----------------
  *
-- 
2.41.0

