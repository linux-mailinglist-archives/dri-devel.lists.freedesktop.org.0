Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8048707A3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 19:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4729289D67;
	Mon, 22 Jul 2019 17:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D357189D66
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 17:40:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r1so40295166wrl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2eEadTDICSV2Qk9KPFsrvesCyzVBF6U7MCfRL010Yfg=;
 b=jsxK10yYxjwDWHjyAfiengBL4wS/goYq4C017k6W3h2X6fp/DlXGmpiDQp6PJUwxEU
 z0hnMX+5lLwpe8lwA1GYqdabDERgxCsO+0lTVvo9uD3WB2rQhuyTDiZkQkyNzTwImIEQ
 qNru45Eae9R37SE3X2jaLDtiEmjxzZMX3e/k2X0iZ7jmkFw/cj2LiXF7ESQckQM95fTV
 yMUjo57qKeDUUK9gaYEjvV+ZmgeFLfIa2qHMNl9HqPln0nFxknpsrRJUvdcVHz63L5uM
 0CdXLBMlhk7HeDEPsRxjmxL6dH0OZOsq2BHtCwZRAS+PTYnrKt/ASzwJdzPADbXjc9gP
 UwBA==
X-Gm-Message-State: APjAAAXJl5lDVubRxS0tVbw+JEIQ2uFBKV+M1sNi2Heu/35VYXe6qbwH
 r5N472T1H86TKWV0o50ctQQhwYLY
X-Google-Smtp-Source: APXvYqzsYe1fiNN5Y+OBY9yE/3oilj5VIwYccdEACEOkoMKiJ/WUtBQxKfofJUuWjIgkbnvRMMqtsQ==
X-Received: by 2002:adf:f042:: with SMTP id t2mr75332033wro.139.1563817245275; 
 Mon, 22 Jul 2019 10:40:45 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b2sm51844663wrp.72.2019.07.22.10.40.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:40:44 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/vmwgfx: add local DRM_AUTH check for PRIME TO/FROM
 HANDLE
Date: Mon, 22 Jul 2019 18:40:24 +0100
Message-Id: <20190722174025.9830-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722174025.9830-1-emil.l.velikov@gmail.com>
References: <20190722174025.9830-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2eEadTDICSV2Qk9KPFsrvesCyzVBF6U7MCfRL010Yfg=;
 b=r1x46qxMy+B7s22f/bJBQqPHRXfsswbsLgZ4t+dP6XggTg6i8nL07kMhlZ+ranmj2L
 ut+gvP2eZEUXXETYkojH/qBZaHisMUmIMPcPMsQMMsgs1LpwhGw7RWW7jhcFBwVTQkFZ
 dt+z7EPUU1C13/u1sdh3zWP1/p9pmr5NM7AZ5Lv20/Pzj76QM1Ohs3MdGuoho/WToGEy
 W0O39PA5udyYNFVuafDyApoSWb7ICFGSydts62Y7OVR7bV51I/QimAXfWqoVGh63Naus
 Kzi2aJ9ek2rW806MPgy5ErjDwexKk68HyHZgMxkqBbRudzWQWJzdMkHIjhm5e4hauarN
 mrvw==
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
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClJlYWxpc3Rp
Y2FsbHkgbm8gZHJpdmVycywgYnV0IHZtd2dmeCBjYXJlIGFib3V0IHRoZSBEUk1fQVVUSCBmbGFn
IGhlcmUuCgpGb2xsb3ctdXAgd29yayBpbiB0aGlzIGRyaXZlciB3aWxsIHByb3Blcmx5IGlzb2xh
dGUgcHJpbWFyeSBjbGllbnRzIGZyb20KZGlmZmVyZW50IG1hc3RlciByZWFsbXMsIHRodXMgd2Un
bGwgbm8gbG9uZ2VyIG5lZWQgdG8gcGFyc2UgX2FueV8gaW9jdGwKZmxhZ3MuCgpVbnRpbCB0aGF0
IHdvcmsgbGFuZHMsIGFkZCBhIGxvY2FsIHdvcmthcm91bmQuCgpDYzogVk13YXJlIEdyYXBoaWNz
IDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+CkNjOiBUaG9tYXMgSGVsbHN0
cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+ClNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8
ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQpJJ2QgbGlrZSB0byBtZXJnZSB0aGlzIHRo
cm91Z2ggdGhlIGRybS1taXNjIHRyZWUuIEFjayBhbmQgcmIgYXJlCmFwcHJlY2lhdGVkLgoKVGhh
bmtzCkVtaWwKLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyB8IDkgKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuYwppbmRleCAyNzVkOTBmZTJhMjUuLjMyYzE4YmI0ODJhNiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKQEAgLTExMzEsNiArMTEzMSwxNSBAQCBzdGF0aWMgbG9u
ZyB2bXdfZ2VuZXJpY19pb2N0bChzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgaW50IGNtZCwK
IAl9IGVsc2UgaWYgKCFkcm1faW9jdGxfZmxhZ3MobnIsICZmbGFncykpCiAJCXJldHVybiAtRUlO
VkFMOwogCisJLyoKKwkgKiBMaXR0bGUgd29ya2Fyb3VuZCB1bnRpbCB0aGUgdm13Z2Z4IHBhdGNo
ZXMgcHJvdmlkaW5nIGlzb2xhdGlvbiBvZgorCSAqIHByaW1hcnkgY2xpZW50cyBmcm9tIGRpZmZl
cmVudCBtYXN0ZXIgcmVhbG1zIGxhbmRzLgorCSAqIFdpdGggdGhhdCB3b3JrLCB3ZSdsbCBubyBs
b25nZXIgbmVlZCB0byBwYXJzZSBfYW55XyBpb2N0bCBmbGFncy4KKwkgKi8KKwlpZiAobnIgPT0g
MHgyZCAvKiBEUk1fSU9DVExfUFJJTUVfSEFORExFX1RPX0ZEICovIHx8CisJICAgIG5yID09IDB4
MmUgLyogRFJNX0lPQ1RMX1BSSU1FX0ZEX1RPX0hBTkRMRSAqLykKKwkJZmxhZ3MgIT0gRFJNX0FV
VEg7CisKIAl2bWFzdGVyID0gdm13X21hc3Rlcl9jaGVjayhkZXYsIGZpbGVfcHJpdiwgZmxhZ3Mp
OwogCWlmIChJU19FUlIodm1hc3RlcikpIHsKIAkJcmV0ID0gUFRSX0VSUih2bWFzdGVyKTsKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
