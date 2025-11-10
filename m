Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4904C46A42
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A38110E387;
	Mon, 10 Nov 2025 12:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="Shm8ky9U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298A910E382
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1762778350; x=1763383150; i=natalie.vock@gmx.de;
 bh=l/k40GKob4yn5c5/1gtmQkVHGPu/QcHM/F0ILd4wgls=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Shm8ky9Uw3CYE2ek4Fld/kwBIgso1Vv7ugeDEXmNdFhwRZgTPBECjYwCEd3/Zzpl
 5D1rwIr+7pDdPk/fFZ0KSw4Zq70hsoxUIA5iTcHoCjjwvngV5ubU5pv7yu9fPjYUY
 kZxSsazJPPiqh0/hAX9lm1NE016pIW4VRT89rdxknpMIHOX8atTzDCgH9eKG9Ssup
 VFRn0LjXSrCr3kCk/EBU/3B6YtHb7jiluCewh+XqxVjfU+Dx8miIJNaQ7fhmD3Yxr
 ohr18+SBSt9iN1i8QXLdh0JZRb2jX9eTtAyEJFEwxAtQCAfTbb8i3gdHrmm4glXW4
 qUI0c02H05oySGn3WQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.42.49.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9nxn-1vEqHD1usf-00Cb4q; Mon, 10
 Nov 2025 13:39:10 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Date: Mon, 10 Nov 2025 13:37:33 +0100
Subject: [PATCH v3 4/5] drm/ttm: Be more aggressive when allocating below
 protection limit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251110-dmemcg-aggressive-protect-v3-4-219ffcfc54e9@gmx.de>
