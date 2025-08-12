Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9954B22ED0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 19:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738E610E17B;
	Tue, 12 Aug 2025 17:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9bhGVjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7761B10E175
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 17:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755019018; x=1786555018;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QPCWo6irY0qmTD4Y157LN2RZrvLqA4UotivJlkLoPuE=;
 b=J9bhGVjHQZ/h1/B2Wl50EAYBBKUzv9TL3VLULHUDPnbaWbMUKo/A/Azo
 2kLCNa160U/MFwppvJ9SUGTeBNv0B2HfK7IokhzhgtpFAC8Q67yIZEnAA
 qocml3AsI7L3pws+a8NbEET3sb6mSQUX2dGHa2iGPF4T6/qvRm5eGTv/J
 /lzV2nH1gNwHew8MT6KawUc6FUpHmSJToq384We9Kq+eAXDyutJuyOZBF
 Xfpbigh3EfGomUAaT2sf8xayytLIW5Iy+1uq2DxjVq46vJsJDEAkIjYFb
 kgvPU31V/gRtavSWfoBQvjDQrdgKgH0wYMSNKigE7qnbaxAekPDsFnmim g==;
X-CSE-ConnectionGUID: uOv8s6mfSnmR6ybjzdnx4Q==
X-CSE-MsgGUID: QV0bijVmTXSYqZ72Ni0FQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57366964"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57366964"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 10:16:58 -0700
X-CSE-ConnectionGUID: V7b+QFqdQh6j/DwDFUWysg==
X-CSE-MsgGUID: nxkhcKRiTMayFQ+SDc6f3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="171508978"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 10:16:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 Aug 2025 10:16:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 12 Aug 2025 10:16:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 12 Aug 2025 10:16:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z25pWoxcE7x19IR20llWJ9dnlfERH5eDn6+0GVQoXFemSlwnoBAnc5KLTBJ/yiP7e8xmagRMCYJksvN+3C+NsHm/U8LJAMg/fmazg3tJAGy5cdE1amO1PRIsS3+/Y4L1gk/gi6OVJhJlA7kHKRUSbIDLtMWfQYYdH9Sk0jIE2mzFYYWeVNSJuPG93eGirPKKAvDWwLbRM40InK3DScISS7z79EzjAulccHRQZBnQ9dxTh+g5j1dRjG/Tj6UvZlzOs9r7FjpbKrWU6/TRrW+c90uGehlrihIY1ec6utDNsyaKODYzi+0vbENpEWOQoaqepEtaRvcdunK4pAUuWEs/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXUw1WCQbVWe+CVxun3ZgvtSIGPen6Mw4LVsOW+V0zQ=;
 b=e1ICtV/ezilKDdPiKuUC3VPouNhTMmQ/nukplY5B7V6Ueb8Bop10o8u2XUtlgkq6VdXnFx31wueCPOaKrOJ4PAX8gTCt5h1hGEXr7I3I90weXVjYxcsT4UVJe0/yltM5d56mIjA1U+CriHhqvIKwcovhJ9cP7A/Sqw8YYsA7adOKG/tZRUrOqhYVGxRMTZv14i6TymyTXWbNvzWuZfBvi4k+9LycysvLM2QbxuJQpxrfBskn5imVZYXiDdbItpZGDO3RjtwmMrMX/Lp2O2M8ykXzquaXCog+fS1I1SbcXDQXyIsw9dMIBJ30rQ/Cv81WN73SSfa2ZjWNwnbk+slNdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SN7PR11MB6921.namprd11.prod.outlook.com (2603:10b6:806:2a8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Tue, 12 Aug
 2025 17:16:55 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 17:16:55 +0000
Date: Tue, 12 Aug 2025 20:16:43 +0300
From: Imre Deak <imre.deak@intel.com>
To: Danilo Krummrich <dakr@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Lyude Paul <lyude@redhat.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 2/3] drm/nouveau: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <aJt2-wXhhYojy7Hy@ideak-desk>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-3-imre.deak@intel.com>
 <cab8be18-1cb3-49d8-a967-767174b0dc79@kernel.org>
 <4abed396-5225-4b5c-a538-ced4f4619239@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4abed396-5225-4b5c-a538-ced4f4619239@kernel.org>
