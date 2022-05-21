Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84B52FF1E
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 22:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC6D10E040;
	Sat, 21 May 2022 19:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DA510E040
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 19:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653163197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eomylUjoy+pLbbY53zh3vxeaeYYwVLT+/xfRVktypDI=;
 b=hwWEKOj9jaQrdevT3RppfH9O+BYxMLtyINGtRubIievoT3VVq86yJnIcMcz2N410quL694
 IPcNpsSeldaJWWhoGhdh+EsHdx/hmPgWTf/JE4km96IfBYsFgikWKYw6hifG2ZJh1tmysA
 ZUmSybJxcul4RV0LMIzTgcJZCb7fekk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-TzCyRpOfPnCtn44dYzHZnA-1; Sat, 21 May 2022 15:59:51 -0400
X-MC-Unique: TzCyRpOfPnCtn44dYzHZnA-1
Received: by mail-qv1-f69.google.com with SMTP id
 kk13-20020a056214508d00b004622b4b8762so750016qvb.4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 12:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eomylUjoy+pLbbY53zh3vxeaeYYwVLT+/xfRVktypDI=;
 b=eMI3n3wtzhb2XJjkwfktXav+o9jC3zBDnNyk+FnkEJMCGytylxK2Vi9JtOl0mOxsnC
 9qKD7Ym145lPrmOUfJHwEUgqFd0MQRNdKk2IbPHq66bfWh6IxEfELpXC0bY/y8Q6D5sG
 n3r2cONQnv92t6KVyzblEMYQk3LzHCRKUJTNz8gxZubn6eIpTDVoZG/QEKqcAi9g14VD
 48TKynDIeXbPkxRQx8p7eGoyiT4JPlz5q6G1b1Jl6fTA2JzWPnmdK3rjHb5PEkr/V/wZ
 rhiCpJ0N2tHFkxfargS8siwNImEIItbXjAQVbWmLP7TlveZPHmWOfsGhn9oqGAGst3Be
 UMtw==
X-Gm-Message-State: AOAM533BPJx2PoWc5ta0xG28F2sMWTPG5YCyqU0mdW/TIQiKFjXHL4RV
 ZEwKE0b3eOt4TnL7sXkJCtukuPjSJz7aroFJHGghCtpX/6PXIOMzaakR8E6CV5X1J+2n9vdYT+3
 9AnUJfLtjVZlsGa3YKoBRrS/gz9lk
X-Received: by 2002:ad4:5dc1:0:b0:462:194:bc7a with SMTP id
 m1-20020ad45dc1000000b004620194bc7amr9892599qvh.87.1653163190912; 
 Sat, 21 May 2022 12:59:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf919nsR9kr6U7ozrIg7YcLk/jrdGbT7NVDQ6iTc+jPVEWfWOWvuH+VNlWAYwqIEm9/j7Cdg==
X-Received: by 2002:ad4:5dc1:0:b0:462:194:bc7a with SMTP id
 m1-20020ad45dc1000000b004620194bc7amr9892587qvh.87.1653163190629; 
 Sat, 21 May 2022 12:59:50 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 e11-20020ac8490b000000b002f914fa980bsm1747226qtq.79.2022.05.21.12.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 12:59:50 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: deller@gmx.de, tzimmermann@suse.de, javierm@redhat.com,
 boris.ostrovsky@oracle.com, jgross@suse.com
Subject: [PATCH] xen: remove setting of 'transp' parameter
Date: Sat, 21 May 2022 15:59:42 -0400
Message-Id: <20220521195942.645048-1-trix@redhat.com>
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
Cc: Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cppcheck reports
[drivers/video/fbdev/xen-fbfront.c:226]: (style) Assignment of function parameter has no effect outside the function.

The value parameter 'transp' is not used, so setting it can be removed.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/video/fbdev/xen-fbfront.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 3bed357a9870..4d2694d904aa 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -223,7 +223,6 @@ static int xenfb_setcolreg(unsigned regno, unsigned red, unsigned green,
 	red = CNVT_TOHW(red, info->var.red.length);
 	green = CNVT_TOHW(green, info->var.green.length);
 	blue = CNVT_TOHW(blue, info->var.blue.length);
-	transp = CNVT_TOHW(transp, info->var.transp.length);
 #undef CNVT_TOHW
 
 	v = (red << info->var.red.offset) |
-- 
2.27.0

