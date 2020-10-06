Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC8285447
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 00:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F4F6E5B2;
	Tue,  6 Oct 2020 22:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6EC6E5AB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 22:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602021934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhXf3XDfdJnOL9cVAo1fl4KlATUUXBoOYIcScfg24/M=;
 b=EoGRGL14dMzyQNyvkuUw7dKQ2q16pM3cs89YOk5C8oni/UTy+LHZrH5dTeA936ljjf+b1F
 xUc1yD9nahh3p7JA4QolX+U9VujlPYhjQoGWdG1OYRFPWVVrIh5XeSoRkwMU9XHfUCSAcP
 BIr+/g5pRKUDd8I4IWpv/ylCxZSmPmc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-iEZRazrdPdeIy2jBQjonVg-1; Tue, 06 Oct 2020 18:05:32 -0400
X-MC-Unique: iEZRazrdPdeIy2jBQjonVg-1
Received: by mail-wr1-f69.google.com with SMTP id v5so124869wrr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 15:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XhXf3XDfdJnOL9cVAo1fl4KlATUUXBoOYIcScfg24/M=;
 b=Jg2tmdRobTGc66uG3XJ7dHnqoBmfJ1PUANd9UU9VnS6+qpRX7cJM95ziqrgX9+cc5M
 +XSgmXLUKOg5ZfhlG/VwYem5YvlfM0A+d6X7aPqzwFAyiRyTdAtWV1kbe7oCsF4RcBiX
 zW2arGEI5vhhQWdPd/mf8LzR2Ut+3gjtpK+pn7mgckiTxURRIhVL9jN4ugD9oEIdgH1h
 rXR13EBAUhvw40DFZzGXrOU/C9SsGLzIde/hwP4eGEO8J2/54y7oWR6+YJ1DdQl0+3ea
 s/4jN0E9GTxE6XDLIE4w9EbOsU+04nmHz/IJm6vXYuRGowJKlLcSmPrlkTZSbHpeOp7i
 7DfA==
X-Gm-Message-State: AOAM5312X+Cr+pLhGQMatpFw+5h/KSU8LLA6Te0QCSx0V2e3EouXcL8k
 ypcACVNiRRQycu5c8YI/SRmg3721nQwVKuXfKsx7HEHqIo1z76g2sxTXVheBOLMjmvul0Q65hkJ
 jF74+j/WQ3qsvs575tFk4lgrhkeH+
X-Received: by 2002:adf:93e5:: with SMTP id 92mr35596wrp.31.1602021931665;
 Tue, 06 Oct 2020 15:05:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEDs2BBYdKwmxA/2uH5QpdSlE9hOLmRZqTj6q8cVAbhd3jWvF8FNSMdXXg6cDO1RfYiVl+mw==
X-Received: by 2002:adf:93e5:: with SMTP id 92mr35588wrp.31.1602021931513;
 Tue, 06 Oct 2020 15:05:31 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b088:c000:2bdf:b7aa:eede:d65f])
 by smtp.gmail.com with ESMTPSA id j17sm157785wrw.68.2020.10.06.15.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 15:05:30 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/nouveau/mem: guard against NULL pointer access in
 mem_del
Date: Wed,  7 Oct 2020 00:05:28 +0200
Message-Id: <20201006220528.13925-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006220528.13925-1-kherbst@redhat.com>
References: <20201006220528.13925-1-kherbst@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

other drivers seems to do something similar

Signed-off-by: Karol Herbst <kherbst@redhat.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index b1bb542d31158..e5fae57fffbd1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -176,6 +176,8 @@ void
 nouveau_mem_del(struct ttm_mem_reg *reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
+	if (!mem)
+		return;
 	nouveau_mem_fini(mem);
 	kfree(reg->mm_node);
 	reg->mm_node = NULL;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
