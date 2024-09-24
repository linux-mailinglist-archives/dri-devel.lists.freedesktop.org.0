Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EF0983B0F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 04:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E1610E070;
	Tue, 24 Sep 2024 02:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWmVKXqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D99110E070;
 Tue, 24 Sep 2024 02:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727143415; x=1758679415;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yexuQsp96g2CpiANya3nZOgUXld2QqodN1q6AbUjDTg=;
 b=JWmVKXqFdc0c5JFwZOLM8hEhIzcIUcLvJyUXutwkRPe32KwRGt3v/lYe
 9WWJ3/uZZRmIepg652DUFW94TDbCoWfNk2H54ty7yDJ+j+6uLPiGUYWD8
 CM6ezAV7ZlIDoQ2uwAVSSne20ZowB3/RPQNCM1PbUtfKF4xOJ4AuJziTH
 hi3W64YVX/u2UxheOpxc0TBUhlLluG7Euc237jGDnpaMIjlEA+tkAQvyW
 MycYocp0AA3kcHMirQCcN8NHbIntByhBXFNZFDxGZcyMWgqg9LyrIe5qP
 P6JhAyysL+78LCx9KOUN8BlPanW6pVhVSIZinZqHjq69d6F+AYRpKcPDd w==;
X-CSE-ConnectionGUID: 0G9eRyHJRTOxskHWuI7EfA==
X-CSE-MsgGUID: PpJmbapoQ2CEJJnAqt2HJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36704240"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="36704240"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 19:03:34 -0700
X-CSE-ConnectionGUID: cyiJbnmmRoKqSvJjOs1u1Q==
X-CSE-MsgGUID: ajidmOn2QG2GQ6m6kSa3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="71693880"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 19:03:34 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 19:03:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 19:03:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 19:03:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 19:02:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBcN6smHSkeoR5TzT/kybHGJ2WCQFRvuA8yy2PimgE/zW2itnSwytjSqXDz5Zqr3i5EtscoteuaUiBW9dYzYZxYyI6hNCQ04pKlE5xejno43eBmUK2FRFXV9aFoTZux+Oo+eSu7/qBhfLsVer9P3Sj5N5RPeHzIBjT2161FHwvmTGjv3o9gozWNCMt5dV8ZD9p/aExwBhnYrCQMW78ojZOSdxQNQzpsERSNPlvdCxNdYObJKPpmj6WHZuaAi1vIIwxyDKOAvVKIIGeouOwiEpQ7mFxbmgnw6J/4X9zITGb4YndAWN91nH0tBLhgOYmxVzPy5BJAzcPp1CacjSoIPOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3sKp5oiYn6A0a87TBApti1bq9JViwrAD/MBT7afT5o=;
 b=ZbkgXd3kYEUdXg5VnCn+dA3V/3dX7XBN3LkL3t8fYMxNwXeYXjxsfIANHe5jjcR3puMNB9EfcBLuDubSJ+OyuoCnDhYwkrGNzaUV0MgSqAeyyr1EcQVylFjwzGPDYHXqBBI7NKxIXERZzC4ZZcn24djvaFdkGcB8hFhDUwNEO1yBXaQW9691oEEU149wlJbsaKkUjgGAypS/OSnhDu51VoeyykQyQjbkGv4tgAeSwpr0162L44gujXE9RwzxlJnmWQlNrJMEYT0r2iolK6qXDaj3GFrmCW3zWZ2IFyyIBCU1+4wFILbDixocgs/h2DRAUH1hUgure5e2pCdeizDPpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4846.namprd11.prod.outlook.com (2603:10b6:a03:2d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 02:02:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 02:02:51 +0000
Date: Tue, 24 Sep 2024 02:00:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map
 operation
Message-ID: <ZvIdVfaPSq8arN6J@DUT025-TGLU.fm.intel.com>
References: <20240918164740.3955915-1-oak.zeng@intel.com>
 <ZuseA6s2nip+PbTC@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB315944FFB3DE254952FE298592632@BYAPR11MB3159.namprd11.prod.outlook.com>
 <cbf61ca5-870f-4617-839f-3e7a66fe7f1a@kernel.org>
 <BYAPR11MB3159CA7CBC2C4F53EFA8C046926F2@BYAPR11MB3159.namprd11.prod.outlook.com>
 <ZvH8qyiMe9CzqkLm@pollux.localdomain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZvH8qyiMe9CzqkLm@pollux.localdomain>
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4846:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f7bad3-c057-4703-3c1e-08dcdc3cfefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NrQVY67uUn1ahznFA3MvIuXqUCqIk/8gQyA8qWTxsCQxtNKa0vxcL6/fgbKO?=
 =?us-ascii?Q?2+R3uQddvJoz2PH4pODGq0iejxDPNqJsJG8gBfBLun7Vq/9nJ2Hng8QU1d4w?=
 =?us-ascii?Q?RCtlcp5YR/Z67LFLla2yXByZK4DwwSIZ8t2JXs5Ged1qCIsKQjHcCfvK01hF?=
 =?us-ascii?Q?v1m0NSW2TSuK7e22hLxscPDrPk+DjC41xT7pwIP1+gTrLsSKyseJQxIOC+5V?=
 =?us-ascii?Q?FH4j6Q7tCVuMlhS3AhtetntX3NhhfVHgkx4uvzidFSM3vR4Vj2Hms0bdJPAn?=
 =?us-ascii?Q?ddKq3b6sHEVGc4FiDUjeFppsG96B4SJed/gOZGFol6iJynf/HyW/2wWZYQSo?=
 =?us-ascii?Q?xRjEDuWD9TUXif8F2n4NxF8/AwRaNyeKDNUmBdnTnfhxSh4esdy3VPdmaXdU?=
 =?us-ascii?Q?PCWQLpS0MSAELvvV73sJJYe6MJmHD6xrwGFEKD3KRey6ScHFutPcee555uU7?=
 =?us-ascii?Q?irrP6ewZ151/gvHLdTnyHtbChygihPrki6EmPYs3RwzIDLL9Q6asQZZQKpY3?=
 =?us-ascii?Q?cjLsY3ul7naE+aDp2pD+WihVcSWJPIYRHzUHJpEvHNaRejL5bNeUhMJTGZ3k?=
 =?us-ascii?Q?J5wmC0XuyftAJhP9fGBLiqOHPs796zXz5xunO2TTWQwqUuTXPmu7moAwRXIA?=
 =?us-ascii?Q?Ny9WXwCD6+5Ax6wR8MCUEmT+OblVoYksiM9RCw02Gpot1MOlV9poNowLvf2z?=
 =?us-ascii?Q?iSu1+7QgTvO/LfyK8S3eLpaRCiBNBXQ8JTfTYXpoX4rrrHiq4tNWbGzXs6AA?=
 =?us-ascii?Q?OGDfbCYrkkPoJiSIsa/e6vIrtd26+ozlQ7qI0StabQwi4cbImDHV8g07aOtK?=
 =?us-ascii?Q?0rvlIkoCIQT95wRjs7GGueqcIvgqKv3bI0bKhj53IB9W9xQtIZQEcUHXCrl7?=
 =?us-ascii?Q?7kSwq2kBwh2JjdzhUiAQ8rv11iH1dnrmwd5Br7io4PdNhNpjaLg2ZjrAcjzh?=
 =?us-ascii?Q?NNowe8Udperj92UydZoCqoZhtXWVz6GxKnNxehK1SFtnowV/TYl9dMces9tO?=
 =?us-ascii?Q?HeWVCm/U4o0seZ3PTg1PTYnT6B90vWvFgMpa68IFkay2Zy3q7G80jDULLsGL?=
 =?us-ascii?Q?owrpuLCy4dCZsMspzZPouREXUjp9X5Fdk2X6UzCQMabfvotfM7Q9xJ12rudl?=
 =?us-ascii?Q?DdC9C8KdsN2KSJTLr2p9qgv1xSW0SD93l7QQ3Q43UR2WU3a22Xk9uONei9HU?=
 =?us-ascii?Q?KALoAzEHYo+TWbdzYw8EyyfHbR/GNGowcYiaR944IW1afR8n9TDyi734YC4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/vsT3J7oSlcE3RyzUXv2yYexHZwphuBBphcpEJIfQctd5Ru6aUAewYyPNEEx?=
 =?us-ascii?Q?sdj4SOlLgpwfryT06nZr4qOzjBNbLqjCSqaAVF12TADayMUmlxW84G0ZBxVD?=
 =?us-ascii?Q?g6AneSq1rdFQ6iFS8mLh4SxbMYZRA3k0naUWxpulhuI3xL7g4kwXSXP8MDh9?=
 =?us-ascii?Q?r6w5SlbnTyivZQakNmJxlOCEjfdkjPiZiiWsA4nJa0qyUQrX9mDEy/sVF33g?=
 =?us-ascii?Q?FyI29ehV826jjaemoqSUO8hqKFXu+WSSleKNIl9cPfjdCO+5ua7IajGyv5cn?=
 =?us-ascii?Q?sHacylO/T56kqmtQL3Ok8szL/mLrveDEKgYPKhMOEO/KuJqngIlaWNd31R+M?=
 =?us-ascii?Q?9IMIBoovS8+X/qqBhqSgIEQaJc1TbqZCu2keQuYXwZkTQ91UM1SVE1ZUhH0N?=
 =?us-ascii?Q?3qeRQHhlvTmu9xRCLkZHMKJQmbYW5ePW1ngRKinhLsAK/Jw4FfTQjFlcjZ7j?=
 =?us-ascii?Q?O8eNN1XdnUitUUPuMyEWyH/fUppEPYelaIJ8Rv6TC0H+pUxP5ITM1rx0kHrf?=
 =?us-ascii?Q?fTaGkASnd8MSN02DGVv3KPDQeiHJhmeYFGU8eCrtXcCfeSMYkqJ5Z/m5gT4E?=
 =?us-ascii?Q?wQpm2xOe03zLQOKbQbpPhQD8V2BOeKnPogqJFvtX5poOE/xYAyw1R2is3Q5G?=
 =?us-ascii?Q?s+UA2m77TRhW0nFwsE9z9JMI2wE5XCgn3ujdJhkW6nyL4zVLZlqNcEYKtzKa?=
 =?us-ascii?Q?HvDLSb4d78bILUIRDiZs0rW0SI5gAwXfBDa/EjgPi3wPsw+UHpAn8uWzPQ7a?=
 =?us-ascii?Q?mhxe4L5z350n5mrp9xp0Wm9fZQB+foaTVWx4Ayxw6UQQJCttcxXVszenE87f?=
 =?us-ascii?Q?gdRafHuiA9FTnUakJMtxoFMnaricbuPnXqZTznd/+D8/yD8qvyA0z5MVi4aA?=
 =?us-ascii?Q?AxS4cFKbWeKF34DZYhOvpWUaMke58ft9Ok4/Nwot3rrNtiYTjAjI0R5rASda?=
 =?us-ascii?Q?epFax8bQI9UXbtjkenZrgAL1LYDzLlYiNnnDUfK9uT3nmQfp2/ypK4IxBez3?=
 =?us-ascii?Q?vndymYC0Cz9/Ha6rpecKiaGtR+i0cfZFEpM3PMT3PIzzcdFj01SHnrdfaTCi?=
 =?us-ascii?Q?W6MsQHdDkW0J+iKI/nfgzibwjxap+Hfix1dx0X5XJS1lpRy7qSD5BQYcCiQK?=
 =?us-ascii?Q?ZHd7d3xH2OgCdqNV7YReoEWVmyDKfWAlah5Hgv3e94GFeJyNAZ8LJR9Xjkny?=
 =?us-ascii?Q?TWpYGGS0CmAnYy4EqALNG0yxMop6XCSjt+8d2aNIBJrE9coExeHxpEwCKG3A?=
 =?us-ascii?Q?UywRzMCNrq4M9kh6MeSh0LHz2a+xQciZvw/M4jI2KlpwQ7bNFsLCNe99pbAe?=
 =?us-ascii?Q?g0imomVAMDM85e5pIltIH+CKzjrvByIKZMpiVYjQ4W01UagMLFmaUQY6xI7p?=
 =?us-ascii?Q?Iqk4J1suEG2uoqiHjFBF7CjleZsSDk3OHklZZxZ5Fjgr4qnmNFhNyBPbPiS0?=
 =?us-ascii?Q?s1COqWqbZGRcRFM6dRe2NhgbUZ0XDwP3T3numfyp/C67LpuPA9Cfort814YY?=
 =?us-ascii?Q?Nx8szzMsiyKOjdmjhN+/yRQq1SA1LvCNgG/r7HQDkE9BJszz0AcuVeMInTcJ?=
 =?us-ascii?Q?1cBTpG71mOqU5dYjCJPtP7W5CdY6tzpZvyHxqtoHH0kV0fFLQoTp1c1L8M8P?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f7bad3-c057-4703-3c1e-08dcdc3cfefe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 02:02:51.5287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cN0ip71xGamIWrw3qgEsLRxPJV7UBBCjvGV0eEtsLueTIUvdnrgbJHqpQs+uZwGnEBzjv7PLYiNRwJbc9EnkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
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

On Tue, Sep 24, 2024 at 01:41:31AM +0200, Danilo Krummrich wrote:
> (adding dri-devel)
> 
> On Mon, Sep 23, 2024 at 02:24:02PM +0000, Zeng, Oak wrote:
> > > > This patch is an old one in my back log. I roughly remember I ran into
> > > a situation where there were two duplicated VMAs covering
> > > > Same virtual address range are kept in gpuvm's RB-tree. One VMA
> > > was actually already destroyed. This further caused issues as
> > > > The destroyed VMA was found during a GPUVM RB-tree walk. This
> > > triggered me to look into the gpuvm merge split logic and end
> > > > Up with this patch. This patch did fix that issue.
> > > 
> > > That would indeed be a big issue. As Matt suggests, is there a
> > > reproducer?
> > > 
> > > Either way, adding merge support can't be the fix for this, we need a
> > > separate
> > > one, that's back-portable.
> > > 
> > 
> > The discussion went on when you were away. See https://patchwork.freedesktop.org/patch/614941/?series=138835&rev=1
> 
> Yes, I'm aware. But I don't see how this is related to what I said above?
> 
> > 
> > Matt and me agreed to implement a merge logic in gpuvm, but gpuvm need to check a driver cookie/callback to decide merge or not.
> > We reached this conclusion based on some requirement from system allocator design. See more details in above link.
> > 
> > Can you take a look and let us know whether you agree?
> 
> Generally, I'm fine with that, one of my early versions of GPUVM had this. But I
> dropped it because I don't saw an immediate benefit.
> 
> From my old change log:
> 
>     "Remove merging of GPUVAs; the kernel has limited to none knowlege about
>     the semantics of mapping sequences. Hence, merging is purely speculative.
>     It seems that gaining a significant (or at least a measurable) performance
>     increase through merging is way more likely to happen when userspace is
>     responsible for merging mappings up to the next larger page size if
>     possible."
> 
> If the pure number of GPUVA structures is a concern though, I think it's fair to
> add it. So, feel to send a patch.
> 
> It's probably also a good idea to double check with my old merge implementation
> [1]. It's pretty easy to get this wrong. I'm not saying I got it right, but if
> we both ended up with the same logic, it's a good indicator. :)
> 
> However, this should *not* be a solution for an existing bug. Above you mention
> a bug related to "duplicated VMAs covering the same virtual address range". This
> is unrelated and must be fixed separately. Do you have a way to reproduce this?
> 

I 100% agree with Daniele that if this bug, merging is not the solution.
Merging is additional, optional, feature not a bug fix.

AFIAK there is not a bug here as our CI or mesa would likely report a
memory bug. A reproducer for this would be good if this exists.

Matt

> [1] https://lore.kernel.org/dri-devel/20230217134422.14116-6-dakr@redhat.com/
> 
> > 
> > > Also, can we move this on DRI-devel please?
> > 
> > Yes will do.
> > 
> > Oak
