Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86AE12C2C5
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 15:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947D689DF9;
	Sun, 29 Dec 2019 14:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2A689DAB
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 12:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1577621653;
 bh=v9ZQLq/nd7R0yrRqnDVitwqzfTu5N1j7iE+Pkc0Sx/A=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=ovjL315udvAGZL5O9953tIBTJyqmhupoLtwu0iApn9jZ279tWma4ppqdbrXHC6All
 m873WRuRYBv5LNHL6b0XgqAPWxOlFHXAvsB8bHqV5nwWfHGWFc5gxKaNQ6MioD1qJo
 CP2b+c3Gi5yFOANuDfSef4hYFC7DSHpqxR0C2VUM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.107.43]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M7bQ3-1jia5i0zvL-00xGJI; Sun, 29
 Dec 2019 13:14:13 +0100
Subject: Re: drm/v3d: remove duplicated kfree in v3d_submit_cl_ioctl
To: yu kuai <yukuai3@huawei.com>, Daniel Vetter <daniel@ffwll.ch>,
 Navid Emamdoost <navid.emamdoost@gmail.com>, Eric Anholt <eric@anholt.net>,
 dri-devel@lists.freedesktop.org
References: <20191225131715.3527-1-yukuai3@huawei.com>
 <0db93c30-2c87-9824-31be-a15c0d141ab5@web.de>
 <23c5fdc5-b5ee-fd61-4c33-5e4442cdf305@huawei.com>
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
Message-ID: <55da3be6-ea90-e554-775a-de610b8fbf7b@web.de>
Date: Sun, 29 Dec 2019 13:14:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <23c5fdc5-b5ee-fd61-4c33-5e4442cdf305@huawei.com>
Content-Language: en-US
X-Provags-ID: V03:K1:NxZG3Yl+xc5cKTxtlzSDJxhQK42vuNf9oU8+h4F1fM1fgZzI2RJ
 m1iKSi7sW/5qer0CaYPv+GDxv9BrSciJU3bHgnTehzLzd//OXleVwNCbRqagZbWXmnQqUtm
 NBt2jPEWLjl21bitPLiH69inO1lR309qQW8XJfnTNS7bzim8ruQG+7fJBP9wV7ZQEptpYmL
 JhGKy2Wq2aznpaIHf9oOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/5DBLl8iG6A=:ZjXz4JYAES13v03vOIIeMe
 E5upUTPwIlc7ua838WnWGL7YYAxlfXweW7oxxv74sQojQkh0dLyg2fNX3jCZwifGD5VUGN/OO
 rEeta/AHmyubkCRgSxBcoxKKRpUgoPGgQoW+Bisy6T5lap+PjLA059XborcaKxQrZK8rRz655
 1XIuKSuiZnHZCMx/zvb3+pMzF1uXFZcy8lu5GfwYqyn7H+ja37XfFkUnhrbGv0P2nx7/li/ac
 t7NNSJ6m8QXfzvuTvpL0GuvI90hiaJh4qvb0SPj2fUdTYwjBu7Hq5mpgT6hTyEY4AULylCkG4
 cZrnt54F1xy5KFAgMPOpz5RUbhciS+22dpvkOTjnk7RclUl5iPx3D79QMavt6ZpyZcFLe4agk
 wRPHRTUTZbY8MvCm7d5oE7kI/E2i7DIYTAF3T4sKYG52xJYTHd1Efa08SQ/PjBfl+0Ds5xuTG
 N8MPFNbngSSOPZEgOpctJqgCHIMMpwGpgcgmya3yvPTJEUom8WsV3kmoJWr0254Mzkj7XuGDs
 U/10pp/NoGY3TSakxY7rZOytxBcHuHgA/gUZyx2hxp01p+bs699w3s8h+GBvv260uHapN+Eqg
 3zKHq4eZCpVqccvaxtCaEo/AQux1OU6lpTn8yFb1k+U/vHdz8HkpDavd/vnLHTzzjrLTp1/7H
 s3G7VyOSykcT388TQz0gOL61D+dFCEt6OlyXKuO4yda8oMu5A0cy30GIfaYvfk9/F/ZdT2wUr
 oVRWapJpezy4qooTAUSWNgADKvlclnDLsq8OtGn6nRo+NXJ37ZYcoy5rZphHAQbmdbFCXvspO
 IDiLFqhLS/RXFifuw8KdE+GrBmG2k462+ZbAVkbAEaC+Ht5C1GB8t0HsU1N7sz5tBQSht2/Yx
 6ttex3azIS4o6mTVKXNG6YMhG4HGRb+XRr8/gAfN1zaVWxW5WjlsrN9h+Nwe5RRtwe+O7yVRV
 rh7iARnpEXa9f7B/Oqwu6IXv2q1K+9jxrRR07Pu41Nj/EJEtt+mDv5NsIFX7Dv5Sr+HzFNkW9
 IjbZz9oOX3d2YhUXTqCUX0vQG+P/iHVna8hdGh3woyFurk7Q94/RwEJKZMmdMHkJyNFUkaWkW
 ceabQPQ5qNS9uZ1rCD95G+3fJzCk40YKoWcoL72G3U6svBOFBstlLfQkkHRc+nlBCGC5y7uZr
 aSUkZqE/Tv6woQBNL7nA9IUXQI4b4xxBUsJ8Z4Jo0kuWMJfFe6wZdAiWUoY79Z6zDCmyJ7nN9
 2TXXZmHMLT3NQQpsIfOHysCoqoFo9vLc9/y5QU7OVfaOKFYck4rVlxHnxh4I=
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:43:42 +0000
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
Cc: Yi Zhang <yi.zhang@huawei.com>, David Airlie <airlied@linux.ie>,
 Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Navid Emamdoost <emamd001@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4gUGxlYXNlIGFkZCB0aGUgdGFnIOKAnEZpeGVz4oCdIHRvIHlvdXIgY2hhbmdlIGRlc2NyaXB0
