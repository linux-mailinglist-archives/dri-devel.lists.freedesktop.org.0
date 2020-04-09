Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F5C1A3393
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 13:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A386EBA9;
	Thu,  9 Apr 2020 11:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E965A6EBA9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 11:52:59 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h25so1206627lja.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 04:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K6k0LBdtUPwj/LD0T2MT9DUfi7gdeMN4C6bgjFlA6sE=;
 b=X9MJWG2ZCWj7xbi84wNU8LHDOHz0th1sbCigTw23Cy7mwVCK8bGwomxMX5qQOLtFJj
 lgZzb0gNJOdM+eAG+LcTUFb4ZpkuCQi1K9/9tcbg9jA5m2FLt/kvx5fyHw6X/lXwYHqr
 Jy556WnPc8NP4mAfEv7cszWKW3Z6kWhxVOt4cFOS6YJ9j9/YvJ4I/3OiBaIJEYfrPvfc
 1lllmisAWB3jD5x/zE39a3GfDzffCKDHxG8ITG9GdvNzZ/UUh9qyminljyMEeQSw4idj
 zKZVijosiqxeEZjr2VAOT4NI5e+t2ZK6TbKEpBZXKWS1MPhfTpAS6g/Y1YDRYXehyFh3
 OO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K6k0LBdtUPwj/LD0T2MT9DUfi7gdeMN4C6bgjFlA6sE=;
 b=PpEcWlE1Y0IMYzmGeJLcQkTB3HIe8DhcjHDUGqDnROeefTKvFY0hMs0Q/jDhyLkrkl
 1N3e0Nr6tQbpgKUQbIAaYjTUmctCFUAV8qb3M7hE3kt0ZfmrIXf7tPmvV811T12FrkuI
 W+xtjalrgrEsIw07wI7cWLhwuLJln0U+6jZb8B/CqemgdHhDI4gZQCXR94aX4zEp0L2S
 nh498hEceyJ4YDGxVWFTTA2N9zIuisbnmVDGKpFPjo5OndmahfHNVEH9D5cbm4Btk/2I
 curaTeCQ3liDgy60cPtdbCb6NhoLYef3H/OE/GQMguc3HsjkNu8TwsIfRh1X9X84Hqj9
 dtjg==
X-Gm-Message-State: AGi0PubqcruGKL5Zu08fKK9yFZm1ocM2lbf/dtGXxzRlnt/0+BpLOjw4
 wrUKL2M3aVOG1TegvVtjzk/r13ZVV2Y=
X-Google-Smtp-Source: APiQypKLdWIKAH1TnUtIYK+OiVO6i7F6fUJLgtAUo02XfVKRH6ok2k17uUVEmCx+njTgkDPTdqKI8A==
X-Received: by 2002:a2e:b4ca:: with SMTP id r10mr2070348ljm.149.1586433177782; 
 Thu, 09 Apr 2020 04:52:57 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 q21sm14959850ljh.38.2020.04.09.04.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 04:52:57 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Joonas=20Kylm=C3=A4l=C3=A4?= <joonas.kylmala@iki.fi>
Subject: [PATCH v1 3/3] drm/panel: update backlight handling for
 samsung-s6e63m0
