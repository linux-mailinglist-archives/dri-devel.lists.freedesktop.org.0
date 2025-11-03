Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B696BC2E43D
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFE810E4CC;
	Mon,  3 Nov 2025 22:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBPezhwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09F110E4CA;
 Mon,  3 Nov 2025 22:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762208955; x=1793744955;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=abVaORR2o99BLuRyn+5xTxD7SbNKsoD+JcSqQmBIP40=;
 b=mBPezhwAmHmh5c1FuWTm1yTjz2eqjY+1VFyusVbt0MhyTSaZjFxcRAOl
 rWL+srqn5HsseuO73JZ2vWmw9tnwX0DQZVg8bWV1GnyEyOVQuvJvVpTv9
 fMy2mRZr3wMQ5EVglAZkZhpoj8WK9mSv/Ziy+gj491N92vnqWUVJvyjUo
 3WSBQg+OYWEEKQdekTHriy8L35LyPMy5AgJICqK2wUWKPZ36oaMvLh81d
 XON+/58zg8CVeCFJ2Z7JCAiaxNy0Y0Ces8jl+zHa/Iv10SIx1OsBvNkT0
 3l6SdoZfXyqE5UOXdCFeZHcDs6a8rRQIXmNGp0vxvjN8/BkE9OD5EBx/H g==;
X-CSE-ConnectionGUID: IcfbQq2nRfKapL1sOnUyXA==
X-CSE-MsgGUID: ReqVTA/HS8a0cG2wjIPP1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51865466"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="51865466"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:29:14 -0800
X-CSE-ConnectionGUID: Lm3Nm4UJTbaWtQXAeP8FFw==
X-CSE-MsgGUID: R1q0h7YPQYKH6nRCzypamw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="191334560"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:29:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:29:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 14:29:13 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:29:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nq6jRF3tTvcvJayCGNDDnNbyPHxqonoSAEeRGQ9K5T/3m+uTPIo4AX5Es7GabIt16RMmHysBnQWUR98FEvd69dUnlOxXDktqzyyBNV4esMWOHtT3T+2m16DPEqsQ0On8MEir6W/S+xhQvRj78xD9nlDzQU9m3F4+MxMW+if8P2RlITHzYyifcRH5wYt7PfR1yisZAkNzQ8/WVVVuF57dUX3fwSddJRVUzy3kuMhr4t4YYql5x10P2y35LTeoqrkCUM2BOtHcYGbAyb3Uf1UcI659ci6cnbLBMgKdd8uPrXy/Jt/sT2HQJHE3gvX1w/W/NAPbS3OgyoSDV4KW/Drn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTK4bzdRPZdY5YfGb3Wx95StTYJsxDLyZzjzkuoB+HY=;
 b=eNEuSTF3Wer5XTO5uV94tGH6RiRFmvN0CwhmY8ZFyGpWkWBO49DNHR/uNaydfTyO51S5N+2QGgWi2KQzaOfxj2Etuh+G51ETH3NjwF6ANnYVxWufttI2wcze/0rbsseFscfpwXRV7ZlxDAr6JLz0IzZSgaHRJwGPBnbvO3Q9vZA9XFtxlvAOeoY40ViCZdQMBYLZrtw2T0pJv8IqqfGw6QFhr4mSdVOk47EROvqEwLBz6JfKcFUn3Lz8csfeAcnm6R4K6IBE+6dhymYyxk0gMVCCIJaPmCwUBt8N8OUevdHqPpT7KzktAFfi1uctdFbxnpYulIPEp27ilw10kb9DZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB9464.namprd11.prod.outlook.com (2603:10b6:806:464::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 22:29:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 22:29:11 +0000
Date: Mon, 3 Nov 2025 14:29:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v3 21/28] drm/xe/migrate: Add function to copy of VRAM
 data in chunks
