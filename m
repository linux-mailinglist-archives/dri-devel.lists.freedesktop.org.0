Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D553991442
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 06:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2974410E2AA;
	Sat,  5 Oct 2024 04:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clOBjosJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF98A10E2A7;
 Sat,  5 Oct 2024 04:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728101704; x=1759637704;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0YfYLXDO1nUs+La0U5HsCbeK1AEsCTCunBw7ZZAGzRU=;
 b=clOBjosJ4xKbiItW4CnwIGi5Vsu+Y3SZaQHRa5R2jPOA+3EOYZftCL/H
 C0fC/yTq80/QYl/SI8zZfoenrNJ25QH6RvWptLAZFVDVk75hRLTUrx1No
 yuvtCSf0PnZ6QWE+8LBXB3I39MeJ1gGBYZarjLAtUwRr68YXFCxYjpLop
 PcSYmNZfjHL/Md30h9bYSYHFbYIDWGZYvPjHFUYd00dPwxZuQ6lzucY4u
 cCaj74AaRKS6gchy0c71FBW9/M3a0jSrg5gQs6PQjS9Kma5csLZr03Wjg
 Uas6Bt5AwFS/Qbm+BEg8OZHgVD/ituHikOXLJ/O8f+ueGamAwXtwKYtHu A==;
X-CSE-ConnectionGUID: 0tWwfxrSToCcXW3g29Yf9w==
X-CSE-MsgGUID: +I5d9V93SY2DcnfHIyi8Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27505290"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; d="scan'208";a="27505290"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 21:15:03 -0700
X-CSE-ConnectionGUID: uDsBvjspQx6MoiOl4vDf8Q==
X-CSE-MsgGUID: 3o63Jn5ETMqD1A1Ssxs0IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; d="scan'208";a="74581444"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 21:15:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 21:15:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 21:15:02 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 21:15:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGvrlihlY067NGJ7VL9taLpo33N6hT10t2YfJ5b8tzEaBRAJqG0eXA6CPazx8aNu4D3+1VG4FI5CYmjccfFDAPAcznBRejOLL3CXpTCqDjN2YkLGjYPcB4p2Ow+IhbZzCI/ZItjY2xLDaTjVhjLHVolUdypdEaDz+qF+ATxFSlYzaF1iOM3Ypu7tn0FNS6cR5eGLuuIZhp9BBCySoMfE9+l2jdKw7PKg/dR48ZFV4g05+U3CL9DuXr9bnkeHvCj2p67LopCw7hiCQgm9ImwYok6plTNZe0ioFvR7bUVgmtakAn8jCSa0WpaJl0jlZRZgPk2wYBlQEkvZv1xVXD46fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYphryeN4RdfcQ+KXG8EmmUrSlxNVOyCzWDBz3h0fws=;
 b=Ko4RtIQtwzUTfSmFlN0aEM/tpWVqJwSdLvZ39aL424I/p+C+ykf5PR9qPxFBAXL/InJXpKIbXnyamyxUxBl32TUdnvpW0yougrjAJ1gHPvdrrGqCyFqmYS2YD5Mmq1mtswSJlNWQ3+0nHWYsJ8dvNAKtAq2GN68bIvm5kc1iQriN0fA8FLncJU0sx9IVP2kxPjqUesA69Lxb9hkSy7su5y7BDNd0te42q8TcxET7sS+yF6Yc+5NU7uKSZzLLlrp3DyyN1FlGvGfyvEbVm97aP+xAG/ks/whdRKhZs9z8hFMII7jY/OBWtuId6K1vjb57kjsYx2ajZLglwPO2IAtHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Sat, 5 Oct
 2024 04:14:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Sat, 5 Oct 2024
 04:14:59 +0000
Date: Sat, 5 Oct 2024 04:14:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <spice-devel@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Zack
 Rusin" <zack.rusin@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
 "Sui Jingfeng" <suijingfeng@loongson.cn>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/2] drm/ttm: Change ttm_device_init to use a struct
 instead of multiple bools
