Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A67A5E91D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 01:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D6E10E6B0;
	Thu, 13 Mar 2025 00:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LJjRguAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C3210E6B0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 00:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741827298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UoaJonu1Ykft8honHbcoNgiIucT+lAcKoBxDQ1EsVIU=;
 b=LJjRguAFGzyk0tCyNWwqEk0hkX52U5aUXGUoX0FJU19rGy1NvFVtRfIzZkJo8lJFyjF7G+
 L3iSEsBBurNwN3bNaOf5c5frez9HSB4evscwUM+0rPdycT611OhnRyRmYZNHqD8PThrbV8
 SX7hyqsbUIEiL3/7r/nPmNV6C1SL3Io=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-h5hFTB0PNUGrbqzmFZNZCw-1; Wed,
 12 Mar 2025 20:54:54 -0400
X-MC-Unique: h5hFTB0PNUGrbqzmFZNZCw-1
X-Mimecast-MFC-AGG-ID: h5hFTB0PNUGrbqzmFZNZCw_1741827293
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8FC76195608B; Thu, 13 Mar 2025 00:54:52 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.186])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 46C7F1955BCB; Thu, 13 Mar 2025 00:54:49 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH RFC 0/2] drm/panel: Refcounted panel allocation
Date: Wed, 12 Mar 2025 20:54:41 -0400
Message-Id: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANEs0mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0ND3ZSiXN2CxLzUHN1kYyNzS0ujVEtjo1QloPqCotS0zAqwWdFKQW7
 OSrG1tQAm2jMqYAAAAA==
X-Change-ID: 20250311-drm-panel-c327992e932e
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741827289; l=1079;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=prKb1/vsoLZeKMb2AQiT1U6bRaw46DjeGENTzbI5K3Q=;
 b=xjrFzIHHXSIYDjna0xcXbb6Bqj7JFBaS5Mw9FAVoKT8/aywRJzepAS5iZPGRCve271zLWFm5x
 VKYrR51+zZ/CBllFYT0Fk8Y0/P6zklxMKNqhPINNmo/JXDZ6DKJAMNn
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Primary motivation is to avoid havig a dangling pointer with panels.
In a scenario where panel device no longer exists, the DRM driver
has no idea of it. It can continue to try and access a panel leading
to use-after-free situations.
This is the initial draft more for feedback only. Once the path
forward is clear, further drivers will be converted to using the API.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Anusha Srivatsa (2):
      drm/panel: Add new helpers for refcounted panel allocatons
      drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()

 drivers/gpu/drm/drm_panel.c          | 50 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c |  4 +--
 include/drm/drm_panel.h              | 58 ++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+), 3 deletions(-)
---
base-commit: 3282422bf251db541fe07c548ca304130d37d754
change-id: 20250311-drm-panel-c327992e932e

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

