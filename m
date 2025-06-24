Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A5AE717F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 23:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B66510E623;
	Tue, 24 Jun 2025 21:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0G8Xz74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DFC10E623;
 Tue, 24 Jun 2025 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750800306; x=1782336306;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fBgTqoLOEsjfqtbmUs6iFnfcKe/lx1RLiGYQ0KwzOuQ=;
 b=c0G8Xz74mKZSU4K1KAHj7I2nLCWq8S1MaRkjhL1LrZextYKgaaa6gTG2
 NQM/fFHHqwdy5wAMbqNhUXfCFBwD7ZfB+l0cobvHQfgqJfgOQukU1MLv2
 V9YbcbAv2/40N3Ql4aA5Rz1nnV229OkjpsIOYU+DkEA7Zkvlub8u6IV4K
 jD+cAUCBrdAxaRfqfYVv4udjC/PZS33ddFt35Kq/+N/AvwFlGXDq4m13a
 u0Sh39MRCi1B1pmkzClSkveWoXVa4k4cnncqA0+IjaUTbL6wQtEKFKp1o
 xnLmYH3XuCcE4I9PonYzP2c/j1AtgDN4z0q1LK0Ow3lEcpOReYpZg/IB8 Q==;
X-CSE-ConnectionGUID: o0Q2wln+SvSfOIzKvQ/Jeg==
X-CSE-MsgGUID: 5OzlGc37S1+s6egzFbTx+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="55685368"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="55685368"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:25:05 -0700
X-CSE-ConnectionGUID: 8HKkd1m+RIitGfeKPfV9IA==
X-CSE-MsgGUID: zYbDhKaqRni5tmhBASvvEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="151773834"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:25:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:25:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:25:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.64)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:25:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4U3s64R3iTVbBsXN/rmw//Ppn3XUbVZyBC85o3jm3I5pZPD7d+IHHvvK0UY2bwizvOMAXuWom+DHCA6NnEs9wtdLrU2EUAQ8aGY7AAII2uwItRUhdq56lj/McMQyaKv8DVMKzh4t3+8092IDvMJfykgrTbtgKGMukegOqj9CMUoO2if3CE+hidgVZJA6M+R3idUTNht+Dezj8mWnwwqJhmHCUqSNqmCyKnbLRF/qYOnavA6nN+Z3yZVmTV0u9lC/YfjAp8UenyORsDRrpL4ktv982aGqVC9nUaEC4u+xreMcBNqKKWhtNZHQWvUERg0Is2HOHaK5ikyChxJEb51rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LANyiC4uSjx0DzL5fotdX9eFvwdbeI05QhBSRsLhofQ=;
 b=jBp6uCNshVCyusefLFnq9N7VS6J8B5Db1MuxOt35zF1fawyP4dKF0C3dZuti/M3V7Z3qcRI2Wd1YbX8ZcwqvwxKYJGew71DetBtRcibNtPrI87XL3f8yZbuFzTeIghZpcJ3EdAofYTYMFklfx8aiz+IXWmSqvWu4m824L8bESMyCkF7baozjHDGHC1dubJ+nPnemEqXOjn/TBIrPUmbR2O+5qxP8CIY7NjUsMKUoybAVJJ2Iy5wZua4hViTd4Q4S1eG0/SXhrXiBOlzCKRwb/w1VIJxLfI/9NfsY1VVDdUvuOdGOLAuxELC2pBNlcFoJaTPkuD/hYM7xt1trzmPSEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 21:25:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 21:25:02 +0000
Date: Tue, 24 Jun 2025 17:24:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 "Ashutosh Dixit" <ashutosh.dixit@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Arnd Bergmann <arnd@arndb.de>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Nam Cao
 <namcao@linutronix.de>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH] i915: fix build error some more
