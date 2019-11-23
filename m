Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432851089B7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0DD895B4;
	Mon, 25 Nov 2019 08:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE946E037;
 Sat, 23 Nov 2019 19:54:38 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 66so3067401otd.9;
 Sat, 23 Nov 2019 11:54:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eBi2Kl2b0LYogSQpnyXzwnLfzkWlslGs6DkAiJ/ff28=;
 b=UYKD8snLCJ+4+8i4h0oDQddFFAb0D8JzG9L5PRSTt9wQ9v/PV3LPTHAL5p5HkaG7o3
 RHRVyYgdPTHJdFecrDsLPjg42O45mfK+ebyqjH8B2rNfbnVE1FbzBj1UFQIq0fKhS3ee
 2kiEKCTQgqA0YuAOf4QDipaQkAJWrJ8hquoA2C1j9t+aFjCg+jhTHPCHbqK9osuDZUEY
 20pEmDJXv5FtRZOPHtkWmYggvyg38O1aV77XwFEeNQ1vCVNELMun8Mze+ktcZMtt62Bw
 1BJ/OJs5TncvXCjhhxlA4Gyt9eInN6GtGtsC6TYltYUp2FTiPlUvv8+mM2v9QY0XYdda
 dkoA==
X-Gm-Message-State: APjAAAUcp8/DiRsanlhil7t7V30NOyYzgyDNgaHOQzNUSDJMHqsW6QiM
 ZKEZyvpCgVVzdUX35akFf98=
X-Google-Smtp-Source: APXvYqw6JW+8ls79ZOkf2SzoYXqnRhAFKkJsw0ixPFreStxhWdjEhfjD+sVK9MQap+7EvdpLTrZknw==
X-Received: by 2002:a9d:734a:: with SMTP id l10mr15424321otk.339.1574538877966; 
 Sat, 23 Nov 2019 11:54:37 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::7])
 by smtp.gmail.com with ESMTPSA id t11sm577254otq.18.2019.11.23.11.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2019 11:54:37 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: Remove tautological compare in eb_relocate_vma
Date: Sat, 23 Nov 2019 12:53:22 -0700
Message-Id: <20191123195321.41305-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eBi2Kl2b0LYogSQpnyXzwnLfzkWlslGs6DkAiJ/ff28=;
 b=YkJYM5C8pZQpOQTmbHQItGF438cTOP0Wxu7XuZE3iJCWH1utSuXHYIOmS9Mmxb+jCL
 A97dXlwNujP20TqqWJX3sz83Odhrwmlk3d6CJqRsxeOHc9Uem6OindxVvquqeghrmK4o
 KhwfPCQtEiVpkOfZuIyMmrnb7bTyAEUl6njOmQPqFR6WHZHKWXjNIn+qxnD5ay7hKzik
 Cz70Qse3hfob47U+wEpuz0mwv2O8NBZ1kDum2bB/wuwTYl+TM+18eVsp8DPIw/LWgdeA
 JFGZfmyjoBPUYfbHirI46Dkf3B4FhvxEB/nz28sKKkAr/t78q/x+L0mj6Gk3j3CNroEj
 EISg==
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LVd0YXV0b2xvZ2ljYWwtY29tcGFyZSB3YXMgcmVjZW50bHkgYWRkZWQgdG8gLVdhbGwgaW4gTExW
TSwgd2hpY2gKZXhwb3NlZCBhbiBpZiBzdGF0ZW1lbnQgaW4gaTkxNSB0aGF0IGlzIGFsd2F5cyBm
YWxzZToKCi4uL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmM6
MTQ4NToyMjogd2FybmluZzoKcmVzdWx0IG9mIGNvbXBhcmlzb24gb2YgY29uc3RhbnQgNTc2NDYw
NzUyMzAzNDIzNDg3IHdpdGggZXhwcmVzc2lvbiBvZgp0eXBlICd1bnNpZ25lZCBpbnQnIGlzIGFs
d2F5cyBmYWxzZQpbLVd0YXV0b2xvZ2ljYWwtY29uc3RhbnQtb3V0LW9mLXJhbmdlLWNvbXBhcmVd
CiAgICAgICAgaWYgKHVubGlrZWx5KHJlbWFpbiA+IE5fUkVMT0MoVUxPTkdfTUFYKSkpCiAgICAg
ICAgICAgIH5+fn5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fn4KClNpbmNlIHJlbWFp
biBpcyBhbiB1bnNpZ25lZCBpbnQsIGl0IGNhbiBuZXZlciBiZSBsYXJnZXIgdGhhbiBVSU5UX01B
WCwKd2hpY2ggaXMgbGVzcyB0aGFuIFVMT05HX01BWCAvIHNpemVvZihzdHJ1Y3QgZHJtX2k5MTVf
Z2VtX3JlbG9jYXRpb25fZW50cnkpLgpSZW1vdmUgdGhpcyBzdGF0ZW1lbnQgdG8gZml4IHRoZSB3
YXJuaW5nLgoKRml4ZXM6IDI4ODljYWE5MjMyMSAoImRybS9pOTE1OiBFbGltaW5hdGUgbG90cyBv
ZiBpdGVyYXRpb25zIG92ZXIgdGhlIGV4ZWNvYmplY3RzIGFycmF5IikKTGluazogaHR0cHM6Ly9n
aXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvNzc4Ckxpbms6IGh0dHBzOi8v
Z2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9jb21taXQvOTc0MGY5ZjBiNmU1ZDdkNTEwNDAy
N2FlZTdlZGM5YzUyMDJkZDA1MgpTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
ZWNoYW5jZWxsb3JAZ21haWwuY29tPgotLS0KCk5PVEU6IEFub3RoZXIgcG9zc2libGUgZml4IGZv
ciB0aGlzIGlzIHRvIGNoYW5nZSBVTE9OR19NQVggdG8gVUlOVF9NQVgKICAgICAgYnV0IEkgYW0g
bm90IHN1cmUgdGhhdCBpcyB3aGF0IHdhcyBpbnRlbmRlZCBieSB0aGlzIGNoZWNrLiBJJ20KICAg
ICAgaGFwcHkgdG8gcmVzcGluIGlmIHRoYXQgaXMgdGhlIGNhc2UuCgogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9leGVjYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhl
Y2J1ZmZlci5jCmluZGV4IGYwOTk4ZjEyMjVhZi4uOWVkNDM3OWI0YmM4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMKQEAgLTE0ODIsOCArMTQ4
Miw2IEBAIHN0YXRpYyBpbnQgZWJfcmVsb2NhdGVfdm1hKHN0cnVjdCBpOTE1X2V4ZWNidWZmZXIg
KmViLCBzdHJ1Y3QgaTkxNV92bWEgKnZtYSkKIAogCXVyZWxvY3MgPSB1NjRfdG9fdXNlcl9wdHIo
ZW50cnktPnJlbG9jc19wdHIpOwogCXJlbWFpbiA9IGVudHJ5LT5yZWxvY2F0aW9uX2NvdW50Owot
CWlmICh1bmxpa2VseShyZW1haW4gPiBOX1JFTE9DKFVMT05HX01BWCkpKQotCQlyZXR1cm4gLUVJ
TlZBTDsKIAogCS8qCiAJICogV2UgbXVzdCBjaGVjayB0aGF0IHRoZSBlbnRpcmUgcmVsb2NhdGlv
biBhcnJheSBpcyBzYWZlCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
