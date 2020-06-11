Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EF11F6592
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 12:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3046E8E7;
	Thu, 11 Jun 2020 10:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835776E041
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 10:24:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id B41122A4B71
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 3/5] drm/bridge: tfp410: fix de-skew value retrieval from DT
Date: Thu, 11 Jun 2020 12:23:54 +0200
Message-Id: <20200611102356.31563-4-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHRmcDQxMCBoYXMgYSBkYXRhIGRlLXNrZXcgZmVhdHVyZSB0aGF0IGFsbG93cyB0aGUgdXNl
ciB0byBjb21wZW5zYXRlCnRoZSBza2V3IGJldHdlZW4gSURDSyBhbmQgdGhlIHBpeGVsIGRhdGEg
YW5kIGNvbnRyb2wgc2lnbmFscy4KCkluIHRoZSBkcml2ZXIsIHRoZSBzZXR1cCBhbmQgaG9sZCB0
aW1lcyBhcmUgY2FsY3VsYXRlZCBmcm9tIHRoZSBkZS1za2V3CnZhbHVlLiBUaGlzIHJldHJpZXZl
cyB0aGUgZGVza2V3IHZhbHVlIGZyb20gdGhlIERUIHVzaW5nIHRoZSBwcm9wZXIKZGF0YXR5cGUg
YW5kIHJhbmdlIGNoZWNrIGFzIGRlc2NyaWJlZCBieSB0aGUgYmluZGluZyAodTMyIGZyb20gMCB0
byA3KS4KClRoaXMgZml4IHJlc3VsdHMgZnJvbSBhIGNoYW5nZSBpbiB0aGUgdGksdGZwNDEwIERU
IGJpbmRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIENhw7F1ZWxvIDxyaWNhcmRvLmNhbnVl
bG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXRmcDQxMC5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXRmcDQxMC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwppbmRleCBlM2Vi
NjM2NGMwZjcuLmRmZGU4MTFmMzQxMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90aS10ZnA0MTAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCkBA
IC0yMjAsNyArMjIwLDcgQEAgc3RhdGljIGludCB0ZnA0MTBfcGFyc2VfdGltaW5ncyhzdHJ1Y3Qg
dGZwNDEwICpkdmksIGJvb2wgaTJjKQogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqZXA7CiAJdTMyIHBj
bGtfc2FtcGxlID0gMDsKIAl1MzIgYnVzX3dpZHRoID0gMjQ7Ci0JczMyIGRlc2tldyA9IDA7CisJ
dTMyIGRlc2tldyA9IDA7CiAKIAkvKiBTdGFydCB3aXRoIGRlZmF1bHRzLiAqLwogCSp0aW1pbmdz
ID0gdGZwNDEwX2RlZmF1bHRfdGltaW5nczsKQEAgLTI3NCwxMiArMjc0LDEyIEBAIHN0YXRpYyBp
bnQgdGZwNDEwX3BhcnNlX3RpbWluZ3Moc3RydWN0IHRmcDQxMCAqZHZpLCBib29sIGkyYykKIAl9
CiAKIAkvKiBHZXQgdGhlIHNldHVwIGFuZCBob2xkIHRpbWUgZnJvbSB2ZW5kb3Itc3BlY2lmaWMg
cHJvcGVydGllcy4gKi8KLQlvZl9wcm9wZXJ0eV9yZWFkX3UzMihkdmktPmRldi0+b2Zfbm9kZSwg
InRpLGRlc2tldyIsICh1MzIgKikmZGVza2V3KTsKLQlpZiAoZGVza2V3IDwgLTQgfHwgZGVza2V3
ID4gMykKKwlvZl9wcm9wZXJ0eV9yZWFkX3UzMihkdmktPmRldi0+b2Zfbm9kZSwgInRpLGRlc2tl
dyIsICZkZXNrZXcpOworCWlmIChkZXNrZXcgPiA3KQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCXRp
bWluZ3MtPnNldHVwX3RpbWVfcHMgPSBtaW4oMCwgMTIwMCAtIDM1MCAqIGRlc2tldyk7Ci0JdGlt
aW5ncy0+aG9sZF90aW1lX3BzID0gbWluKDAsIDEzMDAgKyAzNTAgKiBkZXNrZXcpOworCXRpbWlu
Z3MtPnNldHVwX3RpbWVfcHMgPSBtaW4oMCwgMTIwMCAtIDM1MCAqICgoczMyKWRlc2tldyAtIDQp
KTsKKwl0aW1pbmdzLT5ob2xkX3RpbWVfcHMgPSBtaW4oMCwgMTMwMCArIDM1MCAqICgoczMyKWRl
c2tldyAtIDQpKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
