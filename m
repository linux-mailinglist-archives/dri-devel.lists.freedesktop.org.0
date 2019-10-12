Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C1D5C1E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E1E6E0CE;
	Mon, 14 Oct 2019 07:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC206E46D
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 09:10:22 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.155.250]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LmLac-1hkQtP34le-00ZulL; Sat, 12
 Oct 2019 11:10:09 +0200
Subject: [PATCH 2/2] drm/imx: Fix error handling for a kmemdup() call in
 imx_ldb_panel_ddc()
From: Markus Elfring <Markus.Elfring@web.de>
To: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Navid Emamdoost <navid.emamdoost@gmail.com>,
 Peter Senna Tschudin <peter.senna@collabora.com>
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
 <CAEkB2ETtVwtmkpup65D3wqyLn=84ZHt0QRo0dJK5GsV=-L=qVw@mail.gmail.com>
 <2abf545b-023b-853a-95ef-ce99e1896a5d@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d35e4483-e310-c5b8-467e-a6a51f49dfef@web.de>
Date: Sat, 12 Oct 2019 11:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <2abf545b-023b-853a-95ef-ce99e1896a5d@web.de>
Content-Language: en-US
X-Provags-ID: V03:K1:gGpFAHArYSlK95NnhPUT1yPh1BNAB5JeqT5lvvhGTGSuyV5zH2I
 sdx9BqVDf55FU4s0a2Cm5njWxw+t7cls6U+epxcVScFoBPkG6ro5FaEYcjWdVs8iiXsRNJz
 Ir1ii7xDM+EeNXS+FPMJmnKl04inQyH2ETcZch9USRk718nPTs6/sHQix9z6EirvZx4UTQS
 /4us6+FXgIvM701oHk1ig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5/nCnSwZ9tg=:Pz7hYiKFMER0YQ1nuGXVTk
 0qLcpA0GPD+SF8hHYWyxLv8GuY7/pYy4Qd+ChUgPr1GiPSDJKNi0+Y5Wk+AxyrxsDNSFRYDzI
 VUNWDz8xb7luxw4yMuFG/2aHCMhqdcctgeIlMs+s0PkWWPTahlTYOitYHP0iybDdDwZLhHPhL
 mPM9VnjJvk26Wn78pVP99BnKeHUQ5aKcRXHyO8jDTyAqgi7ywzMbLoeudujyp70OiFpXczG0N
 V0+gEjAwyu/IMbkqWju6wGVOsnFtzBKUroobPy9g6B/jiyHAsu1SX8x43LqfB/Spz5XmE6RHi
 g/iHkpY5mUTuwOh/B88UIPJstmTQwq7MdoUpz0lIHDen66dyQp8HKF+FhjdYT0DCtVgu754JO
 IEeFrFur/KLHfXtZG24sDy63ZMkGCltC7twI0qLpzdDn4h/01zHXXwuDABnEfSjVtWiFg5YMB
 w8VTuYqCptBruESxOwVtICvUISHaDhHg0kLNc4r+xGh4WHeTrJhmV0eczeF5FbS2Of82mrtKR
 Li50JJ7F3i2OoGDB+7yvGukKl9Hrgf3Nz8Mq5/iRM0pf+N0KktuVdstFM5jy3nABaE+Y8ohLo
 0r52fkz/l0ESnPDqYZwXzV0BzPIWD3RiNB1Q+CljwcCoG9ApHOlwXMJaWJfdnOPc0nOiC2Aok
 3M+KNAdhjrB3AP5tMILrcCxNaRD2eJ/+sCXr/pAgBnkfy2dfQq14SDeF1v3xwix/oTHpD6Ypn
 CahYImR//ezb11Cu7Vpish4gfMKppVzyPbX7lApbd5a7VyvSrlCu3XMSqm9cGVQBpTkglTbr9
 UweNZsunxTxuMBN4wC9hjW4iKb2rs2a7JEJ5tJpYYlQm7591AugbHFTrTgvRpZF0HIYOCQkqz
 gJPla36BVOSvRVgK6Y7DULT0r903ku08VWgwNVE+GYwcy8rxtM9XiuIt7zCxsPV3ziKv8nRPv
 xQCQ+72/i3DYoc+qVIKke+THo9CpOf1O87k5UOjB0tKrt0aj42vidjHPL3Z5m+XGiJkSasCSY
 ElzKLYLvETN+z3M2NgPD4Fl3XWhONPNPw+BWVINHyRoiej2J8F+ioP0h+NKyuhzBYLNZE4yo2
 Bq11r1IxumnT+QO3aTv8P9UBLMwLH2chzjWyAmkB+1UyunBkh6x06PeezDijqNiDjqWdaisAt
 A9UsC+vWOL0UbEYhjMEEH7mW4dlW7Vy9JJWTizKPz1S634mAWz5LP4Z5WZoCbVmUHxSDl313F
 VujI2nYe/zQgsjWWDhzovNDN3BBhq1iNtL54E1UC6fqvy1Q/MltWmqbd2TX8=
