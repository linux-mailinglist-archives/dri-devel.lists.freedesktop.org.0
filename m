Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55929C8555D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 15:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1131210E0E0;
	Tue, 25 Nov 2025 14:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CHfbcKN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DB210E29D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etsX5DNKzzKW7rySCzoNd9p/isUxC8uLd+JfyQlxF7yeWDkDbEFl+W9L1M1p6ONUP04UhEFRh+GobZThCRCKdM56bZP0WCTWgJrdsNgjH4OQ2hM7Q9TDjxaoev/JungzrRMyd44ScXAtj+oked3bveoLkzJqdOUHe8DZwjldYV5wqExVr3nQeIj3Y5/6+kJHElpjYqTmsj5mJur2P9wP8/npvVJMa2kUeP3Wd4sAASnY1+QOWy9x7G2WNg+fd56URa1s5nMcBAd9xNAk4ZXla3ngwRUb+aDJoxT+EY0BI4IqMZkCU9mpOJ9R4Vmy0O18QXwk8jTOYMy8zV2dmwJn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dx5KYb1pk73oVBAgNjsjqycY7Q/1YEADqb5/KRpQO88=;
 b=i5nIfs4MLkBJ4afeSjRiqdr2lUEFLkaVj81j+H7lpoXj3sjz8A/uFNUy95Lou94sg+gSod1EFLefl8JSy6Gac0Q9P3hkrTSqEJIVCYbq/dfjF07WHHnV8mLNSxsttIYM/yfiJyL9BplCWFSnhGAv8TM9rQCDSiF6vmbtcHtICvRG/h6y1yQAa59k9G06iXQqvNPRa6J7F54xmVM2dwt+ZKhLmw5y/9wHPapVmk1FbP9VDjfUkDIWs43JwY7L9XH1fvQEdJsXQZLZZNfmv//HkT2xFOj11WyCSgXDcK9u6SFno0HGZWX1rin2T+M+6HXWP14UjfQBlILo3WRD4Z23hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dx5KYb1pk73oVBAgNjsjqycY7Q/1YEADqb5/KRpQO88=;
 b=CHfbcKN248SHEjbxn/CzNPT3m5y0qvHP6FmDwzlD8tPAOEf2RDPvhZzCP32pBeINxxwMeZDUWcsiEg2XaB99BpNl9BXsYAODJ9EisQfxKNrN5TmbaeaNHQPWI/3D6lD0RdcOdx8UN05geDRD9CvzkxJDILueu2wkcl+CgJvqy40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 14:11:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 14:11:21 +0000
Message-ID: <6aec16e4-6b63-4aa3-a430-2e981c94bfd7@amd.com>
Date: Tue, 25 Nov 2025 15:11:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm: disallow setting 0 as new handle in
 DRM_IOCTL_GEM_CHANGE_HANDLE
