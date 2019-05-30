Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 736392FB07
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8423D6E174;
	Thu, 30 May 2019 11:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7DF6E13A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 09:18:54 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n2so1645360pgp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 02:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AiM9lQChj12NVhLaqvQMt0hxwIJhnj7lqdz7I6Ifl9k=;
 b=RjxDvcnEbZroDyTVLmg0yMVEOAMmOQuWWqqITjqJIA7fwBc8+GMHvqtj/HToAvjW6O
 oYXvm8eWpICObhswbIFesS47zoX5GLlySGfBZ9KEPxl+MgklQaCHLC801FIlyVLqkoJM
 tLIWBnMg0zugWdyl1gc+bPSLddYAnt9dLbutab8boMoZ7I3f+8p51z6XpP7KLwaIDBU+
 THTJJJQ7Db5kSh/wXnnOfOzsu3ABFgr4p273WA8O2dv9bJShF1tBoMJICqLrVdQN22va
 0/nAuUpIxSnD5LJ9i5CTvdB0HACuHNg4UK98l9eI7dSSsvHWOCMJX3F5flnasSiOCIwR
 SIYw==
X-Gm-Message-State: APjAAAWEXNtbCT/xrxHT75XlkGj5eMvk8UKp6s9v6edMOkFzyM0Dqp6K
 2y+53A+mM8dCzrcnZE53olJW8w==
X-Google-Smtp-Source: APXvYqyR2TapAsuf4Y55MbptIVWHJtSABFxvasONsBUaove+y19OR5W0sbkiLKtro5lpzENh/qk8+g==
X-Received: by 2002:a05:6a00:cc:: with SMTP id
 e12mr2753772pfj.207.1559207933788; 
 Thu, 30 May 2019 02:18:53 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id o2sm1720924pgm.51.2019.05.30.02.18.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 30 May 2019 02:18:52 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4] gpu/drm: mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
