Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AB74FDA1
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 20:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC62F89932;
	Sun, 23 Jun 2019 18:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9687E89824
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 17:38:01 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s15so12120976qtk.9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 10:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AJTlfv60mIEZXwta292fwI2V+CViZ4EgWCofxKK0NGs=;
 b=EUw1hzzfX12J47byoBV3yznSq14sBRMJj9gXouRFf2FyU+uHRrgFMW1AMYwoegHQq7
 h7QQ5Enae/Aj8GHThFNbpuyXLvDXOroBiPubRVwZRUHJyNL8KOni4s73w9nqNUkcb4Pz
 09JOOMusTsUJZzmYyjcFCKyfp273DOox4z36LmEac83tE2t2NKt/6vs2RmPQeIaldsE+
 kUq1XEeEzx299utr/4IG7rRHJAMtKGeadX7kF5izHPsGlEt6qtzxHsuYRSvuMA/O0nOr
 JZ47lhumBnP0ZAg/WDBTCcisxRYKdYoU0Zq1Bi7yycIy9VtfGnB7KEsFjlz4B7eoqo3s
 0h1A==
X-Gm-Message-State: APjAAAUn3ytnj7tgUI/WtzSJRg85HekaS3xypAlhqxisrlLmQseKVvJI
 smdEzf5eOUvNDdFpJhdtQbY=
X-Google-Smtp-Source: APXvYqwH+yYOfjzCW3mL/GB1bTYbCEj4p34EhH/Z+ZuKtywHkF9tf6qNfNiRq4tv8gn+Hit+u1OaYg==
X-Received: by 2002:a0c:8a26:: with SMTP id 35mr53756993qvt.158.1561311480668; 
 Sun, 23 Jun 2019 10:38:00 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru.
 [91.79.162.197])
 by smtp.gmail.com with ESMTPSA id c55sm5342498qtk.53.2019.06.23.10.37.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Jun 2019 10:38:00 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on client's
 registration
Date: Sun, 23 Jun 2019 20:37:41 +0300
Message-Id: <20190623173743.24088-1-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 23 Jun 2019 18:32:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AJTlfv60mIEZXwta292fwI2V+CViZ4EgWCofxKK0NGs=;
 b=iHScT30IUVlaqkLW9FzbhYmfsFdewA8sA9/jGO9fvv1CFkFaapyfjhYtPMDxpx7WzW
 peqA+Lbd+lGEDDlqc6bhpxo2vtxdqvAwXeMOqsDC2yrpiAkRZjv2rcfPUkk2fjeKgEty
 szZyXIM8vQcvDG6q7WfuEpa176sKGTPoGYenic5rMIk3Tgbw5tirSkXh0MgHcgK2gnfR
 yN6aB0oK2XUHb+7RdXbtjOaUTw1695sjBrVwyUu1wpwri23zr5KCh2FEwx+UmHNTrjxI
 u+lknBsrwiTYVIenkHVmcRK4yo1NQt5uk/PGhOZs00HokqYuB889l04tD33hRIM6SMh6
 LuTA==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gQVJNMzIgd2UgZG9uJ3Qgd2FudCBhbnkgb2YgdGhlIGNsaWVudHMgZGV2aWNlIHRvIGJlIGJh
