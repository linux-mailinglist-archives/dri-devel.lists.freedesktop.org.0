Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1999AB3D2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 18:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1346A89B33;
	Tue, 22 Oct 2024 16:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Pc6f+sNJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B56589B33;
 Tue, 22 Oct 2024 16:24:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjif3MWISmwPo0hrQwoHDr8p9DbwPm661ZDkoRCiwcBeC5CvfLW+Kc0ayht3FoJkSTArxRBMycQDim7p9vGAo101LddZN9m6s5pynGMbFyLNuP8eFeKnHTJSqV4Yupm2HzNzh9idOECzvgPWgKum8k9OjkeBJvCbe50qIlrQRPZsSgtUy+IB4toTjytX0GbNwxdBr8Ogy9ARJcx8E7dCXE4DpujPA7frBJUd8+bINQHWY2j2N1iGbbM77lzfpm0IBEcoCi3xMahKOW8Wjmr6Wl85LezfkuDUShFqf6GazHDiIpCl3FDxapVuzYZRlkhli8daInD+kFhukJ1TCOVXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZvVAWQeb7XWglsOVWRT0IQ1wj+OPoqm0luRO9yTANI=;
 b=gih3lfcsu1IvWyv3aNNHG8pPat+jGM+8ZdOtjPuWpDrJLcskbu4Mhqz96kjRsYyv6grQg4J2HP3c5+FKFdMzZ+VSDj3ptCFPmGvp5QgglKVUzXSYeFm7VEJcKo1HE/r9NBJgoihdKOoDVBu4ppQIFjU54GnHV7+rmgZoI/cbkgHSbT6eDQUyakwVLTJ+WbIGMao9sqhNYE7YWEgroVnDgQHJqcIopQhcB5vzLUkjSnmVV05fskeZZ4snnoHNj6CFkL6W8cZ5pS/gKIlVQKgzKdUz4a2RvDyTvBjeaeVjothucUSAyWJut5mEXeRsxOPvRT0IUZcPH7TIigToF+aMag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZvVAWQeb7XWglsOVWRT0IQ1wj+OPoqm0luRO9yTANI=;
 b=Pc6f+sNJTqSOtB7v2dEPFHcJnnCJjVECxeXTAAFDmerRYLyuUMJUvQl+khABmO/FdXalPlqLSWud8c01xE7bwk8/MNklb5CazCEXbuMRorAS+UqsONkFCJHZ4pi2MjDktrfTv662OZs6aKronchm5vzinwPxExneB/rkcV5cz1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8008.namprd12.prod.outlook.com (2603:10b6:510:26f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 16:24:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 16:24:50 +0000
Message-ID: <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
Date: Tue, 22 Oct 2024 18:24:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
To: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
 <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: 250f0877-0a99-4224-f2aa-08dcf2b60d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGtiL2gxa3lZS1U1S1BuYVJSSlJ4VThMRG1zUXFEdWNZQ2tiZG1uUm80YU9N?=
 =?utf-8?B?NWpCQmxMOFJJak5pWHRlVUhxQ3ZBK05Nc2Z3ZFJHeERpT0hVd2lUTDBCbTdH?=
 =?utf-8?B?N3dHM3JBbUFFSlNyUVZZYXNrREVPdFl0bnhMVW9IZlZmUmExa3EwZVJRVEZn?=
 =?utf-8?B?MW1TN3Rxbks2KzIwY3VzZkdvWnpjeGhOVldKTVNnU0UxTzZ6VjVOT1RTZjZV?=
 =?utf-8?B?SmVWekJqZXArbVV2QWNYSEY3Y085UUNrUXNxN0pUWU9HeGNDamh5NnF5alhx?=
 =?utf-8?B?ZWNDOEZMbWx1ZVpaYTI2djc5eWg1U3IxeWRidVEvVXorbDh4R0RVYkYxQW5Z?=
 =?utf-8?B?MmhJQmtJelJzR0pWbTU3Z2puTkprcTE1NldBSkFoUldwL0taN29xdE5NRDdR?=
 =?utf-8?B?QjB3Z2E1bHV0cDRBNHcrUktldXI0RUtYcEpLN2VrUDl4SE5ua1FLbThWK0lv?=
 =?utf-8?B?a2pUOEd3b0xpaHpuOXpzT2E0Z0o2akpaOUFqRTE5emhYUzB4K1NpVGlYbkdI?=
 =?utf-8?B?MmV4MDdyZVdlZjFkekxXMDB0cWwyZFNqQ3QzMzZMdEx6ZldMZ05mZmtaUk5n?=
 =?utf-8?B?S0ZmbDVzZnAyOEtPUEZvQ1pUSGVVdkc5em1ydjd2K1pXcno3VStoOEhTVmJk?=
 =?utf-8?B?b2dKWGhoYnhYYnI4azBlVDZrbU1lUE02VHZvWTI4WU9IS0NBTmRoMWVPcDR5?=
 =?utf-8?B?L0FOa2lyd2VEYkx4MlpPQUJtU0p1SnpGbFlGU0tMWElyRWVXeVk5VHFHWXNU?=
 =?utf-8?B?dTVFRUd4MmhzeTJaaWFmbjQ4bFovZjlpcTNRL1ZuNnVXK0x0NWZhZUM3VHRs?=
 =?utf-8?B?N2UzRmhZc25qcXljZ2t3dVB0b0VBMHgvbmxjWVR3NHE4Q2xwaGNVU0lYb3NO?=
 =?utf-8?B?NGpkTXRUVDAySE1aL3dtQWVGUEFjMzczNkoxU3Q0VDl1Z2ZMY3cySkR4RkpQ?=
 =?utf-8?B?TTVpWEt5ZGlUQjhQeUhWZnNwaWo3b1QzOEN5Tzloa2wyK1c1S3ZuYUNTZDls?=
 =?utf-8?B?QUtLS2J6THdVbUtSMUIybmxoOVdka3huY3ZmNml3aGRITHQ2UXdJdSt0L1k1?=
 =?utf-8?B?N2dESDcyRk1mYUp3cVowRGNwTmpjdWtuc0xwaGtBSEc2TWtZdzQxV2ROL3A0?=
 =?utf-8?B?R2IrMXFpbnRldHBuUEdCaEZnK1lOMjZNZEJSVUNqUTZGODQvVHNlc3lmWlpo?=
 =?utf-8?B?RTBEK0MxVFJkRFovRmJPYWQrdUhtWkVDb3YxZ0REcERRcyt4NHFUSkZKUWZF?=
 =?utf-8?B?NXZQaVZZeDlDMk42a3BqS0dhVk5YZHBDdFRQa3B3RnV0OXZIMWdWT1A4M0VS?=
 =?utf-8?B?L3FicUJvKzZMZEVZNGdCOFR2dTI5R2hDS1U0WkcrSVhzYytmaE9qNDRkN2pX?=
 =?utf-8?B?bFM2THIxWmJ3aUd1cVNSM3B4T2lqMzhMcEhpM1dXY2RRSTQ5Rks0SDJLMDM3?=
 =?utf-8?B?YzY3dTlwRVV6MW56NHJ0NFVDN09UMWxjbXh2bFB4N1lOTG40MXp4SHdpbkpo?=
 =?utf-8?B?RlQ2Z250a1kwbnZoZzNsOGRnUWNVTjBTZzd6SFBsc0pON3JzREFxdERJVlR3?=
 =?utf-8?B?RjUyR20xUWNQK1d2RVdReGpMYXY4em9hS3BhRmFPWDRnZDQ2L09RRmpZekFO?=
 =?utf-8?B?OGFTb0xOZmhPSU1WcXFnY1RreEM1eCsvaDlQZFJOMFk5RVVQNGcyT1hsYkdz?=
 =?utf-8?B?UmM1dk5XWmFld2VSS3pVTFRhc1g5VWhBUS9WYWkyRXRVais0MnpQM2I3d0lz?=
 =?utf-8?Q?3lQkmROauA6FUSxBeuV2CpNNCxkxUCktZs4mkLi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGhpUXRXWmtVbFJKeVpsVERWcU5Hb1ZEQlpYVU5ENFlwZDQwemlZUFd1UVhm?=
 =?utf-8?B?RGhsZjBxRDRtY0ZFTmNJYkF1djh5VWdrTXBRZysrbDJROVB3MnJZRDFjRksy?=
 =?utf-8?B?TGF1MjVwU0hXdG5rSVpqMDE5VURESS9YV0lKbnJ2dUhSTFNjU053bXZFRlFi?=
 =?utf-8?B?TUtaaURzOFFEeU9uVkR5cjhGeFNYM2c0dU9jSnlYL1drWkpidnZXY05nb0o5?=
 =?utf-8?B?N2kyMm1IczNhcUNhaDlxR2hpVnlHNndPalFCU0VZNXFBcURUeWF0UER6clFO?=
 =?utf-8?B?cUVhNmY3TnpqbGhmeWtPSWl2ektXbnRQeDMra21MM2RlZ2czRjJUc3gxT2li?=
 =?utf-8?B?YUVEbzd5ZlF3enlmYjFaajlFOXNkN1hIN0RNMkhIYjMyUU4xM0lmZU1WREJD?=
 =?utf-8?B?SE9YN2RRdklrZHZvcVFXYjB6UENnY0t1MSthaTJVN29kUVdzWWMxSXJWU1VK?=
 =?utf-8?B?all6dHBMMXZNVE52RWV4a2ZIUmt1dG9WbktIbWhnejBMaWVHS2dGUGJYWHkx?=
 =?utf-8?B?a3VYT3BER0RGVHpvbWVLUDVsSXVramsvTmdldUx5a0pGY0lsK1RCenlVR290?=
 =?utf-8?B?TEhpd1dXd3lGZVlqemFqRlhoMzlXZmRybG81OTYwM3RVTHJROGZpeVF2L3FS?=
 =?utf-8?B?ZDhyRDJ3NFRMZ0ltbUU4VUtrYi9iVkt4dDlGNHF2anRpVE1FZmIvdlZZVHpl?=
 =?utf-8?B?Qld6R2JQeldkSVFicnBIWEN2MWNRYUt6L2NsK0FYNHJocjQ5S05BVk9od3do?=
 =?utf-8?B?OGNLcUxLQXFjQkoyWit3R0gybnVMbkhTdmNSSHY5bUVXT3NVdG0ydzFPNTVL?=
 =?utf-8?B?NVFLYzJNSDhKaVZLM3BGRmp0TkVPTHhhSndvSFRyT3hNZmdoTFVRdmhFSWhB?=
 =?utf-8?B?YWZ5K2VXQjA0NU9heWxhTEh4RUk1U011b1lLUnlGc0VFVFZkK21vUHBVeE5y?=
 =?utf-8?B?cHN5T1ZNNnpjUytlRzZkenN0QytaZk9SQVFsb0IxQ2dhVEdOSTI3NktxRFQ2?=
 =?utf-8?B?T1NHbU1wWjFRYWJHaUpyRjhZb0lYalp2RFpVVVlNN053SnIwUlNRMXhUazd5?=
 =?utf-8?B?YlR6MjMrMnhGSDc2b0xhOUZ4dTI4MFlRYmZQSUdWVFc0Rk9HZmFmckNJRzFs?=
 =?utf-8?B?Q0hGMlBxanlmTkhaenJTK3pVeG5hcVhNOVBwOUhXZ2pIdUJHVXd1VHZsV3hy?=
 =?utf-8?B?Q0dncWY4eXN5WWVIUEZka0pjMTVMYXlwM2tLWitIOEtEcUdpYVFKWmFLS3pG?=
 =?utf-8?B?RG1MbjVaZTFUeXNCbjdLRkY0bGpXdEk1bmtZTkpuSlB1a2hvMTlNMVJnQ2NY?=
 =?utf-8?B?V1N5SkdpOFc4VFVTcUhLcFVRdWw1Y2VvSDdtd2tzRnFFYmx4YWpNV2Y3ZmZF?=
 =?utf-8?B?VjRTdzNQUVF3UHM1c2RiQmY0T2liSGQrc0tXN1BWZUwxZG1UdkdNMW12WE9J?=
 =?utf-8?B?U293SFQ4Y0xWMGpvd2MvOXpqb29CWm5jYjlYNnFPVVFVMUpHbnB3cENMcHFI?=
 =?utf-8?B?L0N2YlYzcUFWSml1ZkcvVURJWXlYTkZ5S3BjMDRDSWp6YldaQ0NqRm45d0dD?=
 =?utf-8?B?Z1d0NVpsakZCVmtCMkVXOXE2WHFYWHN5eWtZZjYwVTQwRFVYK0NsT2Q4Y2Zr?=
 =?utf-8?B?dHdwbEh1emlQVm9DZzZNekZUczhKQ2JTcHpTTmszNmJDb25wZXV6ZG8ydHVU?=
 =?utf-8?B?RW9COXozbG9JcEw4WXk5UXRQZHdMN2t6d0hjdEw4djIzV1FuNVZCeTNHUSty?=
 =?utf-8?B?YzkwV1JiNkhzNVdOMHR0dkNqZzF0OGhQSjgyYlltRUJmTGhYRHRGSjYyMSt5?=
 =?utf-8?B?N2lEUy9RZzlCcXU5VnVWRTUzNzQva1RkK3ZSYUc2Yi96M3M2YUpWeXd5V204?=
 =?utf-8?B?VHF0TjRxS3hubnAyNk82ZGtpcUs5czFkM1M1Q2sxcGFuZCtWVzhpY2Fyejcr?=
 =?utf-8?B?emNtRnRDUkVncys5WSs2WU9CZVdRRnhFQU81VDB0alZtVzh1WFpOSU1UNkN3?=
 =?utf-8?B?a1hJWFNHcHhvZjI5aWJIczV1c0NGYUNySFBUcGdUYTZIWmJVUnY0MFJWVitW?=
 =?utf-8?B?U0g3bXJsU1V5Ky83QWQvNDdYM05yQ1czaXFiL2owZnBBTXo1d3R6UEVYdHJl?=
 =?utf-8?Q?35AY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250f0877-0a99-4224-f2aa-08dcf2b60d51
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 16:24:50.2651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wucZNy+JMgMp5Li+O5qAYbvQnB1E3YW+VjEOUH+XrKOaqniSGVcsuu1QRFSsASlG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8008
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

Am 22.10.24 um 17:17 schrieb Li, Yunxiang (Teddy):
> [Public]
>
>>> +static uint32_t fold_memtype(uint32_t memtype) {
>> In general please add prefixes to even static functions, e.g. amdgpu_vm_ or
>> amdgpu_bo_.
>>
>>> +   /* Squash private placements into 'cpu' to keep the legacy userspace view.
>> */
>>> +   switch (mem_type) {
>>> +   case TTM_PL_VRAM:
>>> +   case TTM_PL_TT:
>>> +           return memtype
>>> +   default:
>>> +           return TTM_PL_SYSTEM;
>>> +   }
>>> +}
>>> +
>>> +static uint32_t bo_get_memtype(struct amdgpu_bo *bo) {
>> That whole function belongs into amdgpu_bo.c
> Do you mean bo_get_memtype or fold_memtype? I debated whether bo_get_memtype should go into amdgpu_vm.c or amdgpu_bo.c, and since it's using fold_memtype and only useful for memory stats because of folding the private placements I just left them here together with the other mem stats code.
>
> I can move it to amdgpu_bo.c make it return the memtype verbatim and just fold it when I do the accounting.

I think that folding GDS, GWS and OA into system is also a bug. We 
should really not doing that.

Just wanted to point out for this round that the code to query the 
current placement from a BO should probably go into amdgpu_bo.c and not 
amdgpu_vm.c

>
>>> +   struct ttm_resource *res = bo->tbo.resource;
>>> +   const uint32_t domain_to_pl[] = {
>>> +           [ilog2(AMDGPU_GEM_DOMAIN_CPU)]      = TTM_PL_SYSTEM,
>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GTT)]      = TTM_PL_TT,
>>> +           [ilog2(AMDGPU_GEM_DOMAIN_VRAM)]     = TTM_PL_VRAM,
>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GDS)]      = AMDGPU_PL_GDS,
>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GWS)]      = AMDGPU_PL_GWS,
>>> +           [ilog2(AMDGPU_GEM_DOMAIN_OA)]       = AMDGPU_PL_OA,
>>> +           [ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] =
>> AMDGPU_PL_DOORBELL,
>>> +   };
>>> +   uint32_t domain;
>>> +
>>> +   if (res)
>>> +           return fold_memtype(res->mem_type);
>>> +
>>> +   /*
>>> +    * If no backing store use one of the preferred domain for basic
>>> +    * stats. We take the MSB since that should give a reasonable
>>> +    * view.
>>> +    */
>>> +   BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT || TTM_PL_VRAM <
>> TTM_PL_SYSTEM);
>>> +   domain = fls(bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK);
>>> +   if (drm_WARN_ON_ONCE(&adev->ddev,
>>> +                        domain == 0 || --domain >= ARRAY_SIZE(domain_to_pl)))
>> It's perfectly legal to create a BO without a placement. That one just won't have a
>> backing store.
>>
> This is lifted from the previous change I'm rebasing onto. I think what it’s trying to do is if the BO doesn't have a placement, use the "biggest" (VRAM > TT > SYSTEM) preferred placement for the purpose of accounting. Previously we just ignore BOs that doesn't have a placement. I guess there's argument for going with either approaches.

I was not arguing, I'm simply pointing out a bug. It's perfectly valid 
for bo->preferred_domains to be 0.

So the following WARN_ON() that no bit is set is incorrect.

>
>>> +           return 0;
>>> +   return fold_memtype(domain_to_pl[domain])
>> That would need specular execution mitigation if I'm not completely mistaken.
>>
>> Better use a switch/case statement.
>>
> Do you mean change the array indexing to a switch statement?

Yes.

Regards,
Christian.

>
>
> Regards,
> Teddy