To: "Sokolowski, Jan" <jan.sokolowski@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: David Francis <David.Francis@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20251125102847.904357-1-jan.sokolowski@intel.com>
 <20251125102847.904357-2-jan.sokolowski@intel.com>
 <28441359-4625-4d3e-8c1a-852a1868bde8@amd.com>
 <IA4PR11MB9251D04B84D7129BB1DA449099D1A@IA4PR11MB9251.namprd11.prod.outlook.com>
 <10bd3353-c3cc-414b-8033-7f3b8edb5968@amd.com>
 <IA4PR11MB92511EB3B943B4F2BEB0A1D199D1A@IA4PR11MB9251.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA4PR11MB92511EB3B943B4F2BEB0A1D199D1A@IA4PR11MB9251.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:408:fc::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: d1889144-30a4-49a6-af41-08de2c2c8247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFZQdnFqSCtsNXpvM3JYbTU2SWJnU3NCRzdBQ0FCU0llM1l4ZDR5Z3FnZ1NO?=
 =?utf-8?B?VUc3aXhXWVNYeHJ6L0tPdVZBOG9sTVhJTzBlU0xDVVJNdFBleDliR3BhOHpI?=
 =?utf-8?B?bGsvK0p4OVlLV0F6ZlJXa21vNDd3ODlzY2VSVjdJaE5ncnk5RUp1LzNIOEtC?=
 =?utf-8?B?Qi9WeGtRcjJudXVodnl4ZnQ4diticzBMNFZRdG5JNmdJSFZBZ3BGanNaWEZL?=
 =?utf-8?B?cTJTc01CTUlIWXl2V1ExSlo3ZkdOTWNUY3hzSnVSU0pVTE5ld1grSVhIUHRZ?=
 =?utf-8?B?TjNpS2hGTDVBTDBRVGxrM3EycE1SVkVjcmVGbXJsbjdIRm10RXM2K3ZQQ3Q3?=
 =?utf-8?B?cW5RalZGdXpSTjJ5NnZ4aHFoVVJhMjBtYUpYTlNvZS9jQTUrallLRHFFa25F?=
 =?utf-8?B?Ymc0U09TMnVZRHludDBvV2JnUGZYeDFDSEZ0Sm1QYkhyUC9BOXkrNHFBVHRW?=
 =?utf-8?B?ZW81bDBkK0xQZUJkK2JFZUFTS1RvVXZoVkFFSDdzVy9uME1lYzQwd1VCLzdw?=
 =?utf-8?B?YUUzKzFNL3FlcXUrRC9WUXVPMlFCU25sK0VMSFlYbnFKRTllK2trMlpVcmFa?=
 =?utf-8?B?TjdrWUE5VDI4eUFCb2VpNExSNXBSdmtMRmM3V0Z0UGRaS2NyRkdOcVpGY3Jr?=
 =?utf-8?B?VjdLNUhOU1gwQ0dzWGM3TFlIV3JRTWRYc0lINjYyWERwT3g0eE1Gc0JtRkxq?=
 =?utf-8?B?QkJVZ1FQZkRJUnVTZVVkc1BBMmo5YWNtZURnbzF1WUZkdTViUW1vZjhyeE5z?=
 =?utf-8?B?NW1sbStmOThxSHJhUlQyallnUXF6bVQ2WFhBMHN6bkFMSlkvTEVZSzFZZ3dO?=
 =?utf-8?B?QlAydGx6U1l3dStBelhTeGN3Rjh6bjlmdUJRdlJubkdhckZGNEZXK1I5VHU3?=
 =?utf-8?B?NzJQTktxa3VUQk1wVzNZS3MvWDBGY2NQMkltWjBZdzBPcktqSCtwWTNlQXFk?=
 =?utf-8?B?UTMydTFrbVcxVzRVYmRES1B2eXhySG5Wb3drL3NRcHFyY3UwcFI3eTlDeFVj?=
 =?utf-8?B?UlU0ZklleXZVR0FqWklDdHRJcTU1alg4VjJXeEw2TWZHa1k1ZkxvZ011MXJQ?=
 =?utf-8?B?NUZzKzF5bEJXQVlFb0RBNTNHUU0xTGI0UE50VE9GcjRObFVHL0MyY3kyWDBt?=
 =?utf-8?B?VVZEQllXNHZPVmhhMFVtNnFVUHVhMmFDT3FobE9aaUIwVThGNVNicHFGc3pq?=
 =?utf-8?B?bG1LYWNJSHlPcUFMWFhQZ3JhY1JXVlBMS3FTVGF0dHBzT09aM2kxa3JtOFcy?=
 =?utf-8?B?MDA5RTdEbCtjcFBNaW9tYSt3U29YUE8vZ2FWWHY3cVgyUmZnQkhBM3VZc1ox?=
 =?utf-8?B?VTlBSWtFUVlPcGVIZ2dnQjZ5WURGL204dDVvalZoSUZJMUVHWVVHSlZPSjBz?=
 =?utf-8?B?RmNIRW9SUTdRMmZQcXI5cGd0bjk3Qm5DMTRQc2RrSTRseWVjL0xDd0pkVVhy?=
 =?utf-8?B?L2FQNG9IZUtzZXNwMkR1Q2tYRktHREM1T2xYWEFvMDB0NnVKWk1wbVdteVJm?=
 =?utf-8?B?bXNPZG82N29OSzRIaW5JMlVTU3VNc0ZKK1NrYlVXY0REYkZiVWhnNlBJOHVv?=
 =?utf-8?B?RUszSmY0TVQzWmUrRTRJUDVQUk1sU29ubjJSTlY1OWF3amFtM2JML2dWWHRE?=
 =?utf-8?B?aW5CUk1oV3VHZHQ3WkxsdzNiU1d1ZlphWjU4S0YxZmxtNmo0MkM5ZEliWVdW?=
 =?utf-8?B?eTVnYXJGU1FzaFRRcU8yVSszbjVidXh3ckovK1BoaDRaTTZ2RUIwTTRad21S?=
 =?utf-8?B?TVZoUHM2K1J1WHpBcGtlYWVBaURWTFpZQnNwUXk2bzVrSlBwVENhT2E4emVP?=
 =?utf-8?B?K2V3ditBQlErVk8yaFZBVVN0a2FYMWk4blJJMThnWUhZcFNMSVo1N0k1aFBn?=
 =?utf-8?B?QTdoL1hPb0IzUG1UdnBmeGVSU09adjB6NU1wcFI5cjFFYVhhZ1l1a2xUbXBR?=
 =?utf-8?Q?O136oCgtFSx+nrlyCfZbeKOskSAMnzsR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVJ6M1F1ZjQ2eUVDcGdES094VWhGTE5KUmhxWXlqMnVhNXExd1AySTdTbTU1?=
 =?utf-8?B?YjRPTzkxWWJ0bjdIZG4rQURRam55dy8rZkQ0bnZIOHVlQU9oVU5sVEtLV0pi?=
 =?utf-8?B?YlZFcUNGN2xaYWRKSnZnbVU0a3ppdEtWSnF0U1pCRFpFem5QQlFicXFvQkdz?=
 =?utf-8?B?VmR0a3F6L3J0OUZhVmVueWJkTU9iTVUxSzl2RUllZm8vSjJhbjlHbWhGWVcx?=
 =?utf-8?B?TUtBZlMxYzUyMXFkVmZHellOSm9rMk55VDhTeG0yRERjcXF4L2xHTHVzUkpS?=
 =?utf-8?B?Rmp6N3VIekpYM2R5K1FLR3huSHlzRE43a1MveWViM1pGMzV4eVhPVzFOVEhp?=
 =?utf-8?B?SVYreDNEdGFjNlhNTVhmR0J3Wk1nYzZXb25RZGpnTFByTUtoQXdhTDRFbUZU?=
 =?utf-8?B?VzRVNmV1ZFQvdjRYMERNTHBTVTRrZHlHSWFkcUtFWW1KbVk5V0tCakRjM2s5?=
 =?utf-8?B?VFRJZUxoWDQvbkNJcW5aUXBYMEliZGxMeE9mSUFXY2hBcVlhalB5MXgvNEpS?=
 =?utf-8?B?ZmxZMHFIZ2FOZ2hvWkZFWG5rQkxoK0MvYlh4eTVhMFE3a1g4THlUNEdzUTFI?=
 =?utf-8?B?NVE5WjIwTmloNXBYVVJwdFRoOU5jbnYxdTVNbWo3TjhSOXpZSDN0TUhrVE43?=
 =?utf-8?B?MUI2cWpDcTN2NkFRcE1oeUE5S1JJeTVrRmpBOEtKT2x6MStoSHhFa25RaTFq?=
 =?utf-8?B?cEJXVnQ5Ly8yTUhGUEVtVHJGd1FkYnNvSFo4aWx4eFZCUklhRFpMQ3RpcWoy?=
 =?utf-8?B?VS9iWmlod3ZxV0ZDK0Nyci9SaFJGeU54WWwyVkVLeWd4cStTQkVJdDltcDFE?=
 =?utf-8?B?alZXSmY0M245T2pLRHVVZVFLb3MyRTk3NFdYUG5xeXN6RGtBTUtTT2h3a1ZL?=
 =?utf-8?B?YTNPZnN5Y2xSTFR3QkNjMm50c3g3VTZCK2gvMXdTYklwR0pySGRDOWZqNWRo?=
 =?utf-8?B?cExneFI0cWgramo5b0VRcmtJaDUrQW9QRkxETjR6ejA4RHpkcWNKRXFRUm9P?=
 =?utf-8?B?ZFE4b1Q3K1ZhZUZzNlByb1IxVjVYMHY4WUtsZnc1YW42UmtuTlRqa2hsZnAr?=
 =?utf-8?B?dDM1S3ZRRklKN1R2eFFXeG5QNUpoNlI3Q2J6VFc2RC9UelVONUJKYTYzTEJC?=
 =?utf-8?B?bGthMkFyYVJBVEc3TUFOV1BPcG5xUlJVQ0pJR0d6eFVMZ1RrbCtKaEVKMHk2?=
 =?utf-8?B?QjJlNnQwN0VpVS9QRU1Wa3A2OHZNTGREQ2hQa1lMbjdEa1NjWVVaYjRWWEJO?=
 =?utf-8?B?RTUzKzQ2dXBndngxaUhGRytvN05ybnJGRWpnM0ZVNkltZzZSeVNXNDU0WGxI?=
 =?utf-8?B?Y1VxaUFKdURLVFpJVVBCVEtyWTQ0MnpGelBMd2xqOTJraGdML2lzWWE1eFpV?=
 =?utf-8?B?YzdBNno0QVRDTmtwbng5eXkrVU45RnBLV3UxODJoZXJMVGJnRUE0bGxQTERv?=
 =?utf-8?B?eHYvbC9tUncxbTdvMHZmRHNZdU5ybXd2TUM1alQzN25WOGg4NzF1M3ptLzQ2?=
 =?utf-8?B?Q1FnMVpvdTA2a2ZPbFVTd08zeGJnMllZVjBYYWY0bkozY1dWR256VnJYVWR1?=
 =?utf-8?B?SlBybEErTnUvMjFtOG8rRlVCdU9tVTBmQWQxZUVFSEs2d1hlTGNSeVNsL0xR?=
 =?utf-8?B?bSsvbm1QWWpnVUEra3VhVWF2UThKOGxKbTRtU1JUektXOG44dUljbzhzc25m?=
 =?utf-8?B?MDBuZnZORTJ1VGJDUHkxSkFsODA4SVhJRmZEMGEvcVBZTFNNU0NZWVN0bmpX?=
 =?utf-8?B?SlJEVS82azd5Nkk0RHE0SmJRejhkeVE3RzNybWwzaENUUW9vcnkxNXJqSFRz?=
 =?utf-8?B?M0d5OER4T3VRekMreExEVmNTS2pMUXFPeU94dHM4L2w5VTgwMW5OdjcvbVhN?=
 =?utf-8?B?dk1tNkxEQnJVeG9scElQbjdCcGYyenVmdVZDT2kzMnJkVnFOWHdZelhsMnVH?=
 =?utf-8?B?bkNId3ZPWEdjTlFqai9XVjNkQWxNcG1FNHBSNmxwZzdzRzIxeFYyZ0ZiR1dR?=
 =?utf-8?B?WmtubHJEQm9qYmtvOGVMZit6ZGlvVmh4ZHVIcHJ4azVWQnNtQ2ltRFdaeXI2?=
 =?utf-8?B?VnEvOWR0OFlHNTUvK04wMkFuTWYwMlBpS2QwUmkvbW04Ly8rY01kMnpuWnY4?=
 =?utf-8?Q?1ziMZ4AZp6MzQ5HwDb4A4ar8d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1889144-30a4-49a6-af41-08de2c2c8247
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 14:11:21.0235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8onljX13VEFjST4B/BcizF2QAR/cxLhx9KPuguyWRTkeMqbstme80RX9ewcY1Lix
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241
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

