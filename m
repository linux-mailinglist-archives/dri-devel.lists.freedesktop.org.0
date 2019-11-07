Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85BCF295B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6990A6EF08;
	Thu,  7 Nov 2019 08:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60106EF10
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 711A73F30D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:41:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zewGiDr6oUf4 for <dri-devel@lists.freedesktop.org>;
 Thu,  7 Nov 2019 09:41:25 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id D278C3F43B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:41:24 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 36BAD36014C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:41:24 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 1/8] mm: Remove BUG_ON mmap_sem not held from
 xxx_trans_huge_lock()
Date: Thu,  7 Nov 2019 09:41:09 +0100
Message-Id: <20191107084116.33032-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107084116.33032-1-thomas_os@shipmail.org>
References: <20191107084116.33032-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573116084; bh=/VtZki6GCsW+3DEzZB0xqCHXTb7savVZuIvitIAE654=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oj1KMAYmLNFX3f9FtE6GGP1DMK+77HioS+MCJIpHDCu0aNBy9jGtFd7oN1wIh/l/S
 Xb6uVyRoZ/8kLcpoAhQxznd+RFNLtKYNOMp36VeHMPsB7WCcWjtQVeK77aSbPHl4P1
 nCIAvxTCfhsyC0rPeH32Ql7dDzh9AyKxarYVKxvI=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=oj1KMAYm; 
 dkim-atps=neutral
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIGNhbGxl
ciBuZWVkcyB0byBtYWtlIHN1cmUgdGhhdCB0aGUgdm1hIGlzIG5vdCB0b3JuIGRvd24gZHVyaW5n
IHRoZQpsb2NrIG9wZXJhdGlvbiBhbmQgY2FuIGFsc28gdXNlIHRoZSBpX21tYXBfcndzZW0gZm9y
IGZpbGUtYmFja2VkIHZtYXMuClJlbW92ZSB0aGUgQlVHX09OLiBXZSBjb3VsZCwgYXMgYW4gYWx0
ZXJuYXRpdmUsIGFkZCBhIHRlc3QgdGhhdCBlaXRoZXIKdm1hLT52bV9tbS0+bW1hcF9zZW0gb3Ig
dm1hLT52bV9maWxlLT5mX21hcHBpbmctPmlfbW1hcF9yd3NlbSBhcmUgaGVsZC4KCkNjOiBBbmRy
ZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWF0dGhldyBXaWxjb3gg
PHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBXaWxsIERlYWNvbiA8d2lsbC5kZWFjb25AYXJtLmNv
bT4KQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6IFJpayB2YW4g
UmllbCA8cmllbEBzdXJyaWVsLmNvbT4KQ2M6IE1pbmNoYW4gS2ltIDxtaW5jaGFuQGtlcm5lbC5v
cmc+CkNjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6IEh1YW5nIFlpbmcgPHlp
bmcuaHVhbmdAaW50ZWwuY29tPgpDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5j
b20+CkNjOiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbEBzaHV0ZW1vdi5uYW1lPgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+CkFja2VkLWJ5
OiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbEBzaHV0ZW1vdi5uYW1lPgotLS0KIGluY2x1ZGUv
bGludXgvaHVnZV9tbS5oIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9odWdlX21tLmggYi9pbmNsdWRlL2xpbnV4L2h1Z2Vf
bW0uaAppbmRleCA5M2Q1Y2YwYmM3MTYuLjBiODRlMTNlODhlMiAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9odWdlX21tLmgKKysrIGIvaW5jbHVkZS9saW51eC9odWdlX21tLmgKQEAgLTIxNiw3
ICsyMTYsNiBAQCBzdGF0aWMgaW5saW5lIGludCBpc19zd2FwX3BtZChwbWRfdCBwbWQpCiBzdGF0
aWMgaW5saW5lIHNwaW5sb2NrX3QgKnBtZF90cmFuc19odWdlX2xvY2socG1kX3QgKnBtZCwKIAkJ
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7Ci0JVk1fQlVHX09OX1ZNQSghcndzZW1faXNf
bG9ja2VkKCZ2bWEtPnZtX21tLT5tbWFwX3NlbSksIHZtYSk7CiAJaWYgKGlzX3N3YXBfcG1kKCpw
bWQpIHx8IHBtZF90cmFuc19odWdlKCpwbWQpIHx8IHBtZF9kZXZtYXAoKnBtZCkpCiAJCXJldHVy
biBfX3BtZF90cmFuc19odWdlX2xvY2socG1kLCB2bWEpOwogCWVsc2UKQEAgLTIyNSw3ICsyMjQs
NiBAQCBzdGF0aWMgaW5saW5lIHNwaW5sb2NrX3QgKnBtZF90cmFuc19odWdlX2xvY2socG1kX3Qg
KnBtZCwKIHN0YXRpYyBpbmxpbmUgc3BpbmxvY2tfdCAqcHVkX3RyYW5zX2h1Z2VfbG9jayhwdWRf
dCAqcHVkLAogCQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsKLQlWTV9CVUdfT05fVk1B
KCFyd3NlbV9pc19sb2NrZWQoJnZtYS0+dm1fbW0tPm1tYXBfc2VtKSwgdm1hKTsKIAlpZiAocHVk
X3RyYW5zX2h1Z2UoKnB1ZCkgfHwgcHVkX2Rldm1hcCgqcHVkKSkKIAkJcmV0dXJuIF9fcHVkX3Ry
YW5zX2h1Z2VfbG9jayhwdWQsIHZtYSk7CiAJZWxzZQotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
