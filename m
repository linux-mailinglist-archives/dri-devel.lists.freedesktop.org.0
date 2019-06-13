Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA11435D4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 14:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6492589996;
	Thu, 13 Jun 2019 12:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406E689996;
 Thu, 13 Jun 2019 12:22:59 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B1B82082C;
 Thu, 13 Jun 2019 12:22:58 +0000 (UTC)
Date: Thu, 13 Jun 2019 14:22:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] msm: adreno: no need to check return value of debugfs_create
 functions
Message-ID: <20190613122256.GA30577@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560428579;
 bh=XbuVjN6h6G68INtlFDopuAtN+75uS8pGPgA9SalixQs=;
 h=Date:From:To:Cc:Subject:From;
 b=gopxNn85hjmQj9rFrQycCFRGmd1fQ1rChcT9QV+/qu1ceOMNdULRg5RYzZjO8OcAi
 +nKDhIZE5fJMGgR/neeJEh7cqQd29CNStKDYBwT7l7C+Zj2KXm11fxMpfocfAX5p8r
 LwyExS3ogkZy0ngby/dnoHsiXR5zM/1vREiR6924=
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIg
Y2hlY2sgdGhlCnJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1
dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNl
ZCBvbiB0aGlzLgoKQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KQ2M6IFNlYW4g
UGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogSm9yZGFuIENyb3VzZSA8
amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KQ2M6IE1hbXRhIFNodWtsYSA8bWFtdGFzaHVrbGE1NTVA
Z21haWwuY29tPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNj
OiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2Zm
LWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZGVidWdmcy5jIHwgOCArKy0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2RlYnVnZnMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZGVidWdmcy5jCmluZGV4IGQ5YWYzYWZmNjkwZi4uY2I4
ZGZjOTcwZWMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2Rl
YnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2RlYnVnZnMuYwpA
QCAtMTU4LDcgKzE1OCw2IEBAIERFRklORV9TSU1QTEVfQVRUUklCVVRFKHJlc2V0X2ZvcHMsIE5V
TEwsIHJlc2V0X3NldCwgIiVsbHhcbiIpOwogaW50IGE1eHhfZGVidWdmc19pbml0KHN0cnVjdCBt
c21fZ3B1ICpncHUsIHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKQogewogCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXY7Ci0Jc3RydWN0IGRlbnRyeSAqZW50OwogCWludCByZXQ7CiAKIAlpZiAoIW1pbm9y
KQpAQCAtMTc1LDExICsxNzQsOCBAQCBpbnQgYTV4eF9kZWJ1Z2ZzX2luaXQoc3RydWN0IG1zbV9n
cHUgKmdwdSwgc3RydWN0IGRybV9taW5vciAqbWlub3IpCiAJCXJldHVybiByZXQ7CiAJfQogCi0J
ZW50ID0gZGVidWdmc19jcmVhdGVfZmlsZSgicmVzZXQiLCBTX0lXVUdPLAotCQltaW5vci0+ZGVi
dWdmc19yb290LAotCQlkZXYsICZyZXNldF9mb3BzKTsKLQlpZiAoIWVudCkKLQkJcmV0dXJuIC1F
Tk9NRU07CisJZGVidWdmc19jcmVhdGVfZmlsZSgicmVzZXQiLCBTX0lXVUdPLCBtaW5vci0+ZGVi
dWdmc19yb290LCBkZXYsCisJCQkgICAgJnJlc2V0X2ZvcHMpOwogCiAJcmV0dXJuIDA7CiB9Ci0t
IAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
