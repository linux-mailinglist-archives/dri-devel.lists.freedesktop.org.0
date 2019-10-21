Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB9DF79E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 23:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D93C6E27A;
	Mon, 21 Oct 2019 21:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9D26E277
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 21:46:00 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 83so12446205oii.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dtmBYecTmxMYIL93VEKcTUybHl02f54X+UyJdNEnFs0=;
 b=fYet3nMNJj3F52K1ylvGd7+Lcgb9y8lKqSE8Zp+SQhZN9lqbFFkzblBxNmyVVabNLF
 jQNejhBIBF/bhPypb467IYPRQXqBdY+tJr9R118OIzPRShWuHnPwEx6ZHM0+zDNB3Clc
 GW2Xm8SUsnUQ9+V0KguV2MjhTN/gC+29axRqYnftnHRNl69gGA1SimRUHJeJjousSJJQ
 p7wRQMr2FtpaU+c+fvyaM0UPeDd0iOtcreAAwrQh7w9qHoIrpUCALV9z8qwwRFuxERQf
 Qohrpz7HoepMnhfrYxT0jGCzJe4RSQ9fzV+sKBtkNRxpkGZFuCVoNivE/If6cFXG+GY+
 Myvw==
X-Gm-Message-State: APjAAAWndQRK5P57hCw44s4zVVsSFELtxX5rfJfoPjXRlqxeBn8LUeO9
 dfnvGJZ4ZBggMYBg1Aywx21CMaU=
X-Google-Smtp-Source: APXvYqyz1m7uoM6wvUfRplSP1iQymDszqO/9xcsWMNqwVBdfqFtz0UeGdkdMsN8oAPMI7ImLHrZS7A==
X-Received: by 2002:aca:bd08:: with SMTP id n8mr193003oif.107.1571694359449;
 Mon, 21 Oct 2019 14:45:59 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id u130sm4122676oib.56.2019.10.21.14.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 14:45:58 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/cma-helper: Use the dma_*_attr API variant