Message-ID: <aQkstCpJQ6ZAnQr7@lstrano-desk.jf.intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-22-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251030203135.337696-22-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f93709-c131-4a0a-1a44-08de1b28694e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGQ1eGtpaEMrTmM2T3hBY3VSR1c3ZlN3cWJvenJWNlZUVHZtMW9MdEV6YWNP?=
 =?utf-8?B?cXhRU0FKcFJETklnbU9neUJNT29xWjBXUnFGL1pGeXZRU0pMendhc3NEMUtB?=
 =?utf-8?B?bllyaHprc1VMUGM3ZUUySzB4RlZvRWN4TkMzRTU1V095T3ZadGMwZ1ZmcGxx?=
 =?utf-8?B?TVdMQlVUN25BcmRNOGxmb0Y5VDB2M0FtUmZQZTZwSmFpTkdXNEZPZFFZTFZ0?=
 =?utf-8?B?L2taRXY4dEdzUjBRY3ZJeW5LdFNUbDNGWkJ4UzZGb3ltTmJ0bGJWZTNwMUo0?=
 =?utf-8?B?VUpVZ0swSVVlYkRFUnJNSit2TW9iVWJYTlRBTWUxdFZWeHhsVkttUllJbkYw?=
 =?utf-8?B?dEMrb3NnREtyNCttbUNIUlE0SFlhaDJXZ0RYVTNJNWFjWVVPTk4rOTkzdExF?=
 =?utf-8?B?bjN6ai9sYWVKK3hFaVE3SXFMb2dTNUl5MG5uRGdVZ3BlL2JSYlBOOFVERFBQ?=
 =?utf-8?B?YmRpM25hMzFFR1pWMHlLZW96V3hxVTlGQjdoYTJ4cmpHVFhxQXBLOEV3cWxT?=
 =?utf-8?B?RTFTZFF0YTk2L0ZkTXk2SHZnSHNldXljUFNlR29mYjZSLzRvcFMwUHpxY2NU?=
 =?utf-8?B?WGZ1N1N2enNyNjlkRStMaGN0aHFKRkc4YnpxRTFZQjNHVFh2S1MxdjBVbUFS?=
 =?utf-8?B?N0luMks3U0d0RzAvYzFJc0ZYc21HTmxYVy83TnY3TjhvcmR2WG1HZjgvaG9W?=
 =?utf-8?B?d1hDQUZ6dS95SW5IV3BEMVVRNm9aUjZIbTN6T1pNMFpEMHFhRjdoblB6OEZ0?=
 =?utf-8?B?eGlZVW5Ga082SlJQRVo2TUZBRWtCWmtWWGJUY2I5ell3Zyt4TzcvVGNCY3JJ?=
 =?utf-8?B?L2Vhd2tCay9URFlSTnFIcEJRTHpUWlJKMXFzb24zM2daMUNkNDBYV0FKY09q?=
 =?utf-8?B?YXFTMFVCU2NQN0VzbkJOSFMwWDFGZ3kzR08wS3pSMzBJa0swcTE1dlV3eTRn?=
 =?utf-8?B?U0ZWN2tGSnQ2UVdVNDRBR3hmVVpaYzNBV3djRTJpamZtWHhaNlcrZmFTR25w?=
 =?utf-8?B?Q3RwaFNRNnZLcFhwcDBNc2s4QjVUNnNDVHJTV09JUVR0LytIQXNLVWFWc0Fq?=
 =?utf-8?B?U2NQY0xaVVlSTXFJVDFoZDJXTXh0Qjd5QkpiN1psNVFHNEhOTzU2TFMwTWxu?=
 =?utf-8?B?WmlwRThsTVBIMEN1Qy85ZFJNVEpUUEtSTHBubk5WeFBTYlNuOENmd3JxZVZJ?=
 =?utf-8?B?TzV3Q1E1M2ZnaENsTXBGRXk3eHkvdTdaK1dDalliQVhWcDZDYkJ1c2RtZjU4?=
 =?utf-8?B?S2lwMk9SZEVKeUxub1J6UGNoeWJXMWxaeTFKaXBBdzJCRWVybG91MDFhUG9X?=
 =?utf-8?B?NDBSYzBJa2ovdEMzSlJ4Zit3UktlWngxdktYa0xrR21EQkRYSHJFMlNCYStr?=
 =?utf-8?B?Vzl5TG1ZODY3b2p2aS9GNDRqUnJGbllDajB6SFhXc1E4OXBSd2NCR1hkSjJX?=
 =?utf-8?B?VDdEbkdudWJ1WW5BbTVWc0RuZUJKTmo3WENHdFRHVFdtTndQM2htYjlOTHJQ?=
 =?utf-8?B?SGE5WVZGZkc1bll3TE5JOEN6RkhLSklWajF4empqNm5tOTVKMUdha01DOVps?=
 =?utf-8?B?SGQwNDd2VWVYb3VSMzUxQStTSkJ0RGxUcFF0cVdmV1pTdG4xQ0hZL0RkWmZj?=
 =?utf-8?B?andRWFE3cVNmMGM1VHRuWFV2SEZXQUVNeVk5UnE3U0tIZGRMbllpMHZ0Z1VS?=
 =?utf-8?B?NlFiMDRFallKakppdmVLdGszQTAyRklVeVFXVDYrbUV1bVNLU09vYTRpVnR5?=
 =?utf-8?B?cjdsV2lPYm1zdFVJaGtkQmQxYkw1Y1FwSnVoeldhbkt2MWVqeVFaL09QQkU2?=
 =?utf-8?B?UFZhTkYvWE9zUVF5aUdYZkRFeVh1RGZ0SmRTeEVoTzIxNnNPN0l2YVRqMWQ5?=
 =?utf-8?B?Y0swL3p6VzAvU2ZxTVlOd1h1cFFQaEc4Y0FlN1BVRFJrSWZhdCtBVmZDM3F2?=
 =?utf-8?Q?EPtvyStvhXGL4Ah682mXHa/sWSMszYCN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1hVOXMwU0JKMWFjbTRIalJub3QxaDBkNnlJUndyR0hHM1dxY3hZQUcremtz?=
 =?utf-8?B?RE5taE9DNWZEMlBGUkRRTXpvS1EzSHNaSHBIamZGVzNBY04yZnVVNWpaQXlS?=
 =?utf-8?B?QVgyaExiZm0zNGRvVnlNV25aUFdUK1orUGM0WlRzVXdSNEZuVWoyL1BSckNp?=
 =?utf-8?B?NXNXNHRsbkNJQkYzMWxwcDd3dnE4eS9ST2g3VHZHTDUvV1RMM2Q3UG9XV1hx?=
 =?utf-8?B?RHVoMEhwUG9XWkxzQ1YzOVlRMTI0YVI5SWwrcWl4ZE5KV1hrdWdmVlNXaGo1?=
 =?utf-8?B?RkV1cCs5dWtWeko2YUs4ZDlybFd1cVFGNXZWbENBOWZOODVjck5TKzF2ZVZl?=
 =?utf-8?B?U1IrMWFKd3NEb1czTnEzN1AzVnJEUVJDZG5vNXhVRmVDTzlWbFlZT3Rzb0pt?=
 =?utf-8?B?SWxsUE1UZm54WjVGNElNRU9sYU1xZ0orTU55NVlVMit3VU5hVnl5WkZRdUJO?=
 =?utf-8?B?RWoyY3BiaHZOR1o3amI4cU82cFZDTEs1Ulc3NllVcjlpU3BSUTV2M0JaR1FG?=
 =?utf-8?B?VWQ1L09QWnZvYW1vM1FaNExoRGZ6TThyQkRMVWkvWjFIeVh6Mms3OW03N3Fv?=
 =?utf-8?B?RjRCbit4c3dDS0FrMnBQdDcrQ0VaNzc4eVBkRmJ3bzB0bHNFNVZjZEJFYSt1?=
 =?utf-8?B?L01mcld4dE5kNEJqaEpweFVFTkdVejU0bVVlc085M1k5VG1wZWVkQTA5QWh2?=
 =?utf-8?B?ZUE2SUtRd0NLL1lhR2U4M0dwblB5Ry9HS1U3SUdBQTFJRUFRcDNyWVRMYWhG?=
 =?utf-8?B?Q3V6bW82ZXlQbHdNemp0ZmFNc1RyblVXVDA4YWF1QzBOTkdLb3hSa2o1dGMy?=
 =?utf-8?B?MldmbVRHNm1ZM2laWjlMRmJhd1YwS3dwbU5rVkNqNnIyQURhRVV4WTl1eG14?=
 =?utf-8?B?aVYya1VPV2JxdW9pMUZWNTlNMFUrUWMzTHdOZ1JIMkhOZDFlSW9WMm5UK1RZ?=
 =?utf-8?B?TnplQU9ncU9zSXp0WkdsczJVYmNMMkt6MW5WcXRCM2JNdlh2N2Y3S2k1UE1D?=
 =?utf-8?B?TnNXdk5mR3hkMDdTQUhidFFTZkJpSmdOT25Sa0c0aTJMbUVndXJ0WFNwSTUy?=
 =?utf-8?B?THdMSWFPQTlHUmFNYzdqNFpHWUx5RG1jV2hZYUk4QzNYRVNHSWsxc1d1OWFw?=
 =?utf-8?B?NVJMNmliaEJSRlpSMWVWbmdHaExjNzNiU2xXKzlNS3dZeTh6MDBOVnN0dTR3?=
 =?utf-8?B?Rmd1U0dXMjNKS0hvc21qc0tETjM4VlFyeUU4Ym02Qzk2ZGZWWS9ZNlN0SzdD?=
 =?utf-8?B?TWNERU5TQUo3ODEyQ0M3QlRyYzlKV1lmMHhFYkkzdU0wWlJHdW41Y2l4NVV5?=
 =?utf-8?B?TnhIS1RJQlFwUGtZTlo0K3BTVTF6M2FNYXhiYWdTRjZnelF4VUlFVDBjU25o?=
 =?utf-8?B?SjduMFBoZ1J5WG9lay9mSkRFUThLejJSS3NsZllEZWxjYnF2NDVFRWNZbm9I?=
 =?utf-8?B?NUs1Q1NzUmZ1SnRXQXVtNklnSDVib0oyeG1EM2pkbzJDZTFVZ29QU1hTeCt4?=
 =?utf-8?B?aSswa1h4aGpoekY4TThTVnpXUGxEaThJUFpES28wS0JSZUMzVkMveGppcTBH?=
 =?utf-8?B?RmFSWEpRUnJSWmNHVzA3RTlVdU5iaTVlUDJETHpmVHNXMnhYbm9OUjV0cDJs?=
 =?utf-8?B?cVhDNlRLN25veUJUb00wUDVMQU01M1VjN2xSeDZNMVcwT1d1QUw5bUZaYjQ1?=
 =?utf-8?B?bGYzZEhyK3hGdEh4aDdKa1lDNmpFWC8xWkhCR0tVVStjeEMyU2ZqQkozRmdS?=
 =?utf-8?B?cjg1NEFqZDlOcGtkd0dKZDBybUdISDl4MFBKb3NncktrdkpDOTVQUWJvdnB1?=
 =?utf-8?B?TkpBYSs5OFRLLzY5MFNDN3dlY24xV3JBSloxU0c1UGZrQU01THY0dU5zV0tY?=
 =?utf-8?B?a0Q3SFB1UnNxaVVsTzdiWU02cUhSMGFTYitldm9ndXpGbG1QeTdzUkdUUnR3?=
 =?utf-8?B?eWtVTFMyZXNLQTFBdXJ3QmZ5SDFkdnd6UHJZMkxwUUtKYlNydUxpdG5rM0pv?=
 =?utf-8?B?SjcxR3ZpTEd5NWQzTjFUcFdrVC9WejhxM3JKS1VvUHZZN25hMVBhT3A5WThu?=
 =?utf-8?B?WFRnNXNiU0Y3YU53OUREQWw3TmEyeS8yU2ZINE81NERYcVp4VEpBMk9lSGEv?=
 =?utf-8?B?RDR4Zmd6SThScGJrcXhYc0swUkxiYWFYRjU0bE1MaXQvL2xSSnZvR2xxQ3Vr?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f93709-c131-4a0a-1a44-08de1b28694e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 22:29:11.5793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TX+NvDqaREEQ7b2Q21dAurBn5Oo1pqA1EBFyi01razMgNiKnTKpIKHsd2m0vEIbGE2MgWUtDdREqTGyCh7+5Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9464
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

