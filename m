Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935AEBC8A86
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC6F10E9C9;
	Thu,  9 Oct 2025 11:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGxgnV+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A30410E9B5;
 Thu,  9 Oct 2025 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760007634; x=1791543634;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DHVXkUH0kbTqDYgktOHT3YfalcOlPhqKAyqM2cWdVLM=;
 b=AGxgnV+mYMIL1O8HkWXtq7JmuUALr96SuGlek/qj/Hgo+zN7KfQTTGcj
 xi3Tl05Bwjcz54Af+ipE3uOqYTIonImuX2ItR1P+/0mIDm1p8OYuErCWO
 wDKjaiBUS/mwhHD6IwYoLSjp1L4wcSUQsL11E9cFQDk1wP4i9DZU7yTuA
 ZaFNd1NsWGuSQhneczOZfXKQH2r4h5oDXBsMILlQGnCwvQv6Fu7SgszlX
 IqiK4CekC9jdfsL2OHCYXcuO2dtJs2jnTAu7/eXgzIF60Ys7CKTMIoCNg
 n2Nd20Q87mlSWqS91DtzPfIhzDhEl69DrUbb4DczLOT9Q67fpQDUpH6lb A==;
X-CSE-ConnectionGUID: 4B53u588QBSxSio+0qAI8A==
X-CSE-MsgGUID: yXYMCTKYScOntScj7rM6JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="87673765"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="87673765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 04:00:32 -0700
X-CSE-ConnectionGUID: 50MBqxj2SeiZ3qERiRBOmQ==
X-CSE-MsgGUID: wMTYu246QzmU0qKkXg8y9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180710040"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 04:00:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 04:00:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 04:00:31 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 04:00:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whP6G1FmNljWfvQ4mvFeIUyuIOB9Uj5SPgnOTBfWoeNNthcVCVy7xW23Xrs3BDUzRwoAbDHjsRTk/60ikrzf/cfOhXSzya7ifVO+WR3s2nLtNknqTZz0fD64IEgv9oCWHmTVVLxJevHhIvDleD5BDnRZ5ACGcu7WPiCbhkYWmTNHIttMjJ43ThSeai+HxuQlahhD3En29qhCUtGvhfv3zU+NB6ewJY3eFNec7xWT73mLyIzGZ1lpuz130XWzNqbL+xVW5ARhXdudcZBQr0/Ewsu5SM7Ekg/dZIEVFIBwQcUcg0SjBVGnUe84+rl5wZTVT0J/gYL26az1QNsCgdPzAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8dtjfGTfGhG74GuNCrQ3TTQ6YCHUCBN4ULNumABCuc=;
 b=iewEg9mVNoaxRsZzNM4LQIi76TVEAbHmFi8OVA+ZQk5sNEsDSxVsz1DruDVNfhGwmEcCOD8Hcgm0Iwhb3YKkZi5gd3Qk58UlERlYiHDLkZKxNf/lMYsmebK+e7oeAOvovCx7QZVvaSFmVnVrM/VJplvOwrg16v+2NJTqFJ4ZG1B33FCHi16IoAe4OEhFM7Xrx7dsPD/LxC0cEXokxQiOKKMdn882UO27FLBklCPExaRmZ451NHqP4iKFk4ZQ5MsA5suVvZlqg6cysZhrPW1+rxz16s58uXip+nawj014SXbK9o6fInjZiDyOPf6wJBBu4p7EaLM1mZFv2/w4XOXsqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 11:00:29 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 11:00:29 +0000
Message-ID: <aa510447-53d5-4b27-aed1-03ecc6d36d32@intel.com>
Date: Thu, 9 Oct 2025 16:30:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drm/drm_crtc: Introduce sharpness strength property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Garg, Nemesa"
 <nemesa.garg@intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "G M,
 Adarsh" <adarsh.g.m@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
