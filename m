Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163C2C145
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B579489C6C;
	Tue, 28 May 2019 08:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C3089C59
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:44 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8SeHi125327;
 Tue, 28 May 2019 03:28:40 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8Seln008958
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:40 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:39 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxuj125039;
 Tue, 28 May 2019 03:28:37 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 15/24] drm/bridge: tc358767: cleanup LT result check
Date: Tue, 28 May 2019 11:27:38 +0300
Message-ID: <20190528082747.3631-16-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032120;
 bh=JlsZ2PO14CosCIkb7J5yRi14vjS1dZt7kah/gxj8odc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=AnRSZps4eogS33UE64ZK9zxaARkJ0k0/E0R2P1pXRGreGXxNFdQd6CheVBHOWtRNX
 CydW91daj4nwhIzRufzgzERq4b5aPjJp0JiQQ1XZsgC6usL/axoOrGH9+7oD71tLyb
 QAFLFEMF0X7ToRwq8woYMNklbz7FUvuejd1tlYwo=
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

VGhlIGRyaXZlciBoYXMgYSBsb29wIGFmdGVyIGVuZGluZyBsaW5rIHRyYWluaW5nLCB3aGVyZSBp
dCByZWFkcyB0aGUKRFBDRCBsaW5rIHN0YXR1cyBhbmQgcHJpbnRzIGFuIGVycm9yIGlmIHRoYXQg
c3RhdHVzIGlzIG5vdCBvay4KClRoZSBsb29wIGlzIHVubmVjZXNzYXJ5LCBhcyBmYXIgYXMgSSBj
YW4gdW5kZXJzdGFuZCBmcm9tIERQIHNwZWNzLCBzbwpsZXQncyByZW1vdmUgaXQuIFdlIGNhbiBh
bHNvIHByaW50IHRoZSBtb3JlIHNwZWNpZmljIGVycm9ycyB0byBoZWxwCmRlYnVnZ2luZy4KClNp
Z25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+ClJldmll
d2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDYyICsrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggNDBmM2VmY2FkZTUwLi5kNzliMWQwY2Ew
ZGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTk4MCwzNCArOTgwLDQyIEBAIHN0
YXRpYyBpbnQgdGNfbWFpbl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJaWYgKHJl
dCA8IDApCiAJCWdvdG8gZXJyX2RwY2Rfd3JpdGU7CiAKLQkvKiBXYWl0ICovCi0JdGltZW91dCA9
IDEwMDsKLQlkbyB7Ci0JCXVkZWxheSgxKTsKLQkJLyogUmVhZCBEUENEIDB4MjAyLTB4MjA3ICov
Ci0JCXJldCA9IGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMoYXV4LCB0bXAgKyAyKTsKLQkJ
aWYgKHJldCA8IDApCi0JCQlnb3RvIGVycl9kcGNkX3JlYWQ7Ci0JfSB3aGlsZSAoKC0tdGltZW91
dCkgJiYKLQkJICEoZHJtX2RwX2NoYW5uZWxfZXFfb2sodG1wICsgMiwgIHRjLT5saW5rLmJhc2Uu
bnVtX2xhbmVzKSkpOworCS8qIENoZWNrIGxpbmsgc3RhdHVzICovCisJcmV0ID0gZHJtX2RwX2Rw
Y2RfcmVhZF9saW5rX3N0YXR1cyhhdXgsIHRtcCk7CisJaWYgKHJldCA8IDApCisJCWdvdG8gZXJy
X2RwY2RfcmVhZDsKIAotCWlmICh0aW1lb3V0ID09IDApIHsKLQkJLyogUmVhZCBEUENEIDB4MjAw
LTB4MjAxICovCi0JCXJldCA9IGRybV9kcF9kcGNkX3JlYWQoYXV4LCBEUF9TSU5LX0NPVU5ULCB0
bXAsIDIpOwotCQlpZiAocmV0IDwgMCkKLQkJCWdvdG8gZXJyX2RwY2RfcmVhZDsKLQkJZGV2X2Vy
cihkZXYsICJjaGFubmVsKHMpIEVRIG5vdCBva1xuIik7Ci0JCWRldl9pbmZvKGRldiwgIjB4MDIw
MCBTSU5LX0NPVU5UOiAweCUwMnhcbiIsIHRtcFswXSk7Ci0JCWRldl9pbmZvKGRldiwgIjB4MDIw
MSBERVZJQ0VfU0VSVklDRV9JUlFfVkVDVE9SOiAweCUwMnhcbiIsCi0JCQkgdG1wWzFdKTsKLQkJ
ZGV2X2luZm8oZGV2LCAiMHgwMjAyIExBTkUwXzFfU1RBVFVTOiAweCUwMnhcbiIsIHRtcFsyXSk7
Ci0JCWRldl9pbmZvKGRldiwgIjB4MDIwNCBMQU5FX0FMSUdOX1NUQVRVU19VUERBVEVEOiAweCUw
MnhcbiIsCi0JCQkgdG1wWzRdKTsKLQkJZGV2X2luZm8oZGV2LCAiMHgwMjA1IFNJTktfU1RBVFVT
OiAweCUwMnhcbiIsIHRtcFs1XSk7Ci0JCWRldl9pbmZvKGRldiwgIjB4MDIwNiBBREpVU1RfUkVR
VUVTVF9MQU5FMF8xOiAweCUwMnhcbiIsCi0JCQkgdG1wWzZdKTsKLQotCQlyZXR1cm4gLUVBR0FJ
TjsKKwlyZXQgPSAwOworCisJdmFsdWUgPSB0bXBbMF0gJiBEUF9DSEFOTkVMX0VRX0JJVFM7CisK
KwlpZiAodmFsdWUgIT0gRFBfQ0hBTk5FTF9FUV9CSVRTKSB7CisJCWRldl9lcnIodGMtPmRldiwg
IkxhbmUgMCBmYWlsZWQ6ICV4XG4iLCB2YWx1ZSk7CisJCXJldCA9IC1FTk9ERVY7CisJfQorCisJ
aWYgKHRjLT5saW5rLmJhc2UubnVtX2xhbmVzID09IDIpIHsKKwkJdmFsdWUgPSAodG1wWzBdID4+
IDQpICYgRFBfQ0hBTk5FTF9FUV9CSVRTOworCisJCWlmICh2YWx1ZSAhPSBEUF9DSEFOTkVMX0VR
X0JJVFMpIHsKKwkJCWRldl9lcnIodGMtPmRldiwgIkxhbmUgMSBmYWlsZWQ6ICV4XG4iLCB2YWx1
ZSk7CisJCQlyZXQgPSAtRU5PREVWOworCQl9CisKKwkJaWYgKCEodG1wWzJdICYgRFBfSU5URVJM
QU5FX0FMSUdOX0RPTkUpKSB7CisJCQlkZXZfZXJyKHRjLT5kZXYsICJJbnRlcmxhbmUgYWxpZ24g
ZmFpbGVkXG4iKTsKKwkJCXJldCA9IC1FTk9ERVY7CisJCX0KKwl9CisKKwlpZiAocmV0KSB7CisJ
CWRldl9lcnIoZGV2LCAiMHgwMjAyIExBTkUwXzFfU1RBVFVTOiAgICAgICAgICAgIDB4JTAyeFxu
IiwgdG1wWzBdKTsKKwkJZGV2X2VycihkZXYsICIweDAyMDMgTEFORTJfM19TVEFUVVMgICAgICAg
ICAgICAgMHglMDJ4XG4iLCB0bXBbMV0pOworCQlkZXZfZXJyKGRldiwgIjB4MDIwNCBMQU5FX0FM
SUdOX1NUQVRVU19VUERBVEVEOiAweCUwMnhcbiIsIHRtcFsyXSk7CisJCWRldl9lcnIoZGV2LCAi
MHgwMjA1IFNJTktfU1RBVFVTOiAgICAgICAgICAgICAgIDB4JTAyeFxuIiwgdG1wWzNdKTsKKwkJ
ZGV2X2VycihkZXYsICIweDAyMDYgQURKVVNUX1JFUVVFU1RfTEFORTBfMTogICAgMHglMDJ4XG4i
LCB0bXBbNF0pOworCQlkZXZfZXJyKGRldiwgIjB4MDIwNyBBREpVU1RfUkVRVUVTVF9MQU5FMl8z
OiAgICAweCUwMnhcbiIsIHRtcFs1XSk7CisJCWdvdG8gZXJyOwogCX0KIAogCXJldHVybiAwOwot
LSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAg
SGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9t
aWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
