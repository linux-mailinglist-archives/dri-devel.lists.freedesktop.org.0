Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3757E4365E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E20B899E7;
	Thu, 13 Jun 2019 13:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBC1899E8;
 Thu, 13 Jun 2019 13:19:48 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 822C421721;
 Thu, 13 Jun 2019 13:19:47 +0000 (UTC)
Date: Thu, 13 Jun 2019 15:19:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oded Gabbay <oded.gabbay@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] amdkfd: no need to check return value of debugfs_create
 functions
Message-ID: <20190613131945.GB3432@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560431988;
 bh=a5gii3M0+pgwOEwvHSw4uZHcbqNIK5lj417BywX9OeI=;
 h=Date:From:To:Cc:Subject:From;
 b=eB7XfpRA1r/2cvfXnH1W7p4WdQtfXIBpYpd/YBWLtPmY/w9072hCaid81vJPr9suh
 LEKLHMez3f/RNNXk/mEPLKOgNk7AblTvAIq+rYDtY0kghP/mdxUKKWMtP0HUITSmCk
 iSkQT2Iv1/Q6E0xbATgGJ5S+R6qpPqmgmUXZd65Q=
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIg
Y2hlY2sgdGhlCnJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1
dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNl
ZCBvbiB0aGlzLgoKQ2M6IE9kZWQgR2FiYmF5IDxvZGVkLmdhYmJheUBnbWFpbC5jb20+CkNjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6ICJEYXZpZCAoQ2h1bk1pbmcpIFpo
b3UiIDxEYXZpZDEuWmhvdUBhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2ln
bmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGVidWdmcy5jIHwgMzYgKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAy
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RlYnVnZnMuYwpp
bmRleCBhYjM3ZDM2ZDljZDYuLjE1YzUyMzAyNzI4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGVidWdmcy5jCkBAIC04NSwzNiArODUsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBmaWxlX29wZXJhdGlvbnMga2ZkX2RlYnVnZnNfaGFuZ19od3NfZm9wcyA9IHsKIAogdm9pZCBr
ZmRfZGVidWdmc19pbml0KHZvaWQpCiB7Ci0Jc3RydWN0IGRlbnRyeSAqZW50OwotCiAJZGVidWdm
c19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKCJrZmQiLCBOVUxMKTsKLQlpZiAoIWRlYnVnZnNf
cm9vdCB8fCBkZWJ1Z2ZzX3Jvb3QgPT0gRVJSX1BUUigtRU5PREVWKSkgewotCQlwcl93YXJuKCJG
YWlsZWQgdG8gY3JlYXRlIGtmZCBkZWJ1Z2ZzIGRpclxuIik7Ci0JCXJldHVybjsKLQl9Ci0KLQll
bnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJtcWRzIiwgU19JRlJFRyB8IDA0NDQsIGRlYnVnZnNf
cm9vdCwKLQkJCQkgIGtmZF9kZWJ1Z2ZzX21xZHNfYnlfcHJvY2VzcywKLQkJCQkgICZrZmRfZGVi
dWdmc19mb3BzKTsKLQlpZiAoIWVudCkKLQkJcHJfd2FybigiRmFpbGVkIHRvIGNyZWF0ZSBtcWRz
IGluIGtmZCBkZWJ1Z2ZzXG4iKTsKLQotCWVudCA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoImhxZHMi
LCBTX0lGUkVHIHwgMDQ0NCwgZGVidWdmc19yb290LAotCQkJCSAga2ZkX2RlYnVnZnNfaHFkc19i
eV9kZXZpY2UsCi0JCQkJICAma2ZkX2RlYnVnZnNfZm9wcyk7Ci0JaWYgKCFlbnQpCi0JCXByX3dh
cm4oIkZhaWxlZCB0byBjcmVhdGUgaHFkcyBpbiBrZmQgZGVidWdmc1xuIik7Ci0KLQllbnQgPSBk
ZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJybHMiLCBTX0lGUkVHIHwgMDQ0NCwgZGVidWdmc19yb290LAot
CQkJCSAga2ZkX2RlYnVnZnNfcmxzX2J5X2RldmljZSwKLQkJCQkgICZrZmRfZGVidWdmc19mb3Bz
KTsKLQotCWVudCA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoImhhbmdfaHdzIiwgU19JRlJFRyB8IDA2
NDQsIGRlYnVnZnNfcm9vdCwKLQkJCQkgIE5VTEwsCi0JCQkJICAma2ZkX2RlYnVnZnNfaGFuZ19o
d3NfZm9wcyk7CiAKLQlpZiAoIWVudCkKLQkJcHJfd2FybigiRmFpbGVkIHRvIGNyZWF0ZSBybHMg
aW4ga2ZkIGRlYnVnZnNcbiIpOworCWRlYnVnZnNfY3JlYXRlX2ZpbGUoIm1xZHMiLCBTX0lGUkVH
IHwgMDQ0NCwgZGVidWdmc19yb290LAorCQkJICAgIGtmZF9kZWJ1Z2ZzX21xZHNfYnlfcHJvY2Vz
cywgJmtmZF9kZWJ1Z2ZzX2ZvcHMpOworCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImhxZHMiLCBTX0lG
UkVHIHwgMDQ0NCwgZGVidWdmc19yb290LAorCQkJICAgIGtmZF9kZWJ1Z2ZzX2hxZHNfYnlfZGV2
aWNlLCAma2ZkX2RlYnVnZnNfZm9wcyk7CisJZGVidWdmc19jcmVhdGVfZmlsZSgicmxzIiwgU19J
RlJFRyB8IDA0NDQsIGRlYnVnZnNfcm9vdCwKKwkJCSAgICBrZmRfZGVidWdmc19ybHNfYnlfZGV2
aWNlLCAma2ZkX2RlYnVnZnNfZm9wcyk7CisJZGVidWdmc19jcmVhdGVfZmlsZSgiaGFuZ19od3Mi
LCBTX0lGUkVHIHwgMDY0NCwgZGVidWdmc19yb290LAorCQkJICAgIE5VTEwsICZrZmRfZGVidWdm
c19oYW5nX2h3c19mb3BzKTsKIH0KIAogdm9pZCBrZmRfZGVidWdmc19maW5pKHZvaWQpCi0tIAoy
LjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
