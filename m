Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C7EEC90
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 00:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B67890C9;
	Mon, 29 Apr 2019 22:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B3D88AD9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 22:10:30 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id bi2so942592plb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 15:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yk3vy39U61vGwZYGCZuECzbhOPAwsdahcHFv7xDHLcI=;
 b=crVMsiKgiSnF128B9jv5634ftPL8psvg1l7Im8pXi3EX4V1N79hEZANyrNqOe7bkVQ
 RjmggiqvvRMI95ESJYNeU2+R9JbPFaZnrON88+yOtGYy71KsVVQuUPJKpV2RmwSAT/id
 37pKEmIWnlliin9dgfZUjb4wrf+P+YG3e0T2eHdgwGmF5Jk3PuBILyDEZ75CYJZQMLN8
 ILqaUJQhCcI3emmk/TatSYfSBONsuhGGG5fkvK4EUsb//80hyDCWNeHtVJjO3twFT9vQ
 YQcb1dq0Pul6g5IW1q+So3GV7scPxTASAuYXy+AYOtT9OlHHuaasBR8t8ixECuncE4Ry
 NDIQ==
X-Gm-Message-State: APjAAAWiz6aJgAryfY9shw9PCKgYA6h1rE9LtDixSDOX58jLgqE+o5qu
 kedHw7YiYFpQkPGpSNPyaRhbkTSk
X-Google-Smtp-Source: APXvYqyXBpDJwv2B77UaKzc4iFPWgZ9yWjuzc5BvVrwfMfTyN4FmFp3YaTMvwc7SptjaL0ZctJ+t0Q==
X-Received: by 2002:a17:902:b403:: with SMTP id
 x3mr9727064plr.33.1556575829780; 
 Mon, 29 Apr 2019 15:10:29 -0700 (PDT)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id j7sm10787643pfh.62.2019.04.29.15.10.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 15:10:29 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: allocate fences with GFP_KERNEL
Date: Mon, 29 Apr 2019 15:10:21 -0700
Message-Id: <20190429221021.159784-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yk3vy39U61vGwZYGCZuECzbhOPAwsdahcHFv7xDHLcI=;
 b=KgpxIRHCIZz25vJi3DSIf2jkciEaY5y341cNHCWtTnQJ0LARtCNt6zb7CjdzkjAk66
 TPDH+mXQ0uv8NIC9Kd7Iaj6DmabjKY5vQ+627vc47WWglPzvcpQvNL4/na8F96DG+Pb0
 Ys3Qz3WyCDT7uBU/o34RdekLwgTUQQp4jGCLfxZAzGCh82qJmnmiKuPltRFJ0haqcexl
 kiixLeP6eSPXhl1iGTpQBkU25HzzFeOlVGjFbJnL4niBojryQrlJayU/grKkdZ/3eesu
 JqiZ6rM4AAplA0Rj5i7zvlEfBYVdasgrMsmVY2Ynaok3etHNJPTUargwPBAhqPcakA2U
 ryKg==
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
Cc: Robert Foss <robert.foss@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgd2FzIGNoYW5nZWQgdG8gR0ZQX0FUT01JQyBpbiBjb21taXQgZWMyZjA1NzdjIChhZGQgJiB1
c2UKdmlydGlvX2dwdV9xdWV1ZV9mZW5jZWRfY3RybF9idWZmZXIpIGJlY2F1c2UgdGhlIGFsbG9j
YXRpb24gaGFwcGVuZWQKd2l0aCBhIHNwaW5sb2NrIGhlbGQuICBUaGF0IHdhcyBubyBsb25nZXIg
dHJ1ZSBhZnRlciBjb21taXQKOWZkZDkwYzBmIChhZGQgdmlydGlvX2dwdV9hbGxvY19mZW5jZSgp
KS4KClNpZ25lZC1vZmYtYnk6IENoaWEtSSBXdSA8b2x2YWZmZUBnbWFpbC5jb20+CkNjOiBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2
by5wYWRvdmFuQGNvbGxhYm9yYS5jb20+CkNjOiBSb2JlcnQgRm9zcyA8cm9iZXJ0LmZvc3NAY29s
bGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZmVuY2UuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ZlbmNlLmMKaW5kZXggODdkMTk2NjE5MmY0Li5iNjNl
YTQ3OTdhZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5j
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jCkBAIC03MSw3
ICs3MSw3IEBAIHN0cnVjdCB2aXJ0aW9fZ3B1X2ZlbmNlICp2aXJ0aW9fZ3B1X2ZlbmNlX2FsbG9j
KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYpCiB7CiAJc3RydWN0IHZpcnRpb19ncHVf
ZmVuY2VfZHJpdmVyICpkcnYgPSAmdmdkZXYtPmZlbmNlX2RydjsKIAlzdHJ1Y3QgdmlydGlvX2dw
dV9mZW5jZSAqZmVuY2UgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgdmlydGlvX2dwdV9mZW5jZSks
Ci0JCQkJCQkJR0ZQX0FUT01JQyk7CisJCQkJCQkJR0ZQX0tFUk5FTCk7CiAJaWYgKCFmZW5jZSkK
IAkJcmV0dXJuIGZlbmNlOwogCi0tIAoyLjIxLjAuNTkzLmc1MTFlYzM0NWUxOC1nb29nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
