Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A897A81D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 22:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066B010E3D8;
	Mon, 16 Sep 2024 20:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbZG4EE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F20D10E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 20:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726517359; x=1758053359;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZmweyN7sEe7y0UOgkCnbJrYkWfAp26btl2sXJWJjaAY=;
 b=CbZG4EE4lIZncenJLLBxCBc0+t0iedWvI4QVd9So3oIIJYyhLuNM4kcJ
 8KigcE/ULtuwk6YKh38ttzsX0U+HGerMfvE4kM+gUXkBUu1iPPH2WP5+3
 XfMC84Kh/sHp6JDPOGmCPXqqBB0No80/GaOHxmxF7MeE9L+S6LzUpV1HX
 6mjhSCQYwGOCQANP1dDS+V32656xg0rw4FU95eS821LdDxPYyWUekIYhE
 JnVfklgBC5dPIR15Xtj2NkoiwvbLLYVnA+R0xhfrugaUxUw+hhqyj+a3Z
 /lMDF/eAsnpm4LD1H7Z8AKHKdnvUynSVDvx92eBCDVcFc+cxZ2DkbZxfY Q==;
X-CSE-ConnectionGUID: B9cAD6DsTqCfrMkKxJi27w==
X-CSE-MsgGUID: DtECDrkdThGNM1ii+YaKtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36738251"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36738251"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 13:09:19 -0700
X-CSE-ConnectionGUID: nKMljjJ9TkCDpXDKze/Cmg==
X-CSE-MsgGUID: HP2tXxO4ROe/nVY20IX7Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="73328872"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 13:09:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 13:09:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 13:09:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 13:09:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 13:09:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVW6FwG4e665wb85mcC2r/7PL7lh8op6elbKlgGStMVRyTuFrYwHJlahn/xIVTi36A4SxjXVS5YBeVnDjMx3BbzYfcEjvW2q6OvI0eRuQZJo6u3k/4nzAXTBZKRrkL5omnz56VsQzEhTr9/LeQ4k0bvWthPoVoOXpt22MRAM5ZEWNMaNrqc28+/3mb3684MI73gm8j1hDOOVZ6r4gHoHNakPh4/NNAfhrB2n+YPBCXDWPURSYtH+kGmls/r1LFqNHobMUVHKKJ84a1OP4sGFGAbfEJeOTylFqDrZBQspSyx2qdeMPaaTUBijDoDpq2vXa/uOCxSM10Nwupm0vz3nbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cBDlJx4KsJxZ33z2e8ESbGS31CW3DLhB3F7PtQASyo=;
 b=vt+WcXu5xS2xjF1kvBk16N7RTM2OD5VLteNf0ur44seNaQQWwlLlqNjvNy3k89BfQ3p7fmXt6AO9klgo1a/gJVofGKIBXzqLCm/+Td5NmzN62ZDDlI/p6KKoSFe2enByaiwiXaxAK1OAjx35TfdSbvERh0NPtDUNdfpVQ2BIcn5mv6Eb97JnXExZl9lClrVxBe0IZEjrSEaCOUOHtJCOMCn2e/20zYNyjrqq9Anh45NRHdWIJrbjfzHhjRtFt2NYmbG1N0kfGbBPoSH4UDC+rtPU5PpzrC+BZLxy+PpeIn0N9DSQfEORlCETdvfPFJAsgO0pgVCSDXJkke5VNrTNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6792.namprd11.prod.outlook.com (2603:10b6:a03:485::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 20:09:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 20:09:15 +0000
Date: Mon, 16 Sep 2024 20:07:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH] MAINTAINERS: drm/sched: Add new maintainers
Message-ID: <ZuiP/4AzCNnoaDZ/@DUT025-TGLU.fm.intel.com>
References: <20240916185159.35727-3-pstanner@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240916185159.35727-3-pstanner@redhat.com>
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: d32de636-8c8a-48e5-bb53-08dcd68b64e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8kydfaBwfDtdIpwHP4Xj2eAYmJhdhDvHXoqBi7j/oj79BvLPOKbwM/lWKz?=
 =?iso-8859-1?Q?Wb9Kb07Px+zV1qpd4pQzpO4GHO0LKp3SX2bwRaQCSVH+EYd1talh+oAvOb?=
 =?iso-8859-1?Q?2gsFwTlgTTEG69ZMJzO8OdCYKV9rk2ctGd1WAHFQmh5zwpP36WXP5XnWKt?=
 =?iso-8859-1?Q?fWQVktPwuLMdd5fpUQYbXW5o67Fd9WVXMWfcHigO5sdCRLrv9mLKoe9C59?=
 =?iso-8859-1?Q?/oHxwZlloIWD8uJcl8U5/h1iu1Wj4w/TAc2cg1H/+MrxxqFIIhGTKkG8O1?=
 =?iso-8859-1?Q?HzgVL7jAQzu07ShyMoEcexMcn/LTrY3OVE+/DN0Z4sMQ2HO/IpcweBrjxZ?=
 =?iso-8859-1?Q?RumYFunTU/vJTxgaBTglwoJxaoIUVuoluFRQFbhrIfNH4DLryjMNYsCve2?=
 =?iso-8859-1?Q?X4kkqBDjGNkl32enb/+r+nAgEWe/sOw7l+26g0APUTiiK7itFHHhkxUG1u?=
 =?iso-8859-1?Q?S7rCfSMA0r+8CRQVf+PGJviHl3TX4l1vrEtiOncO2eVTcan7Th8H0Oso8V?=
 =?iso-8859-1?Q?0x9kLCYpvPXZiJm5BxOjbYZyuNLFwfdJFeG2ghVs5qqRhHyPd2+E2cdCau?=
 =?iso-8859-1?Q?98LZ5bOFqDtMfsMsA5Jb4D+kLypvl2vw3tgydxtOplXgXojIkzoR044s9L?=
 =?iso-8859-1?Q?FB+H2GwxhO3o+/qo4zscEGYWqle8aTiDbm95se5G/tVl+SBmQS8ObPt/Ed?=
 =?iso-8859-1?Q?fts5k6UMneKERDFZfsZU0Y5S0SxWhyTphhnANXoEKqqkOc7K707Sdt7EBw?=
 =?iso-8859-1?Q?T4fPM+0AULompItYUNs3jp57HYe/2oQI09uuHB17Xbx3ZRFRY00TdKO5j2?=
 =?iso-8859-1?Q?MeTfDgD3KKi+U7iEapF6E7prqw6EcenRSMOQbpFgStLBjhEEP5IVvsD9/Y?=
 =?iso-8859-1?Q?N137e9OLU26FmMtEAtSIwvCxjC+UY1lHycXpbxuIQXRdZA7oadvWiaJId4?=
 =?iso-8859-1?Q?TGPP0JF/BCM5B6S0cACriKsB4E4mcAsLGev4rfovHNcBJRfQbq99SnSwuX?=
 =?iso-8859-1?Q?ICQKCGiwPZYuV6YArxVAXnGLyl8l6eGSqNBpc7eli6Jv1IxjVCfUeA8sLm?=
 =?iso-8859-1?Q?CzZdHUGFSwVwMb+VLNYgHSMWz1Z43Tnhxbk65Au+duqMlXNHL79pYxrXnI?=
 =?iso-8859-1?Q?pTjFAD5R1PpgeNuQD3sQ/a7HlVZ3p+QTCbm4fa95qMChNu1/cLpDaZyDeH?=
 =?iso-8859-1?Q?VKh++Y+GXrvqT4lj7GJ11nR5UkXUkxH7CkZJryMBa4tUSqLl+MUncZ/Wh0?=
 =?iso-8859-1?Q?Tzkh2QiVcBeGkCiyxpKA7lnNeH5XbNuB1KeSc8o4lKV/V9Ad4F9yIQfFmx?=
 =?iso-8859-1?Q?OyDBEdXktzDvvAmzikQykpE5OFEzggtNXlH/Pehw6vbIxc4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GgmPnUMXJ4CMK2IQGQ/pdQ9kyGlJvHVXyfngfXQriqEQXLYYylT82NqRtL?=
 =?iso-8859-1?Q?lmweO8sLYA6/XNQS3jsw4wXRf4ZN/dGzh45aKBK3YfAnMPZQCLeoG9boE7?=
 =?iso-8859-1?Q?D7MRrA3stqFcahI1Td6HFk/5VUgbaRjd2SbAy+ZIKkZssTuCgSCrivZ259?=
 =?iso-8859-1?Q?8U0lqVglDPiHKpllyIUIrGXeTvEEsH4R2Kp0JfWlpit+E8whNoKFbJfyiB?=
 =?iso-8859-1?Q?fx4MPmyXBuPk/LDbU/zBnHZOnySm8cADWLiVVZjHse+GeJTzmHfgpO/ojg?=
 =?iso-8859-1?Q?VQJHIjabkTCuWwHnPKSvBboHav4OXf1YGl/w6XKaSh4Dy4tNLJdaGva/c/?=
 =?iso-8859-1?Q?ej5qbTwpboM5A8qIz29mLBQPFcjQch6bZ7ZBCPyT0HFHe+PupRknQg7bcW?=
 =?iso-8859-1?Q?6TvPUTkp7xmk4rJHLgohUZfL3y12orzl7Rf8KB8BEA6BKIvn4iCGAqwv3L?=
 =?iso-8859-1?Q?FrXe3aGUAUXcPwZTxj7vadPHd+hYvgF9cw9ceLiX8nraz3EzI60IqhIItR?=
 =?iso-8859-1?Q?ZIntW8AJlYf4kafUK2wkKU69Jd7O+vZH/+AWUqu4PV1ov6IlUY48MrKPXl?=
 =?iso-8859-1?Q?MTvWryvBMGFMZw8fvMKQV+FGY+b4ufR7M2k8oiz4XgZ7rrbpeRzVV+u3us?=
 =?iso-8859-1?Q?IHFvHp3N8MJW8xyJY+16bkLmhuLY2EywaMJ/HBNsT3WXZJLvpJMy0lExVE?=
 =?iso-8859-1?Q?1FhZzDXGio2Ogx4oEwKDi5W52BGWS3bgx7tVJbBzbfM5VgayPbKd1PA2G8?=
 =?iso-8859-1?Q?cS0T69Ld5eIB8s2R/oX29ZG/fT4m2JRVqQhmdQL4AzTeoqO7maLaOsTVnU?=
 =?iso-8859-1?Q?DTUSxyP7YLpJd1FFR3DMrQHge7vLxgA7nV3bjON85nb2xAMYYnsKFwLgC9?=
 =?iso-8859-1?Q?hgBZrXfqHKVdzOSSzcdGYqIxB22umnBGBaXgkfcrf/ygIwlsVFglX/pLUC?=
 =?iso-8859-1?Q?vTYQm2BDD2aBAO1VamJNfygmiGlXMFlCVhOCQMynKumdfEtSA/72AESDDq?=
 =?iso-8859-1?Q?s+zKtMxOOg9wFKmi9KLLBa+jDscVNLj1VYcpsKqWnBrs/ojr1iK8Q/mXIT?=
 =?iso-8859-1?Q?SMA90ZMyHT0B6UY90LmMlsAVVn1ibESUkbFEhYmDaeL4k8g7hQuipB+rme?=
 =?iso-8859-1?Q?IMy4OO++GySxulmj/kZNIPQTkI4ldtrUiyPHcbU2R89WWftnuOhZtEq+Z+?=
 =?iso-8859-1?Q?vhXxJ/Apq8thJ07H96LD+mbdDfuC1GWeKgdkcqtJnylOyrfDp2aNoef+oC?=
 =?iso-8859-1?Q?k9GXkpYytZ45oMqFZpJIXl/vcnqx3J0SaNDgXOAzpW+EmzZNYqWN2pJRja?=
 =?iso-8859-1?Q?mP21IIK1Ks+JQkuvSJxSsvTFAmtCt1vu6nnV+Y+ypN+wZ2/uqC5r3EFxFh?=
 =?iso-8859-1?Q?uPxTJi5fUy92F78BBQgtEaRr9EjqusNi5XtYoYoN8wepMx78uMgNYmRhN2?=
 =?iso-8859-1?Q?zNjPC3rhtq0Ql+Ef2jTPmXVITFdGw9IfY8VnPHMUocKHfxsHJ/7yDLBTAQ?=
 =?iso-8859-1?Q?rKtFWiNdjinw1BrWWFoWbZIwfLapOAqMk1afBepwUNu12x+k306Ztuqckr?=
 =?iso-8859-1?Q?Zc7UQ9q55VEuw53W3g1GgshVZ71hChYFdmVtnnsfCm5cxrzXZoWOnUkv6y?=
 =?iso-8859-1?Q?wv0EtLtjzBLKoJoPwYj1qzwDH19t8ZRl6bi0mo8Ve5lwkMhbDyeBN+YQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d32de636-8c8a-48e5-bb53-08dcd68b64e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 20:08:56.2236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yWD6pZVr7cBx4vwRjob47ferNNFMwHb+ouM2+ih5bcflPGOohHH1KwEZXcFLSzkA/uhfXWzNUvhBfQJqGEUMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6792
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

On Mon, Sep 16, 2024 at 08:52:00PM +0200, Philipp Stanner wrote:
> DRM's GPU scheduler is arguably in need of more intensive maintenance.
> Danilo and Philipp volunteer to help with the maintainership.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 

Acked-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10430778c998..fc2d8bf3ee74 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7710,6 +7710,8 @@ F:	drivers/gpu/drm/xlnx/
>  DRM GPU SCHEDULER
>  M:	Luben Tuikov <ltuikov89@gmail.com>
>  M:	Matthew Brost <matthew.brost@intel.com>
> +M:	Danilo Krummrich <dakr@kernel.org>
> +M:	Philipp Stanner <pstanner@redhat.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -- 
> 2.46.0
> 
