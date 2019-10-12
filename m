Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ABDD5C1C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C00B89D5B;
	Mon, 14 Oct 2019 07:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EEB6E466
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 09:07:53 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.155.250]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lv7eE-1htKSI3OEs-010OUV; Sat, 12
 Oct 2019 11:07:45 +0200
Subject: [PATCH 1/2] drm/imx: Fix error handling for a kmemdup() call in
 imx_pd_bind()
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
Message-ID: <3fd6aa8b-2529-7ff5-3e19-05267101b2a4@web.de>
Date: Sat, 12 Oct 2019 11:07:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <2abf545b-023b-853a-95ef-ce99e1896a5d@web.de>
Content-Language: en-US
X-Provags-ID: V03:K1:W3Z0O1POMaaQIJ32IhrHrxFn2Y1KIKAiwjwlF8eRe4dGsAUf5tZ
 kPREuBKVCE1UElNcRmccWO6u+Pg6Cfl6+JDbCLzTlaSVqDnMsWMdpAN1Dx1xTLZzZZ9hkba
 PV0qOTC7vKI7tgwZI62Ee1Q3eoCmHzWNE+9ewrmFdwFjJvc3P8hv50eZDSxElt+0cZYgw6W
 wlQgsdfT1F7ofcdoJbtaQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oumwdnv/zE0=:3Iy6j1/x5cfqhd5YgzsPAQ
 GRw8wn8MLKMc1n7oovMS7iBTuLZtCMtfCa2aBX7tg9JlzdnYNx0ivcTgc1KAXMyuTssbgUSM4
 PfKlGp44/oxedaw1MM1A2p1O+AE2X2NcC0uwEX/I+wlCNzGiMY/M/OVLWcjt5jtoVB1MmeafT
 jep7Fg3gL2XmJCq99/L6Z1qgB8lfvDENs1mMwkbS879wvP5ucJziIdk62X24XkKWbqgpBpuVQ
 Ks40KuQvvpqDdbfQny5cnn2A3YUVhrAD2JLcRN3HNnqlK0RymL7KCirIArMP9a4ncao0zxHqT
 rlszRfFSm5sLKhK7X7OsYyVVouxF+270kLP5vj86xWNwk4IibhlyoyOYupajdRD08D+sJuKHC
 ydot2lyO4/2ZxJXLBrsz8ZQae2CaQBfOl2bDpBE5/mjGv+RKiecDXQZAdqvjACS0FYhO1k55S
 LxO2Q4ngVytMseTBfOna96yu2Mzv7KGlq8t77HLEvT6vFAlR5PMVPhCnnxajJ0Q0pFnztBR3f
 x6ODMqXyvK9Yf2wwW8ms9Xr/iuIoud2+EFIc9O8vTSjZnXgPIvS1+FpkmWA/Van2llceb5lbj
 UnZctnhzR6AMAaey3ESkLVsF6uq9lnxAR0AO7QCOaJR6JNizUkjzLg47nfA1rZ6ilirsYaZIJ
 KKeRT6H8hXEslNq75JQenRgfpUKHhLtzW5xstrMNbeTOELnAeQ6e8dBoNNfZPoPpp0hyGwXWL
 rxIVVhcIDP6wF2a13ElHbNv+witeXpZNv55UDWnxnPzWeye4mciX2vXlBjh0sLk1F9jFm8r9S
 fdPQTJm+I1d8EsPTeL+9qsOrmjJ38KIkd1+YEYXgeHcgtsSL/ln+9IHznyGHzKSxv/Jgr+oKU
 ne1zrzM7TpmiQjWskR1u9avXMC5EFVHuZoLRVUl2xkgPP6QUzkVahRwpsCDoYKZqb44VBn2Qi
 GkCNnMbNBA2UQPOW6n3mZQY3LU1ywTbHKAK6RsHlsaAxmOd10MsdLFtBtr511zYfczb7XZWFN
 72z7R7aC7cxDlml8zEFHN2XSghx6Cl/uLUuMLR4sIAcle8y3ZMLP6QD8IO0bBn0ixjkUKgbD6
 hxRxgVKWbPmoVvlrwA3IiOGjDjdDQuGjx5+PbqnYKs0FIBuJpslUohOy92hhRCT3hZoTww4GS
 pVkHv5MLP5vCWLLDIywUNDYUOxw/xQ7Hej5MXqmTAGPRAr0RinNHDxCScvqlPAdEby9rNsjXD
 rIz+m/SRaMSBFaIbvmD9KaC+c16VddxGKfCaoyN/k6k2ir04a2qIsfjIfny0=
X-Mailman-Approved-At: Mon, 14 Oct 2019 07:17:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1570871265;
 bh=AjczjtWa014d2oNkGkskMjgMbvAv8DZY578FD5Vwzro=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=FnFKrp2/XWEM8dOlFdZfqLelmhS/Ef+L70H6f1OB4kqmaR5PVi1L9G8BZechN+eRX
 cSS5t7bU4wnzXA5C1JVm1yz/CkMQMUNQhQEH9E9tzszzbMsPK6GxaeqGOar2TfAT3x
 Ji1bQ8scK5pozNpQvRnhMHEyt+j3Awwp/Uk4ODFI=
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
OiBTYXQsIDEyIE9jdCAyMDE5IDEwOjMwOjIxICswMjAwCgpUaGUgcmV0dXJuIHZhbHVlIGZyb20g
YSBjYWxsIG9mIHRoZSBmdW5jdGlvbiDigJxrbWVtZHVw4oCdIHdhcyBub3QgY2hlY2tlZAppbiB0
aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uLiBUaHVzIGFkZCB0aGUgY29ycmVzcG9uZGluZyBl
cnJvciBoYW5kbGluZy4KCkZpeGVzOiAxOTAyMmFhYWU2NzdkZmExNzFhNzE5ZTlkMWZmMDQ4MjNj
ZTY1YTY1ICgic3RhZ2luZzogZHJtL2lteDogQWRkIHBhcmFsbGVsIGRpc3BsYXkgc3VwcG9ydCIp
ClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdl
Lm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYyB8IDcgKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKaW5kZXggMzU1MThlNWRlMzU2Li4zOWM0
Nzk4ZjU2YjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxh
eS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jCkBAIC0yMTAs
OCArMjEwLDEzIEBAIHN0YXRpYyBpbnQgaW14X3BkX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCiAJCXJldHVybiAtRU5PTUVNOwoKIAll
ZGlkcCA9IG9mX2dldF9wcm9wZXJ0eShucCwgImVkaWQiLCAmaW14cGQtPmVkaWRfbGVuKTsKLQlp
ZiAoZWRpZHApCisJaWYgKGVkaWRwKSB7CiAJCWlteHBkLT5lZGlkID0ga21lbWR1cChlZGlkcCwg
aW14cGQtPmVkaWRfbGVuLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCFpbXhwZC0+ZWRpZCkgeworCQkJ
ZGV2bV9rZnJlZShkZXYsIGlteHBkKTsKKwkJCXJldHVybiAtRU5PTUVNOworCQl9CisJfQoKIAly
ZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhucCwgImludGVyZmFjZS1waXgtZm10IiwgJmZt
dCk7CiAJaWYgKCFyZXQpIHsKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
