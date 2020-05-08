Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4911CB931
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 22:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5BA6EB64;
	Fri,  8 May 2020 20:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E136E290
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 20:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588970918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DXpdhM+rtPQWCM2nbEhmD9wSJauxBVAjYhlNi9rDAcw=;
 b=h8issElVi6T4fVuCfxfeDO+L62ciUOaHLhaPICF+A8EvtVY5q+3nVD7i8PgE1fMxv0uI7F
 jIhh6S6AEXVqpqJS2EK1QQhOksybcX35Sq28VZMcmnftvEyHgS/A5HseF6MN9MBI4Ghiag
 /tBcAKZxVwB9R9+2qNkj7RNiYZmRRoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-50VqKQlfOxKcNNoYNFLF7A-1; Fri, 08 May 2020 16:48:37 -0400
X-MC-Unique: 50VqKQlfOxKcNNoYNFLF7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3612100CCC5;
 Fri,  8 May 2020 20:48:35 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-118-29.rdu2.redhat.com [10.10.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 649CA5D9CA;
 Fri,  8 May 2020 20:48:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC v4 03/12] drm/vblank: Register drmm cleanup action once per
 drm_vblank_crtc
Date: Fri,  8 May 2020 16:46:53 -0400
Message-Id: <20200508204751.155488-4-lyude@redhat.com>
In-Reply-To: <20200508204751.155488-1-lyude@redhat.com>
References: <20200508204751.155488-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2Ugd2UnbGwgYmUgYWxsb2NhdGluZyByZXNvdXJjZXMgZm9yIGt0aHJlYWRfY3JlYXRlX3dv
cmtlcigpIGluIHRoZQpuZXh0IGNvbW1pdCAod2hpY2ggY291bGQgZmFpbCBhbmQgcmVxdWlyZSB1
cyB0byBjbGVhbiB1cCB0aGUgbWVzcyksCmxldCdzIHNpbXBsaWZ5IHRoZSBjbGVhbnVwIHByb2Nl
c3MgYSBiaXQgYnkgcmVnaXN0ZXJpbmcgYQpkcm1fdmJsYW5rX2luaXRfcmVsZWFzZSgpIGFjdGlv
biBmb3IgZWFjaCBkcm1fdmJsYW5rX2NydGMgc28gdGhleSdyZQpzdGlsbCBjbGVhbmVkIHVwIGlm
IHdlIGZhaWwgdG8gaW5pdGlhbGl6ZSBvbmUgb2YgdGhlbS4KCkNoYW5nZXMgc2luY2UgdjM6Ciog
VXNlIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCgpIC0gRGFuaWVsIFZldHRlcgoKQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQ
YXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMg
fCAyMyArKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
dmJsYW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCmluZGV4IDc1OGJmNzRlMWNh
Yi4uYTRhOTAxMzU4NGUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKQEAgLTQ5MSwxNiArNDkxLDEyIEBA
IHN0YXRpYyB2b2lkIHZibGFua19kaXNhYmxlX2ZuKHN0cnVjdCB0aW1lcl9saXN0ICp0KQogCiBz
dGF0aWMgdm9pZCBkcm1fdmJsYW5rX2luaXRfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpwdHIpCiB7Ci0JdW5zaWduZWQgaW50IHBpcGU7Ci0KLQlmb3IgKHBpcGUgPSAwOyBw
aXBlIDwgZGV2LT5udW1fY3J0Y3M7IHBpcGUrKykgewotCQlzdHJ1Y3QgZHJtX3ZibGFua19jcnRj
ICp2YmxhbmsgPSAmZGV2LT52YmxhbmtbcGlwZV07CisJc3RydWN0IGRybV92YmxhbmtfY3J0YyAq
dmJsYW5rID0gcHRyOwogCi0JCVdBUk5fT04oUkVBRF9PTkNFKHZibGFuay0+ZW5hYmxlZCkgJiYK
LQkJCWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfTU9ERVNFVCkpOworCVdBUk5f
T04oUkVBRF9PTkNFKHZibGFuay0+ZW5hYmxlZCkgJiYKKwkJZHJtX2NvcmVfY2hlY2tfZmVhdHVy
ZShkZXYsIERSSVZFUl9NT0RFU0VUKSk7CiAKLQkJZGVsX3RpbWVyX3N5bmMoJnZibGFuay0+ZGlz
YWJsZV90aW1lcik7Ci0JfQorCWRlbF90aW1lcl9zeW5jKCZ2YmxhbmstPmRpc2FibGVfdGltZXIp
OwogfQogCiAvKioKQEAgLTUxMCw3ICs1MDYsNyBAQCBzdGF0aWMgdm9pZCBkcm1fdmJsYW5rX2lu
aXRfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpwdHIpCiAgKgogICogVGhp
cyBmdW5jdGlvbiBpbml0aWFsaXplcyB2Ymxhbmsgc3VwcG9ydCBmb3IgQG51bV9jcnRjcyBkaXNw
bGF5IHBpcGVsaW5lcy4KICAqIENsZWFudXAgaXMgaGFuZGxlZCBhdXRvbWF0aWNhbGx5IHRocm91
Z2ggYSBjbGVhbnVwIGZ1bmN0aW9uIGFkZGVkIHdpdGgKLSAqIGRybW1fYWRkX2FjdGlvbigpLgor
ICogZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkuCiAgKgogICogUmV0dXJuczoKICAqIFplcm8g
b24gc3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KQEAgLTUyOSwx
MCArNTI1LDYgQEAgaW50IGRybV92YmxhbmtfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1
bnNpZ25lZCBpbnQgbnVtX2NydGNzKQogCiAJZGV2LT5udW1fY3J0Y3MgPSBudW1fY3J0Y3M7CiAK
LQlyZXQgPSBkcm1tX2FkZF9hY3Rpb24oZGV2LCBkcm1fdmJsYW5rX2luaXRfcmVsZWFzZSwgTlVM
TCk7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKLQogCWZvciAoaSA9IDA7IGkgPCBudW1fY3J0
Y3M7IGkrKykgewogCQlzdHJ1Y3QgZHJtX3ZibGFua19jcnRjICp2YmxhbmsgPSAmZGV2LT52Ymxh
bmtbaV07CiAKQEAgLTU0MSw2ICs1MzMsMTEgQEAgaW50IGRybV92YmxhbmtfaW5pdChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgbnVtX2NydGNzKQogCQlpbml0X3dhaXRxdWV1
ZV9oZWFkKCZ2YmxhbmstPnF1ZXVlKTsKIAkJdGltZXJfc2V0dXAoJnZibGFuay0+ZGlzYWJsZV90
aW1lciwgdmJsYW5rX2Rpc2FibGVfZm4sIDApOwogCQlzZXFsb2NrX2luaXQoJnZibGFuay0+c2Vx
bG9jayk7CisKKwkJcmV0ID0gZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgZHJtX3ZibGFu
a19pbml0X3JlbGVhc2UsCisJCQkJCSAgICAgICB2YmxhbmspOworCQlpZiAocmV0KQorCQkJcmV0
dXJuIHJldDsKIAl9CiAKIAlEUk1fSU5GTygiU3VwcG9ydHMgdmJsYW5rIHRpbWVzdGFtcCBjYWNo
aW5nIFJldiAyICgyMS4xMC4yMDEzKS5cbiIpOwotLSAKMi4yNS40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