References: <20251110-dmemcg-aggressive-protect-v3-0-219ffcfc54e9@gmx.de>
In-Reply-To: <20251110-dmemcg-aggressive-protect-v3-0-219ffcfc54e9@gmx.de>
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
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:fbsBr0PNFaK5nNbByLVtddQl/587qcYAiGekPumjnA+pAYMdWQM
 iwYs24CEslZA52QfPonVsHPQkdZm4ANNpv8AloWmk6YvhyvokG5doJpsyXBBlN99KvpTuKz
 Fe0eIkqPMqHgu9/uFdO5WHc4Rj8fQhnGzAMgUD9Fe85ZqVu8qHbf2q+MkTqtSppfllPPKyb
 r5dB7Rkxyr6kyzh8gYl1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xTNPCBFQGKI=;l4f4vhdFkW95s7+WRw/5jZ2Rd7o
 IFeOx1Kw8VSOvFcWEWSGQ7RWWE1ZIlSph1Y1q58gRc/HYZvoRDkWOmy1o8hTeiCN0KG1zIV2o
 ruUsR8QLtmaOG+2TWE6tgBc7rRNGLMz8nhlY578kOq94uPBeF4rkIVlSn7BFa9cwIdAsywLWe
 gNtr3VIgIPSM56VXHzb6L+SnLGc4FgUaFogRkhqnY8iuqQcll92Jeo8NwIsAY5dhmAXPXpMxT
 P77vctLWmHwU9+b5UfnUcQgJpXY98mloiIrHwoxr4x7gxRDFx2fInTjrMfOAcrRcG5vWKrwiF
 KL7rgi+G7zU4OLVfmNLaAazG2pBKSBj/fN38Z/yT17VL81D7+3xkQrdn6FEZhrv/QdAXng7XV
 B/zY/TfqfG8oFwe/97GMRFgOt8pHpLX1mngVVK9PKqsuAnO1zW7hiUi/g0NP3vF87mcsPSnFW
 KTJlc2MQCQFBwcPdl7SFxC2yXb0sqZi8vGsfsigc/IJgLZ1FEkGPXNvJtfTREPcomxthdLry9
 Rzanu6MmNoio4eU2Ze68KgR3vcScj5BpInq0G3wX4bu8VPSuhJTlIreRdJw+stf1gvai1VZv6
 Pu3+d+MDjTomqo6USVWOj8Uc9OL43fUrQl5LaqpToFKBPrbTHiI/wKR/Vdo3MAxgwvDdnutpc
 uCTL3pDZEKBnT4RQ64KKhZUiv1jJwnuPDRPSZEtnmb5vQPOZzQFo3sSbPVa9iN7IZB2PbZtD6
 f+fq+VH/i3eg7h3ki/jXGaT3WtdQLn+luoPURzUi02Uqlt5Z6ceRZlQq2phh2bgJZVc9Vdaif
 9jGJIUACIjhP24v/jeuS2aL81LXeu5qz3E8bOowl0LLWGyt1583n1Xaczqh30N+2INT9mCIFK
 Ko+ij6QJ4gawJ7sBQNQrUueggGDmbOlpuaP2qBfMJNkmCmbn+k0RzXoqUH5FBr44msE+PoMgC
 kiz5N84PQVgjuwi4lTi8jxadklXsidlapn+XxfUTjUjSu+rWWNtY2OEsezwTKKbaV7EO4apRh
 qldI8zDyLEOk2OJV0Vwh1z9d5QPzLBYmXUU8tOPjLG72iqeUq3EWteM8M/kcPEfMqlTStF+mN
 NHbkjSC8zTBQFYiV4FeULcHspBo4O3ejTWqMgC44TJ+RaWyfVPLRk0jDhabTMVYePBURlJT8D
 hk12JRgGYsc3gndszySGDTpTb9Z3B0Fxus+3DUfJEdLxMLIjySKrXcqzZ9cq2b7tznOEc7Obq
 C6y0oXy4VcFG2/ox1YFz6txy3fIOxDjxl4yN/DXHlUKC9vnaeGOYRDNt6eUE4VPGcQ/Wtb+UA
 89KgsYEm8f45tF38LO0wMW5hSlJW2QMAdYtCL7tOFP+EQCfAHEl7rSA/6Zu8ZY/SAerkPzwcv
 AWkq+UdwCyMgV06ealzqi0vrCaK7wD2L4uB/kPC4m0NyNxaP1B5O6OkzZU8GBhZ5LSP346KTe
 Eo8H/KwzkHJZNpORalgfhTGREtssj0irvGKir8SQI6Tdp8hKRjc/QLZ+1QYHsBvbWJ+m0rre5
 fpHUmPHLPCp1YKIjipkKL4X2dUEtx82wSBGKUr2bRvN4Jm5+LlmUev4H2BZh1X+Kx0eb0H7gh
 b4lrjEWksheyfmNQ0qDOv/Oc2LWvFrFAnA/JkpOPEvky4QaO6H3qkkUam2l+kF+4yylUsCdGN
 /SdCqX7EqKHNy17EtxbUfflekWQiap8FW5L2suG5q1BOs2emG7wxjC57hLeKPhPMg6g3uv9VQ
 G0D2dzMpPSyTGB1nLerNubRlfyrOLMTBUXSV+lQkWivp5VR1CpngORXsFugkmxkoPZvPJT26G
 K3lw7/LZ4PyYoAZSvTuvxqG5xb5ewZHmHoVU5jSSdXNj03XkG7Xa1j3D8QNto27907EUp0oAu
 Obav6wDjsGGtfKvf/Pra1CXa8r80Z0RkVwjxNVe8C7tfuL1nGWyXK5OpoD8wUL8ByYOw6ABgq
 sAiXxtvjtbRJ4ClOe4GdAlmJCgwLMaC2F/VEgOn1wg1W38bThxhIPB1CVCA3NJXBF/yml5tQR
 O2X/GdpwCt6nsmAvtsw5JHd9ufzMdJddaZd7vptMmIv6iI77G/bk0Wp9fu3r/y/9ul6D9+lVa
 8glofWenIGN2vMfND2yepq34ZVcF65w4dOnLHSQvliEhdCKPUaVwgXlt7PKpPi2auFQXQNI9C
 63//2K51WtEQmC3atDBCPysh5PxoUqUj6NyLWg1R3n28pM83mY7YFFBDkTia7HluEQOJOhI0K
 paz+ninVSbdZMZb/grTQ3nuB9m6/8Fpg+5UP5Kbd3F8yBFWekwPFL1YEdzn0Q8DkAMRUnyemE
 /c3C3XPmBMhJVhzh1hKQeZrgBL/LhD1Pdp0LveqccHRAc3Nhguwq/1E555A6HCu3AjaV7H25t
 OS/MTc/BiWY/+oI8p49AGcm54+6XKwO2HpC4va+xYfacg//H2mDpgGdJ5ETnx/nXZzLnKLfKU
 gPBvq+HthHRIbUDeQAW5kgV9I0WB1mESXjeNT2nHq77vx511F8LNWTAec4HmuQsSIvL4pVvrj
 PDiapQzHDF8zhQykXFCM6nfD53GBF6U6LPZFF41LlngjZkRwRzqnJcIuNHojlIqNNIdtCB4mS
 PgrHuwn5FfN2eg/A/tC0AmaN96NubX2lWYW8r6SQGuLodlZ+bEfW33mqWuzH0NUpCgKgIFyep
 3zBM5bU7g8o4Mo24I52sQe1bRvQFu2mN6Q8O69uNEWIQaJXflYraNkk4NNSfAA/WQmr7+TwgQ
 oPoFFYD+PBGh9+mZj2uujeJqhlcRNXyVIDx0svtWepw87h/MC/kWwEpuxp0VLSsZtsRn+Ey/p
 CJzAGm8PvsKUIH3QNYrK7HNBe2nhq+c5u3jf6lyy5VE5nheit5epQF1JZ+TsTCE0ntUo8z/pu
 bKpiDF+a8DUoGyiQMdIfzjDCiLdRvwJXOXY662jOYW206EIuwAPUa1P00VgYMtgJf+bzHGkkr
 O9Lyur5jnk4eF9yk6yxJIjj8WU3MiSacKgL49wYVHd6V0TXGDtrnq03h8Nj+aG8w2qpuUoOSS
 3h0zCUzs5VurABNkO/GqRwec6VeEAfvF/tLDk0Ig5MvOewBME3ofQBITforaR51gmb8rh93aD
 1JemZCw3A7yZL50k7Mrc6TGKuw0DiOWSEA2kVW1w+GTVEdGHqAzqE3D/1ggiuRu6y9uLYrV+N
 HayfkgOkGJa/wXtLUlvKlWQmo2MQmSm7iEmiTnlfFm8owDYUo8oIoQuoaUyRbkNsD7J7SxfdP
 /gAjipNUMRy+S3l2CNIXqRWXHzuS62vaVmE9pqDZ9Z/BjdrzGuLS4mV3Qv3KEt15Yh0rTJHjI
 D1UFtNvm4PdkE6rQvbxHs6UPDUf9KOcbMY6b0eyFpIQ3/qks+7mckc5hmO/vH8gtuZ5lcW1hY
 bh5iJfWENM1jybJmJBj5MNguO4K7MTwSwX7ZKgZQsX8pKYaNE2oerYVUDrY3cPt0ZURwxQCXu
 Kkm7mHjSFKDQepYgiiXla1RetZ0zcOQQ2+UD5W7r9rrvFQUncL293JN2AlHvyHpraZg4n4gad
 X8gjVVNo1yaRtK5U0e5OT2HfzZw0jPec2u2n+WFZCKWghycxLEC1Fw0b1jE0IJG/m66OaWFPq
 tzaLqhKLGo0cAGUF0gjNDIISHjTcBuvaAVdbQ2w4S2o7qnnTQQA+iaIo90AZfXGbf2JhrsvNC
 +epuxbqWoRARiDMIyaO1BtS7iqW4Rbijqi9jH3BmM3+dDlNtNViFit5neJ2UXkyId9gzW9I0O
 qT02NvF5HSp+ugU1sL2oNifb1dN5DDRx0fHBIXbdSi1hLLcqAWybqqF/bntZC2XdVPuUkUJMm
 +TzcIRoBj0GDbp6e11dCbz9EOlW3PNx3jWjMT8PtRr7xbkkRyiRlMRKiY4DwkJxFUkFx+0h+R
 mHLLBl0VCGtCcyevJSDcQtFSfNVj94nEgAohij4/4gpCx9ydlPT4iqg1js8fECWYE+p2UT6jC
 vNj5Y5ueLMulrwJo0Q23DxaLDp0zNfbMELu7n+zznMoWYercKlCOLWIUf5XLONGOhem1rJjYl
 h+tJ8Er6l1NRRoo0jeCbLowv4PO89uk5G8KAcCu5oY69mWleZA7FvO5YX4tbMg1x9zvUGBTIO
 /KTP6hNcStok8tq6wgei8RyRJJpgXrAjviryDcjnQNv/Skp43OQEVYg8CNDtEvLUNJvEtgtjJ
 5MgLmCJCK8EHZDwVnl7MsWJ+cFHePZJ+9Ek6etASPRQleZMuyvq0849a7vl0ZA2YXy30p8o6/
 fHK1KMcVOJKhNYZhrqLbngtuw4jI0Ap5yUZrQQLCE1iEggM9lKA7tB4RqUlDoW7gDYl0UC71t
 T96DR4i6Ja/bxq7vpri8mI8wCY5cDaxehXzupHB3t61AXBpHawwQMNdoQ4ywsQbD2kvebCDv5
 gySHH4YzSoEhJ00vOrx6DbesQkaxM0DZrtZLGrNqKwNTjw8K29VEUjrwTe53G5SXzkZDxbuJ8
 mtSuNZXmjlueqE+5aR0rTbfHwesf/yMXaAPN8tLe3Wryjyxuy5iqazaeDNhY2YyR/2su6JDyw
 5rYovVXYhLaX1zyvc7E5CEFiFwb0JqQtCkSi/fIVI8gIypRTQN69oOd6ouGWniGWB7jFQ6su+
 we+lJU6ZeqM7fXk410XmFZfCaIgGshlP/j6Cb+I+FgSDXKC2Z5JVRNofblln+2fWVarE0hXbl
 WgHljEO86XAXlNFKA+JAF9R2hmr/eyso5ni5EJclci3Ule/w1CajceFP3oaiQ8d3bWE1BGIgC
 U8F5ZzVqid8G3KaeZDZQG8wHxLIclsNjlxcPuo9CSR4jsR4w1cBwYZLgnR6lXSfCyE+OUsQ5o
 RMoVBXHwbz+TZWvn6GhkSxp+ikcNRtKPqKIbjU8InBkMpEWpNVaOxf5xY/YTZE3jruXxwT9cB
 4m01OICYZKvSx73gRe2Os9dNr7++MHl5BtS+DXKjk9SfZL4Cur6r40KhfW0E5O8nuGSnCX7Dv
 yVxWqCzTA71Chsb2TlCj/SLPKL4kQyVA8cJlOQLhxheAxHWv817m0jIu/U3UbMp7s5qvu7fFl
 L62HwK1+r1xosgpBcpDHZjgR7187jekxlZ4RkUnmpUwBDUMKPRbIIFXP2LmgKZR4rnSbQ==
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
 drivers/gpu/drm/ttm/ttm_bo.c       | 75 +++++++++++++++++++++++++++++++++=
