Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ACE5485F4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 17:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7300010E693;
	Mon, 13 Jun 2022 15:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B3510E693
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 15:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655133821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lg3vakZ5MmEjg8bZXE326Smcck6gRwnh7/ISZ1836kM=;
 b=Q3gVmDXCvZwIhgKTGliIGlBcO/6vzD5tFUyusCRTAQfmwC/4I9xOF+M5+tw8TGO1RhlYlP
 F8P6Qk0of6It8daOlN3IwAoxEAdgW6aIBcMulh5L5fjkV0zBY9F7/BqwzZVMaypEI8vdJu
 OzbDPrAhQNolDAZwTFbjxnSxkfAiID4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-e5TjYfdCOFyApFsSW9gn4w-1; Mon, 13 Jun 2022 11:23:40 -0400
X-MC-Unique: e5TjYfdCOFyApFsSW9gn4w-1
Received: by mail-wm1-f71.google.com with SMTP id
 j20-20020a05600c1c1400b0039c747a1e5aso3358969wms.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 08:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lg3vakZ5MmEjg8bZXE326Smcck6gRwnh7/ISZ1836kM=;
 b=UUsE2/QuUffCtwqt0U+qXLDziiefrG/T6CYuljh1HQr4M2j29YswdK+TkEFfyDA0P1
 dDpOClnB9Cf+dkf0S8O4qxmUIH85a80Uu0ijhdXIMFnr2bI7mhwuflQBpzvpx/bYsGLW
 Yo++ee2LbO+QhdxB7THhQenQ1TpachhCjQkpRnkfu4H3c0JTNGekUd6ck0UFl9U+euFG
 ufnEnJG1j/KtS+gE/gPxjftiNhsWtTUP8ZoHAdjBFcbKjSEGuUIBI2GOTtQFnrbdLBwr
 It7vABT/IREMK5AU71wCE/MfK6W9w/LhRKZyccstwwS808C6zdYI+TUh/T1LdCTgoI9o
 2vtw==
X-Gm-Message-State: AOAM531ezysM/8QAs7iVoh+COPpRSQMrYWQP03xwnw++Qp8M1q+BvMAp
 qLAqse4O5FambjFxOyF6OL+yI2duDr25fFi+zw/CcWvjIUxxttOCkeaMOBxExnr+Si6HMN4oWoV
 GjrIHw4FkDsl4vXrOK5RBiRLo/Dc01q56bb4SoEzBkormav2enHMhv/7wAp3Yu2Ro5EqBd/TLaA
 YbV5M=
X-Received: by 2002:a05:600c:4fcb:b0:39c:64cd:cc89 with SMTP id
 o11-20020a05600c4fcb00b0039c64cdcc89mr15478842wmq.197.1655133819223; 
 Mon, 13 Jun 2022 08:23:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcVkDDsBiYJ0RfVv00M0sQ+cnWxRPOqm3mmguucddSYgt6MsUyu9NWYD3hs31oMVyAa7FJ/w==
X-Received: by 2002:a05:600c:4fcb:b0:39c:64cd:cc89 with SMTP id
 o11-20020a05600c4fcb00b0039c64cdcc89mr15478798wmq.197.1655133818857; 
 Mon, 13 Jun 2022 08:23:38 -0700 (PDT)
Received: from p1.Home ([2001:8a0:6724:4500:a69c:e66f:828e:b340])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a5d5401000000b00219e77e489fsm9081263wrv.17.2022.06.13.08.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 08:23:37 -0700 (PDT)
From: Eric Curtin <ecurtin@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] tests/util: Add simpledrm driver
Date: Mon, 13 Jun 2022 16:21:51 +0100
Message-Id: <20220613152149.10971-1-ecurtin@redhat.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ecurtin@redhat.com
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
Cc: Javier Martinez Canillas <fmartine@redhat.com>,
 Eric Curtin <ericcurtin17@gmail.com>, Eric Curtin <ecurtin@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Eric Curtin <ericcurtin17@gmail.com>

Add an entry for the "simpledrm" driver, so that the test utilities
work with the simpledrm driver without passing the -M argument.

Signed-off-by: Eric Curtin <ecurtin@redhat.com>
---
- It's also here, was unsure whether to use MR or email submission
  https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/243
---
 tests/util/kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/util/kms.c b/tests/util/kms.c
index 39a93866..21a61a77 100644
--- a/tests/util/kms.c
+++ b/tests/util/kms.c
@@ -150,6 +150,7 @@ static const char * const modules[] = {
 	"komeda",
 	"imx-dcss",
 	"mxsfb-drm",
+	"simpledrm",
 };
 
 int util_open(const char *device, const char *module)
-- 
2.35.3

