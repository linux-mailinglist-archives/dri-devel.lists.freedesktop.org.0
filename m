Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42659AD6DEA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 12:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A8610E7CB;
	Thu, 12 Jun 2025 10:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDwdPnP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA96910E7C5;
 Thu, 12 Jun 2025 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749724527; x=1781260527;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VxPMnwXC5uwLu18cudiQYjeo23dtXvrufeGxkRcdFyk=;
 b=RDwdPnP083d9JTvC3pRyzdn25iH50Qsl8oc567SadafBcQ5GLu3USRVV
 c5z+QLjFBrshmMPFDFfj5enF5+ZsNMaoNAT6r397WmlKk9zGsno4YwZSb
 lVd2YIEuUSI/NdX5FSYFt+zns7mTnC+rIFsvo5Pd6CMCVrBizUdNCB/E6
 dOVAFMYyOynLZYcbrKnVsB7boBo2h6JHJiTi5i/l2pO9pINmq78UunYmT
 qNd7Bg6qFrOeJVpFj7dc59VTj+oOXEFxG9KUvvNwbYDnNeqLFoLv2azsg
 fGwzfYad7c7fPcG7mvH4evkrAZD4Mvt9F+Q0grGoITFuQcOvZ4JCQheTN g==;
X-CSE-ConnectionGUID: P7GFcIP9TD69Gh8ry8V/ng==
X-CSE-MsgGUID: CLcg6VWgT/eNTTSl7MfhvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="74430008"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="74430008"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:35:22 -0700
X-CSE-ConnectionGUID: HNqhSsD7SAK41rCSALXqWw==
X-CSE-MsgGUID: VxORH/9xTKGgqb3YAHVRbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152758990"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:35:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:35:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 03:35:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.40)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWqo/JWCJAy0PbcyUHU9b+5XNXBGWHQghj+ijsj/8iZ4PbH7qUiijtxdimKL+C8UqxEA/Ar6hR4j3kjLwo/AHBs030jiH4hMpXOIasqJpv/v8idv2ORtS7GF6Sq4eLQVc4OxPy3fTd/IhrdPDSvsI0PgB0gBKmn8eALD/gO5Oifm9HuzTJZ9A6VAT6YI2CnURSkJqmpYdkfHpADdNa3FrIjmqwUie8IoFk4Ud9VVSNgib9jKrmBkmItE9LuhbFyxUjrkLnnv94kWsWYKRVz+vCkzRalsB6S9zh9/QMRWg8PVVNeJywwBWMmhMsAvwiawFq8kyMjKNisLDW0E+hPhbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o42maQJnG+35ELyn8cpt3VtSniOsLNargQw/8KStVPY=;
 b=i4NimejNYBqxVyD5LQIfq0+rMTao9JkkLgm7iSVIeFmsArQvCNwN1zjbjf/gRNd7OZ87dmNv7j68KGuGrGdi+jPhpLjw6aw17r6N8JhHBS1yZ7MSrEq36KQdMgBeDguf7N7S69ec5MFEHPm5q/DYEIoOXjM5IbxDV2WNp4cdEN8cuP88H+l/OzBO7D8R+JE6vcxj7W2n2Jtn5TCcDZWe3LRsNo6DkhYSesizZC0q73OCU0YYJGkjAza8l+6U6iVAPQrJ6QE/sE6k7aNgUVdvKfys3LU/YBnIoERf8/8aDTFv0H15cS+bPt3yNSxev9C6HTfUKC2bH5stn5Zq3gDTlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH8PR11MB8285.namprd11.prod.outlook.com (2603:10b6:510:1c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Thu, 12 Jun
 2025 10:35:13 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 10:35:13 +0000
Message-ID: <d4497be8-3536-47a4-99b9-58b5f1468172@intel.com>
Date: Thu, 12 Jun 2025 16:05:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] drm/xe/xe_late_bind_fw: Initialize late binding
 firmware
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-5-badal.nilawar@intel.com>
 <18e1fbea-497a-4a54-94f5-57174ca58119@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <18e1fbea-497a-4a54-94f5-57174ca58119@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH8PR11MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3dc261-3872-42b8-6c14-08dda99ccfb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1A4Qmh3Uk5pbFExWGVNbHN3YmdQL1VOUlpJanBRNGN6SEM5bjl2K3dDdWRI?=
 =?utf-8?B?NlFUby9iM3Fma2ZFRko0K1FubW1BbkZveUZPdkZSKzhqbkg5aUROcFhXeTdY?=
 =?utf-8?B?dEVodEE2Mm1YbU1weE1NTzl0enJyWHFGUm1lTUtJMVFOT05oWTJuQUk5Sm9C?=
 =?utf-8?B?Mks2UWs1VHZyMUQrUjgvemJzeFlmNE5MaTRUZHVLZDErM01oUnJxS1hYV0tR?=
 =?utf-8?B?ek1kM0FvMmordktTSEF2ZldnRWcrWWdIVzdZcEF2ZndFTlVQWWpqQUh6dE1l?=
 =?utf-8?B?UUFibStMWW5NcmU2VlZ0UlZldlc0K3Z2MDY5T3QvWEhnRWlNaCtCNWpFa0R0?=
 =?utf-8?B?UnRtYTgyUDVvRHhxeHU0dXZUTFQ5YU43cGRGVGFnZjRvQytPcnVqNkkzVTZK?=
 =?utf-8?B?Rm1XSkxMOWd3VlNTUHFiN2hkRXF6RG55Z3NRUFF4R0U2M3RYMUtHMFQ1cXdR?=
 =?utf-8?B?d3F0YnhuRDA3RHlXZlQzL25DSjNSLzZKQWgxNjhhYU14MFVaRE8yZ1V6eVd5?=
 =?utf-8?B?YmJTdjRXa1RBa0E4d2hVZkx5aWszdzVONVJmSW83cG1LeXVYbW85ajJoKzF5?=
 =?utf-8?B?Y0NjMWlmUGtPREhxRG8zT21McjBUWHRkUzZPZlp6M3lZS1ZDQktnT05qTUZO?=
 =?utf-8?B?REd4NEtOUFVVYkxEbEF6QTJUSjhYZlpQWDZhajYxeXIxdmI1NG1JS1R0VG5o?=
 =?utf-8?B?Mk5sYWxoWHJFbmV6ZzJBYlBPaFJCVkNmd3phd1d1SjEvV0JlRFZsaVo2aXR0?=
 =?utf-8?B?RFZ3MGtSa1Z5V0xITGZPRmtvalAyZmF5b3hRWjdIWHBZMmFhUWFnSk1CTUpE?=
 =?utf-8?B?OHlwN20xSUxXcmsvQkVQVHJlNXZOUG5KcE9CZ253NkNxMHVabjd4dDJOWVhK?=
 =?utf-8?B?M1I1QVpXWTVEQ3RmR0ZMd1FxMWR0YUQwWHh4SGwxUFlWSG5WZVRPSGRHOGJU?=
 =?utf-8?B?a1dKanNTN2N0NUY5cDRpN1hnYlNkVXBCeFB4R2d4M1JodldGYWdHdUZMcGNs?=
 =?utf-8?B?S1FCbFNud09lenptbWRBS0s2NlB0dE9QcmJ2bm5CZWxkbnJwU0VnL29xb085?=
 =?utf-8?B?dk5VM0cvKzVuR28yU0hteUF4dGZiTWtKVUtnVHhGcUxwZm1XQ2FzRncrYzhC?=
 =?utf-8?B?NFE1YXB6Q0Z1M0RuaDRlSXcrRys1UUlha1hPRjZ3WmgyaytJSHluUFRMQ2F0?=
 =?utf-8?B?elU3dDZNbWpvMUlwNlBkc28wZWFlVExrZ1N3NTIveGE0MXRJWThMYldkU3B0?=
 =?utf-8?B?Q29vdld0a2o4L2VIbEJ3SW01QTF3Q3orNkltWkNnKzZWUm01ZHQ0bTMxajRL?=
 =?utf-8?B?dnAvU3pIbkZOcm45NXNsdUREcnFENTIwVnN1RWxaTHRNUWQyM2p1RmZVZTFG?=
 =?utf-8?B?U2s0eG12Smxza3ZjSk5yWDl3WG01YUhUK3oyMWVLdHdoMHg1L29SeEtYZnkw?=
 =?utf-8?B?MW1YSzNHZmhkWFRQUXBzcmhKOGF6eGJwb2w4dDRtMnBmWkptZjdBRm5XZjdF?=
 =?utf-8?B?UFBGQWZhazdGK1REaVNOQUhaRmpIelllNlUra05EcUExY3ZIaVRHQmF2Zzcy?=
 =?utf-8?B?b1laakhndFMrZElqd3l0NUJrZkJ6MzczTVhHNU5hUzlHQ1pXQzBza1V6eENn?=
 =?utf-8?B?Q0lhMWhNVENvVWtLa2FBVFlPdjE2UU5MR3NIVzhEQXRDVjB6T0pacDhLMVB3?=
 =?utf-8?B?c2Z0YVQyUDN1QzZMdlJsYm9EQ2NESVd5RjBROWpmOHcvQXhEaFhreGxZYWhH?=
 =?utf-8?B?My9KUHJWeVdvL08xRkZhMWRUK3hzYXFqUms1aVhQTmNOODl6VmJJdWFCZmlF?=
 =?utf-8?B?UjJ6MkN2K0N3a05mZXpZWXhzTXUveTY0MUdCbXBTMTkzSFBIbmtpWnFoODRT?=
 =?utf-8?B?R2xPL2dZZDVLMDlzYm9uT1BaOVhJTXhzZjUwM3NicWs3OFZObnF1bC9CZmRU?=
 =?utf-8?Q?TWY8ahQ3w8s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk9PRXpnU2V5bllacTRDT3RmM1Nlc2hTQ2VzVXJkWGlTU0Z4amtsWnErY1JS?=
 =?utf-8?B?S2Q4ZWRvcmxNcFBnYzlHY3pNMERSMjZnNkFlTllYQ3FKMTdlWEs3a0poZURj?=
 =?utf-8?B?VHpPWHZjZmI3dlVnMnFNODdXdkhpZ2Q3UGlHVzYxbEZLK1RNM2Zldk9RS1lR?=
 =?utf-8?B?QUd0UWNaRk5zTGJOdlU4T05BSHlGY0lsODJwZ2RMWnVDNy9EM2xvWWdoUFBY?=
 =?utf-8?B?UnBhR25wWFdJek9ra08wZ0NGSmYrN2UvaTJPaVVRODlqcy8ySk5OOWdaemUz?=
 =?utf-8?B?SHJoZFR5MHVRTUo5dFpTUlFMR09XQ25wa2FFeFJKVC8xMzNMcUJuWUFMMUFX?=
 =?utf-8?B?cElrdWNwK0E3YUlJVXozYSs3YmpQaTg5N0FETUVtZ0NwMm1TL3FFS2pNT2Fw?=
 =?utf-8?B?RUxCR1pQQkJqTDNJSzNHRmJKOWN0S2RGMFU0MW5IcURhZXIzaVlXZml0dlhM?=
 =?utf-8?B?S3V3M0lRdktDYjNaaVRoZXNQNUwvUmU3aDB5dkN3dHZCNVNuNUdOekE5U0lw?=
 =?utf-8?B?T0cxNXc3dTVXUSt2SXpjQUtkWmsxZm5rRFZrN3BnT2U3cUwyYkdVazNEQWQx?=
 =?utf-8?B?QVY2RzczSlhwbFlNUkN6amFORTBtcXdCcGd1bGZLb2NERDUrdXFZNEVTb2xh?=
 =?utf-8?B?Zjg2NmROckFCdThUM25tcW5oL2ltZktPZlp4Y2VvRkE4R1VFdllHcGtyTEU1?=
 =?utf-8?B?ZjZlRmV2OXBJZ1JRNVA4Q1ZYWkZScHFWWmJzT2JHcERETjZsOHdzaFViRnlh?=
 =?utf-8?B?QUtDTGdOdVlnYzg0SVhTaFlDb3RTdHNmYVlEVGJpbTd5WXhYYTFDaEJvYnFr?=
 =?utf-8?B?TWtjTUpnM25uVUgxWXk4cHpFSHo5bWtRcnVmR0FrNG16VlZzUUFNV3pTQzhp?=
 =?utf-8?B?QXpaMWNPN3d0c09lTmtrUGt0UkYwM3g5Yi9qZS9SWjl3RlVOY2xDUXNIbUtS?=
 =?utf-8?B?Y1FONVlqZ0lER2V3N0RSZFJqUW9lazQvU044QmlpdmM0QXZtQ3pSMHpGQ04x?=
 =?utf-8?B?bXJFak1Ba1FZYTdqa0dyMFd5dEZManVXMGduTHM5aFZzeFA4bkp4TUxSei85?=
 =?utf-8?B?RVluNDRNbjZ2WHpxR1dXR1Z2aGhXVC9rUDBpRG5HUC9mNU9kQzNjNVhxaFVK?=
 =?utf-8?B?eG5GODhCWHpoUS9KMjVVZ3BWN2loZldUSHVNTzZrTjRVVFowTzB1RjNBOGpC?=
 =?utf-8?B?bWlFMS9KM01NNWVoUG1vdXpUOFlLWjUrU3gweUk2MldlQW9YRE14ZzdVeEdr?=
 =?utf-8?B?VHRVcUNwclBiUmZoMThJSk1yWFNTbEpqUkl5SG9qRWVLSW55cXRMUWxFWEJX?=
 =?utf-8?B?OWpkZFpTSTdTTFp6MTZtUzRJaUpYM1ZMa1BTM3ljR0FsQzJKS3NDcGhTY2pP?=
 =?utf-8?B?SXlneVJxUW1sQVpsMjdCSWhPQnFpOGRjSXNwTU01RENldkN3Mm4vbEJEeU0x?=
 =?utf-8?B?WVF2US9TZFhIcGkxZ1kxQnAwMU5BdlVwdWtRanBaeGIvcUgvNFR3WktJQWxI?=
 =?utf-8?B?QXVoSzBqVzBjemVpVk5IeXJCeGdtQ29hZjRzQTd2clZLQ0JBZzl2VVRFb1hE?=
 =?utf-8?B?M1lMTXVJV0ZtYWpubklwRUZMbW9ZQlM4amw5ZHlXb2c4QWIxbEdlaUdaTDZm?=
 =?utf-8?B?TkVoZ3JXTmo5TFR1cThSbEdoL2dyd0hyOFVTd2sxOCtjVm83RnlLUm84T0xK?=
 =?utf-8?B?dEp5YTQydGlqR0YrdU1ubUVyRlJoQmdoUW1DcGhMQW50L29yV2JMUkdGTEc4?=
 =?utf-8?B?YjVYNmkrSXB0bUxmbTRyY2ZEdS91ck1OdVNWU2taV0FYS25jdnM0ZU9QUEhy?=
 =?utf-8?B?TE1FQzhTTDY5WmZMdldlc0tMaDI1RlhJa1ZnZlVHUmFtYjhkVVBVa25NbGFZ?=
 =?utf-8?B?bkxWMGJ2bUZQQmtDUmtwSExzOGUzOGU2MjhKbzM0SUlnK0NaaDM2VlU5TmFr?=
 =?utf-8?B?cm9yUFRZa2hlRk9CbmVFOWxKR1BKQXFXVzJQNnBtR2JlaXQ3eFpxUVRTV0tr?=
 =?utf-8?B?bUFCWEhmUUV1RXZPeWFPVXROcGM0djlwV3ptazcyZzM4WXFnQkR3NjErbWx6?=
 =?utf-8?B?ajl5N0tOL0VOZkNVUUR2dFE5ZXlRMUltM2M4dnEvcFZlQUlqQXVMcDA0R0J2?=
 =?utf-8?B?aHFBQXdqcnhRRDYxRGxyQWtKMU1LZ2prWWVNMG1ScUQxa1B2UWk0aGQrNFdy?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3dc261-3872-42b8-6c14-08dda99ccfb8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 10:35:13.1344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBwxb+kGOv0O5Piu5X/8ujS4rHZI/6WnvpEt1VZ120aEWrk5r0eAu6upWPtc3jPW89VmUeLI3Ltfk/qFhbRQ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8285
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


