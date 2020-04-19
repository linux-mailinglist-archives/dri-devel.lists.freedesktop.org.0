Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F81B01FE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690C36E22C;
	Mon, 20 Apr 2020 06:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B464F6E180
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 09:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587287109;
 bh=pEOnXWUWJq32wcmWoEXmTWiIZi1eoe0kShcruVve2N0=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=dsex5SLwM2FWZ+kD3hHq/YWgw2bnGwpUuRmz/fjzvwowsM0xtRYHggcioDNFISf+z
 8RX/CwZdAXm7oo9Oc5pD9uShRNUnXdwd4upy2S1GeeYCnqdgoE32kNnR8oabfqJEc2
 QLdOBaLRcYa03YqiJDcHdZhY9vXLzyXcLafEr3KA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.85.208]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lpw6t-1imLDu1Dh1-00fioW; Sun, 19
 Apr 2020 11:05:09 +0200
To: Bernard Zhao <bernard@vivo.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>, =?UTF-8?Q?Felix_K=c3=bchling?=
 <Felix.Kuehling@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Reduce a lock scope in
 amdgpu_amdkfd_gpuvm_free_memory_of_gpu()
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
Message-ID: <af0aa64e-f097-76a7-1c7b-5bdf0ad55a31@web.de>
Date: Sun, 19 Apr 2020 11:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:ejkFRws8u94G50TmJ+06NF8v58dM/Kg4QYRAJeDxA65iCsqyUK/
 Q49VO2Za7oZHZZkUJN0I3iAODIrOyQIYm+l0M8q/ZXRdPABhI/AdTc5BclF6ys+nnR/DI2+
 9X/0Zw35mVrxBzS1j0BNpt2qoflkre6K2XKyljehSrh65S2jNmd5nykKuqggvwyMi2OUawR
 aS9No9WtnCTIgv9vsI7ag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gurJBLGiZ/0=:p80neTvnogHsEmE7UdujdJ
 0oOyz9V03SF77HVltzReK3s2iy/sQvXOippGOlBFrPdEtz6fHDihpZV1ohdHCMFEsBQHD8nyI
 /6Xm03a/EBQVhk0HR48N93eTApqBF6zJCwuZrn+kGJHml0Jjf2F2WQ61sLmxr2uBUNRCh2W01
 N3vNP+tbraWfzu/uxX5XF/+/6kZ/KTui+9KZMsJ5VUdM8bZZ1h52uQ9hn5ebZK0tw7kAsCruS
 LJNJzhNVpcg3o3FbtwKqfC2bfVJPlLjOGsJjhtXbglbd3jIGco6TLUpbcHcDjppCmHK2OX8RY
 BXJC8ykeY4+zgzEipuTF1LmdZMK4yI9Ild9048ZcTTaPgx8hal9ho2BmUpfF0u4olQsGyv07F
 hDzuTlVyAeQMwRyo96dQ3pNr/LGCyMiUhKP5M7Gz8ICvS4ZuaY0S/2RDOE4KBk/yFRfMgw3Ds
 BxBAVtXgGAsqkOyIBIxKCCN8fnKy6ugFNkDQJ3utnZZ/bAvI5u46fb8BFuJPy6N7LwBd5kDlq
 pD5sDhkyMXu9wTmdwLfri/cxDObo+zZfsHMicweVMb7OXTodMPsr6i3o7tLUQmEMa8tmAXYvS
 ixtK4iUXM1eXSS0AwhyjBDsEZM4r5eQqKIm9djCbuEcE2F4Ei9a96ZO4doDC9Xxv3IB1+e2Yw
 DKvBOcKIkNcG7jL1ZmbvndT8totiqPGnvmhbhvqbeUi7rAmlCB8GqcqPkNsilDGzOfYmmb3ZJ
 i4decF4KkHaWuc5WsB7iuRJMpbzrhEMRFzfsOH52WBl24g5BplemK6K3dTelY0J2/oKsBPYXD
 qWLRIiwL3IUUvmd5nBa3xhnvuDZMMV66aMLdyPmF41AiAhEYKahBaUAkwXXgHPYc1ypaVZoSe
 B+jekkeXZ0U6CiwNIExyAJ9OlZ9GaMSkKzeCF+5NqDjkdMRf8O0HgQ9Kk1yJOrhxfqnf1kyxF
 kN45qgrhImkuPCrwOkhp82m3ByWwUkrQKbm6jeNsnD7mryP0PORh3j+bcmhmMT2kGmbKo6eUC
 UwdhkBCDZ/8x1yGol97Os5kcxW6GNF2fVSUOOEDbZ+Du7DlWPSVrGNtjOBPiSXbw2gsYBz7+V
 MjxqRWQ0I2G7eSfVLhGONDggHe0C7xQd8gkyiVM2nicamGqj2onKTpPVaCx4EdGOD1/IXdc/X
 R+SM2pOQhYZAyTt48t9GShh/Y1WL5PPAbdL497LBVKou/Y2Lp90k6T7LGslYbBARLhdpErYT9
 yQ5nBvX0MaDZTWVLt
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: David Airlie <airlied@linux.ie>, kernel@vivo.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Maybe we could reduce the mutex_lock(&mem->lock)`s protected code area,
> and noneed to protect pr_debug.

I suggest to improve the commit message.
Would you like to adjust the patch subject?

Do you imagine that data synchronisation should evolve in other ways?

Regards,
Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
