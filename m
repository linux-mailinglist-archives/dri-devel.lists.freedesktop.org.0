Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1F493B1E1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0B010E6C3;
	Wed, 24 Jul 2024 13:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=davidgow.net header.i=@davidgow.net header.b="mIA5CQg6";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="Ua19Yot6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jul 2024 07:56:02 UTC
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A007E89143;
 Mon, 22 Jul 2024 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
 s=201606; t=1721634357;
 bh=sIsoIaEC5q4HVUj+ZnhPfTbfbDCCvrTzn9RJcdcWQUw=;
 h=From:To:Cc:Subject:Date:From;
 b=mIA5CQg6rnbZ8zDRl565hbTnTil3DQkCyj5SHvZm41PbGSu0w8KLQhulzDOjENO+r
 YUXI6xDQSVSu2MlR8/j9uD4MIos4on+wbuxWEuvRJSvJUC5+u6XruZcyPeKrWTSFxm
 lnfuIbSnbP0BMRdRuZdDSRkoURFXTnZnAZ9UHCjfsrCl9cHXJdPZh5PoYfErRvq112
 tnCWD320jPIDOSG1JpLH/Ca+A1xua1SBghqknLMDXH83CuB+GvRMPuioK1rSeRcSCs
 5KoKIHAxAgT/88QKsiofLyDL9+eq2qinFBQK7jBLi4y4c2X7pLXjlQ8IoWfZ2cw82V
 YFK/bfvccJcrUJvrObsP1Gg61Vhx3j63EAwKPXXRCFZ7GZiAxRhqkf3ygATrShcYVI
 BKdpre76pbXWvIcd5QkPRls99l0MKXHuVoBMVhslbrS57DWcNlHKbMiUweSLWXQgiI
 QxQPoGH20hXC0PPRCIUBBaXmlWyDniaQQL8cHw+r7kuOxSoDcHClyKh71ZhUpYJsMw
 ioD7jLSf39wxPhDVJ6bykEkQWnqV2a58K3aNYz/6EeZD8wfrINtXEeU9/fPODNrp5h
 K5S8de7FV3bsFARGdLOPJM7JdwFODGqzr5K0uiNhSAORuKJU3iVm/uIlrlWR0kR2ol
 RG5yfkNKqM7dFHCd6sofDKiY=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
 id 53ACF1DBB7C; Mon, 22 Jul 2024 15:45:57 +0800 (AWST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 sphereful.davidgow.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU autolearn=unavailable autolearn_force=no
 version=3.4.6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
 s=201606; t=1721634355;
 bh=sIsoIaEC5q4HVUj+ZnhPfTbfbDCCvrTzn9RJcdcWQUw=;
 h=From:To:Cc:Subject:Date:From;
 b=Ua19Yot6XTtFZsoc06vjBWA6nh8nCIjfjBldirI1IlLivXLtPf5rvPoKkL2AwnDhd
 l9gaB9eEcwjC2vTkjhOG5JNcMUV1MOL24pcf4TV6Pltze5SlZkZDZiY8B+9R7YiBSr
 dunv6f6NiFG18aWxfjpbiZertqef+BD4LAO5J/kyMvl9OgeH3Q06NepUmom/8TET8z
 wHB1YDOSzvfK2zxjyLsInM0HPLDmhHssIvkLiU5YwfQ86pASMji30h7lGS6hT/Paq6
 +48xJ/9s/k3tDnPvQUMVFlRru3Hi3k0O+jvB+3eihEWktIR0Sb9RGijf/8AmkGrKwR
 ksFutMtBvPd9iIRaO5MoZeRPOBKnxbTOulrlmbwPZ4z+7JARYsgFRSDLIjR26t/bx7
 6VPd6oUJWfNMAN7u0khwjivEfUCBuoFYDKf2L5HUmAoT4VR1r1yX/GycJWJagzp3QZ
 krg1N18B5ZqQeYuwPVvDv6BLWxsJEu7W0OJP5Ktcy67nrl/Jt8MZLgdkGlrMImiiCx
 A2vFS9fB4YAny2qO7x15aANA7wgFV9KOurGCYYNjQPLCCGGI6/Pboz8s+9UFHx+o+F
 5t6OGvxJhoawV6w93iTXPH0anXaFIB8FKIsGRlUz+0AyXK0c/+8zzWWOmrZje2uXZW
 zqN7Wgj571uR0aGN34o+/V5w=
Received: from sparky.lan (unknown [IPv6:2001:8003:8824:9e00::bec])
 by sphereful.davidgow.net (Postfix) with ESMTPSA id 1C2881DBB78;
 Mon, 22 Jul 2024 15:45:55 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Gow <david@davidgow.net>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: Allow evicting to use the requested placement
Date: Mon, 22 Jul 2024 15:45:38 +0800
Message-ID: <20240722074540.15295-1-david@davidgow.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 Jul 2024 13:42:48 +0000
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

In a78a8da5 ("drm/ttm: replace busy placement with flags v6"), the old
system of having a separate placement list (for placements which should
be used without eviction) and a 'busy' placement list (for placements
which should be attempted if eviction is required) was replaced with a
new one where placements could be marked 'FALLBACK' (to be attempted if
eviction is required) or 'DESIRED' (to be attempted first, but not if
eviction is required).

i915 had always included the requested placement in the list of
'busy' placements: i.e., the placement could be used either if eviction
is required or not. But when the new system was put in place, the
requested (first) placement was marked 'DESIRED', so would never be used
if eviction became necessary. While a bug in the original commit
prevented this flag from working, when this was fixed in
4a0e7b3c ("drm/i915: fix applying placement flag"), it caused long hangs
on DG2 systems with small BAR.

Don't mark the requested placement DESIRED (or FALLBACK), allowing it to
be used in both situations. This matches the old behaviour, and resolves
the hangs.

Thanks to Justin Brewer for bisecting the issue.

Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
Fixes: 4a0e7b3c3753 ("drm/i915: fix applying placement flag")
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11255
Signed-off-by: David Gow <david@davidgow.net>
---

I'm not 100% sure I understand exactly what went wrong here: I'm pretty
sure the patch is correct, but let me know if the commit description is
way off base.

My system works much better with this applied, but it's possible that it
could work better still with further changes: the buddy allocator is
still chewing up a lot of the CPU, and there are still cases where this
notably affects performance (though, in my experience, these are now
'hitches' rather than multi-minute hangs).

Cheers,
-- David

---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e6f177183c0f..fb848fd8ba15 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -165,7 +165,6 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
 	i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
 				   obj->mm.region, &places[0], obj->bo_offset,
 				   obj->base.size, flags);
-	places[0].flags |= TTM_PL_FLAG_DESIRED;
 
 	/* Cache this on object? */
 	for (i = 0; i < num_allowed; ++i) {
-- 
2.45.2

