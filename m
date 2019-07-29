Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF7C7A293
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509D66E42C;
	Tue, 30 Jul 2019 07:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B24D89CE3;
 Mon, 29 Jul 2019 08:36:54 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id 4so20235358pld.10;
 Mon, 29 Jul 2019 01:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hx3TEgY39elQOvRZKIYlQACZaQ3s3d5tMJmYsbA0qFg=;
 b=T94cPYW3aqB3Xxf2bSfy+EW2YFTqZPcWzMOtg3XdzuHlLxNUE/zdwA3jNdVuY2ik5X
 2W6o7m7CRlbMeBEGrA9VwGBvXApNoHShYGMFzZSvtrtbyIsBp3e7fEujTCh1jOzyc8IU
 WlPDg1DCEn5ieh+jOsk/EsUzgS836qQs51Yiwdkac0gvlUxPz4LPkvO/31IWaHbpbXeR
 JGxXD50QppjQTSUzeH/L3U7WsScyEM4J1mvyALaCMGpZRhsYznbU/PTqlsJkDAz/i4WQ
 w9kIQ9YOeq8tDBR1bFm2lSk0mGzzdTFK3epJHMX1aAUhFza1BUBoMgNNUws+3gXs/C2/
 rxVw==
X-Gm-Message-State: APjAAAXCOVv9jdqjsVX/piBfJRvYlVXycLjKXLND4Osr6r79HLVo5J7r
 fVp5LkC0+QTsX67Vzi3JlRk=
X-Google-Smtp-Source: APXvYqz0jP2Bf6pvAx3SlTHB23BYM2WveDGGVsJhaXd3i0zzdponpYcgg/rEwUJhrPR9XGrPRwJVDg==
X-Received: by 2002:a17:902:2929:: with SMTP id
 g38mr88476612plb.163.1564389413648; 
 Mon, 29 Jul 2019 01:36:53 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
 by smtp.gmail.com with ESMTPSA id z19sm52920862pgv.35.2019.07.29.01.36.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 01:36:53 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu: drm: radeon: Fix a possible null-pointer dereference in
 radeon_connector_set_property()
Date: Mon, 29 Jul 2019 16:36:44 +0800
Message-Id: <20190729083644.29160-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Approved-At: Tue, 30 Jul 2019 07:55:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hx3TEgY39elQOvRZKIYlQACZaQ3s3d5tMJmYsbA0qFg=;
 b=iST9y/tlbMyiCwmbhHY9FWNkXPObO3xF30WMu+ksVmee+SRojWEPUfrXP+0RzqxskY
 RaRdvHnCaN9Uhnu3AgkBcArypuRqsoEF02Nae/zIr/OIDROVrQAoicdpMpLzT/e0QPh2
 Y/FEu/KbEDb19WdXexYIYZ/YBWbhvx3Sf7WQhDoWwIdjucrP5qt1FWEyGsaGx/8fLYDR
 S5fIwvTmk8gk2FEwDKIs7SQat2v7w9fI8HMlnwrF+1Z/nKVnB1UvdMW3wlbk358O29cZ
 /x4zWC4Ihp96LgkcYWKNXui8P/lCcO1vsgqT+OasJ9I8Eq28/7uJUNT/tS9mcyjYhd57
 7bXQ==
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
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcmFkZW9uX2Nvbm5lY3Rvcl9zZXRfcHJvcGVydHkoKSwgdGhlcmUgaXMgYW4gaWYgc3RhdGVt
ZW50IG9uIGxpbmUgNzQzCnRvIGNoZWNrIHdoZXRoZXIgY29ubmVjdG9yLT5lbmNvZGVyIGlzIE5V
TEw6CiAgICBpZiAoY29ubmVjdG9yLT5lbmNvZGVyKQoKV2hlbiBjb25uZWN0b3ItPmVuY29kZXIg
aXMgTlVMTCwgaXQgaXMgdXNlZCBvbiBsaW5lIDc1NToKICAgIGlmIChjb25uZWN0b3ItPmVuY29k
ZXItPmNydGMpCgpUaHVzLCBhIHBvc3NpYmxlIG51bGwtcG9pbnRlciBkZXJlZmVyZW5jZSBtYXkg
b2NjdXIuCgpUbyBmaXggdGhpcyBidWcsIGNvbm5lY3Rvci0+ZW5jb2RlciBpcyBjaGVja2VkIGJl
Zm9yZSBiZWluZyB1c2VkLgoKVGhpcyBidWcgaXMgZm91bmQgYnkgYSBzdGF0aWMgYW5hbHlzaXMg
dG9vbCBTVENoZWNrIHdyaXR0ZW4gYnkgdXMuCgpTaWduZWQtb2ZmLWJ5OiBKaWEtSnUgQmFpIDxi
YWlqaWFqdTE5OTBAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2Nvbm5lY3RvcnMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nv
bm5lY3RvcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwpp
bmRleCBjNjBkMWE0NGQyMmEuLmI2ODRjZDcxOTYxMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Nvbm5lY3RvcnMuYwpAQCAtNzUyLDcgKzc1Miw3IEBAIHN0YXRpYyBpbnQgcmFk
ZW9uX2Nvbm5lY3Rvcl9zZXRfcHJvcGVydHkoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciwgc3RydWN0CiAKIAkJcmFkZW9uX2VuY29kZXItPm91dHB1dF9jc2MgPSB2YWw7CiAKLQkJaWYg
KGNvbm5lY3Rvci0+ZW5jb2Rlci0+Y3J0YykgeworCQlpZiAoY29ubmVjdG9yLT5lbmNvZGVyICYm
IGNvbm5lY3Rvci0+ZW5jb2Rlci0+Y3J0YykgewogCQkJc3RydWN0IGRybV9jcnRjICpjcnRjICA9
IGNvbm5lY3Rvci0+ZW5jb2Rlci0+Y3J0YzsKIAkJCXN0cnVjdCByYWRlb25fY3J0YyAqcmFkZW9u
X2NydGMgPSB0b19yYWRlb25fY3J0YyhjcnRjKTsKIAotLSAKMi4xNy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
