Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E787A96E43
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 16:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510D610E5C3;
	Tue, 22 Apr 2025 14:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsLOISU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A90310E2A0;
 Tue, 22 Apr 2025 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745331780; x=1776867780;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=16+KJPdPNXyxtQ19oghAtT58D6igs6RCJg0dEY1y2jw=;
 b=CsLOISU1oLcXjUK1hpWODqwEMMRGhJBA6w26B1gxAMjtplyYhoeqWnZH
 ZwHJ0z9GmH9W6qNDEvTqzd09LnPw0tPmRr+6exDgMYdFYla5kF2S1zPNw
 ZDZE0V3NikN8sXATUJzb2PZumqekpnQtKrcr4Ston0dx5reoWS0z15FRM
 cHbjru7Y7dMYiLdojWNEQmtFBxUhDYWYTv/+S2a/32uUoorE94WqSDQGZ
 miq0GzfKyP7l6eoNaBpq2o7MXcivbJBoTVwng+txE3Z1X8xOtNKNMP0U8
 mxJW19Sv6IUdbhNKjOZ+cJagCMLpqiFioO+2pB9aG7ZW4G3itXf2WFrwG A==;
X-CSE-ConnectionGUID: NhF/+Sa6RrSko3UCsJVI8A==
X-CSE-MsgGUID: z87sS8LJRa2a1BNQAbFoAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47023676"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="47023676"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 07:22:59 -0700
X-CSE-ConnectionGUID: pci1lNoXTx6OukNV1+3iEw==
X-CSE-MsgGUID: dcGVjAfgSGm3moXrG6lx8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="132345978"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 07:22:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 07:22:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 07:22:58 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 07:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpD83Cn1zhhoUOvpwJBFtISrjhYgQewj+/eWyrpkhtcvXrwqQE/gYLzEGvRMe7JO3E0MNlXO2TtYBxsNHSpOvenhkuqeQDpFh7XDb0iMgfmpaVm699OScd4MGSeiTO6+dcuqKENCvJxelHV70aD1GuhIPRR5h8IT+0KCicXc8MprJjmlJAkOrmC/+JfdNlz/PqaVWQmm/YkcrdNG331QeWxamoOyP4Xli22nIIEGB5VXt3ct9Qz9F35faZpmisDk4MjVUwqGwILRf0pndDwN2p2Vkv1CgbgcFhS+wf47naUlmo7piSSOp+WbFaaxcb5pB0BIn5q+u0EL8I8tUSvcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irdumMQUcAP6PLZ7Hue2GqgciC1eoqtWvZIzUgGgr/w=;
 b=ShUqFa/Ich4UOkQDUiwiSqIRfrCGB+YQnBwOjE6BWBJhrlqHsB++YVqfisKFAr31keiW7SOZrrhHkO9zIIVKnQSoSO8GRFswe3gyFvyRO0HBpu8Qnl0MuopOd0WR2R/FlrGpEBtiuBPCe7YJk6NCsZ+/vlXm6XJpeIqIJEknfcmlcq1CfOOrRpa9zfAPayWipBBaM4TZmvZjVLlqXoZBNn4hRdQnT8sKiKMZ80GLcjnpju298s/77LUBU9DjyZsrY10WFmYko00E8q6je5ZXHclBPjukJb74tJwdy4sPmHc5REz2ONMiXyvTw5166DBnjApVJ5HZf9g9BYERIZRRJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 22 Apr
 2025 14:22:50 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 14:22:50 +0000
Date: Tue, 22 Apr 2025 17:22:53 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v3 3/3] drm/i915/display: move min_hblank from dp_mst.c
 to dp.c
Message-ID: <aAemPYFn2QpUloHX@ideak-desk.fi.intel.com>
References: <20250417-hblank-v3-0-d3387df7efce@intel.com>
 <20250417-hblank-v3-3-d3387df7efce@intel.com>
 <SN7PR11MB67504C5B979B78C6076BA4BBE3BB2@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SN7PR11MB67504C5B979B78C6076BA4BBE3BB2@SN7PR11MB6750.namprd11.prod.outlook.com>