References: <20251001063500.1259687-1-nemesa.garg@intel.com>
 <20251001063500.1259687-2-nemesa.garg@intel.com>
 <epzspujsf2o4wq5ykswe7a3hvrb3vy5wgenglfopmkuepyfstm@5kkpxstpyc3r>
 <IA1PR11MB6467E47D1D61DE21DCC2B9EAE3E1A@IA1PR11MB6467.namprd11.prod.outlook.com>
 <mqvmv3bqikoekjhhwqifzatzouxym4yy4eab6bb2zjhzlv2tfw@l5iumy2ybngl>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <mqvmv3bqikoekjhhwqifzatzouxym4yy4eab6bb2zjhzlv2tfw@l5iumy2ybngl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0067.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a64ff5a-208a-42a3-a970-08de07230eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blM3QUNYL29nMnVNR1YzYmJ4c0RhS0JTTC9sQThRS3FvdWdRQ1U4RFVKMmg4?=
 =?utf-8?B?Y2VBZDhiN0l6NUhDNnJINzYxL2pIU3diOTVTbWtRQlBDYUFWME5idGNvc3Fx?=
 =?utf-8?B?dnhpeURVTnlHRXI0OURTazV0cUlTMkhuMXBXb0ZKRkxVaXJoYTZ6VkxiS0pl?=
 =?utf-8?B?V1Y4UnkrVHpiRHdTV3RVdmd6TjAwV3M0K1A3TnFVZnVBMzFvakRvMGs1dHdx?=
 =?utf-8?B?TEc0UXpUUDFHQnRnbzBBUjhYazZUa0NmUXZScmVPOHI2VS95L1NKUDJldjJa?=
 =?utf-8?B?ayswR21MWjRqSk0yamsrS294UVJXV1ExSDVHOWRnLys4MFEvK2lORVE3OE5E?=
 =?utf-8?B?SXBDOWNtU1NSbi9EN0s5bnIwamh2Sit4Mlg2RjZ4K0U0V1RxN2JwT3pRb3Nx?=
 =?utf-8?B?RTVhd0JadGZ0aGJ2QTNNMFhHZVpuRDJJT2xneCtkaWY1QjhrdURCZGdWYXYx?=
 =?utf-8?B?a3lNbjZwRnpkWEpqSVc2dmlHYy9KMjcvekRTa0FERmZ5SGRtU1lWczVvbTdi?=
 =?utf-8?B?WWYySjBVekkyUC9nV3dFRXFQZnMrdmN4MjlSRko3aHVlRzJPYzV5YUxPNUZs?=
 =?utf-8?B?ZVRUbGlvekh0aXdXd0loSHVKbzBRSFhtVWRNTDlub0U3ckVLU09Wc1dZc0hG?=
 =?utf-8?B?YVBvbUEwVEI4d21DaWtPWnZxd29RZDBGSDlmdmZFaGR2WFM0TE15a3QrNG5S?=
 =?utf-8?B?cVlLeVFoMlNoNTdJMjRIVSs3TFJGZU9jT215YzQranJjU2dNNWlIRm92SVk1?=
 =?utf-8?B?alJ3eWpnd2kvR3U4WkcrRzRMZUZrNXB2YlRhOEVyYTVJZzFJNldxZmZoTDI2?=
 =?utf-8?B?TkRPc0JlZFpVZnRMZU5HYzdCOG1ET0l3OFovRmdnQUk4MTk0UG9VSkkxM2Ex?=
 =?utf-8?B?SVd6U251YUVzeEViTk41ZVJlWXBVRGFtakhoZGlJZTVYZjBta2NQNnplSHdv?=
 =?utf-8?B?Z0kweHlBYmJPbERIbTdOTzh6Q3dKdndUUzhJYncwTGdGTkxGamhVTUYxaklP?=
 =?utf-8?B?SzhqUGZoVXhhY2g2SXkyV0orQjE1cHRUTUtFaU1SRTNQZThEWE9ORWFsNFFp?=
 =?utf-8?B?VlZzcHJHMzd5R1o4cVRZZGhHUElsOEZHNjVYK0JvY1pyMjhPVEx5TE5MSWl0?=
 =?utf-8?B?TFh1UmRYbWpkOFFXMHhYU0VhaHR0TWdwRDlpWW4zK1NBWUhlMnBkUDgxZVlp?=
 =?utf-8?B?WHVsTWhkemZkTTg5VVRPakRyV056WEVyUVdaUE15cDU3aU1qeDM0NkpEYUFp?=
 =?utf-8?B?V2loUUhrQWZ5ZUVPQktGcHlPdUhhQTFSR09KVEptN24rMG44RFlwZktwVi9J?=
 =?utf-8?B?dDI5dDdWRExyaHJMcmlnNHBvUTYzYnh0ajlDNjl5TVRVSGwveW1lUGNraWNq?=
 =?utf-8?B?WVJGbExnbUlpS2lKZ2xrUEVqT1V6czNrdDNPOGNtLzh3QkJUbjFtWkhqNE8x?=
 =?utf-8?B?WjNMTlRqOGQzNmdCeXMrSTdXZE83ZTR5aWZDZ09aRXNSY2N1dVlCTjFLSTJW?=
 =?utf-8?B?ZGNwMnpTVVlUQzdydE1Obkd3QzNpVmJEaU4wVDBLSHdNbVR4elBNVjROM0FH?=
 =?utf-8?B?MEU2UVl3TitSZG1kUTZxekVjZ0VLVTF5Sm9PUEk1ZVQ1KzVOQVBsd04zYm5H?=
 =?utf-8?B?bzMxcHg2QnVkUS84T0ltZDdnVTU4TnZDQjhjQUJvK3UyRjNlUFp0anEzTHU0?=
 =?utf-8?B?cWdUc2FIR2lSaFh5TDZSV09iV2lDcVFIMGFjd3d0RGQ2SnVGOHhoRXRRTVJ2?=
 =?utf-8?B?QXRBUlpXM3FVc1ZaZDZEanVMUTdSSEtRMzVlZU9vMlRWZmFSNzdwaGVqQUdW?=
 =?utf-8?B?K09GY3pRNFAzVklHeisvQlRsTjhjdDJhNU0zS25VbDg1a1Npd0JublA5WlpJ?=
 =?utf-8?B?N2lRaWdXMnhtWlAvWGFlM0pBeHQ0Sm4vYTRhVTZ0bWdGU0NFallma2NJcTEv?=
 =?utf-8?Q?RBmGWgZ4ZCQVeXALKIo02wIKMjd176fs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eExTdktJODAwVjBRbDVqK0lHVW0zbU5YUlBzNHJpRHVKbWdpNzRLclNJbG11?=
 =?utf-8?B?cm5RSVZRSlJJdjkxK25LMHkyeFZkQVRtNk1xZ2hLb0dzMHY1UGhqRTlITlN3?=
 =?utf-8?B?VnFqa2p1UldjbVo3SDBEYWx3UU1PMDJSSks1UjVQOEpWZGVhMXFGQTZjYjVS?=
 =?utf-8?B?UFlyenBiL3kvVzVoNVZtSkpqNVBtSTZjZzBEN24xQ1FkOHJ4WHkxV3VCUTd6?=
 =?utf-8?B?UmFpYWhveEl2SFBVczQyQ1MyYUxuNW1JNVBWT2Z5VERIdkhNenRCZERmanVN?=
 =?utf-8?B?TUpMNE9yekFLbDFTSU5ROWxZeVdMT3p3a2hzczF5dDBMOGtPakowa25MM2Vx?=
 =?utf-8?B?QUdvSjZzQ1c4OUNyTDJFRWVRNHVna21pWVZ4elM0SmV6aUZSZHVVcXBBMHBt?=
 =?utf-8?B?WDNXc3MwZmdLeWxNTHFXdTVDV01EanQvMEI2cFdiQ3Nyck9NczJKOWhCWDY3?=
 =?utf-8?B?UWlQcGdmY0t4YnVpU0NVWXlnWld0a2pTRnRmbjNQakpiNUZsMEFEVFY5MlBS?=
 =?utf-8?B?UFBrM096T0w0Tjg4b3NvcEdMRitWeWpCMWhGbjdHYlROYnd4NmJwaVo0Rmxt?=
 =?utf-8?B?SHcyWGZEY3FQb25JSDlqaFBNbEg0YTlRTEdRWkM0M1VpTThsVzc0MVFwZTRU?=
 =?utf-8?B?dU5hVzQ5SXliaWZuTG5vMDVvcjNTcXhrcmpKZkRZZlowcm9qd0RHMmNZUlRn?=
 =?utf-8?B?UFVOLzNmSGpoM3k3Qk9CZWlsYzJRMEpUbXd2Vm5zekw3SGJOZ0p6MGc1dGwr?=
 =?utf-8?B?eUJwTktyN1MvcTJxUE0wNWJuWmsxS2Vhb3NuUkhSNzZDT3NqN3dUWmsrOTlG?=
 =?utf-8?B?aEJtSTdoTXBEdW1sY1RHZ0F2VmN6c3d1WDNiL2dLYXk2SXpUQ3ZaekJ0WTlH?=
 =?utf-8?B?ZHdHQ21qdzV0T0plWWRIbis4K2gxSHFuRkFXcnhoQUxQWEkxNGY3M1lwdkVF?=
 =?utf-8?B?YW9mTGh1dFhQK3lPMU40SU5vaTVIMGFNa2NtRGo2MzBZbmxXdlZnTC9LZDB0?=
 =?utf-8?B?NzMyQW5LdVdDamxaWlkwaUJYKzRIbjdjZTgxNzZMZlRSd1VsaElzcjYzNnI1?=
 =?utf-8?B?bkViUUxyamJubVFIcXRuajN5WnkvZmZzMTQzZVFqYTM1V3pwa3NGWndLTUpx?=
 =?utf-8?B?ZzBkckM3dkkvZjF6cmpsSmhYTFRDL3NVYm9VaFFRSmcrd3lsU05wRWJQMVV0?=
 =?utf-8?B?SVBsSUNjeC9URGljRlhOZWpLQUh4eWlsZDkzZysrMnlnYUlLK0FPQWpaQkx3?=
 =?utf-8?B?dGEwWWxOY2Z3Qnh5UUZXK1VONnRaT3V1K0Y3TmxXcU5sUHZUZUdFVXFmZ1dy?=
 =?utf-8?B?azlaQStpZ1NTZDhQMjVzY0R1RTFjSCtleFVXUGFjaEJXcHpJMi9MdUV0Tml0?=
 =?utf-8?B?cGFvdXJUMk4xK29jZzdHZU1QVWxTUDY2aTBXVkR4bEgya3hlLzZ2Y25sbFo3?=
 =?utf-8?B?b2NWQU1qVklrMkNGM2dBSitkT0x5enVlSWUvMjQwTEFRR01Pb0R1MFZZdG56?=
 =?utf-8?B?WUtISlZ2SUFSa3BCNFk4cVJ1dzhGdFpVdUxKUHY5YjNac3NabUFBV0pLd2t2?=
 =?utf-8?B?QzVKd0RUeG9seVFTR3ViWDNmWURDczFwNkt5QkNGOTZmRmVvMmZUTEJ3WXdS?=
 =?utf-8?B?V3cxYXhGWWJlQ0lBQ2tQaUh6UHdXZXl2QjUrWHRSZzNXeDB0TEl5elFucTFw?=
 =?utf-8?B?cUpDMzVsZktKUHN6UWwrRVFDbnB1SWxMWWpabEJVUnV0Wjl6bHpIV2ZCcm14?=
 =?utf-8?B?aU9TNVA1akI1dmNTN0t4SkJOSndnODkyOGMwNDhRMk9VcDNWajUxZnY1Y0xz?=
 =?utf-8?B?QjQza2pWMVVCbm5tcjhoZmNlUUR1QUw1NkdIV2ovcDZXMUNnZTB6TzRudlp4?=
 =?utf-8?B?anpFWktzWXV2aWRJalZ2UDJSWHRidFlxaXU1ZHJ3WTcrS1BEekZ6MEtwcWtw?=
 =?utf-8?B?c0o3bFg3YmE2VEtYejVlMDZIY1FFclJqeTRoVFFuVUJIRndxcG12emRlRlpu?=
 =?utf-8?B?VTdna2xuYWd6MCs5bXcyOUxrdmZPUTZKUXpBTnk4WnpwajdFdXBiblpkbmpq?=
 =?utf-8?B?YmROMzUzQ3J5T3pSRVVHbGtkSnhDTGtHSGlYelRBVXBZVGZrcGdJTWY1YS9o?=
 =?utf-8?B?VnFXQUFVMGp6K0ZyTDVFOTRiOVoxaHVPeENDK3lGRXFaSVBKYS9yNVloWW1K?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a64ff5a-208a-42a3-a970-08de07230eda
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 11:00:29.3167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByyLMNG21QeDsI0hLkVMZGkBWxzFIOIY7EsH0HPb8N88gms1Huz4x+SFMy11hIIGEoXIcqbfx3vaamFnUk9gg6EHVuersn9mPmVBVrMBi8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
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


