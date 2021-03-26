Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF81334AA78
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749C16F418;
	Fri, 26 Mar 2021 14:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2E96F417
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:51:50 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z2so5924204wrl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3U/NAbihKjPec78yWr69VR7pI5Ujcbfohjar0SwT5eo=;
 b=AaLyS3Qergrq9129uVi7KloKnhBed8aEvtOSdu1Uwcx6cGMumwd1dkZqNRXHBVlZUe
 VMzUFkNborSwg7jJFBFwxlQj7cK60QVHVTXdvWJPaol29w/e/x0SuEhkCvcwSkU+M6OP
 Qa/p/iG3A1Itl+nJkFmVN+i52C3BMpcrE6MzPrjGWvnTYbdP+Db0aA99zbOr1ZwwVI5D
 hBWlwd93u1hldS2DuQ/Ad8gNf/GBPh0RpwxnVvbQnX7Qg/S7WUx97sYApn+xraGDW/Af
 a8SxC8s6k38SDRzPqdoEI0cqKcJMLxps2692fgCk1xOHzDNLWJI/19zHIfLLAI+AuyBY
 PWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3U/NAbihKjPec78yWr69VR7pI5Ujcbfohjar0SwT5eo=;
 b=UxxMh20pBJdo7fey+YIRfyv3T/LoTvxQWOnQiKIXLoTi6TWx5AAbbmOZqY61YRe0CC
 qKzJybodmq938g3nhCzEWbB05C19YfxLpLNn/FB9AxJ4ptwFT2BZrwlugkLJNoAF4sEf
 a7mjitS1yTtQcmhQcgnNJPZ5NXEvfVsNf8wEDxSOb1CXhd0G96crqsbTTH/d//zQGcDo
 HabSXzJ8pyc1AGYO/e/CvENkQZ0Fx8gOtoM5D/I8RY7gfj7ckaFu7GkTk/AeGJpU0tNR
 tZXKR2zgy6WHtQN2aEq/nqZU4IXv6boqWO5Sq4gP1r3tG6HqHP9K2CEamxbFNftLIsqT
 kBdg==
X-Gm-Message-State: AOAM5326RVKpfpo4+CjkA18AgK/N0a4SKHDF/bnUwzWYXjapBqKrvciP
 5UWNFBCyG2VJOyJNLPPP880=
X-Google-Smtp-Source: ABdhPJyNOUsrKleJ3gngSpSoJQRwShk1gTga+j6VbqpxGeASJGdgTyuCBEMJgqLpqvGYd3jBCmSZNA==
X-Received: by 2002:adf:8562:: with SMTP id 89mr15015871wrh.101.1616770309209; 
 Fri, 26 Mar 2021 07:51:49 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id g5sm13622621wrq.30.2021.03.26.07.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:51:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 08/10] gpu: host1x: Add early init and late exit callbacks
Date: Fri, 26 Mar 2021 15:51:37 +0100
Message-Id: <20210326145139.467072-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

These callbacks can be used by client drivers to run code during early
init and during late exit. Early init callbacks are run prior to the
regular init callbacks while late exit callbacks run after the regular
exit callbacks.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 31 +++++++++++++++++++++++++++++++
 include/linux/host1x.h   |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 4c18874f7c4a..c9077cfbfef9 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -196,6 +196,17 @@ int host1x_device_init(struct host1x_device *device)
 
 	mutex_lock(&device->clients_lock);
 
+	list_for_each_entry(client, &device->clients, list) {
+		if (client->ops && client->ops->early_init) {
+			err = client->ops->early_init(client);
+			if (err < 0) {
+				dev_err(&device->dev, "failed to early initialize %s: %d\n",
+					dev_name(client->dev), err);
+				goto teardown_late;
+			}
+		}
+	}
+
 	list_for_each_entry(client, &device->clients, list) {
 		if (client->ops && client->ops->init) {
 			err = client->ops->init(client);
@@ -217,6 +228,14 @@ int host1x_device_init(struct host1x_device *device)
 		if (client->ops->exit)
 			client->ops->exit(client);
 
+	/* reset client to end of list for late teardown */
+	client = list_entry(&device->clients, struct host1x_client, list);
+
+teardown_late:
+	list_for_each_entry_continue_reverse(client, &device->clients, list)
+		if (client->ops->late_exit)
+			client->ops->late_exit(client);
+
 	mutex_unlock(&device->clients_lock);
 	return err;
 }
@@ -251,6 +270,18 @@ int host1x_device_exit(struct host1x_device *device)
 		}
 	}
 
+	list_for_each_entry_reverse(client, &device->clients, list) {
+		if (client->ops && client->ops->late_exit) {
+			err = client->ops->late_exit(client);
+			if (err < 0) {
+				dev_err(&device->dev, "failed to late cleanup %s: %d\n",
+					dev_name(client->dev), err);
+				mutex_unlock(&device->clients_lock);
+				return err;
+			}
+		}
+	}
+
 	mutex_unlock(&device->clients_lock);
 
 	return 0;
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 5890f91dd286..74970681ecdb 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -31,8 +31,10 @@ u64 host1x_get_dma_mask(struct host1x *host1x);
  * @resume: host1x client resume code
  */
 struct host1x_client_ops {
+	int (*early_init)(struct host1x_client *client);
 	int (*init)(struct host1x_client *client);
 	int (*exit)(struct host1x_client *client);
+	int (*late_exit)(struct host1x_client *client);
 	int (*suspend)(struct host1x_client *client);
 	int (*resume)(struct host1x_client *client);
 };
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