X-ClientProxiedBy: DB7PR02CA0035.eurprd02.prod.outlook.com
 (2603:10a6:10:52::48) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4551a0-fdc4-46fc-f24f-08dd81a928e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUoyMExlcStrLzRPN0JMckZLcFo1UVNLV095VElYZEkvaTZjc29TUFpNck81?=
 =?utf-8?B?ZkJYbmNuc1pWb1BHTW05ZktYMThiWEdiVk1LUjFlUGtKVkFLWFkxOHI4TUUv?=
 =?utf-8?B?NHpYZWQyR1UwU3NrRWlwbjJQSEc4dDJPeThZeHdXWTFuVWtEUDl1OG1jS2dj?=
 =?utf-8?B?NEg0dHVXTG4xdjAvRnY5UFlzSG13ZnhVMDBJZFo5TzMyVTlvNjYrQ2EwNTRq?=
 =?utf-8?B?RmV1SDNid1NGZUhWeUkyTy9rVkIvZGdhaHJQMGxkTER5SGRGQVFuQWdZVVkx?=
 =?utf-8?B?eWovWm8yb1E2SkQxSGQzTFhGSTVaNUlUdEFvaGhubXRMQnFoem4yRHJRL2Jj?=
 =?utf-8?B?TlJYVlFLTjVrais1dlVEaE9sQUR3cWVnMjBNYmtpR0p6c09DYzgwWWcxaWlk?=
 =?utf-8?B?eTFQKzFLcXNCbDNNdlg2bGI3UW5INGdQRXo4eExrK204eHYrZ1JKRnZCUlNE?=
 =?utf-8?B?MUtIRGdpaFRxOENHdk95N09MTVRXSnF6eFhXSVhPSlZucFNWbHF3VTNpK3Q0?=
 =?utf-8?B?ZzJySjhhdTR4K2grU0k1OE9oQzBjVm9DTERjanFxY3pWRHE2NUcxdUl1RXVw?=
 =?utf-8?B?YVRKTDdjVWluYlp0a1pubGZsYTFocHc2S21ncy82T0d3MUpXZnNpWFR6L3Rj?=
 =?utf-8?B?Z0Q0ZnE0K1dvclRuMFQrQ3JEb1VlaW5kd3ZzSldDdzVrTWRvQkU2dnBUbk5q?=
 =?utf-8?B?VTdGdjNWNW4xRHJwU0ErTm9GVGV6NUZveGFhbjJZdnlEbWREN2JEZDRxSnRk?=
 =?utf-8?B?bTBrenc2b2FOKzVXNXNSRnl0SndYY1BUd3JDODEzMStMZWpTNWsvcmIxMjVV?=
 =?utf-8?B?UGY1aHFuQjdSdm1EWnJXcU1ZNVRKeEhvMGh5ZlZHTG9tKzA5dy9TZForWmZD?=
 =?utf-8?B?bVNEdTJRUFl2UDF3ZDFtNGZLQ0hVbHh4QmN4WHdBZGdKaHNEWVB0S3A1SU0v?=
 =?utf-8?B?bkRQS3VtYkc3YTloT21kVW8yOTBPeGpCWGd3NUlJL1gyNkQ2QUcwUmJadExY?=
 =?utf-8?B?QVdJMjBZMk84c1pFZXdTclBTbXFQaDJvU1pVY3lJb3ExR0hFZ0s4NzFRWDhn?=
 =?utf-8?B?LzV0REhCUmpNVjVrbEpjMXJWSjk3WE8xSitSRkpnWDlpRm92V0pYTTFCME9m?=
 =?utf-8?B?MmdSeHIxRFpvWldtbGt6M2NVMjN2MURCUTZXQUk0K3RzdGJBWU9WQ2ZuZnlZ?=
 =?utf-8?B?cXkxUmJkMW9qZ01MeWVKVXphZThNRzJDMjBkWkxCek5iVkYrTDZvS0VlSnhF?=
 =?utf-8?B?bThtL1NrbTFudk5OK2NhWEJmc1hVUWozQVpwbzdPUFNnYmpldVh2dWlHRnJ1?=
 =?utf-8?B?S0V0RUUxeDJXOE53NDNyaHVIL2RhL3VuNFBBTlk1Y3N5TlY4UXcwaWNsUU55?=
 =?utf-8?B?SGY4M2lGRUs4QWFiRFVnbjJHejJhVk50Y25wYklQT1IvdWd2cVUxWEtVUm04?=
 =?utf-8?B?VTBIdVRJVmozZ2lIT2xyVUc4bmNmLzJ5UVVwaXZQUFNocGhmaFhpZFlvYjZl?=
 =?utf-8?B?Y21hSFBUaDJ1d3pLV0o3M1U1UmpwZmJxZ3M2K1BZMmpIVjhram5NRDc0OHVI?=
 =?utf-8?B?cXhXSlBOamN0Z21GUDlHeUtoM1F4dC8xNi9WZ2M3WjFrUXVMb0JVSEtWWkJU?=
 =?utf-8?B?WWRtT3ZiWSs4bWVJMWJwMjdwR3p3WXdZOUJPUm1QNG1Xb1FrVHdMRkpnL1h6?=
 =?utf-8?B?QkVQS2JYV1lKKzFLUVE5WTEwMkxFckpXSVJNWmJhdkhrL09GZGtXUU15bElF?=
 =?utf-8?B?MVlodU5zMGd1OXhabm11QTUvR1FPMmVuT2NkNzY2aFF3TFJxclhYNExSSVhn?=
 =?utf-8?Q?4H4nuTzgQCfrcPAKPgnJaLgf7/Kgiuu8v+u1s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnZicVRDZ1lxV2IrbHZRbmhIbDZmWlJmWGNNYUpWQmFNRUJBQy9TOU9pbEZX?=
 =?utf-8?B?bWxRZVNjNGhBNGVjY2RsbUhtUjdETHFRcFpYTXRsZFRJZmRXUkRTa2lYNFZv?=
 =?utf-8?B?VWxwdnZpcHlTUU1LRFRDdkQ0NjBBNVRnVHB3bXUxMDdNUTYyZzU2UEliYzkv?=
 =?utf-8?B?dTBGemE1anBZam1ZTnNITEMrRWFxVnVHRmhYYmpiSFlWdVozUVRQaFpnNW9i?=
 =?utf-8?B?MXErejdjYS9RdnJYSk1kcCs3WlVjKzM4WlNZbk1KNzdWSnQ4QWVPQ2NDLzcx?=
 =?utf-8?B?eUtNNUxwUVROSVNOcHFXRUlOMDlQRUpJVU1teGlaK0dQMVJaLzlZdlFFbDF5?=
 =?utf-8?B?MWU3L1E3UlNUM1M1N3E2dHRNQmRuQVVxMXRXbnl2QThjWU9WNnFMT2xMa0NK?=
 =?utf-8?B?dEoyOVZVNllEeFdjUUc3WStOdWRtS1gvSFNVK0toelJFeVJCdnlRRCtCVEtq?=
 =?utf-8?B?R2daeW9sdDZkeWdsRCtLbzJndmZ0RDc1TkpJZ0Z2OHVvVWlyV3NsMEJLUmNS?=
 =?utf-8?B?TUNQN3JjRC9YeDhEblV1L3F4dWluaTB4aXN5VlFIRklsVWMrYXlQcjNRdis0?=
 =?utf-8?B?T3A1cW9Lb1pweFJ6RUR1SFVjS3pqQjRNZU9QRlZKb0wwQjQ2cEpXcDFlNUtX?=
 =?utf-8?B?VXcwTE9pMHorek1ST2RINkZqNHhpSkx5Zm1ENnd3NktYVGVCUllpRkpJeFhx?=
 =?utf-8?B?dXhDenU3bVIyZFRDN0l0ZXZUNFFvQ01TTDlURXdpcTZodE0yRVFMeVdzbnhw?=
 =?utf-8?B?T0x4dXB6TnRYb2Z0QlVMS1JYbk50RXdvKzZ0ZjJwbjFQbU1lc1FJcW9QUlpC?=
 =?utf-8?B?QjVNemZVUTlseWF6QUtDL0VvNHlpN0d0ak9KSVpZSlN1c1owR0gxakkzYjhK?=
 =?utf-8?B?U09iRkRQRG9pSHNhNWVJRU9iME5vb0s2Z1hvYWdGK05wSHZmbFJXbWd4RGJX?=
 =?utf-8?B?eFUxVmk2TDJYcW91VW1STjRSOVNpYU1TM3BXdGM5Mjk5STkxTnV0QnI5a0h3?=
 =?utf-8?B?OHRueGlTNE02Y29nL3M5cmVwNEN6UldLRmRoNjM0Wk5IYnlJV1FidnN1Y1VQ?=
 =?utf-8?B?Z1Q0SzE4eTZpMlE3d2lKakNnSXBSNk81TytYVHdIU1lNb1Foa1V3R1BnT0J4?=
 =?utf-8?B?c0l6eFlkNVRnd1hNbUJlYzNJSUNHaUovUjdERTNPMDc5OWN1eVk5Uncyc0h5?=
 =?utf-8?B?WFRpYlR1VnNJVXpFRkQxMVh0cWpVcStISzkrSVE3MmQzSEMrKzRaYzArdmJL?=
 =?utf-8?B?eWFBeG5sTG5zdzNGN3VGVW0zbVR3dlNzVEFWeG9jYlB1Z1ZQRkF0dStxRnp4?=
 =?utf-8?B?cFRmR0hwTHFMVWJadlc2N2tmL2xLTWlYeDdGWkd6OTJPK0hCWTVMQy8zTEln?=
 =?utf-8?B?cEZYWm9EMEVhdFNDRVhKZWZVYWMwTmV2K2pLZ1BzVXllTTh6bDNXTVdIU1pY?=
 =?utf-8?B?SDN0S0xwckQrdzNyU3I1Qmo4NWJHTndWZGRaRk02R2lBQjZDTWVmZ3RWV0Rq?=
 =?utf-8?B?U2pCZlp6a2JZcjBoWWJ4VkZVVHNSWXRMY0dnV1F5Ui8yNzg3bTRGMW4xT3Zn?=
 =?utf-8?B?TTVZY3E2eURYN1ByWXpNeWw5cU5VejI2cWNudnRGR3Y5N05VdEVkRlZFM0hZ?=
 =?utf-8?B?QmJyMENHL093QWwxV1dXMkhIMDJDWDZXcFhDSG9STG5VZTI4UUJPQ0R1eWFx?=
 =?utf-8?B?YTNDTFhGZjI0UkxNeW1HR1BSdVhiWGhWdTloN2wwbFNsVElkcFhLT29PS2M4?=
 =?utf-8?B?cVZUU1YyaWRZelg2ZW9OSWQ5ejYyck5SYmE4ZUtNUStMUzFFMGQvekllQ1Iy?=
 =?utf-8?B?WERiUGp6VFM4SHBVQ2x3MXFkK3JLYmZNOGFzaDFEREVjZWhtNUVaY0NWRWZv?=
 =?utf-8?B?eElLU21xZDFMMllXVjB6QTFnanZ3Z1QrSVdvLzlnNU1uZWZaMjhmR3czSVBK?=
 =?utf-8?B?NkVEZXpnY2E5cUpvN1FqajNyRE1RNnZraHQwd3Q3cWxmNXZVclpzN0R4VEk4?=
 =?utf-8?B?N0MyWVJOb1ZNT0lrOUlQNjlGTisvcGV5RzBWSWZuZksrV0F3MFV6REhNclRR?=
 =?utf-8?B?YkpqbXFzeDlZMVlFRUFqV2hWalBGQXNiUlR4eFJUNUpZVHVEbFF3dGVKTHY2?=
 =?utf-8?Q?QDbcbiMqrCcLef0SrU1BmZhMD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4551a0-fdc4-46fc-f24f-08dd81a928e7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 14:22:49.9044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqCuKOKqzwo/C7VRQqMpts4CRLxW3ioADvt4qMe7YSzMDEIJURkk8YoHUGOb7eaNePcu4H92dLptPknkK19oaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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

