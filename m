Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFB4101AD9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBA26EBB6;
	Tue, 19 Nov 2019 08:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376FC6E81F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:52 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q28so14895217lfa.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pVZm4+AsGt54/AHvdx3eAP7bC+QNmdTq1ECOejtB9ug=;
 b=bMaVsIydwO7Zjt/LQT5TVNHaLOy3nACLMxBQ37CcOAENYJyKAPEeK1oRp1GbiZcEfb
 qqs5lLzBCo44Ebglfg0nLIy9tlVZDqBu9yreoun+ZvGLoZnMPn5DjUdzntw5BBhUYYgV
 L9gF21Z6//kfGIxzjqPfQgY90ujWmy/ea689cAzBn4e7KxEGOHGwRNir4+visc2+bj0H
 SvwcH/NLR232NK6gw8w12YkzkexP+saFUAl+q0erjssYZqw/KJGErj+0+0XhHrehWtDJ
 q9Oe/in08tBBekSoLndtPKWQW6w7uijb7vS5dAJCaig5sKUj4cmdln9Cn2XgvesX0dg/
 5GgQ==
X-Gm-Message-State: APjAAAVwexguCny+VMbny8UgbcXJLstIovIUYZwqA9LgN1QaN+Cisu3t
 yDmotbejC/1CyOdvvgwx9ec=
X-Google-Smtp-Source: APXvYqzk8qaHiHHwXkRhrrIE1sEeZDnQkjSy/cXco/zY2jqK1B4NhcEaAJRIhsbVtVbWItOdvoICRw==
X-Received: by 2002:ac2:5685:: with SMTP id 5mr938614lfr.32.1574107550658;
 Mon, 18 Nov 2019 12:05:50 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:50 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 20/29] memory: tegra30-emc: Continue probing if timings are
 missing in device-tree
Date: Mon, 18 Nov 2019 23:02:38 +0300
Message-Id: <20191118200247.3567-21-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pVZm4+AsGt54/AHvdx3eAP7bC+QNmdTq1ECOejtB9ug=;
 b=Hl4MRFvNVFbaRCKT3CL7dUguz78YD7SwWlyB85FyaU+RDhrmRuvO25hyr5/hQKRArl
 bUtGu9gLcx03HQI+jESFcZox8afMHtY4vJHEo3caH5Yzhf/JFVlDV6+taKaJWkTy6WKU
 EWf4fMlgrsY4OGqInmYbsl+bGcnSQu9ZD4rnfK4+NASsdTi0u8f3P2qCQAukgyAid0nO
 tGUy948DNz9O0fQLbuznx0NjIg7Nr9JV94oJ0Emrdb8tmL1M+tBKFtvwGfnTCRAa7+ja
 k4AlGAReHCuXrLvpqeoULiJSMIB6D/K4saUGtIY0TzeIUc+k+Gm36+aoFXi8RffNgkx7
 zgng==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RU1DIGRyaXZlciB3aWxsIGJlY29tZSBtYW5kYXRvcnkgYWZ0ZXIgbWFraW5nIGl0IGludGVyY29u
