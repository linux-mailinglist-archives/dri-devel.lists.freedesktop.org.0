Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2278769488E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 15:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A347610E5DD;
	Mon, 13 Feb 2023 14:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BC010E5DD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 14:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676299711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=17iYD86Ql6pEQsYrWnsd0ZD8yFa8I2jvKb8kSAxiHNU=;
 b=N8FCaeRsImu/tXd3PsAGB+bHle4n6+ce2JcJklzA1CurNrh5SuOtEUfbvbEKgZntr0I9/3
 XjFCV8iWl87mSSslIUfvXYAjIl/ZQpZmURMzX0op9S57W/bOUSQLb7U0/Zw+gijUz4NsWM
 SbmgBGRYnflk4mFf9+vpX3f9tw7gcyQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-u3buLfDpNSO537VhRiTqtQ-1; Mon, 13 Feb 2023 09:48:30 -0500
X-MC-Unique: u3buLfDpNSO537VhRiTqtQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 a198-20020ae9e8cf000000b007259083a3c8so7567249qkg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 06:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=17iYD86Ql6pEQsYrWnsd0ZD8yFa8I2jvKb8kSAxiHNU=;
 b=ceIsh7pEIZG+cEcPYo8c8/y7dQDeo/U+oPmt++8m03BQJAvbszBe/ToEZ1bemJ7Y3g
 mWtfjGd98I9jNg87Vy46tgXLHNXQDfO4X3NHBm3WDrhOrrVvycsvuI9Nr8cVECeSCxf7
 r7ij7/AfNCcvjX7GrpRCK5PiMDm7QKktPEZCSEU2wZxxV7J8b44tCXF/ri42YOaz3JG2
 +aRYML9G+GyE+gHY1/XQDTXaMJljd7JP/1aT+O30w2ButVTuDSNLtOWQtLsHTaOXUAN9
 JOd7BhZw8ElcR4Gxc33EnR6nAIhcdaPjchyNjpaHcITvDOTloreHKAF9q9eVHZN4XaBK
 rhSQ==
X-Gm-Message-State: AO0yUKV1jWsIh6ow4gU7UShMfQ6esJoFFJfN1PzD8GrZHe03pBpTw0KN
 fDwT8W/C7PlMKzsFt54nOEidPCrKmQOcQjohyqbfLTfIoTXFQzIAAsU0IeE03kXR+GeL8yTd+MT
 6WoZXwndcVKVa9gs1c4IbzNeMY+/t
X-Received: by 2002:a05:6214:21c7:b0:56e:bc4c:b55d with SMTP id
 d7-20020a05621421c700b0056ebc4cb55dmr2685836qvh.20.1676299709891; 
 Mon, 13 Feb 2023 06:48:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/7zkrBHCIVkrfX9gg0xNDw4iKrhSwi1ktMsBoo1KD7XBP0PBXktes+LN0BxNRs3wH4qM6lKQ==
X-Received: by 2002:a05:6214:21c7:b0:56e:bc4c:b55d with SMTP id
 d7-20020a05621421c700b0056ebc4cb55dmr2685805qvh.20.1676299709626; 
 Mon, 13 Feb 2023 06:48:29 -0800 (PST)
Received: from borg.redhat.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 z187-20020a37b0c4000000b0070638ad5986sm9878111qke.85.2023.02.13.06.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:48:29 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: ogabbay@kernel.org, ttayar@habana.ai, gregkh@linuxfoundation.org,
 dliberman@habana.ai, osharabi@habana.ai, dhirschfeld@habana.ai
Subject: [PATCH] habanalabs: set hl_capture_*_err storage-class-specifier to
 static
Date: Mon, 13 Feb 2023 06:48:14 -0800
Message-Id: <20230213144814.2225707-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports
drivers/accel/habanalabs/common/device.c:2619:6: warning:
  symbol 'hl_capture_hw_err' was not declared. Should it be static?
drivers/accel/habanalabs/common/device.c:2641:6: warning:
  symbol 'hl_capture_fw_err' was not declared. Should it be static?

both are only used in device.c, so they should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/accel/habanalabs/common/device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index fefe70bbbede..a5f5ee102823 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2616,7 +2616,7 @@ void hl_handle_page_fault(struct hl_device *hdev, u64 addr, u16 eng_id, bool is_
 		*event_mask |=  HL_NOTIFIER_EVENT_PAGE_FAULT;
 }
 
-void hl_capture_hw_err(struct hl_device *hdev, u16 event_id)
+static void hl_capture_hw_err(struct hl_device *hdev, u16 event_id)
 {
 	struct hw_err_info *info = &hdev->captured_err_info.hw_err;
 
@@ -2638,7 +2638,7 @@ void hl_handle_critical_hw_err(struct hl_device *hdev, u16 event_id, u64 *event_
 		*event_mask |= HL_NOTIFIER_EVENT_CRITICL_HW_ERR;
 }
 
-void hl_capture_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *fw_info)
+static void hl_capture_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *fw_info)
 {
 	struct fw_err_info *info = &hdev->captured_err_info.fw_err;
 
-- 
2.26.3