Message-ID: <ZwC9NfwE/vkGiq1Y@DUT025-TGLU.fm.intel.com>
References: <20241002122422.287276-1-thomas.hellstrom@linux.intel.com>
 <20241002122422.287276-2-thomas.hellstrom@linux.intel.com>
 <6c0387d0-1979-48ae-b9ff-49e00a459438@amd.com>
 <761343773c9e1f5f0cc348a1ec953fb3194194e1.camel@linux.intel.com>
 <a9ef0e2bb79c1f572f82c320a9d77f9cdc75c964.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9ef0e2bb79c1f572f82c320a9d77f9cdc75c964.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e7bb38-335d-4a3a-37e8-08dce4f44710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8aOtZhab+P1YTohqFn3egWjGQ6tvwYgaofB4FhZ4CGlfkRMRLH3jA0zeA9?=
 =?iso-8859-1?Q?qerFoHWgGPe63GUbegbTuY3egwD3EH/lt0pQVFTMREVejWlOX+4ggHiwGc?=
 =?iso-8859-1?Q?l//RqlnWbL6vH60d2Bk80SqiTJq6wBI0kWsu/hvTSCwbHzWrzlgDNPkF+1?=
 =?iso-8859-1?Q?2vIQ08eFTm+7qMki3E8w2Zhye6hXvTjQLahw/XNaVI7EaFIFwV4euI1qRi?=
 =?iso-8859-1?Q?RiFIt1pD0/YGHwVZCLZL96g2dHCGnAVFt/K7yxBAv9zyiVsozbYeSf+BbU?=
 =?iso-8859-1?Q?svbJBti4LroM+lXlpCRlU5PQ98bKbianR8QsBsp27QroFcbxf4jsQCTmlL?=
 =?iso-8859-1?Q?EUuAk65v9z4MLuxvvLLQu4YV65FMyCLvq6kLyXxZT4QxYSNF6aJwCYZ0/K?=
 =?iso-8859-1?Q?gKdzUX75p4wEk1ENcucJKka76T54lMbrKBQe0yCIPylSu+tbxz0IQIBorL?=
 =?iso-8859-1?Q?Tz2fUkouJtb0keI7xpX0HBnk2x6gS3+WllTmktWCQhwPFeT5vXMSdep2lj?=
 =?iso-8859-1?Q?gwWa9iflUrcVIvZJqQXhJktrMXHIKAUZRFBBHsvFR585a6mIJkjqFqkNcJ?=
 =?iso-8859-1?Q?FpCNhZSk/14qCprpBwWRSIoAOJJNRRXB223ksu2glk1uLbgrtcQAUHt/kg?=
 =?iso-8859-1?Q?WnHE2StCg363MctZH7EmbvN3tOeTHAgtYwhtP6DRdYpuBPF9B6AT+rOpWv?=
 =?iso-8859-1?Q?UlTaLKFVpHboM819/XHrMD+eGKZ0cO4A+Z19kiQaEjGsM5GrVZqaDxTRdJ?=
 =?iso-8859-1?Q?CCGyaYVvlBM2DdryznR37SMm/7z3YMa1VyF/G9ugFIolG2QVaIGjyMlp4Y?=
 =?iso-8859-1?Q?ceEUX3Qu0VrLnOKvoX9wlYV15gntsyAvmjsp2VexNgXtWDv9NMgz8/Otbp?=
 =?iso-8859-1?Q?r735sOHqhc625KNmNx478XbpIyWPq968E69WB3ctmwrhjEJrLF42OF3PaA?=
 =?iso-8859-1?Q?eGDbpNRRAiQC+v3RUqeIxCyZ2Y7xTzcZc1GhMuXw2TaWrdopU0agGqelzg?=
 =?iso-8859-1?Q?WOZTnPqnQRCsbI+gUXMHT/DRNHJwJrLT9vEEnGqFHpAZKtCrt/AgjF30nG?=
 =?iso-8859-1?Q?44/i9+4bKHkOGRCxvhEJtt5RW0LybGPNNyDjEDYuIgcceUGIa1Sn4yRwM+?=
 =?iso-8859-1?Q?GB9fH+jnAx76v6m6QTtBCn2qY15rFsEJ8z+J/MPstuZfidXirVQAIM9rnB?=
 =?iso-8859-1?Q?XOUx9JE1/ePa2mE5PLYQc2/ELZSfNHBo6lScVkZgz1MAAWr+tiXieD273f?=
 =?iso-8859-1?Q?Ds1qnWXvg8aLA7zScWYYlhLSU9e/YLswiEBTZX7Nvv/Y0jZHj/qyRml0rE?=
 =?iso-8859-1?Q?zpP55afcTSF8OceO4JK31YtmIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UprF5GbmeUYAEZqK9UfoFHOCbmCf2iHMvmZSEMkNhUOtlg1iILxl/8iAhG?=
 =?iso-8859-1?Q?+Y8f9E9MMhFRJtoIhSiA8Ei31+5OEyvmL/Ygz9sR+Nt5ASpzON5sgtopd5?=
 =?iso-8859-1?Q?+DEMRVKkU+O7rGWbCWSL83j4Onbq+b/LdktD1wJXggLwRmbbOBGD19CyKd?=
 =?iso-8859-1?Q?zZ7VrNJLZd5STNa19JSTg/kkUbAKfjts3e42vXfvp7+yUW+BPnYPP+53LZ?=
 =?iso-8859-1?Q?MuPbP7AAXdDv9hidKvtWc7+PoFETkexPFVwFB5ah2KWGtlsfeRah1YqNgC?=
 =?iso-8859-1?Q?rj6F3WkvGCoZwrAfzendi13HByefqKfHE3ohGopgULZz/WE1pH4Spp0poF?=
 =?iso-8859-1?Q?taTFthns6rW6PdVXz+mBumRjEzn9nSyv5/ZVkZe87aVRTyM0UafOhmtpwn?=
 =?iso-8859-1?Q?15Dm0qzOsizGKsrTf8GY06+JHFlXmrN6QuVmjE8hymwIMibXq1I439bnWY?=
 =?iso-8859-1?Q?9ZXZl+YPgmqSpR9oW8fAwMwge02QIhunwDSey613F+j6S29Y3g4ZQC2H5T?=
 =?iso-8859-1?Q?4GNa5FVJqA5P3ElKZi77myMgYU7xrVHEKLC3qNzEex8+Bte2b0tUKSTiAL?=
 =?iso-8859-1?Q?xOqZbxEgiYwrlvNdpqoHoqKpS0vg34W3mJFhiP3UcVVl2S3Jxsf4866f8v?=
 =?iso-8859-1?Q?akjn+ADyI9KKmUyAkd8n0foAqh+XDDw+RTmDsuMt6YRNwTmHgF6MtSQi1G?=
 =?iso-8859-1?Q?GXP1JFr+56E16eaC/le32ySLZbh/sYhjAbZ1ZEylfN1oNHUizl8LBKBIi+?=
 =?iso-8859-1?Q?hiqSj8pWBA7eV1WSzLrRqE2Wbx66dtq+QDTpnJQAB/avfrQjbPpaSD/r5A?=
 =?iso-8859-1?Q?WBVs1uXxo6GQb/W8K+II5ZQhwBKvzqceXqLj8rH8gNGtKVWdb8vkqpKtML?=
 =?iso-8859-1?Q?LR4hAk8gYkAroFHmwdGRN0UHLpGdWN3xJLP53xV7bHusC8vbeymLclQ5x+?=
 =?iso-8859-1?Q?ZxanZeHrzCcCcT/Izui8p2l2rfJVO4vpBrFV/s6OlrlDJbDZp1Ko1sKF1M?=
 =?iso-8859-1?Q?AvCWQjSDfSw4wqOL8N86cRDg0o0qnfbWIqKiDLAV9eDjvnc46uQNJHmsuk?=
 =?iso-8859-1?Q?Nt0cUGlb4TJjqt/dKBLmETVwok3xH3Bf5aIy16mNrH8RYf58TrDA8MJ5BM?=
 =?iso-8859-1?Q?kDxz/+PHgcjp3hN16RnAv94ZutBZIDJA2qlQpe78T4PzD1zsOI83gPoWU0?=
 =?iso-8859-1?Q?D6dTlLANsN/D2VpF7SPoMmZHG/jNdpEjjtbRXisHhq9pnSu0Rg+zP90hC3?=
 =?iso-8859-1?Q?L+LNddNRsaO3/KkWM67J+F3964xN/u698LwW2CtPUu+kJsvD/I9ux2y6VH?=
 =?iso-8859-1?Q?4igzLyuh1qwpoKKGm/N7cjgDDnEs4vWIjAHj1AuOo35saYxy92cbJOrNJI?=
 =?iso-8859-1?Q?vVbzYPh8U1XIv8kJcA6EGwfVX9R8q5B8GsUwvTu4Ac4W3VJeGxkPxpHQ7Q?=
 =?iso-8859-1?Q?lzYec9i47NnpV8crqCiZzobM/z7HezBCr/HtJ+zwz5Z3aDETQ8x4SxCLAd?=
 =?iso-8859-1?Q?w6PubwD3KoRQWsK41qFUkZOnYqibHuX2l8XfDCzb2RX9Foqvsa7TMHFwwu?=
 =?iso-8859-1?Q?knFHvd14fR7M6ju1mtPrioiu/S4JDli45R3wodonfEfw50wiUYqQ403chY?=
 =?iso-8859-1?Q?p4maiNhPblhmTuD/7vwzOfju1v0Gpu9/n8JBDdOmBGKL2QsNX86G/+Ug?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e7bb38-335d-4a3a-37e8-08dce4f44710
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2024 04:14:59.6266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaP44r12Ddlkj4vDAynmYBrjA49fg7J0s/NSqZTdvJ1JAk1Yzlx5u45gNpwosk4vcV2+EpfRZJzaovYekX8X0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
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

