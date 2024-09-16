Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B845E97A77B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 20:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0063710E10D;
	Mon, 16 Sep 2024 18:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fBr12bQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9B210E10D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 18:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726512841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DYdRLpzqdM5bU62s7LpHvB1TMxzRZjAddlyxLFaKST8=;
 b=fBr12bQVCRq73RztofaPCmzgx1R2+gQgqFc+Arf6J21Iqz6AgDtk0oirTlLvU0d83xTpnM
 aYmjwsVU6wGgy174R7M3pJ3E8Fp25oBx4o+VdL8GoE7yViDO8kAofMMp69clhKubSHaZp3
 qbSOnCiaKpM8fmyzqGmyGI8KoGQqQcM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-6-P1wwqlOS-pwXmZKb7UJg-1; Mon, 16 Sep 2024 14:53:59 -0400
X-MC-Unique: 6-P1wwqlOS-pwXmZKb7UJg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374b35856aeso1794783f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 11:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726512838; x=1727117638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DYdRLpzqdM5bU62s7LpHvB1TMxzRZjAddlyxLFaKST8=;
 b=uZuhj0Z6NmD/2nWO3R0FhSax+6VrXWjHIEJfCwf0HanMhYuuEbdP503p89ZUyk8Uzd
 RB1MWuBsDxiIvxYs+ZoVjUcWbnU4AlCD+vPFf+FYT1byIbHzSrnV7FkAQZBbZeg3tAIH
 Wqb2Kf1XCCqtH/c/urzyq37vNKmJvtJ8nMecbnLI0mNRXplT6k4YO77KSkQMhEJ1E3Gx
 p0VxWjfNxAI17B8AjjRGEEadzy5JKLj7zbXozBkALzThs86zquR8UnuiY9oFbkYpiDkI
 vUJsnkmCSBkTsA1H6YhFGDvwZhYtYJL52TPeMe2vFDrz5lnneTXRXy4ploNBYLvRkhGn
 MZcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAHXAA2lFRvCwnCAlLnwuqLjgRoj1eqiN39LqZbjJF2MssjXpOarayMYnr32i71R3LS6KhbbiFcy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPTFrj5sGYz1+ZaISBOdCHQyvLdEk7xsAwl2IC9nMzmUbCcUyI
 rjIK5Uw4FyfD221vRtmVXp8NVPbAMrvhqJwJQy6YKihw5M6SRL+mAJzgkNKqCQSnfFlEbOXAzqN
 k/kZ+VW+BX41v2w36/Q2fHN43r5FOjQG0cOUfPX+3sn/E8KvzY9OWXawhajELUnS/Mw==
X-Received: by 2002:adf:e7d1:0:b0:375:c4c7:c7ac with SMTP id
 ffacd0b85a97d-378c2d6165amr8395043f8f.49.1726512837967; 
 Mon, 16 Sep 2024 11:53:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6Mf8ZQb0gRzRUbhnp6yMXQHaZVE9FLP+6u6Z95QWtbSt5GCvcc315G0IA/oD5oam7X041aA==
X-Received: by 2002:adf:e7d1:0:b0:375:c4c7:c7ac with SMTP id
 ffacd0b85a97d-378c2d6165amr8395030f8f.49.1726512837448; 
 Mon, 16 Sep 2024 11:53:57 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d97:9600:c4de:e8e2:392:1c61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b05c984sm118962265e9.11.2024.09.16.11.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 11:53:57 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Philipp Stanner <pstanner@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH] MAINTAINERS: drm/sched: Add new maintainers
Date: Mon, 16 Sep 2024 20:52:00 +0200
Message-ID: <20240916185159.35727-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM's GPU scheduler is arguably in need of more intensive maintenance.
Danilo and Philipp volunteer to help with the maintainership.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10430778c998..fc2d8bf3ee74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7710,6 +7710,8 @@ F:	drivers/gpu/drm/xlnx/
 DRM GPU SCHEDULER
 M:	Luben Tuikov <ltuikov89@gmail.com>
 M:	Matthew Brost <matthew.brost@intel.com>
+M:	Danilo Krummrich <dakr@kernel.org>
+M:	Philipp Stanner <pstanner@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.46.0

