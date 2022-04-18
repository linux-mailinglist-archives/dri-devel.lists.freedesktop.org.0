Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D132E505B04
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 17:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556F510E1AF;
	Mon, 18 Apr 2022 15:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E1710E37E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650295698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ih9PEnp4Wjk+k/+TucNV83KQkvF18ND4JmzRmAmOEMs=;
 b=dxf8sj5mHBiFuBn73aATkUbEhNIOZPtb6xOPVQ25BD7HloNiq16uq3cQmzxCKbXlS85rMH
 /W55o8vUXclrhNjoJIwEepMw08OB6Jbjr+RWp9DA/lm6ViTLiOHnWc0UrEBsadVECRSiQ9
 P3IqT2QZv6ZGzIKsmYSEsJY5ChMDzms=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219--Db3hHWgOvC4L66DgvVYvA-1; Mon, 18 Apr 2022 11:28:17 -0400
X-MC-Unique: -Db3hHWgOvC4L66DgvVYvA-1
Received: by mail-qv1-f71.google.com with SMTP id
 30-20020a0c80a1000000b00446218e1bcbso9884096qvb.23
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 08:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ih9PEnp4Wjk+k/+TucNV83KQkvF18ND4JmzRmAmOEMs=;
 b=ZTnm+l88WdZGCFQ8oMqnZijhUzsBcuaXYy0oc/05jc882SitqOc+1GU7sSy/pAFIVx
 5B5Q5EzP/a9v1V39Htvm58FirSp6HdrNC5C/krZZAhOxvwdGNL1/8ZHJb2WKIka16F1B
 cxIRxvPt/o03xdzsHdStU7XclqEn47UTDfzwOTJ41qt6PM1WGKIwAUzeDG061yidy6ML
 P0Ks8BFBx3XZlJlVctaPRh1XNIFvKqGZwEpLXkoviCz/KFGw5FJFbzKKIQVw601H/IH7
 ylyn0F1cmVGMpg+loU5l3bS8I1+PhuZkJ7tGQ/9VvhOIalaM4L71BHxZWX58jpMbgBHi
 SgQA==
X-Gm-Message-State: AOAM530XocSe2V9mU2hJUMoJ739A4N41LQH3FcQMI2AkDACnZFIbSzRX
 MoW+TZD3vKF4dd/P0OKdUh2C1JD3p9NNmQG1gjb4wctSK+Lfuxa9uy2xt57rotgPGJn0nf5fBY4
 OxYUbC6Ud1qX27b8xd0w/JC3lsn2g
X-Received: by 2002:a37:447:0:b0:69e:a2be:f270 with SMTP id
 68-20020a370447000000b0069ea2bef270mr2733225qke.130.1650295696832; 
 Mon, 18 Apr 2022 08:28:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd+rW0DF6snrQAx/DVgdX3YAtlSUyaxLZbHZLhwb0nZYBV6ivGoW0JK0uNu8zwYr3h06hFlQ==
X-Received: by 2002:a37:447:0:b0:69e:a2be:f270 with SMTP id
 68-20020a370447000000b0069ea2bef270mr2733212qke.130.1650295696615; 
 Mon, 18 Apr 2022 08:28:16 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 y66-20020a37af45000000b0067dc0fc539fsm6830397qke.86.2022.04.18.08.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 08:28:16 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/gr/gf100-: change gf108_gr_fwif from global to
 static
Date: Mon, 18 Apr 2022 11:28:10 -0400
Message-Id: <20220418152810.3280502-1-trix@redhat.com>
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
gf108.c:147:1: warning: symbol 'gf108_gr_fwif'
  was not declared. Should it be static?

gf108_gr_fwif is only used in gf108.c.  Single
file variables should not be global so change
gf108_gr_fwif's storage-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
index 030640bb3dca..ab3760e804b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
@@ -143,7 +143,7 @@ gf108_gr = {
 	}
 };
 
-const struct gf100_gr_fwif
+static const struct gf100_gr_fwif
 gf108_gr_fwif[] = {
 	{ -1, gf100_gr_load, &gf108_gr },
 	{ -1, gf100_gr_nofw, &gf108_gr },
-- 
2.27.0

