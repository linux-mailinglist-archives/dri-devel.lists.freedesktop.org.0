Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971E72425C8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BF96E8AB;
	Wed, 12 Aug 2020 07:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952506E5BE;
 Tue, 11 Aug 2020 17:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1597168577;
 bh=RprPkLNw5TM4/vfPOJm0NfUGL/RvGDAlP9NIvF6jB/g=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=cHD5+q05A5E7Gejaegn8snAoOQ2chAmmMG9r7zPbtY0Exp6v0CndEGW0KE1qkru/1
 5pKFFpUEqMFEul9zs/QSM8udzw03i73B888N422dR+8LiARDajzfh7cwqoqGhPBx0A
 qyx+5JRpdHo3wN+MOU559wWXVX3hSk+2hT/lcWxk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.87.246]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MUnuu-1kDCPd0RXI-00Y73B; Tue, 11
 Aug 2020 19:56:17 +0200
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/nouveau/gem: Use vmemdup_user() rather than duplicating
 its implementation
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
Message-ID: <12ebdcbe-8a8a-958a-af05-a0593d9756b2@web.de>
Date: Tue, 11 Aug 2020 19:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:1dhYTYlDehXAt+DPD3jN+KuRggPAit8kAjihzNkVoIqDNU5n4X1
 hHuTVx7azj7gv4IQDxAMrdLDa0ryALeR2dsV82saPwv3IGG1KylG4A1sZBIlCVuRocaF+kf
 QyjLAoHNJvuVCSAh21VF7oFm0BTrXLdehmxD1A3AizSPCNO7HzNYVmiMhgPwMvcmRDtnFHY
 zHSyfLO7q5vik2o1Fnjrg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4LlvZsMrbRc=:Qk0j3dq4szC2UlXXea7fxO
 iCoM4uANdiRpSiQAZA4K9AacR2pz1sUUklJA1L/Yto1h3vqypLXnaKEq7DDDfpIHtsceJYbL/
 wMuGjwnnvMyEqBmZ6culSfKddkqHoLR+0rgNPpfRAjgOkuxvQa7kjgafass2/NNJ6/DP713DN
 RRIhP71rzXmNfPviuh/X8uZWMP1sLxM/yFQEnhLx+J4CWE/EPrlc/Wt45y41Hhxqfg6Xd1Qvc
 nQ5UbsccQTAJByP9ov2Ph0Y/8B+0IOzI+NdUkOmY4Eg66WHaZj0UEVqbbhDvcvLWtY0crjiqW
 g1LWRHaUQCk0fHYDWbLlGPZQWoUCGFK2hRCXWmMnYilBoD1bjlfOpNgYVZGdn2svxvxgTdWKf
 udWfq/Aj1StPqUSa/+YWo9DqSIJi1Qg8z51zTxctdRV7jra5bnEgopHEOEn2f52PP0A+N3fev
 inhpt8EuSzil1hqBq3Ndul6qCLqfd2RUX8wdl3k2zZTCwYnsvzIADWhQUd07MpINMdz2jQ1lG
 PbS1EeGHotqQIHhVOGwX6o8q2efmaUt0umu5F2LWFlL/D9tVnHYRRZDpr0FHGfh6lO7aKRms+
 PWeSEeAX2Q/Gi9rGTREF6O1RLKibBzsKWJC+GEfBiiZSCehnAzz1WDLBTEbL/UE8xLIESC7Q7
 FUuibB7/J/lW409yOeRWBs5k6sMAdjusyh7sG+TE7hrodbKN/q8RTPhtgyLpHWvBj3gBM8rH0
 upNSULlhDTZg5Ms9Fr/IhlYh+rqs0P0QS0MgG0H6HZl7LXFIpqxWTRaA0bUvpZfO1Vrv8sFS2
 xRRjzGAr3ceFzDNO3N0dCGah5e8Mo7uDjdwi2bOJZsR9HwdrhmW2a6+2ak4JEehNEPUoSEtxj
 Bv8+Lq+J4jCoyqoDpC2TRsHlJsYojowL2qio4Vo47gTX5nLaJgxtZdqLvkyEm7YmIcgtipBQ4
 O8zKZwjMyOpgqsQwHd9JN+n5lkdmFl5+bW0svnOe4IYLgxpN2tWt2z1ilQ1j8+PdmRkCaO8O4
 0MSxAMIGTXmMtjMlExJCfu5c34b2EbAotYllf5naOIxWbf+abBC1tLWwN9joqeYY2qHCGg0te
 3eJgZooEfvj/ybmhvfmc0L8truq/CzeA78MTSKAfaJ0Z+QZkHUvJSDWX8Qbno/omm0WJSLi60
 EFCO+xliOX5+gdqn/mkwGzmrP9pO8ALWSJsN5cUbWsV6WDaSn5mG03Kh2ZJPqnQUwBvhxNocm
 RTVVM4Bbtb9e4FBXIR077jVJ4Jxxlnr5XwzvykQ==
X-Mailman-Approved-At: Wed, 12 Aug 2020 07:05:21 +0000
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
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Aug 2020 19:25:22 +0200

Reuse existing functionality from vmemdup_user() instead of keeping
duplicate source code.

Generated by: scripts/coccinelle/api/memdup_user.cocci

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 81f111ad3f4f..7ef6221408af 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -587,15 +587,9 @@ u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 	void __user *userptr = (void __force __user *)(uintptr_t)user;

 	size *= nmemb;
-
-	mem = kvmalloc(size, GFP_KERNEL);
-	if (!mem)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
-	}
+	mem = vmemdup_user(userptr, size);
+	if (IS_ERR(mem))
+		return ERR_PTR(PTR_ERR(mem));

 	return mem;
 }
--
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