Date: Thu, 30 May 2019 17:18:47 +0800
Message-Id: <20190530091847.90263-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 May 2019 11:39:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AiM9lQChj12NVhLaqvQMt0hxwIJhnj7lqdz7I6Ifl9k=;
 b=CafCN9m8YypnM2GI7SEoCWLj8aK6f3cTJiEE3GUT0CIR1isix8CftjLmtVJNfjlFWw
 SPB9eFwkyaw6VXXg2KN2vlPYwFj0jhn1+6k3hZX3oAaJ8LMlzseUF7qEqNiHaqfdEL+a
 b3DdhF8j/Wt6ijQK6bSDDPS6TLrQZ+6ZbPfiY=
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
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bXRrX2RzaV9zdG9wKCkgc2hvdWxkIGJlIGNhbGxlZCBhZnRlciBtdGtfZHJtX2NydGNfYXRvbWlj
X2Rpc2FibGUoKSwgd2hpY2ggbmVlZHMKb3ZsIGlycSBmb3IgZHJtX2NydGNfd2FpdF9vbmVfdmJs
YW5rKCksIHNpbmNlIGFmdGVyIG10a19kc2lfc3RvcCgpIGlzIGNhbGxlZCwKb3ZsIGlycSB3aWxs
IGJlIGRpc2FibGVkLiBJZiBkcm1fY3J0Y193YWl0X29uZV92YmxhbmsoKSBpcyBjYWxsZWQgYWZ0
ZXIgbGFzdAppcnEsIGl0IHdpbGwgdGltZW91dCB3aXRoIHRoaXMgbWVzc2FnZTogInZibGFuayB3
YWl0IHRpbWVkIG91dCBvbiBjcnRjIDAiLiBUaGlzCmhhcHBlbnMgc29tZXRpbWVzIHdoZW4gdHVy
bmluZyBvZmYgdGhlIHNjcmVlbi4KCkluIGRybV9hdG9taWNfaGVscGVyLmMjZGlzYWJsZV9vdXRw
dXRzKCksCnRoZSBjYWxsaW5nIHNlcXVlbmNlIHdoZW4gdHVybmluZyBvZmYgdGhlIHNjcmVlbiBp
czoKCjEuIG10a19kc2lfZW5jb2Rlcl9kaXNhYmxlKCkKICAgICAtLT4gbXRrX291dHB1dF9kc2lf
ZGlzYWJsZSgpCiAgICAgICAtLT4gbXRrX2RzaV9zdG9wKCk7ICAvLyBzb21ldGltZXMgbWFrZSB2
YmxhbmsgdGltZW91dCBpbiBhdG9taWNfZGlzYWJsZQogICAgICAgLS0+IG10a19kc2lfcG93ZXJv
ZmYoKTsKMi4gbXRrX2RybV9jcnRjX2F0b21pY19kaXNhYmxlKCkKICAgICAtLT4gZHJtX2NydGNf
d2FpdF9vbmVfdmJsYW5rKCk7CiAgICAgLi4uCiAgICAgICAtLT4gbXRrX2RzaV9kZHBfc3RvcCgp
CiAgICAgICAgIC0tPiBtdGtfZHNpX3Bvd2Vyb2ZmKCk7CgptdGtfZHNpX3Bvd2Vyb2ZmKCkgaGFz
IHJlZmVyZW5jZSBjb3VudCBkZXNpZ24sIGNoYW5nZSB0byBtYWtlIG10a19kc2lfc3RvcCgpCmNh
bGxlZCBpbiBtdGtfZHNpX3Bvd2Vyb2ZmKCkgd2hlbiByZWZjb3VudCBpcyAwLgoKRml4ZXM6IDA3
MDc2MzJiNWJhYyAoImRybS9tZWRpYXRlazogdXBkYXRlIERTSSBzdWIgZHJpdmVyIGZsb3cgZm9y
IHNlbmRpbmcgY29tbWFuZHMgdG8gcGFuZWwiKQpTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcg
PGhzaW55aUBjaHJvbWl1bS5vcmc+Ci0tLQpjaGFuZ2UgbG9nIHYzLT52NDoKKiBhZGQgY29tbWVu
dCBpbiBjb2RlLgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxMCAr
KysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKaW5kZXggYjAwZWIyZDJlMDg2Li43MzA1OTRh
OTE0NDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwpAQCAtNjMwLDYgKzYzMCwxNSBA
QCBzdGF0aWMgdm9pZCBtdGtfZHNpX3Bvd2Vyb2ZmKHN0cnVjdCBtdGtfZHNpICpkc2kpCiAJaWYg
KC0tZHNpLT5yZWZjb3VudCAhPSAwKQogCQlyZXR1cm47CiAKKwkvKiAKKwkgKiBtdGtfZHNpX3N0
b3AoKSBhbmQgbXRrX2RzaV9zdGFydCgpIGlzIGFzeW1tZXRyaWMsIHNpbmNlCisJICogbXRrX2Rz
aV9zdG9wKCkgc2hvdWxkIGJlIGNhbGxlZCBhZnRlciBtdGtfZHJtX2NydGNfYXRvbWljX2Rpc2Fi
bGUoKSwKKwkgKiB3aGljaCBuZWVkcyBpcnEgZm9yIHZibGFuaywgYW5kIG10a19kc2lfc3RvcCgp
IHdpbGwgZGlzYWJsZSBpcnEuCisJICogbXRrX2RzaV9zdGFydCgpIG5lZWRzIHRvIGJlIGNhbGxl
ZCBpbiBtdGtfb3V0cHV0X2RzaV9lbmFibGUoKSwKKwkgKiBhZnRlciBkc2kgaXMgZnVsbHkgc2V0
LgorCSAqLworCW10a19kc2lfc3RvcChkc2kpOworCiAJaWYgKCFtdGtfZHNpX3N3aXRjaF90b19j
bWRfbW9kZShkc2ksIFZNX0RPTkVfSU5UX0ZMQUcsIDUwMCkpIHsKIAkJaWYgKGRzaS0+cGFuZWwp
IHsKIAkJCWlmIChkcm1fcGFuZWxfdW5wcmVwYXJlKGRzaS0+cGFuZWwpKSB7CkBAIC02OTYsNyAr
NzA1LDYgQEAgc3RhdGljIHZvaWQgbXRrX291dHB1dF9kc2lfZGlzYWJsZShzdHJ1Y3QgbXRrX2Rz
aSAqZHNpKQogCQl9CiAJfQogCi0JbXRrX2RzaV9zdG9wKGRzaSk7CiAJbXRrX2RzaV9wb3dlcm9m
Zihkc2kpOwogCiAJZHNpLT5lbmFibGVkID0gZmFsc2U7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
