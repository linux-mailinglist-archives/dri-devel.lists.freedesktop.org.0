Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECBE26C39F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 16:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C58A6E10A;
	Wed, 16 Sep 2020 14:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EAA6E10A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 14:24:09 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g4so6518554edk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FF1GcA0Vb8NPwj+FOyfHWcihsl5BIQJFYGSV3+DLrGY=;
 b=fXYVn14zBDpVtMDlY5PEZGTIFo5ifm+OrV0OhMcreL3ZMKHWyrSIxGXzWwp/WwHWlK
 /XlHNqevXNNxQ77SyTlaGjQH1qxFq1sioauKLT+Jvzs/Z2SOqZWZNycSKbGzmdNWWl3Y
 IlusN7UG9jvW2XTEqk8e/VM5jvIrhH+nVj2w+xR+Od3TJpDZEDCG7PZe1igt34WgEEB/
 JnBuCD2JEwIrMA2seVClHpzi5VDbAdHUOMtf8qV9vSBQ1G4PDmSpLD7yXMIfCzkggc/z
 JHwSPp4DHJbpihR00WgIpAbrPJgtoqeptoPHDAQx2N8DFmFZuHwva89hBCr1xqBUuxCf
 M85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FF1GcA0Vb8NPwj+FOyfHWcihsl5BIQJFYGSV3+DLrGY=;
 b=SphzUZtgCadRnTRavDJ1lWK9QU6xhn3yGAfPja26vYUz7VbxOg1DINwU6C0ektTUL2
 l5vKHhf3LmK81FKJ/dU2OdH2U2qQeGU3Aunp+KXml0RdwWaedXjS4zIkV77+gvQjMLaT
 VhHSB+mzWH6EfEdpoEsqmoWnnOjgNkw6smoOYQUaKXrNjxDWyS9vIla0T3GnYFCvUeNT
 Fkf988sTSoASZZUbxs5zdgEJFN8L61APy4pJDeHWdIA2lSsBL8re8115qpOvNy+p2/Bc
 EKnjBbLPQWcy8aAjpzXqWEZnO2gMfoodlljtgLxfEGFJ7ApNRyVlmtYjvqtiBxZDL3uo
 AMDQ==
X-Gm-Message-State: AOAM5305/UwTbQBf0IySRy15JHtQaS+U5q/GM5YyI/BtwXWFfRNTqvq6
 E6tkn+oZxWJaVIbapNhEgnmY4/4Fph4=
X-Google-Smtp-Source: ABdhPJzGZ7nSggz7HQPzJOSUag9VE2HuHSoQXbmZ9lvCNNo3HuoFGUqPkepzPZP0kQOTbsNruna8dg==
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr27581216edb.219.1600266247950; 
 Wed, 16 Sep 2020 07:24:07 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bf52:574a:7641:226d])
 by smtp.gmail.com with ESMTPSA id f17sm14295076eds.45.2020.09.16.07.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 07:24:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix incorrect TT->SYSTEM move handling
Date: Wed, 16 Sep 2020 16:24:06 +0200
Message-Id: <20200916142406.2379-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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

V2hlbiB3ZSBtb3ZlIGZyb20gdGhlIFNZU1RFTSBkb21haW4gdG8gdGhlIFRUIGRvbWFpbgp3ZSBz
dGlsbCBuZWVkIHRvIHBvdGVudGlhbGx5IGNoYW5nZSB0aGUgY2FjaGluZyBzdGF0ZS4KClRoaXMg
aXMgbW9zdCBsaWtlbHkgdGhlIHNvdXJjZSBvZiBhIGJ1bmNoIG9mIHByb2JsZW1zIHdpdGgKQUdQ
IGFuZCBVU1dDIHRvZ2V0aGVyIHdpdGggaGliZXJuYXRpb24gYW5kIHN3YXAuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNDOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDgg
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
CmluZGV4IGZmYmRjMjBkOGU4ZC4uNWY3ZWZjOTA5NzBlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAg
LTI2NCwxMyArMjY0LDYgQEAgc3RhdGljIGludCB0dG1fYm9faGFuZGxlX21vdmVfbWVtKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCQlpZiAocmV0KQogCQkJCWdvdG8gb3V0X2VycjsK
IAkJfQotCi0JCWlmIChiby0+bWVtLm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0pIHsKLQkJCWlm
IChiZGV2LT5kcml2ZXItPm1vdmVfbm90aWZ5KQotCQkJCWJkZXYtPmRyaXZlci0+bW92ZV9ub3Rp
ZnkoYm8sIGV2aWN0LCBtZW0pOwotCQkJYm8tPm1lbSA9ICptZW07Ci0JCQlnb3RvIG1vdmVkOwot
CQl9CiAJfQogCiAJaWYgKGJkZXYtPmRyaXZlci0+bW92ZV9ub3RpZnkpCkBAIC0yOTMsNyArMjg2
LDYgQEAgc3RhdGljIGludCB0dG1fYm9faGFuZGxlX21vdmVfbWVtKHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqYm8sCiAJCWdvdG8gb3V0X2VycjsKIAl9CiAKLW1vdmVkOgogCWJvLT5ldmljdGVk
ID0gZmFsc2U7CiAKIAljdHgtPmJ5dGVzX21vdmVkICs9IGJvLT5udW1fcGFnZXMgPDwgUEFHRV9T
SElGVDsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
