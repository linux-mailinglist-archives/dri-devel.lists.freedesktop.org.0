Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6F676F55C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 00:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF39610E68B;
	Thu,  3 Aug 2023 22:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7197F10E68B;
 Thu,  3 Aug 2023 22:02:29 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1bb775625e2so10399045ad.1; 
 Thu, 03 Aug 2023 15:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691100148; x=1691704948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4DhIg3tNHO0nntKDGAxke0FWjkdaCQbgLVhUvGrrYUs=;
 b=IVlws/H4rqzASnvCfzGDeM/2XoRReLJI6eIC0i9+rPNLhDlwnCMr8bdveheG+sCd5J
 3gFvy0xz1vCS65CzLWl7PQwOUoMfs4iq47iApgydooKTPVi0iV95aDAnaK53qDnZylyL
 n+lXg0DKtjNYPkv2/2ZkW3dLUJcMk1mS0FF2f2ueQ0j4W7Gwt0VtudxJtbIdndtM2vvO
 wTzZfpw+fzEZEFU41QIEttkYj1djtMIGHlKN25Fg9nqVMKlaRSmFvwnxf6tjqlhPuoZg
 wo+N++RmXWWGxczyUFmaBmPnChRUdct7H2SLhWfHWEQtc0eosJwwiPV4MaubrdmNueGN
 Gucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691100148; x=1691704948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4DhIg3tNHO0nntKDGAxke0FWjkdaCQbgLVhUvGrrYUs=;
 b=W8cUSoFXs6+HJziN0+48OY+U8tq29gpDUIhx/QvcvJN1+rnpgsyXOoYOh/kbMuTTaD
 8SGF+s0oNdMkc5VQQ9CrBBYyt6TWLnXQngijEerI7fPbGpYcpT8OrnASO3uu9o0gb5H7
 hXiHqbRIc/x94qYY6NC30cidN6HqmGfXBtLSBhuLw+Pb5ABM0PiEDT22NZ8Zj++J0Vhh
 Gc1YDTyTH3MgNMy4upsucF9zWjzxhPr7DT+Vn7HT8LS4UQvGCSBAz3Pz8eYsTzBhItsp
 UT2iMDvCk7dJTErfOTaCnFRdxiJXcKBRKmHPt6rGGwxcQ16JGz7HLu2x6YvGFvaWSdE7
 J9Mg==
X-Gm-Message-State: AOJu0YyR2P8ODZcVQ/Nm+L1Yw2GcIQWrzOGqL5lI9UHdD6uFzXGLOeEW
 ww1dR14RH8INnfb+yfWXX3zQDTnqCnY=
X-Google-Smtp-Source: AGHT+IHuhhbpypvPjmu6boQpzcgERRrZoJqVc0eDSJ/uhLny1OFK5GhIrA4vr/pGLwrUAZTitqZOeQ==
X-Received: by 2002:a17:902:e746:b0:1b8:af5e:853c with SMTP id
 p6-20020a170902e74600b001b8af5e853cmr4507plf.26.1691100148236; 
 Thu, 03 Aug 2023 15:02:28 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a170902ead100b001b03a1a3151sm325374pld.70.2023.08.03.15.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 15:02:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/9] PM / QoS: Teach lockdep about dev_pm_qos_mtx locking
 order
Date: Thu,  3 Aug 2023 15:01:53 -0700
Message-ID: <20230803220202.78036-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803220202.78036-1-robdclark@gmail.com>
References: <20230803220202.78036-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Annotate dev_pm_qos_mtx to teach lockdep to scream about allocations
that could trigger reclaim under dev_pm_qos_mtx.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/base/power/qos.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
index 4537d93ddb45..6cb4143d1090 100644
--- a/drivers/base/power/qos.c
+++ b/drivers/base/power/qos.c
@@ -1010,3 +1010,14 @@ void dev_pm_qos_hide_latency_tolerance(struct device *dev)
 	pm_runtime_put(dev);
 }
 EXPORT_SYMBOL_GPL(dev_pm_qos_hide_latency_tolerance);
+
+static int __init dev_pm_qos_init(void)
+{
+	/* Teach lockdep about lock ordering wrt. shrinker: */
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&dev_pm_qos_mtx);
+	fs_reclaim_release(GFP_KERNEL);
+
+	return 0;
+}
+early_initcall(dev_pm_qos_init);
-- 
2.41.0

