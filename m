Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0289FDA5BD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 08:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB216E252;
	Thu, 17 Oct 2019 06:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EF06E252
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 06:44:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o28so916373wro.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 23:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2NqQBX25YVDLNUmJ5qwwRNJKu5MUMZp6/p5wXw7x9Fk=;
 b=ROjfxtc+uvDK81NxU+a4BnMmTT9yl+C47W1L8dwALjaoNM9DyqV9RqsH/TI31rsFbm
 6k4s/XtXSjp5NlqiHSs/4Zf4eUb7gWERMOKGToPaf90yyDaX9hj9/BKX64trhOdzPSdI
 AWLOSUDsPR3MhoxXG+TB3JpBFA0HYDtBYnWV6t9VN8olTEx+rzcShbrGXsjtBHhyWzCG
 V05F0O3GF4K+KQEd1D14iOB7P+L1T3m0TfLdUgon5Of3hHLBOw0TxOLARURdyQ8kg1yY
 tz6F3i6JSw0yZ2YgqkZKxRaog9g7xt5u0JftLxz14K4Nupa6wxqUSR5ukHULMa3dmyCk
 xuiQ==
X-Gm-Message-State: APjAAAW9fAw+qt9oo5wiKFgyQiYWqOJE3aPpLg1JK2a3k9KPjZed9MmA
 EaVdu6597L/goEqytPBGx0tfVD93ycI=
X-Google-Smtp-Source: APXvYqz2kPDXlDVZbxM6aJgjeeWUQFslwpeRiXPDGJF58Hm1esq8NuQYOCFwwfVKkw374xKe+hUwqw==
X-Received: by 2002:a5d:4ace:: with SMTP id y14mr1505529wrs.131.1571294672094; 
 Wed, 16 Oct 2019 23:44:32 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u1sm1122798wmc.38.2019.10.16.23.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 23:44:31 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] spi: pxa2xx: Set controller->max_transfer_size in dma mode