+----
 drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++++++-------
 include/drm/ttm/ttm_resource.h     |  6 ++-
 3 files changed, 108 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 829d994798835..bd467c965e1bc 100644
=2D-- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -490,8 +490,12 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struc=
t ttm_resource_manager *man
 }
=20
 struct ttm_bo_alloc_state {
+	/** @charge_pool: The memory pool the resource is charged to */
+	struct dmem_cgroup_pool_state *charge_pool;
 	/** @limit_pool: Which pool limit we should test against */
 	struct dmem_cgroup_pool_state *limit_pool;
+	/** @only_evict_unprotected: If eviction should be restricted to unprote=
cted BOs */
+	bool only_evict_unprotected;
 };
=20
 /**
@@ -546,7 +550,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, =
struct ttm_buffer_object *
 	evict_walk->evicted++;
 	if (evict_walk->res)
 		lret =3D ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
-					  evict_walk->res, NULL);
+					  evict_walk->res, evict_walk->alloc_state->charge_pool);
 	if (lret =3D=3D 0)
 		return 1;
 out:
@@ -589,7 +593,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	lret =3D ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
=20
 	/* One more attempt if we hit low limit? */
-	if (!lret && evict_walk.hit_low) {
+	if (!lret && evict_walk.hit_low && !state->only_evict_unprotected) {
 		evict_walk.try_low =3D true;
 		lret =3D ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
 	}
@@ -610,7 +614,8 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
 	} while (!lret && evict_walk.evicted);