On Tue, Apr 22, 2025 at 08:28:31AM +0300, Kandpal, Suraj wrote:
> [...]
>
> > +void intel_dp_compute_min_hblank(int link_bpp_x16,
> > +				 struct intel_crtc_state *crtc_state,
> > +				 struct drm_connector_state *conn_state,
> > +				 bool is_dsc)
> > +{
> >
> > [...]
> > 
> > +
> > +	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
> > +	hactive_sym_cycles = drm_dp_link_data_symbol_cycles(max_lane_count,
> > +							    adjusted_mode->hdisplay,
> > +							    link_bpp_x16,
> > +							    symbol_size,
> > +							    is_mst,
> > +							    dsc_slices);
> > +	htotal_sym_cycles = adjusted_mode->htotal *
> > +			    (hactive_sym_cycles / adjusted_mode->hdisplay);

Here the ( ) around the divisor should be dropped for the div-round-down
by adjusted_mode->hdisplay to work as expected.

> > +
> > +	min_hblank = htotal_sym_cycles - hactive_sym_cycles;
> > +	/* minimum Hblank calculation:
> > https://groups.vesa.org/wg/DP/document/20494 */
> > +	min_hblank = max(min_hblank, min_sym_cycles);
> 
> From the solution I see the way to calculate min hblank as 
> HACT_ML_SYM_CYC_CNT = CEIL(CEIL(HACT_WIDTH / 4) × PIX_BPP / SYMBOL_SIZE) × 4 / PHY_LANE_CNT 
> HBLNK_ML_SYM_CYC_CNT =  CEIL(CEIL(HBLNK_WIDTH / 4) × PIX_BPP / SYMBOL_SIZE) × 4 / PHY_LANE_CNT 
> HTOTAL_ML_SYM_CYC_CNT = HACT_ML_SYM_CYC_CNT+ HBLNK_ML_SYM_CYC_CNT
> EFF_PIX_BPP = HTOTAL_ML_SYM_CYC_CNT × SYMBOL_SIZE × PHY_LANE_CNT / HTOTAL_WIDTH
>  
> Which is similar to how we calculate hactive_sym_cycles so lets use drm_dp_link_data_symbol_cycles
> and pass htotal-hdisplay to get min hblank we wont need to calculate htotal sym cycles that way too

That would be calculating EFF_HBLNK_ML_SYM_CYC_CNT (or the LL version of
this), so a different value than MIN_HBLNK_LL_SYM_CYC_CNT. The latter is
based on a rounded-down htotal_sym_cycles value, see:

MIN_HBLNK_LL_SYM_CYC_CNT_128B132B_DPTX
= MAX((FLOOR(HTOTAL_WIDTH × EFF_PIX_BPP / (4 × SYMBOL_SIZE))
– HACT_LL_SYM_CYC_CNT), 3)

Using the

EFF_PIX_BPP
= HACT_ML_SYM_CYC_CNT × SYMBOL_SIZE × PHY_LANE_CNT / HACT_WIDTH

equation in the standard, this matches the above way in the patch
calculating htotal_sym_cycles, subtracting hactive_sym_cycles from it.

> > +	/*
> > +	 * adjust the BlankingStart/BlankingEnd framing control from
> > +	 * the calculated value
> > +	 */
> > +	min_hblank = min_hblank - 2;
> > +
> > +	min_hblank = min(10, min_hblank);
> 
> Is this 10 or 0x10 since previously 0x10 was coded in
> 
> Regards,
> Suraj Kandpal
> 
> > +	crtc_state->min_hblank = min_hblank;
> > +}
> > +
> >  int
> >  intel_dp_compute_config(struct intel_encoder *encoder,
> >  			struct intel_crtc_state *pipe_config, @@ -3202,6
> > +3263,9 @@ intel_dp_compute_config(struct intel_encoder *encoder,
> >  				       &pipe_config->dp_m_n);
> >  	}
> > 
> > +	intel_dp_compute_min_hblank(link_bpp_x16, pipe_config, conn_state,
> > +				    pipe_config->dsc.compression_enable);
> > +
> >  	/* FIXME: abstract this better */
> >  	if (pipe_config->splitter.enable)
> >  		pipe_config->dp_m_n.data_m *= pipe_config-
> > >splitter.link_count; diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> > b/drivers/gpu/drm/i915/display/intel_dp.h
> > index
> > 9189db4c25946a0f082223ce059c242e80cc32dc..43624aead998a8a330a244bb9
> > c85f026e203171b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> > @@ -208,5 +208,9 @@ bool intel_dp_has_connector(struct intel_dp *intel_dp,
> >  			    const struct drm_connector_state *conn_state);  int
> > intel_dp_dsc_max_src_input_bpc(struct intel_display *display);  int
> > intel_dp_dsc_min_src_input_bpc(void);
> > +void intel_dp_compute_min_hblank(int link_bpp_x16,
> > +				 struct intel_crtc_state *crtc_state,
> > +				 struct drm_connector_state *conn_state,
> > +				 bool is_dsc);
> > 
> >  #endif /* __INTEL_DP_H__ */
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index
> > af98a0d0e8376a79ce1ab6ff3c4f6af30f4d3e73..4153afa13c618bb4db6dbcdc6e5
> > 9faddcbeade6b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -211,26 +211,6 @@ int intel_dp_mst_dsc_get_slice_count(const struct
> > intel_connector *connector,
> >  					    num_joined_pipes);
> >  }
> > 
> > -static void intel_dp_mst_compute_min_hblank(struct intel_crtc_state
> > *crtc_state,
> > -					    int bpp_x16)
> > -{
> > -	struct intel_display *display = to_intel_display(crtc_state);
> > -	const struct drm_display_mode *adjusted_mode =
> > -					&crtc_state->hw.adjusted_mode;
> > -	int symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
> > -	int hblank;
> > -
> > -	if (DISPLAY_VER(display) < 20)
> > -		return;
> > -
> > -	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST
> > & 128b/132b */
> > -	hblank = DIV_ROUND_UP((DIV_ROUND_UP
> > -			       (adjusted_mode->htotal - adjusted_mode-
> > >hdisplay, 4) * bpp_x16),
> > -			      symbol_size);
> > -
> > -	crtc_state->min_hblank = hblank;
> > -}
> > -
> >  int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
> >  				   struct intel_crtc_state *crtc_state,
> >  				   struct drm_connector_state *conn_state,
> > @@ -301,12 +281,11 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp
> > *intel_dp,
> >  		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
> >  							     false,
> > dsc_slice_count, link_bpp_x16);
> > 
> > -		intel_dp_mst_compute_min_hblank(crtc_state, link_bpp_x16);
> > -
> >  		intel_dp_mst_compute_m_n(crtc_state,
> >  					 local_bw_overhead,
> >  					 link_bpp_x16,
> >  					 &crtc_state->dp_m_n);
> > +		intel_dp_compute_min_hblank(link_bpp_x16, crtc_state,
> > conn_state,
> > +dsc);
> > 
> >  		if (is_mst) {
> >  			int remote_bw_overhead;
> > @@ -998,7 +977,6 @@ static void mst_stream_disable(struct
> > intel_atomic_state *state,
> >  	struct intel_dp *intel_dp = to_primary_dp(encoder);
> >  	struct intel_connector *connector =
> >  		to_intel_connector(old_conn_state->connector);
> > -	enum transcoder trans = old_crtc_state->cpu_transcoder;
> > 
> >  	drm_dbg_kms(display->drm, "active links %d\n",
> >  		    intel_dp->mst.active_links);
> > @@ -1009,9 +987,6 @@ static void mst_stream_disable(struct
> > intel_atomic_state *state,
> >  	intel_hdcp_disable(intel_mst->connector);
> > 
> >  	intel_dp_sink_disable_decompression(state, connector, old_crtc_state);
> > -
> > -	if (DISPLAY_VER(display) >= 20)
> > -		intel_de_write(display, DP_MIN_HBLANK_CTL(trans), 0);
> >  }
> > 
> >  static void mst_stream_post_disable(struct intel_atomic_state *state, @@ -
> > 1286,7 +1261,7 @@ static void mst_stream_enable(struct intel_atomic_state
> > *state,
> >  	enum transcoder trans = pipe_config->cpu_transcoder;
> >  	bool first_mst_stream = intel_dp->mst.active_links == 1;
> >  	struct intel_crtc *pipe_crtc;
> > -	int ret, i, min_hblank;
> > +	int ret, i;
> > 
> >  	drm_WARN_ON(display->drm, pipe_config->has_pch_encoder);
> > 
> > @@ -1301,29 +1276,6 @@ static void mst_stream_enable(struct
> > intel_atomic_state *state,
> >  			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz &
> > 0xffffff));
> >  	}
> > 
> > -	if (DISPLAY_VER(display) >= 20) {
> > -		/*
> > -		 * adjust the BlankingStart/BlankingEnd framing control from
> > -		 * the calculated value
> > -		 */
> > -		min_hblank = pipe_config->min_hblank - 2;
> > -
> > -		/* Maximum value to be programmed is limited to 0x10 */
> > -		min_hblank = min(0x10, min_hblank);
> > -
> > -		/*
> > -		 * Minimum hblank accepted for 128b/132b would be 5 and for
> > -		 * 8b/10b would be 3 symbol count
> > -		 */
> > -		if (intel_dp_is_uhbr(pipe_config))
> > -			min_hblank = max(min_hblank, 5);
> > -		else
> > -			min_hblank = max(min_hblank, 3);
> > -
> > -		intel_de_write(display, DP_MIN_HBLANK_CTL(trans),
> > -			       min_hblank);
> > -	}
> > -
> >  	enable_bs_jitter_was(pipe_config);
> > 
> >  	intel_ddi_enable_transcoder_func(encoder, pipe_config);
> > 
> > --
> > 2.25.1
> 