On 11-06-2025 05:36, Daniele Ceraolo Spurio wrote:
>
>
> On 6/6/2025 10:57 AM, Badal Nilawar wrote:
>> Search for late binding firmware binaries and populate the meta data of
>> firmware structures.
>>
>> v2:
>>   - drm_err if firmware size is more than max pay load size (Daniele)
>>   - s/request_firmware/firmware_request_nowarn/ as firmware will
>>     not be available for all possible cards (Daniele)
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c             |  2 +
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 86 +++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_late_bind_fw.h       |  1 +
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 37 ++++++++++
>>   4 files changed, 124 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index e062ddaa83bb..df4b0e038a6d 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -891,6 +891,8 @@ int xe_device_probe(struct xe_device *xe)
>>         xe_late_bind_init(&xe->late_bind);
>>   +    xe_late_bind_fw_init(&xe->late_bind);
>
> I still think this should be called from xe_late_bind_init(). You also 
> need to check the return code.
Sure, I will move this to xe_late_bind_init.
>
>> +
>>       err = xe_oa_init(xe);
>>       if (err)
>>           return err;
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 22eb9b51b4ee..0231f3dcfc18 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -5,6 +5,7 @@
>>     #include <linux/component.h>
>>   #include <linux/delay.h>
>> +#include <linux/firmware.h>
>>     #include <drm/drm_managed.h>
>>   #include <drm/intel/i915_component.h>
>> @@ -13,13 +14,94 @@
>>     #include "xe_device.h"
>>   #include "xe_late_bind_fw.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>   -static struct xe_device *
>> -late_bind_to_xe(struct xe_late_bind *late_bind)
>
> nit: might be worth modifying the previous patch to have this 
> introduced in 1 line instead of modifying it here, to keep the diff 
> cleaner.
Ok,
>
>> +static const char * const fw_type_to_name[] = {
>> +        [CSC_LATE_BINDING_TYPE_FAN_CONTROL] = "fan_control",
>> +    };
>> +
>> +static struct xe_device *late_bind_to_xe(struct xe_late_bind 
>> *late_bind)
>>   {
>>       return container_of(late_bind, struct xe_device, late_bind);
>>   }
>>   +static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> +    u32 uval;
>> +
>> +    if (!xe_pcode_read(root_tile,
>> +               PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), 
>> &uval, NULL))
>> +        return uval;
>> +    else
>> +        return 0;
>> +}
>> +
>> +static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +    struct xe_late_bind_fw *lb_fw;
>> +    const struct firmware *fw;
>> +    u32 num_fans;
>> +    int ret;
>> +
>> +    if (!late_bind->component_added)
>> +        return 0;
>> +
>> +    lb_fw = &late_bind->late_bind_fw;
>> +
>> +    lb_fw->type = type;
>
> Should we validate that "type" is sane?
You mean if type is not max supported type. Sure, I will add.
>
>> +    lb_fw->valid = false;
>> +
>> +    if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
>> +        num_fans = late_bind_fw_num_fans(late_bind);
>> +        drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
>> +        if (!num_fans)
>> +            return 0;
>> +    }
>> +
>> +    lb_fw->flags = CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
>> +
>> +    snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), 
>> "xe/%s_8086_%04x_%04x_%04x.bin",
>> +         fw_type_to_name[type], pdev->device,
>> +         pdev->subsystem_vendor, pdev->subsystem_device);
>> +
>> +    drm_dbg(&xe->drm, "Request late binding firmware %s\n", 
>> lb_fw->blob_path);
>> +    ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
>> +    if (ret) {
>> +        drm_dbg(&xe->drm, "Failed to request %s\n", lb_fw->blob_path);
>
> This log still seems like an error when it's actually an ok outcome. 
> Maybe change it to something like:
>
> drm_dbg("%s late binding fw not available for current device", 
> fw_type_to_name[type])
Ok,
>
>> +        return 0;
>> +    }
>> +
>> +    if (fw->size > MAX_PAYLOAD_SIZE) {
>> +        lb_fw->payload_size = MAX_PAYLOAD_SIZE;
>
> Why are we even setting payload_size here?
>
>> +        drm_err(&xe->drm, "Firmware %s size %zu is larger than max 
>> pay load size %u\n",
>> +            lb_fw->blob_path, fw->size, MAX_PAYLOAD_SIZE);
>> +        return 0;
>
> Maybe add a comment to explain why we don't return an error here (if 
> this was indeed on purpose).
> Also, you're not calling release_firmware() when exiting from here.

