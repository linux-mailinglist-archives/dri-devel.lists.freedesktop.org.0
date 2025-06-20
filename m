Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0031AE1C99
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 15:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D810210EB6B;
	Fri, 20 Jun 2025 13:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPB1F17G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DF710EB6B;
 Fri, 20 Jun 2025 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750427394; x=1781963394;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HKLpnE1JWhr5Q0eyeX+yLaujW77zkAnV42GC6yrhyv8=;
 b=SPB1F17GzMFOl9/Ik+aJ2WFf/rcU6Dajf1jQZiMaABrq/Zbryh/6fL7q
 O/nxume2ZZsdpP8IrBnsRtVnHHbKiCg/Ka/DTDLdIGU+X9O8uIzgz0tSU
 7JhUIHCpcmqyUFxroNJpEM0m4IsyYR//D1S9ZTqVVXbVBpIMyLKMCxZlq
 LdWSJgSDoVyw2alkiU6Mh0EyiqZI/W69dS7TeSKukNFpSX4EPvmtjlnqo
 YTbK+09qFQzALyWUhe2SIyiPUfi1q3zgtWZHqGuja6xOmsoi7rFrkgFN/
 BX75fhofUQoml4SFBLAiTy7BIr1N4ukZ2DZPOKTKwOSyGmeiUw7UuSFly g==;
X-CSE-ConnectionGUID: y/xfKlRiQqSBUxRQEBySuQ==
X-CSE-MsgGUID: 4u8W1qKyQOORjPcQ1KHO9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63743220"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="63743220"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 06:49:53 -0700
X-CSE-ConnectionGUID: EJDtXL7QSDux9olxhPTM7Q==
X-CSE-MsgGUID: KE8KNJ4pRvK77WV4sS43/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="151469875"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 06:49:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 06:49:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 06:49:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 06:49:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBGZyzU+cTCHf3sxHiqLsxFkJT+QT8p4pOExnA0Nix4qDJqsnd3pqLMfgWckn7BoBTE3U2OfcY69h4D6G1DG7qygKX+0ipLRX4qvnmnTXCuXd4okvr8lWitzRMkqVWowC+Nv8TbHXJ5apgIXdbQ+/LsthIcjWDlH37pAv2cxgL1GOKTBh80FxoyWOy8gIoNZ8Nd3oQtPlr815eYmI6afPR5roK/rY1EkHPOKA7fIBemhaHylh9pq+Gx6FRzV4xJPsqeRwsMoVJ+w0OcdixdOjYTklJEZdwZtnXQL+t4UpwC2y4pWNEtdYG9EAvtagWBnaq9TSywKhCO6RoXT1sbY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4HI36QnJKKW516YzMHvNQUrVH8CHHV6MNiONE6ASyo=;
 b=E/mZ6/yNkDjyWM7SOdseCSVweMpqfVhu4pHOsym2b8ZgB1Rlp8icT6s7zsgB0AjycnApXzB2qumkSzx281934d2R3YN71ivkzmUjdgH6IR+DfLsSiuIfMma5apZSLopZJZq7ke+ja/eq91khqPTUiskT4dpLkT5lSjWGG4vcmCZlk1ej6VlcQPRW2qQP251dPVZuNNrEYxh5jnyKNsA4v46VFcm8UL+7NjQgmC1ktaE9vpr5tDzFoGStbQHnVnX1Swv8CptPa40B2T80p52Ue9yAGsvr/a008vuSKHzVp+6705RB2Iqxx3f8Wvb+QV/Gtp6ncZHy3VwEv/6Fs8lmoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 13:49:51 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 13:49:51 +0000
