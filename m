Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5717DC5
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 18:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DF489838;
	Wed,  8 May 2019 16:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BEB8982C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 16:09:42 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id z128so10108669qkb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 09:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F2jyUkK54dAtzW9q8l1lAlimvgbuYWM4fIyCnzJ6lOg=;
 b=rNU+83nTSeBSvwZZlokamp9oo7tHtZHLk0SbHLZ0uSIlSccDreyS2iU/WDsnjNzQPQ
 QdUu7ASsLSXtXPIg0iiR4cXYdREhmCxr0Bc4q7OgbFFzlIe/l0o0ystj4dM648e6Qxu0
 FTsUMutMB2p2NwkWpAHxOGSVklr6bT+EVa86r9+W/F+XkfaADHwcOllQGreiMx7hlBe5
 +4Fn14L+FgbmQmfWNq4nybwAulbxO0vHA3i+OTnS/9H4Z7NtMEzDsqZ2CWW1Qd0qhULr
 4YAJo5Cm66Bx6EaORFCtKsdiPRxEz2Z86BvTnyqIT8q2THEt5Cg3OWyEweM3aBXzpxhy
 EErw==
X-Gm-Message-State: APjAAAXc9zfOdFb2SIGmvcj6b+tS/pqM3RvAIq9Or9hrMLFAY/Szd7ug
 Qes6CC998xIkKP1+HuzZUYtGmDa2SnA=
X-Google-Smtp-Source: APXvYqzRA5IObRuPx+SY8SNlAyq+nRRa4bmVL8DgjSZ9iDXAEVZOvPWti3Ep53uWLeh2NRo1+SzXzA==
X-Received: by 2002:a37:6c81:: with SMTP id
 h123mr29498480qkc.201.1557331781702; 
 Wed, 08 May 2019 09:09:41 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s50sm10936877qts.39.2019.05.08.09.09.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 09:09:41 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/11] drm/rockchip: Use vop_win in vop_win_disable instead
 of vop_win_data
Date: Wed,  8 May 2019 12:09:14 -0400
Message-Id: <20190508160920.144739-10-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190508160920.144739-1-sean@poorly.run>
References: <20190508160920.144739-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2jyUkK54dAtzW9q8l1lAlimvgbuYWM4fIyCnzJ6lOg=;
 b=YZjrGZw4u8UksJvAyaMTuVDWWzwcGobAms8CYvmqGVTNQzjWx1Hs2NxmZRsbQ8Uvd7
 amxnG6rrNuM0R+TDYWmmVRb/whuXLWPYJY1Y2Tt93+PXLZ/66MuhMNS/OUQd1iAdBH5d
 uRtfclY/vY6HiefGGfPOVD9k4p1MDxoANLs/ucwu9yDzjWPFlg1ollOsJMAeK0RyjKvn
 wKn0nF0rNWppHeNYi2zDH+5dMNBIVa1/XEww0rLUGW5Q07HiRTXCQ46Jmv1WSn2+kuAc
 mA3yksNEo40IXs+eVz+YXfRdrFH6ok/60pWp86Qt6C/Qjc00KsQOA2FaDJO41NfcIyZd
 Xm6w==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpDaGFuZ2UgdGhlIGFyZ3Vt
