Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1064493056B
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 13:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8F810E00A;
	Sat, 13 Jul 2024 11:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="tGsSnTmv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9394710E00A
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1720870238; x=1721475038; i=markus.elfring@web.de;
 bh=yYStihca3IYwKi+Yeorx3KjJ/JDKDHTh2foEdguZtEk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
 Subject:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tGsSnTmvvE6xMIvyeYh6lFon8yhft9MxaZ4Dh/DECx8uK51/jNGmrwNc9P770PbL
 XyvWkCb4SxgKhmo9pIZDy5lBKkY7iTegBMrNwXFMCQ3okjolFlQ1kDdxEe2DidJkE
 euF5A4qUJ+pPkMw4Ak19OzC31HrzL8LqDLHGzNm52xqBbqK5RIjxpoDa8AtpBLQ5Z
 aDwfsVxnmsMj/AjRGKoofjBXwyokbs9G6HllABojLOGq91AYktnROE0Zx67xs1v32
 YqRWjzVUjNgz3WwqE4+Yq7D+n9M9Ti0qUgw7NaDX45uAri2zi+IVaDRs+MDifET/1
 LpjO/ZzUrpIdY1Hsew==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBSB3-1seOGo3ucp-00HCct; Sat, 13
 Jul 2024 13:30:38 +0200
Message-ID: <6b952625-614f-414c-80aa-ea51027a044c@web.de>
Date: Sat, 13 Jul 2024 13:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/ttm: Use seq_putc() in two functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MLl4JbXy3sVYHpWZibGJ8ChC0B03gzqpyVJQOmkXaRaeG7T0UOc
 puCT7y1wYZU4A6tVM/+zrF+ZnkBvtVuQjXP/za18cKBgYWs9Ro00eYN7A3ZzOw6hMSHkKdS
 OKsX//e2ZBaZBWtMMUd1IA9eG+CrjdACTL8WdzX42qfnSdKYISDe7WNn7XrM+P0anawiZb+
 QAJoC1Y9HgVf5phyPTXDA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8tcJ/Qg6fbg=;t6IAKWkCVwd8JWouP1A1PGRjWBo
 KNfA0R0CRgA9b/+x3BsZxI1VIg6NIttR10wlpwirCPFJXyEoOn7vRl/He096+MueyyHTHfsMV
 7rnJMsotlNXxNkG8HtUeUrle3m/IqqduWnOLn9yOOqyg5qlk1Q+L+8lyILcheZxLwuxGmvltF
 HMNTFJwPctih3REl8GWAmYVBwX6CNsuPS1krNBZ3plkICYe315Y6jyjakcbgbjwNaitRzyRK2
 U88lZN3j5+KnzBtViPKJHsbXDL3A9ve6ePZ55wN25XapcoVLhpkcrJYqduQZzP09Y/bzFIO7g
 uizeFO7btUiSF416PlqR1nClUBwFvUNnHEHNYSq+ERL4vNDHfrVBVS2YWIVkt873FkCtnM7hw
 ypAeIR9wrnMJ78/Nqjrz/PyXaioZ/9NvlnvO/MKtSz/MEnFUlEWmnyXSkINLIrUiqnxPfTOUJ
 dVV0YcrAvvEQJ6MIHHl3csy7k8yspZhcf2N+vA0HoGh2LMwWdi5Y7iWLmwhGdhn/s5MU6dbAl
 7kZQzXtQ3WE4CgJcikzvfsN1c6pb3/RQ5FX50mpKEE1iml+4hE4SU7r/9d7TaZHy3z0KBueVd
 qip5IjdQ3cYbezj8Pc4vPn/380HfU4xKcsLE8zKrN8xIfTzvZtIrOvbc+8hTQPoLDA5VK2664
 Acs3AF/SkiiQR2ww5Lqq378GMhvUt3RrPHm1WH4N44S3kj4coKTmRwxgyyjSWETz1m/0nutV6
 szXHSqIyg7AdNoSrBpuu4B3mM0y4TKu47spiOFqiZkDbXKtzOA4L8B8YPnKNIa1qCJivvEvt9
 7gj3uAQK2vj7S3wp8lQkh0uw==
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jul 2024 13:23:06 +0200

Single characters (line breaks) should be put into a sequence.
Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/ttm/ttm_pool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool=
.c
index 6e1fd6985ffc..451e6155432f 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -676,7 +676,7 @@ static void ttm_pool_debugfs_header(struct seq_file *m=
)
 	seq_puts(m, "\t ");
 	for (i =3D 0; i < NR_PAGE_ORDERS; ++i)
 		seq_printf(m, " ---%2u---", i);
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
 }

 /* Dump information about the different pool types */
@@ -687,7 +687,7 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_ty=
pe *pt,

 	for (i =3D 0; i < NR_PAGE_ORDERS; ++i)
 		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
 }

 /* Dump the total amount of allocated pages */
=2D-
2.45.2

