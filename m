Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAFBD9A85
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 21:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6916E43A;
	Wed, 16 Oct 2019 19:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFCE6E43A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 19:57:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r5so29386916wrm.12
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 12:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NG+1N8pqfTQP+Jc9hKyg5BqhDrJd8BVaVZCbMzcwzpQ=;
 b=NXFFVu2uB04ZzTC5n0TvRgVtErod1TvR9Dkx30VR+OulqfzVfEdzXnCPpFP6D6SAq1
 AeK7H/x33Bi9uWj1pdAZCXb9OVwajycqrgKs4Oxg8us4N0ps9MPwJWSgTl/rFY9YnLTr
 H+DBPeLXnsfvMP4sLG8UCatrG6opfvQjta03I5TocJv+/n/gLRFswmiAQ3DGfDvWJF75
 V2JAix2rJrPSvEpjEybYN1x0ovJaeRk6iHTtIixjY+7rGYxLNmzFayU3wX68Uw8jsmCl
 RYvzofCw9OqO8aMXLgdzEqpJD/dlIcX3fgnGZ9TrIK6d18maIa+VZgSNBwHwy7T0dwEb
 xQpQ==
X-Gm-Message-State: APjAAAX5vJ7AiHwNOshWE7bknRgqegB1EXcuxYOh90tglJo6tzvn8pnM
 KctkWc3/pUuHeU/BlT9gDW38VrlBNp8=
X-Google-Smtp-Source: APXvYqzEDG6NFRpskcNp9TxpoXWvKld+9QHPgfTTWr0lWHp9luHTpO7e8V8TrlMGUFE74OMWti9u+w==
X-Received: by 2002:adf:f90f:: with SMTP id b15mr4197296wrr.76.1571255848864; 
 Wed, 16 Oct 2019 12:57:28 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id t13sm52362928wra.70.2019.10.16.12.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 12:57:28 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] spi: pxa2xx: Set controller->max_transfer_size in dma mode
Date: Wed, 16 Oct 2019 21:57:21 +0200
Message-Id: <20191016195721.3714-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NG+1N8pqfTQP+Jc9hKyg5BqhDrJd8BVaVZCbMzcwzpQ=;
 b=YOxOhnYlgzS2Tk4VK481ftR03oNVQw/9Gepa5WfUSzlqM+BqFzjdDM+kWHO2jePcGR
 1gDaEiYOejp+n93yW2HQFyRFRpAx7JDMeWoWz3Twfzv4Uhk8qXrU22BVHzR13vWuKqrK
 2u/LkjnBoN7Ec2egjOnU/zC9SUKH+fi5FsSCY=
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
dGVyQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvc3BpL3NwaS1weGEyeHguYyB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXB4
YTJ4eC5jIGIvZHJpdmVycy9zcGkvc3BpLXB4YTJ4eC5jCmluZGV4IGJiNmExNGQxYWIwZi4uZjc3
MjAxOTE1MDMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktcHhhMnh4LmMKKysrIGIvZHJp
dmVycy9zcGkvc3BpLXB4YTJ4eC5jCkBAIC0xNzA3LDYgKzE3MDcsNyBAQCBzdGF0aWMgaW50IHB4
YTJ4eF9zcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJfSBlbHNlIHsK
IAkJCWNvbnRyb2xsZXItPmNhbl9kbWEgPSBweGEyeHhfc3BpX2Nhbl9kbWE7CiAJCQljb250cm9s
bGVyLT5tYXhfZG1hX2xlbiA9IE1BWF9ETUFfTEVOOworCQkJY29udHJvbGxlci0+bWF4X3RyYW5z
ZmVyX3NpemUgPSBNQVhfRE1BX0xFTjsKIAkJfQogCX0KIAotLSAKMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
