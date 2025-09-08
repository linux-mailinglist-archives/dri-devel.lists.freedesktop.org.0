Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBC9B49ADA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FD110E20C;
	Mon,  8 Sep 2025 20:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tQUgFWE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6F110E20C;
 Mon,  8 Sep 2025 20:18:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2/4y3SOkn2dJV9o19TP6P6YPDPMCFya806IbGgFTcR6oapRBGbmeH9SjbP8Kv6p2kEfKpfZVbhkTijeNw+us+0ZCgoFk6WW3mpbmNNThx9M6lHK4WMdNdNwzc1oVG9VXsd5VjEuaV2PrB1G8LLo/WsWanmY+52jtwDmEsMatPQdAcRlXwSDt/vdf8BAuRUi+zxSvyMDSKimuU6zmRMP4YP/AjoyEWUhgmAnjWuBq8FMg/zo5jQv8cD6qrwo2FMWkTa868FOouD/MtgRWxP77glhe6ify/mriu10H2Alda17tJRR2R6XMKmhUScQAopBVbKzTSGnSD3m21vTY5G3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGFX+tYqiAf9QqOGSy2IRxvDua8eXFMUnr1LBv+YCak=;
 b=bOMmOehuuV28M/BwWGBw4Q3NyyfL8ci19iXdqaxPyoeaf6aCeMnBc5KrV2uGYE0jYuN3PQj2zUAmfPmn1zMM//6XUgEHP9WcTVtoAGVCkSGN60Zz4fwX2anXd095yHk7M8LIppLAR//ekRZ4bl3U8NmobnoBP7bxnoIbiNt2m+NnPuaibhIS5Vkd9cKXcRuM3s0CI9MtA1RFhsVrMe5M9wAyr2hqimxiPS9/V/rJDFqDNIMleb8NqHhOIUaa5NTkGZxVXa1Bx5pjotd8E1z1ff+ol9wS7dTDwIywozhNNsp57WGJxoQOSBG6M/SdIrwqFdUTzp77JqjeSik1GgfOYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGFX+tYqiAf9QqOGSy2IRxvDua8eXFMUnr1LBv+YCak=;
 b=tQUgFWE7Jc43b1rtBK+m+vscTQUUrp7CkcBOgpzCm0u8f81d0j28Rc1ybpkpScTaIh+YkcwMotAbzVKFOqmADGedY+vvM3PCvMdxlgqnT2lql2K4ZwIHpFc5Prk3rHNF+/P//lW0h3leeACdt8u1mt0fY8XY88U8KwIGLZHC4sg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by LV3PR12MB9403.namprd12.prod.outlook.com (2603:10b6:408:217::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 20:18:50 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 20:18:50 +0000
Message-ID: <0f6b54fa-720f-43b7-ad74-91c2c5700dad@amd.com>
Date: Mon, 8 Sep 2025 14:18:46 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display/dml2: Guard
 dml21_map_dc_state_into_dml_display_cfg with DC_FP_START
To: Xi Ruoyao <xry111@xry111.site>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Mingcong Bai <jeffbai@aosc.io>,
 dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Asiacn <710187964@qq.com>,
 Austin Zheng <Austin.Zheng@amd.com>, Harry Wentland
 <Harry.Wentland@amd.com>, Wenjing Liu <wenjing.liu@amd.com>
References: <20250825085211.34396-1-xry111@xry111.site>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250825085211.34396-1-xry111@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0310.namprd03.prod.outlook.com
 (2603:10b6:303:dd::15) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|LV3PR12MB9403:EE_