Date: Thu, 17 Oct 2019 08:44:26 +0200
Message-Id: <20191017064426.30814-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016195721.3714-1-daniel.vetter@ffwll.ch>
References: <20191016195721.3714-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2NqQBX25YVDLNUmJ5qwwRNJKu5MUMZp6/p5wXw7x9Fk=;
 b=bUOLmcmWgwe5oaYDwztL6kX7PXhjSj+7QZRk+PFutXcsJ4FkPo2TsjMRYuuxeeznJZ
 0S3zVqKNaMvE2ivqJpJVqWOqhro+SpQrVcnL6X+75OLyfcdsy3yJCIRqTrHaADxb/2JM
 gYzUnTdOycuiV0X8iuxO02z4ao2J/1nL89JXI=
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
Cc: linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gRE1BIG1vZGUgd2UgaGF2ZSBhIG1heGltdW0gdHJhbnNmZXIgc2l6ZSwgcGFzdCB0aGF0IHRo
ZSBkcml2ZXIKZmFsbHMgYmFjayB0byBQSU8gKHNlZSB0aGUgY2hlY2sgYXQgdGhlIHRvcCBvZiBw
eGEyeHhfc3BpX3RyYW5zZmVyX29uZSkuCkZhbGxpbmcgYmFjayB0byBQSU8gZm9yIGJpZyB0cmFu
c2ZlcnMgZGVmZWF0cyB0aGUgcG9pbnQgb2YgYSBkbWEgZW5naW5lLApoZW5jZSBzZXQgdGhlIG1h
eCB0cmFuc2ZlciBzaXplIHRvIGluZm9ybSBzcGkgY2xpZW50cyB0aGF0IHRoZXkgbmVlZAp0byBk
byBzb21ldGhpbmcgc21hcnRlci4KClRoaXMgd2FzIHVuY292ZXJlZCBieSB0aGUgZHJtX21pcGlf
ZGJpIHNwaSBwYW5lbCBjb2RlLCB3aGljaCBkb2VzCmxhcmdlIHNwaSB0cmFuc2ZlcnMsIGJ1dCBz
dG9wcGVkIHNwbGl0dGluZyB0aGVtIGFmdGVyOgoKY29tbWl0IGUxNDMzNjRiNGMxNzc0ZjY4ZTky
M2E1YTBiYjBmY2EyOGFjMjU4ODgKQXV0aG9yOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9u
bmVzLm9yZz4KRGF0ZTogICBGcmkgSnVsIDE5IDE3OjU5OjEwIDIwMTkgKzAyMDAKCiAgICBkcm0v
dGlueWRybTogUmVtb3ZlIHRpbnlkcm1fc3BpX21heF90cmFuc2Zlcl9zaXplKCkKCkFmdGVyIHRo
aXMgY29tbWl0IHRoZSBjb2RlIHJlbGllZCBvbiB0aGUgc3BpIGNvcmUgdG8gc3BsaXQgdHJhbnNm
ZXJzCmludG8gbWF4IGRtYS1hYmxlIGJsb2Nrcywgd2hpY2ggYWxzbyBwYXBlcmVkIG92ZXIgdGhl
IFBJTyBmYWxsYmFjayBpc3N1ZS4KCkZpeCB0aGlzIGJ5IHNldHRpbmcgdGhlIG92ZXJhbGwgbWF4
IHRyYW5zZmVyIHNpemUgdG8gdGhlIERNQSBsaW1pdCwKYnV0IG9ubHkgd2hlbiB0aGUgY29udHJv
bGxlciBydW5zIGluIERNQSBtb2RlLgoKRml4ZXM6IGUxNDMzNjRiNGMxNyAoImRybS90aW55ZHJt
OiBSZW1vdmUgdGlueWRybV9zcGlfbWF4X3RyYW5zZmVyX3NpemUoKSIpCkNjOiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVz
Lm9yZz4KQ2M6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29tPgpS
ZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtv
QGludGVsLmNvbT4KQ2M6IERhbmllbCBNYWNrIDxkYW5pZWxAem9ucXVlLm9yZz4KQ2M6IEhhb2pp
YW4gWmh1YW5nIDxoYW9qaWFuLnpodWFuZ0BnbWFpbC5jb20+CkNjOiBSb2JlcnQgSmFyem1payA8
cm9iZXJ0LmphcnptaWtAZnJlZS5mcj4KQ2M6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9y
Zz4KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtc3Bp
QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgotLQp2MjogQnJvd24gcGFwZXIgYmFnIGVkaXRpb24sIGl0IG5lZWRzIHRv
IGJlIGEgZnVuY3Rpb24gLi4uCi0tLQogZHJpdmVycy9zcGkvc3BpLXB4YTJ4eC5jIHwgNyArKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zcGkvc3BpLXB4YTJ4eC5jIGIvZHJpdmVycy9zcGkvc3BpLXB4YTJ4eC5jCmluZGV4IGJiNmEx
NGQxYWIwZi4uMDY4YzIxMDM3Njc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktcHhhMnh4
LmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLXB4YTJ4eC5jCkBAIC0xNjAyLDYgKzE2MDIsMTEgQEAg
c3RhdGljIGludCBweGEyeHhfc3BpX2Z3X3RyYW5zbGF0ZV9jcyhzdHJ1Y3Qgc3BpX2NvbnRyb2xs
ZXIgKmNvbnRyb2xsZXIsCiAJcmV0dXJuIGNzOwogfQogCitzdGF0aWMgc2l6ZV90IHB4YTJ4eF9z
cGlfbWF4X2RtYV90cmFuc2Zlcl9zaXplKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCit7CisJcmV0
dXJuIE1BWF9ETUFfTEVOOworfQorCiBzdGF0aWMgaW50IHB4YTJ4eF9zcGlfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+
ZGV2OwpAQCAtMTcwNyw2ICsxNzEyLDggQEAgc3RhdGljIGludCBweGEyeHhfc3BpX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCX0gZWxzZSB7CiAJCQljb250cm9sbGVyLT5j
YW5fZG1hID0gcHhhMnh4X3NwaV9jYW5fZG1hOwogCQkJY29udHJvbGxlci0+bWF4X2RtYV9sZW4g
PSBNQVhfRE1BX0xFTjsKKwkJCWNvbnRyb2xsZXItPm1heF90cmFuc2Zlcl9zaXplID0KKwkJCQlw
eGEyeHhfc3BpX21heF9kbWFfdHJhbnNmZXJfc2l6ZTsKIAkJfQogCX0KIAotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