Date: Thu,  9 Apr 2020 13:52:39 +0200
Message-Id: <20200409115239.5149-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409115239.5149-1-sam@ravnborg.org>
References: <20200409115239.5149-1-sam@ravnborg.org>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Hyungwon Hwang <human.hwang@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHNhbXN1bmctczZlNjNtMCBoYWQgYSBsb2NhbCB3YXkgdG8gaGFuZGxlIGJhY2tsaWdodC4K
ClVwZGF0ZSB0aGUgZHJpdmVyIHRvIHVzZSBhIGRldm1fIGJhc2VkIHJlZ2lzdGVyIGZ1bmN0aW9u
CmFuZCB1dGlsaXplIGRybV9wYW5lbCBiYWNrbGlnaHQgc3VwcG9ydC4gVGhlIGNoYW5nZXMgcmVz
dWx0cwppbiBhIHNpbXBsZXIgZHJpdmVyIHdpdGggdGhlIHNhbWUgZnVuY3Rpb25hbGl0eS4KClNp
Z25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFBhd2XFgiBD
aG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdtYWlsLmNvbT4KQ2M6IEpvb25hcyBLeWxtw6Rs
w6QgPGpvb25hcy5reWxtYWxhQGlraS5maT4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpD
YzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAuYyB8IDIwICsrKysrKysrLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAuYwppbmRleCBhNWY3NmViNGZh
MjUuLjA4OWJmNGNmZjg0MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXNhbXN1bmctczZlNjNtMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1z
dW5nLXM2ZTYzbTAuYwpAQCAtODksNyArODksNiBAQCBzdGF0aWMgdTggY29uc3QgczZlNjNtMF9n
YW1tYV8yMltOVU1fR0FNTUFfTEVWRUxTXVtHQU1NQV9UQUJMRV9DT1VOVF0gPSB7CiBzdHJ1Y3Qg
czZlNjNtMCB7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCXN0cnVjdCBkcm1fcGFuZWwgcGFuZWw7
Ci0Jc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsX2RldjsKIAogCXN0cnVjdCByZWd1bGF0b3Jf
YnVsa19kYXRhIHN1cHBsaWVzWzJdOwogCXN0cnVjdCBncGlvX2Rlc2MgKnJlc2V0X2dwaW87CkBA
IC0yOTMsOCArMjkyLDYgQEAgc3RhdGljIGludCBzNmU2M20wX2Rpc2FibGUoc3RydWN0IGRybV9w
YW5lbCAqcGFuZWwpCiAJaWYgKCFjdHgtPmVuYWJsZWQpCiAJCXJldHVybiAwOwogCi0JYmFja2xp
Z2h0X2Rpc2FibGUoY3R4LT5ibF9kZXYpOwotCiAJczZlNjNtMF9kY3Nfd3JpdGVfc2VxX3N0YXRp
YyhjdHgsIE1JUElfRENTX0VOVEVSX1NMRUVQX01PREUpOwogCW1zbGVlcCgyMDApOwogCkBAIC0z
NTUsOCArMzUyLDYgQEAgc3RhdGljIGludCBzNmU2M20wX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVs
ICpwYW5lbCkKIAogCXM2ZTYzbTBfZGNzX3dyaXRlX3NlcV9zdGF0aWMoY3R4LCBNSVBJX0RDU19T
RVRfRElTUExBWV9PTik7CiAKLQliYWNrbGlnaHRfZW5hYmxlKGN0eC0+YmxfZGV2KTsKLQogCWN0
eC0+ZW5hYmxlZCA9IHRydWU7CiAKIAlyZXR1cm4gMDsKQEAgLTM5NCw3ICszODksNiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9wYW5lbF9mdW5jcyBzNmU2M20wX2RybV9mdW5jcyA9IHsKIHN0
YXRpYyBpbnQgczZlNjNtMF9zZXRfYnJpZ2h0bmVzcyhzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAq
YmQpCiB7CiAJc3RydWN0IHM2ZTYzbTAgKmN0eCA9IGJsX2dldF9kYXRhKGJkKTsKLQogCWludCBi
cmlnaHRuZXNzID0gYmQtPnByb3BzLmJyaWdodG5lc3M7CiAKIAkvKiBkaXNhYmxlIGFuZCBzZXQg
bmV3IGdhbW1hICovCkBAIC00MTYsMTkgKzQxMCwyMSBAQCBzdGF0aWMgaW50IHM2ZTYzbTBfYmFj
a2xpZ2h0X3JlZ2lzdGVyKHN0cnVjdCBzNmU2M20wICpjdHgpCiAJc3RydWN0IGJhY2tsaWdodF9w
cm9wZXJ0aWVzIHByb3BzID0gewogCQkudHlwZQkJPSBCQUNLTElHSFRfUkFXLAogCQkuYnJpZ2h0
bmVzcwk9IE1BWF9CUklHSFRORVNTLAotCQkubWF4X2JyaWdodG5lc3MgPSBNQVhfQlJJR0hUTkVT
UworCQkubWF4X2JyaWdodG5lc3MJPSBNQVhfQlJJR0hUTkVTUywKIAl9OworCXN0cnVjdCBiYWNr
bGlnaHRfZGV2aWNlICpiYWNrbGlnaHQ7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gY3R4LT5kZXY7
CiAJaW50IHJldCA9IDA7CiAKLQljdHgtPmJsX2RldiA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9y
ZWdpc3RlcihkZXYsICJwYW5lbCIsIGRldiwgY3R4LAotCQkJCQkJICAgICAmczZlNjNtMF9iYWNr
bGlnaHRfb3BzLAotCQkJCQkJICAgICAmcHJvcHMpOwotCWlmIChJU19FUlIoY3R4LT5ibF9kZXYp
KSB7Ci0JCXJldCA9IFBUUl9FUlIoY3R4LT5ibF9kZXYpOworCWJhY2tsaWdodCA9IGRldm1fYmFj
a2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXYsICJwYW5lbCIsIGRldiwgY3R4LAorCQkJCQkJICAg
JnM2ZTYzbTBfYmFja2xpZ2h0X29wcywKKwkJCQkJCSAgICZwcm9wcyk7CisJaWYgKElTX0VSUihi
YWNrbGlnaHQpKSB7CisJCXJldCA9IFBUUl9FUlIoYmFja2xpZ2h0KTsKIAkJRFJNX0RFVl9FUlJP
UihkZXYsICJlcnJvciByZWdpc3RlcmluZyBiYWNrbGlnaHQgZGV2aWNlICglZClcbiIsCiAJCQkg
ICAgICByZXQpOwogCX0KKwljdHgtPnBhbmVsLmJhY2tsaWdodCA9IGJhY2tsaWdodDsKIAogCXJl
dHVybiByZXQ7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
