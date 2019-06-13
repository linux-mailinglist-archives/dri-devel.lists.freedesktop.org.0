Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B42943688
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F32A89A4B;
	Thu, 13 Jun 2019 13:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A3A89A4B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:28:32 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E5572064A;
 Thu, 13 Jun 2019 13:28:31 +0000 (UTC)
Date: Thu, 13 Jun 2019 15:28:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] malidp: no need to check return value of debugfs_create
 functions
Message-ID: <20190613132829.GB4863@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560432512;
 bh=QSPMihBTRTa1Hg/XoriNItl64URMyDxhrvi2bA2Nbdc=;
 h=Date:From:To:Cc:Subject:From;
 b=D4fIgK+dK1Dn0F87oIO3yL4ISnsoAikBDVRK8szzlJr5vKfWTOA0qVGtEZEw/UQEL
 oJtYmZYg/Q9aWgz3tBtxZRwL8edOGKRAhxvrYLhPguvfxDSYmp/Bi1RhJgYKbGdNWg
 6bYq0jXODgoF0vKVB2Uop0aIJz63QKmj91ajhS1w=
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
ZCBvbiB0aGlzLgoKQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgpDYzogQnJp
YW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX2Rydi5jIHwgMTEgKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9tYWxpZHBfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYwppbmRleCAy
MTcyNWM5YjlmNWUuLjdkNzMyNDIzZDcwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9tYWxpZHBfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKQEAg
LTU0MiwxOSArNTQyLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIG1h
bGlkcF9kZWJ1Z2ZzX2ZvcHMgPSB7CiBzdGF0aWMgaW50IG1hbGlkcF9kZWJ1Z2ZzX2luaXQoc3Ry
dWN0IGRybV9taW5vciAqbWlub3IpCiB7CiAJc3RydWN0IG1hbGlkcF9kcm0gKm1hbGlkcCA9IG1p
bm9yLT5kZXYtPmRldl9wcml2YXRlOwotCXN0cnVjdCBkZW50cnkgKmRlbnRyeSA9IE5VTEw7CiAK
IAltYWxpZHBfZXJyb3Jfc3RhdHNfaW5pdCgmbWFsaWRwLT5kZV9lcnJvcnMpOwogCW1hbGlkcF9l
cnJvcl9zdGF0c19pbml0KCZtYWxpZHAtPnNlX2Vycm9ycyk7CiAJc3Bpbl9sb2NrX2luaXQoJm1h
bGlkcC0+ZXJyb3JzX2xvY2spOwotCWRlbnRyeSA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoImRlYnVn
IiwKLQkJCQkgICAgIFNfSVJVR08gfCBTX0lXVVNSLAotCQkJCSAgICAgbWlub3ItPmRlYnVnZnNf
cm9vdCwgbWlub3ItPmRldiwKLQkJCQkgICAgICZtYWxpZHBfZGVidWdmc19mb3BzKTsKLQlpZiAo
IWRlbnRyeSkgewotCQlEUk1fRVJST1IoIkNhbm5vdCBjcmVhdGUgZGVidWcgZmlsZVxuIik7Ci0J
CXJldHVybiAtRU5PTUVNOwotCX0KKwlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJkZWJ1ZyIsIFNfSVJV
R08gfCBTX0lXVVNSLCBtaW5vci0+ZGVidWdmc19yb290LAorCQkJICAgIG1pbm9yLT5kZXYsICZt
YWxpZHBfZGVidWdmc19mb3BzKTsKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
