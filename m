Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A058C9877
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 08:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039706E235;
	Thu,  3 Oct 2019 06:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4E26E235
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 06:46:21 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id q7so1067709pfh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 23:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w28l9Bay7xNtt5EXEnd1uzJ8iDtWAmssV5M28OxUAUw=;
 b=Y9AnhH7oEHJqQljnNB687nYR3knmOs3/mTt/H37+rLVxgiyAVvga0Ts8FRcDEI/0tY
 ZjA/LHygKckvbSDR20iOnN7aQj/wV0kIv2BdS1r0demDVoxCkuUl2SGnP2Rf1RCcB595
 boi/vpsOriq7gNjMHWo1SZSS8AvQeKBcxeGCBmqtBNTh1VwfNDAeEGWBYH3JfX2lKUeO
 Rc3qlq/NiTzDxH5AYo2mqZCSE25x2yui/TIUNfqL5XHTNtW0AW2uZBsLepjCSzbrcZvV
 VJeyAVasYKQ7zYF18nYbKynWNVMhuKpIsTyS5b0a4Vuvp3HCv9QeWuij2IdWC8UJRvWm
 L+kw==
X-Gm-Message-State: APjAAAVz03EhdQlkIqRfmN7iL3TWICDWrJ2UKuCmhhjXztd3CepZczho
 ZPrImeVb87cKrrCU8A0NOueFmg==
X-Google-Smtp-Source: APXvYqw9CN7jIsE+MsR2uxNhq5HhPqVzRo1QO/rv7lizgNxxfZvpTowoqU4TBvLm2ucXujxNgqGZOA==
X-Received: by 2002:a17:90a:da05:: with SMTP id
 e5mr8479030pjv.141.1570085180342; 
 Wed, 02 Oct 2019 23:46:20 -0700 (PDT)
Received: from localhost.localdomain ([49.206.203.121])
 by smtp.gmail.com with ESMTPSA id b18sm1423294pfi.157.2019.10.02.23.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 23:46:19 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v11 5/7] drm/sun4i: sun6i_mipi_dsi: Add VCC-DSI regulator
 support
Date: Thu,  3 Oct 2019 12:15:25 +0530
Message-Id: <20191003064527.15128-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191003064527.15128-1-jagan@amarulasolutions.com>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w28l9Bay7xNtt5EXEnd1uzJ8iDtWAmssV5M28OxUAUw=;
 b=KQ2LkOEKTiO6GSVyAcVCwmI6tIIYuy7DboEUKeXPS7BzMWxfmXMGK4XlY2+G43azj7
 lbWDLABCj1KDR3VPgHd0Ok/LMU8p7VvOv86DtsxVtqDxwFP7arJNy173b+On2ikOKiuc
 bLXmZaGH5ckchLB7pXN2xEm6b/fYaac9AJj/o=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsd2lubmVyIE1JUEkgRFNJIGNvbnRyb2xsZXJzIGFyZSBzdXBwbGllZCB3aXRoIFNvQwpEU0kg
cG93ZXIgcmFpbHMgdmlhIFZDQy1EU0kgcGluLgoKQWRkIHN1cHBvcnQgZm9yIHRoaXMgc3VwcGx5
IHBpbiBieSBhZGRpbmcgdm9sdGFnZQpyZWd1bGF0b3IgaGFuZGxpbmcgY29kZSB0byBNSVBJIERT
SSBkcml2ZXIuCgpUZXN0ZWQtYnk6IE1lcmxpam4gV2FqZXIgPG1lcmxpam5Ad2l6enVwLm9yZz4K
U2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgfCAxNCArKysrKysrKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmggfCAgMiArKwogMiBm
aWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlf
bWlwaV9kc2kuYwppbmRleCA0NDZkYzU2Y2M0NGIuLmZlOWEzNjY3ZjNhMSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKQEAgLTExMTAsNiArMTExMCwxMiBAQCBzdGF0aWMg
aW50IHN1bjZpX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1
cm4gUFRSX0VSUihiYXNlKTsKIAl9CiAKKwlkc2ktPnJlZ3VsYXRvciA9IGRldm1fcmVndWxhdG9y
X2dldChkZXYsICJ2Y2MtZHNpIik7CisJaWYgKElTX0VSUihkc2ktPnJlZ3VsYXRvcikpIHsKKwkJ
ZGV2X2VycihkZXYsICJDb3VsZG4ndCBnZXQgVkNDLURTSSBzdXBwbHlcbiIpOworCQlyZXR1cm4g
UFRSX0VSUihkc2ktPnJlZ3VsYXRvcik7CisJfQorCiAJZHNpLT5yZWdzID0gZGV2bV9yZWdtYXBf
aW5pdF9tbWlvX2NsayhkZXYsICJidXMiLCBiYXNlLAogCQkJCQkgICAgICAmc3VuNmlfZHNpX3Jl
Z21hcF9jb25maWcpOwogCWlmIChJU19FUlIoZHNpLT5yZWdzKSkgewpAQCAtMTE4Myw2ICsxMTg5
LDEzIEBAIHN0YXRpYyBpbnQgc3VuNmlfZHNpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdW42aV9kc2lfcnVudGltZV9yZXN1
bWUoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBzdW42aV9kc2kgKmRzaSA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOworCWludCBlcnI7CisKKwllcnIgPSByZWd1bGF0b3JfZW5hYmxlKGRz
aS0+cmVndWxhdG9yKTsKKwlpZiAoZXJyKSB7CisJCWRldl9lcnIoZHNpLT5kZXYsICJmYWlsZWQg
dG8gZW5hYmxlIFZDQy1EU0kgc3VwcGx5OiAlZFxuIiwgZXJyKTsKKwkJcmV0dXJuIGVycjsKKwl9
CiAKIAlyZXNldF9jb250cm9sX2RlYXNzZXJ0KGRzaS0+cmVzZXQpOwogCWNsa19wcmVwYXJlX2Vu
YWJsZShkc2ktPm1vZF9jbGspOwpAQCAtMTIxNSw2ICsxMjI4LDcgQEAgc3RhdGljIGludCBfX21h
eWJlX3VudXNlZCBzdW42aV9kc2lfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikK
IAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShkc2ktPm1vZF9jbGspOwogCXJlc2V0X2NvbnRyb2xf
YXNzZXJ0KGRzaS0+cmVzZXQpOworCXJlZ3VsYXRvcl9kaXNhYmxlKGRzaS0+cmVndWxhdG9yKTsK
IAogCXJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZp
X21pcGlfZHNpLmggYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuaAppbmRl
eCA1YzNhZDViZTA2OTAuLmEwMWQ0NGU5ZTQ2MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjZpX21pcGlfZHNpLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZp
X21pcGlfZHNpLmgKQEAgLTEyLDYgKzEyLDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2Nvbm5lY3Rv
ci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZW5jb2Rlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fbWlw
aV9kc2kuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KIAogI2RlZmlu
ZSBTVU42SV9EU0lfVENPTl9ESVYJNAogCkBAIC0yMyw2ICsyNCw3IEBAIHN0cnVjdCBzdW42aV9k
c2kgewogCXN0cnVjdCBjbGsJCSpidXNfY2xrOwogCXN0cnVjdCBjbGsJCSptb2RfY2xrOwogCXN0
cnVjdCByZWdtYXAJCSpyZWdzOworCXN0cnVjdCByZWd1bGF0b3IJKnJlZ3VsYXRvcjsKIAlzdHJ1
Y3QgcmVzZXRfY29udHJvbAkqcmVzZXQ7CiAJc3RydWN0IHBoeQkJKmRwaHk7CiAKLS0gCjIuMTgu
MC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
