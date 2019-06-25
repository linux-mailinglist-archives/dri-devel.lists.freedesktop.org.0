Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C555935
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E009C6E22A;
	Tue, 25 Jun 2019 20:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051E46E223
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:42:15 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z25so29097617edq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0qoaILVhGorWkA4MVIZJIRD577+AXcj1sx4mvW+EhNs=;
 b=rtD563oyhrxjReP61vZpnGZiC0xTiMSPUaq7aalfZ/g+8Ec2eAL1I7u2whwre8TsIW
 HgwYw6ua/5dBRLN28rDr09ChwOItLfuWcH7lKctXlDrG9p4r4tm8KI8vlIGfs/P5GoqJ
 9nU54+woj4vD2fvVhFzp52oqBn41mUqnVZpURpwialm86OX3P+p1UHH1qGqWsIEO1Pn3
 lJw8niV4eCaHd4TJbqrxSCXqiuYga1KimjG2YZATQEpX8bV54hx6iTwhWHiZcfdrvZbD
 bhk1spHLQ4tPIhMU5Ysxd8f+5a1oYbF07hnISZRX1G/MSR7u71y5Y0KP3INxzy/Il6+J
 BwKA==
X-Gm-Message-State: APjAAAWoAb8Bk4mWCQpkJ3Jyb/0vzv9M2UI4Y6+6FHg+SDPedldyiggW
 vUaNaP2SIixH/CJnwmhc1I+W94rug6s=
X-Google-Smtp-Source: APXvYqyufquliH5FF+O0NdYGINvXrA83K2cd9O+DoElh4OxF55wbsj9L2F5Xq2ElOJg5cyxJa3hjgQ==
X-Received: by 2002:a50:94e6:: with SMTP id t35mr507971eda.137.1561495333460; 
 Tue, 25 Jun 2019 13:42:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u9sm5187262edm.71.2019.06.25.13.42.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:42:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/7] gem_bo.resv prime unification, leftovers
Date: Tue, 25 Jun 2019 22:42:01 +0200
Message-Id: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0qoaILVhGorWkA4MVIZJIRD577+AXcj1sx4mvW+EhNs=;
 b=XhkeZ9l1O0h4hWqlaM5jTj8XXKyNHsLSWHVmyDFCaHi5ZaT2knPkHTG9xxPV0PMWBq
 Yd6YQ2cjYm5GMRio6saYEQX0NUIa/k5Zl3S+Y2XXDyK5QWkHrDJ6druS8U+FE7IyFZz+
 aSnOm430Ll5cnVz53EWOfV0MuyEUHJe/8N6H4=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKSGVyZSdzIHRoZSB1bm1lcmdlZCBsZWZ0b3ZlcnMgZnJvbSBteSBiaWcgcHJpbWUg
Y2xlYW51cCBzZXJpZXM6Ci0gdXNpbmcgdGhlIHByZXBhcmVfZmIgaGVscGVyIGluIHZjNCZtc20s
IG5vdyBob3BlZnVsbHkgZml4ZWQgdXAuIFRoZQogIGhlbHBlciBzaG91bGQgYmUgbm93IGV2ZW4g
bW9yZSB1c2VmdWwuCgotIGFtZCZudiBkcml2ZXIgLT5nZW1fcHJpbWVfcmVzX29iaiBjYWxsYmFj
ayByZW1vdmFsLiBJIHRoaW5rIHRoaXMgb25lCiAgbWlnaHQgaGF2ZSBmdW5jdGlvbmFsIGNvbmZs
aWN0cyB3aXRoIEdlcmQncyBwYXRjaCBzZXJpZXMgdG8gZW1iZWQKICBkcm1fZ2VtX29iamVjdCBp
biB0dG1fYm8sIG9yIGF0IGxlYXN0IG5lZWRzIHRvIGJlIHJlLXJldmlld2VkIGJlZm9yZSB3ZQog
IG1lcmdlIHRoZSAybmQgc2VyaWVzLgoKQ29tbWVudHMsIHRlc3RpbmcsIGZlZWRiYWNrIGFzIHVz
dWFsIHZlcnkgbXVjaCB3ZWxjb21lLgoKVGhhbmtzLCBEYW5pZWwKCkRhbmllbCBWZXR0ZXIgKDcp
OgogIGRybS9mYi1oZWxwZXI6IHVzZSBnZW1fYm8ucmVzdiwgbm90IGRtYV9idWYucmVzdiBpbiBw
cmVwYXJlX2ZiCiAgZHJtL21zbTogVXNlIGRybV9nZW1fZmJfcHJlcGFyZV9mYgogIGRybS92YzQ6
IFVzZSBkcm1fZ2VtX2ZiX3ByZXBhcmVfZmIKICBkcm0vcmFkZW9uOiBGaWxsIG91dCBnZW1fb2Jq
ZWN0LT5yZXN2CiAgZHJtL25vdXZlYXU6IEZpbGwgb3V0IGdlbV9vYmplY3QtPnJlc3YKICBkcm0v
YW1kZ3B1OiBGaWxsIG91dCBnZW1fb2JqZWN0LT5yZXN2CiAgZHJtL3ByaW1lOiBEaXRjaCBnZW1f
cHJpbWVfcmVzX29iaiBob29rCgogRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgICAgICAgICAg
ICAgICAgICAgfCAgOSAtLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
bWFfYnVmLmMgIHwgMTcgKy0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZG1hX2J1Zi5oICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYyAgICAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29i
amVjdC5jICAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVs
cGVyLmMgfCAyOSArKysrKysrKysrLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wcmlt
ZS5jICAgICAgICAgICAgICAgICAgfCAgMyAtLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X3BsYW5lLmMgICAgfCAgOCArKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2F0
b21pYy5jICAgICAgICAgICAgIHwgIDggKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2JvLmMgICAgICAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2RybS5jICAgICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
Z2VtLmggICAgICAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9wcmlt
ZS5jICAgICAgfCAgNyAtLS0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMg
ICAgICAgICAgfCAgMiAtLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMg
ICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jICAgICAg
ICB8ICA3IC0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jICAgICAgICAgICAg
ICB8ICA1ICsrLS0KIGluY2x1ZGUvZHJtL2RybV9kcnYuaCAgICAgICAgICAgICAgICAgICAgICAg
IHwgMTIgLS0tLS0tLS0KIDE4IGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDkwIGRl
bGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