X-MS-Office365-Filtering-Correlation-Id: 81228ff6-5787-423d-a9be-08ddef14ec43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmgvanpOdVhnRWFMc3k0TUh2Wk90K1ZsOHFQMy9lVFFKcFhQUzR0YitQam5m?=
 =?utf-8?B?dHNhYjgrSllpR21lWXc2N3N4dmsxajhvL0w5c1hMcnpNQWJtZHBrZ3dSNHps?=
 =?utf-8?B?WFNuNll2NHhnSzJmU1QrbDJWWGdleU5iQkRackFBUXpMS0dCNTNaeFhmaVBs?=
 =?utf-8?B?a0VoZlovaWR0YjFBNnVtOGZxM3VDRDY1VUVMWStMRUJSR2U4TkdGRVZZVXZJ?=
 =?utf-8?B?U3FMdk9OOStGYlZDQnd6dFJnZ2I0UDR1Q0k0bzhHSkpQS0N0WTBHYUgzQ095?=
 =?utf-8?B?UzN4VGlxR1Qzd1JENzkrOFBkN3ZJalVJU21lbG5mK0lHazQ4R292VWRwZm1h?=
 =?utf-8?B?L2lXRCsxd1B1Y0tEbFhkd0tmQWhtR2cwelN2MThOSW9pR293SytZY0VHdkRm?=
 =?utf-8?B?YXlwZzZaOEM3d2hMYjQ0dXBvTTVaa0YwK013b2VqeE5XTWxGVXhRWFJEb0ho?=
 =?utf-8?B?NncydmtFL2Vsc3RRdTRnSEtoU2tGQmF1a0M3TjM1dXNkT2FaRnExUnNQRnRY?=
 =?utf-8?B?bkVyYUVJdFVWVnNIYjdvWTNsZGFMeWRBZnRJR05tU0ZJWDV6TTBPV0lxUCs1?=
 =?utf-8?B?eTd1S3dYYjZraHdodUphTDVObitLeFlRZGRndjZCWTlwK0NTU0Z4dkd5VmFx?=
 =?utf-8?B?cHVwM1BwTGF0azFtMjhFeVJkZHBSWVk1Y2lGNXRPemlkRll1NnJtQUVOUlpD?=
 =?utf-8?B?N2NZMFNzNVlPT3ZUcDhjOXJJMWRvdUJGTEJ5eit0V0JFK3NDRDVwWEFYY3Ay?=
 =?utf-8?B?RjBjZG5sUkgwM0l4RkhacjZOOCtqNk5Fdy9WcmFRV2VveGhiZkUxRnA3Tm1p?=
 =?utf-8?B?K0ZIRVZnZDNubkpwNjNLcWFMYUdVQTNrOVVMcFo5Vk1JVTgxMjdTUFFGVkxu?=
 =?utf-8?B?WGFMSnR2bndDSDF3THlLNk9XNGc4WU5yOHBYaU9mVGZscEVRY1VFVE9scEV2?=
 =?utf-8?B?ZXVJTzl0UjdJY0ZkejBHYlBjWVI3d0V0MW03L1JwcDd5ZVptTXVGUGdDSEFD?=
 =?utf-8?B?TEc1Z0owN0FMdEpyeXIvTitoYkl2Yjg5cDdib01JWlV3ajFaQ1RBRUVpemRE?=
 =?utf-8?B?WXp4NTNvenJSM2psU0tzTWRMTm5GWFpUTU5mY1pDMXRPanUyQjl3MkRPUk54?=
 =?utf-8?B?R3FzQzZGdDMrbVdFRTdpY3o1cnF6Um9RckkvaG02R3U0azhoM0Z2bDE2MGxk?=
 =?utf-8?B?V3g1QStYODJqL2Y4cFJuZlA4UWVOaFVFQkQwTmtObFAxSjYxWTVvOUdKM1NU?=
 =?utf-8?B?MVRsMmM5Yk0vRWVEWVh6cGdGY1QzQTUxajg0MmhyR0FQeW14RlJCMFI1NUQr?=
 =?utf-8?B?TnFBMHNRcDQ3OWxKZXJpVGN0SkFRdzJ5TWQxVjAvS1lpSkpleGtoUEdpUFVo?=
 =?utf-8?B?RUl3MkxqSkRyUUNoYis1amNjb0wvTDUvbHEyRDB5Z3dyS1RDaE1heFdIeTcz?=
 =?utf-8?B?MGk5UXhPbkZ4RWpYSVI5YXYvNlB2L0ovSThBbUY5bjdJS0ptSE00U25BdFJT?=
 =?utf-8?B?ckU1OGhDSkI4M0sxeHcyL2ZrakdqQjhFKzVlNTNCZnYrQjROOGtteVJHZHIw?=
 =?utf-8?B?VEROdSt1ajFESG9HeW4wY3JYb0ZEdk8yaHFzV3dMc05maUZvQ05tejA0YnQx?=
 =?utf-8?B?WGRiVkpOWEh6NXhibEM2NXBNd2o1a1ByTTgyVEJyWnNZNTRINXNKOXNPMHdL?=
 =?utf-8?B?UGJJcHZ3a2l2bTEwaS9PSjRPNzdlWFhBVndGSUxXZU1kUHpEcHN3V29XMCtt?=
 =?utf-8?B?citMdEszUEV1Z0VHUnNWdXlVS3hXcXg2SVFaM2licndKSjJxQUVxYldQK0V4?=
 =?utf-8?B?cmJIV0RmUWZtc2R0ZnZPUTUxV3A1THNoN2pKcFNwY1RudzR5R0RKQnU3TFFU?=
 =?utf-8?B?WG5tZ3ZycXR3SHR5OWdkMWlOS29IM0tFUngwbWtPODdSNHlienUwR29wYnY2?=
 =?utf-8?Q?m19U8yUzyIc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGN6aGJ1R2t6MEdRaE95cC9jdGJpeVE2RmU1dkRiYkVtYzkvbXlKT3cyUU5l?=
 =?utf-8?B?d1M0RUJXNmh6dWduTmtnMXFETnNiSHRKcy91NUYzbjhmemxUYWtKWDVKemI0?=
 =?utf-8?B?ZzhTSjEyL2YyNXNVK1FESW1SVTBPRWRZQlRUNDBoOXVaZ1dINWd2K214dXlO?=
 =?utf-8?B?SW1NQ3ovdGtnWHoreFA1RGoyK1NjNXJDT3RTMzVDTms5NHIxQ2pqaHdOUGl3?=
 =?utf-8?B?RE84djZNY0hHTE53V3M4cWs5MXFmTnVTZTkzREo3WDZMcDI5VDBhaGFIdDNN?=
 =?utf-8?B?ODB4V0dEWUQwWDJqeGE3SWxIbGh1ZThhc0plc3dGbnAvMzdsZ3lQRWd5TWI4?=
 =?utf-8?B?YUM1M3hUb2FaYVBNZzVWU2hnUFJiclJmRGU4bnlpSlAwK3V0L3NoTm1ZOXZt?=
 =?utf-8?B?bGozTkJkbG5PYUlUY3ZKcTV3SEdLdDdPaGVWOGNoNDlJSWVyZHBrOVJsSXJJ?=
 =?utf-8?B?UHJFMjlKd3E1V1k4d0RiZ2Zyak95dW9jbmgvdU1oU3N2VDlBYVlKREpQMGI3?=
 =?utf-8?B?YmpBODZXYXRJdDAwcUdqSmZtMTZEbmkwTG12VGxsUE9Ya1NSc2U5NWxDREpM?=
 =?utf-8?B?aFp6T3NNTG4vb0l0QVVIN0FRV1haYjdoUUFSUG9lYjhHWHptT2FwczZobEs1?=
 =?utf-8?B?N1ZGS09rK2d1bFJCend4aDUvSVV6WHk0c25HbmVVcUZrTmgzUG1PVEhMZ1lw?=
 =?utf-8?B?dm9sRElTSm1ETVFUUDhLcHA0R1g2U3U1b0c2MXpFK2JOM2tNYjljMUlKc3V6?=
 =?utf-8?B?UGZmSFc2ZnBTL2RpMGdldVR2V1haSlJVY0NMNDVJRVVwTmxlcWNqM1hLQjdM?=
 =?utf-8?B?SEVUclhxMXV6M3RtVURyM2lCcSttQWExa1JIbGxXaE42RnMwdEIxZ3IyV1A3?=
 =?utf-8?B?cFB6YldIaWF2R21hZEpOMjZaQllhcmlIb2tlWGVnc3U3THBOL09PY0lLM1ho?=
 =?utf-8?B?ZHdDUTJDSzFYUloyTXVuR0JvNE1nVWdJY3l3bmVYZk5oVjBtUzJJaGxabDBT?=
 =?utf-8?B?UWlXTnd3bFFtUWYrL2pEb3JXRjUxVzhSTGMwSFZOanB6U1Z4Y21DSTdMbWtr?=
 =?utf-8?B?dlowenRzNlh1N1ZmY2lQU3VFZk1aTDM0QkZGWnVkMjNZZHE0R2oxTmQ2TTcy?=
 =?utf-8?B?WXgvY0k0RnZ1d3BrckVwdGIzMjc5MG9zcGdYQ1JzcTBHSWs5YXloN2dIeE45?=
 =?utf-8?B?Zk1nY1hsTzhTeS9jYnB2cEdLQ0dDUnRNcGI5bVR1b0tKWHJTQXpiT2oySjFo?=
 =?utf-8?B?alBMaVh0MSs5K1NYQ2FMVndKUzBEclAwd09NUlpnUDNGUVBnWHkxMEFDREV1?=
 =?utf-8?B?OG94N2pCNmw5WTJobHRwTitPRDF3Q2lFSGF2NGhid25JSlFVd0UyVkpTWlpy?=
 =?utf-8?B?VmdCRitmd0ZwQWRDTmNnNjMrelBaeFp5djBBYkg4S3lKdTVTZHYyVFpHQ0Zl?=
 =?utf-8?B?bGNlWlNhZ1VLUEozUVRmT1ROS3ZYMHc4RUdJbng0cll5Slh4ZVE5cXZLb24y?=
 =?utf-8?B?T0psMm4yVmp0UDJSQ0dyc1lEZFhJRTF3SXB4ak1aZVdpRjJvbzdjRENrSW9W?=
 =?utf-8?B?NzNHWitoN0wxWHMwZFFWNXZzK0R1RGRoNUdJZTlPd1hJRlZBbDdhTkl5QjVY?=
 =?utf-8?B?TWh2YS9ZZ0k3Q01mT0pzOXhYd3JBN3FVc1FZWFE4N3h1TTdMcnRiZ3pQclNj?=
 =?utf-8?B?eXFjN3orbmNFNVl1L1Y0dTRUT2RLNkNwZTY2bUpwRnJ5L2xXVzVUWnZXd2Q3?=
 =?utf-8?B?ZTFDMjA2Q1Y3cy9kTDFiMEVrc050VFAvdUV6c2JpcWxlWGVJbGhpNmFtL0pu?=
 =?utf-8?B?aWxRaWp1NFpiTC9xWDYyUWFLWWlNZDhVT3EwMktFZGlZa3hmWVdnRXpCWTJR?=
 =?utf-8?B?M050NWNjY2NyZjRzU1pCVmR2ZVpiN0VGSm9qUmtkcDR2UnduaXorWi8vbW9Y?=
 =?utf-8?B?UWczQjFQUk9BQVdHaHAzWWx6MUJLVGVraTRhZ2s4Y3hzTU9zTlRiRjBOWDZS?=
 =?utf-8?B?RDVZYXRIbFVJTjE4QStDZnR5TVNJOFJXODN6ZjluaWFUVlNCVzRPUjVjb0Qr?=
 =?utf-8?B?RzFidW9mL1c0TzNTSW9Tdi9kbGkyUEx1Um10ajgyTjVTcXNDeHpVWVhZaWlm?=
 =?utf-8?Q?Zggr4obj/pfEFiF635l7DvgCn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81228ff6-5787-423d-a9be-08ddef14ec43
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 20:18:50.0760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BomZYYpcwhdvAMVGoyn+FevGikirnl4PnMrxXfGgMPHid1gRptoyR0gdsoA3oV03h9NrF2TtfcR9rzP5BDbEIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9403
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



