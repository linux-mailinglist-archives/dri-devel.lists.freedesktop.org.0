Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDC4A7A87F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1034B10E248;
	Thu,  3 Apr 2025 17:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEpOcs28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAD810E248
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743700884; x=1775236884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1KSE7msIl0fF0Sg3s/WKsjgqvaW2u+jm8AOcf9pZIto=;
 b=IEpOcs28rKUrJnVbT1m79L7i/2HAUGl6F67bdeQQj6yVCvwOrshFgeGX
 AJQR+QI3Rd8TdVck3NzJ5X74s7XvK/FT8izpDNVaKGClesvaL4shVZUr5
 yTAeqif045COs3Hm2oDSM5Eu0RaYjlRIcjK2yYYmmbFl9RaYHojzPtT/o
 Y7g4Ui5J4xDrttFdAB4CdqFIVyIJYgLt5dZLllp/nUlPAYYvru18KBPD4
 JMWtFfYAXPemWTCdGFTppWRoGOOAkM+HThtM90EvEpGT+fYWykQovqZF7
 ee67ZdflHt/+Z+iuJGNoSr/U0ZnrRQl9JPixQH//DQKLndh27d3eAD8zN w==;
X-CSE-ConnectionGUID: X0w4xG0fSxWPhdBnWGyERg==
X-CSE-MsgGUID: HpCSveDRSWyeLTrWzN6SfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70496819"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="70496819"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:21:23 -0700
X-CSE-ConnectionGUID: rcoTv6JUTLeXMwPfYoT3Sg==
X-CSE-MsgGUID: ShMqLSOIQweuTJ/8gSmI7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127995424"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 10:21:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 10:21:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 10:21:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 10:21:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4VYlL6ubF+o4kZrMk5YwjQSlLp2FGNhWjNhhGrEuhzdgWlYMot5GRYERVgMgnRk53BNwBB9ovodzF6mjAONUOBM+4X3EqxXJs0zoP8AWZrVBGn/Wh4JEsg1Mf92VHpB1SBSYka8ZWNkZ4wj2+3wzQSXjg1X28zavFzN96N1xY9F8XycAxXT1/Sv+ANcJV0bN36r834vVbiOC5yNd9yUHEiw/8Y+CyEtXsXwHjEfx8H2x40jAfr2b6VzXb4He/SaQO+pCh1FXX3wmLuSFLRcylb/1H1iEDN8LEa7ewjyM8SR/iKmR8rQOM6bwSEc/Zu6B5Vl4fgw5jfsK8SK9Y3L9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KSE7msIl0fF0Sg3s/WKsjgqvaW2u+jm8AOcf9pZIto=;
 b=elBEHLIfjtdtjI3v2H70eJ5mGiHpPWnKUccbJSwYzrakxsyXAFu32RAuUXLyE5VfYsMlXBcSMpRz1kS56WohggYeeRlNtAq2rMRCjrmK9MDjz9GjLZH0Yb7ZF3+509MELkb6nL127h7fifvNPX9wOxRXM4es2FW6BMc8e+j6rnzzKV20ZG+asOpXBVMdFS6AfFL7iNw9o19bHlBpPXt3wZ79r7uxLJs8IDcGJfqGz7B1h/3VJwV2BIHO08GkqOmnR8ZbRE89HxcQ/Z6ETLWdGue7qDJMJzd8YZxlS/YVl6ny29f9l0Eb3WZZoyTxmYMbXO8FrRsRVJt6vsFdl1orOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7879.namprd11.prod.outlook.com (2603:10b6:8:f7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 17:20:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 17:20:57 +0000
Date: Thu, 3 Apr 2025 12:20:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>, Boris Brezillon
 <boris.brezillon@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
Subject: Re: [PATCH v1] drm/shmem-helper: Fix unsetting shmem vaddr while
 vmap refcount > 0
Message-ID: <fwlzp4ib66lqb5c4y2ifcqqrzoxpc3dcetsrhqn4smedbmlwxd@oiu3xuj7ql7x>
References: <20250403142633.484660-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250403142633.484660-1-dmitry.osipenko@collabora.com>
X-ClientProxiedBy: MW2PR2101CA0025.namprd21.prod.outlook.com
 (2603:10b6:302:1::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe26045-6e17-422a-2c86-08dd72d3e586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mde+Gz7wu44F568Qu2NbM/qiI0zsuU7u0kCdKDfbCC4IezjY61/qbAXHYEiV?=
 =?us-ascii?Q?6VrPwN/2bfAE6yWcRyZ37j7qWasiDV0Qd/hjYty6X0+Yjc07JSpSWKzIFVhO?=
 =?us-ascii?Q?BaIlLZdKe/kDqoHhiiknJtuKaFtxnVPD/yc3EYFSsMRunvjNMfyNyMB9q0ir?=
 =?us-ascii?Q?6q7NTClYguh+VH9AH0egHFTdos8uwMjKtBsXczLAgybGJzk8G1cioF0S8RrO?=
 =?us-ascii?Q?Q3CbB1aQqfjtRze5xMdemXEasJ+R3nIcOpAZHXRJpVCOBOUHCAOi4sMDbIw6?=
 =?us-ascii?Q?EpHnQnEhEnopENaoINJKowMvBHGUOw3GMkK4ZWegIt7EO1wvJJCNq0NoZ6n8?=
 =?us-ascii?Q?ALV+BdIP1pwqMyreVfFfNp5OYxp0FBUYQvS+hU1mmzk7yNw+GrTap5XH1IVG?=
 =?us-ascii?Q?CgEbGVPxSRcT/lUHR7cMZJS4CQHeeIJ/whd3a2m6n7vKkJp26DczUwOKcxb9?=
 =?us-ascii?Q?OYLmRcstPqSj20jJahiluEeIv01o3K/Zp8VINqBJ79gj037q8wlpxRCIrzhB?=
 =?us-ascii?Q?Lnua30st7BKyp1awaiTbFQao0bk37ZI2CwujQ99QslfNi4BUg+WST1r011AL?=
 =?us-ascii?Q?MaDum2mn1Zve4RCv8KpkUSahZhIkmtMvJ51QwHjd8MfUGn6SsBtuiDV71s08?=
 =?us-ascii?Q?R+yhht3ehvVbul7UBmJ0E7WoBQEgj+dlpiXlCMpjSgQQT2ZSZW8/+7BBfqHo?=
 =?us-ascii?Q?CzGSwKvHOXBoh1OeRYGOIWk/vbw49jePOGZ+buDWM1bA+AXhm0ZaMN3qEI2b?=
 =?us-ascii?Q?RZMgvca2v7r7oZLN5V93BVLZDRSQ0+nQ0hjKRujGYIhIYDm9HuQzpz0KH+4g?=
 =?us-ascii?Q?MpiWf574MbqyBEcJPz/7pBVDOG5oAvDnd88jwrD5MxElWp1LN7HuJ6l6LYo7?=
 =?us-ascii?Q?9lUMblG+HyvU95fVydzrmsWZ2QnyEkPzYpItm1PWOVOJAzwHiQu1hLUooPe2?=
 =?us-ascii?Q?W+bMOLeVf36G3UXI4Gm/+W29RIOlW2/svGC0T0IoaP3SMQH4gYsZHbtjDwQ5?=
 =?us-ascii?Q?asg5chYjrrgzUdto5Nh3uLZm4faAF8oumXvKiLoEtoh53o6UtBVZTTOIx87N?=
 =?us-ascii?Q?QWxKzlZqZ+UvB9mKVJOo2c8+RV9Uk3Z+Z9v/Rkf3KcZ8EkGlXW5XoY1eo/pQ?=
 =?us-ascii?Q?UOBDsH4MlwryMWhPtIG/7uBamOibSQqe6dxBVuROTHys622hEAeLdKvJa6g1?=
 =?us-ascii?Q?r8/SxtqeL70qG5gnF6SKsYCKayXZWZBElg6oCgtgjHRMmess1Htv/GgU7iSy?=
 =?us-ascii?Q?7rODPiFCjmcRd+d/E22cbS2bN2D3RDAYoDdmDWcoWu2nJ+gf2lOazastPBpo?=
 =?us-ascii?Q?mjUoyUorTlIQwmHWyye7JHFTA3wNOwdiDV1jbmsTk/fw/Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yIwoxmMOJCSDWvm0JoQCQLXXQNfsvJfVIeIVT34eydmXhy/fkOsRI0+rkY4/?=
 =?us-ascii?Q?njkcMdMi63h7UMySWQeR8AeCYluc/8g+UR99e3Cl/l3mEzgppWRufhBXO0oe?=
 =?us-ascii?Q?2tTAy6hLCGvc/V0RCT7JdZRjuhA6hx1Bd+a8b6nESAZUEIkpoOMimx1udMfU?=
 =?us-ascii?Q?hDtEKbrjt26qTVbSRv2xVSn9rS0prZvCq5yeJGUf0hpVL9eXsKaAVGcbsm6/?=
 =?us-ascii?Q?ut2D+RjgbjbG8BUNr1tq4F65s5O0unSF7oxIDwcAAaTgIsmz3UUrNFdo5TAo?=
 =?us-ascii?Q?BMsJ1+em3fq8dtrdlwpJQUG3EIe6Q+uc8QcnRpI5HBGSHqjtHoyRXHtlom46?=
 =?us-ascii?Q?jWEMqKSEfan0RhOxSiUmYmGJALrgjyFmuvQP6/Jo5KiqCLuaduH1hoywli+m?=
 =?us-ascii?Q?tJNIf/5atX1kJ0ujmD5VOjLueAepQH1Ksfwe54CcyAJRTw3z6fOPKhtJtO9A?=
 =?us-ascii?Q?8CUgyaOkqu4jSeuqthjtlPtWJym5nwaJxtgjwB+yaAHZTczohzb+9eKdlCXQ?=
 =?us-ascii?Q?VEqP+A2oN/vt0/oRZndPG2LugUXv6tegyEeGH6aAkhhoTudbfJunq0pRPxPF?=
 =?us-ascii?Q?Q28zzkwUv3Z4IgJOawwEVrSWJyiJuR994wMlSYesmSRBEujko+Qr1X4mgxwS?=
 =?us-ascii?Q?VgtBTHPIXxfIKIknpVmVKZ/MkUpl67mG5OAovgIAiQsf8Ua0ltT3PrH3xpQT?=
 =?us-ascii?Q?X9vnkLy5rqOd1lOlBJX1pVElEcIE/czcXvJVcUHfruei55n1bpIcE2ssSxpG?=
 =?us-ascii?Q?eJdTKWa4IJSkb6am5nb/8LcTZNR1hQppRDZJoKG8QX1zALB98V6JuVfWClNc?=
 =?us-ascii?Q?7rc5VwpnlgoQ6YiqQKTqch38iAhlhLDpg9CT/7zrphk4z1tl1hUJIHNqBpfG?=
 =?us-ascii?Q?/LesInHlybU8Mfo05wuLsNRCUAMCbimVquhwTnnyPK0loPm5BNSSBC4IBrFj?=
 =?us-ascii?Q?i494BG2bKKFQjT5YmSv2agycxCYdctKxKrpcKJUPQ7LmIatrETNuqk1gV9q9?=
 =?us-ascii?Q?mnu4NEqszu5lHqHf1wo70H+TCnfb+31uuc9idthqT+2AFW6SG/qI52mWrNx/?=
 =?us-ascii?Q?9kVHt72uagrXs+TrZF3iSju/bsAR9kX3ZCmSfAY0Ttw3OEMh6M6xaYhpg6M8?=
 =?us-ascii?Q?x9S3Hy2r6Dog+H07VvNN0jJCh7ozyVOcHBfIEr0N1IXlPPwPPkUjKgSGEq9v?=
 =?us-ascii?Q?M4cH61CPazGx97C+mvWn7OE9UXynTG1LOwMeKmTBNw/3bFFeLtAmt47assoq?=
 =?us-ascii?Q?I/zC9qqU4ULarsEYEiGXlNPj0FofHw8HJemGn5qrddjDoYP9v5LCBVFO8YvP?=
 =?us-ascii?Q?Gq40B0Xvpw48UpZ0j8XPregk3Hpn2W6IR1cwK0KBeE3Ukvzpb0jHW6DMdOAr?=
 =?us-ascii?Q?8h/YhK+uv7Ak/TSbjCcyAiYVW8zeFw3BiLtMXg6EAKcHqTSn6tdngVBpmId0?=
 =?us-ascii?Q?iGugZbHuYJWpfZhoTZ/cJp21OIw+zefyS+p85sF4we4WVVZJfkLLTXXcYQMN?=
 =?us-ascii?Q?DYNA4b/kT2w4aefLfpn5rhEIoeiehNKbD0AlqdwfrkILw5jY58LLvhCBKfiE?=
 =?us-ascii?Q?YUmSyJxu/8dxdQ0dKALATzo5gWvcKg6GGKSOl05uP2stpPe3h4GJiG77cjvd?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe26045-6e17-422a-2c86-08dd72d3e586
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:20:57.2479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cEpQpPFbHD3ZTz5mOhBw8GBx1hQ7FAahFuPOS1zkIpVLcrr6y39GjvYppNG7T4am4QTrOBNvcS5NXcjHFvOXnJylmpVzi8O0V3ArolyJt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7879
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

On Thu, Apr 03, 2025 at 05:26:33PM +0300, Dmitry Osipenko wrote:
>We switched to use refcount_t for vmaps and missed to change the vunmap
>code to properly unset the vmap pointer, which is now cleared while vmap's
>refcount > 0. Clear the cached vmap pointer only when refcounting drops to
>zero to fix the bug.
>
>Fixes: e1fc39a92332 ("drm/shmem-helper: Use refcount_t for vmap_use_count")
>Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Closes: https://lore.kernel.org/dri-devel/20250403105053.788b0f6e@collabora.com/T/#m3dca6d81bedc8d6146a56b82694624fbc6fa4c96
>Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>


Tested-by: Lucas De Marchi <lucas.demarchi@intel.com>

this fixes it for me when using `qemu ... -device cirrus-vga`

thanks
Lucas De Marchi
