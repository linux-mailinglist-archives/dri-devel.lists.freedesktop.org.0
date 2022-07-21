Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2057CB24
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 15:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167F111A236;
	Thu, 21 Jul 2022 13:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7AD11296B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658408506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOmD7nAs9F7OxSkYkzWTSYR+3/R6/fZia8Dt8fL8A6I=;
 b=XM30OZSajs79Ezt1Ca70LjIiF+q4w2oerzQJs/4EZNACd3PXlhLcKJCISjYyLyo+H/zSyt
 4OgkMOAkvyI7McHWnaF1uHQjK0ivNe1zknvwyN2Io0jMyF/yeY+Ix0Evh6qq6JAunUndUn
 0IbV3UHw9HD0z0Xt4IYHeH8Ylk6RDxM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-AOaqpKY4PFGDe5TTeCVkeg-1; Thu, 21 Jul 2022 09:01:44 -0400
X-MC-Unique: AOaqpKY4PFGDe5TTeCVkeg-1
Received: by mail-ej1-f69.google.com with SMTP id
 qw22-20020a1709066a1600b0072f43c1f59bso753059ejc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 06:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bOmD7nAs9F7OxSkYkzWTSYR+3/R6/fZia8Dt8fL8A6I=;
 b=Eubv10Pv4Po6zjdhkG4CGpLV4Y/YKocDMQIttdkuo4FCg4Nw0/jsEDZNLwXYdcgR+P
 rvmOLqW7NFj7LkP2qTwfOnbKpQ8jB0l52Iqtu53L1fFlG41OeoGzrVmNGbjEhK+2MpjG
 MqZ3XWRdktHWrFqZZ1GMIbxim3PFHoXKoyxd/rzEVSqoKc/yiYClQpOusVE+Q1KPPI+Y
 AkH7TUgRSmu7zRMYrh0XDWOndTDIjTvvKjRLydPd4+PBSoVVnxl9A3tNG4kFOMnOj73k
 DBdzjuGT2WvlsB68xaZ5XDLn4MIYxJvdp0N86FwhShX0wpRgxYWnlGhlpuE5EGPbsNsR
 tZDQ==
X-Gm-Message-State: AJIora8PNfPedvacHYp7mugDVUvd/mLWXNeVKGcu4S29dRkt4L3GG6Je
 G20P1zZ1RMsoNXXusNwEm1/W1ho7Av/3innc6bvCKDV4B5q41xmuexdfdzkh/WAj7AjZ3bVZLvp
 glZzdsTXif32hjIouP5tujBOPZ6pp
X-Received: by 2002:a17:907:72cb:b0:72b:820a:f09b with SMTP id
 du11-20020a17090772cb00b0072b820af09bmr39522177ejc.335.1658408502891; 
 Thu, 21 Jul 2022 06:01:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTUDkfMV6+YjMFSbP85j+wYdLmnn3J2tOEDOg7E2zpHSnQC642s42tXrtJSN+xVDV7Brl/cw==
X-Received: by 2002:a17:907:72cb:b0:72b:820a:f09b with SMTP id
 du11-20020a17090772cb00b0072b820af09bmr39522151ejc.335.1658408502564; 
 Thu, 21 Jul 2022 06:01:42 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 dk20-20020a0564021d9400b0043a71775903sm955826edb.39.2022.07.21.06.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 06:01:42 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de, mripard@kernel.org, sam@ravnborg.org
Subject: [PATCH drm-misc-next v6 5/5] drm/todo: remove task to rename CMA
 helpers
Date: Thu, 21 Jul 2022 15:01:33 +0200
Message-Id: <20220721130133.829693-6-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721130133.829693-1-dakr@redhat.com>
References: <20220721130133.829693-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both, GEM and FB, CMA helpers were renamed to "GEM DMA" and "FB DMA",
hence the task can be removed.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/todo.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 10bfb50908d1..fd5b3f2fb19e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -343,19 +343,6 @@ converted, except for struct drm_driver.gem_prime_mmap.
 
 Level: Intermediate
 
-Rename CMA helpers to DMA helpers
----------------------------------
-
-CMA (standing for contiguous memory allocator) is really a bit an accident of
-what these were used for first, a much better name would be DMA helpers. In the
-text these should even be called coherent DMA memory helpers (so maybe CDM, but
-no one knows what that means) since underneath they just use dma_alloc_coherent.
-
-Contact: Laurent Pinchart, Daniel Vetter
-
-Level: Intermediate (mostly because it is a huge tasks without good partial
-milestones, not technically itself that challenging)
-
 connector register/unregister fixes
 -----------------------------------
 
-- 
2.36.1

