Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6592222DB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 14:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49756EC4C;
	Thu, 16 Jul 2020 12:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DBC6E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:50:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f139so11493712wmf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ALxFJxCOsfhRpfgYUqqKk9cEKj/CcDBsKp6BwF+PGg=;
 b=mXQ/BtYszJvQdyjczRxZyf4tFdHRaxGLAeyTedcjjcV6YW/FuhB02fjmJ7XGITcMMb
 /TxIkLuBuJlwPrt57cYWRTvoLIiRy4qLmgJsermq1iy2G/SSYJKPa5FPBjen0yK8oPHp
 xD0jmmpOfkAddp1p0bzWWxGxgXjYYUIFLGFIngdBk0zgUPHkQ7SuIVwQ9Os05zA6x5RL
 FW0XDHqlZuHKnrfJAvvu7T3961Scb75N9b8cyZpTsog94LCSlfQMFAnXQJ3etTtNfCfP
 MtFbbc9qIcKMTSN3BgoIlRId1RwAHSyaj/8tZDKrSWTUxku3I1CzVHG1PbxD5qiA3EU+
 JNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ALxFJxCOsfhRpfgYUqqKk9cEKj/CcDBsKp6BwF+PGg=;
 b=ZYEsi/IbIBZv622oPB6WXKi/izCRBLM+FfSKHN9EesOIkpw9kCwekXiv3mIuxYQsw1
 xg9vRGZf9ZeXfzaG0IG3FfQDlPUqAH78IYxsSCwxtolnMzVoMlXwoi2goldk28VmyRgP
 0G93zRR764J1ViVVSg785Y5KEARKueBLa5MB61BbgfEfv76NNiIcpKxoimIfJQfFsd3n
 4wTCDWYOAShXgmfc2jsZrBXeuhZ1OFCSQvrpRZmmOV8Qmrjv6uoujKLQhMPKKuqySTYJ
 BCETWbo3RzN4BikX8mfz8gS9wTd9FWjOpUy0RAqfhpHW73foNrgZ6ywmcP80eeOJ1vOM
 X+zg==
X-Gm-Message-State: AOAM531BksroI0qNpetQDxtR7HE3gwX75YgewFttXCLNpRkPaD+NHclO
 cW20SqPN4bRb1qUTnHrKEQD2Jygt
X-Google-Smtp-Source: ABdhPJyOzHBeHoB4MC5qdwTRvD9GKlLnlXh7o/q5tpXYb1iAdak4dpcxBfOSgSC8I7kprXNolWyPhA==
X-Received: by 2002:a1c:4143:: with SMTP id o64mr4236881wma.11.1594903842258; 
 Thu, 16 Jul 2020 05:50:42 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:efc1:eb01:18eb:bff2])
 by smtp.gmail.com with ESMTPSA id z25sm7669872wmk.28.2020.07.16.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 05:50:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/amdgpu: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Date: Thu, 16 Jul 2020 14:50:33 +0200
Message-Id: <20200716125037.67437-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716125037.67437-1-christian.koenig@amd.com>
References: <20200716125037.67437-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBkb2VzIHN1cHBvcnQgc29tZSBub3QtbWFwYWJsZSByZXNvdXJjZXMsIGJ1dAp0
aG9zZSBhcmUgYWxyZWFkeSBoYW5kbGVkIGNvcnJlY3RseSBpbiB0aGUgc3dpdGNoL2Nhc2UKc3Rh
dGVtZW50IGluIHRoZSBjb2RlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyB8IDExICsrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
YwppbmRleCA0NGZhOGJjNDlkMTguLjBkZDVlODAyMDkxZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYwpAQCAtODQsNyArODQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9p
bml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAog
CXN3aXRjaCAodHlwZSkgewogCWNhc2UgVFRNX1BMX1NZU1RFTToKIAkJLyogU3lzdGVtIG1lbW9y
eSAqLwotCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKKwkJbWFuLT5m
bGFncyA9IDA7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5H
OwogCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKIAkJYnJlYWs7
CkBAIC05MywxMyArOTMsMTIgQEAgc3RhdGljIGludCBhbWRncHVfaW5pdF9tZW1fdHlwZShzdHJ1
Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwKIAkJbWFuLT5mdW5jID0gJmFt
ZGdwdV9ndHRfbWdyX2Z1bmM7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFT
S19DQUNISU5HOwogCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsK
LQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7CisJCW1hbi0+ZmxhZ3Mg
PSAwOwogCQlicmVhazsKIAljYXNlIFRUTV9QTF9WUkFNOgogCQkvKiAiT24tY2FyZCIgdmlkZW8g
cmFtICovCiAJCW1hbi0+ZnVuYyA9ICZhbWRncHVfdnJhbV9tZ3JfZnVuYzsKLQkJbWFuLT5mbGFn
cyA9IFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQgfAotCQkJICAgICBUVE1fTUVNVFlQRV9GTEFHX01B
UFBBQkxFOworCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRDsKIAkJbWFuLT5h
dmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9GTEFHX1VOQ0FDSEVEIHwgVFRNX1BMX0ZMQUdfV0M7
CiAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfV0M7CiAJCWJyZWFrOwpAQCAt
Nzk2LDcgKzc5NSw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2JvX21vdmUoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywgYm9vbCBldmljdCwKICAqLwogc3RhdGljIGludCBhbWRncHVfdHRtX2lv
X21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV9y
ZWcgKm1lbSkKIHsKLQlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5t
YW5bbWVtLT5tZW1fdHlwZV07CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVf
dHRtX2FkZXYoYmRldik7CiAJc3RydWN0IGRybV9tbV9ub2RlICptbV9ub2RlID0gbWVtLT5tbV9u
b2RlOwogCkBAIC04MDUsOCArODAzLDcgQEAgc3RhdGljIGludCBhbWRncHVfdHRtX2lvX21lbV9y
ZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV8KIAltZW0t
PmJ1cy5zaXplID0gbWVtLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVDsKIAltZW0tPmJ1cy5iYXNl
ID0gMDsKIAltZW0tPmJ1cy5pc19pb21lbSA9IGZhbHNlOwotCWlmICghKG1hbi0+ZmxhZ3MgJiBU
VE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFKSkKLQkJcmV0dXJuIC1FSU5WQUw7CisKIAlzd2l0Y2gg
KG1lbS0+bWVtX3R5cGUpIHsKIAljYXNlIFRUTV9QTF9TWVNURU06CiAJCS8qIHN5c3RlbSBtZW1v
cnkgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
