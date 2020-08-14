Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67871245D39
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208016E4D0;
	Mon, 17 Aug 2020 07:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E676EB16;
 Fri, 14 Aug 2020 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1597388990;
 bh=J1q2Qp41HcRDr7a6XQFVgKBApuGBGV9J/SihM4iSybc=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=SZq4Jh+EtSN7Dbk1gx7vd5EzNFsvBlBbW6rYLXeUqvZOJYs1g3WB+IW83T0bcKm1x
 c0Eef3/a8yjTgXI79XXxt3amIQbbsj3I8BmIwYqTPledvOu2WWBYh1DWvMePk2HdYf
 wSiKJE+s4TMXt2zIVBYglo+nCE3Q08IeZ8w7yVvU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.130.210]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MbhSP-1kNKRP0spJ-00J3ks; Fri, 14
 Aug 2020 09:09:50 +0200
Subject: [PATCH v2] drm/nouveau/gem: Use vmemdup_user() rather than
 duplicating its implementation
To: kernel test robot <lkp@intel.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
References: <12ebdcbe-8a8a-958a-af05-a0593d9756b2@web.de>
 <202008132104.mkULNh4R%lkp@intel.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f11df9ce-c49a-e172-47dd-5a0ab202ae81@web.de>
Date: Fri, 14 Aug 2020 09:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <202008132104.mkULNh4R%lkp@intel.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:dctFnXBnt8RMhxQUmv0FANMgLopssJLXMyutFv11AXonup3eZwQ
 Jj3xRm1SXf+ex7F2wA4kEw0tebSh/KkGTI/SoZTDhnJSs7eX/ckBGjojbqaIUcfeS0RxHmS
 GRkEyQIbBZD/zd9dWjsi7anLJ29EL2zvETbhE/J0WZk9YZvSz1AhClvb5InF6p9m3+kMjpH
 jqH5DY6Wi15ONbRZJBt2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CZqrR76Tjr8=:MmtTgLIUvEIud2G7p+OelX
 QAnBDis46b/9p+wVr64ilt6gFATHxpCRsDeYF6TyqGQ4yYEl4MlxYX3Sfn83ysauhPincREJl
 YNBYse44bnWF/39GbXy2J/8FkWIQWGDVD8gFfuyt2QUgIoUr5Us/3WUoaGM9c4TLmPiR7fwSf
 cOiSm+K2DEYRXmUlFmBIvNOubxDny3vKVQXoAhgZis+niA+cYFmPYaDT1Z8+y0damL1Lr6e3w
 DFr6ukvCmnrPj9AfC2BRWkq1unqKrLSp9+qdYUgYz+zgnSM9NlRwIfPd3H/jRDOhLxr6KocGM
 OQ4ev5mbky+GFyIkSvnkvmPZcl8WTREhlI+qsL3XB+bT/J82fY2PcDG/0hBAWhVJ3Ih/fBiOk
 HLhDgy2jhq3z8li60W2pq1oELdF6lcUiT5/v33ysi8L3y6p2wMMsAPa6Yf+sKTbLCIbpiDrT1
 6T9ughssHMwPTdpgUZgTfRm6uMDVVVKLYIV4CytJinj5l5uD9oscmk8Ouyy/BexXgV+LjdxLO
 CiiYzpn7WR8fMUgntE36+3VM8Txq9m3vIHM6chVwiwlGWtOMrnclsFZn9aXdeOUasqWGWoG94
 fFdawxk5EiDGDn5gOwyHgC6jkAHwLrJTVCMwsOZpzPYxXC2iKelQWti+eimaAxDIYzsVYpWhy
 HZiTIvbuJWggD5r44m6xCK6GLjElApw58kr7PsrKG41Q+xKn1D2xPIw0djmRYfV2af1k2pgcJ
 Ne8EUaSDHbcAsLKZ5Ml/BoczmeSVeRUMwGUBHRj7eV1KvbCJlsIU0UAJl3AZUeKqmNXyXjKI1
 GjvwTCtMzhqwevJctUTpVV+yc+i0Yy32BtSImwQy/WKV7SkiJrbDfo7lemy0edhHekCwLWqK1
 qzMBOjrXkQlbU7IFDearBw+ORphjJVDOgnIdjFYT4OJdc/5UJGscfjL3k4A8C1SOA+28W5hFJ
 ZT2cBFdj8/FNYhdwTK67ho0LO6+CiQZk6r9/Xs+HDygMp1rMOAun46aK/Zmp3MhFM41mf91bv
 KyYS8aTfZyHy1WA904/hJ421/5R3+8t/WVlRj+rRtGinlKiPjoP0o0y7iJDNQpUjNgg9Vhinw
 iwjjx2WetzT5mC92keEDwNbwh6nXK5SeIlNq6gNVO6PIo/IR4pdAjcNTEse7q4pnChheQjQK6
 sQOYUKip39NeesnV6LprW6OcvPMJXDBkurVlNo+8FRRq8/ruLb26XG0ZUmuNp68m14u+3NDR0
 hKr6zwFztK6OfLqcglGX4exFtOGIu6PdqjdaP9g==
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: kbuild-all@lists.01.org, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Denis Efremov <efremov@linux.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, Coccinelle <cocci@systeme.lip6.fr>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Aug 2020 08:56:54 +0200

* Reuse existing functionality from vmemdup_user() instead of keeping
  duplicate source code.

  Generated by: scripts/coccinelle/api/memdup_user.cocci

* See also:
  [PATCH] drm/nouveau/gem: fix err_cast.cocci warnings

* Simplify this function implementation further by omitting the local
  variable =93mem=94 and extra error handling here.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouvea=
u/nouveau_gem.c
index 81f111ad3f4f..536ad5e2cbe6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -583,21 +583,10 @@ u_free(void *addr)
 static inline void *
 u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 {
-	void *mem;
 	void __user *userptr =3D (void __force __user *)(uintptr_t)user;

 	size *=3D nmemb;
-
-	mem =3D kvmalloc(size, GFP_KERNEL);
-	if (!mem)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
-	}
-
-	return mem;
+	return vmemdup_user(userptr, size);
 }

 static int
--
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
