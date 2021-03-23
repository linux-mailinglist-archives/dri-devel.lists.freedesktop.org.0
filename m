Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D63463AD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95086EBA0;
	Tue, 23 Mar 2021 15:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66F56EB2B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:54:39 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id l18so15843399edc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3U/NAbihKjPec78yWr69VR7pI5Ujcbfohjar0SwT5eo=;
 b=sy4n4+1TM0XlVQslw9IgO6D7RvHtx4wynTfDCpH4T1aQR7DI23WFQU2hojcCY0ppbr
 sUlab9mwouLCO0I39prMIjhw2mBiwc9L30dElLATHbYHTZh1uWz8q/cHJFy6Y/FnwQ61
 rFYRd1n6VV50W3J0c/t7rBA5ECCgs21TQ8gcEM/rhs8xeVse78D2zxVI3BCrgXkx97Kl
 JQ5CQQLmIsvpvhTww08W9zQo8qdU+m8yaUd5MWCYHZlN0ImxpnSwwJrsjmXcRhUWVNaf
 zAYf7bAoGgs6cq3S4WJrL3OdMBr6LryHOrZIGHGBlblu3E2ZPI1G4u7NcXIh78UgehXU
 nsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3U/NAbihKjPec78yWr69VR7pI5Ujcbfohjar0SwT5eo=;
 b=Y6l12v/FIWQvSeIR2sD/E2ZdPj0OCyDiThvjwuxo1csDF/DBQJx9CdPnVhi4WN9hIU
 F0T7+WhVPFZggY/iqWe4JNmswwzPCYIzGxlp0+n8mqg1cV1+bxA/zLHzbkSdGrDbda1A
 liEfXuJSNyPUb8vJbBz/4KpOd/dOvUHtruJX/8QOxesmjzQqDkjoxN/KVPe30FCq1goD
 07MJ0BP1N2sUG43M9vzai/SpZuWMrSqnM2XeimzNyL3mgOfbaylcwQm5BoVrWJnbVjmX
 zwkn5JJ+bBr9f0X5dDyZqcfH38xqfcvygkHbBml4RSLU+eZ4KrfCxoJDXqzofWBh4kUX
 TibA==
X-Gm-Message-State: AOAM533eKVI1TRNlamhv9zSbINYlFGxmj0sf5MlRo9hxSgZmVkTrnXkU
 CPqCefQrXcAs9DpOPxfemAKHqRqw67E=
X-Google-Smtp-Source: ABdhPJyu4OyK/kp7Lwj7uhRyH/8+phKPaM1g5aYEW20nwAimVyXWHfNuYsPv5sGZ5X4EZPsf5kKlVw==
X-Received: by 2002:aa7:c1d5:: with SMTP id d21mr5122128edp.167.1616514878542; 
 Tue, 23 Mar 2021 08:54:38 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id z20sm13005016edd.0.2021.03.23.08.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:54:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 7/9] gpu: host1x: Add early init and late exit callbacks
Date: Tue, 23 Mar 2021 16:54:35 +0100
Message-Id: <20210323155437.513497-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
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
 linux-tegra@vger.kernel.org
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
