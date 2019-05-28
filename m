Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 525522C14C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA9589C25;
	Tue, 28 May 2019 08:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDDE89D64
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Std2125404;
 Tue, 28 May 2019 03:28:55 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8StrN083285
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:55 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:55 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxup125039;
 Tue, 28 May 2019 03:28:53 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 21/24] drm/bridge: tc358767: read display_props in
 get_modes()
Date: Tue, 28 May 2019 11:27:44 +0300
Message-ID: <20190528082747.3631-22-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032135;
 bh=yt4VDSoNH82XtsNMbNMIAFZDhlRk/3y3DEaVtQfNor8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=MZk75ZZHU8VIWxiWl2AaAKuG8FtGIKlzIySNQ6vl/TLZeTTn87eHs9YzrNV+JqrA/
 8egI/HjPOx6ExaKIVPaYIk8zQrrTSC9vAXQj199fJQIi9U6YwpEUlMB9ybq4GMJzF9
 ShbU6uJeYm8CQJjMlXx0G7/ESi0oNntWOTZx2CbY=
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

V2UgbmVlZCB0byBrbm93IHRoZSBsaW5rIGJhbmR3aWR0aCB0byBmaWx0ZXIgb3V0IG1vZGVzIHdl
IGNhbm5vdApzdXBwb3J0LCBzbyB3ZSBuZWVkIHRvIGhhdmUgcmVhZCB0aGUgZGlzcGxheSBwcm9w
cyBiZWZvcmUgZG9pbmcgdGhlCmZpbHRlcmluZy4KClRvIGVuc3VyZSB3ZSBoYXZlIHVwIHRvIGRh
dGUgZGlzcGxheSBwcm9wcywgY2FsbCB0Y19nZXRfZGlzcGxheV9wcm9wcygpCmluIHRoZSBiZWdp
bm5pbmcgb2YgdGNfY29ubmVjdG9yX2dldF9tb2RlcygpLgoKU2lnbmVkLW9mZi1ieTogVG9taSBW
YWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY3LmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggZmZjYmVjZjY5ZDQwLi4yYjlkNjA0
NmQ3NmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTExODgsNiArMTE4OCwxMyBA
QCBzdGF0aWMgaW50IHRjX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvcikKIAlzdHJ1Y3QgdGNfZGF0YSAqdGMgPSBjb25uZWN0b3JfdG9fdGMoY29ubmVj
dG9yKTsKIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKIAl1bnNpZ25lZCBpbnQgY291bnQ7CisJaW50IHJl
dDsKKworCXJldCA9IHRjX2dldF9kaXNwbGF5X3Byb3BzKHRjKTsKKwlpZiAocmV0IDwgMCkgewor
CQlkZXZfZXJyKHRjLT5kZXYsICJmYWlsZWQgdG8gcmVhZCBkaXNwbGF5IHByb3BzOiAlZFxuIiwg
cmV0KTsKKwkJcmV0dXJuIDA7CisJfQogCiAJaWYgKHRjLT5wYW5lbCAmJiB0Yy0+cGFuZWwtPmZ1
bmNzICYmIHRjLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2RlcykgewogCQljb3VudCA9IHRjLT5wYW5l
bC0+ZnVuY3MtPmdldF9tb2Rlcyh0Yy0+cGFuZWwpOwotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlu
bGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
