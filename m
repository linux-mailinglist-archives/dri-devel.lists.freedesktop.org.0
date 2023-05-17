Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D890A706A14
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 15:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430BA10E425;
	Wed, 17 May 2023 13:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A8710E425
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684330914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wHcGhYBK2iclIlw+sklydiMn/Pjzv3gm7joUyvqgdBY=;
 b=YDYR0y/XNHx1tE2X8WIbwBPLO0Ncv4v965tdH9KPy9khjcBsxX0pz+DVF0O0eb1XSdWWaP
 Izl7NjS42ggQz/s/lrS/K9PB0kvqVuBDh18Ary/bslHH/sVY2uzYjfQ5EijY+Kg4v24cVK
 LFI9AL7GhFUjyr6C9FIMjXnVCAzVX/0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-nwRiPmBvNHe5hfAsU8YAFA-1; Wed, 17 May 2023 09:41:47 -0400
X-MC-Unique: nwRiPmBvNHe5hfAsU8YAFA-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7579838b0b3so98646485a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 06:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684330907; x=1686922907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wHcGhYBK2iclIlw+sklydiMn/Pjzv3gm7joUyvqgdBY=;
 b=hZ2TbnaZEhj13uwIFM8Jj69M8KcRmJiDPISY96OPL1vdqavXFRVFKILUNmQECy/MhO
 bMNdi+Gdx8WsPBk8qQHo+7CVquR17zrXJPqwCWP/Z4wncfooNijRZxJsQqsAv4pxLUsf
 YLZdy4RgrGj+n9xmH2/xyEgd5WtgNgNrI0eif04gM1tKxPak+nZhRJ5Njwvpt39VC1uW
 f1V3djcZqTFGKBcylstQS/ZsRhNUhkU5Om4E7sL9KNa5vE7KQt7qRq1oKYZtQGbj1rro
 5OnMmA3XFFUniljAeTYaEaMSbRcS4ZC840xBlnkF8RLv1NlCYUVuJqpGhAPgAw65ISKZ
 k7nQ==
X-Gm-Message-State: AC+VfDwQ6O8KTBSZp0DGzFerpKahMNo2zv434OvPUWjzGY4rNG8lmQKe
 Eq4gb2A/8CJIK3Bi6+9sLz/KY7O5quRjMiuiALlechg3KtL+xwS9cZo7+3FvDVa+TfPN+pyRI6b
 c9WtcYFpZglwG+cqCyaahThmMkXJV
X-Received: by 2002:a05:622a:202:b0:3f3:89cb:55dd with SMTP id
 b2-20020a05622a020200b003f389cb55ddmr59160090qtx.10.1684330906972; 
 Wed, 17 May 2023 06:41:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7P9H5KEBY8S84iUF4a/3/m0k88vgicTNjlT/KZFXAkI7287aVVCJBJ+eHge4KF2P0+od8ukA==
X-Received: by 2002:a05:622a:202:b0:3f3:89cb:55dd with SMTP id
 b2-20020a05622a020200b003f389cb55ddmr59160055qtx.10.1684330906619; 
 Wed, 17 May 2023 06:41:46 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a05620a16cd00b007591cc41ed6sm627842qkn.25.2023.05.17.06.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:41:46 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: airlied@redhat.com, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/mgag200: set variable mgag200_modeset
 storage-class-specifier to static
Date: Wed, 17 May 2023 09:41:40 -0400
Message-Id: <20230517134140.874179-1-trix@redhat.com>
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

smatch reports
drivers/gpu/drm/mgag200/mgag200_drv.c:23:5: warning: symbol
  'mgag200_modeset' was not declared. Should it be static?

This variable is only used in its defining file, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 976f0ab2006b..abddf37f0ea1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -20,7 +20,7 @@
 
 #include "mgag200_drv.h"
 
-int mgag200_modeset = -1;
+static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
-- 
2.27.0