ZW50IHRvIHZvcF93aW5fZGlzYWJsZSB0byB2b3Bfd2luIHRvIGFjY29tb2RhdGUgZnV0dXJlCmNo
YW5nZXMgdG8gdGhlIGZ1bmN0aW9uLgoKQ2hhbmdlcyBpbiB2NDoKLSBBZGRlZCB0byB0aGUgcGF0
Y2hzZXQKClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgfCAxOCArKysr
KysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKaW5k
ZXggZjg5ZDQxNDI1YmUwLi4xNWE1YjQ0ZWI3ZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV92b3AuYwpAQCAtNTQzLDggKzU0MywxMCBAQCBzdGF0aWMgdm9pZCB2
b3BfY29yZV9jbGtzX2Rpc2FibGUoc3RydWN0IHZvcCAqdm9wKQogCWNsa19kaXNhYmxlKHZvcC0+
aGNsayk7CiB9CiAKLXN0YXRpYyB2b2lkIHZvcF93aW5fZGlzYWJsZShzdHJ1Y3Qgdm9wICp2b3As
IGNvbnN0IHN0cnVjdCB2b3Bfd2luX2RhdGEgKndpbikKK3N0YXRpYyB2b2lkIHZvcF93aW5fZGlz
YWJsZShzdHJ1Y3Qgdm9wICp2b3AsIGNvbnN0IHN0cnVjdCB2b3Bfd2luICp2b3Bfd2luKQogewor
CWNvbnN0IHN0cnVjdCB2b3Bfd2luX2RhdGEgKndpbiA9IHZvcF93aW4tPmRhdGE7CisKIAlpZiAo
d2luLT5waHktPnNjbCAmJiB3aW4tPnBoeS0+c2NsLT5leHQpIHsKIAkJVk9QX1NDTF9TRVRfRVhU
KHZvcCwgd2luLCB5cmdiX2hvcl9zY2xfbW9kZSwgU0NBTEVfTk9ORSk7CiAJCVZPUF9TQ0xfU0VU
X0VYVCh2b3AsIHdpbiwgeXJnYl92ZXJfc2NsX21vZGUsIFNDQUxFX05PTkUpOwpAQCAtNjAzLDkg
KzYwNSw4IEBAIHN0YXRpYyBpbnQgdm9wX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0
cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX3N0YXRlKQogCWlmICghb2xkX3N0YXRlIHx8ICFvbGRf
c3RhdGUtPnNlbGZfcmVmcmVzaF9hY3RpdmUpIHsKIAkJZm9yIChpID0gMDsgaSA8IHZvcC0+ZGF0
YS0+d2luX3NpemU7IGkrKykgewogCQkJc3RydWN0IHZvcF93aW4gKnZvcF93aW4gPSAmdm9wLT53
aW5baV07Ci0JCQljb25zdCBzdHJ1Y3Qgdm9wX3dpbl9kYXRhICp3aW4gPSB2b3Bfd2luLT5kYXRh
OwogCi0JCQl2b3Bfd2luX2Rpc2FibGUodm9wLCB3aW4pOworCQkJdm9wX3dpbl9kaXNhYmxlKHZv
cCwgdm9wX3dpbik7CiAJCX0KIAl9CiAJc3Bpbl91bmxvY2soJnZvcC0+cmVnX2xvY2spOwpAQCAt
NzUzLDcgKzc1NCw2IEBAIHN0YXRpYyB2b2lkIHZvcF9wbGFuZV9hdG9taWNfZGlzYWJsZShzdHJ1
Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAkJCQkgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9s
ZF9zdGF0ZSkKIHsKIAlzdHJ1Y3Qgdm9wX3dpbiAqdm9wX3dpbiA9IHRvX3ZvcF93aW4ocGxhbmUp
OwotCWNvbnN0IHN0cnVjdCB2b3Bfd2luX2RhdGEgKndpbiA9IHZvcF93aW4tPmRhdGE7CiAJc3Ry
dWN0IHZvcCAqdm9wID0gdG9fdm9wKG9sZF9zdGF0ZS0+Y3J0Yyk7CiAKIAlpZiAoIW9sZF9zdGF0
ZS0+Y3J0YykKQEAgLTc2MSw3ICs3NjEsNyBAQCBzdGF0aWMgdm9pZCB2b3BfcGxhbmVfYXRvbWlj
X2Rpc2FibGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAKIAlzcGluX2xvY2soJnZvcC0+cmVn
X2xvY2spOwogCi0Jdm9wX3dpbl9kaXNhYmxlKHZvcCwgd2luKTsKKwl2b3Bfd2luX2Rpc2FibGUo
dm9wLCB2b3Bfd2luKTsKIAogCXNwaW5fdW5sb2NrKCZ2b3AtPnJlZ19sb2NrKTsKIH0KQEAgLTE1
OTIsNyArMTU5Miw2IEBAIHN0YXRpYyB2b2lkIHZvcF9kZXN0cm95X2NydGMoc3RydWN0IHZvcCAq
dm9wKQogCiBzdGF0aWMgaW50IHZvcF9pbml0aWFsKHN0cnVjdCB2b3AgKnZvcCkKIHsKLQljb25z
dCBzdHJ1Y3Qgdm9wX2RhdGEgKnZvcF9kYXRhID0gdm9wLT5kYXRhOwogCXN0cnVjdCByZXNldF9j
b250cm9sICphaGJfcnN0OwogCWludCBpLCByZXQ7CiAKQEAgLTE2NTksMTIgKzE2NTgsMTMgQEAg
c3RhdGljIGludCB2b3BfaW5pdGlhbChzdHJ1Y3Qgdm9wICp2b3ApCiAJVk9QX1JFR19TRVQodm9w
LCBtaXNjLCBnbG9iYWxfcmVnZG9uZV9lbiwgMSk7CiAJVk9QX1JFR19TRVQodm9wLCBjb21tb24s
IGRzcF9ibGFuaywgMCk7CiAKLQlmb3IgKGkgPSAwOyBpIDwgdm9wX2RhdGEtPndpbl9zaXplOyBp
KyspIHsKLQkJY29uc3Qgc3RydWN0IHZvcF93aW5fZGF0YSAqd2luID0gJnZvcF9kYXRhLT53aW5b
aV07CisJZm9yIChpID0gMDsgaSA8IHZvcC0+ZGF0YS0+d2luX3NpemU7IGkrKykgeworCQlzdHJ1
Y3Qgdm9wX3dpbiAqdm9wX3dpbiA9ICZ2b3AtPndpbltpXTsKKwkJY29uc3Qgc3RydWN0IHZvcF93
aW5fZGF0YSAqd2luID0gdm9wX3dpbi0+ZGF0YTsKIAkJaW50IGNoYW5uZWwgPSBpICogMiArIDE7
CiAKIAkJVk9QX1dJTl9TRVQodm9wLCB3aW4sIGNoYW5uZWwsIChjaGFubmVsICsgMSkgPDwgNCB8
IGNoYW5uZWwpOwotCQl2b3Bfd2luX2Rpc2FibGUodm9wLCB3aW4pOworCQl2b3Bfd2luX2Rpc2Fi
bGUodm9wLCB2b3Bfd2luKTsKIAkJVk9QX1dJTl9TRVQodm9wLCB3aW4sIGdhdGUsIDEpOwogCX0K
IAotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
