Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F332F435B8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 13:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012FD8994A;
	Thu, 13 Jun 2019 11:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167048994A;
 Thu, 13 Jun 2019 11:58:26 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7AB4921721;
 Thu, 13 Jun 2019 11:58:25 +0000 (UTC)
Date: Thu, 13 Jun 2019 13:58:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] nouveau: no need to check return value of debugfs_create
 functions
Message-ID: <20190613115823.GD26335@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560427106;
 bh=cGe+p90FeoQOJELNr9wyQKxxCpomFyBOQ0OLmgEEaJc=;
 h=Date:From:To:Cc:Subject:From;
 b=0HsWTpyJflUWZv5YUiBvho8c8n5L+4NMdFLpxWIo6YGMrUuEJEupSOjo57/xTLGpv
 isycZN/eUzQi7uAIRfgpKWnkao4dtxNT+vZHeh5XswTfaglKvhASVZR87YHHFp1o3T
 8/8wvxFnmmgEej4XWBYn03lRSKlkFXTMXoPeRy3o=
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIg
Y2hlY2sgdGhlCnJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1
dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNl
ZCBvbiB0aGlzLgoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IG5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kZWJ1Z2ZzLmMgfCAxMiArKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2RlYnVnZnMuYwppbmRleCA3ZGZiYmJjMWJlZWEuLjdiM2ZmNTVhYzlhMiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmMKQEAgLTIyNCwxNCArMjI0LDEwIEBAIG5v
dXZlYXVfZHJtX2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikKIAlzdHJ1Y3Qg
ZGVudHJ5ICpkZW50cnk7CiAJaW50IGksIHJldDsKIAotCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9T
SVpFKG5vdXZlYXVfZGVidWdmc19maWxlcyk7IGkrKykgewotCQlkZW50cnkgPSBkZWJ1Z2ZzX2Ny
ZWF0ZV9maWxlKG5vdXZlYXVfZGVidWdmc19maWxlc1tpXS5uYW1lLAotCQkJCQkgICAgIFNfSVJV
R08gfCBTX0lXVVNSLAotCQkJCQkgICAgIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QsIG1pbm9yLT5kZXYs
Ci0JCQkJCSAgICAgbm91dmVhdV9kZWJ1Z2ZzX2ZpbGVzW2ldLmZvcHMpOwotCQlpZiAoIWRlbnRy
eSkKLQkJCXJldHVybiAtRU5PTUVNOwotCX0KKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShu
b3V2ZWF1X2RlYnVnZnNfZmlsZXMpOyBpKyspCisJCWRlYnVnZnNfY3JlYXRlX2ZpbGUobm91dmVh
dV9kZWJ1Z2ZzX2ZpbGVzW2ldLm5hbWUsCisJCQkJICAgIFNfSVJVR08gfCBTX0lXVVNSLCBtaW5v
ci0+ZGVidWdmc19yb290LAorCQkJCSAgICBtaW5vci0+ZGV2LCBub3V2ZWF1X2RlYnVnZnNfZmls
ZXNbaV0uZm9wcyk7CiAKIAlyZXQgPSBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMobm91dmVhdV9k
ZWJ1Z2ZzX2xpc3QsCiAJCQkJICAgICAgIE5PVVZFQVVfREVCVUdGU19FTlRSSUVTLAotLSAKMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