On Fri, Oct 04, 2024 at 04:28:29PM +0200, Thomas Hellström wrote:
> On Wed, 2024-10-02 at 14:54 +0200, Thomas Hellström wrote:
> > On Wed, 2024-10-02 at 14:45 +0200, Christian König wrote:
> > > Am 02.10.24 um 14:24 schrieb Thomas Hellström:
> > > > The ttm_device_init funcition uses multiple bool arguments. That
> > > > means
> > > > readability in the caller becomes poor, and all callers need to
> > > > change if
> > > > yet another bool is added.
> > > > 
> > > > Instead use a struct with multiple single-bit flags. This
> > > > addresses
> > > > both
> > > > problems. Prefer it over using defines or enums with explicit bit
> > > > shifts,
> > > > since converting to and from these bit values uses logical
> > > > operations or
> > > > tests which are implicit with the struct usage, and ofc type-
> > > > checking.
> > > 
> > > Ok, that style is new to me. I've mostly seen defined parameter
> > > flags
> > > in 
> > > the kernel.
> > > 
> > > It obviously has some advantages, but do we have any precedence in
> > > the 
> > > kernel for using that approach?

I agree multiple bool arguments are not a great idea. I spent 4-5 hours
a few weeks ago chasing bug in Xe where I transposed bool arguments.
Complete waste of time likely could've been avoided with something like
this.

