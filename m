Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C903D1D6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 18:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA8289249;
	Tue, 11 Jun 2019 16:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28D789249
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:10:12 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z24so1981221qtj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y0ji3mKIAYcSnIWYhM5qOS31Zm4Q2kAhyujo/uy/6OQ=;
 b=mbf6h1Jsc9G3xtN35oFyzgvr5PyyVDauUprEO+uWfODv4ffgZIx78V6mDuJUZ0jbz2
 CPIrhMdyMWB1mkzApnByCJ3cOU/UIntJ02T6JCdrnrwhYm6YKQlXGSbsuoS4DIzTuqS4
 mH3Kmf5dg/plOZ26EWDYhHgoIbfA1vnoH5RYhpG/mAdjEAxmqWgitwMjh189Evdz24Fp
 p8C8x+EbZKmYM9gId+LwRT8I6C0Fkw+WLK3olBvpQUnjo3ePxFI7uo5xLHzesNQP7AYJ
 eFzXWH62Bum7yWjo430TaV86l1Dviw9i7/73ct1otl5VcaS6SdedP4QrovNjnm0DHqtn
 acMg==
X-Gm-Message-State: APjAAAXqnhUVJiLhEwgGMzAd0ZPBkbg3toDUsa1TDe3aMnfatXcLpbwY
 ATo/P4TuoZf/ntxOYzMIxgNI15y6Ae4=
X-Google-Smtp-Source: APXvYqyHMF+ZJxzYd8cMw/QOp3PUxz7ml6n+jLON30GeWk/Yh7Dvy6bfD8J91b1quglXDDS+ZAXpZQ==
X-Received: by 2002:ac8:6895:: with SMTP id m21mr50345039qtq.295.1560269411808; 
 Tue, 11 Jun 2019 09:10:11 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d188sm6755094qkf.40.2019.06.11.09.10.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 09:10:11 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 09/11] drm/rockchip: Use vop_win in vop_win_disable instead
 of vop_win_data
Date: Tue, 11 Jun 2019 12:08:23 -0400
Message-Id: <20190611160844.257498-10-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611160844.257498-1-sean@poorly.run>
References: <20190611160844.257498-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y0ji3mKIAYcSnIWYhM5qOS31Zm4Q2kAhyujo/uy/6OQ=;
 b=fM3KZbrpaFihyjRRXhQ0f28oOq0IjYkGF+uxYZU4Q5nzMuDevEJzTpIBsTCpetx0JG
 KIwuDEXjPUETg16u13Fi1o/o2tSRmY08FEa4NVp/CfvYB128jFlhMFh/eTCGNqf1+tuI
 LePTBxK5gJRFZo06jtNR+HfmtBszYL3cy7fdmxIERnMhDov4Z4iv4fnqQq554U50tqx2
 ZvepiqoolL3BNq3DoJwiCERsH7XYFjoqbzLFwTNL+UvXXqYOEAHgiiJRVYoCcaaoXR+u
 tdxXWVyq+155asFBinX7tbF4zSJB5FHJl2B7A1rWEG72LWu6O4/59I5lPxDyr1UryyEr
 Rn6A==
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
Cc: David Airlie <airlied@linux.ie>, linux-rockchip@lists.infradead.org,
 Sean Paul <seanpaul@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpDaGFuZ2UgdGhlIGFyZ3Vt
