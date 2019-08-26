Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DDA9D92C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563306E315;
	Mon, 26 Aug 2019 22:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF6289C98
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:33:20 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id b1so16807213otp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXQLljPOJppvUwH5wuivPhE8Q1AsKryxsAzIJcaFlYI=;
 b=DhE5xmWg20b5+jfS8pg00y7Ou4Iou2ROdSDY48nhmc9yyT5C+klg3QtYoBGZ8IefPT
 zWOPVxDLP9yqaJyydv/XwyDTW+neC8msUTt5Gfnl6FHJfW9mWnmBNIvulFQe9qdCDlPl
 50x+sabQxuAjyLfe1NcQyFfvEWSq+m8x/ZmcHwPSTIFwk7/TJjPQWtOXIYk1oKW0P/ZP
 BaG69ob1wqvrbXm1XAWApuuktH9LA3ioJmn7y9WUQhA6YMN5kg6atjFszlG8aZR2wIRh
 g0Wi//sO6s6ZKjioS2z8KmDWaEzMgl1TBcp0mNQA18OPy1/qe8Uoh+HcVzUKgaJdqLDy
 1SGQ==
X-Gm-Message-State: APjAAAUbcfhbErx2eXa62HmOB1tpLphe8rRlMA+r7RfnGKXmR7LGV4zL
 Tsg92gmrflS1sD7mTpS34Zg345M=
X-Google-Smtp-Source: APXvYqxQTohvm6kcb9t8rthFPIBSnAxjFnCrL2Q0aNrpR23ZX/iHGRJYJCngRNhWSqp52/nZvAdC2Q==
X-Received: by 2002:a05:6830:1e0a:: with SMTP id
 s10mr16241992otr.252.1566858799501; 
 Mon, 26 Aug 2019 15:33:19 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e22sm3668959oii.7.2019.08.26.15.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 15:33:18 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/8] drm/panfrost: Rework runtime PM initialization
