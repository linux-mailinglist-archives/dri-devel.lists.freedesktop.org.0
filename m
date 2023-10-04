Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A6D7B77D7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 08:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42D110E33B;
	Wed,  4 Oct 2023 06:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD0910E33C;
 Wed,  4 Oct 2023 06:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696401265; x=1727937265;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m0kG2Im5VB1zi/8jKc7GonTQ48/z54N3F5M2mGBP5uw=;
 b=ZfpSOpj9HiWOXCdAxX3H9TV8789fRSRhceOMQ4zSxOtMi/TeDvXKP/wk
 koQnJn6591TtUtDLPgwx8KByT1Rnm/YdmL6AEwWnqNfIRSwAg9WM+/9KT
 f4YshiNT1PQupSvGH54cs5TGHWQav8LkxHhQvEFDP0W1pGtjPHD813NQx
 2G2pziEJxZ5iP351dz1MjaXwrb8nyEWylsFjoTvvciqKKKdevwKhf28HJ
 Cy3XiowkAiuuN7aVDpSsW+aUSSpHYMU2l4/zEBvBLMoMnUFf5ZpYzqybJ
 T+2TT9sNMsFjoYBL0neWVrHDCKMPnDef7gLA4egWhCJ7nojbn10ak0MSS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363345655"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363345655"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 23:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="751164138"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="751164138"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 23:34:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 23:34:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 23:34:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 23:34:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7HIkZqDYnHNRG4P6cVglmEfHbgG16fhCiy3ETJRGZ87+McAp5xdIH9obcAIrRvB/Yka5FxS9g+Rq8X5rnO4/FmRpMRyIzAXE1+LALqwvtkYyxIOZ9NVZZ5qy8tRqO6kGwGyUWf1Uwf+rLaGeJUYrynBwoNrbT6zcCYjwgChZUOtnFwBi+T5IV/IM6UljvUsv9VcuFNKd+ouquGBbFqdfpl0Yef/428sCF6cTVTogDU46yk7Ap0pAbR41TcZ8kzKNjNcPesxCcEG6lwEKs66bdGgsN7d62Fvb+Cspt6lolGy5lD8dB5K5CQeAt5UgnsyleKypyOjSGd9mNd/I31NcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WKjy7hqddBR8kRu2jEfMQ88GZbyWlpXQakWTt8aHqQ=;
 b=fu7OJqMAl8LDcvsr6DAPBqmwML2d/UIfihNeOHLd3fG2Gg9CAsLrZAUnhzbJjwum+QdBq8l8dZtrqLesfmnEigfo6fHA+9F0K5RLjKKcqtUBNcF//q0Q9ayIlWepCmr0mXBPTleKu78fV9BYXGL6BE69o0IK2GTdNYg+pePNFtSjlPwIOf18i72RrhmBBZVxgGbBQZ6Xa99Jt4rT1extwS+LCG3Pk2PJkkcLuN7m8TePqxLj/vaIKvOf1QbDIfwl4wV24FLXqdlwXnuAzLYOt2qoNaWOoKTwbtz9iJaQ6xFrS146Iy5f785aFeH8N2H1y37ao+gnjWWWwN4ILDnJNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS0PR11MB7443.namprd11.prod.outlook.com (2603:10b6:8:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Wed, 4 Oct
 2023 06:34:18 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241%7]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 06:34:17 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v4 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHZ8KxyUjK++eQzZEaWUKRz6VjvUbA5NvFQ
