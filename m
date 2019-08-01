Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B576B7D3D8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B736E345;
	Thu,  1 Aug 2019 03:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1F16E345
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:45:03 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id r7so33153846pfl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7V27YU7YMF+tZPi0O4Ugz3veVJN966k99LkEuw17xeY=;
 b=LieaWt+tesWCfKEhN+6YBl71snfDl3Mtp93WFHlIDtI+eip7OFOoL+ncHOdJBQpyyh
 8SvK/1Nx54JbeGcu62VVj3DD5wN3SzR2wf6KE5JOzfG2XdviynFcOU4Vgrv9pdE4CtYY
 gFpjsdtFO2vvlCz/jKsds7STX8aJZvVLk220uvmpgoPUOaBrFDWafrtiKf6F8B1JZTGp
 /61ZbxmHl/1ibV6WcSA/nK/Iw0WyWA1YcSfbsJ/XCw90B1J6jCrHCWW423BDHpyuS5Om
 mVj+DGjdqwaN0iX4zLxZqA7CQyVZny3IGZpMUosPnzDNw5955EbkA0x3JvmR9SpOOluj
 ROMg==
X-Gm-Message-State: APjAAAVOPIgj6myQtmFtBBb3bvyT7vims9uuS+YvCAIKeeyNp26YD8GE
 6nuG2shlz40y5c06lkjEUgj/hw==
X-Google-Smtp-Source: APXvYqwEhFxACC26/Eik5Mctv+bkSEzw74Z5kusBkQCvg6V/F07XrF+4u0xrAKRk3NaklKsj9Z8wrA==
X-Received: by 2002:a63:a66:: with SMTP id z38mr21652140pgk.247.1564631100809; 
 Wed, 31 Jul 2019 20:45:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.44.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:45:00 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 10/26] drm: kirin: Move request irq handle in ade hw ctx
 alloc
Date: Thu,  1 Aug 2019 03:44:23 +0000
Message-Id: <20190801034439.98227-11-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7V27YU7YMF+tZPi0O4Ugz3veVJN966k99LkEuw17xeY=;
 b=ql0l5+P+mf3WMVVy/yqVmjy+Oi65lqVK0DmdJ3uF8Nw4Wf5d0BwNFACRz3v7CkikjX
 Yd30hkInZkBXabP80PeIrme1yJ/Ip+O9cnqds2hbokZqg3RQNmjxWQl8Qbi4vmEIfqKK
 +F0amK2NQldKuKzSXexa/Nlj5Cgbu5FavZFzbN175XIAfRziR0JvosWELHfVqH8owdUc
 VMrKjDraq9FULY7g7KhFS9qzQOJ7XlP6lwLGP8knvtKBTv99kNZzmT9WmbcEfyB+6uLl
 Frv1ZK7q5RLYDrxqzNFNjCeURud/RAdSSsthXsdMdnbtscwgxnZzZ8M0c4NKTtzaWj5K
 jmww==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggbW9kaWZpZXMgdGhlCmluaXRpYWxpemF0aW9uIHJv
