Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF92436A8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D84589A5C;
	Thu, 13 Jun 2019 13:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F98B89A56;
 Thu, 13 Jun 2019 13:33:59 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91A6D2082C;
 Thu, 13 Jun 2019 13:33:58 +0000 (UTC)
Date: Thu, 13 Jun 2019 15:33:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] i915: no need to check return value of debugfs_create
 functions
Message-ID: <20190613133356.GA6634@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560432839;
 bh=ejgkaRd0uUwfpHO86VKs0ScbsGALDRtHsmbzdmusvkw=;
 h=Date:From:To:Cc:Subject:From;
 b=EtqtVGcbMkxm0qGcBFRBVr4aD1tsNRNtqqSqbepUo/TvayHs3pSmOeydyPSwRDPeN
 0b+XuQNH+gwKwCNfyllYS6crd76EJp4BIqsu7LnVOUJgyWXQVvyM8pXkF1F87WX17r
 L7DYz2n0Y0G/7Z/a5DyPH9BNF4K4/uojPZtaPxfU=
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIg
Y2hlY2sgdGhlCnJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1
dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNl
ZCBvbiB0aGlzLgoKQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+
CkNjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+CkNj
OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+CkNjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNj
OiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1Z2Zz
LmMgfCAyMCArKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYwppbmRl
eCA1ODIzZmZiMTc4MjEuLmJkNWNmOGVjMjU0ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kZWJ1Z2ZzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1
Z2ZzLmMKQEAgLTQ2NDgsMjMgKzQ2NDgsMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpOTE1X2Rl
YnVnZnNfZmlsZXMgewogaW50IGk5MTVfZGVidWdmc19yZWdpc3RlcihzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqZGV2X3ByaXYpCiB7CiAJc3RydWN0IGRybV9taW5vciAqbWlub3IgPSBkZXZfcHJp
di0+ZHJtLnByaW1hcnk7Ci0Jc3RydWN0IGRlbnRyeSAqZW50OwogCWludCBpOwogCi0JZW50ID0g
ZGVidWdmc19jcmVhdGVfZmlsZSgiaTkxNV9mb3JjZXdha2VfdXNlciIsIFNfSVJVU1IsCi0JCQkJ
ICBtaW5vci0+ZGVidWdmc19yb290LCB0b19pOTE1KG1pbm9yLT5kZXYpLAotCQkJCSAgJmk5MTVf
Zm9yY2V3YWtlX2ZvcHMpOwotCWlmICghZW50KQotCQlyZXR1cm4gLUVOT01FTTsKKwlkZWJ1Z2Zz
X2NyZWF0ZV9maWxlKCJpOTE1X2ZvcmNld2FrZV91c2VyIiwgU19JUlVTUiwgbWlub3ItPmRlYnVn
ZnNfcm9vdCwKKwkJCSAgICB0b19pOTE1KG1pbm9yLT5kZXYpLCAmaTkxNV9mb3JjZXdha2VfZm9w
cyk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShpOTE1X2RlYnVnZnNfZmlsZXMpOyBp
KyspIHsKLQkJZW50ID0gZGVidWdmc19jcmVhdGVfZmlsZShpOTE1X2RlYnVnZnNfZmlsZXNbaV0u
bmFtZSwKLQkJCQkJICBTX0lSVUdPIHwgU19JV1VTUiwKLQkJCQkJICBtaW5vci0+ZGVidWdmc19y
b290LAotCQkJCQkgIHRvX2k5MTUobWlub3ItPmRldiksCi0JCQkJCSAgaTkxNV9kZWJ1Z2ZzX2Zp
bGVzW2ldLmZvcHMpOwotCQlpZiAoIWVudCkKLQkJCXJldHVybiAtRU5PTUVNOworCQlkZWJ1Z2Zz
X2NyZWF0ZV9maWxlKGk5MTVfZGVidWdmc19maWxlc1tpXS5uYW1lLAorCQkJCSAgICBTX0lSVUdP
IHwgU19JV1VTUiwKKwkJCQkgICAgbWlub3ItPmRlYnVnZnNfcm9vdCwKKwkJCQkgICAgdG9faTkx
NShtaW5vci0+ZGV2KSwKKwkJCQkgICAgaTkxNV9kZWJ1Z2ZzX2ZpbGVzW2ldLmZvcHMpOwogCX0K
IAogCXJldHVybiBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMoaTkxNV9kZWJ1Z2ZzX2xpc3QsCi0t
IAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