=20
 	/* We hit the low limit? Try once more */
-	if (!lret && evict_walk.hit_low && !evict_walk.try_low) {
+	if (!lret && evict_walk.hit_low && !evict_walk.try_low &&
+			!state->only_evict_unprotected) {
 		evict_walk.try_low =3D true;
 		goto retry;
 	}
@@ -719,20 +724,72 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_o=
bject *bo,
 				 struct ttm_resource **res,
 				 struct ttm_bo_alloc_state *alloc_state)
 {
-	bool may_evict;
+	bool may_evict, below_low =3D false;
 	int ret;
=20
 	may_evict =3D (force_space && place->mem_type !=3D TTM_PL_SYSTEM);
+	ret =3D ttm_resource_try_charge(bo, place, &alloc_state->charge_pool,
+				      force_space ? &alloc_state->limit_pool : NULL);
+	if (ret) {
+		/*
+		 * -EAGAIN means the charge failed, which we treat like an
+		 * allocation failure. Therefore, return an error code indicating
+		 * the allocation failed - either -EBUSY if the allocation should
+		 * be retried with eviction, or -ENOSPC if there should be no second
+		 * attempt.
+		 */
+		if (ret =3D=3D -EAGAIN)
+			ret =3D may_evict ? -EBUSY : -ENOSPC;
+		return ret;
+	}
=20
-	ret =3D ttm_resource_alloc(bo, place, res,
-				 force_space ? &alloc_state->limit_pool : NULL);
+	/*
+	 * cgroup protection plays a special role in eviction.
+	 * Conceptually, protection of memory via the dmem cgroup controller
+	 * entitles the protected cgroup to use a certain amount of memory.
+	 * There are two types of protection - the 'low' limit is a
+	 * "best-effort" protection, whereas the 'min' limit provides a hard
+	 * guarantee that memory within the cgroup's allowance will not be
+	 * evicted under any circumstance.
+	 *
+	 * To faithfully model this concept in TTM, we also need to take cgroup
+	 * protection into account when allocating. When allocation in one
+	 * place fails, TTM will default to trying other places first before
+	 * evicting.
+	 * If the allocation is covered by dmem cgroup protection, however,
+	 * this prevents the allocation from using the memory it is "entitled"
+	 * to. To make sure unprotected allocations cannot push new protected
+	 * allocations out of places they are "entitled" to use, we should
+	 * evict buffers not covered by any cgroup protection, if this
+	 * allocation is covered by cgroup protection.
+	 *
+	 * Buffers covered by 'min' protection are a special case - the 'min'
+	 * limit is a stronger guarantee than 'low', and thus buffers protected
+	 * by 'low' but not 'min' should also be considered for eviction.
+	 * Buffers protected by 'min' will never be considered for eviction
+	 * anyway, so the regular eviction path should be triggered here.
+	 * Buffers protected by 'low' but not 'min' will take a special
+	 * eviction path that only evicts buffers covered by neither 'low' or
+	 * 'min' protections.
+	 */
+	may_evict |=3D dmem_cgroup_below_min(NULL, alloc_state->charge_pool);
+	below_low =3D dmem_cgroup_below_low(NULL, alloc_state->charge_pool);
+	alloc_state->only_evict_unprotected =3D !may_evict && below_low;
+
+	ret =3D ttm_resource_alloc(bo, place, res, alloc_state->charge_pool);
=20
 	if (ret) {
-		if ((ret =3D=3D -ENOSPC || ret =3D=3D -EAGAIN) && may_evict)
+		if ((ret =3D=3D -ENOSPC || ret =3D=3D -EAGAIN) &&
+				(may_evict || below_low))
 			ret =3D -EBUSY;
 		return ret;
 	}
=20
+	/*
+	 * Ownership of charge_pool has been transferred to the TTM resource,
+	 * don't make the caller think we still hold a reference to it.
+	 */
+	alloc_state->charge_pool =3D NULL;
 	return 0;
 }
=20
@@ -787,6 +844,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_obj=
ect *bo,
 				res, &alloc_state);
=20
 		if (ret =3D=3D -ENOSPC) {
+			dmem_cgroup_pool_state_put(alloc_state.charge_pool);
 			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
 			continue;
 		} else if (ret =3D=3D -EBUSY) {
@@ -796,11 +854,14 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_o=
bject *bo,
 			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
=20
 			if (ret) {
+				dmem_cgroup_pool_state_put(
+						alloc_state.charge_pool);
 				if (ret !=3D -ENOSPC && ret !=3D -EBUSY)
 					return ret;
 				continue;
 			}
 		} else if (ret) {
+			dmem_cgroup_pool_state_put(alloc_state.charge_pool);
 			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
 			return ret;
 		}
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_=
resource.c
index e2c82ad07eb44..fcfa8b51b0337 100644
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
index e52bba15012f7..3aef7efdd7cfb 100644
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
2.51.2

