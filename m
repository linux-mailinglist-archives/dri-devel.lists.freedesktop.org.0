Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBCB37146E
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 13:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BEC6E8A6;
	Mon,  3 May 2021 11:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B437A6E8A6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 11:39:46 +0000 (UTC)
Date: Mon, 03 May 2021 11:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1620041984;
 bh=uocrp4bEehzt3fwHhrPVcGcrCfZ+U0dZ1DIwOIgLglw=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=uNjp6Z2LwOAN0q5kJsRUfa0GKPfUyYuD4KhlLcLPdE/PYvS/lYS55kidZyuYqq1vI
 It8XCYaCJwYesc/V2nAux9Y13I3FNlE+q9gSmuATENKiKujGAmF0c42HJYvVhp8wcd
 RDOxuav0W8GMHuv9FuWtO7tcySe3lB/B16fmtoMQeqNd/TAblWX8KaGjnErdCfx4Ye
 CHqD0hWd/cd0637zZyLxa4XVccre+sDjVqu4+UDHPxgKHbZbZuP5g0cPSTZWnzEzcz
 b+TVjt9xVFHexlAsHHaDDOaw6eehVE2pI4Dr751PMyAnCmP4xGeRFX1GKysJ8EMSIo
 xkN3ucPCsDq7g==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm: log errors in drm_gem_fb_init_with_funcs
Message-ID: <ZS4eX0PtTuNvHezILcTWeWINOkRyMS4krXND3cIE@cp4-web-032.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGV0IHRoZSB1c2VyIGtub3cgd2hhdCB3ZW50IHdyb25nIGluIGRybV9nZW1fZmJfaW5pdF93aXRo
X2Z1bmNzCmZhaWx1cmUgcGF0aHMuCgp2MjogdXNlIHByb3BlciBmb3JtYXQgc3BlY2lmaWVyIGZv
ciBzaXplX3QgKGtlcm5lbCB0ZXN0IHJvYm90KQoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxj
b250YWN0QGVtZXJzaW9uLmZyPgpSZXZpZXdlZC1ieTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVy
QHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpD
YzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogTm9yYWxmIFRyw7hubmVzIDxu
b3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBj
b2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hl
bHBlci5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZm
ZXJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIu
YwppbmRleCAxMDlkMTFmYjRjZDQuLmFlYjgwOGEwYmE1NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMKQEAgLTE1NSw4ICsxNTUsMTAgQEAgaW50IGRy
bV9nZW1fZmJfaW5pdF93aXRoX2Z1bmNzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJaW50IHJl
dCwgaTsKIAogCWluZm8gPSBkcm1fZ2V0X2Zvcm1hdF9pbmZvKGRldiwgbW9kZV9jbWQpOwotCWlm
ICghaW5mbykKKwlpZiAoIWluZm8pIHsKKwkJZHJtX2RiZ19rbXMoZGV2LCAiRmFpbGVkIHRvIGdl
dCBGQiBmb3JtYXQgaW5mb1xuIik7CiAJCXJldHVybiAtRUlOVkFMOworCX0KIAogCWZvciAoaSA9
IDA7IGkgPCBpbmZvLT5udW1fcGxhbmVzOyBpKyspIHsKIAkJdW5zaWduZWQgaW50IHdpZHRoID0g
bW9kZV9jbWQtPndpZHRoIC8gKGkgPyBpbmZvLT5oc3ViIDogMSk7CkBAIC0xNzUsNiArMTc3LDkg
QEAgaW50IGRybV9nZW1fZmJfaW5pdF93aXRoX2Z1bmNzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
CiAJCQkgKyBtb2RlX2NtZC0+b2Zmc2V0c1tpXTsKIAogCQlpZiAob2Jqc1tpXS0+c2l6ZSA8IG1p
bl9zaXplKSB7CisJCQlkcm1fZGJnX2ttcyhkZXYsCisJCQkJICAgICJHRU0gb2JqZWN0IHNpemUg
KCV6dSkgc21hbGxlciB0aGFuIG1pbmltdW0gc2l6ZSAoJXUpIGZvciBwbGFuZSAlZFxuIiwKKwkJ
CQkgICAgb2Jqc1tpXS0+c2l6ZSwgbWluX3NpemUsIGkpOwogCQkJZHJtX2dlbV9vYmplY3RfcHV0
KG9ianNbaV0pOwogCQkJcmV0ID0gLUVJTlZBTDsKIAkJCWdvdG8gZXJyX2dlbV9vYmplY3RfcHV0
OwotLSAKMi4zMS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