ZW50IHRvIHZvcF93aW5fZGlzYWJsZSB0byB2b3Bfd2luIHRvIGFjY29tb2RhdGUgZnV0dXJlCmNo
YW5nZXMgdG8gdGhlIGZ1bmN0aW9uLgoKQ2hhbmdlcyBpbiB2NDoKLSBBZGRlZCB0byB0aGUgcGF0
Y2hzZXQKQ2hhbmdlcyBpbiB2NToKLSBOb25lCgpMaW5rIHRvIHY0OiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA1MDgxNjA5MjAuMTQ0NzM5LTEwLXNl
YW5AcG9vcmx5LnJ1bgoKVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRl
PgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jIHwgMTggKysrKysrKysr
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCmluZGV4IDFm
Zjc5YjJmOWFmYTguLjgzYzY4ODRmNTU4ZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX2RybV92b3AuYwpAQCAtNTM4LDggKzUzOCwxMCBAQCBzdGF0aWMgdm9pZCB2b3Bf
Y29yZV9jbGtzX2Rpc2FibGUoc3RydWN0IHZvcCAqdm9wKQogCWNsa19kaXNhYmxlKHZvcC0+aGNs
ayk7CiB9CiAKLXN0YXRpYyB2b2lkIHZvcF93aW5fZGlzYWJsZShzdHJ1Y3Qgdm9wICp2b3AsIGNv
bnN0IHN0cnVjdCB2b3Bfd2luX2RhdGEgKndpbikKK3N0YXRpYyB2b2lkIHZvcF93aW5fZGlzYWJs
ZShzdHJ1Y3Qgdm9wICp2b3AsIGNvbnN0IHN0cnVjdCB2b3Bfd2luICp2b3Bfd2luKQogeworCWNv
bnN0IHN0cnVjdCB2b3Bfd2luX2RhdGEgKndpbiA9IHZvcF93aW4tPmRhdGE7CisKIAlpZiAod2lu
LT5waHktPnNjbCAmJiB3aW4tPnBoeS0+c2NsLT5leHQpIHsKIAkJVk9QX1NDTF9TRVRfRVhUKHZv
cCwgd2luLCB5cmdiX2hvcl9zY2xfbW9kZSwgU0NBTEVfTk9ORSk7CiAJCVZPUF9TQ0xfU0VUX0VY
VCh2b3AsIHdpbiwgeXJnYl92ZXJfc2NsX21vZGUsIFNDQUxFX05PTkUpOwpAQCAtNTk4LDkgKzYw
MCw4IEBAIHN0YXRpYyBpbnQgdm9wX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVj
dCBkcm1fY3J0Y19zdGF0ZSAqb2xkX3N0YXRlKQogCWlmICghb2xkX3N0YXRlIHx8ICFvbGRfc3Rh
dGUtPnNlbGZfcmVmcmVzaF9hY3RpdmUpIHsKIAkJZm9yIChpID0gMDsgaSA8IHZvcC0+ZGF0YS0+
d2luX3NpemU7IGkrKykgewogCQkJc3RydWN0IHZvcF93aW4gKnZvcF93aW4gPSAmdm9wLT53aW5b
aV07Ci0JCQljb25zdCBzdHJ1Y3Qgdm9wX3dpbl9kYXRhICp3aW4gPSB2b3Bfd2luLT5kYXRhOwog
Ci0JCQl2b3Bfd2luX2Rpc2FibGUodm9wLCB3aW4pOworCQkJdm9wX3dpbl9kaXNhYmxlKHZvcCwg
dm9wX3dpbik7CiAJCX0KIAl9CiAJc3Bpbl91bmxvY2soJnZvcC0+cmVnX2xvY2spOwpAQCAtNzQ4
LDcgKzc0OSw2IEBAIHN0YXRpYyB2b2lkIHZvcF9wbGFuZV9hdG9taWNfZGlzYWJsZShzdHJ1Y3Qg
ZHJtX3BsYW5lICpwbGFuZSwKIAkJCQkgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9z
dGF0ZSkKIHsKIAlzdHJ1Y3Qgdm9wX3dpbiAqdm9wX3dpbiA9IHRvX3ZvcF93aW4ocGxhbmUpOwot
CWNvbnN0IHN0cnVjdCB2b3Bfd2luX2RhdGEgKndpbiA9IHZvcF93aW4tPmRhdGE7CiAJc3RydWN0
IHZvcCAqdm9wID0gdG9fdm9wKG9sZF9zdGF0ZS0+Y3J0Yyk7CiAKIAlpZiAoIW9sZF9zdGF0ZS0+
Y3J0YykKQEAgLTc1Niw3ICs3NTYsNyBAQCBzdGF0aWMgdm9pZCB2b3BfcGxhbmVfYXRvbWljX2Rp
c2FibGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAKIAlzcGluX2xvY2soJnZvcC0+cmVnX2xv
Y2spOwogCi0Jdm9wX3dpbl9kaXNhYmxlKHZvcCwgd2luKTsKKwl2b3Bfd2luX2Rpc2FibGUodm9w
LCB2b3Bfd2luKTsKIAogCXNwaW5fdW5sb2NrKCZ2b3AtPnJlZ19sb2NrKTsKIH0KQEAgLTE1ODcs
NyArMTU4Nyw2IEBAIHN0YXRpYyB2b2lkIHZvcF9kZXN0cm95X2NydGMoc3RydWN0IHZvcCAqdm9w
KQogCiBzdGF0aWMgaW50IHZvcF9pbml0aWFsKHN0cnVjdCB2b3AgKnZvcCkKIHsKLQljb25zdCBz
dHJ1Y3Qgdm9wX2RhdGEgKnZvcF9kYXRhID0gdm9wLT5kYXRhOwogCXN0cnVjdCByZXNldF9jb250
cm9sICphaGJfcnN0OwogCWludCBpLCByZXQ7CiAKQEAgLTE2NTQsMTIgKzE2NTMsMTMgQEAgc3Rh
dGljIGludCB2b3BfaW5pdGlhbChzdHJ1Y3Qgdm9wICp2b3ApCiAJVk9QX1JFR19TRVQodm9wLCBt
aXNjLCBnbG9iYWxfcmVnZG9uZV9lbiwgMSk7CiAJVk9QX1JFR19TRVQodm9wLCBjb21tb24sIGRz
cF9ibGFuaywgMCk7CiAKLQlmb3IgKGkgPSAwOyBpIDwgdm9wX2RhdGEtPndpbl9zaXplOyBpKysp
IHsKLQkJY29uc3Qgc3RydWN0IHZvcF93aW5fZGF0YSAqd2luID0gJnZvcF9kYXRhLT53aW5baV07
CisJZm9yIChpID0gMDsgaSA8IHZvcC0+ZGF0YS0+d2luX3NpemU7IGkrKykgeworCQlzdHJ1Y3Qg
dm9wX3dpbiAqdm9wX3dpbiA9ICZ2b3AtPndpbltpXTsKKwkJY29uc3Qgc3RydWN0IHZvcF93aW5f
ZGF0YSAqd2luID0gdm9wX3dpbi0+ZGF0YTsKIAkJaW50IGNoYW5uZWwgPSBpICogMiArIDE7CiAK
IAkJVk9QX1dJTl9TRVQodm9wLCB3aW4sIGNoYW5uZWwsIChjaGFubmVsICsgMSkgPDwgNCB8IGNo
YW5uZWwpOwotCQl2b3Bfd2luX2Rpc2FibGUodm9wLCB3aW4pOworCQl2b3Bfd2luX2Rpc2FibGUo
dm9wLCB2b3Bfd2luKTsKIAkJVk9QX1dJTl9TRVQodm9wLCB3aW4sIGdhdGUsIDEpOwogCX0KIAot
LSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