On Thu, Oct 30, 2025 at 09:31:28PM +0100, Michał Winiarski wrote:
> From: Lukasz Laguna <lukasz.laguna@intel.com>
> 
> Introduce a new function to copy data between VRAM and sysmem objects.
> The existing xe_migrate_copy() is tailored for eviction and restore
> operations, which involves additional logic and operates on entire
> objects.
> The xe_migrate_vram_copy_chunk() allows copying chunks of data to or
> from a dedicated buffer object, which is essential in case of VF
> migration.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 128 ++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_migrate.h |   8 ++
>  2 files changed, 131 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 56a5804726e96..dbe9320863ab0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -29,6 +29,7 @@
>  #include "xe_lrc.h"
>  #include "xe_map.h"
>  #include "xe_mocs.h"
> +#include "xe_printk.h"
>  #include "xe_pt.h"
>  #include "xe_res_cursor.h"
>  #include "xe_sa.h"
> @@ -1210,6 +1211,128 @@ struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
>  	return migrate->q;
>  }
>  
> +/**
> + * xe_migrate_vram_copy_chunk() - Copy a chunk of a VRAM buffer object.
> + * @vram_bo: The VRAM buffer object.
> + * @vram_offset: The VRAM offset.
> + * @sysmem_bo: The sysmem buffer object.
> + * @sysmem_offset: The sysmem offset.
> + * @size: The size of VRAM chunk to copy.
> + * @dir: The direction of the copy operation.
> + *
> + * Copies a portion of a buffer object between VRAM and system memory.
> + * On Xe2 platforms that support flat CCS, VRAM data is decompressed when
> + * copying to system memory.
> + *
> + * Return: Pointer to a dma_fence representing the last copy batch, or
> + * an error pointer on failure. If there is a failure, any copy operation
> + * started by the function call has been synced.
> + */
> +struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
> +					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
> +					     u64 size, enum xe_migrate_copy_dir dir)
> +{
> +	struct xe_device *xe = xe_bo_device(vram_bo);
> +	struct xe_tile *tile = vram_bo->tile;
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct xe_migrate *m = tile->migrate;
> +	struct dma_fence *fence = NULL;
> +	struct ttm_resource *vram = vram_bo->ttm.resource;
> +	struct ttm_resource *sysmem = sysmem_bo->ttm.resource;
> +	struct xe_res_cursor vram_it, sysmem_it;
> +	u64 vram_L0_ofs, sysmem_L0_ofs;
> +	u32 vram_L0_pt, sysmem_L0_pt;
> +	u64 vram_L0, sysmem_L0;
> +	bool to_sysmem = (dir == XE_MIGRATE_COPY_TO_SRAM);
> +	bool use_comp_pat = to_sysmem &&
> +		GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe);
> +	int pass = 0;
> +	int err;
> +
> +	xe_assert(xe, IS_ALIGNED(vram_offset | sysmem_offset | size, PAGE_SIZE));
> +	xe_assert(xe, xe_bo_is_vram(vram_bo));
> +	xe_assert(xe, !xe_bo_is_vram(sysmem_bo));
> +	xe_assert(xe, !range_overflows(vram_offset, size, (u64)vram_bo->ttm.base.size));
> +	xe_assert(xe, !range_overflows(sysmem_offset, size, (u64)sysmem_bo->ttm.base.size));
> +
> +	xe_res_first(vram, vram_offset, size, &vram_it);
> +	xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
> +
> +	while (size) {
> +		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
> +		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
> +		struct xe_sched_job *job;
> +		struct xe_bb *bb;
> +		u32 update_idx;
> +		bool usm = xe->info.has_usm;
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		sysmem_L0 = xe_migrate_res_sizes(m, &sysmem_it);
> +		vram_L0 = min(xe_migrate_res_sizes(m, &vram_it), sysmem_L0);
> +
> +		xe_dbg(xe, "Pass %u, size: %llu\n", pass++, vram_L0);
> +
> +		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
> +		batch_size += pte_update_size(m, pte_flags, vram, &vram_it, &vram_L0,
> +					      &vram_L0_ofs, &vram_L0_pt, 0, 0, avail_pts);
> +
> +		batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0, &sysmem_L0_ofs,
> +					      &sysmem_L0_pt, 0, avail_pts, avail_pts);
> +		batch_size += EMIT_COPY_DW;
> +
> +		bb = xe_bb_new(gt, batch_size, usm);
> +		if (IS_ERR(bb)) {
> +			err = PTR_ERR(bb);
> +			return ERR_PTR(err);
> +		}
> +
> +		if (xe_migrate_allow_identity(vram_L0, &vram_it))
> +			xe_res_next(&vram_it, vram_L0);
> +		else
> +			emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, &vram_it, vram_L0, vram);
> +
> +		emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
> +
> +		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> +		update_idx = bb->len;
> +
> +		if (to_sysmem)
> +			emit_copy(gt, bb, vram_L0_ofs, sysmem_L0_ofs, vram_L0, XE_PAGE_SIZE);
> +		else
> +			emit_copy(gt, bb, sysmem_L0_ofs, vram_L0_ofs, vram_L0, XE_PAGE_SIZE);
> +
> +		job = xe_bb_create_migration_job(m->q, bb, xe_migrate_batch_base(m, usm),
> +						 update_idx);
> +		if (IS_ERR(job)) {
> +			xe_bb_free(bb, NULL);
> +			err = PTR_ERR(job);
> +			return ERR_PTR(err);
> +		}
> +
> +		xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
> +
> +		xe_assert(xe, dma_resv_test_signaled(vram_bo->ttm.base.resv,
> +						     DMA_RESV_USAGE_BOOKKEEP));
> +		xe_assert(xe, dma_resv_test_signaled(sysmem_bo->ttm.base.resv,
> +						     DMA_RESV_USAGE_BOOKKEEP));
> +
> +		scoped_guard(mutex, &m->job_mutex) {
> +			xe_sched_job_arm(job);
> +			dma_fence_put(fence);
> +			fence = dma_fence_get(&job->drm.s_fence->finished);
> +			xe_sched_job_push(job);
> +
> +			dma_fence_put(m->fence);
> +			m->fence = dma_fence_get(fence);
> +		}
> +
> +		xe_bb_free(bb, fence);
> +		size -= vram_L0;
> +	}
> +
> +	return fence;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> @@ -1912,11 +2035,6 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
>  	return true;
>  }
>  
> -enum xe_migrate_copy_dir {
> -	XE_MIGRATE_COPY_TO_VRAM,
> -	XE_MIGRATE_COPY_TO_SRAM,
> -};
> -
>  #define XE_CACHELINE_BYTES	64ull
>  #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 4fad324b62535..d7bcc6ad8464e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -28,6 +28,11 @@ struct xe_vma;
>  
>  enum xe_sriov_vf_ccs_rw_ctxs;
>  
> +enum xe_migrate_copy_dir {
> +	XE_MIGRATE_COPY_TO_VRAM,
> +	XE_MIGRATE_COPY_TO_SRAM,
> +};
> +
>  /**
>   * struct xe_migrate_pt_update_ops - Callbacks for the
>   * xe_migrate_update_pgtables() function.
> @@ -131,6 +136,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  
>  struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>  struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
> +struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
> +					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
> +					     u64 size, enum xe_migrate_copy_dir dir);
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> -- 
> 2.50.1
> 