Date: Mon, 26 Aug 2019 17:33:10 -0500
Message-Id: <20190826223317.28509-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826223317.28509-1-robh@kernel.org>
References: <20190826223317.28509-1-robh@kernel.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBhIGZldyBpc3N1ZXMgd2l0aCB0aGUgcnVudGltZSBQTSBpbml0aWFsaXphdGlvbi4K
ClRoZSBkb2N1bWVudGF0aW9uIHN0YXRlcyBwbV9ydW50aW1lX3NldF9hY3RpdmUoKSBzaG91bGQg
YmUgY2FsbGVkIGJlZm9yZQpwbV9ydW50aW1lX2VuYWJsZSgpLiBUaGUgcG1fcnVudGltZV9wdXRf
YXV0b3N1c3BlbmQoKSBjb3VsZCBzdXNwZW5kIHRoZSBHUFUKYmVmb3JlIHBhbmZyb3N0X3BlcmZj
bnRfaW5pdCgpIGlzIGNhbGxlZCB3aGljaCB0b3VjaGVzIHRoZSBoL3cuIFRoZQphdXRvc3VzcGVu
ZCBkZWxheSBrZWVwcyB0aGluZ3MgZnJvbSBicmVha2luZy4gVGhlcmUncyBubyBuZWVkIGV4cGxp
Y2l0bHkKcG93ZXIgb2ZmIHRoZSBHUFUgb25seSB0byB3YWtlIGJhY2sgdXAgd2l0aCBwbV9ydW50
aW1lX2dldF9zeW5jKCkuIEp1c3QKZGVsYXlpbmcgcG1fcnVudGltZV9lbmFibGUgdG8gdGhlIGVu
ZCBvZiBwcm9iZSBpcyBzdWZmaWNpZW50LgoKTGV0cyBtb3ZlIGFsbCB0aGUgcnVudGltZSBQTSBj
YWxscyBpbnRvIHRoZSBwcm9iZSgpIGZ1bmN0aW9uIHNvIHRoZXkgYXJlCmFsbCBpbiBvbmUgcGxh
Y2UgYW5kIGFyZSBkb25lIGFmdGVyIGFsbCBpbml0aWFsaXphdGlvbi4KCkNjOiBUb21ldSBWaXpv
c28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgpDYzogU3RldmVuIFByaWNlIDxzdGV2ZW4u
cHJpY2VAYXJtLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQWNrZWQtYnk6IEFseXNzYSBSb3Nlbnp3ZWln
IDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KdjM6CiAtIE1vdmUgYXV0b3N1c3BlbmQgc2V0dXAg
YWZ0ZXIgcG1fcnVudGltZV9lbmFibGUgYXMgb25seSBhdXRvc3VzcGVuZCBjaGFuZ2VzCiAgIHRy
aWdnZXIgc3VzcGVuZC4KIC0gRml4IGF1dG9zdXNwZW5kIGRlbGF5IHRvIDUwbXMgaW5zdGVhZCBv
ZiAwLgoKIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyB8ICA5IC0t
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jICAgIHwgMTAg
KysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZp
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwppbmRleCA0
ZGE3MWJiNTZjMjAuLjczODA1MjEwODM0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kZXZpY2UuYwpAQCAtNSw3ICs1LDYgQEAKICNpbmNsdWRlIDxsaW51eC9jbGsuaD4K
ICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rldmlj
ZS5oPgotI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9yZWd1
bGF0b3IvY29uc3VtZXIuaD4KCiAjaW5jbHVkZSAicGFuZnJvc3RfZGV2aWNlLmgiCkBAIC0xNjYs
MTQgKzE2NSw2IEBAIGludCBwYW5mcm9zdF9kZXZpY2VfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2
aWNlICpwZmRldikKIAlpZiAoZXJyKQogCQlnb3RvIGVycl9vdXQ0OwoKLQkvKiBydW50aW1lIFBN
IHdpbGwgd2FrZSB1cyB1cCBsYXRlciAqLwotCXBhbmZyb3N0X2dwdV9wb3dlcl9vZmYocGZkZXYp
OwotCi0JcG1fcnVudGltZV9zZXRfYWN0aXZlKHBmZGV2LT5kZXYpOwotCXBtX3J1bnRpbWVfZ2V0
X3N5bmMocGZkZXYtPmRldik7Ci0JcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShwZmRldi0+ZGV2
KTsKLQlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChwZmRldi0+ZGV2KTsKLQogCWVyciA9IHBh
bmZyb3N0X3BlcmZjbnRfaW5pdChwZmRldik7CiAJaWYgKGVycikKIAkJZ290byBlcnJfb3V0NTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwppbmRleCBkNzQ0NDJkNzEwNDgu
LmJjMmRkZWI1NWY1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwpA
QCAtNTIzLDEwICs1MjMsNiBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJbXV0ZXhfaW5pdCgmcGZkZXYtPnNocmlua2VyX2xvY2spOwog
CUlOSVRfTElTVF9IRUFEKCZwZmRldi0+c2hyaW5rZXJfbGlzdCk7CgotCXBtX3J1bnRpbWVfdXNl
X2F1dG9zdXNwZW5kKHBmZGV2LT5kZXYpOwotCXBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2Rl
bGF5KHBmZGV2LT5kZXYsIDUwKTsgLyogfjMgZnJhbWVzICovCi0JcG1fcnVudGltZV9lbmFibGUo
cGZkZXYtPmRldik7Ci0KIAllcnIgPSBwYW5mcm9zdF9kZXZpY2VfaW5pdChwZmRldik7CiAJaWYg
KGVycikgewogCQlpZiAoZXJyICE9IC1FUFJPQkVfREVGRVIpCkBAIC01NDEsNiArNTM3LDEyIEBA
IHN0YXRpYyBpbnQgcGFuZnJvc3RfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAkJZ290byBlcnJfb3V0MTsKIAl9CgorCXBtX3J1bnRpbWVfc2V0X2FjdGl2ZShwZmRldi0+ZGV2
KTsKKwlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KHBmZGV2LT5kZXYpOworCXBtX3J1bnRpbWVf
ZW5hYmxlKHBmZGV2LT5kZXYpOworCXBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KHBm
ZGV2LT5kZXYsIDUwKTsgLyogfjMgZnJhbWVzICovCisJcG1fcnVudGltZV91c2VfYXV0b3N1c3Bl
bmQocGZkZXYtPmRldik7CisKIAkvKgogCSAqIFJlZ2lzdGVyIHRoZSBEUk0gZGV2aWNlIHdpdGgg
dGhlIGNvcmUgYW5kIHRoZSBjb25uZWN0b3JzIHdpdGgKIAkgKiBzeXNmcwotLQoyLjIwLjEKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