On 10/9/2025 1:35 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 07:22:00AM +0000, Garg, Nemesa wrote:
>>
>>> -----Original Message-----
>>> From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Sent: Saturday, October 4, 2025 3:38 PM
>>> To: Garg, Nemesa <nemesa.garg@intel.com>
>>> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
>>> devel@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
>>> G M, Adarsh <adarsh.g.m@intel.com>; Simona Vetter
>>> <simona.vetter@ffwll.ch>
>>> Subject: Re: [PATCH 01/10] drm/drm_crtc: Introduce sharpness strength
>>> property
>>>
>>> On Wed, Oct 01, 2025 at 12:04:51PM +0530, Nemesa Garg wrote:
>>>> Introduce a new crtc property "SHARPNESS_STRENGTH" that allows the
>>>> user to set the intensity so as to get the sharpness effect.
>>>> The value of this property can be set from 0-255.
>>>> It is useful in scenario when the output is blurry and user want to
>>>> sharpen the pixels. User can increase/decrease the sharpness level
>>>> depending on the content displayed.
>>>>
>>>> v2: Rename crtc property variable [Arun]
>>>>      Add modeset detail in uapi doc[Uma]
>>>> v3: Fix build issue
>>>> v4: Modify the subject line[Ankit]
>>>>
>>>> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
>>>> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>>> Tested-by: Adarsh G M <Adarsh.g.m@intel.com>
>>>> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
>>>> ---
>>>>   drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
>>>>   drivers/gpu/drm/drm_crtc.c        | 35 +++++++++++++++++++++++++++++++
>>>>   include/drm/drm_crtc.h            | 18 ++++++++++++++++
>>>>   3 files changed, 57 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
>>>> b/drivers/gpu/drm/drm_atomic_uapi.c
>>>> index 85dbdaa4a2e2..b2cb5ae5a139 100644
>>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>>> @@ -419,6 +419,8 @@ static int drm_atomic_crtc_set_property(struct
>>> drm_crtc *crtc,
>>>>   		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
>>>>   	} else if (property == crtc->scaling_filter_property) {
>>>>   		state->scaling_filter = val;
>>>> +	} else if (property == crtc->sharpness_strength_property) {
>>>> +		state->sharpness_strength = val;
>>>>   	} else if (crtc->funcs->atomic_set_property) {
>>>>   		return crtc->funcs->atomic_set_property(crtc, state, property,
>>> val);
>>>>   	} else {
>>>> @@ -456,6 +458,8 @@ drm_atomic_crtc_get_property(struct drm_crtc
>>> *crtc,
>>>>   		*val = 0;
>>>>   	else if (property == crtc->scaling_filter_property)
>>>>   		*val = state->scaling_filter;
>>>> +	else if (property == crtc->sharpness_strength_property)
>>>> +		*val = state->sharpness_strength;
>>>>   	else if (crtc->funcs->atomic_get_property)
>>>>   		return crtc->funcs->atomic_get_property(crtc, state, property,
>>> val);
>>>>   	else {
>>>> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
>>>> index 46655339003d..a7797d260f1e 100644
>>>> --- a/drivers/gpu/drm/drm_crtc.c
>>>> +++ b/drivers/gpu/drm/drm_crtc.c
>>>> @@ -229,6 +229,25 @@ struct dma_fence *drm_crtc_create_fence(struct
>>> drm_crtc *crtc)
>>>>    * 		Driver's default scaling filter
>>>>    * 	Nearest Neighbor:
>>>>    * 		Nearest Neighbor scaling filter
>>>> + * SHARPNESS_STRENGTH:
>>>> + *	Atomic property for setting the sharpness strength/intensity by
>>> userspace.
>>>> + *
>>>> + *	The value of this property is set as an integer value ranging
>>>> + *	from 0 - 255 where:
>>>> + *
>>>> + *	0: Sharpness feature is disabled(default value).
>>>> + *
>>>> + *	1: Minimum sharpness.
>>>> + *
>>>> + *	255: Maximum sharpness.
>>>> + *
>>>> + *	User can gradually increase or decrease the sharpness level and can
>>>> + *	set the optimum value depending on content.
>>>> + *	This value will be passed to kernel through the UAPI.
>>>> + *	The setting of this property does not require modeset.
>>>> + *	The sharpness effect takes place post blending on the final composed
>>> output.
>>>> + *	If the feature is disabled, the content remains same without any
>>> sharpening effect
>>>> + *	and when this feature is applied, it enhances the clarity of the
>>> content.
>>>
>>> I can repeat my question from XDC: should we extend this to negative values,
>>> allowing softening (unsharpening) the image?
>>>
>> Hi Dmitry,
>> The un-sharpening or blurring is a very valid usecase in pre-blending where certain layers (data
>>  From clients) can be un-sharpened while some other layers can be enhanced with sharpening.
>> This helps give  focus to the particular content and suppress the background.
>>
>> However, this current property is targeted for post blending so will be
>> applied to the entire frame on screen, here sharpening only is the intended objective.
>>
>> We can pursue a pre-blending solution to target the un-sharpening case as well as a separate interface.
> Indeed, I'm more interested in a per-plane sharpen / unsharpen property.

Makes sense to have a separate interface for the per-plane sharp/unsharp 
property, that can be used for hardware that support per plane / pre 
blending sharpness.

Currently Intel display hardware does not have pre-blending sharpness 
support, but surely would be a good feature to have.

Regards,

Ankit


>
>> Hope this is fine.