I will fix this. In fact I will return error here, as firmware is found 
but is of incorrect size.

>
>> +    }
>> +
>> +    lb_fw->payload_size = fw->size;
>> +
>> +    memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>> +    release_firmware(fw);
>> +    lb_fw->valid = true;
>> +
>> +    return 0;
>
> This function seems to return 0 from all return calls. Is that 
> intentional? if so, just switch to void.
>> +}
>> +
>> +/**
>> + * xe_mei_late_bind_fw_init() - Initialize late bind firmware
>> + *
>> + * Return: 0 if the initialization was successful, a negative errno 
>> otherwise.
>> + */
>> +int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>> +{
>> +    return late_bind_fw_init(late_bind, 
>> CSC_LATE_BINDING_TYPE_FAN_CONTROL);
>> +}
>> +
>>   static int xe_late_bind_component_bind(struct device *xe_kdev,
>>                          struct device *mei_kdev, void *data)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> index 4c73571c3e62..a8b47523b203 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -11,5 +11,6 @@
>>   struct xe_late_bind;
>>     int xe_late_bind_init(struct xe_late_bind *late_bind);
>> +int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index afa1917b5f51..c427e141c685 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -10,6 +10,41 @@
>>   #include <linux/mutex.h>
>>   #include <linux/types.h>
>>   +#define MAX_PAYLOAD_SIZE (1024 * 4)
>> +
>> +/**
>> + * xe_late_bind_fw_type - enum to determine late binding fw type
>> + */
>> +enum xe_late_bind_type {
>> +    CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1,
>> +};
>> +
>> +/**
>> + * Late Binding flags
>> + */
>> +enum csc_late_binding_flags {
>> +    /** Persistent across warm reset */
>> +    CSC_LATE_BINDING_FLAGS_IS_PERSISTENT = 0x1
>
> Should this be a define, since it is part of a bitmask of flags?
>> +};
>
> AFAIU those 2 enums are not internal to Xe and are defined as part of 
> CSC interface instead, but that's not clear here. IMO better to either 
> move them to a file in the abi folder, or at least make it extremely 
> clear that those values are CSC-defined. Moving then to 
> late_bind_mei_interface.h could also be an option since they're values 
> for that interface.
Fine I will move this to late_bind_mei_interface.h
>
>> +
>> +/**
>> + * struct xe_late_bind_fw
>> + */
>> +struct xe_late_bind_fw {
>> +    /** @late_bind_fw.valid */
>> +    bool valid;
>> +    /** @late_bind_fw.blob_path: late binding fw blob path */
>> +    char blob_path[PATH_MAX];
>> +    /** @late_bind_fw.type */
>> +    u32  type;
>> +    /** @late_bind_fw.flags */
>
> Missing descriptions for these 3 vars
I will fix this.
>
>> +    u32  flags;
>> +    /** @late_bind_fw.payload: to store the late binding blob */
>> +    u8  payload[MAX_PAYLOAD_SIZE];
>> +    /** @late_bind_fw.payload_size: late binding blob payload_size */
>
> if you only set payload_size when the fw init is successful you can 
> use it being non-zero as a valid check instead of having a dedicated 
> variable for that. not a blocker.
>
>> +    size_t payload_size;
>> +};
>> +
>>   /**
>>    * struct xe_late_bind_component - Late Binding services component
>>    * @mei_dev: device that provide Late Binding service.
>> @@ -34,6 +69,8 @@ struct xe_late_bind {
>>       bool component_added;
>>       /** @late_bind.mutex: protects the component binding and usage */
>>       struct mutex mutex;
>> +    /** @late_bind.late_bind_fw: late binding firmware */
>> +    struct xe_late_bind_fw late_bind_fw;
>
> The code seems to be designed from multiple type of late binding FW in 
> mind (hence the type), but here there is only one. Maybe switch this 
> to an array, even if it only has one entry for now. That way if we 
> need to extend it later we just increase the array size.

Yes, it is designed to support multiple types. In fact in previous 
implementation this was array only.  If ok I will move back to array 
based implementation and just Populate FAN type.

Regards,
Badal

>
> Daniele
>
>>   };
>>     #endif
>