On 8/25/25 02:52, Xi Ruoyao wrote:
> dml21_map_dc_state_into_dml_display_cfg calls (the call is usually
> inlined by the compiler) populate_dml21_surface_config_from_plane_state
> and populate_dml21_plane_config_from_plane_state which may use FPU.  In
> a x86-64 build:
> 
>      $ objdump --disassemble=dml21_map_dc_state_into_dml_display_cfg \
>      > drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.o |
>      > grep %xmm -c
>      63
> 
> Thus it needs to be guarded with DC_FP_START.  But we must note that the
> current code quality of the in-kernel FPU use in AMD dml2 is very much
> problematic: we are actually calling DC_FP_START in dml21_wrapper.c
> here, and this translation unit is built with CC_FLAGS_FPU.  Strictly
> speaking this does not make any sense: with CC_FLAGS_FPU the compiler is
> allowed to generate FPU uses anywhere in the translated code, perhaps
> out of the DC_FP_START guard.  This problematic pattern also occurs in
> at least dml2_wrapper.c, dcn35_fpu.c, and dcn351_fpu.c.  Thus we really

Let me share Austin's comments below:

"
Both CC_FLAGS_FPU and DC_FP_START are required for FPU usage.

CC_FLAGS_FPU allows the compiler to generate FPU code whereas 
DC_FP_START ensures that the FPU registers don't get tainted during runtime.