Date: Mon, 21 Oct 2019 16:45:47 -0500
Message-Id: <20191021214550.1461-4-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021214550.1461-1-robh@kernel.org>
References: <20191021214550.1461-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHJlcGFyYXRpb24gdG8gYWxsb3cgRFJNIENNQSB1c2VycyB0byBhZGp1c3QgdGhlIERNQV9B
VFRSXyogZmxhZ3MsCmNvbnZlcnQgdGhlIENNQSBoZWxwZXIgY29kZSB0byB1c2UgdGhlIGRtYV8q
X2F0dHIgQVBJcyBpbnN0ZWFkIG9mIHRoZQpkbWFfKl93YyB2YXJpYW50cy4KCk9ubHkgdGhlIERN
QV9BVFRSX1dSSVRFX0NPTUJJTkUgYW5kIERNQV9BVFRSX05PX1dBUk4gYXR0cmlidXRlcyBhcmUg
c2V0CmluIHRoaXMgY29tbWl0LCBzbyB0aGVyZSdzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKQ2M6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNj
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBTZWFuIFBhdWwgPHNlYW5A
cG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMg
fCAyMCArKysrKysrKysrKystLS0tLS0tLQogaW5jbHVkZS9kcm0vZHJtX2dlbV9jbWFfaGVscGVy
LmggICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYwppbmRleCAxMmU5OGZiMjgy
MjkuLjRjZWJmZTAxZTZlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21h
X2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYwpAQCAt
NzAsNiArNzAsNyBAQCBfX2RybV9nZW1fY21hX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
LCBzaXplX3Qgc2l6ZSkKIAkJZ290byBlcnJvcjsKIAl9CgorCWNtYV9vYmotPmRtYV9hdHRycyB8
PSBETUFfQVRUUl9OT19XQVJOIHwgRE1BX0FUVFJfV1JJVEVfQ09NQklORTsKIAlyZXR1cm4gY21h
X29iajsKCiBlcnJvcjoKQEAgLTEwMiw4ICsxMDMsOSBAQCBzdHJ1Y3QgZHJtX2dlbV9jbWFfb2Jq
ZWN0ICpkcm1fZ2VtX2NtYV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKIAlpZiAoSVNf
RVJSKGNtYV9vYmopKQogCQlyZXR1cm4gY21hX29iajsKCi0JY21hX29iai0+dmFkZHIgPSBkbWFf
YWxsb2Nfd2MoZHJtLT5kZXYsIHNpemUsICZjbWFfb2JqLT5wYWRkciwKLQkJCQkgICAgICBHRlBf
S0VSTkVMIHwgX19HRlBfTk9XQVJOKTsKKwljbWFfb2JqLT52YWRkciA9IGRtYV9hbGxvY19hdHRy
cyhkcm0tPmRldiwgc2l6ZSwgJmNtYV9vYmotPnBhZGRyLAorCQkJCQkgR0ZQX0tFUk5FTCB8IF9f
R0ZQX05PV0FSTiwKKwkJCQkJIGNtYV9vYmotPmRtYV9hdHRycyk7CiAJaWYgKCFjbWFfb2JqLT52
YWRkcikgewogCQlkZXZfZGJnKGRybS0+ZGV2LCAiZmFpbGVkIHRvIGFsbG9jYXRlIGJ1ZmZlciB3
aXRoIHNpemUgJXp1XG4iLAogCQkJc2l6ZSk7CkBAIC0xODQsOCArMTg2LDkgQEAgdm9pZCBkcm1f
Z2VtX2NtYV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmopCiAJCQlk
bWFfYnVmX3Z1bm1hcChnZW1fb2JqLT5pbXBvcnRfYXR0YWNoLT5kbWFidWYsIGNtYV9vYmotPnZh
ZGRyKTsKIAkJZHJtX3ByaW1lX2dlbV9kZXN0cm95KGdlbV9vYmosIGNtYV9vYmotPnNndCk7CiAJ
fSBlbHNlIGlmIChjbWFfb2JqLT52YWRkcikgewotCQlkbWFfZnJlZV93YyhnZW1fb2JqLT5kZXYt
PmRldiwgY21hX29iai0+YmFzZS5zaXplLAotCQkJICAgIGNtYV9vYmotPnZhZGRyLCBjbWFfb2Jq
LT5wYWRkcik7CisJCWRtYV9mcmVlX2F0dHJzKGdlbV9vYmotPmRldi0+ZGV2LCBjbWFfb2JqLT5i
YXNlLnNpemUsCisJCQkgICAgICAgY21hX29iai0+dmFkZHIsIGNtYV9vYmotPnBhZGRyLAorCQkJ
ICAgICAgIGNtYV9vYmotPmRtYV9hdHRycyk7CiAJfQoKIAlkcm1fZ2VtX29iamVjdF9yZWxlYXNl
KGdlbV9vYmopOwpAQCAtMjc5LDggKzI4Miw5IEBAIHN0YXRpYyBpbnQgZHJtX2dlbV9jbWFfbW1h
cF9vYmooc3RydWN0IGRybV9nZW1fY21hX29iamVjdCAqY21hX29iaiwKIAl2bWEtPnZtX2ZsYWdz
ICY9IH5WTV9QRk5NQVA7CiAJdm1hLT52bV9wZ29mZiA9IDA7CgotCXJldCA9IGRtYV9tbWFwX3dj
KGNtYV9vYmotPmJhc2UuZGV2LT5kZXYsIHZtYSwgY21hX29iai0+dmFkZHIsCi0JCQkgIGNtYV9v
YmotPnBhZGRyLCB2bWEtPnZtX2VuZCAtIHZtYS0+dm1fc3RhcnQpOworCXJldCA9IGRtYV9tbWFw
X2F0dHJzKGNtYV9vYmotPmJhc2UuZGV2LT5kZXYsIHZtYSwgY21hX29iai0+dmFkZHIsCisJCQkg
ICAgIGNtYV9vYmotPnBhZGRyLCB2bWEtPnZtX2VuZCAtIHZtYS0+dm1fc3RhcnQsCisJCQkgICAg
IGNtYV9vYmotPmRtYV9hdHRycyk7CiAJaWYgKHJldCkKIAkJZHJtX2dlbV92bV9jbG9zZSh2bWEp
OwoKQEAgLTQzNCw4ICs0MzgsOCBAQCBzdHJ1Y3Qgc2dfdGFibGUgKmRybV9nZW1fY21hX3ByaW1l
X2dldF9zZ190YWJsZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKIAlpZiAoIXNndCkKIAkJ
cmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CgotCXJldCA9IGRtYV9nZXRfc2d0YWJsZShvYmotPmRl
di0+ZGV2LCBzZ3QsIGNtYV9vYmotPnZhZGRyLAotCQkJICAgICAgY21hX29iai0+cGFkZHIsIG9i
ai0+c2l6ZSk7CisJcmV0ID0gZG1hX2dldF9zZ3RhYmxlX2F0dHJzKG9iai0+ZGV2LT5kZXYsIHNn
dCwgY21hX29iai0+dmFkZHIsCisJCQkgICAgICBjbWFfb2JqLT5wYWRkciwgb2JqLT5zaXplLCBj
bWFfb2JqLT5kbWFfYXR0cnMpOwogCWlmIChyZXQgPCAwKQogCQlnb3RvIG91dDsKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9n
ZW1fY21hX2hlbHBlci5oCmluZGV4IDk0N2FjOTVlYjI0YS4uZDA0MjIxM2MzNTk1IDEwMDY0NAot
LS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9k
cm1fZ2VtX2NtYV9oZWxwZXIuaApAQCAtMjQsNiArMjQsNyBAQCBzdHJ1Y3QgZHJtX2dlbV9jbWFf
b2JqZWN0IHsKCiAJLyogRm9yIG9iamVjdHMgd2l0aCBETUEgbWVtb3J5IGFsbG9jYXRlZCBieSBH
RU0gQ01BICovCiAJdm9pZCAqdmFkZHI7CisJdW5zaWduZWQgbG9uZyBkbWFfYXR0cnM7CiB9OwoK
ICNkZWZpbmUgdG9fZHJtX2dlbV9jbWFfb2JqKGdlbV9vYmopIFwKLS0KMi4yMC4xCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