Also agree this makes code much more readable at the caller.

FWIW plan on using style for bool arguments in gpusvm.

I do have a couple of nits with the style below.

> > 
> > I don't know TBH, but I can take a look.
> 
> So it seems  parse_events__modifier_event() uses something similar
> 
> grep u32 `find . -name '*.h'` | grep ': 1' or
> grep bool `find . -name '*.h'` | grep ': 1'
> 
> reveals a huge number of lines but most of it looks like it's not used
> as function parameters.
> 
> I'll ping Dave and Sima on IRC (I guess they're the ones to receive
> most blame from Linus if it's deemed not good).
> 
> /Thomas
> 
> 
> > 
> > I've used the same style in some of the shrinker series patches,
> > since
> > using multiple bools in the prototype severely reduces readability
> > and
> > mixing the resulting flag defines without type-checking may introduce
> > hard-to find bugs.
> > 
> > /Thomas
> > 
> > 
> > 
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > 
> > > > This is in preparation of adding yet another bool flag parameter
> > > > to
> > > > the
> > > > function.
> > > > 
> > > > Cc: Christian König <christian.koenig@amd.com>
> > > > Cc: amd-gfx@lists.freedesktop.org
> > > > Cc: intel-gfx@lists.freedesktop.org
> > > > Cc: nouveau@lists.freedesktop.org
> > > > Cc: spice-devel@lists.freedesktop.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: Zack Rusin <zack.rusin@broadcom.com>
> > > > Cc: <bcm-kernel-feedback-list@broadcom.com>
> > > > Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> > > > Cc: <intel-xe@lists.freedesktop.org>
> > > > Signed-off-by: Thomas Hellström
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  6 ++++--
> > > >   drivers/gpu/drm/drm_gem_vram_helper.c         |  7 ++++---
> > > >   drivers/gpu/drm/i915/intel_region_ttm.c       |  3 ++-
> > > >   drivers/gpu/drm/loongson/lsdc_ttm.c           |  5 ++++-
> > > >   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  7 +++++--
> > > >   drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
> > > >   drivers/gpu/drm/radeon/radeon_ttm.c           |  6 ++++--
> > > >   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 +++++++-----
> > > > --
> > > > -
> > > >   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  3 ++-
> > > >   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 16 ++++++++----
> > > > --
> > > > -
> > > >   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 20 ++++++++----
> > > > --
> > > > -----
> > > >   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  6 ++----
> > > >   drivers/gpu/drm/ttm/ttm_device.c              |  7 +++----
> > > >   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 ++--
> > > >   drivers/gpu/drm/xe/xe_device.c                |  3 ++-
> > > >   include/drm/ttm/ttm_device.h                  | 12 ++++++++++-
> > > >   16 files changed, 71 insertions(+), 52 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > > index 74adb983ab03..e43635ac54fd 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > > @@ -1853,8 +1853,10 @@ int amdgpu_ttm_init(struct amdgpu_device
> > > > *adev)
> > > >   	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver,
> > > > adev->dev,
> > > >   			       adev_to_drm(adev)->anon_inode-
> > > > > i_mapping,
> > > >   			       adev_to_drm(adev)-
> > > > > vma_offset_manager,
> > > > -			       adev->need_swiotlb,
> > > > -			       dma_addressing_limited(adev-
> > > > >dev));
> > > > +			       (struct ttm_device_init_flags){
> > > > +				       .use_dma_alloc = adev-
> > > > > need_swiotlb,
> > > > +				       .use_dma32 =
> > > > dma_addressing_limited(adev->dev)
> > > > +			       });

I can't say I like declaring the ttm_device_init_flags as part of the
function arguments. I'd prefer this a local variable but this just an
opinion. Not blocker but if other agree with me, maybe change this.

Matt

