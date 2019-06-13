Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA634368B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC39989A14;
	Thu, 13 Jun 2019 13:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D623B89A14
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:28:52 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 408632064A;
 Thu, 13 Jun 2019 13:28:52 +0000 (UTC)
Date: Thu, 13 Jun 2019 15:28:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] armada: no need to check return value of debugfs_create
 functions
Message-ID: <20190613132850.GC4863@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560432532;
 bh=Wtlj683ByFvCqQ+Ia8epyx+8IhDzFY5CELojYgrSwmg=;
 h=Date:From:To:Cc:Subject:From;
 b=FIRt6JARma7m6qwKIHtdiEuo1QocnecY4veG79sjhlarQkyxlmQCVLguHkGKFmMHy
 zlaCyz1PDjInMzLeHmtQ5ZZfR6/cDZnvaUgeG6CkVnn6br+TonpBoc5XK6Dr5Hzuk9
 NPG9uXm0UWF+NZKVgfwpXKm+EwW8kyl+PRj/l/gc=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIg
Y2hlY2sgdGhlCnJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1
dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNl
ZCBvbiB0aGlzLgoKQ2M6IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPgpDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2Zm
LWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2RlYnVnZnMuYyB8IDE0ICsrKystLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kZWJ1Z2ZzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kZWJ1Z2ZzLmMKaW5kZXggNjc1OGMzYTgzZGUyLi5h
ZWMxZTczNzIzNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2Rl
YnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kZWJ1Z2ZzLmMKQEAg
LTEwOSw3ICsxMDksNiBAQCBzdGF0aWMgc3RydWN0IGRybV9pbmZvX2xpc3QgYXJtYWRhX2RlYnVn
ZnNfbGlzdFtdID0gewogCiBpbnQgYXJtYWRhX2RybV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRybV9t
aW5vciAqbWlub3IpCiB7Ci0Jc3RydWN0IGRlbnRyeSAqZGU7CiAJaW50IHJldDsKIAogCXJldCA9
IGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyhhcm1hZGFfZGVidWdmc19saXN0LApAQCAtMTE4LDE1
ICsxMTcsMTAgQEAgaW50IGFybWFkYV9kcm1fZGVidWdmc19pbml0KHN0cnVjdCBkcm1fbWlub3Ig
Km1pbm9yKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlkZSA9IGRlYnVnZnNfY3JlYXRl
X2ZpbGUoInJlZyIsIFNfSUZSRUcgfCBTX0lSVVNSLAotCQkJCSBtaW5vci0+ZGVidWdmc19yb290
LCBtaW5vci0+ZGV2LCAmZm9wc19yZWdfcik7Ci0JaWYgKCFkZSkKLQkJcmV0dXJuIC1FTk9NRU07
Ci0KLQlkZSA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoInJlZ193ciIsIFNfSUZSRUcgfCBTX0lXVVNS
LAotCQkJCSBtaW5vci0+ZGVidWdmc19yb290LCBtaW5vci0+ZGV2LCAmZm9wc19yZWdfdyk7Ci0J
aWYgKCFkZSkKLQkJcmV0dXJuIC1FTk9NRU07CisJZGVidWdmc19jcmVhdGVfZmlsZSgicmVnIiwg
U19JRlJFRyB8IFNfSVJVU1IsIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QsCisJCQkgICAgbWlub3ItPmRl
diwgJmZvcHNfcmVnX3IpOworCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInJlZ193ciIsIFNfSUZSRUcg
fCBTX0lXVVNSLCBtaW5vci0+ZGVidWdmc19yb290LAorCQkJICAgIG1pbm9yLT5kZXYsICZmb3Bz
X3JlZ193KTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
