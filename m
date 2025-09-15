Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90985B57B61
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCB110E487;
	Mon, 15 Sep 2025 12:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="qEXSIi5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBD610E487
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1757940162; x=1758544962; i=natalie.vock@gmx.de;
 bh=+Uhmroz29IvBLpyP5ZtwN6C23c0XBazRPte2m3jAQuA=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qEXSIi5ANURRY0/tnRAaqmq/RW1S/heDyTuFoe/V6x+nJJYdkziYVYenSC+/RagM
 ukHTYihvAkdSlTdAw9Y3/bSvruuaC1MJpQ2xbS46k+sco5w4dMwushOSod7V4hqs8
 JV26p0lzz/0+S6fm4hBIioN6IzBC/ufnw10BnbrjEr14LPpKrstaK4Na7hWT1BrC8
 /5dSlrZxISu7vcHE/ffe4z3LM/AnrisfXqz6i97+38AsI0BxjjkrNVVq/4fkkU1lM
 ir016xvdEJUkvQ7SlEYQ/1wUbU3ioSVrHTKWSZWfgpTcWIb+xCF70HSl1omdZabsa
 3f9cXRO6HQxHUiUFfA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPXhA-1ulZeP0v1m-00Wkt8; Mon, 15
 Sep 2025 14:37:03 +0200
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 15 Sep 2025 14:36:30 +0200
Subject: [PATCH 3/4] drm/ttm: Be more aggressive when allocating below
 protection limit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20250915-dmemcg-aggressive-protect-v1-3-2f3353bfcdac@gmx.de>