X-ClientProxiedBy: LO4P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::15) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SN7PR11MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5b20c2-87a6-48e6-642b-08ddd9c40954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2h57TEM4TIiiXFQJj4FPM/DsD1qgC2awc0TpPK+0huXlYbY1LJ6qrjeRet?=
 =?iso-8859-1?Q?vLrT13CUJVyZFCgVOibXRU+fldeAXLcOntSPiU5rUxedecmTOiF8oNd5lv?=
 =?iso-8859-1?Q?7DilhYP9tY0FPvLoNgVTwK/4oipMKyOr17/V3QDH4L5ZPqZkxYMyQ8LFn3?=
 =?iso-8859-1?Q?lft9UyZhiadeZtvI7SkhmwPCbrRtBR26K8X2AJvvffh/zzsmR1pABGX6i8?=
 =?iso-8859-1?Q?KJTI17WHjStTYtWhWnnuTxM0w4d6L5nVXwvIj7SjrjMDrgiayHSd+mD4DO?=
 =?iso-8859-1?Q?J9ww6XF+6Mpp/leZN1xMYFUhrR4WifDaDe5FOM95gX3yK0z4cy5MmeQP4e?=
 =?iso-8859-1?Q?8daBb4IhXVxlrVr9d1dC8WTtBEl7RZU48TDFBJdFnJzk7bXU3BjmC7wvIg?=
 =?iso-8859-1?Q?K8+gsUXAwGoPpSI54NbD0XzVWBVXGoqaztmIbA7gE+HBCH4cAQc5IO1KFZ?=
 =?iso-8859-1?Q?i99O3VcPkWEgKd3hwLFeW1oprmBEs0Fbb2Rm0USjhbqMvXoksEqXIeYkO3?=
 =?iso-8859-1?Q?YEZijKrhwZscdI1oLGu4odZ8XOv3rfn1k3ceSVQ4oGRT4Fdvm7nadIkIAV?=
 =?iso-8859-1?Q?l6XaZjfl73fn5lAOsVq+pO8pK7z1jfD98gl58F2z0QQxvqMZDmatQacXqF?=
 =?iso-8859-1?Q?XRZkmgGhw2MMetkUj4/KPxE/F0H8kMa5+JpEPM4kk/hpzmPOm+dospUzmZ?=
 =?iso-8859-1?Q?QUWebz6dmBnccDsw2NpKdorNE32Hits0qehrtce13BWBhDIuPLZTtQdwiU?=
 =?iso-8859-1?Q?U+KP4v/6DiihpbccCXkCAnp+ZNu+6R2lkJpU9KV3pVNwBIeq/lyK7lkpFy?=
 =?iso-8859-1?Q?LfCJxk89376MjJ7yy7SjO0DCqU6KcTlwBEKAG+RhCH3qbbgH92SN9wa/b8?=
 =?iso-8859-1?Q?XEtdwOhBuB/AXkbkdoTcFRf0DVJEZ3ZL7lbz0QjvXKbBVP4n4D2lhdCoEs?=
 =?iso-8859-1?Q?dzUjsB0lcUCdHxUXS12oUUTXn+j2f39F/XEV+fntELyekHKqO7MNQUgMcr?=
 =?iso-8859-1?Q?dqGGX8YdDGTK2Up4oDpDxJPp8BSju9MVZFTfbqq6sOHacIFMS6FoL/qoUw?=
 =?iso-8859-1?Q?TULiYspSuIMtX4HPNG1xlVO1FKQYfscUGUjY3d/9J8wln5HHXgmhutpVCo?=
 =?iso-8859-1?Q?f59O+N3vZ/tFVRaVGic5sAf14LaBs2Z3vXCwQnsKtXzdyWQNRrd/TQXuVx?=
 =?iso-8859-1?Q?HQ4VJjMx8j+RRG77YVjW/jhipsODf/3/D2chxkmqpu0yoDh23gWlv5CoH2?=
 =?iso-8859-1?Q?iVVjL44iINBJkF0gnYQU/5jJ/oncUM5qhSlro5lN8bnz+LXfN3NuegF5DX?=
 =?iso-8859-1?Q?rqqLodbhuCnobyjXNLiUU6OCx6vloxqmc/alYbNYofB8xApPVMaKBvaNsx?=
 =?iso-8859-1?Q?S58dESRB2LttKzH2oarWfnGziatf+TmLeipKRwNn7DEGs07uyeWnx9Z8wc?=
 =?iso-8859-1?Q?nw7EXkj2ldl4gaa/1UAKYBUYBn2yfOqf2iIgjfghI9nK5MFq1zpCZ9tQSb?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VedNBHH9cE2WS3nHxUqRPl6KjgESU1z8BNCdDgXq8HXKLEj+uznDohe/n8?=
 =?iso-8859-1?Q?W4geXRXJt6JtKxJzUuxPsuPU0jHmEJtndWIA8fqoZS1SgBFbECWd3GiNt2?=
 =?iso-8859-1?Q?6GkGrlh0oWo1HFZ/qMZQdYBldb2h58qjvxgWljBOk+KaOUcdJOsmQvfhdt?=
 =?iso-8859-1?Q?GD1ynqymzg5bx7kXgNwQd6l92kOpAYXw7EnL4j53QkWIOUAqOeScUmNH2Y?=
 =?iso-8859-1?Q?JQ9sG7A6XSl3zR5t4/vEvE5dkIpXh4DZlRzT+Ati5ThgtPdJR72WWHRdWr?=
 =?iso-8859-1?Q?flpENSKlZy3DxgUSwpt5490tb1DAayuO4/OeVws3H9IIPI0Vbw8P1DkHRi?=
 =?iso-8859-1?Q?E/G5QqICMOyguszB2dAlm8nFKMEhKAq38irOkIF4CXZzjxbVGPYoMz9otb?=
 =?iso-8859-1?Q?mYG5Iy9OI883XjCmnKeS8G+r+kjZU0HqwR/BWttvEdh2Pcsi2jH4IYPwy3?=
 =?iso-8859-1?Q?7GpOgDDAIKvverAF2P4PRPbbqrqjpLr3dyUtdmCi2nhpjMZ01L4aGH8kNI?=
 =?iso-8859-1?Q?7xHY3OH/Q1+v3MrxUY/T/F7VEBMN9tM0NqKCKWfg23kBke+MqXq64l8Lgw?=
 =?iso-8859-1?Q?u5sDsQamchv51uYvsJTbMtGhGWdAYbw/e3dfYWskAbecpKiJkiWddKyPF6?=
 =?iso-8859-1?Q?YjXQ9+iVdgMXbyV3Lk6C0CF//DyxEJWHlJJW14OCXNTxwFQ/p90quqWy0A?=
 =?iso-8859-1?Q?aoyCSnlY9USc4o91rb8nGps3yxK6ztVx9ue2jLyCAgeZoXW1eZ6jo3WSNJ?=
 =?iso-8859-1?Q?CealcPWUVy5YXex+0TtT02LU+N0oobY43U1uSORH0pWyA8/dftWTKqUG8J?=
 =?iso-8859-1?Q?SVxLv0WK+pdLQ8f7WMM8Lfo4KtrBnRNJDsL7pg70jqhDR+klzv/b5gMXX5?=
 =?iso-8859-1?Q?VmpVZfytoGcEBqooAtwTeqt271OZMzj8XotC4j1n1jXxxZHVd8wHncPncB?=
 =?iso-8859-1?Q?GVcp33Gq4lVCFZOfRXABEooUb0j2o8KEM3T+JpYaryym3aLnedcGtTkK3s?=
 =?iso-8859-1?Q?Ce+DBfQ77+JgEdfJhtpjQn9a2KTHC6qQVJ30LDe1Or2kpFTDzJuLk7kgFU?=
 =?iso-8859-1?Q?RrQFouogPBcH1bE3kkADkBIigGVv8PXCKypkxUxrJlX7JxwD2/rNIqBBPf?=
 =?iso-8859-1?Q?9Jaq0stOVcNXwPyVn3s1YCl85J8CTiOsauGaVixHUugXRBzj1a8aBXRpNL?=
 =?iso-8859-1?Q?Xd14VDgo+sDg35zVQNgfce6aXJ9nEayxd64cXlhUJ8GQSWXKsHDdp1ANS8?=
 =?iso-8859-1?Q?Pm01MmDfYQALje/25ZWQB4PhbCqkYHNZRFOIFOX75XvIXmmsVupZ/6Yy5y?=
 =?iso-8859-1?Q?hoM1yB9S+bO1s6vzE5EbJoerNFGkXHeR7v2w+9qIPK1+qAY5oPW98XyGbp?=
 =?iso-8859-1?Q?kzQZR5bTyKe2TEaD3smGxW9UYO5/dZaCQqF+s9Q9go2sQUKwhHEWGZ2+/s?=
 =?iso-8859-1?Q?AkilsAmzP/1DkIDaonjoU3P0AEb2T0AJU9xzVUqfohDCjMWmgsrIGBBBqy?=
 =?iso-8859-1?Q?3P1zeS0JQjcsatAuMptvvzzUtjxhDGLRNS5feTSwI+4onQRmLXnhrXXrCU?=
 =?iso-8859-1?Q?BFQkGNBL7QOcwSrYvjGJmnlyFNwtfVhlCKHzuq14mDMrBZpRRE8jdz3PKK?=
 =?iso-8859-1?Q?W1ODLGQYfZPIx4yleiwJz2DJtDu+BaH4zrK1WXj7W9a5+pHXWCw8u1FcED?=
 =?iso-8859-1?Q?aNCdDCWZxqDdHyJfOOyqZjrcUMGJWMrzaZHaxEWN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5b20c2-87a6-48e6-642b-08ddd9c40954
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 17:16:55.1087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5WYITH5maywg99gTKFWibe5DuNKuSQCkE31mW1Q5OoGz5mr+F3pS8mZySDx+CuKfA3dQOh1I0fX2yEfG2pG3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6921
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 12, 2025 at 07:04:44PM +0200, Danilo Krummrich wrote:
> On 8/1/25 11:08 AM, Danilo Krummrich wrote:
> > On 7/28/25 12:16 PM, Imre Deak wrote:
> > > Plumb the format info from .fb_create() all the way to
> > > drm_helper_mode_fill_fb_struct() to avoid the redundant
> > > lookup.
> > > 
> > > The patch is based on the driver parts of the patchset at Link:
> > > below, which missed converting the nouveau driver.
> > > 
> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Fixes: 41ab92d35ccd ("drm: Make passing of format info to
> > > drm_helper_mode_fill_fb_struct() mandatory")
> > > Link: https://lore.kernel.org/all/20250701090722.13645-1-
> > > ville.syrjala@linux.intel.com
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > 
> > Acked-by: Danilo Krummrich <dakr@kernel.org>
> 
> Any concerns if I just pick this one? It's a bit annoying to not have this fixed
> in drm-misc-fixes and -next. I'd hope for -rc2 getting backmerged.

Yes, this got delayed and didn't get to -rc1, maybe I could've merged
the fixes already reviewed earlier.

The fix is in drm-misc-next-fixes atm and Thomas has sent already

https://lore.kernel.org/all/20250812064712.GA14554@2a02-2454-fd5e-fd00-2c49-c639-c55f-a125.dyn6.pyur.net

which should get pulled to drm-fixes and then to -rc2, AFAIU, not sure
if that's enough for you. I let the maintainers comment about
cherry-picking it if not, I suppose the concern could be the duplicated
commits that Linus would see.

--Imre
