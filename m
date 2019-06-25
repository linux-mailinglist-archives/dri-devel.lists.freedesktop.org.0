Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0C456430
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550B36E2F5;
	Wed, 26 Jun 2019 08:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964DC6E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:35:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p13so18610269wru.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n5d3BfSnmnwO/hS4dFGhcrIk5LVowo1/qQQdF1Vy3jk=;
 b=eEMTDH9BIuKXUK3Izsi4POd10VdlEeIW7YbTtE1NLOis7br59gexh6K8BKmygEXO2M
 ajp0br/wL5UitpqPqPkGJSONcfvDe/Ii0M2OZ8JwF4mDqRst0PuYWP76eLxKQsZzYfrs
 5ouuFJIWPVMty3iUqIgs43Xew8BLKAo+/zv5iD0vwMron9FTLQPZ17ivEXiDBKBUcLO2
 Bljk4KBupQwUU/g+OnH8CUb7+OYPUWXoMYxxfNaSV1lioUIt+fhp65vN0DoQ0TfafoeK
 wIh/sl+tWzI82COIfi1vTMNzpOpIBH+gvjDAwHmCEJh//XOR2b5gnL3+WSWeCYJ/cX3f
 rRxw==
X-Gm-Message-State: APjAAAU2P1yxyDF2JtnIy/4XmACZhdgLmCfTH3OA+Aw69xKjbyxrtR9M
 qAUwrpjwosv65E/b/GtAamP+ug==
X-Google-Smtp-Source: APXvYqxYtpw4EEVsdGnQVBBLUuXARVZGsIrOsocPZwN44dsA/Y8ZCTQWBqOBfRU7qmBFqnACXLnZHw==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr71415wrv.45.1561480499309;
 Tue, 25 Jun 2019 09:34:59 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.34.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:34:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 06/12] ARM: davinci: da850-evm: model the backlight GPIO as an
 actual device
Date: Tue, 25 Jun 2019 18:34:28 +0200
Message-Id: <20190625163434.13620-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n5d3BfSnmnwO/hS4dFGhcrIk5LVowo1/qQQdF1Vy3jk=;
 b=mi3aYH337XfZeD6KCGPODvIEDc6lpAsrLiBKenynyTgeBAflzEuAFOSSRaIv7QCcw0
 cU5hYTlgn0flazzm/uE9V2gsr0kjBHT5y/98Qo74IaK5b50eEFHQWnCUmKzphCf694cO
 LDW7BmNVzoFJZ5NIlzjd+HVONir3l9AyrAj5png44VBdtFHeh3uryIXOkGa1wJPvA5LN
 WvCLOTnyGe8CkM/Fz5OUnv1HjtcHnzID+6CRcBFR3JznXuOHp5DQfeF10qw9RKY3r25S
 CYTFos7dPmJNHROYanCTBvFs7gU6PLh/xVeNfeRVmRWdHzC44plIWFbBhF8yvimaw5KZ
 jexw==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCklu
c3RlYWQgb2YgZW5hYmxpbmcgdGhlIHBhbmVsIGJhY2tsaWdodCBpbiBhIGNhbGxiYWNrIGRlZmlu
ZWQgaW4gYm9hcmQKZmlsZSB1c2luZyBkZXByZWNhdGVkIGxlZ2FjeSBHUElPIEFQSSBjYWxscywg
bW9kZWwgdGhlIGxpbmUgYXMgYSBHUElPCmJhY2tsaWdodCBkZXZpY2UuCgpTaWduZWQtb2ZmLWJ5
OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgotLS0KIGFy
Y2gvYXJtL21hY2gtZGF2aW5jaS9ib2FyZC1kYTg1MC1ldm0uYyB8IDQwICsrKysrKysrKysrKysr
KysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLWRhdmluY2kvYm9hcmQtZGE4NTAtZXZt
LmMgYi9hcmNoL2FybS9tYWNoLWRhdmluY2kvYm9hcmQtZGE4NTAtZXZtLmMKaW5kZXggMzFhZTNi
ZTU3NDFkLi5mZmRhNjIzYmI1NDMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21hY2gtZGF2aW5jaS9i
b2FyZC1kYTg1MC1ldm0uYworKysgYi9hcmNoL2FybS9tYWNoLWRhdmluY2kvYm9hcmQtZGE4NTAt
ZXZtLmMKQEAgLTM2LDYgKzM2LDcgQEAKICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kYXRhL3Rp
LWFlbWlmLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGF0YS9zcGktZGF2aW5jaS5oPgog
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RhdGEvdWlvX3BydXNzLmg+CisjaW5jbHVkZSA8bGlu
dXgvcHJvcGVydHkuaD4KICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvbWFjaGluZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci90cHM2NTA3eC5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ3Vs
YXRvci9maXhlZC5oPgpAQCAtODAzLDM0ICs4MDQsNDkgQEAgc3RhdGljIGNvbnN0IHNob3J0IGRh
ODUwX2V2bV9tbWNzZDBfcGluc1tdIF9faW5pdGNvbnN0ID0gewogCiBzdGF0aWMgdm9pZCBkYTg1
MF9wYW5lbF9wb3dlcl9jdHJsKGludCB2YWwpCiB7Ci0JLyogbGNkIGJhY2tsaWdodCAqLwotCWdw
aW9fc2V0X3ZhbHVlKERBODUwX0xDRF9CTF9QSU4sIHZhbCk7Ci0KIAkvKiBsY2QgcG93ZXIgKi8K
IAlncGlvX3NldF92YWx1ZShEQTg1MF9MQ0RfUFdSX1BJTiwgdmFsKTsKIH0KIAorc3RhdGljIHN0
cnVjdCBwcm9wZXJ0eV9lbnRyeSBkYTg1MF9sY2RfYmFja2xpZ2h0X3Byb3BzW10gPSB7CisJUFJP
UEVSVFlfRU5UUllfQk9PTCgiZGVmYXVsdC1vbiIpLAorCXsgfQorfTsKKworc3RhdGljIHN0cnVj
dCBncGlvZF9sb29rdXBfdGFibGUgZGE4NTBfbGNkX2JhY2tsaWdodF9ncGlvX3RhYmxlID0gewor
CS5kZXZfaWQJCT0gImdwaW8tYmFja2xpZ2h0IiwKKwkudGFibGUgPSB7CisJCUdQSU9fTE9PS1VQ
KCJkYXZpbmNpX2dwaW8iLCBEQTg1MF9MQ0RfQkxfUElOLCBOVUxMLCAwKSwKKwkJeyB9CisJfSwK
K307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2luZm8gZGE4NTBfbGNk
X2JhY2tsaWdodF9pbmZvID0geworCS5uYW1lCQk9ICJncGlvLWJhY2tsaWdodCIsCisJLmlkCQk9
IFBMQVRGT1JNX0RFVklEX05PTkUsCisJLnByb3BlcnRpZXMJPSBkYTg1MF9sY2RfYmFja2xpZ2h0
X3Byb3BzLAorfTsKKwogc3RhdGljIGludCBkYTg1MF9sY2RfaHdfaW5pdCh2b2lkKQogeworCXN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmJhY2tsaWdodDsKIAlpbnQgc3RhdHVzOwogCi0Jc3RhdHVz
ID0gZ3Bpb19yZXF1ZXN0KERBODUwX0xDRF9CTF9QSU4sICJsY2QgYmwiKTsKLQlpZiAoc3RhdHVz
IDwgMCkKLQkJcmV0dXJuIHN0YXR1czsKKwlncGlvZF9hZGRfbG9va3VwX3RhYmxlKCZkYTg1MF9s
Y2RfYmFja2xpZ2h0X2dwaW9fdGFibGUpOworCWJhY2tsaWdodCA9IHBsYXRmb3JtX2RldmljZV9y
ZWdpc3Rlcl9mdWxsKCZkYTg1MF9sY2RfYmFja2xpZ2h0X2luZm8pOworCWlmIChJU19FUlIoYmFj
a2xpZ2h0KSkKKwkJcmV0dXJuIFBUUl9FUlIoYmFja2xpZ2h0KTsKIAogCXN0YXR1cyA9IGdwaW9f
cmVxdWVzdChEQTg1MF9MQ0RfUFdSX1BJTiwgImxjZCBwd3IiKTsKLQlpZiAoc3RhdHVzIDwgMCkg
ewotCQlncGlvX2ZyZWUoREE4NTBfTENEX0JMX1BJTik7CisJaWYgKHN0YXR1cyA8IDApCiAJCXJl
dHVybiBzdGF0dXM7Ci0JfQogCi0JZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KERBODUwX0xDRF9CTF9Q
SU4sIDApOwogCWdwaW9fZGlyZWN0aW9uX291dHB1dChEQTg1MF9MQ0RfUFdSX1BJTiwgMCk7CiAK
LQkvKiBTd2l0Y2ggb2ZmIHBhbmVsIHBvd2VyIGFuZCBiYWNrbGlnaHQgKi8KKwkvKiBTd2l0Y2gg
b2ZmIHBhbmVsIHBvd2VyICovCiAJZGE4NTBfcGFuZWxfcG93ZXJfY3RybCgwKTsKIAotCS8qIFN3
aXRjaCBvbiBwYW5lbCBwb3dlciBhbmQgYmFja2xpZ2h0ICovCisJLyogU3dpdGNoIG9uIHBhbmVs
IHBvd2VyICovCiAJZGE4NTBfcGFuZWxfcG93ZXJfY3RybCgxKTsKIAogCXJldHVybiAwOwotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