bmVjdCBwcm92aWRlcgpiZWNhdXNlIGludGVyY29ubmVjdCB1c2VycyBsaWtlIGRpc3BsYXkgY29u
dHJvbGxlciBkcml2ZXIgd2lsbCBmYWlsIHRvCnByb2JlIHVzaW5nIG5ld2VyIGRldmljZS10cmVl
cyB0aGF0IGhhdmUgaW50ZXJjb25uZWN0IHByb3BlcnRpZXMuIFRodXMKbWFrZSBkcml2ZXIgdG8g
cHJvYmUgZXZlbiBpZiB0aW1pbmdzIGFyZSBtaXNzaW5nIGluIGRldmljZS10cmVlLCB0aGUKZnJl
cXVlbmN5IHNjYWxpbmcgd29uJ3QgYmUgYXZhaWxhYmxlIGluIHRoaXMgY2FzZSBiZWNhdXNlIHRo
ZXJlIHdpbGwgYmUKb25seSBvbmUgZnJlcXVlbmN5IGF2YWlsYWJsZSwgdGhlIGZyZXF1ZW5jeSB0
aGF0IGlzIGxlZnQgZnJvbSBib290bG9hZGVyLgoKU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBl
bmtvIDxkaWdldHhAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMzAt
ZW1jLmMgfCAyOSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVtb3J5L3RlZ3JhL3RlZ3JhMzAtZW1jLmMgYi9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTMw
LWVtYy5jCmluZGV4IDBiNmE1ZTQ1MWVhMy4uZWUxOTRlOGVkNTIxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTMwLWVtYy5jCisrKyBiL2RyaXZlcnMvbWVtb3J5L3RlZ3Jh
L3RlZ3JhMzAtZW1jLmMKQEAgLTk4NSw2ICs5ODUsMTEgQEAgc3RhdGljIHN0cnVjdCBkZXZpY2Vf
bm9kZSAqZW1jX2ZpbmRfbm9kZV9ieV9yYW1fY29kZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJdTMy
IHZhbHVlLCByYW1fY29kZTsKIAlpbnQgZXJyOwogCisJaWYgKG9mX2dldF9jaGlsZF9jb3VudChk
ZXYtPm9mX25vZGUpID09IDApIHsKKwkJZGV2X2luZm8oZGV2LCAiZGV2aWNlLXRyZWUgZG9lc24n
dCBoYXZlIG1lbW9yeSB0aW1pbmdzXG4iKTsKKwkJcmV0dXJuIE5VTEw7CisJfQorCiAJcmFtX2Nv
ZGUgPSB0ZWdyYV9yZWFkX3JhbV9jb2RlKCk7CiAKIAlmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKGRl
di0+b2Zfbm9kZSwgbnApIHsKQEAgLTEwNTQsNiArMTA1OSw5IEBAIHN0YXRpYyBsb25nIGVtY19y
b3VuZF9yYXRlKHVuc2lnbmVkIGxvbmcgcmF0ZSwKIAlzdHJ1Y3QgdGVncmFfZW1jICplbWMgPSBh
cmc7CiAJdW5zaWduZWQgaW50IGk7CiAKKwlpZiAoIWVtYy0+bnVtX3RpbWluZ3MpCisJCXJldHVy
biBjbGtfZ2V0X3JhdGUoZW1jLT5jbGspOworCiAJbWluX3JhdGUgPSBtaW4obWluX3JhdGUsIGVt
Yy0+dGltaW5nc1tlbWMtPm51bV90aW1pbmdzIC0gMV0ucmF0ZSk7CiAKIAlmb3IgKGkgPSAwOyBp
IDwgZW1jLT5udW1fdGltaW5nczsgaSsrKSB7CkBAIC0xMDkwLDEyICsxMDk4LDYgQEAgc3RhdGlj
IGludCB0ZWdyYV9lbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1
Y3QgdGVncmFfZW1jICplbWM7CiAJaW50IGVycjsKIAotCWlmIChvZl9nZXRfY2hpbGRfY291bnQo
cGRldi0+ZGV2Lm9mX25vZGUpID09IDApIHsKLQkJZGV2X2luZm8oJnBkZXYtPmRldiwKLQkJCSAi
ZGV2aWNlLXRyZWUgbm9kZSBkb2Vzbid0IGhhdmUgbWVtb3J5IHRpbWluZ3NcbiIpOwotCQlyZXR1
cm4gLUVOT0RFVjsKLQl9Ci0KIAlucCA9IG9mX3BhcnNlX3BoYW5kbGUocGRldi0+ZGV2Lm9mX25v
ZGUsICJudmlkaWEsbWVtb3J5LWNvbnRyb2xsZXIiLCAwKTsKIAlpZiAoIW5wKSB7CiAJCWRldl9l
cnIoJnBkZXYtPmRldiwgImNvdWxkIG5vdCBnZXQgbWVtb3J5IGNvbnRyb2xsZXIgbm9kZVxuIik7
CkBAIC0xMTA3LDEwICsxMTA5LDYgQEAgc3RhdGljIGludCB0ZWdyYV9lbWNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoIW1jKQogCQlyZXR1cm4gLUVOT0VOVDsKIAot
CW5wID0gZW1jX2ZpbmRfbm9kZV9ieV9yYW1fY29kZSgmcGRldi0+ZGV2KTsKLQlpZiAoIW5wKQot
CQlyZXR1cm4gLUVJTlZBTDsKLQogCWVtYyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXpl
b2YoKmVtYyksIEdGUF9LRVJORUwpOwogCWlmICghZW1jKSB7CiAJCW9mX25vZGVfcHV0KG5wKTsK
QEAgLTExMjUsMTAgKzExMjMsMTMgQEAgc3RhdGljIGludCB0ZWdyYV9lbWNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAllbWMtPmNsa19uYi5ub3RpZmllcl9jYWxsID0gZW1j
X2Nsa19jaGFuZ2Vfbm90aWZ5OwogCWVtYy0+ZGV2ID0gJnBkZXYtPmRldjsKIAotCWVyciA9IGVt
Y19sb2FkX3RpbWluZ3NfZnJvbV9kdChlbWMsIG5wKTsKLQlvZl9ub2RlX3B1dChucCk7Ci0JaWYg
KGVycikKLQkJcmV0dXJuIGVycjsKKwlucCA9IGVtY19maW5kX25vZGVfYnlfcmFtX2NvZGUoJnBk
ZXYtPmRldik7CisJaWYgKG5wKSB7CisJCWVyciA9IGVtY19sb2FkX3RpbWluZ3NfZnJvbV9kdChl
bWMsIG5wKTsKKwkJb2Zfbm9kZV9wdXQobnApOworCQlpZiAoZXJyKQorCQkJcmV0dXJuIGVycjsK
Kwl9CiAKIAllbWMtPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCk7CiAJaWYgKElTX0VSUihlbWMtPnJlZ3MpKQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