On 11/25/25 14:39, Sokolowski, Jan wrote:
> 
> 
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Tuesday, November 25, 2025 2:23 PM
>> To: Sokolowski, Jan <jan.sokolowski@intel.com>; dri-
>> devel@lists.freedesktop.org
>> Cc: David Francis <David.Francis@amd.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
>> David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Felix
>> Kuehling <felix.kuehling@amd.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>
>> Subject: Re: [PATCH 1/1] drm: disallow setting 0 as new handle in
>> DRM_IOCTL_GEM_CHANGE_HANDLE
>>
>> On 11/25/25 14:02, Sokolowski, Jan wrote:
>>>> -----Original Message-----
>>>> From: Christian König <christian.koenig@amd.com>
>>>> Sent: Tuesday, November 25, 2025 1:54 PM
>>>> To: Sokolowski, Jan <jan.sokolowski@intel.com>; dri-
>>>> devel@lists.freedesktop.org
>>>> Cc: David Francis <David.Francis@amd.com>; Maarten Lankhorst
>>>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>>>> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
>>>> David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Felix
>>>> Kuehling <felix.kuehling@amd.com>; De Marchi, Lucas
>>>> <lucas.demarchi@intel.com>
>>>> Subject: Re: [PATCH 1/1] drm: disallow setting 0 as new handle in
>>>> DRM_IOCTL_GEM_CHANGE_HANDLE
>>>>
>>>> On 11/25/25 11:28, Jan Sokolowski wrote:
>>>>> drm_file's object_idr uses 1 as base value, which can cause id
>>>>> mismatch when trying to use DRM_IOCTL_GEM_CHANGE_HANDLE
>>>>> to change id from 1 to 0.
>>>>>
>>>>> Disallow 0 as new handle in that ioctl.
>>>>>
>>>>> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM
>>>> handle")
>>>>> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
>>>>> Cc: David Francis <David.Francis@amd.com>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/drm_gem.c | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>> index 68168d58a7c8..2a49a8e396fa 100644
>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>> @@ -975,6 +975,10 @@ int drm_gem_change_handle_ioctl(struct
>>>> drm_device *dev, void *data,
>>>>>  	if (args->handle == args->new_handle)
>>>>>  		return 0;
>>>>>
>>>>> +	/* As the idr base is 1, trying to set handle 0 will create id mismatch
>>>> */
>>>>> +	if (args->new_handle == 0)
>>>>> +		return 0;
>>>>
>>>> That would need to return -EINVAl or some other error code.
>>>
>>> Ok, will change that in next version.
>>>
>>>>
>>>> But I'm wondering why that is necessary at all? Doesn't idr_alloc() return
>> an
>>>> error when you try to allocate handle 0?
>>>
>>> It appears that idr_alloc doesn't return any errors in this scenario,
>> otherwise we'd goto out_unlock straight away.
>>
>> Mhm, that is a bit misleading. We intentionally initialized the idr so that it
>> starts at 1. Maybe idr_alloc() should be fixed instead.
> 
> I've checked what idr_alloc does, and it looks like it'll return 2 in this case,

Well that would absolute clearly be a bug in idr.

The start parameter is documented as the minimum (inclusive) value returned and the end parameter is documented as the maximum (exclusive) value returned.

So if you ask for value 0 and get 2 instead that is clearly not the documented behavior.

Something fishy is going on here. Please investigate what is actually happening and why.

My educated guess is that the base is just ignored by idr_alloc(), that's a bit surprising but at least not otherwise documented.

Regards,
Christian.

> which is the next reserved id (0 is reserved, so it goes to 1) + base (1).
> Maybe the solution would be, if idr_alloc returns a value other than args->new_handle, then
> a) bail out
> b) new_handle = idr_alloc, and inform user that the assignment was changed to another handle.
> 
> As idr is used in many other places, I don't think that's feasible or easy to fix that.
> 
>>
>> But that is clearly a much larger change, with the return code fixed feel free
>> to add Reviewed-by: Christian König <christian.koenig@amd.com> to this
>> patch here.
>>
>> Adding a CC: stable tag sound appropriate as well.
>>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> +
>>>>>  	mutex_lock(&file_priv->prime.lock);
>>>>>
>>>>>  	spin_lock(&file_priv->table_lock);
>>>
> 