X-Mailman-Approved-At: Mon, 14 Oct 2019 07:17:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1570871410;
 bh=M5FM0f63IJo3NuLHIeAHlhcS0j5WNHrVgPGk3XVFb3Y=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=QYvL9JBcmq4Y7W7ZCAf9OAkEEoIP2SDY5O8iN/lGycmB9JtPDnIQB3IyBnlMiIgVs
 5znPrSa+v72kik/TCsIzwEPQuihhnFSnq2cB+6Yi2VMqSMEkVYPrc2+16UlnziB/rf
 0nEpoMoSaXhDpx4vTEBpG89Xq69ICncHZpO+8o5A=
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
Cc: kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Stephen McCamant <smccaman@umn.edu>, Navid Emamdoost <emamd001@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTYXQsIDEyIE9jdCAyMDE5IDEwOjMzOjQ3ICswMjAwCgpUaGUgcmV0dXJuIHZhbHVlIGZyb20g
YSBjYWxsIG9mIHRoZSBmdW5jdGlvbiDigJxrbWVtZHVw4oCdIHdhcyBub3QgY2hlY2tlZAppbiB0
aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uLiBUaHVzIGFkZCB0aGUgY29ycmVzcG9uZGluZyBl
cnJvciBoYW5kbGluZy4KClRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVzaW5nIHRoZSBDb2Nj
aW5lbGxlIHNvZnR3YXJlLgoKRml4ZXM6IGRjODBkNzAzODg4M2ZlY2EyYWJkMDg5NzUxNjViYzBk
ODNjODQ3NjIgKCJkcm0vaW14LWxkYjogQWRkIHN1cHBvcnQgdG8gZHJtLWJyaWRnZSIpClNpZ25l
ZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1s
ZGIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jCmluZGV4IDIwODA2OWZhZjE4My4u
ODAxYTIyNjVkZDExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYwpAQCAtNTY5LDYgKzU2OSw4IEBAIHN0
YXRpYyBpbnQgaW14X2xkYl9wYW5lbF9kZGMoc3RydWN0IGRldmljZSAqZGV2LAogCQkJY2hhbm5l
bC0+ZWRpZCA9IGttZW1kdXAoZWRpZHAsCiAJCQkJCQljaGFubmVsLT5lZGlkX2xlbiwKIAkJCQkJ
CUdGUF9LRVJORUwpOworCQkJaWYgKCFjaGFubmVsLT5lZGlkKQorCQkJCXJldHVybiAtRU5PTUVN
OwogCQl9IGVsc2UgaWYgKCFjaGFubmVsLT5wYW5lbCkgewogCQkJLyogZmFsbGJhY2sgdG8gZGlz
cGxheS10aW1pbmdzIG5vZGUgKi8KIAkJCXJldCA9IG9mX2dldF9kcm1fZGlzcGxheV9tb2RlKGNo
aWxkLAotLQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
