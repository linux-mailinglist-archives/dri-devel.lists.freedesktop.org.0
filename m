Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7875B13193
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 21:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E18510E318;
	Sun, 27 Jul 2025 19:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="gGfWW5rv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Sun, 27 Jul 2025 19:51:27 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FA710E318;
 Sun, 27 Jul 2025 19:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1753645885; x=1754250685; i=markus.elfring@web.de;
 bh=w7wV4bQw6I+f2MyxezAE54mSoFDxSCTYKVYPfxLRr80=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gGfWW5rvO8+2fRGO3S4msEjf0YzBdojeC6mQBnrOp1Tj+23BiOeIpvJX9JWZhdf6
 wIkbMQtlIAi+dOQlV28xdou+bRhT9xHXxlaxFdx7dpK6Pr5cHFA2PZR01eU1VU7KQ
 5g7+qIIlqdjJMvH8BDnLjv79g0u0WX5tw07KkMrZgP5tN+Sg9L1E2Cq3EZG9xjaqE
 78HZAr0DmxN8EGh2U7V/7v/UdsSKa6K4w9xYbH3Derlxr5CgeyBQ+QeYwYonJJOWQ
 5tZ3upELEFye6/q+1AcrRrnHWGRsHazX50Bw+ZoOljVSXWxQsOcpLomS8w5faNKFv
 glk/pZHIPNB3HesMfQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.1]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3Euv-1uhVIH2JFl-00H3nV; Sun, 27
 Jul 2025 21:46:04 +0200
