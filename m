Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0868C42B099
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 01:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351D06E042;
	Tue, 12 Oct 2021 23:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1799 seconds by postgrey-1.36 at gabe;
 Tue, 12 Oct 2021 23:49:12 UTC
Received: from 6.mo560.mail-out.ovh.net (6.mo560.mail-out.ovh.net
 [87.98.165.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DE06E042
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 23:49:12 +0000 (UTC)
Received: from player762.ha.ovh.net (unknown [10.110.115.164])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 68C5A224FE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 23:11:16 +0000 (UTC)
Received: from etezian.org (unknown [31.22.55.47])
 (Authenticated sender: andi@etezian.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id 72816231C9D79;
 Tue, 12 Oct 2021 23:11:05 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0022a29f053-239c-4698-bc61-1bf3f12af407,
 C786CB9E79FC7D8AF81679FEBE5E79C8CF9BC842) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 31.22.55.47
Date: Wed, 13 Oct 2021 01:11:04 +0200
From: Andi Shyti <andi@etezian.org>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 11/11] drm/i915/xehpsdv: Initialize
 multi-tiles
Message-ID: <YWYWCLe0HLw2CaMB@jack.zhora.eu>
References: <20211008215635.2026385-12-matthew.d.roper@intel.com>
 <20211008233310.2034639-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008233310.2034639-1-matthew.d.roper@intel.com>
X-Ovh-Tracer-Id: 1590896571445742288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtledgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihesvghtvgiiihgrnhdrohhrgheqnecuggftrfgrthhtvghrnheptdfgudduhfefueeujeefieehtdeftefggeevhefgueellefhudetgeeikeduieefnecukfhppedtrddtrddtrddtpdefuddrvddvrdehhedrgeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeivddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
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

Hi Tvrtko and Matt,

[...]

> -#define I915_MAX_TILES 4
> -	struct intel_gt *gts[I915_MAX_TILES];
> +#define I915_MAX_GTS 4
> +	struct intel_gt *gts[I915_MAX_GTS];

let's call it MAX_GTS already in patch 5 so that we can avoid a
rename.

BTW, out of the scope of this patch but if we can read the number
of tiles, why don't we make this dynamic? We already have a
"dynamic" version for_each_gt() in probe_gts().

[...]

>  
>  	struct {
>  		struct i915_gem_contexts {
> @@ -1724,6 +1726,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  
>  #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
>  #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
> +#define HAS_REMOTE_TILES(dev_priv)   (INTEL_INFO(dev_priv)->has_remote_tiles)

s/dev_priv/i915

[...]

> +static const struct intel_gt_definition xehp_sdv_gts[] = {
> +	{
> +		.type = GT_TILE,
> +		.name = "Remote Tile GT",
> +		.mapping_base = SZ_16M,
> +		.engine_mask = XE_HP_SDV_ENGINES,
> +
> +	},
> +	{
> +		.type = GT_TILE,
> +		.name = "Remote Tile GT",
> +		.mapping_base = SZ_16M * 2,
> +		.engine_mask = XE_HP_SDV_ENGINES,
> +
> +	},
> +	{
> +		.type = GT_TILE,
> +		.name = "Remote Tile GT",

why don't we call it "Remote Tile GT <N>" or similar?

[...]

Andi