Message-ID: <aFsXpzLouPQsKJh9@intel.com>
References: <20250620111824.3395007-1-arnd@kernel.org>
 <aFsUllcRshBtV9xc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFsUllcRshBtV9xc@intel.com>
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: c495d548-0d9f-4ac0-60cb-08ddb365947c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I4exD6oyPwIAzJYF8/GHO1LikhugmidNBd3Bf7jnFJ0K0ObR9afFFEuQ+Yv8?=
 =?us-ascii?Q?1OBu2LlZBov7vSQHLUFrQ+E943KsX8/q6q4CGuLnEF/kpbJ2rNJ8AqaAW7HV?=
 =?us-ascii?Q?RyTLl2a46U3vc9xObHEI/gPe7owcrLvR60MJb7PP0vdSt8nM711DkQwKCqWV?=
 =?us-ascii?Q?ceWwl7BM5hKgeOjouEtnll4ABNqCno4SNOZjt3ikaRlff/NBy6UqLkUEA8vI?=
 =?us-ascii?Q?5rUPFjyiGY0GQwbk7xIp0jg5jq9OZbIF4WrM+M/kXzZ4hdiTEUAhZGNkPWpb?=
 =?us-ascii?Q?29ajalKiiMar2aQEO1c5mxvhjBbcVAEVrRO3HMfcZKvFDVEjJWthBGGUlJCD?=
 =?us-ascii?Q?KEHoB4OcYCYdCIiQgMLgNf5v4Z+sZs0qTLX3BUFs0QUIdrYKgwwuTQQTpRSs?=
 =?us-ascii?Q?0usQ86nnuRjcm7t5qyxfYabpX/TS8dxcQjdupGH+uqml43OVe/h5MqgvvB4z?=
 =?us-ascii?Q?OJDE1jlIUxxItRjmXD+PdmMzY9/DADx6U9aKb0bmqs8/SalW6XfgBQDo8+Pa?=
 =?us-ascii?Q?T6mq569T3kKw9vIqFYkQf3CUCNrsX/7L0dR53ZFy3zekOPLNO7S3YcKf9uDr?=
 =?us-ascii?Q?IclL0b0I0/bWBO0UGh3Z/BTsIXti/KOj0QsMG2cic6Or3jJcvx8TT7e3Rv9V?=
 =?us-ascii?Q?PAvIeVm0SiXScK4UAgtzionTsy+qQwic7eC3P+I2JWKXsL2YXVO4JQNQijjD?=
 =?us-ascii?Q?5muLlUj5lRmIBLIcVVA9MHorsK4mcYrVlsrKVWoUuoOx1sK/98hE2rHBmJOm?=
 =?us-ascii?Q?z7roDxCRf/wEIKJqRgJgFiLAC4YGlJBdryeNT+Lb9ygwykWJigISNj15mm1i?=
 =?us-ascii?Q?Ts5BTjYrBAsxzRdRlXSF+ZrTEOuRnfTCXHkobl1osgFcZuXodGmYo9xEyB9z?=
 =?us-ascii?Q?KGBcoJYSRGXKn+2Zs83extfhopvNMHs/tWGeeKWsPZ1/l/2JG3g4m2F0j5iL?=
 =?us-ascii?Q?rDAlSLx4P5i0N9BduTwGWnIAe2OCcchxQfYcq36jly7TA4YkQd2jMWcOJEvj?=
 =?us-ascii?Q?+xnR667pdojITN4R+csEca9t+EMvi33ST7DR7+jJmANP3zS8ZsHUPtUvxCvg?=
 =?us-ascii?Q?xS/JwL85eJjyX4OeIP27yIZ0jYwq91i3p7A8uDMXKFaYZ7CQxwrk3DHCjn6p?=
 =?us-ascii?Q?rg/K8pKYT4IusDaJhv+vRqoh1ob00GRkKKz97NWYIFQOdhTC1NjKZqOB6z+0?=
 =?us-ascii?Q?CPeahoZFIcOKg+vbARK41AS7c97z5z5pva/YeDvWNMma1D1IkuBrVkrQZO6u?=
 =?us-ascii?Q?75XWM76vcNer6s2HRfFkZwWcyJzadlQqOQlgzvp4+uNqR4THKybAGad8ShFP?=
 =?us-ascii?Q?9VMByxvhALqk1FrroGwQzOpNphXmYU0EEzMdTg4K54FAfe4W/62H9DT/F2Zd?=
 =?us-ascii?Q?PnlHA7XelK5x42IFXfL4RyWlOX8pE3veqYOKcSigI5gC1GpHag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K3jvssSKvHdTo8OELZ2WW2fiZsmSK8+P/uJiT6S3o+Eux39Img5nm0+Ykfmf?=
 =?us-ascii?Q?U5eqeTpj+UgT5DJoP7xVhF4LwOnp90JQHAr5MJSLN9l0hTDmn8pjicS2ASQ6?=
 =?us-ascii?Q?+M0KfrJNuC3biReb1aNL+RgRQjXQk6ysGXqiSfrD32jCLxg+JjRxMtvp2LLr?=
 =?us-ascii?Q?196KZFAulXWoTsVGNNIa4FirjhqhQfFJIph9Rv3qlzebDh/lvY01EfWTpet5?=
 =?us-ascii?Q?tkiYSFd50o3ddh5iQse+0zGXXS2fK422Uyt3zsgAcLMoqFhYvs+8JcwEiZs1?=
 =?us-ascii?Q?WBJ5HgHsiBrioxQWXEppZ7M1TzShxjoHG9EME+jGngr8pgvHbSr8Ilz5Oeyh?=
 =?us-ascii?Q?ymusrbYf30jPVc5Dq/tj0V+aDKARq/eQ60eiCTudM4cuCIg1NLMc12Aq0vU1?=
 =?us-ascii?Q?HJsHHuw70hkkinYnojdVTpoLXJrTldTj+cKxpGjjJOC0GC82oR4DPeKZD6bp?=
 =?us-ascii?Q?1EvN0fcG7Src+S2QlXqzBvB7Wjy+Ki735JCTxknySIaEZ/YewteH8vwsctKm?=
 =?us-ascii?Q?ogvcp4d9e5D8HLOvUAaWhMyVzLYGJs7q7vz5FvT3rWSyD8nw9+zjR9+7XwMv?=
 =?us-ascii?Q?6KR/AyZS5Mta01cN0a9F2ofsY3gGt5aU0Mr2asBol2DCj4DUJ/SzjovsbL/i?=
 =?us-ascii?Q?dSWw1EZWLgsad8nBZhxYM0aT47chyUMICd6hFJZyXm6Jy35GzHBh+QIaE1Al?=
 =?us-ascii?Q?bSP1jAezG1LKahNw17r5KpYUBn5N6KIxn23H/B2iGMO7Y0qfSVwT+JhAQwki?=
 =?us-ascii?Q?UYqXaRN83JAlFbQPeriKKtbVkF3RUPiKfeDn2wa+YxE7niKkd8jfH82hYUvV?=
 =?us-ascii?Q?MEKyUnznWVavF593yNhvzxXiMsucMiL/4/cJKdEA9QSG2EVWfgsYLiobZ5iK?=
 =?us-ascii?Q?VrnzI1hDDK+8/1tEoMMJBB2oldg8/4/EqV4JTrYs50bwiuBxVA5eXCdgRgem?=
 =?us-ascii?Q?FTZp0HkmQMRy/nxLbKu9hRxnyx8+McD6Jep/jkZmTVrU6A3rosWDbSWKs3AL?=
 =?us-ascii?Q?fUfog08c7NdPO8TNyyDs8O/B4NhJv/kFBovQYj0FlNRkcFWU2XN4Sd3ugoM6?=
 =?us-ascii?Q?ttqUvAKjIRK/I9EUwqOsz82AVpVJ31AZaB9tqIVdeBOo/AAzW6aPB2gXobrP?=
 =?us-ascii?Q?rLVHN/8KwPK8RonB6ZzlS/8qXlcxVchX8cznwHVs5OA9636E2wLSPkHRmZKf?=
 =?us-ascii?Q?W2Js46mxtMgTgQeWBP9pyGkGsqnZBzFgnL2GQcQjz7Oo6OQdPi4rVvsklQEx?=
 =?us-ascii?Q?rJxFsVZ72zrGxymabe6MAjI6S7QYLK2NjscVEoA8e/r5+jlbj80NI3Vrpcyq?=
 =?us-ascii?Q?HgizDcffW7p3AiQTS++7rd6D+5DLzHHvBjf07sakCgr5NvSnCVy0pW7SUE4/?=
 =?us-ascii?Q?ZlLQqTmhuyghUISpOhXskGRtnTQwINVdpMb9NE8TdyNgHqHHuQVaZVKtRqxg?=
 =?us-ascii?Q?Gu5QoKeqSXF48KBYZpfvskzD24EtLs2X3prbTwxfXuR3mn4WiEiVUJb2tkXd?=
 =?us-ascii?Q?u0Fhk1mx1Lk5Aean0RqTQFsJ+2aFH3kIwZuJ0BXy+DxMmpAKuexupGmaOS1e?=
 =?us-ascii?Q?es5ZCjtGmpD2zZURDIPkkPDvSQbfaoGrHyuR9ouY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c495d548-0d9f-4ac0-60cb-08ddb365947c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:25:02.2940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8RKyQkkfNNQvSaa6lmWu/bwfYN6fWyN/Jdw7nGXnc+MtPAPiAMEPv+AsdktLKxh9hi27lXfmQIJ9mzwv7WakA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 24, 2025 at 05:11:50PM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 20, 2025 at 01:18:18PM +0200, Arnd Bergmann wrote:

