Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6618543686
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F83899E9;
	Thu, 13 Jun 2019 13:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AB6899E9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:28:09 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 65E452064A;
 Thu, 13 Jun 2019 13:28:08 +0000 (UTC)
Date: Thu, 13 Jun 2019 15:28:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "James (Qian) Wang" <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] komeda: no need to check return value of debugfs_create
 functions
Message-ID: <20190613132806.GA4863@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560432488;
 bh=OYIy6fuGP7B2Jx4JGIAV9d4PQdYuXNjgjV3ZXda7HYw=;
 h=Date:From:To:Cc:Subject:From;
 b=DuybSYW/rPpP2E4EDfTDC6I6x3OwnDyKEXP284aBWZJ19pexW6+VBaQEf2WsSPym8
 lLuqFp3FE7xsR3RpO4p9Hc0YaFufdJSB3IgYSsDlGtJwU6T4YHzwbsvS76ySczrsRp
 quxd+l7Ll7d//URaPflE+H604eJHyUtuMuk/o3Tk=
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
ZCBvbiB0aGlzLgoKQ2M6ICJKYW1lcyAoUWlhbikgV2FuZyIgPGphbWVzLnFpYW4ud2FuZ0Bhcm0u
Y29tPgpDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CkNjOiBCcmlhbiBTdGFy
a2V5IDxicmlhbi5zdGFya2V5QGFybS5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9k
ZXYuYwppbmRleCBjYTM1OTllNGE0ZDMuLjU4MTAwZWRmNThmYSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKQEAgLTUxLDkgKzUxLDYgQEAg
c3RhdGljIHZvaWQga29tZWRhX2RlYnVnZnNfaW5pdChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikK
IAkJcmV0dXJuOwogCiAJbWRldi0+ZGVidWdmc19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKCJr
b21lZGEiLCBOVUxMKTsKLQlpZiAoSVNfRVJSX09SX05VTEwobWRldi0+ZGVidWdmc19yb290KSkK
LQkJcmV0dXJuOwotCiAJZGVidWdmc19jcmVhdGVfZmlsZSgicmVnaXN0ZXIiLCAwNDQ0LCBtZGV2
LT5kZWJ1Z2ZzX3Jvb3QsCiAJCQkgICAgbWRldiwgJmtvbWVkYV9yZWdpc3Rlcl9mb3BzKTsKIH0K
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
