Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4237986383
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B5F6E84C;
	Thu,  8 Aug 2019 13:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A9A88A27
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:44:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4FCCE2F3663;
 Thu,  8 Aug 2019 13:44:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B01AF194BB;
 Thu,  8 Aug 2019 13:44:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CB9489D31; Thu,  8 Aug 2019 15:44:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/17] drm/ttm: add drm_gem_ttm_mmap()
Date: Thu,  8 Aug 2019 15:44:09 +0200
Message-Id: <20190808134417.10610-10-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>
References: <20190808134417.10610-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 08 Aug 2019 13:44:26 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGhlbHBlciBmdW5jdGlvbiB0byBtbWFwIHR0bSBibydzIHZpYSBkcm1fZ2VtX29iamVjdF9m
dW5jcy0+bW1hcCgpLgoKTm90ZSB0aGF0IHdpdGggdGhpcyBjb2RlIHBhdGggYWNjZXNzIHZlcmlm
aWNhdGlvbiBpcyBkb25lIGJ5CmRybV9nZW1fbW1hcCgpIGFuZCB0dG1fYm9fZHJpdmVyLnZlcmlm
eV9hY2Nlc3MoKSBpcyBub3QgdXNlZC4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oICAg
ICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmMgfCAxMSArKysr
KysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3R0
bV9oZWxwZXIuaAppbmRleCA0M2M5ZGIzNTgzY2MuLjBkZTNmNDFhMzdmNCAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dl
bV90dG1faGVscGVyLmgKQEAgLTI2LDUgKzI2LDcgQEAgaW50IGRybV9nZW1fdHRtX2JvX2Rldmlj
ZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkgICAgICAgc3RydWN0IHR0bV9ib19k
ZXZpY2UgKmJkZXYsCiAJCQkgICAgICAgc3RydWN0IHR0bV9ib19kcml2ZXIgKmRyaXZlciwKIAkJ
CSAgICAgICBib29sIG5lZWRfZG1hMzIpOworaW50IGRybV9nZW1fdHRtX21tYXAoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpnZW0sCisJCSAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwog
CiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYwppbmRleCAwYzU3ZTlmZDUw
YjkuLmZhYmVjZWQ4Y2NmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRt
X2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYwpAQCAt
MzQsMyArMzQsMTQgQEAgaW50IGRybV9nZW1fdHRtX2JvX2RldmljZV9pbml0KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsCiAJCQkJCQkgICBuZWVkX2RtYTMyKTsKIH0KIEVYUE9SVF9TWU1CT0woZHJt
X2dlbV90dG1fYm9fZGV2aWNlX2luaXQpOworCitpbnQgZHJtX2dlbV90dG1fbW1hcChzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKmdlbSwKKwkJICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkK
K3sKKwlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gZHJtX2dlbV90dG1fb2ZfZ2VtKGdl
bSk7CisKKwl0dG1fYm9fZ2V0KGJvKTsKKwl0dG1fYm9fbW1hcF92bWFfc2V0dXAoYm8sIHZtYSk7
CisJcmV0dXJuIDA7Cit9CitFWFBPUlRfU1lNQk9MKGRybV9nZW1fdHRtX21tYXApOwotLSAKMi4x
OC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
