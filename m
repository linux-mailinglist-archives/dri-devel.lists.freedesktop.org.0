Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B696F21E6
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 03:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45A010EE3A;
	Sat, 29 Apr 2023 01:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6F210EE3A
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 01:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682730835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lxUu3MmKtEAkPDdgovuy1mdTL8nMzHcvM/Q3crl2dXQ=;
 b=e078X2wf/7xzqYKjCRPqB7qIam07J8RKO8XMJ6bC2PPG9xVqjOf8Ae0s5s4m1LFc8MPXNW
 tWBWTymBqBHz3YTRhQAjEKcY4/Iui56+wTnY6epxvkdzUdEH6d2tozDOAWClLxY97N5+N8
 rjVWdBj+5lHit8/nyo+eGKWAxUf9ceg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-cc4CzvrnNJG-SR4um1B87A-1; Fri, 28 Apr 2023 21:13:54 -0400
X-MC-Unique: cc4CzvrnNJG-SR4um1B87A-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-751319bd93cso1107538985a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 18:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682730833; x=1685322833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lxUu3MmKtEAkPDdgovuy1mdTL8nMzHcvM/Q3crl2dXQ=;
 b=ikcz/UsJ83lL5xuwTz1mFjc79ELkBxE4gg7gQ4m8B9u0uooOF7ZLorl1TUd5oX7DjV
 GeQvty56kQvwVbf2QmIlvpEpb6eo5Owya3bigGpFW9vxL1DiwHEsMBS1z8HoXK0JzRSr
 L8tFfyaNC7bs2MLPw0xIvjRcineHOCyXtwosy1AiziRj3DQDljBD6NM1SuX5ZYXeSJ4x
 dd15dne8/F/vo9FMI2CkWT8kHR3rKLlJGiM4wj8554Uz2QBeqgushtUgS7KnCFtaB88v
 c3CoknSu02Ewv9teGxC9i90kziDDllJsv/i9Qd635qkcw0U9F0NdcbAPdFELyy+fbQ8+
 m/rA==
X-Gm-Message-State: AC+VfDzO1EYDxQJBkQrejxIAjHHb4YmJRdKdA3QBfiylEfsLT8p0RzFA
 PdLYaTIIaKHlJau/O87kJkkszJDwRLn8iOarbwaZD+KmR1hRVj/6rDIBb3oTBlF4vcyOVlXjd8H
 VQ9Ita6OdSBbs4tIuKBbDdjJehnKL
X-Received: by 2002:ac8:5b95:0:b0:3e3:9275:17ad with SMTP id
 a21-20020ac85b95000000b003e3927517admr20651663qta.12.1682730833605; 
 Fri, 28 Apr 2023 18:13:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47wQHWzqdZCPnmnzs3TJMwdXQLN9+xR2Qt1w/tzb5WpAKmf0qJd3aRrbCOA0GJUO7+es3Qug==
X-Received: by 2002:ac8:5b95:0:b0:3e3:9275:17ad with SMTP id
 a21-20020ac85b95000000b003e3927517admr20651654qta.12.1682730833343; 
 Fri, 28 Apr 2023 18:13:53 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 ea28-20020a05620a489c00b0074ad0812747sm7143953qkb.77.2023.04.28.18.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 18:13:53 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: airlied@redhat.com
Subject: [PATCH] agp/uninorth: remove unused variable size
Date: Fri, 28 Apr 2023 21:13:44 -0400
Message-Id: <20230429011344.2681089-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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

For ppc64, gcc with W=1 reports
drivers/char/agp/uninorth-agp.c: In function 'uninorth_create_gatt_table':
drivers/char/agp/uninorth-agp.c:372:13: error: variable
  'size' set but not used [-Werror=unused-but-set-variable]
  372 |         int size;
      |             ^~~~

This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/char/agp/uninorth-agp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/char/agp/uninorth-agp.c b/drivers/char/agp/uninorth-agp.c
index 62de7f4ba864..ee67d587cad1 100644
--- a/drivers/char/agp/uninorth-agp.c
+++ b/drivers/char/agp/uninorth-agp.c
@@ -369,7 +369,6 @@ static int uninorth_create_gatt_table(struct agp_bridge_data *bridge)
 {
 	char *table;
 	char *table_end;
-	int size;
 	int page_order;
 	int num_entries;
 	int i;
@@ -383,10 +382,8 @@ static int uninorth_create_gatt_table(struct agp_bridge_data *bridge)
 	table = NULL;
 	i = bridge->aperture_size_idx;
 	temp = bridge->current_size;
-	size = page_order = num_entries = 0;
 
 	do {
-		size = A_SIZE_32(temp)->size;
 		page_order = A_SIZE_32(temp)->page_order;
 		num_entries = A_SIZE_32(temp)->num_entries;
 
-- 
2.27.0