While merging this I adjusted the subject to be drm/i915

> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > An earlier patch fixed a build failure with clang, but I still see the
> > same problem with some configurations using gcc:
> > 
> > drivers/gpu/drm/i915/i915_pmu.c: In function 'config_mask':
> > include/linux/compiler_types.h:568:38: error: call to '__compiletime_assert_462' declared with attribute error: BUILD_BUG_ON failed: bit > BITS_PER_TYPE(typeof_member(struct i915_pmu, enable)) - 1
> > drivers/gpu/drm/i915/i915_pmu.c:116:3: note: in expansion of macro 'BUILD_BUG_ON'
> >   116 |   BUILD_BUG_ON(bit >
> > 
> > As I understand it, the problem is that the function is not always fully
> > inlined, but the __builtin_constant_p() can still evaluate the argument
> > as being constant.
> > 
> > Marking it as __always_inline so far works for me in all configurations.
> > 
> > Fixes: a7137b1825b5 ("drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled")

and to point to the original right patch instead of the cherry-picked fixes.

> > Fixes: a644fde77ff7 ("drm/i915/pmu: Change bitmask of enabled events to u32")

And then I pushed to drm-intel-gt-next becasue of the mention on this patch

> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/gpu/drm/i915/i915_pmu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> > index 990bfaba3ce4..5bc696bfbb0f 100644
> > --- a/drivers/gpu/drm/i915/i915_pmu.c
> > +++ b/drivers/gpu/drm/i915/i915_pmu.c
> > @@ -108,7 +108,7 @@ static unsigned int config_bit(const u64 config)
> >  		return other_bit(config);
> >  }
> >  
> > -static u32 config_mask(const u64 config)
> > +static __always_inline u32 config_mask(const u64 config)
> 
> hmm, it looks like the __builtin_constant_p() with BUILD_BUG_ON is a bit fragile
> design down here. But this always_inline will enforce deterministic behavior
> indeed.
> 
> So,
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> pushing to drm-intel-next right now as well...
> 
> >  {
> >  	unsigned int bit = config_bit(config);
> >  
> > -- 
> > 2.39.5
> > 