Y2tlZCBieSB0aGUKaW1wbGljaXQgZG9tYWluLCBzaW1wbHkgYmVjYXVzZSB3ZSBjYW4ndCBhZmZv
cmQgc3VjaCBhIHdhc3RlIG9uIG9sZGVyClRlZ3JhIFNvQ3MgdGhhdCBoYXZlIHZlcnkgZmV3IGRv
bWFpbnMgYXZhaWxhYmxlIGluIHRvdGFsLiBUaGUgcmVjZW50IElPTU1VCnN1cHBvcnQgYWRkaXRp
b24gZm9yIHRoZSBWaWRlbyBEZWNvZGVyIGhhcmR3YXJlIHVuY292ZXJlZCB0aGUgcHJvYmxlbQp0
aGF0IGFuIHVuZm9ydHVuYXRlIGRyaXZlcnMgcHJvYmUgb3JkZXIgcmVzdWx0cyBpbiB0aGUgRFJN
IGRyaXZlciBwcm9iZQpmYWlsdXJlIGlmIENPTkZJR19BUk1fRE1BX1VTRV9JT01NVT15IGR1ZSB0
byBhIHNob3J0YWdlIG9mIElPTU1VIGRvbWFpbnMKY2F1c2VkIGJ5IHRoZSBpbXBsaWNpdCBiYWNr
aW5nLiBUaGUgaG9zdDF4X2NsaWVudF9yZWdpc3RlcigpIGlzIGEgY29tbW9uCmZ1bmN0aW9uIHRo
YXQgaXMgaW52b2tlZCBieSBhbGwgb2YgdGhlIHJlbGV2YW50IERSTSBkcml2ZXJzIGR1cmluZyB0
aGVpcnMKcHJvYmUgYW5kIGhlbmNlIGl0IGlzIGNvbnZlbmllbnQgdG8gcmVtb3ZlIHRoZSBpbXBs
aWNpdCBiYWNraW5nIHRoZXJlLApyZXNvbHZpbmcgdGhlIHByb2JsZW0uCgpTaWduZWQtb2ZmLWJ5
OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvaG9z
dDF4L2J1cy5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ob3N0MXgvYnVzLmMgYi9kcml2
ZXJzL2dwdS9ob3N0MXgvYnVzLmMKaW5kZXggNzQyYWE5ZmYyMWI4Li41NTlkZjM5NzRhZmIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYworKysgYi9kcml2ZXJzL2dwdS9ob3N0
MXgvYnVzLmMKQEAgLTE0LDYgKzE0LDEwIEBACiAjaW5jbHVkZSAiYnVzLmgiCiAjaW5jbHVkZSAi
ZGV2LmgiCiAKKyNpZiBJU19FTkFCTEVEKENPTkZJR19BUk1fRE1BX1VTRV9JT01NVSkKKyNpbmNs
dWRlIDxhc20vZG1hLWlvbW11Lmg+CisjZW5kaWYKKwogc3RhdGljIERFRklORV9NVVRFWChjbGll
bnRzX2xvY2spOwogc3RhdGljIExJU1RfSEVBRChjbGllbnRzKTsKIApAQCAtNzEwLDYgKzcxNCwy
MSBAQCBpbnQgaG9zdDF4X2NsaWVudF9yZWdpc3RlcihzdHJ1Y3QgaG9zdDF4X2NsaWVudCAqY2xp
ZW50KQogCXN0cnVjdCBob3N0MXggKmhvc3QxeDsKIAlpbnQgZXJyOwogCisjaWYgSVNfRU5BQkxF
RChDT05GSUdfQVJNX0RNQV9VU0VfSU9NTVUpCisJLyoKKwkgKiBUaGUgY2xpZW50J3MgZHJpdmVy
IGNvdWxkIGJlIGJhY2tlZCBieSBpbXBsaWNpdCBJT01NVSBtYXBwaW5nCisJICogYW5kIHdlIGRv
bid0IHdhbnQgdG8gaGF2ZSB0aGF0IGJlY2F1c2UgYWxsIG9mIGN1cnJlbnQgVGVncmEKKwkgKiBk
cml2ZXJzIGFyZSBtYW5hZ2luZyBJT01NVSBieSB0aGVtc2VsdmVzLiBUaGlzIGlzIGEgY29udmVu
aWVudAorCSAqIHBsYWNlIGZvciB1bm1hcHBpbmcgb2YgdGhlIGltcGxpY2l0IG1hcHBpbmcgYmVj
YXVzZSB0aGlzIGZ1bmN0aW9uCisJICogaXMgY2FsbGVkIGJ5IGFsbCBob3N0MXggZHJpdmVycyBk
dXJpbmcgdGhlaXJzIHByb2JlLgorCSAqLworCWlmIChjbGllbnQtPmRldi0+YXJjaGRhdGEubWFw
cGluZykgeworCQlzdHJ1Y3QgZG1hX2lvbW11X21hcHBpbmcgKm1hcHBpbmcgPQorCQkJdG9fZG1h
X2lvbW11X21hcHBpbmcoY2xpZW50LT5kZXYpOworCQlhcm1faW9tbXVfZGV0YWNoX2RldmljZShj
bGllbnQtPmRldik7CisJCWFybV9pb21tdV9yZWxlYXNlX21hcHBpbmcobWFwcGluZyk7CisJfQor
I2VuZGlmCiAJbXV0ZXhfbG9jaygmZGV2aWNlc19sb2NrKTsKIAogCWxpc3RfZm9yX2VhY2hfZW50
cnkoaG9zdDF4LCAmZGV2aWNlcywgbGlzdCkgewotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