References: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
In-Reply-To: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
To: Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Provags-ID: V03:K1:JyGOHs7x3XT0GTk4ho9u1qT7Y5l78l0oA/yupAMHuY9cSU77Ite
 JVrJ/vV+DFkNNe3TmVWrP/Xp6eZ9WejeSOnpZPkXW/5MjHA6S7QtefrgmoKMmyb2wCcSogP
 wIAN9UyVQVAFYfZc4RuR+EeOD5sd7ed1c9Vy5kAhkXIrkIWe4ZzyvtPMRZTN+rHRzbcxc7S
 zkoOIXElaGnz0SbOmMfQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XBl96HPsroo=;DaINZfJiMjkiXvBvL4tZiMPKzz9
 95Rvs1bbN5BdajDDhCe+3ix1iRG3a0ei6TUmuV9aMNQ9KHU/mba16kkmskH5hdPELt4MTSQO0
 E0VvfNpomgc9kVPLb1gxiiXleLNY0ziAF5MYNPjedGlWG3sbVsJS/g/GYS4R4tn/56pvEhxR7
 ISA+9ABED0mRi972ax3x6krcgdyeMle9UNwpcJHPy+MUvcqOQu67ZWbffuSGtNSGy6TdwCojH
 QRQ6Cf74CfKPA8OEFq/ThF1Ih3QR6g9PkDfIJ2W0cxp3D7flT163wVaO1phEdxCUIp68nXt4B
 t4CERIyIbdJRm1AWNWxVsGXcfwJnafahToi0En5c7CZ5rFuL1jRwwmzmpdexhkx+fa0wrc43k
 dp5F63udft5fwF7bzWmCapFFInuz9VPMgjI7wKSMwQQrb4otyy8gJkcaCFRfsb2lJiqIk7oYl
 YKm9rRp0t44IJ7e94bRvWqgU/VYdjSSHhlapX0g2t9GK4GEhgZ5I1f3016mFt/Sq9C1VjJ60b
 kklflaBTGMLCnu3SQJ8ol4LWqTysTbP8GuN0WSRgmWLhGH6haM30QqN6ieFBIegjS/L9sQsW1
 CUcNH7MFzlnNcK97md80NEe3EEr9i5DKCtVt/xqUuZkmhzidT5tHoMOkWEhmFmeDvmSIgpFta
 W/++yfaq/6R02P66E1AGrnCWE8+dycU+/GTFeZp00RlwHRxciWEsicjfpNx8gmKQoyhBtX6IE
 O8Cvk7/lXGueaN8c/Mpg54LQTlKliqgO4vqnr/d3nbBJwf+OO1T1B8OBz6u7u9NxoiuXbinH2
 jQm99QuphSYXFluRulwqPh/7cvh70dIflsHqTRqFrTik0nyOcmi25NWp4JsHfv2HaPvUlFApa
 sTO2I8dv62fcbMg0gv2obnlpyEHvAACWNzRY0hiOMMTXlGiXKB/pxWbWxCcVIe92C6KhmQ7rH
 rQffQafZv6ffWy37HC3pEgDCVfWS3RbAeWU5ByJoAupGLaudReWBFOmO8x6ZLpZWOdOj0pNB1
 gft33eaTN/6f3pVPnlxJ61EMOTry3D3r4Pj45X2YgUnV8u+LZby32vtlSZEMbfjN5qdoP7uf4
 Y69kNUi95nB1oKjoBjT/eOljq+Uv93fqNd0g/St7z3oxIJ/x5ObL/VcVEAfxD/D+TQ/3MNtjc
 sSyK79A2EoE38gyPL1Y/sY7AwYyHt9c6EIsLaYWixIfa1ozgliXcfOwwGhZY1SkYjtfs1nkcB
 IbWHnrgxwL5Dt+zMX+5vNksXXa3s6TzLwfHKDYOS0RJpj6i9SgC9dyK5CZqUg5zgQedzH5kDM
 ujp0Dbd2z8JhlOWSp6KpMPxLqpbHbtxZgVU6FoPqgDJ8YNdXdkMndzzbQA7K5s2xsH9wnyHlQ
 NfC945LeBVpCyfdJ11BmGz7TGb8EKvp32udFgSvGKJYeroJOyKaeyn0+jGpOTKStEO4l7wFN7
 zuJAaUEOeGQ/fMVjfchKbE91IWCApv4IXolIk9OFDl3BmbH7PNPNVXy0xSUQn1qhcN8cU2dSI
 ZU9x7RP7y2CGGle0hn6sm3TPCJQfUHGkShguYc6ThQt7ERbZfTLbFVl2hs0cCn9Uw9KTmYqfQ
 sgbqhAItbV8pWOFVoRL3GMBbMhXJdmj/DEMqaBal1HP5vLNLJhzfj8JFVSWEqyyc0m3FUY+xq
 gfGJl0jz/lGr7Lwy9bA5PbIbPlnAKYAIgaxvKbS0YxxChmErBTelOvlMyw4NQm7Mlrzl+A6zc
 mgRGqSrpLMvQUt2R8MoSAJy+ErzHrH2drdY9fkZboOr7cQsQTwgrn3p8fMmN8A44beWhdT6uD
 ARG5KvFeQGaI36v33I7VM1TJvknbDaE1PcQpSEIvFOFptw5ne91i7ciCRX5sfrXdlVeGTlV4t
 0G8prx7Bt8Bc1xItSY2T0aC+aL4nFd0IG12keij6lpOb2gwIbBlZ8+Ikp2E8edCG7ghzPk8om
 0qqxEgcOr9tugCHtQ3ooXscQHli/TsDet+g8AaKXFcv/iiJJyUzn9NUM+xUxm2Zzqj/XYO8wR
 qWkTFTbGS6Wz11uaVv9o+g8uwXRVP6k1FYiGBxtnIdnmb4Z4sY1xFfSKbY5Md99rw3fAb29VK
 Lj32lV/ZS4TZrKmhVeu4anqRyvy9g9wcYg3K9YbuDhmmH0lV9DFT2EySNWi6F/dcQM83LFZrB
 PrsqO+YVxxU8Z05JQ0x3zWcA59ft2LaDKEaoA44ZTAdVPxdl5plUVAC+Sfho3xYivYMRPCROv
 M5sxbbSyTLFJikVToTVptGGFnJPVMfDWnCE63rU7Yg/31cANSwh7A7aVG/8YbMEvP04PK98Pu
 cYZEC/VGCuvqEy3TDWyq5FRRplk3y3fSvtv+zQR27lBbk7WAwuLq7vdH0bFu+Qxh+40TFpfMR
 IIumNwbXTZcDDVZRwr/OlDQI0sMCEEvXbLXI/nf6v+lWH8+SUtZT7VRoKDtZavdVqdhasaqoD
 Mwp/zjcDG215nKHbqLtz4BiPr2Mq5ome0rOZT6ebekhT2fn3W1oXuDwQG8Qw5SN18V54dfguk
 IRkxDPn99YvxpblqF5kn2hibs5w3z0Ef3iM1ymwpItZ7kiOmOh2ofLgt71HC5svnqgZQxD6nK
 CVB4lcj8FlAZkyTXG4m+EPYn0zlsFRLalErkIrUYguN2tIZV8GeNf/Z3EXTt6yczH6vhQH7mh
 nYRPggcX0UMS/6N7x4x23G3pY3wiMikz54T1fueppGsC2cgg2Jh+b8Wdy4buRFIEhkykVEFAY
 VYETHYZAf5+hFTcFoTnblnaNnSNoVBx8m75PGv8HAyn/uy8LxxUKupEBNUdFoTEHocs1aZNNa
 P1ep2UMdYSCi+kWi4LhPjKskGBMgDNsnreq2IubO9ZEyR5h2GLRaoNHB9oXji0o1MACtQ95KG
 KebAlQbtP/ynHYfJoLc1nJm2t3/Nqnn4e4CEHN2VCX2hNTkPVLwb3x4u8yf0wLr1CXwTUTiEV
 pyhU+yMtLQySNonUTM3EC+7wIsMCLAXC7Ohaluvu+MZT6xJDe7Cm8wzsr0Tmc8xorERAbyPmb
 EdJjezyJ69prLVLP7pnkk/kFgwgmfuGv5vGOnIVXCWs9LJWXjgOGAf0ADQhK2o6HP/rjiQRI8
 wPtZS/rol0aplDtoSVmMq/XhIsMmhBQsdeDcD+lZNhfVoR9BcEBNyMgx5SwHBZwytImM1qjmo
 nUM2Y+qY2F7qBvgicO7OhqZSdTaiymP6isHnF+N6Tu4p7Eeg9bl6Xt98rbOI1qVsIBvqm2u7t
 xnP7TO5RNkscbKh7vK4Z+hjqzA9TupNh3e6i1bUMJZApzq6ztADuvMOAv9FWrrdwfISr0Hh5W
 2r7Gt2gZMflawbcNz7GVTM54YuvS4TumALpJNKDnCFGlb38gAU4/eEJeWwcKwtPQMuOYEB4q2
 bKpLD2iieftzrcBUJCX9ua/9SIDrJogo5oO3PEIneasNpAWPM2CeCYX3Ur3NvaBBvXFZnH4RG
 0wL1Sa3z1ErjbrrWYlolPiTg5NUmFzB0+yDw/UeXDZXQYsGwLXQ6HwyXqOfwDQ6874+BBBEMm
 fgMho4va9jGZUUG/hGhW00jV8e8i2l6aaBGLvWKQ+Ps5GoKKI0mnkCxKi+AcvDOnjcC2yHa74
 x60mA7yP/vuI3fCqZrZgHIs082TH1iweshBfq3stBdmdr5aft54zKHTZo/a8OTjjIVRxpvhCF
 f9jzDmPdFa3qwT6PtOamETU1ZaEdtgUj1anys+Iy07aaqthMqcfc7oHRyk0DKuy28DrTBs/cv
 ZwOFm6IIcYgf5XxXpIGCJ3KhSUiNzJKodkHTQijM7pxk/AdH0T3MEA3OTn7MmC1mmjkgerVaL
 nq0XJSUGsMeJ5ntiObqv+yrvn4nmkl0dCsIXmGMExzXZsS9LkI7DGV5itmI09ZrayveW0g7XT
 eqekU/v1h3fE4cvFdWnFR2bLYH7kQ1bBR0M7db6C8VEBcoJAFqC3NAbYHIAY4yKriQvWeIcTn
 diuQlT3QTDLfIml8Idadk6j/8jz/060mRDH2zoVyfXdtOALl3Pq6cX1fDo6V0CW3vt11igd5Z
 nA1GQIUWs6560C/TpYHVe5z6JviOLldYbJOFpwl156nnKrCtishoP3DdlvfxczzF2MnMSjycV
 +uuNUpSaPngQRO+oyC4tJiZRuE7sVviIK7c7q5XFJHbdBbkyCukzh+91+Q5mmKK+OWoPWYtMV
 X2w2u5/ZJHdJFOzn6MB3BZswn1KpbLCwCOONOiD+glauYG58DOcmhw90YN9TIM5ll5frX60ne
 E1VdDYPwPkRar+GEYx5v/BZhD7ArMwMFWl1jFc9fjWAyVWBqrp4Jz3/bMVeZVmOc4aSpHar+8
 oIN9+UEQGuo/tAJ3wYM65rJyjCC5T5KpGnC18NKwQPFexhDsEvd2Mgik40sCjpXrdLgIJ67pR
 NhsoQpn7g6vnxsk9SGZcNs1C7WPwrWUf+TazaAWonUj0VRUXA/noqorG1gzxqljUbmH++bcLO
 qtgpatn7Zo5cp6voAeTOHft3b/z/0zlrRvYQqqKXqizkHDnhTHv4wW+68PNOKtT5ltkLKC3pc
 k7bLAxFmh2CCUpTkRAbAwhehcObN/fi0z0ZG83XH36bwn+ci9yEtEhi0iJ5pd+asLBeuPEWm+
 UV07wnmjbI+tOPJkwOhwVJgcJm/bliGIeUxJG9CzAzTUXdI6KsqOlQzPjBFHcDy6hTGyW1yOC
 ceHucoiECq8LlRjQQT/00DrAERg+5I5vlj3VeO0fkT817E+iSJhh6SPv0T0utW8XzB3iNUHbD
 JfAZ5v8RVWPoPHXVSroeWnX4qewrMg6Qb0ZZcbxrq8hx6/dCcvMoQSKUgP6tPc=
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

