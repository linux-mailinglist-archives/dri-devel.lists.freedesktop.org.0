Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A9F505972
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 16:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E647610EC14;
	Mon, 18 Apr 2022 14:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB82710EBB6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650291530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rU+BOzU7OFMdCRKMQTeeqDo4Ukzfu12ch4PVunTJ6T0=;
 b=ca1POWjE8l1b7UZT1BQ4eNoDQ7LLlLGbgt2yerovioemco0jsAoRdon3U7tPiX3CMl/GAQ
 Eqlw09Q+B4vBPZ/oy6LKJ+Mjrd/srV7TPoXKo07UJ6y27yvs0ERmpK51wkZ6jZGQJsmkNG
 5RTiEIuqMRFC0B1d4h3t/fMhl1H00/4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-gcy_xfNgNY2heTkB2FwrmA-1; Mon, 18 Apr 2022 10:18:49 -0400
X-MC-Unique: gcy_xfNgNY2heTkB2FwrmA-1
Received: by mail-qt1-f200.google.com with SMTP id
 a24-20020ac81098000000b002e1e06a72aeso8577144qtj.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 07:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rU+BOzU7OFMdCRKMQTeeqDo4Ukzfu12ch4PVunTJ6T0=;
 b=6ywb6EE0ecArce6oA2nbuipoojQ1wMca9YAhu06Y1iS8H9YC/LpkFLF8/Kp4mhhdJj
 epKM1/LKBBJRs8JrVj+msDiossjfK/lTjqrmlLkHGFRaC4MI+1XdtLcTdzy9cLLebbM0
 JDWMnhF+OorFBZFIqqaM8roUv7OforfUMPwR64yhpq9kWJ3V7dp50fpGy7J4vnyI0xiA
 tdx8QJoFk4k/73iH6/3TM1C/YLYFTkgPB7m/8uoc2mHm6bVGiqMXhQeVai5K0ihF4Sku
 2k+0iftqwLldKM61RSwaoberu/d90pS65Lc4Y7zpzcOlVukSCkgCY1DUSp2BwlVl77tb
 6P/A==
X-Gm-Message-State: AOAM531c3iDG0gl6uxlxcmnB7tSsrncjvJugDxgRJQFXfdlHRh7Ea5ek
 gWPe0i9Gy6AnnY29J/NxnCWMs/PTvNCA6rdg2R96aybRsdnyjxiWEaBWk0Mtn+ZgjmJlAhn9pB+
 iz9MOl6wupdnVr3MSy3AmEx3nia9U
X-Received: by 2002:ac8:7f06:0:b0:2f1:f823:856a with SMTP id
 f6-20020ac87f06000000b002f1f823856amr5665527qtk.623.1650291528867; 
 Mon, 18 Apr 2022 07:18:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/SQVkTBbtpx6NFVq6KE6yRW7/GHXsA0oi2d+LEGg7hhPI3vQ5/gmQ8L/2ysPbdvyDIKURNQ==
X-Received: by 2002:ac8:7f06:0:b0:2f1:f823:856a with SMTP id
 f6-20020ac87f06000000b002f1f823856amr5665514qtk.623.1650291528603; 
 Mon, 18 Apr 2022 07:18:48 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 d2-20020ac85ac2000000b002e1cc2d363asm7785952qtd.24.2022.04.18.07.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 07:18:48 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/nouveau: change base917c_format from global to static
Date: Mon, 18 Apr 2022 10:18:42 -0400
Message-Id: <20220418141842.296386-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch reports this issue
base917c.c:26:1: warning: symbol 'base917c_format'
  was not declared. Should it be static?

base917c_format is only used in base917.c.  Single
file variables should not be global so change
base917c_format's storage-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/base917c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base917c.c b/drivers/gpu/drm/nouveau/dispnv50/base917c.c
index a1baed4fe0e9..ca260509a4f1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base917c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base917c.c
@@ -22,7 +22,7 @@
 #include "base.h"
 #include "atom.h"
 
-const u32
+static const u32
 base917c_format[] = {
 	DRM_FORMAT_C8,
 	DRM_FORMAT_XRGB8888,
-- 
2.27.0