> > > >   	if (r) {
> > > >   		DRM_ERROR("failed initializing buffer object
> > > > driver(%d).\n", r);
> > > >   		return r;
> > > > diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c
> > > > b/drivers/gpu/drm/drm_gem_vram_helper.c
> > > > index 22b1fe9c03b8..7c3165b00378 100644
> > > > --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> > > > +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> > > > @@ -931,9 +931,10 @@ static int drm_vram_mm_init(struct
> > > > drm_vram_mm
> > > > *vmm, struct drm_device *dev,
> > > >   	vmm->vram_size = vram_size;
> > > >   
> > > >   	ret = ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
> > > > -				 dev->anon_inode->i_mapping,
> > > > -				 dev->vma_offset_manager,
> > > > -				 false, true);
> > > > +			      dev->anon_inode->i_mapping,
> > > > +			      dev->vma_offset_manager,
> > > > +			      (struct ttm_device_init_flags)
> > > > +			      {.use_dma32 = true});
> > > >   	if (ret)
> > > >   		return ret;
> > > >   
> > > > diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c
> > > > b/drivers/gpu/drm/i915/intel_region_ttm.c
> > > > index 04525d92bec5..db34da63814c 100644
> > > > --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> > > > +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> > > > @@ -34,7 +34,8 @@ int intel_region_ttm_device_init(struct
> > > > drm_i915_private *dev_priv)
> > > >   
> > > >   	return ttm_device_init(&dev_priv->bdev,
> > > > i915_ttm_driver(),
> > > >   			       drm->dev, drm->anon_inode-
> > > > > i_mapping,
> > > > -			       drm->vma_offset_manager, false,
> > > > false);
> > > > +			       drm->vma_offset_manager,
> > > > +			       (struct
> > > > ttm_device_init_flags){});
> > > >   }
> > > >   
> > > >   /**
> > > > diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c
> > > > b/drivers/gpu/drm/loongson/lsdc_ttm.c
> > > > index 2e42c6970c9f..c684f1636f3f 100644
> > > > --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
> > > > +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
> > > > @@ -544,7 +544,10 @@ int lsdc_ttm_init(struct lsdc_device *ldev)
> > > >   
> > > >   	ret = ttm_device_init(&ldev->bdev, &lsdc_bo_driver,
> > > > ddev-
> > > > > dev,
> > > >   			      ddev->anon_inode->i_mapping,
> > > > -			      ddev->vma_offset_manager, false,
> > > > true);
> > > > +			      ddev->vma_offset_manager,
> > > > +			      (struct ttm_device_init_flags){
> > > > +				      .use_dma32 = true
> > > > +			      });
> > > >   	if (ret)
> > > >   		return ret;
> > > >   
> > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > > > b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > > > index e244927eb5d4..5f89d2b40425 100644
> > > > --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > > > +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > > > @@ -302,8 +302,11 @@ nouveau_ttm_init(struct nouveau_drm *drm)
> > > >   	ret = ttm_device_init(&drm->ttm.bdev,
> > > > &nouveau_bo_driver,
> > > > drm->dev->dev,
> > > >   				  dev->anon_inode->i_mapping,
> > > >   				  dev->vma_offset_manager,
> > > > -				  drm_need_swiotlb(drm-
> > > > > client.mmu.dmabits),
> > > > -				  drm->client.mmu.dmabits <=
> > > > 32);
> > > > +				  (struct
> > > > ttm_device_init_flags){
> > > > +					  .use_dma_alloc =
> > > > +					  drm_need_swiotlb(drm-
> > > > > client.mmu.dmabits),
> > > > +					  .use_dma32 = (drm-
> > > > > client.mmu.dmabits <= 32)
> > > > +				  });
> > > >   	if (ret) {
> > > >   		NV_ERROR(drm, "error initialising bo driver,
> > > > %d\n", ret);
> > > >   		return ret;
> > > > diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c
> > > > b/drivers/gpu/drm/qxl/qxl_ttm.c
> > > > index 765a144cea14..ced4c60c4650 100644
> > > > --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> > > > +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> > > > @@ -196,7 +196,7 @@ int qxl_ttm_init(struct qxl_device *qdev)
> > > >   	r = ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver,
> > > > NULL,
> > > >   			    qdev->ddev.anon_inode->i_mapping,
> > > >   			    qdev->ddev.vma_offset_manager,
> > > > -			    false, false);
> > > > +			    (struct ttm_device_init_flags){});
> > > >   	if (r) {
> > > >   		DRM_ERROR("failed initializing buffer object
> > > > driver(%d).\n", r);
> > > >   		return r;
> > > > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
> > > > b/drivers/gpu/drm/radeon/radeon_ttm.c
> > > > index 69d0c12fa419..2915473e4956 100644
> > > > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > > > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > > > @@ -684,8 +684,10 @@ int radeon_ttm_init(struct radeon_device
> > > > *rdev)
> > > >   	r = ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver,
> > > > rdev->dev,
> > > >   			       rdev_to_drm(rdev)->anon_inode-
> > > > > i_mapping,
> > > >   			       rdev_to_drm(rdev)-
> > > > > vma_offset_manager,
> > > > -			       rdev->need_swiotlb,
> > > > -			       dma_addressing_limited(&rdev-
> > > > >pdev-
> > > > > dev));
> > > > +			       (struct ttm_device_init_flags){
> > > > +					.use_dma_alloc = rdev-
> > > > > need_swiotlb,
> > > > +					.use_dma32 =
> > > > dma_addressing_limited(&rdev->pdev->dev)
> > > > +				});
> > > >   	if (r) {
> > > >   		DRM_ERROR("failed initializing buffer object
> > > > driver(%d).\n", r);
> > > >   		return r;
> > > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > index f0a7eb62116c..8a2ab90c6e8f 100644
> > > > --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > @@ -251,7 +251,7 @@ static void ttm_bo_unreserve_basic(struct
> > > > kunit
> > > > *test)
> > > >   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev),
> > > > GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   	priv->ttm_dev = ttm_dev;
> > > >   
> > > > @@ -290,7 +290,7 @@ static void ttm_bo_unreserve_pinned(struct
> > > > kunit *test)
> > > >   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev),
> > > > GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   	priv->ttm_dev = ttm_dev;
> > > >   
> > > > @@ -342,7 +342,7 @@ static void ttm_bo_unreserve_bulk(struct
> > > > kunit
> > > > *test)
> > > >   	resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   	priv->ttm_dev = ttm_dev;
> > > >   
> > > > @@ -394,7 +394,7 @@ static void ttm_bo_put_basic(struct kunit
> > > > *test)
> > > >   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev),
> > > > GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   	priv->ttm_dev = ttm_dev;
> > > >   
> > > > @@ -437,7 +437,7 @@ static void ttm_bo_put_shared_resv(struct
> > > > kunit
> > > > *test)
> > > >   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev),
> > > > GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   	priv->ttm_dev = ttm_dev;
> > > >   
> > > > @@ -477,7 +477,7 @@ static void ttm_bo_pin_basic(struct kunit
> > > > *test)
> > > >   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev),
> > > > GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   	priv->ttm_dev = ttm_dev;
> > > >   
> > > > @@ -512,7 +512,7 @@ static void ttm_bo_pin_unpin_resource(struct
> > > > kunit *test)
> > > >   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev),
> > > > GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   	priv->ttm_dev = ttm_dev;
> > > >   
> > > > @@ -563,7 +563,7 @@ static void
> > > > ttm_bo_multiple_pin_one_unpin(struct kunit *test)
> > > >   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev),
> > > > GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   	priv->ttm_dev = ttm_dev;
> > > >   
> > > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > > b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > > index 1adf18481ea0..c69b9707e6d2 100644
> > > > --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > > +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > > @@ -1044,7 +1044,8 @@ static void
> > > > ttm_bo_validate_busy_domain_evict(struct kunit *test)
> > > >   	 */
> > > >   	ttm_device_fini(priv->ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init_bad_evict(test->priv, priv-
> > > > > ttm_dev, false, false);
> > > > +	err = ttm_device_kunit_init_bad_evict(test->priv, priv-
> > > > > ttm_dev,
> > > > +					      (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   
> > > >   	ttm_mock_manager_init(priv->ttm_dev, mem_type,
> > > > MANAGER_SIZE);
> > > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> > > > b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> > > > index 1621903818e5..9415c7b76e3b 100644
> > > > --- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> > > > +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> > > > @@ -25,7 +25,7 @@ static void ttm_device_init_basic(struct kunit
> > > > *test)
> > > >   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev),
> > > > GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   
> > > >   	KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs,
> > > > &ttm_dev_funcs);
> > > > @@ -55,7 +55,8 @@ static void ttm_device_init_multiple(struct
> > > > kunit
> > > > *test)
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
> > > >   
> > > >   	for (i = 0; i < num_dev; i++) {
> > > > -		err = ttm_device_kunit_init(priv, &ttm_devs[i],
> > > > false, false);
> > > > +		err = ttm_device_kunit_init(priv, &ttm_devs[i],
> > > > +					    (struct
> > > > ttm_device_init_flags){});
> > > >   		KUNIT_ASSERT_EQ(test, err, 0);
> > > >   
> > > >   		KUNIT_EXPECT_PTR_EQ(test,
> > > > ttm_devs[i].dev_mapping,
> > > > @@ -81,7 +82,7 @@ static void ttm_device_fini_basic(struct kunit
> > > > *test)
> > > >   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev),
> > > > GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   
> > > >   	man = ttm_manager_type(ttm_dev, TTM_PL_SYSTEM);
> > > > @@ -109,7 +110,7 @@ static void ttm_device_init_no_vma_man(struct
> > > > kunit *test)
> > > >   	vma_man = drm->vma_offset_manager;
> > > >   	drm->vma_offset_manager = NULL;
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_EXPECT_EQ(test, err, -EINVAL);
> > > >   
> > > >   	/* Bring the manager back for a graceful cleanup */
> > > > @@ -162,9 +163,10 @@ static void ttm_device_init_pools(struct
> > > > kunit
> > > > *test)
> > > >   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev),
> > > > GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(priv, ttm_dev,
> > > > -				    params->use_dma_alloc,
> > > > -				    params->use_dma32);
> > > > +	err = ttm_device_kunit_init(priv, ttm_dev, (struct
> > > > ttm_device_init_flags){
> > > > +			.use_dma_alloc = params->use_dma_alloc,
> > > > +			.use_dma32 = params->use_dma32
> > > > +		});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   
> > > >   	pool = &ttm_dev->pool;
> > > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > > b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > > index b91c13f46225..24706fabb1c9 100644
> > > > --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > > +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > > @@ -114,8 +114,7 @@ static void bad_evict_flags(struct
> > > > ttm_buffer_object *bo,
> > > >   
> > > >   static int ttm_device_kunit_init_with_funcs(struct
> > > > ttm_test_devices *priv,
> > > >   					    struct ttm_device
> > > > *ttm,
> > > > -					    bool use_dma_alloc,
> > > > -					    bool use_dma32,
> > > > +					    const struct
> > > > ttm_device_init_flags flags,
> > > >   					    struct
> > > > ttm_device_funcs *funcs)
> > > >   {
> > > >   	struct drm_device *drm = priv->drm;
> > > > @@ -124,7 +123,7 @@ static int
> > > > ttm_device_kunit_init_with_funcs(struct ttm_test_devices *priv,
> > > >   	err = ttm_device_init(ttm, funcs, drm->dev,
> > > >   			      drm->anon_inode->i_mapping,
> > > >   			      drm->vma_offset_manager,
> > > > -			      use_dma_alloc, use_dma32);
> > > > +			      flags);
> > > >   
> > > >   	return err;
> > > >   }
> > > > @@ -140,11 +139,9 @@ EXPORT_SYMBOL_GPL(ttm_dev_funcs);
> > > >   
> > > >   int ttm_device_kunit_init(struct ttm_test_devices *priv,
> > > >   			  struct ttm_device *ttm,
> > > > -			  bool use_dma_alloc,
> > > > -			  bool use_dma32)
> > > > +			  const struct ttm_device_init_flags
> > > > flags)
> > > >   {
> > > > -	return ttm_device_kunit_init_with_funcs(priv, ttm,
> > > > use_dma_alloc,
> > > > -						use_dma32,
> > > > &ttm_dev_funcs);
> > > > +	return ttm_device_kunit_init_with_funcs(priv, ttm,
> > > > flags,
> > > > &ttm_dev_funcs);
> > > >   }
> > > >   EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
> > > >   
> > > > @@ -159,11 +156,10 @@ EXPORT_SYMBOL_GPL(ttm_dev_funcs_bad_evict);
> > > >   
> > > >   int ttm_device_kunit_init_bad_evict(struct ttm_test_devices
> > > > *priv,
> > > >   				    struct ttm_device *ttm,
> > > > -				    bool use_dma_alloc,
> > > > -				    bool use_dma32)
> > > > +				    const struct
> > > > ttm_device_init_flags flags)
> > > >   {
> > > > -	return ttm_device_kunit_init_with_funcs(priv, ttm,
> > > > use_dma_alloc,
> > > > -						use_dma32,
> > > > &ttm_dev_funcs_bad_evict);
> > > > +	return ttm_device_kunit_init_with_funcs(priv, ttm,
> > > > flags,
> > > > +						&ttm_dev_funcs_b
> > > > ad
> > > > _evict);
> > > >   }
> > > >   EXPORT_SYMBOL_GPL(ttm_device_kunit_init_bad_evict);
> > > >   
> > > > @@ -249,7 +245,7 @@ struct ttm_test_devices
> > > > *ttm_test_devices_all(struct kunit *test)
> > > >   	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev),
> > > > GFP_KERNEL);
> > > >   	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> > > >   
> > > > -	err = ttm_device_kunit_init(devs, ttm_dev, false,
> > > > false);
> > > > +	err = ttm_device_kunit_init(devs, ttm_dev, (struct
> > > > ttm_device_init_flags){});
> > > >   	KUNIT_ASSERT_EQ(test, err, 0);
> > > >   
> > > >   	devs->ttm_dev = ttm_dev;
> > > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> > > > b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> > > > index c7da23232ffa..fbf0d3984f25 100644
> > > > --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> > > > +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> > > > @@ -28,12 +28,10 @@ struct ttm_test_devices {
> > > >   /* Building blocks for test-specific init functions */
> > > >   int ttm_device_kunit_init(struct ttm_test_devices *priv,
> > > >   			  struct ttm_device *ttm,
> > > > -			  bool use_dma_alloc,
> > > > -			  bool use_dma32);
> > > > +			  const struct ttm_device_init_flags
> > > > flags);
> > > >   int ttm_device_kunit_init_bad_evict(struct ttm_test_devices
> > > > *priv,
> > > >   				    struct ttm_device *ttm,
> > > > -				    bool use_dma_alloc,
> > > > -				    bool use_dma32);
> > > > +				    const struct
> > > > ttm_device_init_flags flags);
> > > >   struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
> > > >   					    struct
> > > > ttm_test_devices *devs,
> > > >   					    size_t size,
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> > > > b/drivers/gpu/drm/ttm/ttm_device.c
> > > > index e7cc4954c1bc..0c85d10e5e0b 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > > > @@ -174,8 +174,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
> > > >    * @dev: The core kernel device pointer for DMA mappings and
> > > > allocations.
> > > >    * @mapping: The address space to use for this bo.
> > > >    * @vma_manager: A pointer to a vma manager.
> > > > - * @use_dma_alloc: If coherent DMA allocation API should be
> > > > used.
> > > > - * @use_dma32: If we should use GFP_DMA32 for device memory
> > > > allocations.
> > > > + * @flags: Flags governing the device behaviour.
> > > >    *
> > > >    * Initializes a struct ttm_device:
> > > >    * Returns:
> > > > @@ -184,7 +183,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
> > > >   int ttm_device_init(struct ttm_device *bdev, const struct
> > > > ttm_device_funcs *funcs,
> > > >   		    struct device *dev, struct address_space
> > > > *mapping,
> > > >   		    struct drm_vma_offset_manager *vma_manager,
> > > > -		    bool use_dma_alloc, bool use_dma32)
> > > > +		    const struct ttm_device_init_flags flags)
> > > >   {
> > > >   	struct ttm_global *glob = &ttm_glob;
> > > >   	int ret, nid;
> > > > @@ -212,7 +211,7 @@ int ttm_device_init(struct ttm_device *bdev,
> > > > const struct ttm_device_funcs *func
> > > >   	else
> > > >   		nid = NUMA_NO_NODE;
> > > >   
> > > > -	ttm_pool_init(&bdev->pool, dev, nid, use_dma_alloc,
> > > > use_dma32);
> > > > +	ttm_pool_init(&bdev->pool, dev, nid,
> > > > flags.use_dma_alloc,
> > > > flags.use_dma32);
> > > >   
> > > >   	bdev->vma_manager = vma_manager;
> > > >   	spin_lock_init(&bdev->lru_lock);
> > > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > > > b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > > > index cf7a89d002e4..7ff7e5d7a9f3 100644
> > > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> > > > @@ -1049,8 +1049,8 @@ static int vmw_driver_load(struct
> > > > vmw_private
> > > > *dev_priv, u32 pci_id)
> > > >   			      dev_priv->drm.dev,
> > > >   			      dev_priv->drm.anon_inode-
> > > > >i_mapping,
> > > >   			      dev_priv->drm.vma_offset_manager,
> > > > -			      dev_priv->map_mode ==
> > > > vmw_dma_alloc_coherent,
> > > > -			      false);
> > > > +			      (struct ttm_device_init_flags)
> > > > +			      {.use_dma_alloc = (dev_priv-
> > > > > map_mode == vmw_dma_alloc_coherent)});
> > > >   	if (unlikely(ret != 0)) {
> > > >   		drm_err(&dev_priv->drm,
> > > >   			"Failed initializing TTM buffer object
> > > > driver.\n");
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > b/drivers/gpu/drm/xe/xe_device.c
> > > > index 09a7ad830e69..f9317f56ff9c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -320,7 +320,8 @@ struct xe_device *xe_device_create(struct
> > > > pci_dev *pdev,
> > > >   
> > > >   	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe-
> > > > > drm.dev,
> > > >   			      xe->drm.anon_inode->i_mapping,
> > > > -			      xe->drm.vma_offset_manager, false,
> > > > false);
> > > > +			      xe->drm.vma_offset_manager,
> > > > +			      (struct ttm_device_init_flags){});
> > > >   	if (WARN_ON(err))
> > > >   		goto err;
> > > >   
> > > > diff --git a/include/drm/ttm/ttm_device.h
> > > > b/include/drm/ttm/ttm_device.h
> > > > index c22f30535c84..1534bd946c78 100644
> > > > --- a/include/drm/ttm/ttm_device.h
> > > > +++ b/include/drm/ttm/ttm_device.h
> > > > @@ -287,10 +287,20 @@ static inline void
> > > > ttm_set_driver_manager(struct ttm_device *bdev, int type,
> > > >   	bdev->man_drv[type] = manager;
> > > >   }
> > > >   
> > > > +/**
> > > > + * struct ttm_device_init_flags - Flags for ttm device creation
> > > > + */
> > > > +struct ttm_device_init_flags {
> > > > +	/** @use_dma_alloc: Whether coherent DMA allocation API
> > > > should be used. */
> > > > +	u32 use_dma_alloc : 1;
> > > > +	/** @use_dma32: If we should use GFP_DMA32 for device
> > > > memory allocations. */
> > > > +	u32 use_dma32 : 1;
> > > > +};
> > > > +
> > > >   int ttm_device_init(struct ttm_device *bdev, const struct
> > > > ttm_device_funcs *funcs,
> > > >   		    struct device *dev, struct address_space
> > > > *mapping,
> > > >   		    struct drm_vma_offset_manager *vma_manager,
> > > > -		    bool use_dma_alloc, bool use_dma32);
> > > > +		    const struct ttm_device_init_flags flags);
> > > >   void ttm_device_fini(struct ttm_device *bdev);
> > > >   void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
> > > >   
> > > 
> > 
> 
