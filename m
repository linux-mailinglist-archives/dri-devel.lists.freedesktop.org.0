Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0868D22FC0
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 11:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20BD892D7;
	Mon, 20 May 2019 09:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBB2892D7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:07:59 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c6so6891891pfa.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 02:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xEFhsAjZ+Xzcbx2mHUcUiTH2Zxcv+pD6TtDJ+37nOCw=;
 b=awuFg1cw9/l1yy7p4jU0F5AuBqceKBMD3a5yKzTvYr18NCr2mSBL5gzlQCTuVto2O+
 6Httx1DboC9VwKzypiWO870CQIDojgGOH58NdY5JUCob2crbtGmRNbAy75idmRW0dsY3
 RdjVkK8cP474AbGIGyfvJkcWH2ewA0krgZtY+MxxWdeDut1XOcCuee1lxwh9zileWqzI
 WHhrF8caWGegPo+GoB++yp4AZDajNBCvW9N+YyAcFErPV3/Bpic8/RidZE5jpRWc1gk5
 zcrPyFbjCyGO0kjmVeZn0TLCIhNBGKWRYHBkRMg09APFjCkl/Bvoti6MFwS12PaKJaqd
 Awlg==
X-Gm-Message-State: APjAAAXvhz/ni1cKhnIdITtt8YqY3YqkzJXPUIj+BvHqUKgqMvbzpB91
 5HFORBta0osJU5llbG2bfInyLQ==
X-Google-Smtp-Source: APXvYqwqd4qJH6N7Gr6VNXBwWrTXaJZVOL3zSzQQK/VIAilUj4DHIF2KXdm0VmOuIoTm6pT2UMghGQ==
X-Received: by 2002:a63:3ece:: with SMTP id
 l197mr36282516pga.268.1558343279532; 
 Mon, 20 May 2019 02:07:59 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.193])
 by smtp.gmail.com with ESMTPSA id d15sm51671614pfm.186.2019.05.20.02.07.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 02:07:59 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v10 09/11] drm/sun4i: sun6i_mipi_dsi: Add VCC-DSI regulator
 support
Date: Mon, 20 May 2019 14:33:16 +0530
Message-Id: <20190520090318.27570-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190520090318.27570-1-jagan@amarulasolutions.com>
References: <20190520090318.27570-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xEFhsAjZ+Xzcbx2mHUcUiTH2Zxcv+pD6TtDJ+37nOCw=;
 b=pkRCUHr3PbHTjPtc0qjpfo1lrEPZql2aeKEwix+ScaX1hHjAmL8U69LjgqUEDGAHHZ
 vGACrzd6Kmoy1bkgevpRYfNdHQnemycdG4G1VtfGtCdNjhb2as9Ypzh0BOVLPtzBINyi
 lyIN9ZuCYdiVQB/9yqx/RnaZks4NbxiNnbEPg=
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
Cc: bshah@mykolab.com, powerpan@qq.com, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com
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
KysrKwogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmggfCAgMyArKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZp
X21pcGlfZHNpLmMKaW5kZXggNTU4NGU5YzJmOGJkLi5hNWQ3M2EyODNlZDcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCkBAIC0xMTUwLDYgKzExNTAsMTIgQEAgc3RhdGlj
IGludCBzdW42aV9kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJcmV0
dXJuIFBUUl9FUlIoYmFzZSk7CiAJfQogCisJZHNpLT5yZWd1bGF0b3IgPSBkZXZtX3JlZ3VsYXRv
cl9nZXQoZGV2LCAidmNjLWRzaSIpOworCWlmIChJU19FUlIoZHNpLT5yZWd1bGF0b3IpKSB7CisJ
CWRldl9lcnIoZGV2LCAiQ291bGRuJ3QgZ2V0IFZDQy1EU0kgc3VwcGx5XG4iKTsKKwkJcmV0dXJu
IFBUUl9FUlIoZHNpLT5yZWd1bGF0b3IpOworCX0KKwogCWRzaS0+cmVncyA9IGRldm1fcmVnbWFw
X2luaXRfbW1pb19jbGsoZGV2LCAiYnVzIiwgYmFzZSwKIAkJCQkJICAgICAgJnN1bjZpX2RzaV9y
ZWdtYXBfY29uZmlnKTsKIAlpZiAoSVNfRVJSKGRzaS0+cmVncykpIHsKQEAgLTEyMjMsNiArMTIy
OSwxMyBAQCBzdGF0aWMgaW50IHN1bjZpX2RzaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3VuNmlfZHNpX3J1bnRpbWVfcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3Qgc3VuNmlfZHNpICpkc2kgPSBkZXZf
Z2V0X2RydmRhdGEoZGV2KTsKKwlpbnQgZXJyOworCisJZXJyID0gcmVndWxhdG9yX2VuYWJsZShk
c2ktPnJlZ3VsYXRvcik7CisJaWYgKGVycikgeworCQlkZXZfZXJyKGRzaS0+ZGV2LCAiZmFpbGVk
IHRvIGVuYWJsZSBWQ0MtRFNJIHN1cHBseTogJWRcbiIsIGVycik7CisJCXJldHVybiBlcnI7CisJ
fQogCiAJcmVzZXRfY29udHJvbF9kZWFzc2VydChkc2ktPnJlc2V0KTsKIAljbGtfcHJlcGFyZV9l
bmFibGUoZHNpLT5tb2RfY2xrKTsKQEAgLTEyNTUsNiArMTI2OCw3IEBAIHN0YXRpYyBpbnQgX19t
YXliZV91bnVzZWQgc3VuNmlfZHNpX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
CiAKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZHNpLT5tb2RfY2xrKTsKIAlyZXNldF9jb250cm9s
X2Fzc2VydChkc2ktPnJlc2V0KTsKKwlyZWd1bGF0b3JfZGlzYWJsZShkc2ktPnJlZ3VsYXRvcik7
CiAKIAlyZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42
aV9taXBpX2RzaS5oIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmgKaW5k
ZXggMTU2NTIzODU5ZDgyLi5jNzZiNzEyNTlkMmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW42aV9taXBpX2RzaS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42
aV9taXBpX2RzaS5oCkBAIC0xMyw2ICsxMyw4IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVy
Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9taXBpX2RzaS5oPgogCisjaW5jbHVkZSA8bGludXgvcmVn
dWxhdG9yL2NvbnN1bWVyLmg+CisKIHN0cnVjdCBzdW42aV9kc2kgewogCXN0cnVjdCBkcm1fY29u
bmVjdG9yCWNvbm5lY3RvcjsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIJZW5jb2RlcjsKQEAgLTIxLDYg
KzIzLDcgQEAgc3RydWN0IHN1bjZpX2RzaSB7CiAJc3RydWN0IGNsawkJKmJ1c19jbGs7CiAJc3Ry
dWN0IGNsawkJKm1vZF9jbGs7CiAJc3RydWN0IHJlZ21hcAkJKnJlZ3M7CisJc3RydWN0IHJlZ3Vs
YXRvcgkqcmVndWxhdG9yOwogCXN0cnVjdCByZXNldF9jb250cm9sCSpyZXNldDsKIAlzdHJ1Y3Qg
cGh5CQkqZHBoeTsKIAotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
