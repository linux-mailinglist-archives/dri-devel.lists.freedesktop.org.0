Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA72C137
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A3C89C82;
	Tue, 28 May 2019 08:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800B889C6A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8SCAb036557;
 Tue, 28 May 2019 03:28:12 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8SCdV082532
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:12 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:11 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8RxuY125039;
 Tue, 28 May 2019 03:28:09 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 04/24] drm/bridge: tc358767: cleanup spread & scrambler_dis
Date: Tue, 28 May 2019 11:27:27 +0300
Message-ID: <20190528082747.3631-5-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032092;
 bh=zglgFLpVP4JL3MMpBceWdoerjXngY6ehqc4ay5h7RXs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=PgHjMF74eQyVCGXllr2BNFXXZp4QvOM3/MQhiCoqmOPVb8ryWH7vtVC7U0+5dx/kf
 5OMAG51cZo5C9VcsOOovqkGCjkoZ5tJPS7JTkDKRa1oLHn7Iv2teF4mUhQ3EHJD2OX
 nqtk0PF+N9DHF0Agu6L6xeA8wZWfWE+7Fkll/eME=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWlub3IgY2xlYW51cHM6Ci0gVXNlIGJvb2wgZm9yIGJvb2xlYW4gZmllbGRzCi0gVXNlIERQX01B
WF9ET1dOU1BSRUFEXzBfNSBpbnN0ZWFkIG9mIEJJVCgwKQotIGRlYnVnIHByaW50IGRvd24tc3By
ZWFkIGFuZCBzY3JhbWJsZXIgc3RhdHVzCgpTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8
dG9taS52YWxrZWluZW5AdGkuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpk
YUBzYW1zdW5nLmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMgfCAxMyArKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMz
NTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCAzM2UyN2Rj
MmYwYjQuLmM0ZDk4MzRkNGIzMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMTg2
LDggKzE4Niw4IEBAIG1vZHVsZV9wYXJhbV9uYW1lZCh0ZXN0LCB0Y190ZXN0X3BhdHRlcm4sIGJv
b2wsIDA2NDQpOwogc3RydWN0IHRjX2VkcF9saW5rIHsKIAlzdHJ1Y3QgZHJtX2RwX2xpbmsJYmFz
ZTsKIAl1OAkJCWFzc3I7Ci0JaW50CQkJc2NyYW1ibGVyX2RpczsKLQlpbnQJCQlzcHJlYWQ7CisJ
Ym9vbAkJCXNjcmFtYmxlcl9kaXM7CisJYm9vbAkJCXNwcmVhZDsKIAl1OAkJCXN3aW5nOwogCXU4
CQkJcHJlZW1wOwogfTsKQEAgLTYyNiwxMyArNjI2LDEzIEBAIHN0YXRpYyBpbnQgdGNfZ2V0X2Rp
c3BsYXlfcHJvcHMoc3RydWN0IHRjX2RhdGEgKnRjKQogCXJldCA9IGRybV9kcF9kcGNkX3JlYWRi
KCZ0Yy0+YXV4LCBEUF9NQVhfRE9XTlNQUkVBRCwgdG1wKTsKIAlpZiAocmV0IDwgMCkKIAkJZ290
byBlcnJfZHBjZF9yZWFkOwotCXRjLT5saW5rLnNwcmVhZCA9IHRtcFswXSAmIEJJVCgwKTsgLyog
MC41JSBkb3duIHNwcmVhZCAqLworCXRjLT5saW5rLnNwcmVhZCA9IHRtcFswXSAmIERQX01BWF9E
T1dOU1BSRUFEXzBfNTsKIAogCXJldCA9IGRybV9kcF9kcGNkX3JlYWRiKCZ0Yy0+YXV4LCBEUF9N
QUlOX0xJTktfQ0hBTk5FTF9DT0RJTkcsIHRtcCk7CiAJaWYgKHJldCA8IDApCiAJCWdvdG8gZXJy
X2RwY2RfcmVhZDsKIAotCXRjLT5saW5rLnNjcmFtYmxlcl9kaXMgPSAwOworCXRjLT5saW5rLnNj
cmFtYmxlcl9kaXMgPSBmYWxzZTsKIAkvKiByZWFkIGFzc3IgKi8KIAlyZXQgPSBkcm1fZHBfZHBj
ZF9yZWFkYigmdGMtPmF1eCwgRFBfRURQX0NPTkZJR1VSQVRJT05fU0VULCB0bXApOwogCWlmIChy
ZXQgPCAwKQpAQCAtNjQ1LDYgKzY0NSw5IEBAIHN0YXRpYyBpbnQgdGNfZ2V0X2Rpc3BsYXlfcHJv
cHMoc3RydWN0IHRjX2RhdGEgKnRjKQogCQl0Yy0+bGluay5iYXNlLm51bV9sYW5lcywKIAkJKHRj
LT5saW5rLmJhc2UuY2FwYWJpbGl0aWVzICYgRFBfTElOS19DQVBfRU5IQU5DRURfRlJBTUlORykg
PwogCQkiZW5oYW5jZWQiIDogIm5vbi1lbmhhbmNlZCIpOworCWRldl9kYmcodGMtPmRldiwgIkRv
d25zcHJlYWQ6ICVzLCBzY3JhbWJsZXI6ICVzXG4iLAorCQl0Yy0+bGluay5zcHJlYWQgPyAiMC41
JSIgOiAiMC4wJSIsCisJCXRjLT5saW5rLnNjcmFtYmxlcl9kaXMgPyAiZGlzYWJsZWQiIDogImVu
YWJsZWQiKTsKIAlkZXZfZGJnKHRjLT5kZXYsICJEaXNwbGF5IEFTU1I6ICVkLCBUQzM1ODc2NyBB
U1NSOiAlZFxuIiwKIAkJdGMtPmxpbmsuYXNzciwgdGMtPmFzc3IpOwogCkBAIC05MzQsNyArOTM3
LDcgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtfc2V0dXAoc3RydWN0IHRjX2RhdGEgKnRjKQog
CQkJZGV2X2RiZyhkZXYsICJGYWlsZWQgdG8gc3dpdGNoIGRpc3BsYXkgQVNTUiB0byAlZCwgZmFs
bGluZyBiYWNrIHRvIHVuc2NyYW1ibGVkIG1vZGVcbiIsCiAJCQkJIHRjLT5hc3NyKTsKIAkJCS8q
IHRyeWluZyB3aXRoIGRpc2FibGVkIHNjcmFtYmxlciAqLwotCQkJdGMtPmxpbmsuc2NyYW1ibGVy
X2RpcyA9IDE7CisJCQl0Yy0+bGluay5zY3JhbWJsZXJfZGlzID0gdHJ1ZTsKIAkJfQogCX0KIAot
LSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAg
SGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9t
aWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
