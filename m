Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A911B6707
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB976EA0E;
	Thu, 23 Apr 2020 22:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5F96E5D4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 17:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587662523;
 bh=0wANgCj5vRUmo46v3iXsaF+0jDF5DQ3Fmrf02hSbXgU=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=D54CSUnmwW9cH0++14F8sZwVFZDDfn/Ucl0lulSQDI0BwbbMRLxBrMRZF5FqbdygA
 w7JK6IQxnB2otGP2gmCYk8hIS13nbuHZUUJReqfbw+VFWDpojxgy4DiUK/FcXcETfF
 BHNzm2xfP6YdwsLRXKNNuYpox8XimvDsc471I99c=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.69.235]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LgYi5-1ioo502nrh-00nvnS; Thu, 23
 Apr 2020 19:22:03 +0200
Subject: Re: console: Complete exception handling in newport_probe()
To: Dejin Zheng <zhengdejin5@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
References: <c62ec54f-348b-2eae-59eb-374dde4d49ad@web.de>
 <20200423142909.GB1562@nuc8i5> <f054f00c-b813-e0c2-fe2e-30ccdec1ff46@web.de>
 <20200423170245.GA3417@nuc8i5>
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
Message-ID: <68178ac9-ae0c-2f97-2620-38393741b3a1@web.de>
Date: Thu, 23 Apr 2020 19:22:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423170245.GA3417@nuc8i5>
Content-Language: en-US
X-Provags-ID: V03:K1:CuxDU18RlEXaVaH5TBmSF1Yz8GXdhpiC0Hdth0O6u3YTlh7AQBo
 QV55xahdWrbJB9UdfppJEzwqrf6Dn5BTJA+PNOKQrA9tt+QZwJPnLK7b04hkpRKADqroE6O
 IrkDfIeN3ONXuGeuh3a0pS+joEorhdEp88SVdLwAwasyBY2b7JMf45xgyXwQyI0aprK6SfZ
 xWrPZknZkORF0uMTOrtVQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aHpQ50XbsfM=:riywysSOpVopgGZohGamKR
 UydlNym/a89oBJDUp1USoPZuBRtdQ4psIgDkEKYi7eRBdtjlZqrQhLVjmQsFy/8ODzIYox6Mw
 f8agIq99CqRJiUMp5F8HXLy89fzXWq3FNvn14kfwqtA4TsnKpaB0IHA6NUXtgqvwsh5laN/9K
 9/IliCTps6gJVZ3Z6MbYSBYlESJ0hznApgDfpGg2dyPmZM5YhC73iV/qAg4ePjVaJCINfh4BI
 Qgvm/yQWBqXefIxyaQM7mrHdJDozHvvio4yy2GxJaUbOhhsbMxVijeS/nebVyqrH32k1z+/sl
 FtuF6Pf6i5YnE00yefvNTkA2VQPgOx9FgW5/nYuocA7lnO0uB4vqgvnp+njxk4SkaVGPMCaCI
 /+6YgYG42OtUkLevceXARCfN9aS365H2wSFsXpMwINlGAimLTbKk0Ev5+Yqj6CF/e1OQIKXWX
 j/u1ep54NN8iL6tJldrgGWMFPO3K/wTKR8IcKevhcJMFhrk5ewTjGC75G137oh1pHIU+LqNY8
 +HkvpZNzP+2DGedEOhksKQzk6do2CYIbP1AsJp9PbP7lM5ttCNz5xmJxOmgBdftL7IqTEyV4K
 vDTl4iPyNjsw3/GI8PR25p9ZSqIVwHGo7uyDq8H8sSAeZDicpCnOQkv84GFh+K5E1Txb6yYJy
 KDEDNQJKA8l8+lqmC/uFFmalczhCfNWfdEqc+O9vVznJPtu6hybVdA6NPIB8L+Hw/2q0lQ99f
 t4qPjkcciA+h9Fsmhrz1LEE2z9wyYapsq7dp8fl0FDvWoOyZt01QXltX8mIXLI9hmFbP4cvit
 ZPTLFUhawDexH6E8/eAJNe/u+DiN+oG/3tJrSj4huUbVojM0bURNxo0S1lwZPZMjUtsIUmCUX
 vN88lcY1Kro4aXsyT6nVXrdbw3oDWkwJzc3qhiRCW9V1eHEM1jFcP7g5OgCM48SNJQJ3sGnRc
 S233LgcbYagoao8z0xXTJjcN1+uGnjedgkBxsFDcFCohyLz5K5AEJLOdkK3B4BA1zWNx3Mh7n
 h1It4wRo7Qd/nRW9ckpNSi1YfosVJxfmhbDb3/T4bA5hLyW3jzSWfZxhxUbUXarpn5hd93RK7
 7BkTS4qrbz3Og+zRBNE3OeycWGuoLojMilZ4LlCufsriIWG5xHnsZYWPL9NhsihYdVDNIVJDH
 5eciLIxN6WEKgZpFVLzxtiUfp89d/CnAbNKg7PsGKuCTCSGRl/OpoVh6BJ9McgJQkPIKwSyWW
 1VOXwH+qJ4spT6PD8
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: =?UTF-8?Q?Thomas_Bogend=c3=b6rfer?= <tsbogend@alpha.franken.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0
L2xpbnV4LW5leHQuZ2l0L2xvZy9zY3JpcHRzL2NvY2NpbmVsbGUvZnJlZS9pb3VubWFwLmNvY2Np
CuKApgo+IFNvcnJ5LCBJIGRvIG5vdCBrbm93IGhvdyB0byB1c2UgdGhlIFNtUEwgc2NyaXB0LgoK
SSBwcm9wb3NlZCB0byB0YWtlIGFub3RoZXIgbG9vayBhdCB0aGUgaGVhZGVyIG9mIHN1Y2ggYSBm
aWxlLgpJIGltYWdpbmUgdGhhdCBwcm92aWRlZCBpbmZvcm1hdGlvbiBjYW4gdHJpZ2dlciBmdXJ0
aGVyIGRldmVsb3BtZW50IGlkZWFzCmZvciB0aGUgY29udGludWF0aW9uIG9mIGEgY29uc3RydWN0
aXZlIHBhdGNoIHJldmlldy4KCgo+PiBXb3VsZCB5b3UgbGlrZSB0byBsZXQgYW55IG1vcmUgc291
cmNlIGNvZGUgYW5hbHlzaXMgdG9vbHMgaGVscCB5b3UKPj4gdG8gZmluZCByZW1haW5pbmcgdXBk
YXRlIGNhbmRpZGF0ZXM/Cj4+Cj4geWVzLCBidXQgSSB0aGluayB0aGUgc291cmNlIGNvZGUgYW5h
bHlzaXMgdG9vbHMgb25seSBjYW4gZm91bmQgdGhlIHNpbXBsZQo+IHJlcGV0aXRpdmUgaXNzdWUu
CgpJIHN1Z2dlc3QgdG8gcmVjb25zaWRlciB0aGlzIHZpZXcuCgoKPiBhbmQgbmVlZCBzcGVuZCBz
b21lIHRpbWUgbGVhcm5pbmcgdG8gdXNlIGl0LgoKVGhpcyBhcHByb2FjaCBjYW4gYmUgdXN1YWwu
CgoKPiBhdCBkaWZmZXJlbnQgc3RhZ2VzLCBpdCBzaG91bGQgaGF2ZSBkaWZmZXJlbnQgbWV0aG9k
cyBmb3IgbWUuCgpJIGhvcGUgc28uCgoKPiBub3csIEkgdGhpbmsgdGhlIGJlc3QgZm9yIG1lIG1h
eSBiZSB0aGF0IHJlYWQgYW5kIGNoZWNrIHRoZSBzb3VyY2UgY29kZS4KClRoaXMgY2FuIGJlIGFs
c28gdXN1YWwgZm9yIGEgd2hpbGUuCgpJIGFtIGN1cmlvdXMgaG93IG11Y2ggc3BlY2lhbCB0b29s
cyBjYW4gbWFrZSB5b3VyIHNvZnR3YXJlIGRldmVsb3BtZW50cwptb3JlIGNvbnZlbmllbnQgYW5k
IHNhZmUgb3ZlciB0aW1lLgoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