Message-ID: <3f9121a0-30ae-4dde-8c22-be195dfc4fe4@web.de>
Date: Sun, 27 Jul 2025 21:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Salah Triki <salah.triki@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <aCdkIkNOQgnA5Pou@pc>
Subject: Re: [PATCH] drm/amdgpu: check return value of xa_store()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aCdkIkNOQgnA5Pou@pc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/UEPh5id4lqeb+TOA1F8EsVORfB81cvRTm/3ntn9RE3QjgTxHvO
 QmkaeUpukQGSzRTZLbW9OxqV5MYL7NiLNttLqBOJbuZ8ZEYpRLFeXwQZTb9YameuFdaiaja
 eUpa2NtQfkgDY0SthmK/DfbyXmxaZh/5q1UShwxio4vPZyV4zS712gytH2K3tRv894B4brs
 2sr5WiAZBqfW+lIpyJ7zQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T8AGUB0TVkE=;kY1NtqiN+H6U/XETaZeOMhhZEFR
 ZMabHuOuFv0sTCC9GJfWEpjhgO+GD1eptJTgj9JcKUr94H1DPu941KOTKp6b7CMoSAxknUuwb
 npFizemrCZViE9RdT7qt6izVQ04ocI+28ltHgbSmR8LZG9eAGi5G+nkcLsDOTZ4QkWJZOYNgw
 j/Ra6wQEvbD8ZjSKI539wCZBEazLQP4xwpovBP0c0dmwmPMBqv5lgbFijUbbtGPEHMYrXCF7h
 XQgCdLsaL9Ptix59Q1/KtuHh4Gb+/ubzfZByJlWKsrG7mBIihWBVS2ZDsEf1tT/zbsOY0nK5/
 hQs2YH23LwQfdWpUzLuHQ7mBMUjo8vGKwfeIVt56j58NTfhcldKFAOGL5XsVsfCC5ltFkCogK
 XIDgnaA3NfDrR9QCiMoUup+uFbYo7XH+vs7IfYtfhfMSncln5/5LU5mfRJZ8RlieEWVWXbuwP
 0KdV4enZqE7BxrqiwL2GHzCPAbz8dGn9JEZpugY1GZtgM9iDDDmBKIYg/7AKxsgi8POlh9qG3
 zoLmRgVHsOHvOgTm68rfYSQ9K4WiEuyIIXIzdHhYP+bTgtmw0ebKWc/X7nxsI7Ekir9bMCQJ5
 K0FrL6pnnrhjLQMVoZPAJ9+ndOqUm111YlCF+HZ8Nk0RHT0ftW5zDkkYXq1Lk32QyPYo2rfuX
 82lOGh55LYJKSbAGTS5mcuCkjZKZ+hEG0ie1QR0BoRHY/ej+0X3n1yXRgJRHvceiBjvo6jQwt
 382WKubR+VkS4fHv8CRic5KJMivtwOC1wzqc+BdS2V9HB59HqbfMZWRu0FXAaW7ZkIGYmU08C
 2kc7cthmZfg5swLllfATyuQ10caO2jBShlsteQi3i1otq/0p253VIj0sgZbVywF801rzxbfvl
 bhQ76kLW8IgXkUIg8i/TfiWUE7wxwKrJFHWw2PIGPDrWQXB0VUEc7hsWow9rQ+LYF5JpNF1Zh
 q7jCeyB8udp/+DvstslxRPSgiywXfUAJVsytTDpcAQPDQGpGTYW0Q36TLBoae+2a5z6MQyKFp
 akg6sNG4au8qcND5atTFpwjwhN7ZElE9WaF0Y4pWEvVfFUw7vnxIWOaWxH+Klncm5hZk6uW+M
 4v4AeKKOEW6Pv+lUeRJzwQJXjZCjnDnwYRJB9jEuTa/G/+jAXR1XWItvkcqqJgB5GbfHqF+AB
 8UjCi2cD3uAk6CDul5rIOlurirNM9a0KTorccWTXeoNgFqIt1jkQA+5/nbMr8y81sku3j8cqr
 BNc237YWkcrHSA+vy+YgcYiqtIVVrHqcJaqoXU9hl5jAqpjwL1lmAWr98Ukh18yzHj3Wq+ggf
 whmeRnjMX+rKWfo9NyNZeg3QAlxI4DNPz/c8QJCv27+LarEvDb64YIT1GOtl4tTL98JMG1uuE
 Viu9EfRSxTkahppWqPz1cTyiO4cuVGL5/5aufIX2bQnCFzRc+2x5E9F3sCav1xIuLwCj2ILos
 9nVPOhEc73M4nUcOWc7KLHmuJjLwv/RHyW3rI6OcAZGFwfheo4V0bTvbvD28bliDwmQi6l4e5
 PpUpFZlHL8qIofcIFGLzUz8NbhooY74sZK3JsXRaBsq7lZSl7UiyVmwlVvrclF7FNJnFb7ez1
 63RGukUPgHG+yCqIZX4RkwyuYEii3WAgTiMoLrEmQhqc/BlxBYEstf+qnCU3OfXUkpxzU/D0D
 81VgYj09ASkX8HZVnEoQTPAZbJcp0gVPvjQxnP8PWB3ku7M0d1zCAz0CB/aA/N/VjbFngRvmy
 1hm6qFeLSaV1fTABrN3bPGqrmZ8PsJYmOwcpFfAfcEsB4b4dHBuCJKWYDPAtWGT39wbjTrjc6
 p/TTyb6Kygvqi6tx+llsQQ3Hq20PRcePSKeQWn2L3Vy2u1WOStAOrNbnqTAsLEq1Qq0w04Ofx
 wCjtLrn0UzD42f3Ub8OqZgCR1EHoa+MkbdsmZEOfIclqlZ1BT4w2ovNB5VS5812LtyKM5K9wt
 9lCmt9mtFx8ipFVd14oIRvwHrBk4n9Ve23u83R6gvkxJt7N+tfuwFONYfFgcgkHZX8KrlDOPy
 6wGMw3HyMf8k65KOLnIJ3XHGv2a4F4Qbk2CNMphzh9Zp+hUtKIZBz9d26hZF9Nss9aFmmjsr0
 FL+qlhC8cQm5cQBcuh89Fkvqw4+5D1YhJcw0GGOVkdBTzcErFaiIzgnOiFoxZzqezxBRlbHtn
 pji3Rp5myIP5GltcitYF7DLXeRb3PInmHZ2su2xW62tFP1TroLXf1URXFmdKX+Br4sU353W/z
 tQ3HKUierReDBWfIZq0ROpTAx3DfHnR8TPEgApY/NazMMhpzJjT2P/I5jRM9AVt1wDOO2usyK
 jleB7I5t3/nBgwq0OF3zAXZw/3tB/eNloHRZnn32LterzgyGFDrLQY40YLZfDeBrssXjbrilj
 Y/1kSC3tSYUBUo7nkJPVshAOSQKksG4eOtoXE6dAxFh0csqjZEN8Xn9Dj1R7wLdG7kJQeiurQ
 7B39bzg2UaxvNgO7gUqwhUB9B6XIigar0RA1SISSpCGlX+f/EbUh/UvG1/H/FsuTFZvyGkX87
 MdUC+9vUnHb5O62PhWuwSQ6zrt6u58UcsvQz1Ck9UpO8rnmGpVHvr3dV0Qd9FC9v3h1kGzSl5
 unQJp95HG/3p6PFqWiUFvjxWiO8YNKCdtjq/Rv5okSUgt8Q00gAjQ7WXimyvu7ouQTjzqpDcy
 pM5W7GdDKhA6Wd24EuefVldSeIWX8wQITwQuTkmgKfdnlSvre5xAEfXYf8Uj7NvbYpHwfMSZF
 1S9h4wHO1u0yrPTfpxYMpSxpgr05UcfS2DPHdzP8uvujuFqgofb7UdUHkdFlK5rBhnjwQQvam
 y0f22EOpOc0/hJoR6oGc+VXhT1kt3j6DRssMWqEo1FuW+G4GrPlQn7/HgvIt9dXMCG685IJjs
 OTjqlWBtZgoVMSglQTeoJomxhqZjx/jXSRPo5EqJa4LNzhh/1HQ9BW4qb2BS5wPt7oBJZzLS5
 h1MFJXRFF4dEUBPRtvI1r9miU987DITBSet3Ijj+iPSq9a06ZU/Law1gqalUcePt8MxUMCbiD
 yRL6j8IQbacRmABMxnRQoYj01y4l+HLtfG5gANOjwwb8C+jlbo8UEO5bTUvsokUw4jOk0gdWU
 +yllOZMOGMeUtjzPuBgV71CPK1NAxMvFCmjN/gEXseQjqpmiGhikWfTe03MdL8SmC0UFPYQUZ
 pkVfIpF+iy3K/GsQuqbmNJ0bdP23fk0JnHvXJYjrnLsUr8rc9L64D2L5LWlxE4hr/cbRaQyKm
 G3DLE/9Za9zjeSRLv+mr+XGS+MiLf1tEseW8BQUjOvJOkswptBKCq+CJAwFGCBgB48/LrQUnj
 MdSx32C+QSGJK9yidgRu4haY4NWBBjH7XNYncbl6G7V8KtYYltD4SxvNMe8UHaaQpC38rs9jr
 UCG0C2hizINCKSYNXEVpswMnbAoIKPHq0r69VWlv1vTqEkBAWa/Bkz2VMMxQdq9Ng0FeABCvo
 hHNGBj5LvUGYN/kDnZ/sG41YVgzTleycnXkHmjqZ1siRZs4oIGom7
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> xa_store() may fail so check its return value and if error occurred free
> numa_info and return NULL.

* I find such a change description improvable another bit.

* How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and=
 =E2=80=9CCc=E2=80=9D) accordingly?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.16-rc7#n145


Regards,
Markus
