Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8F6143E0C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 14:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B426ECEB;
	Tue, 21 Jan 2020 13:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07576ECEB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 13:31:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so2980404wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 05:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LCez1RWpkSYZX+SQqc5BY0aPqdFLfLcrLpCezMG9G1U=;
 b=evPs1aDN4XgdkM3QAq0Vt3zo9Zwf43OBhgqIcXmgNiyLJxTUGHMKEg/Q+B7/zi0cGT
 /rsGclHd1Rgfpon12GVdqs3oDyzI+7doJHvMKxOHV5wJ5bf78FDmXA0ueaXnh3FyIEch
 AFFopbx3USU45HE1RCuLdgvP7BCJ4Tu9LgRNXywPtzBa+86OCYeIRJxzQVvg9BUs1Klf
 yriZbJ+3FhBDD6mh3Cqbt6YKOxhPZvuALF7cDuBFFxrnZ4dZ72+gV4T8n0Ti5hTkG/SX
 cAOD5IgSnUEtAssKSH0JR5OrC2+onCXef44thwG7aG0g66Zi6LYXPg6vnVNRSdRm1Qtw
 gv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LCez1RWpkSYZX+SQqc5BY0aPqdFLfLcrLpCezMG9G1U=;
 b=Fd1kwfqDRdNDyCuYZrHVSiMc5+5OU/Ixx1S8pHt/EsNFDYzQiqBo2A9TJNBQWB+wfZ
 ErViXjC57GoZLssE0WcgfDJQcqy5+ar+XbZ5SrRKp/5ILV2mVCpycrnaIrefSC9YXTjX
 3nyK/x5Q/rCmyJpFI5pAbE9lBdLGuFq7e/xhd4XsQMFax43EKwhYVQOzfS+B9sMQKRPM
 h9qWnb4L21/EaCt7dQ1TyNPJQz3UjapgbpEB52DAJnIahYgTs9yhACBqWVTN+LOogyxc
 qRt9AJIhalsJu5esFjzKTQkNj/KC/XAmEhQSkim8z7r4cJJxFf0AR3DnwAbhMCjmommE
 sw4g==
X-Gm-Message-State: APjAAAUqvebS6NUJyBaH4IBU9ouQ+4CpM3oNq0Czf4Uq28dhgYzDZo6W
 4NhXo6AxrsOZcK7yWmqR2Z0B6Bwu
X-Google-Smtp-Source: APXvYqwbpFyuXdPc0OzUce1GbmXL9Ncw4P0r1XmDWJJXqKBj4pmqPvyJ47/giEK1Mke/F6hJ8ellvw==
X-Received: by 2002:a05:600c:108a:: with SMTP id
 e10mr4292921wmd.38.1579613505247; 
 Tue, 21 Jan 2020 05:31:45 -0800 (PST)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x11sm3955284wmg.46.2020.01.21.05.31.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 05:31:44 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: flush the fence on the bo after we individualize the
 reservation object
Date: Tue, 21 Jan 2020 14:31:42 +0100
Message-Id: <20200121133142.928-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogeGluaHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPgoKQXMgd2UgbW92ZSB0aGUgdHRt
X2JvX2luZGl2aWR1YWxpemVfcmVzdigpIHVwd2FyZHMsIHdlIG5lZWQgZmx1c2ggdGhlCmNvcGll
ZCBmZW5jZSB0b28uIE90aGVyd2lzZSB0aGUgZHJpdmVyIGtlZXBzIHdhaXRpbmcgZm9yIGZlbmNl
LgoKcnVuJktpbGwga2ZkdGVzdCwgdGhlbiBwZXJmIHRvcC4KCiAgMjUuNTMlICBbdHRtXSAgICAg
ICAgICAgICAgICAgICAgIFtrXSB0dG1fYm9fZGVsYXllZF9kZWxldGUKICAyNC4yOSUgIFtrZXJu
ZWxdICAgICAgICAgICAgICAgICAgW2tdIGRtYV9yZXN2X3Rlc3Rfc2lnbmFsZWRfcmN1CiAgMTku
NzIlICBba2VybmVsXSAgICAgICAgICAgICAgICAgIFtrXSB3d19tdXRleF9sb2NrCgpGaXg6IDM3
OGUyZDViKCJkcm0vdHRtOiBmaXggdHRtX2JvX2NsZWFudXBfcmVmc19vcl9xdWV1ZSBvbmNlIG1v
cmUiKQpTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFuQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCmluZGV4IDA2ZjZk
NjUwODI3Zi4uMWZiYzM2ZjA1ZDg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAgLTQ5MSw4ICs0OTEs
MTAgQEAgc3RhdGljIHZvaWQgdHRtX2JvX2NsZWFudXBfcmVmc19vcl9xdWV1ZShzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvKQogCiAJCWRtYV9yZXN2X3VubG9jayhiby0+YmFzZS5yZXN2KTsK
IAl9Ci0JaWYgKGJvLT5iYXNlLnJlc3YgIT0gJmJvLT5iYXNlLl9yZXN2KQorCWlmIChiby0+YmFz
ZS5yZXN2ICE9ICZiby0+YmFzZS5fcmVzdikgeworCQl0dG1fYm9fZmx1c2hfYWxsX2ZlbmNlcyhi
byk7CiAJCWRtYV9yZXN2X3VubG9jaygmYm8tPmJhc2UuX3Jlc3YpOworCX0KIAogZXJyb3I6CiAJ
a3JlZl9nZXQoJmJvLT5saXN0X2tyZWYpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
