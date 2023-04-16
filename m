Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511236E36B6
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 11:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC2C10E2E7;
	Sun, 16 Apr 2023 09:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587B910E2E7;
 Sun, 16 Apr 2023 09:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681638136; i=markus.elfring@web.de;
 bh=lgS1D4M4giXfq9onDRIVPrtymyGrqry6IsUpJ8t1W14=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=SrFM4vR0iVIhNqq/22VSIFSKpmJJjqkaX+yf08tztkbRzvWZOekuAmLpz7IzHbNxG
 EwVqvPsywpIGLW29aQO8AuhlZQokzUpuHFmapW3CYQIjyFWJQ2VtHjzDaz8rP46Oce
 FbxRNOUKUzYR48EDjjlpxVgjYJUnhHHu2NC4RlLP5ncemXv9ZZUfzwZwNxSGFEvwQ1
 YfIBK3Biqycn2LOVg2dJQiCcbXcBm4PYPc3YhTmL+DgzyKvYFnak4hEtvgC3u7BWIN
 E3a7ypDyXxoCU2IHRw7qdxzax06ui+3u2vMkxtaq+IE6HBvWDImTGnl29r8rQf4gxd
 JfI7lw0ahYtnw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdO9E-1qN2bH3Yw4-00ZUwb; Sun, 16
 Apr 2023 11:42:15 +0200
Message-ID: <529fe82e-59f0-71a2-1e33-b051f833b67c@web.de>
Date: Sun, 16 Apr 2023 11:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 5/9] drm/nouveau/bios/power_budget: Move an expression into a
 macro call parameter in nvbios_power_budget_header()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
In-Reply-To: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aiPmQfJG06hSJK2eCipymGgnde+p2W0i8rwt96FvWfIh709EcJo
 huBlDJaHqtKRwjAw5FzH739qc+nTz+sl7BKJQuDI6zQP3z0vowOFIdOxbwP7Hwl8QLmhJfe
 7DwTfvwy3jdKcqhGSUC4FoykEWy7zvQSdAji7Q7MiY8hB1EvSgcBoYP3NvQqrNvu0rgzYHl
 gBZaGVhMoZbinNL4Wyhrg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WfemR50h7fw=;I11z2a74WOXS6RqcP5qwGcJ9Mrs
 TkV/M5RkJMl9d5KvBZSijoUqI/pHt4AjPLB9Zhm2Orm3adoBtEfu2Vuq8wV00x9TcXQIfKy2c
 NAteq8yGb7mwsVeCFTljwhBR9DoObdCs3TaxMc2zNCIRQAmjXRftFOSgMl/xXg3SRY2emzUdA
 U6wRjmY6u8ofo/vI6gApnlhyX/XsZqatiJcJeVS/tl97TMe5Fa0Pabt8eLKa/LsDH/JMcAjtu
 p5rp8P1CYPbb+aEHcdJVfFElIxEtLvirpJMHTOW3smFoGhfzrGyV3tvWT5rRrK7g02J/H158K
 YTGen6ipZxaR3GnG7pnzOHTAv1qka7RQ0NT9k14WpdRAZXAu0nZFHVaR2a9b1KKdYr7bfTT4X
 AaExemkCRuM3zU9anbFOhNFhIfiomVDMZMO0qUupgm+CWU9G22912OZGy55ZlAPvE8le0KGsC
 MLTIoDLNzl4GR8Tof3RCU7KRJD/31Drm/3N3iTGlwGTcDCKK1KMwJJNgghLHpO79QaQ4/tyUb
 qVIX55yOJyb1I86CTBHTKGAve4qPdJSeN8nqWTTH9BsskD4bawcTVftSi3pj4igEAfq8naYdQ
 zi/yDa3ozYoywgWSDHt9RHbMaz1bZ4nFqqUysjagGWKeHV7N96CpX4JCh3kcvRmE8PAAyBcd1
 ZHZNnuMRrWyE3WDed2ncjcPUXIcHCrv7JPk9PlBX488cntWFsW2ocbslyuEZtMlJ4AdaRZS49
 9i8O7BKNgtp3u2dNMvW7G8Ae7SQ/lVdXipx0fqeV1Zizhgje0MrV6ksLGRkq3+pTgkzF426q7
 kj4XUiVdx8wkj8Zv3/QoWevlRb7NNs5DgiW98Nz/5F1kR0viY1aR9jRjqDGYwXsd6zeHXwJHV
 fOk0ALSWX2GtS4OlbI9aiPpClaLbkyCjcaQWm0NE/0gjiq5ECktJQj2pi
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

Date: Sat, 15 Apr 2023 22:30:30 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cnvbios_power_budget_header=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the usage
of an expression into a parameter for a macro call in one if branch.

This issue was detected by using the Coccinelle software.

Fixes: e5f8eabc0077ea3f77b3362e28d3969ae62e70f0 ("drm/nouveau/bios/power_b=
udget: Add basic power budget parsing")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/power_budget.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/power_budget.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/bios/power_budget.c
index 03d2f970a29f..2ba992bdb19d 100644
=2D-- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/power_budget.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/power_budget.c
@@ -59,7 +59,6 @@ int
 nvbios_power_budget_header(struct nvkm_bios *bios,
                            struct nvbios_power_budget *budget)
 {
-	struct nvkm_subdev *subdev =3D &bios->subdev;
 	u8 ver, hdr, cnt, len, cap_entry;
 	u32 header;

@@ -82,7 +81,7 @@ nvbios_power_budget_header(struct nvkm_bios *bios,
 	}

 	if (cap_entry >=3D cnt && cap_entry !=3D 0xff) {
-		nvkm_warn(subdev,
+		nvkm_warn(&bios->subdev,
 		          "invalid cap_entry in power budget table found\n");
 		budget->cap_entry =3D 0xff;
 		return -EINVAL;
=2D-
2.40.0