Date: Fri, 20 Jun 2025 09:49:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>, <jgg@nvidia.com>
Subject: Re: [PATCH v3 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 in S2Idle/S3 resume
Message-ID: <aFVm-lidsDMMDSit@intel.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-8-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250618190007.2932322-8-badal.nilawar@intel.com>
X-ClientProxiedBy: BYAPR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:a03:54::48) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e673e16-3959-4bb9-b70a-08ddb0015415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9cydJ6qJ8bXV+p9clrZkS6bKYHPImaSNVAgI8V/q8K7wAk232zjiS1RkW0lN?=
 =?us-ascii?Q?R1U7rux5VpKYKzNxSHBqFgzeSAf+maIxT1JdSkkMH5cL2LUZkC3n111eCpqD?=
 =?us-ascii?Q?K1zy96mzLMZe7Ukrqn30fbCzgN/kawAZXjPzIXgEJT7iZwLhl3rfihEZoA40?=
 =?us-ascii?Q?Ug1KqFj3CKD7Yxucyng8/hFRL9FcZric+BOqNixZB6nA33awTu7cJTYsKCvf?=
 =?us-ascii?Q?z/eTgI3vliHXRpZ+0TzEX6PHfLD9SCX+me3Y4h0tUahsgpdTrXK2w1mMIb7e?=
 =?us-ascii?Q?nJRvf13OYuxMzQCT1IKpTbgr1Cp1+Mx/L2tu1cYY9eWrV5FBswvwVAPLW7uf?=
 =?us-ascii?Q?ZhGgwSHmkGqzl218fym7jSspX0n/4AN2AmSX7nm1eIYkPQrSCCSajPdpjEX7?=
 =?us-ascii?Q?5Mxf6OPFST5Tfit0eRO32JpIj5BU66Hqeh3pPW/LgGBGc8J1yTcmm+5ndoXh?=
 =?us-ascii?Q?XBsTswFNYk3LTGjq1D6qvLYbJlGCeXGj4GXQB+jeP/GNMHQQFY1IUYboKIuM?=
 =?us-ascii?Q?HID7jwi/t0KYYQgYIYhve2XqmEJSM7unkil7gZsaMr+2sUpDlVwkTJ4yQbMo?=
 =?us-ascii?Q?KmM6HQFHR2ho7CNh/Am9ZpRDWgj3W/RtecXT55CUb0CzTHu4TTV5wOsum1/R?=
 =?us-ascii?Q?t6EJ+BBm9qVrrvSvgwsj3aVW9Osgqe5uVjfIsgrMTroaWLywX0wRUMNZamQV?=
 =?us-ascii?Q?qOVqmhzJGmnNumdNLQoTbwoaqWkk9uth2oQMH1ufV/sRjm24l4vnpffhqzTq?=
 =?us-ascii?Q?kfDYPvTEIE5yJpLwt5UaNtvcsMR3x6TBfSeyb60mfV0dHaaOrQEoFHKgkpPY?=
 =?us-ascii?Q?JuzwOJP/7IMA7A0rmJxkeD1mTHzWqzClQ1Yy6+PXa/kZaSHZKICjwmFGmJNm?=
 =?us-ascii?Q?ZdV4pIXsvBJcz8HpCvQP20M5IA6liuzQUaxgQl72u11FPwF2DMEVgqW/Sxk/?=
 =?us-ascii?Q?qfocnBJiANpNJg8EljNfeMAVWmDZ2r5RGCSTE+f5Qr63zjRVlmwDsvTKfsBN?=
 =?us-ascii?Q?h4+3nXNj0WOHXtkyWMlbc0QRtqQBOmZ+hPL+6u20vcP0afLR43vH1CNrPfNk?=
 =?us-ascii?Q?69dxAOQuh8iiD97y2BOvA2YbQMxmrBYqNoG3V/6naKZ1wigjO9KaQHhzDCuz?=
 =?us-ascii?Q?gqTxF36ZEsYDT/3W62tyFacovmEVD/wp5D+VpX3fLHOILOTx7KRsiLlJ8Ki0?=
 =?us-ascii?Q?Q3nAHQTKDrLC2DZLPTxN+4p6Bdm4yLxyaVPRXEBuaufvVTn2vaw/Rydwp0OH?=
 =?us-ascii?Q?A7qb70buC+MOKzPTrzhhJ1vPEiImOaua9cpRf49UkbRcMfJpQoLRFZ2odOwu?=
 =?us-ascii?Q?qRM+CBI2chsODTiqon+7PVe2f7zXqFKGwzST5Rc6pKSLlhCSVVKHMrzvE4Bi?=
 =?us-ascii?Q?dKq7PRi4SSDLIcAuJ4CVaJtH5ywC8vAIQwz6RCZikAE9VPgS1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ChmemYKp5u9Md1eGfv7Y4fI01wz/40epET49FM38lyzQUQluOOOjMTNWalwL?=
 =?us-ascii?Q?+P3XeKG0sh43uWJ7KcOES+S1pqpnRntHwQO4qma9g19c9j3mgdt1wxLPSkr2?=
 =?us-ascii?Q?UpswfkMGKIs6Pmozvv+4QPuDpuBPDA9DQ9sFmau+/WAYcO+Qx8qh8YOSoRId?=
 =?us-ascii?Q?WwADKVvLj0JcOxK60J9/5AkkHX4dun81fp4gofx0VWCYn+FAQWMR/16gFBmM?=
 =?us-ascii?Q?GzXRYHqIUNCz5A7kQKrUCSkz2csxEn+PHgRM9JBwfdMQecbjBI0PzLoCGc4b?=
 =?us-ascii?Q?mqgb2HYzS2G/OQJpbyDS8t0w9H7Zc3TDdiE72WsnVeFvBCP8ONLRjRM7Teiy?=
 =?us-ascii?Q?0Q/JKTA4MiGmIiH539B/TAKWv9IIQ7RBunzpfj0CxsuXQxbw5RCAph+JexY4?=
 =?us-ascii?Q?oDkf8FxbPKPbWmV5zTOrgG6gC151vE1ZEMYWFMVbQ3YSZ0f538ehQa2VTpRr?=
 =?us-ascii?Q?RatV9cDlJBYUIM4BcwmYvMONMtqvfhTJlfok8213vsuQ3sqH/0TTGruawsIU?=
 =?us-ascii?Q?OYhKnFnCwv4qoc65p0/2uRsXjbyPQJaaMHjdmqTwDdVXWUz4bp/2MQ1cBQal?=
 =?us-ascii?Q?nsdpIlp7mCSoen8I/KKI/WXamZgo+x4SlGn7HnNH9tp9Cr5XZpsS5Zo52VEq?=
 =?us-ascii?Q?eDHukqg8NtfY4FfL0ojPMc2gnKqThx6DNT0csB/x7jE6yBdBPuUGnAzasC/n?=
 =?us-ascii?Q?Jirn8LpqhVW7izcTD25vPlOkOvnIGrTWoVHAkDxIuLMuDVaNCdHKCykebCzb?=
 =?us-ascii?Q?mlG5kV4GfM66CjRmsDGYXY+kRFIMXquCJAXBtQcm2Jd0kX1GnfkQE1eNfZlP?=
 =?us-ascii?Q?fAWaG/6bc6qqTgeFvSsoev/QqRaCFcVG6Dv8lcig085IfzuNrVyXOLRopS+k?=
 =?us-ascii?Q?QuJVwgN6lWwbKusklD703PLNH9GNWfwKrxmNryUHprd2iiCNTtviVObkUJbL?=
 =?us-ascii?Q?VUFora5oDEBVZH/QrufFmo6lkjVhTQpiErD0tFIBTeLPwXh++Wft5IeiO03U?=
 =?us-ascii?Q?ryCJ7FUl5MGDfTVQg6bKvUeRkdoMofSH6G+BqimtJ3PcWth4kgX3lo2EC63T?=
 =?us-ascii?Q?eg5kqRbHUn/caM9z4oL18D3LAXWOh1dSaJXdGT/X2LaK7sdEz7Nr3xYV4fTW?=
 =?us-ascii?Q?VqCVyryrSTrdWDVHoa2LvOdcJ99MgxWk0xFy/65QFedMgCV4KwV0QOPahOd0?=
 =?us-ascii?Q?A46YDXtQzgz6hv9JuBK6HKrimEesouYhuBXcfMD1EUmV2RzT3g428Hxnevjo?=
 =?us-ascii?Q?p8MlJwaFU11VFuUnfZOsdUA8ime+2N5gHUNFzJO4ueARlO3fRG4wqmhtsQMG?=
 =?us-ascii?Q?QtpiotiI+Efr/aIBFJ83JMuC5M14J1ERLFuclS25KwtXFsCHCNGOvnmHjKN8?=
 =?us-ascii?Q?V2Tp3xHQL9IgcPYDomajY++Zb9RT1RJq49BDTKmPTt8jeJR5T00Yoxt+eoYU?=
 =?us-ascii?Q?rU1Zif1+JhMYcLzsYpKaAWhq/o3c9qKZeGbhREWPWCsW/t7vQ1D4z5r/0NIy?=
 =?us-ascii?Q?OUC1m++4NJd4qAa60Fa9TMBITNRwtb8jpAOb2k9PQpfV3hr+HiY16KRnuLyX?=
 =?us-ascii?Q?wHf66F4Ls3n9rWQKA8j0RHnFRrAn3uPatcoApXPD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e673e16-3959-4bb9-b70a-08ddb0015415
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:49:51.0575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgMKpxgPco2iPaCd60OeQUlbx3UYDFhdlCNjPaz8bkpulgyFiNtFN8rJfqPAD2trVLtlfEQSE6a2B84gW4btGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
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

On Thu, Jun 19, 2025 at 12:30:04AM +0530, Badal Nilawar wrote:
> Reload late binding fw during S2Idle/S3 resume.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 91923fd4af80..6c44a075a6ab 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -205,6 +205,9 @@ int xe_pm_resume(struct xe_device *xe)
>  
>  	xe_pxp_pm_resume(xe->pxp);
>  
> +	if (xe->d3cold.allowed)
> +		xe_late_bind_fw_load(&xe->late_bind);

something seems off here... d3cold allowed should only be used
for the runtime pm portion from the cases we can lose power like d3cold.
But we don't use that in the s3 path.

We should probably have 2 different calls here. unconditionally call
in the regular/system suspend path and conditionally call in the runtime one.

> +
>  	drm_dbg(&xe->drm, "Device resumed\n");
>  	return 0;
>  err:
> -- 
> 2.34.1
> 
