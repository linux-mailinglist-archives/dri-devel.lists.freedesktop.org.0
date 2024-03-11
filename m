Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9FA878454
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 16:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5382E112B3F;
	Mon, 11 Mar 2024 15:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SCqgc8pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A6F112B3F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710172748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0DaVe9UI/74uhr3vyv9Mr2EI8STk16ojBYtV0kWhR6s=;
 b=SCqgc8pvlqEtcidev1BhUsZ6Mple/uY5vkRTX7ZNTnDIQtEEp1pIQe8xoIx2DPrW6GMkKj
 yR2BiE77KJqp1YOll0xKsfD+w5wf477U5XMexTtNhnBB7lWQ4WRjBEVuk5Gf/uSvNiqFvU
 pwhrfGu1A+OaiAXy4hM8lTk6m1tCkSM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-TP9lwC01Pn2850oGXswDow-1; Mon, 11 Mar 2024 11:59:07 -0400
X-MC-Unique: TP9lwC01Pn2850oGXswDow-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-33e705fb2abso1904416f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 08:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710172746; x=1710777546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0DaVe9UI/74uhr3vyv9Mr2EI8STk16ojBYtV0kWhR6s=;
 b=XpYjRD56FA8IhLI7gs02+rSdIqqCMBtZO2fQOHkRPq9LypX7eyAd5/uxYBhUwFH6AY
 GpTC79FqMWnEhssZDx59R+64+RXg5J0i2cMW9DxIWVFjo+Y9HCwkYK2BWN+C52uCpAq5
 BxKnxbrM26M+2fZ6pHRmQmbdfULfXTKA58OltwBHWiIPGslYigWBDtxVzpv4dNSWSRzy
 ZUWCxKargV3RrtPCPw1Dj2E/zBVAy9rgl+PqU3ig9uMTpqbrrKeAd8gWMc/6ZzevqFba
 uBilbZFM4vGNG+TbE+7NjHRDJTjOFQ2F2wZB8e0b+iEx4NLKL3x6qtmeXb3bcyShVnos
 vIcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBAg5xDLO0BzgcM/Z0qtuDa4zCzh0kknD1Is36bNdzSND/gp+eTnlbjwVwtgkMqyooklZkpMx89rfT+v2AfSDCyXozgDWcPtEEtdBM34Th
X-Gm-Message-State: AOJu0Ywu1S8BhAbv4awMW/Da1x8zadm/os+KXveIZMi+xG8S6UeoN+NU
 IGvOfde3atmJy/HXSYfCK1EpCrAbnCwkpoyI9xmGv++ACZv0qzDApgzOaGrJ+gr5Zr8mVpMEZyI
 XC4seibjwdN4sdOEhhBt6GgBfaeT6ksFGbFRsyhK37yZ277yLaU6EjiQKTRWkZC+p6w==
X-Received: by 2002:a5d:5266:0:b0:33e:7bef:8ac9 with SMTP id
 l6-20020a5d5266000000b0033e7bef8ac9mr4426682wrc.42.1710172745898; 
 Mon, 11 Mar 2024 08:59:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAohlcaa5hCeO6/rNdnXeWXIrJX3SzsKOW0z/TCgQ3k78FXEykJ0N240bYuJJMlujXGYrRJg==
X-Received: by 2002:a5d:5266:0:b0:33e:7bef:8ac9 with SMTP id
 l6-20020a5d5266000000b0033e7bef8ac9mr4426674wrc.42.1710172745566; 
 Mon, 11 Mar 2024 08:59:05 -0700 (PDT)
Received: from toolbox.fritz.box ([2001:9e8:89a8:bc00:4f1a:435e:d5a8:5d5a])
 by smtp.gmail.com with ESMTPSA id
 p12-20020adf9d8c000000b0033cf60e268fsm6774274wre.116.2024.03.11.08.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 08:59:05 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: 
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: Document requirements for driver-specific KMS props
 in new drivers
Date: Mon, 11 Mar 2024 16:58:58 +0100
Message-ID: <20240311155904.323488-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When extending support for a driver-specific KMS property to additional
drivers, we should apply all the requirements for new properties and
make sure the semantics are the same and documented.

v2: devs of the driver which introduced property shall help and ack

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 Documentation/gpu/drm-kms.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 13d3627d8bc0..b98b98359c90 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -496,6 +496,13 @@ addition to the one mentioned above:
 
 * An IGT test must be submitted where reasonable.
 
+For historical reasons, non-standard, driver-specific properties exist. If a KMS
+driver wants to add support for one of those properties, the requirements for
+new properties apply where possible. Additionally, the documented behavior must
+match the de facto semantics of the existing property to ensure compatibility.
+Developers of the driver that first added the property should help with those
+tasks and must ACK the documented behavior if possible.
+
 Property Types and Blob Property Support
 ----------------------------------------
 
-- 
2.44.0