dXRpbmVzIHNvIHRoZSBkZXZtX3JlcXVlc3RfaXJxKCkgZnVuY3Rpb24KaXMgY2FsbGVkIGFzIHBh
cnQgb2YgdGhlIGFsbG9jYXRpb24gZnVuY3Rpb24uCgpUaGlzIHdpbGwgYmUgbmVlZGVkIGluIHRo
ZSBmdXR1cmUgd2hlbiB3ZSB3aWxsIGhhdmUgZGlmZmVyZW50CmFsbG9jYXRpb24gZnVuY3Rpb25z
IHRvIGFsbG9jYXRlIGhhcmR3YXJlIHNwZWNpZmljIGh3X2N0eApzdHJ1Y3R1cmVzLCB3aGljaCB3
aWxsIHNldHVwIHRoZSB2YmxhbmsgaXJxIGRpZmZlcmVudGx5LgoKQ2M6IFJvbmdyb25nIFpvdSA8
em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsIDxkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBYdSBZaVBpbmcgPHh1eWlwaW5nQGhpc2lsaWNvbi5jb20+Cltqc3R1bHR6OiBy
ZXdvcmRlZCBjb21taXQgbWVzc2FnZV0KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4u
c3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmlu
X2RybV9hZGUuYyAgIHwgMjkgKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jIGIvZHJpdmVycy9ncHUvZHJtL2hp
c2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKaW5kZXggZGRjZmUwYzQyZDdjLi4wZTBmZTFj
Yjk0NWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5f
ZHJtX2FkZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJt
X2FkZS5jCkBAIC01NCw2ICs1NCw4IEBAIHN0cnVjdCBhZGVfaHdfY3R4IHsKIAlzdHJ1Y3QgcmVz
ZXRfY29udHJvbCAqcmVzZXQ7CiAJYm9vbCBwb3dlcl9vbjsKIAlpbnQgaXJxOworCisJc3RydWN0
IGRybV9jcnRjICpjcnRjOwogfTsKIAogc3RydWN0IGtpcmluX2NydGMgewpAQCAtMzU4LDkgKzM2
MCw5IEBAIHN0YXRpYyB2b2lkIGRybV91bmRlcmZsb3dfd3Eoc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrKQogCiBzdGF0aWMgaXJxcmV0dXJuX3QgYWRlX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQg
KmRhdGEpCiB7Ci0Jc3RydWN0IGtpcmluX2NydGMgKmtjcnRjID0gZGF0YTsKLQlzdHJ1Y3QgYWRl
X2h3X2N0eCAqY3R4ID0ga2NydGMtPmh3X2N0eDsKLQlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAm
a2NydGMtPmJhc2U7CisJc3RydWN0IGFkZV9od19jdHggKmN0eCA9IGRhdGE7CisJc3RydWN0IGRy
bV9jcnRjICpjcnRjID0gY3R4LT5jcnRjOworCXN0cnVjdCBraXJpbl9jcnRjICprY3J0YyA9IHRv
X2tpcmluX2NydGMoY3J0Yyk7CiAJdm9pZCBfX2lvbWVtICpiYXNlID0gY3R4LT5iYXNlOwogCXUz
MiBzdGF0dXM7CiAKQEAgLTk1MSwxMiArOTUzLDE0IEBAIHN0YXRpYyBpbnQgYWRlX3BsYW5lX2lu
aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGtpcmluX3BsYW5lICprcGxhbmUsCiAJ
cmV0dXJuIDA7CiB9CiAKLXN0YXRpYyB2b2lkICphZGVfaHdfY3R4X2FsbG9jKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCAqYWRlX2h3X2N0eF9hbGxvYyhzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2LAorCQkJCQkJCSAgc3RydWN0IGRybV9jcnRjICpjcnRjKQog
ewogCXN0cnVjdCByZXNvdXJjZSAqcmVzOwogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5k
ZXY7CiAJc3RydWN0IGRldmljZV9ub2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOwogCXN0cnVj
dCBhZGVfaHdfY3R4ICpjdHggPSBOVUxMOworCWludCByZXQ7CiAKIAljdHggPSBkZXZtX2t6YWxs
b2MoZGV2LCBzaXplb2YoKmN0eCksIEdGUF9LRVJORUwpOwogCWlmICghY3R4KSB7CkBAIC0xMDA2
LDYgKzEwMTAsMTQgQEAgc3RhdGljIHZvaWQgKmFkZV9od19jdHhfYWxsb2Moc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7CiAJfQogCisJLyog
dmJsYW5rIGlycSBpbml0ICovCisJcmV0ID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIGN0eC0+aXJx
LCBhZGVfaXJxX2hhbmRsZXIsCisJCQkgICAgICAgSVJRRl9TSEFSRUQsIGRldi0+ZHJpdmVyLT5u
YW1lLCBjdHgpOworCWlmIChyZXQpCisJCXJldHVybiBFUlJfUFRSKC1FSU8pOworCisJY3R4LT5j
cnRjID0gY3J0YzsKKwogCXJldHVybiBjdHg7CiB9CiAKQEAgLTEwMjcsNyArMTAzOSw3IEBAIHN0
YXRpYyBpbnQgYWRlX2RybV9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJfQog
CXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGFkZSk7CiAKLQljdHggPSBhZGVfaHdfY3R4X2Fs
bG9jKHBkZXYpOworCWN0eCA9IGFkZV9od19jdHhfYWxsb2MocGRldiwgJmFkZS0+Y3J0Yy5iYXNl
KTsKIAlpZiAoSVNfRVJSKGN0eCkpIHsKIAkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gaW5pdGlhbGl6
ZSBraXJpbl9wcml2IGh3IGN0eFxuIik7CiAJCXJldHVybiAtRUlOVkFMOwpAQCAtMTA1OSwxNSAr
MTA3MSw4IEBAIHN0YXRpYyBpbnQgYWRlX2RybV9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCS8qIHZibGFuayBpcnEgaW5pdCAq
LwotCXJldCA9IGRldm1fcmVxdWVzdF9pcnEoZGV2LT5kZXYsIGN0eC0+aXJxLCBhZGVfaXJxX2hh
bmRsZXIsCi0JCQkgICAgICAgSVJRRl9TSEFSRUQsIGRldi0+ZHJpdmVyLT5uYW1lLCBrY3J0Yyk7
Ci0KIAlJTklUX1dPUksoJmtjcnRjLT5kaXNwbGF5X3Jlc2V0X3dxLCBkcm1fdW5kZXJmbG93X3dx
KTsKIAotCWlmIChyZXQpCi0JCXJldHVybiByZXQ7Ci0KIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
