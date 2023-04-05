Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD106D8497
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 19:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2590E10E1EE;
	Wed,  5 Apr 2023 17:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5776510E1EE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 17:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680714688; i=markus.elfring@web.de;
 bh=9vk/wCzM3misVERGO6hb9HrWR0a3YXKHA6xQqnouWCQ=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
 b=VzS1TIL/WhDb8xpluPu7UpNIsT0RMOlIjUx8kqX9UUhPTCsDHz9u0g5QTkBN7NaOI
 g1nK3A1M/sBZSqcucr4qqR3bT0GCgAoEoIxqrNS7uySCrMQ/c6wAAfADRH4xMzndY4
 7G+FzTXUkCwW3lNoateltb7rBAIcjabL9oDnP1XDS8z4WZ8rUHn6L2E/PQ78hfGAFM
 CfyDOBU/62xI1jwSzB5wueJpqyORct32gF5f3uBIfLGURNnEbv6RFkXSI0Q1hlgata
 XH4iyOK7bOn+DorpQ61e/5PL8JYZNFokM2um+bDD/Ww0Xj3eVN8RE8Ff84o+ZhokHM
 Y1/9ONRBqgLBQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MeDQj-1qILI72BUd-00b5xo; Wed, 05
 Apr 2023 19:11:28 +0200
Message-ID: <809905c6-73c0-75a6-1226-048d8cb8dfda@web.de>
Date: Wed, 5 Apr 2023 19:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH] drm/nouveau: Add a jump label in nouveau_gem_ioctl_pushbuf()
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <8f785de5-ebe2-edd9-2155-f440acacc643@web.de>
Content-Language: en-GB
In-Reply-To: <8f785de5-ebe2-edd9-2155-f440acacc643@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qFv9xlk5AIOZ4GNsZRuSxSI/E015NJ+DKcMIB1asBsWst+GZ9/L
 zvT37d2pqq0s34WFIYKlbjJYZgDSOae6KVPUa3i/3ehI6dj25z3znMmCZ7Cp69353WUbi/R
 jcopn7CZBTZZH5LnuliQ99wKse4OjXV3Oc64ZM61hwhGfUMVQCbNN49nRBVstujkxIbKFGh
 EWCOiezCC4SavgHuoqFEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VmX8HXijx+Y=;VHIV+tkYWdhpKAkkcWaLtGbESN9
 wgVCqzAyXFvqL82/Sh4sdJ2p4B0cm+NOgNeYW3ggORbtxFdi3jv5LERZqjaPhYXbQEo4OCwIU
 0LPam2g0rYZ+WndjxaW7Yv/hAeMvAA5kpGR7JF99Sbxb3dWc4tFp1Eg3PDf4zUQcsszWEiBD1
 a/u306kfA5526uzP7cccpf2f8C8v62eRiiqqjNJB9++kpxw/0tEFPkZW+7abjySCKPrGrAl7n
 VCDRXz6QJMRN1F5HbaYsgFJqHQr20bBfzWwKdkatRf+xtsno+t+ByCVCgvN86YUUWmbZfQsPf
 SeAhKs8tPsnfpbWKtDpPjtbT9ocDo9DQfkpK91oNv1xaTJqCMtw5L5tNZlPqr/zYVFrzQe+N5
 Q1XFvmxhfLaVbz5AqGUynnRmBYG0BZWrNKY7Elp19l//J168Irjkd9w93M7d49jnHRzbBa9SL
 5SVi9x6hAtq3PoHh7q72aIqIIysuw40zxcqaOzNus+KwGtm/zE3Q5PdRxD9X64XmbCuBRmxDS
 1iBa3DFwDwogPt5N1bn41pqMHx4gwL8M+2YBuPgMhTJjPpwxp/lP8WdKPfkqJPxLJliUOH277
 qV7TV0oHUl5isBgfenh44AtCE2alcLg1w5rhkpMtTqjqiRLAzFc4lUWjaowqtqsDEPjTDAoU7
 lVytSrEjUO3gFJJ20xoeAfExW3dPAPuk5Rhqikb4AqLU7QZcBXugIGMg+CnyB3r0gTSZ2BM4Y
 FfWHX6uOkCRJ4arrjUlpMJGcxVsZKuC9hCHwQiWOfO7qYUrDSs8QGcG5WY7HjkJuJizUgURdm
 9omEA6tu4bhIhiNUPq/oHJqm2PPpxcW/QHero4UBaSYwSf0zcYPtOy523DFQcSGj/T7w5TQGC
 xVaGCe0kmm5Iqyn+JenMye3bwVKDsEo6ykyJQ42JO1Fa3CytCtw4X1DrE
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Wed, 5 Apr 2023 18:38:54 +0200

The label =E2=80=9Cout_prevalid=E2=80=9D was used to jump to another point=
er check
despite of the detail in the implementation of the function
=E2=80=9Cnouveau_gem_ioctl_pushbuf=E2=80=9D that it was determined already=
 in one case
that the corresponding variable contained an error pointer
because of a failed call of the function =E2=80=9Cu_memcpya=E2=80=9D.

Thus use an additional label.

This issue was detected by using the Coccinelle software.

Fixes: 2be65641642ef423f82162c3a5f28c754d1637d2 ("drm/nouveau: fix relocat=
ions applying logic and a double-free")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nouveau_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouve=
au/nouveau_gem.c
index f77e44958037..d87e1cb2c933 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -814,7 +814,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void=
 *data,
 			reloc =3D u_memcpya(req->relocs, req->nr_relocs, sizeof(*reloc));
 			if (IS_ERR(reloc)) {
 				ret =3D PTR_ERR(reloc);
-				goto out_prevalid;
+				goto out_free_bo;
 			}

 			goto revalidate;
@@ -929,6 +929,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void=
 *data,
 out_prevalid:
 	if (!IS_ERR(reloc))
 		u_free(reloc);
+out_free_bo:
 	u_free(bo);
 	u_free(push);

=2D-
2.40.0

