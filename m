Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1654DC761
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 14:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA9510EBBC;
	Thu, 17 Mar 2022 13:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE0810EBBD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 13:16:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id p9so7285043wra.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGNq1VtdAJO1ZeMl0bHx5YJtvGssvSJA1T33fHPp93c=;
 b=AnTZyk5MoAuKy7AgmJRTnAtf/NK/7MDFFNmUOjzE9Xad+y+krrvtyff0a2gHsFnHI6
 gMd9h43ROvJHQz6JtgrI9K54ov6N0nGepsdEYppt6gNmucHT4mh7wXWlqhrEubQG8VEK
 D/BGrat3SSNnlvZ1Cm+nQ79b3AJ+6RkkzQpTGi4vs5B2wbAWzBkDVD49OXmZ06XepDR/
 3K77NgmEY2NXNPNiLEzmLbHDgbURbCtHBV+RLAcgRZyh87bJEzohGU0j2nv8HwXPiTp0
 8smPSc2LRyfJazaWh6ZgyiWWsGFopf1VF5jHSpGiOTg+MzkhwIXCZ/h4SMTfIvTe4JyZ
 B0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGNq1VtdAJO1ZeMl0bHx5YJtvGssvSJA1T33fHPp93c=;
 b=TBTL9bAsROyF+xSIXUVd1J/wo5RTE7OOCOisBtUtuuW3JS4R2mAhlsbYDPSWwuhjDk
 bp8g3pot3XroBjfXosawm5M5NqqvYy8KwvGdEL3bd7rQvoq69a/yLggoUBrEM+JQIp74
 QOEtUr8ELEPITOoa+2xGTdplpizMghEf73FGApPd4z9uQYBeOCiPk2zgUo20NMPJdwbC
 /Rs/knll4bvAzZbivzkpZ46gRDMrqaM+hGdkcbvrxHiTl/69+cLlGRCnRf3DwQGc63/B
 SVo7M+gpPN8spw4+f+wgApzPw4ewwLzn0Ee0hdRKSD2+KvTaJHb1ig2Wqzhay7KtVsjf
 Gbfw==
X-Gm-Message-State: AOAM530Du8ubmHVKWg2qcOuEQ/5euHyAIFl0hHbKs0UtoQ4WA2k+ewkL
 QKDmjW2rh8FxR03QpvMAXswGtw==
X-Google-Smtp-Source: ABdhPJynt03P4guHUS6/f1MTsqVNLGdBo3gyMn10Yy106t9AfOzszR2jg6ZUfbFh/1EyicNos0Pbaw==
X-Received: by 2002:a05:6000:2a6:b0:203:ebe1:2900 with SMTP id
 l6-20020a05600002a600b00203ebe12900mr2169745wry.423.1647522973870; 
 Thu, 17 Mar 2022 06:16:13 -0700 (PDT)
Received: from joneslee-l.cable.virginm.net
 (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a056000184100b00203d72d0f4dsm4715113wri.59.2022.03.17.06.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 06:16:13 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 1/1] drm/amdkfd: Protect the Client whilst it is being
 operated on
Date: Thu, 17 Mar 2022 13:16:10 +0000
Message-Id: <20220317131610.554347-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Presently the Client can be freed whilst still in use.

Use the already provided lock to prevent this.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index e4beebb1c80a2..3b9ac1e87231f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -145,8 +145,11 @@ static int kfd_smi_ev_release(struct inode *inode, struct file *filep)
 	spin_unlock(&dev->smi_lock);
 
 	synchronize_rcu();
+
+	spin_lock(&client->lock);
 	kfifo_free(&client->fifo);
 	kfree(client);
+	spin_unlock(&client->lock);
 
 	return 0;
 }
@@ -247,11 +250,13 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
 		return ret;
 	}
 
+	spin_lock(&client->lock);
 	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
 			       O_RDWR);
 	if (ret < 0) {
 		kfifo_free(&client->fifo);
 		kfree(client);
+		spin_unlock(&client->lock);
 		return ret;
 	}
 	*fd = ret;
@@ -264,6 +269,7 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
 	spin_lock(&dev->smi_lock);
 	list_add_rcu(&client->list, &dev->smi_clients);
 	spin_unlock(&dev->smi_lock);
+	spin_unlock(&client->lock);
 
 	return 0;
 }
-- 
2.35.1.894.gb6a874cedc-goog

