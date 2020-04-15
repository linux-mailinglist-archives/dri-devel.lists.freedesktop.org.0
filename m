Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F371A94F0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4A86E8B0;
	Wed, 15 Apr 2020 07:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065A06E8CE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y24so17675458wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZWa+0Oys+vMQm0MRzpu+zoysYIM61WV8KWl6BOTV5TM=;
 b=COiUy+78SV03+5BB4HxAfAXqTsH3Aug+6v795tyzUOTzplfzbun9T8hiRT+MdVCQty
 2VB5ugeoidB2RaLFMz5jr7/F7TdlcaJgL/5VVWQMlWilA/rIQY7N3j/L91YLypZMvNT+
 4BPDkLoLa6sS6q3ET4EIjOziuXV/47BS83tpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZWa+0Oys+vMQm0MRzpu+zoysYIM61WV8KWl6BOTV5TM=;
 b=uJEvXuW4tKv5FEPBIv7+JvQvI0xWATkalELGGGdAIRtIQ0NSggpWLbNQCzFv1VPIbb
 4WHcfc9dWnzJAPhPmoUakVEu9XLO6OcE3hD7idiHob1+NRM7EMLajTfSVShGR4VgR1gp
 Lao1K2pojkTcbmCOSbD551YGGTnxaXVofUX+ItnPdSqXZLdfQNzQzqqMKmMJmv10kKMS
 AOOr/a7FR+q/9bFyEKcPrFz0jybPUgl0BJFQrq9zv6Ekn9hkZsN226rJjkk0Qui9c5LO
 6PFdrMcs1bcg0CMgRi3d2dd/ocrYgtLI+su1E7B4ZJiDhXhIl2vy1lUPXx8bThfmDHS4
 KEXQ==
X-Gm-Message-State: AGi0PuZ6083DdU0lK1c3w0isBxCgIsCAkOQE86fhQmYoQIsrgkJ3OQfH
 AE1NrWTA3hNczKDQRiYeXet0wg==
X-Google-Smtp-Source: APiQypIQlrmcnQ3TzOri+kZR478vwbjnd+j6WkNeCyzansv5PLdEwvtlt1jQ56O3dub3FqnsMnX3zQ==
X-Received: by 2002:a7b:c404:: with SMTP id k4mr3575540wmi.37.1586936498669;
 Wed, 15 Apr 2020 00:41:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:38 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 57/59] drm/ast: Use managed pci functions
Date: Wed, 15 Apr 2020 09:40:32 +0200
Message-Id: <20200415074034.175360-58-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3dzIHVzIHRvIHJlbW92ZSBhIGJpdCBvZiBjbGVhbnVwIGNvZGUuCgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IERhdmUgQWlybGll
IDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52
ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25u
ZXMub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiAiWS5DLiBDaGVuIiA8eWNf
Y2hlbkBhc3BlZWR0ZWNoLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyAg
fCAxMCArKystLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgfCAgMyAtLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X2Rydi5jCmluZGV4IGI3YmEyMmRkZGNhZC4uNDhhOWNjNGUwODBhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9kcnYuYwpAQCAtOTEsMTUgKzkxLDEzIEBAIHN0YXRpYyBpbnQgYXN0X3BjaV9wcm9iZShz
dHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKIAog
CWFzdF9raWNrX291dF9maXJtd2FyZV9mYihwZGV2KTsKIAotCXJldCA9IHBjaV9lbmFibGVfZGV2
aWNlKHBkZXYpOworCXJldCA9IHBjaW1fZW5hYmxlX2RldmljZShwZGV2KTsKIAlpZiAocmV0KQog
CQlyZXR1cm4gcmV0OwogCiAJZGV2ID0gZHJtX2Rldl9hbGxvYygmZHJpdmVyLCAmcGRldi0+ZGV2
KTsKLQlpZiAoSVNfRVJSKGRldikpIHsKLQkJcmV0ID0gUFRSX0VSUihkZXYpOwotCQlnb3RvIGVy
cl9wY2lfZGlzYWJsZV9kZXZpY2U7Ci0JfQorCWlmIChJU19FUlIoZGV2KSkKKwkJcmV0dXJuICBQ
VFJfRVJSKGRldik7CiAKIAlkZXYtPnBkZXYgPSBwZGV2OwogCXBjaV9zZXRfZHJ2ZGF0YShwZGV2
LCBkZXYpOwpAQCAtMTIwLDggKzExOCw2IEBAIHN0YXRpYyBpbnQgYXN0X3BjaV9wcm9iZShzdHJ1
Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKIAlhc3Rf
ZHJpdmVyX3VubG9hZChkZXYpOwogZXJyX2RybV9kZXZfcHV0OgogCWRybV9kZXZfcHV0KGRldik7
Ci1lcnJfcGNpX2Rpc2FibGVfZGV2aWNlOgotCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKIAly
ZXR1cm4gcmV0OwogCiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWlu
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMKaW5kZXggZTUzOThlM2RhYmU3Li4x
YjM1NzI4YWQ4NzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMKQEAgLTUzMSw4ICs1MzEsNSBAQCB2
b2lkIGFzdF9kcml2ZXJfdW5sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJZHJtX21vZGVf
Y29uZmlnX2NsZWFudXAoZGV2KTsKIAogCWFzdF9tbV9maW5pKGFzdCk7Ci0JaWYgKGFzdC0+aW9y
ZWdzICE9IGFzdC0+cmVncyArIEFTVF9JT19NTV9PRkZTRVQpCi0JCXBjaV9pb3VubWFwKGRldi0+
cGRldiwgYXN0LT5pb3JlZ3MpOwotCXBjaV9pb3VubWFwKGRldi0+cGRldiwgYXN0LT5yZWdzKTsK
IAlrZnJlZShhc3QpOwogfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