The change itself looks fine to me.
"

> need a careful audit and refactor for the in-kernel FPU uses, and this
> patch is simply whacking a mole.  However per the reporter, whacking
> this mole is enough to make a 9060XT "just work."
> 
> Reported-by: Asiacn <710187964@qq.com>
> Link: https://github.com/loongson-community/discussions/issues/102

"Link" to "BugLink"?

The link is in Chinese and it would be helpful if you can spell out the 
problem in commit messages to something like like "this fixes 9060XT 
fails to output to HDMI on xa61200" or other meaningful descriptions.

> Tested-by: Asiacn <710187964@qq.com>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>   drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> index 03de3cf06ae5..059ede6ff256 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> @@ -224,7 +224,9 @@ static bool dml21_mode_check_and_programming(const struct dc *in_dc, struct dc_s
>   	dml_ctx->config.svp_pstate.callbacks.release_phantom_streams_and_planes(in_dc, context);
>   
>   	/* Populate stream, plane mappings and other fields in display config. */
> +	DC_FP_START();
>   	result = dml21_map_dc_state_into_dml_display_cfg(in_dc, context, dml_ctx);
> +	DC_FP_END();
>   	if (!result)
>   		return false;
>   
> @@ -279,7 +281,9 @@ static bool dml21_check_mode_support(const struct dc *in_dc, struct dc_state *co
>   	dml_ctx->config.svp_pstate.callbacks.release_phantom_streams_and_planes(in_dc, context);
>   
>   	mode_support->dml2_instance = dml_init->dml2_instance;
> +	DC_FP_START();
>   	dml21_map_dc_state_into_dml_display_cfg(in_dc, context, dml_ctx);
> +	DC_FP_END();
>   	dml_ctx->v21.mode_programming.dml2_instance->scratch.build_mode_programming_locals.mode_programming_params.programming = dml_ctx->v21.mode_programming.programming;
>   	DC_FP_START();
>   	is_supported = dml2_check_mode_supported(mode_support);

I will send this patch to promotion test.
