Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80249EB91
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DAA10E199;
	Thu, 27 Jan 2022 20:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EE710E1D8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:01:58 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id o64so4154088pjo.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 12:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mlOjEQaGgQJEWexKeIDPB6ZywfuO0Krhl/6WTCAgp1U=;
 b=eyrrZkbzPEVq72Z6fNYVKdNXOMuVYUB7XGcmAelArR/eBBTm4qv34sUVGHRw2+3Xjb
 qxYlvdBkbnSilPXGvWPCeiDXV+5AgRyZ6rpwDbyu6pszvNmM2d966CHxA1CXRr6njd4o
 N75g5GBD63J2h2qcjJmsi51wKmNMAMIts0FjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mlOjEQaGgQJEWexKeIDPB6ZywfuO0Krhl/6WTCAgp1U=;
 b=Y9mVSn55HAMfGitN8bjwYA+NeOD6hIYPcrJH9sQ4vlmSltwEkihUw8Tg497tW7cjfY
 ywKJOomqSOgbzL1kS9CE0lqSKxS1oFH6TYrVYHMd/P7Z1h0PXkYUAqsEXk3HsZEvNNNs
 L/LMw1AgH0V3oVPNyq28SRTheR5/rHKWQLhzcmuhzd2Czj988kUWFqaXymMYgioPzlJs
 e81fqup7Km/bViCCPJhdoweNYE30ZfrgsRv5chzW5HHoSEYxdT2SaSP6z4jzVfjJ1PLI
 0jRwlciRZZAfdKN4uorUC+nxF7Zxms8m5gEQ9h+aNAxpMLqekQ2sRV1aeCPpNVBHB+pJ
 MTBw==
X-Gm-Message-State: AOAM533mx4cp4AhwVbf0NgvRRp+X/8yug1G1m7jOQx4V8j5FYLWFG5Ud
 JfPCmR466+4IW0/rbaFbVW6oaRuEJdZLlQ==
X-Google-Smtp-Source: ABdhPJw9tnBKTD10bdf8LXuHDZN29rkJYFCfmvP96l1VR5CM/34SWpZehvfM/GsxZluqGTjuFM522g==
X-Received: by 2002:a17:902:f68e:: with SMTP id
 l14mr4800119plg.164.1643313717953; 
 Thu, 27 Jan 2022 12:01:57 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
 by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 12:01:57 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 03/35] component: Add aggregate_device_parent() for driver
 use
Date: Thu, 27 Jan 2022 12:01:09 -0800
Message-Id: <20220127200141.1295328-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows aggregate driver writers to get the parent of the aggregate
device passed to their probe/remove/shutdown functions.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 6 ++++++
 include/linux/component.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index dc748ef0b23b..13ac2004a913 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -71,6 +71,12 @@ static inline struct aggregate_device *to_aggregate_device(struct device *d)
 	return container_of(d, struct aggregate_device, dev);
 }
 
+struct device *aggregate_device_parent(const struct aggregate_device *adev)
+{
+	return adev->parent;
+}
+EXPORT_SYMBOL_GPL(aggregate_device_parent);
+
 struct component {
 	struct list_head node;
 	struct aggregate_device *adev;
diff --git a/include/linux/component.h b/include/linux/component.h
index aa69ea0401d3..c39dea7824af 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -43,6 +43,7 @@ int component_bind_all(struct device *parent, void *data);
 void component_unbind_all(struct device *parent, void *data);
 
 struct aggregate_device;
+struct device *aggregate_device_parent(const struct aggregate_device *adev);
 
 /**
  * struct component_master_ops - callback for the aggregate driver
-- 
https://chromeos.dev

