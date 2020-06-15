Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA341FA9A4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65BD6E823;
	Tue, 16 Jun 2020 07:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009256E375;
 Mon, 15 Jun 2020 15:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1592236661;
 bh=j+PBmo/R8jKyWORcywbmsA0MKDmsl/lXrcLHqjImqyI=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=izOVr15EUjENRdSNZrLjArOQqBMhJynLEaUA1zWlkZa+Oq2YOOzQantO1Uf4wg+xv
 c8rPpuMwOP4ABEq6Nkzowf6hpQKHq53YrkB3kfv77EF9Z0kVxKZB0QuThpM9UmC8N3
 00bIkqMrRG9p5gwCVT+gf9YJzs8+90LxDzvz5UDA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.107.236]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjPPs-1j4OvX30BO-00kyrY; Mon, 15
 Jun 2020 17:57:41 +0200
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux+etnaviv@armlinux.org.uk
Subject: Re: [PATCH v2] drm/etnaviv: fix ref count leak via pm_runtime_get_sync
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <77698453-95ba-5e99-bba5-2ca4a4918026@web.de>
Date: Mon, 15 Jun 2020 17:57:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:cnE7yTcEoKAz2gwfVrF5In4bRE8Sye/h13yy1qddljPU6McyGYq
 pbW0hjBcUJ0uHtFfUPeLF8PQ+ezgHGXIfueedFj2Or2n9B7VW6xH3d4/z+V4Z9JdLSdFEzE
 pd939kSAtUI689FPHlOMX0iWnU+2+644w1WJKBqp8wgC3sYTePjWgDPM4Lt9l2OAK1u8bnj
 KT7Tdogld7PUDyN1jZbJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:awtHdo3yDe0=:oRLD6eU3G1eHW3Xecm+dw4
 1X8UD8dL9lYh+K67JaqRR4ri8byecxZ6E3EcrH1/CPn5bHLun3hH34DtMf+zecBE6DvEC3wTZ
 D+vZeqKKjiazPKZc/V+DwI59CMzL57coWFiO8L3ZSy2C8o6n8U8aLpsvcyl8cYGPhej21Bjxu
 rSzrIs9b1330OfQmE4ivYV+1trpfgJWCoUpJSq9Tqag3sEZ7zMq0Z4pi9VdU0xv0aXoijQkwZ
 1wpeKEV5qWUBScanmO2wmnF04Ae199W30FvgUbagGaS7kfbFibWiCRy/r5k0DUXxe8bNSPgTI
 wSPjx7yu5BQm19qT3TA3pZSPeNfqSUZi5BLxZbPF2MrzwSG+vd6LEb26JqpyJvgRUatCDFDDz
 Wfx5F6VXx5r3ZBx9MsFTHjvm0MpSXxOQAy+ZR56RIFcmK97TJkNcmEcQR/OzsqXpjTrR6OPrI
 Fs5ikpXUGxjLb2rpQDNufUapFtqXZFO+XBtaeSdp3ZJWXwpkmO7zGBI0BIv6Z2aw62iwhpugP
 w6lrZ2rujevkCaSH8ApE6kJ3zxeXGxuYKys3f8nF338upeFh3Nq0gn5ig+Ag7xtp9H1v9LtLK
 vMTKG325mzOl1hVlHc/sBRC6xoRI/YgiXDFQd/uGHEYi+CeqZmjDZRy+JGj0PJohvtn0UtBqm
 JHuRPsa7G1o0nNtVJ0F++E9jmQG7nXfrdt2hFw3sBkpP6oVibXrYLrGbxw8N3ItsDqz+ss/p9
 kgt4tAFfyDEKPIHjLl8gwHCA37/JyenduIz5TJj+FHe8HNGEG5+tbC1iH9A1nfbPCVNB9rGx4
 0WI/3KgQlAio0llyo1fpp7tv/vUW0h4aTMfX+kR2BIpCdfb4LlcKjOy3psOOPxoF/h6VKEu+6
 ToftZ4GZ2QvhZTA+lcqVvVauThu1pvLHBeqRXefFUjr6LjFTb35cYHyYAboVr1By1aMVh0h+N
 3wXHeWYucm6MDNfdORQ3qvuG/a8bfj2vnOViF7E4COigcjBRFu6P2r2VduKwCSkSndBo0l9lC
 h/LaoGp+K5PF0/XV3Dz/E5Bnocl7KU38qSdqf2Z7LDo1JdR5dQMas4jN6NbvwqO9F/l1Gda84
 iUJRP4ia6mq6VlJAMBgoaa9RcyCUylhJVsWgIofpVA2LNvdlHeFbrMAbCsO7a0u5MSX4exIXx
 YCZuhywobJzQSroFtZJ7S7eABos84ba8MVpyDpo9Xj93aO1WySdknMuiuPjx6umfMXOx3vXn5
 88sE19pgIK8xROxMG
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen McCamant <mccamant@cs.umn.edu>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Navid Emamdoost <emamd001@umn.edu>, Qiushi Wu <wu000273@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

4oCmCj4gSW4gY2FzZSBvZiBmYWlsdXJlLCBkZWNyZW1lbnQgdGhlIHJlZiBjb3VudCBiZWZvcmUg
cmV0dXJuaW5nLgoKQ2FuIGl0IGJlIG5pY2VyIHRvIHVzZSB0aGUgdGVybSDigJxyZWZlcmVuY2Ug
Y291bnTigJ0gaGVyZT8KCldpbGwgdGhlIHRhZyDigJxGaXhlc+KAnSBiZWNvbWUgaGVscGZ1bCBm
b3IgdGhlIGNvbW1pdCBtZXNzYWdlPwoKCuKApgo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfZ3B1LmMK4oCmCj4gQEAgLTEzMjYsNiArMTMzMSw3IEBAICBzdHJ1Y3QgZG1h
X2ZlbmNlICpldG5hdml2X2dwdV9zdWJtaXQoc3RydWN0IGV0bmF2aXZfZ2VtX3N1Ym1pdCAqc3Vi
bWl0KQo+ICAJcmV0ID0gZXZlbnRfYWxsb2MoZ3B1LCBucl9ldmVudHMsIGV2ZW50KTsKPiAgCWlm
IChyZXQpIHsKPiAgCQlEUk1fRVJST1IoIm5vIGZyZWUgZXZlbnRzXG4iKTsKPiArCQlwbV9ydW50
aW1lX3B1dF9ub2lkbGUoZ3B1LT5kZXYpOwo+ICAJCXJldHVybiBOVUxMOwo+ICAJfQoKSSBzdWdn
ZXN0IHRvIG1vdmUgYSBiaXQgb2YgZXhjZXB0aW9uIGhhbmRsaW5nIGNvZGUgdG8gdGhlIGVuZCBv
Zgp0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uIHNvIHRoYXQgaXQgY2FuIGJlIGJldHRlciBy
ZXVzZWQgYWZ0ZXIKdGhlIGFkZGl0aW9uIG9mIGEganVtcCB0YXJnZXQgbGlrZSDigJxwdXRfcnVu
dGltZeKAnS4KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