Date: Wed, 4 Oct 2023 06:34:17 +0000
Message-ID: <CY5PR11MB6211092F8BB449C358D59D2A95CBA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-3-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230926190518.105393-3-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS0PR11MB7443:EE_
x-ms-office365-filtering-correlation-id: b2e3c3e6-f2e0-4307-1b6c-08dbc4a3ef22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +sa741aP1XItRC7c1Gc93hn5q7aUkVTZhepdqWonQiQq++tjhSyIuqTW9wsN0L8ZToriKxQyg907jOl3LvzHVsEV42bx7ylwYhxy+OFeXObqNZbDFGGLuFIR6WD5D/MXIsg7VC2TahXeGaQis7LoOfWu97SUcrVV1pGdl2s2PYU1H2rnySruxIdF1kYOiHZDpi52bSIk+0XoY0z0guBe5ZuufxyFx/bH+dmXn/rHWHRS3CPW2bx7DaY7KTZyaRrYxFX9hKzWvilVpeO+Ty2I0w3xIDjQFbXAoO/K1vCG4PwBqN1Bp3mNORzyUDwsqu9Ebnw2majKuzPOsB6DC3og7qrXB7UaqWQdR2CxmCKeX3igz7Lb8ejbHbED4019MNKPDcx1lDdtaWsIlvYI5AF/8S9Z3hbqBP81FCQYkOIb64YAcN9Xq7ngdyFmTLBYhjukuyL2Iv4V/oHL+b1cGMTLi5O7NE0gimfdDMCKH7vda+eFDMcKcK1doHufiG0JsBX7f/27W9R+85FDh0QqiOrW9fbKVsqlqE+fLSYNCy1pDSrSPONPrdBJ47k+1gz1cjoq0EVg0vKRtDzlbio6Fy7rGzcBEET8xVcW1oFTWYsA3V2H8vtwIMT/m6K2RP1NEdAH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6506007)(478600001)(53546011)(7696005)(71200400001)(9686003)(107886003)(83380400001)(26005)(33656002)(66556008)(2906002)(450100002)(66946007)(76116006)(8676002)(110136005)(8936002)(66476007)(316002)(5660300002)(64756008)(52536014)(4326008)(66446008)(41300700001)(54906003)(38100700002)(86362001)(122000001)(38070700005)(82960400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GRiqkcMbo9seEdOHyAlc8lP5z2GYRGhv2MEVxD4e/BeU4o1bCmcacLbHxqZc?=
 =?us-ascii?Q?llLk+1RoIkuByq5ddo2oKxXXmviOINF83fVSib7MybSUmtQyZBMftMqUlPba?=
 =?us-ascii?Q?UmLI7+4gCxy66bXKVoFL6Uez0jLk3NYxl3sI7SVhPfN0oL72eY4awXkZVcqw?=
 =?us-ascii?Q?uxKm/L8U+/BpL6gjJm9SbgHkwYBe75dfEPpIqJG/q8poIOiSafUgOBjMwPgl?=
 =?us-ascii?Q?Wvh5W8aYkM0JnpjMo5qFloeFbekckx+ljtjUpsI4K0T8ImumNxg095wg4AM2?=
 =?us-ascii?Q?7VvE3pP7AJhkVUTQFHsn0zBK79oQazKNJj6Rbo/nKvGqSUPKJrRxKwkcIh6+?=
 =?us-ascii?Q?+Sb0BD3bm4nK+KtGjVd5bKFPqWxxzxW85WKYa6uUymmrsvkLe2B2kfg5bYJv?=
 =?us-ascii?Q?OOK+UL+BpB92CN/rNpD+zDavJfr8zWujG7BdWkORlqYBSlpn6MXHJrUnKL/U?=
 =?us-ascii?Q?eKETc3kX7rHVizEhPwKqjL2CZFKdpHxJqrnyl9bv4cvTjefI7PcAkLKn7VCZ?=
 =?us-ascii?Q?ePDz2aXCXDPWnTHrvcTvDRR0P1GQz8zwBlhLrzsJeYxD2DfWJ3PFmC4mIaRa?=
 =?us-ascii?Q?nrEGBcRjZPXnenYqShml7kUOPV7Wl6J1cBOw/ZN7wX+svy1hopBhvQ2KlnAj?=
 =?us-ascii?Q?wMq0KZAsIyALgVcfGzMjISQGnVZplR1wQO/O82JC0GnQCzMnKGw0mB3sCgUq?=
 =?us-ascii?Q?ZIIJz7xHTujGJzPMnTJk8To0rL5iC0048adc0lRs8v500iuWnNfD2RD6p5LP?=
 =?us-ascii?Q?k0p9NQN+xXcX0hmzCM8JkerF+RhfQyY+mxA4EhVh88vFwidUdTTMhlfx3bEW?=
 =?us-ascii?Q?xTMFCdEtbFxl1RPPLc5FrCy/ksXiwWTH1q93q0m3gkOh1fx3gYySyvlrX9qQ?=
 =?us-ascii?Q?m33a0zKiSEe/AGeVsQbTgEl7mT2Mvp9qmPRcFhHRy2cntn8H9RBwpWEBZ/Hr?=
 =?us-ascii?Q?VJD4wCU76z49qrOakQOEMJwA7RNzH4Y27UJlA39P6p8RkGxmhaXYQMzsIlKO?=
 =?us-ascii?Q?otsIEUKErChfxFVwHMYKzdClca1JIu/+JQp7tixACK17XX+Fd/qLmvo/tkoL?=
 =?us-ascii?Q?xvL8fI1hx+RmLQwc7BH+yiJGyVXYHzlOeNeSTD12g2l5XQO5/mFti9hMePI9?=
 =?us-ascii?Q?Yas8f0NpjOX2i6xqBoLZ1ZpVgMGe9oZFqRm04ZEZcw956CCW6twiWg+6IfVQ?=
 =?us-ascii?Q?vWo8/gshi4mMihPi8f3fIA7G3HIE23GT3iLXdqlvrud0ENzGlUK0VkSjJbds?=
 =?us-ascii?Q?EV9xPvWdWXXJU4KuSDcGTUNaNNd0FYej6yvp85KX9afkmbwDN1ati6/yGKGk?=
 =?us-ascii?Q?DRWdp6KgWADmFRvWK/ocggwTrm3WRYF0bsxY3nNWNA6jI1rXh2Y0au1lVmE8?=
 =?us-ascii?Q?oOnxNfq9Eofm9jPxz+W8CcmX4uTG3Bcbficg4fSW7bgDKWuvoiBCD6vUOFR5?=
 =?us-ascii?Q?YnUFbDYzWAPj5/uDjptDc+ZaEhQ3bPfA74GuwIjwE3leTLs3qkQyQRBMNnkz?=
 =?us-ascii?Q?klfqHv3/Nh/l27fwJM1K3wa5pwLJRpRx4nS2gWOzoxOsgA93OzdmZJpTrqle?=
 =?us-ascii?Q?7ArVf0ksVCY+ggLWYzABmkC1j5NnkQwmoEDAzCW9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e3c3e6-f2e0-4307-1b6c-08dbc4a3ef22
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 06:34:17.3340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ou3bMITiE41wjSHgIGE8Hr9RhH/PV6jN/Txz70WpZnMPBWvaRvX0qC5FiRJmIsHYioDOT2lDMqZe/q7cKC37O0lb+JGKUmGc/W/mndQnRFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7443
X-OriginatorOrg: intel.com
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
Cc: ,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
	"Vivi,  Rodrigo" <rodrigo.vivi@intel.com>, intel.com@freedesktop.org,
	"Jana,  Mousumi" <mousumi.jana@intel.com>,
	"Harrison,  John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
> Sent: Wednesday, September 27, 2023 12:35 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; dri-
> devel@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Cera=
olo
> Spurio, Daniele <daniele.ceraolospurio@intel.com>; Harrison, John C
> <john.c.harrison@intel.com>; Anshuman Gupta Alan Previn
> <anshuman.gupta@intel.comalan.previn.teres.alexis@intel.com>; Gupta,
> Anshuman <anshuman.gupta@intel.com>; Jana, Mousumi
> <mousumi.jana@intel.com>
> Subject: [PATCH v4 2/3] drm/i915/guc: Close deregister-context race again=
st CT-
> loss
>=20
> If we are at the end of suspend or very early in resume its possible an a=
sync fence
> signal (via rcu_call) is triggered to free_engines which could lead us to=
 the
> execution of the context destruction worker (after a prior worker flush).
>=20
> Thus, when suspending, insert an rcu_barrier at the start of wait_for_sus=
pend so
> that all such cases have completed and context destruction list isn't mis=
sing
> anything.
>=20
> In destroyed_worker_func, close the race against CT-loss by checking that=
 CT is
> enabled before calling into deregister_destroyed_contexts.
>=20
> Based on testing, guc_lrc_desc_unpin may still race and fail as we traver=
se the
> GuC's context-destroy list because the CT could be disabled right before =
calling
> GuC's CT send function.
>=20
> We've witnessed this race condition once every ~6000-8000 suspend-resume
> cycles while ensuring workloads that render something onscreen is continu=
ously
> started just before we suspend (and the workload is small enough to compl=
ete
> and trigger the queued engine/context free-up either very late in suspend=
 or very
> early in resume).
>=20
> In such a case, we need to unroll the entire process because guc-lrc-unpi=
n takes a
> gt wakeref which only gets released in the G2H IRQ reply that never comes
> through in this corner case. Without the unroll, the taken wakeref is lea=
ked and
> will cascade into a kernel hang later at the tail end of suspend in this =
function:
>=20
>    intel_wakeref_wait_for_idle(&gt->wakeref)
>    (called by) - intel_gt_pm_wait_for_idle
>    (called by) - wait_for_suspend
>=20
> Thus, do an unroll in guc_lrc_desc_unpin and deregister_destroyed_- conte=
xts if
> guc_lrc_desc_unpin fails due to CT send falure.
> When unrolling, keep the context in the GuC's destroy-list so it can get =
picked up
> on the next destroy worker invocation (if suspend aborted) or get fully p=
urged as
> part of a GuC sanitization (end of suspend) or a reset flow.
>=20
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Tested-by: Mousumi Jana <mousumi.jana@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  7 ++
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 81 ++++++++++++++++---
>  2 files changed, 77 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 5a942af0a14e..59b5658a17fb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -289,6 +289,13 @@ int intel_gt_resume(struct intel_gt *gt)
>=20
>  static void wait_for_suspend(struct intel_gt *gt)  {
> +	/*
> +	 * On rare occasions, we've observed the fence completion trigger
> +	 * free_engines asynchronously via rcu_call. Ensure those are done.
> +	 * This path is only called on suspend, so it's an acceptable cost.
> +	 */
> +	rcu_barrier();
Let's add the barrier after the end of prepare suspend and at start of late=
 suspend.
To make sure we don't have any async destroy from any user request or any i=
nternal  kmd request during i915 suspend?
Br,
Anshuman Gupta.
> +
>  	if (!intel_gt_pm_is_awake(gt))
>  		return;
>=20
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index fdd7179f502a..465baf7660d7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -235,6 +235,13 @@ set_context_destroyed(struct intel_context *ce)
>  	ce->guc_state.sched_state |=3D SCHED_STATE_DESTROYED;  }
>=20
> +static inline void
> +clr_context_destroyed(struct intel_context *ce) {
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state &=3D ~SCHED_STATE_DESTROYED; }
> +
>  static inline bool context_pending_disable(struct intel_context *ce)  {
>  	return ce->guc_state.sched_state & SCHED_STATE_PENDING_DISABLE;
> @@ -612,6 +619,8 @@ static int guc_submission_send_busy_loop(struct
> intel_guc *guc,
>  					 u32 g2h_len_dw,
>  					 bool loop)
>  {
> +	int ret;
> +
>  	/*
>  	 * We always loop when a send requires a reply (i.e. g2h_len_dw > 0),
>  	 * so we don't handle the case where we don't get a reply because we
> @@ -622,7 +631,11 @@ static int guc_submission_send_busy_loop(struct
> intel_guc *guc,
>  	if (g2h_len_dw)
>  		atomic_inc(&guc->outstanding_submission_g2h);
>=20
> -	return intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> +	ret =3D intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> +	if (ret)
> +		atomic_dec(&guc->outstanding_submission_g2h);
> +
> +	return ret;
>  }
>=20
>  int intel_guc_wait_for_pending_msg(struct intel_guc *guc, @@ -3205,12
> +3218,13 @@ static void guc_context_close(struct intel_context *ce)
>  	spin_unlock_irqrestore(&ce->guc_state.lock, flags);  }
>=20
> -static inline void guc_lrc_desc_unpin(struct intel_context *ce)
> +static inline int guc_lrc_desc_unpin(struct intel_context *ce)
>  {
>  	struct intel_guc *guc =3D ce_to_guc(ce);
>  	struct intel_gt *gt =3D guc_to_gt(guc);
>  	unsigned long flags;
>  	bool disabled;
> +	int ret;
>=20
>  	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
>  	GEM_BUG_ON(!ctx_id_mapped(guc, ce->guc_id.id)); @@ -3220,19
> +3234,38 @@ static inline void guc_lrc_desc_unpin(struct intel_context *c=
e)
>  	/* Seal race with Reset */
>  	spin_lock_irqsave(&ce->guc_state.lock, flags);
>  	disabled =3D submission_disabled(guc);
> -	if (likely(!disabled)) {
> -		__intel_gt_pm_get(gt);
> -		set_context_destroyed(ce);
> -		clr_context_registered(ce);
> -	}
> -	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>  	if (unlikely(disabled)) {
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>  		release_guc_id(guc, ce);
>  		__guc_context_destroy(ce);
> -		return;
> +		return 0;
>  	}
>=20
> -	deregister_context(ce, ce->guc_id.id);
> +	/* GuC is active, lets destroy this context,
> +	 * but at this point we can still be racing with
> +	 * suspend, so we undo everything if the H2G fails
> +	 */
> +
> +	/* Change context state to destroyed and get gt-pm */
> +	__intel_gt_pm_get(gt);
> +	set_context_destroyed(ce);
> +	clr_context_registered(ce);
> +
> +	ret =3D deregister_context(ce, ce->guc_id.id);
> +	if (ret) {
> +		/* Undo the state change and put gt-pm if that failed */
> +		set_context_registered(ce);
> +		clr_context_destroyed(ce);
> +		/*
> +		 * Dont use might_sleep / ASYNC verion of put because
> +		 * CT loss in deregister_context could mean an ongoing
> +		 * reset or suspend flow. Immediately put before the unlock
> +		 */
> +		__intel_wakeref_put(&gt->wakeref, 0);
> +	}
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +	return ret;
>  }
>=20
>  static void __guc_context_destroy(struct intel_context *ce) @@ -3300,7
> +3333,22 @@ static void deregister_destroyed_contexts(struct intel_guc *g=
uc)
>  		if (!ce)
>  			break;
>=20
> -		guc_lrc_desc_unpin(ce);
> +		if (guc_lrc_desc_unpin(ce)) {
> +			/*
> +			 * This means GuC's CT link severed mid-way which
> could happen
> +			 * in suspend-resume corner cases. In this case, put the
> +			 * context back into the destroyed_contexts list which
> will
> +			 * get picked up on the next context deregistration event
> or
> +			 * purged in a GuC sanitization event
> (reset/unload/wedged/...).
> +			 */
> +			spin_lock_irqsave(&guc->submission_state.lock, flags);
> +			list_add_tail(&ce->destroyed_link,
> +				      &guc-
> >submission_state.destroyed_contexts);
> +			spin_unlock_irqrestore(&guc->submission_state.lock,
> flags);
> +			/* Bail now since the list might never be emptied if h2gs
> fail */
> +			break;
> +		}
> +
>  	}
>  }
>=20
> @@ -3311,6 +3359,17 @@ static void destroyed_worker_func(struct
> work_struct *w)
>  	struct intel_gt *gt =3D guc_to_gt(guc);
>  	int tmp;
>=20
> +	/*
> +	 * In rare cases we can get here via async context-free fence-signals t=
hat
> +	 * come very late in suspend flow or very early in resume flows. In the=
se
> +	 * cases, GuC won't be ready but just skipping it here is fine as these
> +	 * pending-destroy-contexts get destroyed totally at GuC reset time at
> the
> +	 * end of suspend.. OR.. this worker can be picked up later on the next
> +	 * context destruction trigger after resume-completes
> +	 */
> +	if (!intel_guc_is_ready(guc))
> +		return;
> +
>  	with_intel_gt_pm(gt, tmp)
>  		deregister_destroyed_contexts(guc);
>  }
> --
> 2.39.0

