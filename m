Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2DF2DB9D
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A196E2CF;
	Wed, 29 May 2019 11:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3556E02D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 02:01:17 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id go2so324339plb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 19:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pvnMxrKbCnHwfQp2WAN74LexcQsw7QGG+UxEq4Csp7U=;
 b=OiiXKPxOFMk49gkVVGp2aGmEkS4r6je8k0kSjJJ++kiiIz5qhyuSEChAIjSGUlVS8B
 7lOijn2PLxZnv9ZkQch6kGW67DxwDVNuLg8CL1xcsUmZY4Sx5qIe4t10mOMfdb655KVY
 uje5+BRJZ0wQKrp/hXK0NR23vScaA5r85nPClVTrUloSc2lHBzP0AbQxksLNLZo8q4mJ
 MiI60sQDdYKelvd5ZJRbtlTflp0adi9vw0I8lETlVJNVxZO3pYQEpgEwDk1heQ7GS4o7
 3ynKlyKBr5qEZK9bvZtp/aGcrBzG6ZwjX6jc2BiTBs2b9b9zZgOBT/GJnnQBZvoVXMlT
 Luaw==
X-Gm-Message-State: APjAAAXIN7+Soi4b37Vj5x7fcleiotMHLjUXCj5GZwGkBH9fcb25UMEn
 ARRrtGMvLGHgi+/82qoRYyQ=
X-Google-Smtp-Source: APXvYqziL+Wk9gcELY4PK/QjGBkuNLP7foZjEMgf2bPL6GA9rzbuahRKEawbinxkbcQtamA5GteCsQ==
X-Received: by 2002:a17:902:2c43:: with SMTP id
 m61mr29945832plb.315.1559095277045; 
 Tue, 28 May 2019 19:01:17 -0700 (PDT)
Received: from xy-data.openstacklocal
 (ecs-159-138-22-150.compute.hwclouds-dns.com. [159.138.22.150])
 by smtp.gmail.com with ESMTPSA id g83sm18489083pfb.158.2019.05.28.19.01.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 28 May 2019 19:01:16 -0700 (PDT)
From: Young Xiao <92siuyang@gmail.com>
To: patrik.r.jakobsson@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gma500: fix edid memory leak in SDVO
Date: Wed, 29 May 2019 10:02:25 +0800
Message-Id: <1559095345-25538-1-git-send-email-92siuyang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pvnMxrKbCnHwfQp2WAN74LexcQsw7QGG+UxEq4Csp7U=;
 b=n2KKu2RcDPRFrIpFakGYZyBPNk7WBzBQLyKP/9pMr3RF2AYGsGDCwXNfO6r/1CvGpi
 y15Kkbkm0s/AL/ZZ4ggbVJCCWqtzZtLyCV10CoVO7bnnJG/BMKzGpMxpomGYKn4VNaM3
 vbkjkkfl/6grBBAaEzOEgTN6uJCKZb2styzYX0POi2e3ayDsY49UYHzZHQkdbGQ0VkBe
 7hG3lX4OER2PjpwnMlfq/gRfnd6sgiTvgXBWnoomHyCJsrLHKtD6VDqNO4xr5IFHgT6L
 k85reGBMnTRGA0mZpHoyGW09O2lDXiJOCYrsz34i1GY1c5WvKlJebtfQFp+D31Gxem5j
 8rEg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Young Xiao <92siuyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHZhcmlhYmxlIGVkaWQgcmV0dXJuZWQgYnkgcHNiX2ludGVsX3Nkdm9fZ2V0X2VkaWQoKQp3
YXMgbmV2ZXIgZnJlZWQuCgpTaWduZWQtb2ZmLWJ5OiBZb3VuZyBYaWFvIDw5MnNpdXlhbmdAZ21h
aWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX3Nkdm8uYyB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2dtYTUwMC9wc2JfaW50ZWxfc2R2by5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9w
c2JfaW50ZWxfc2R2by5jCmluZGV4IGRkM2NlYzAuLmNjNWZiODUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX3Nkdm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
Z21hNTAwL3BzYl9pbnRlbF9zZHZvLmMKQEAgLTE2NTYsNiArMTY1Niw3IEBAIHN0YXRpYyBib29s
IHBzYl9pbnRlbF9zZHZvX2RldGVjdF9oZG1pX2F1ZGlvKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpCiAJZWRpZCA9IHBzYl9pbnRlbF9zZHZvX2dldF9lZGlkKGNvbm5lY3Rvcik7CiAJ
aWYgKGVkaWQgIT0gTlVMTCAmJiBlZGlkLT5pbnB1dCAmIERSTV9FRElEX0lOUFVUX0RJR0lUQUwp
CiAJCWhhc19hdWRpbyA9IGRybV9kZXRlY3RfbW9uaXRvcl9hdWRpbyhlZGlkKTsKKwlrZnJlZShl
ZGlkKTsKIAogCXJldHVybiBoYXNfYXVkaW87CiB9Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