aW9uLgo+Cj4gSSBnb3QgdGhlIHJlc3VsdHMgZnJvbSAiZ2l0IGJsYW1lIjoKPiBnaXQgYmxhbWUg
LUwgNTcwLDU3NSBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYwrigKYKPiAwZDM1MmEzYThh
MWYyIChJYWdvIFRvcmFsIFF1aXJvZ2EgMjAxOS0wOS0xNiAwOToxMToyNSArMDIwMCA1NzEpIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2ZyZWUoYmluKTsKPiBhNzgzYTA5ZWU3NmQ2IChF
cmljIEFuaG9sdMKgwqDCoMKgwqDCoMKgIDIwMTktMDQtMTYgMTU6NTg6NTMgLTA3MDAgNTcyKSDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHYzZF9qb2JfcHV0KCZyZW5kZXItPmJhc2UpOwo+
IDI5Y2QxM2NmZDc2MjQgKE5hdmlkIEVtYW1kb29zdMKgwqDCoCAyMDE5LTEwLTIxIDEzOjUyOjQ5
IC0wNTAwIDU3MykgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZnJlZShiaW4pOwo+IGE3
ODNhMDllZTc2ZDYgKEVyaWMgQW5ob2x0wqDCoMKgwqDCoMKgwqAgMjAxOS0wNC0xNiAxNTo1ODo1
MyAtMDcwMCA1NzQpIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsK4oCm
Cj4K4oCmCj4gY29tbWl0IDI5Y2QxM2NmZDc2MjQ3MjZkOWU2YmVjYmFlOWFhNDE5ZWYzNWFmN2YK
PiBBdXRob3I6IE5hdmlkIEVtYW1kb29zdCA8bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4KPiBE
YXRlOsKgwqAgTW9uIE9jdCAyMSAxMzo1Mjo0OSAyMDE5IC0wNTAwCj4KPiDCoMKgwqAgZHJtL3Yz
ZDogRml4IG1lbW9yeSBsZWFrIGluIHYzZF9zdWJtaXRfY2xfaW9jdGwKPgo+IMKgwqDCoCBJbiB0
aGUgaW1wZWxlbWVudGF0aW9uIG9mIHYzZF9zdWJtaXRfY2xfaW9jdGwoKSB0aGVyZSBhcmUgdHdv
IG1lbW9yeQrigKYKCkl0IHNlZW1zIHRoYXQgdGhpcyBwYXRjaCBnb3QgaW5zdWZmaWNpZW50IGNv
ZGUgcmV2aWV3IGF0dGVudGlvbiBiZWZvcmUuCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1k
ZXZlbC8yMDE5MTAyMTE4NTI1MC4yNjEzMC0xLW5hdmlkLmVtYW1kb29zdEBnbWFpbC5jb20vCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9jb21tZW50LzEzNDIwODgvCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMTQyNjAzLwoKClRodXMgdGhlIGZpeCBj
aGFpbiB3aWxsIGJlIGV4dGVuZGVkLgoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