When the cgroup's memory usage is below the low/min limit and allocation
fails, try evicting some unprotected buffers to make space. Otherwise,
application buffers may be forced to go into GTT even though usage is
below the corresponding low/min limit, if other applications filled VRAM
with their allocations first.

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
=2D--
 drivers/gpu/drm/ttm/ttm_bo.c       | 57 ++++++++++++++++++++++++++++++---=
=2D----
 drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++++++++++++---------
 include/drm/ttm/ttm_resource.h     |  6 +++-
 3 files changed, 86 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f4d9e68b21e70cb25d0db5e79391233e1dc72221..d20ff41411c08cd97b4467f603=
751f483d1c7ff4 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -504,6 +504,8 @@ struct ttm_bo_evict_walk {
 	/** @evicted: Number of successful evictions. */
 	unsigned long evicted;
=20
+	/** @charge_pool: The memory pool the resource is charged to */
+	struct dmem_cgroup_pool_state *charge_pool;
 	/** @limit_pool: Which pool limit we should test against */
 	struct dmem_cgroup_pool_state *limit_pool;
 	/** @try_low: Whether we should attempt to evict BO's with low watermark=
 threshold */
@@ -539,7 +541,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, =
struct ttm_buffer_object *
 	evict_walk->evicted++;
 	if (evict_walk->res)
 		lret =3D ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
-					  evict_walk->res, NULL);
+					  evict_walk->res, evict_walk->charge_pool);
 	if (lret =3D=3D 0)
 		return 1;
 out:
@@ -561,6 +563,8 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 			      struct ttm_operation_ctx *ctx,
 			      struct ww_acquire_ctx *ticket,
 			      struct ttm_resource **res,
+			      bool only_evict_unprotected,
+			      struct dmem_cgroup_pool_state *charge_pool,
 			      struct dmem_cgroup_pool_state *limit_pool)
 {
 	struct ttm_bo_evict_walk evict_walk =3D {
@@ -574,6 +578,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 		.place =3D place,
 		.evictor =3D evictor,
 		.res =3D res,
+		.charge_pool =3D charge_pool,
 		.limit_pool =3D limit_pool,
 	};
 	s64 lret;
@@ -582,7 +587,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	lret =3D ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
=20
 	/* One more attempt if we hit low limit? */
-	if (!lret && evict_walk.hit_low) {
+	if (!lret && evict_walk.hit_low && !only_evict_unprotected) {
 		evict_walk.try_low =3D true;
 		lret =3D ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
 	}
@@ -603,7 +608,8 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	} while (!lret && evict_walk.evicted);
=20
 	/* We hit the low limit? Try once more */
-	if (!lret && evict_walk.hit_low && !evict_walk.try_low) {
+	if (!lret && evict_walk.hit_low && !evict_walk.try_low &&
+			!only_evict_unprotected) {
 		evict_walk.try_low =3D true;
 		goto retry;
 	}
@@ -724,9 +730,9 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
ect *bo,
=20
 	for (i =3D 0; i < placement->num_placement; ++i) {
 		const struct ttm_place *place =3D &placement->placement[i];
-		struct dmem_cgroup_pool_state *limit_pool =3D NULL;
+		struct dmem_cgroup_pool_state *limit_pool =3D NULL, *charge_pool =3D NU=
LL;
 		struct ttm_resource_manager *man;
-		bool may_evict;
+		bool may_evict, is_protected =3D false;
=20
 		man =3D ttm_manager_type(bdev, place->mem_type);
 		if (!man || !ttm_resource_manager_used(man))
@@ -737,24 +743,53 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_o=
bject *bo,
 			continue;
=20
 		may_evict =3D (force_space && place->mem_type !=3D TTM_PL_SYSTEM);
-		ret =3D ttm_resource_alloc(bo, place, res, force_space ? &limit_pool : =
NULL);
+		ret =3D ttm_resource_try_charge(bo, place, &charge_pool,
+					      force_space ? &limit_pool : NULL);
+		if (ret) {
+			if (ret !=3D -EAGAIN) {
+				dmem_cgroup_pool_state_put(limit_pool);
+				return ret;
+			} else if (!may_evict) {
+				dmem_cgroup_pool_state_put(limit_pool);
+				continue;
+			}
+		} else {
+			is_protected =3D dmem_cgroup_below_min(NULL, charge_pool) ||
+				       dmem_cgroup_below_low(NULL, charge_pool);
+			ret =3D ttm_resource_alloc(bo, place, res, charge_pool);
+		}
+
 		if (ret) {
 			if (ret !=3D -ENOSPC && ret !=3D -EAGAIN) {
 				dmem_cgroup_pool_state_put(limit_pool);
+				if (charge_pool) {
+					dmem_cgroup_uncharge(charge_pool, bo->base.size);
+					dmem_cgroup_pool_state_put(charge_pool);
+				}
 				return ret;
 			}
-			if (!may_evict) {
+			if (!may_evict && !is_protected) {
 				dmem_cgroup_pool_state_put(limit_pool);
+				if (charge_pool) {
+					dmem_cgroup_uncharge(charge_pool, bo->base.size);
+					dmem_cgroup_pool_state_put(charge_pool);
+				}
 				continue;
 			}
=20
 			ret =3D ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
-						 ticket, res, limit_pool);
+						 ticket, res, !may_evict && is_protected,
+						 charge_pool, limit_pool);
 			dmem_cgroup_pool_state_put(limit_pool);
-			if (ret =3D=3D -EBUSY)
-				continue;
-			if (ret)
+			if (ret) {
+				if (charge_pool) {
+					dmem_cgroup_uncharge(charge_pool, bo->base.size);
+					dmem_cgroup_pool_state_put(charge_pool);
+				}
+				if (ret =3D=3D -EBUSY)
+					continue;
 				return ret;
+			}
 		}
=20
 		ret =3D ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_=
resource.c
index e2c82ad07eb44b5e88bf5b5db1ef54dd6d27823b..fcfa8b51b033745f46a01e40a9=
dc83e0c69165fc 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -372,30 +372,52 @@ void ttm_resource_fini(struct ttm_resource_manager *=
man,
 }
 EXPORT_SYMBOL(ttm_resource_fini);
=20
+/**
+ * ttm_resource_try_charge - charge a resource manager's cgroup pool
+ * @bo: buffer for which an allocation should be charged
+ * @place: where the allocation is attempted to be placed
+ * @ret_pool: on charge success, the pool that was charged
+ * @ret_limit_pool: on charge failure, the pool responsible for the failu=
re
+ *
+ * Should be used to charge cgroups before attempting resource allocation=
.
+ * When charging succeeds, the value of ret_pool should be passed to
+ * ttm_resource_alloc.
+ *
+ * Returns: 0 on charge success, negative errno on failure.
+ */
+int ttm_resource_try_charge(struct ttm_buffer_object *bo,
+			    const struct ttm_place *place,
+			    struct dmem_cgroup_pool_state **ret_pool,
+			    struct dmem_cgroup_pool_state **ret_limit_pool)
+{
+	struct ttm_resource_manager *man =3D
+		ttm_manager_type(bo->bdev, place->mem_type);
+
+	if (!man->cg) {
+		*ret_pool =3D NULL;
+		if (ret_limit_pool)
+			*ret_limit_pool =3D NULL;
+		return 0;
+	}
+
+	return dmem_cgroup_try_charge(man->cg, bo->base.size, ret_pool,
+				      ret_limit_pool);
+}
+
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res_ptr,
-		       struct dmem_cgroup_pool_state **ret_limit_pool)
+		       struct dmem_cgroup_pool_state *charge_pool)
 {
 	struct ttm_resource_manager *man =3D
 		ttm_manager_type(bo->bdev, place->mem_type);
-	struct dmem_cgroup_pool_state *pool =3D NULL;
 	int ret;
=20
-	if (man->cg) {
-		ret =3D dmem_cgroup_try_charge(man->cg, bo->base.size, &pool, ret_limit=
_pool);
-		if (ret)
-			return ret;
-	}
-
 	ret =3D man->func->alloc(man, bo, place, res_ptr);
-	if (ret) {
-		if (pool)
-			dmem_cgroup_uncharge(pool, bo->base.size);
+	if (ret)
 		return ret;
-	}
=20
-	(*res_ptr)->css =3D pool;
+	(*res_ptr)->css =3D charge_pool;
=20
 	spin_lock(&bo->bdev->lru_lock);
 	ttm_resource_add_bulk_move(*res_ptr, bo);
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource=
.h
index e52bba15012f78e352f392232ac2e89a83afd311..3aef7efdd7cfb8fd93071db85e=
632b975b53cf81 100644
=2D-- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -442,10 +442,14 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 void ttm_resource_fini(struct ttm_resource_manager *man,
 		       struct ttm_resource *res);
=20
+int ttm_resource_try_charge(struct ttm_buffer_object *bo,
+			    const struct ttm_place *place,
+			    struct dmem_cgroup_pool_state **ret_pool,
+			    struct dmem_cgroup_pool_state **ret_limit_pool);
 int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res,
-		       struct dmem_cgroup_pool_state **ret_limit_pool);
+		       struct dmem_cgroup_pool_state *charge_pool);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource =
**res);
 bool ttm_resource_intersects(struct ttm_device *bdev,
 			     struct ttm_resource *res,

=2D-=20
2.51.0

