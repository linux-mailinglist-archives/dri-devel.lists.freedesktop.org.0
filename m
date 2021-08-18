Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847E33EFDE8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273BE6E457;
	Wed, 18 Aug 2021 07:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD636E462;
 Wed, 18 Aug 2021 07:40:27 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id k19so1276887pfc.11;
 Wed, 18 Aug 2021 00:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rPzlSJpSXI27Gad1u8smJdYmSOWjamjBkzviSiNS/Mc=;
 b=MIflcts7D1tN8J3RdN87d9ZHJdOVpi/Y7ERqfgGkMxAqizTDrZnC3zn84IGdMDNRG1
 TsFbeCSOdQo/Py1VHAlmJ2MwCLS58e8AwZ3j0AmDq2lZt9m0I0r4oz1W+KNW0xT6REua
 AI6k7qV4XuH6g9S6w8mtDN7gwjkQWEmR3Fxw92LdtRu9MxRBTRrZi0MJPXEAklNUzX+x
 x/F0npPWDZEuxnkDlDLzFPp7OPuMsmpLPntndLZBFDIjlhQ1TUX3UwYtEu5bOGfndBuw
 3iqn0xCowwCGjsX1K3etz2Bt2fKjWBrGnZTeAbNexlkiWTFYyIYQnvQRIt1410FKUqvh
 fIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rPzlSJpSXI27Gad1u8smJdYmSOWjamjBkzviSiNS/Mc=;
 b=SdGeNSPRV9a6A12MCg+l0Fg2zs9JrwCdtFJx/LWuVdNAQeME6+Tm5s9/MrSNK+kENz
 LEhghk1AI2939Ws41uEk0IoW6NLmRVe0qUu+WaSAoYU+Q5WjV4wHwWAq1kk6g8mNXRBM
 XH4E2e/Ri6+wJHbg8FVp7G87kzuZTjuFOPCvBpBVjTs3xqkXJrYGaG8DMSvIWHRYpxDB
 1uliY3/cxLAbcyA2cYZpDRohHv7yYxN/TnRhIDqfsq7sdVqivH4igVybKCfuEvD99r1i
 seL2VuEWcUDmSYtBhPAxq41SPTMEIp5Z4cR5WDiw7dMtCT7mC1UtYMoj5KzET8gV7S8s
 zGBQ==
X-Gm-Message-State: AOAM532m8jgyV+J+xP4FVuD4DLuOgGRl7DLg/kAPy2EnWbRccFkPJ14H
 zrdhmcCXjiDgMba/yQO6xPo=
X-Google-Smtp-Source: ABdhPJy/fzSnhMD3q0lPJ928lvoZMJnf6R2L7yWez8jfwKjnKO8/BzrE5reAPVzX3+BXN8wNfdHHOQ==
X-Received: by 2002:a65:63d6:: with SMTP id n22mr5409905pgv.74.1629272427179; 
 Wed, 18 Aug 2021 00:40:27 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:40:26 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 2/9] drm: hold master_lookup_lock when releasing a
 drm_file's master
Date: Wed, 18 Aug 2021 15:38:17 +0800
Message-Id: <20210818073824.1560124-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When drm_file.master changes value, the corresponding
drm_device.master_lookup_lock should be held.

In drm_master_release, a call to drm_master_put sets the
file_priv->master to NULL, so we protect this section with
drm_device.master_lookup_lock.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 8efb58aa7d95..8c0e0dba1611 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -373,8 +373,11 @@ void drm_master_release(struct drm_file *file_priv)
 	}
 
 	/* drop the master reference held by the file priv */
-	if (file_priv->master)
+	if (file_priv->master) {
+		spin_lock(&dev->master_lookup_lock);
 		drm_master_put(&file_priv->master);
+		spin_unlock(&dev->master_lookup_lock);
+	}
 	mutex_unlock(&dev->master_mutex);
 }
 
-- 
2.25.1

