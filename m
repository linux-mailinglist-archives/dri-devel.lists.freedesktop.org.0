Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3432FBD82E6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 10:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7B310E57A;
	Tue, 14 Oct 2025 08:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JIYXQ4Fe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011013.outbound.protection.outlook.com
 [40.93.194.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5E910E577;
 Tue, 14 Oct 2025 08:30:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfnO/Dz37D9wzH8ZvhHlHq6ttzXZL3XakhE3yAfSOZGkEZarRM56tkyPqb33jgVo7wpeGrDiMMZVnPuiVtR4H8VaijPmUM9vvDUJLozR5XJLze4M7i2d42nPB+i8vqd8k09P4cdrGaI+KAe2g7bM9chg4ptbZNTWMzImJXjnniAxtCQ81PYmuuXF6ynGQ9scnHG6q8x97l+DP/nM1pEKDBIi4dedWBFyW9SnYT/24xrIk4NymMQiWtwDsi+oJICUatbRQ7uSNBGhgUn1WaKXy5UNhaYHmy+FpUgjMjt1bHf5jm5Fch4oQ4+PVUJeznOZePbj+nRMSVpsEMriEGSJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJTkmK5pcNEQOKd8C9ZzDNB7V+zaHpciryuY+33OOW4=;
 b=xIaU7aySEk6n/5W3xpNakf4cJMvSOoiWbG+DUym7iKGtoRmE5gI0B6gKCDWk8VAh99z1oivkQkl7Zkl9e3Xl5LxXoNHmw2jdQU10oeVe+D4ubm7ZbQURWJNhxGaaEPeBVP0diIsusGEeywVBhkRTUdeuiUlB2PBIQzKaXkLjA1E4zAKLtQ/vlipQMzs0XJB3iWaHO3BRDcCeADLofJc9FTc7uhVrXAvee0Z0UuBpImjekjOt1N5mJVOyj4GCZN7WAmEGujUMDL4cReLMf6kyKcj9Z6irskB01abRh2v5ysTrJKfngbpsKg8H5tT9Bi+sSCrr+KYvu/ukhWIL4e1A4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJTkmK5pcNEQOKd8C9ZzDNB7V+zaHpciryuY+33OOW4=;
 b=JIYXQ4Fenm+DkZ4p3GVcn7f5RPSGSdMbQdJ1Y9sXawWzgVeWy/tq6xzJoxVPX4vXMlVLiQbulcKPXeu+HehZm4JUnt4LVkWleb8PGBtQzoxgU6p0dM1zqhXr895WRvfK8qpRJmn/E9M2H58L3g9xHgDEPWJH8AIblhj1YluyuLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 14 Oct
 2025 08:30:36 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 08:30:36 +0000
Message-ID: <ecb07389-4f47-469d-a54c-c322af316e09@amd.com>
Date: Tue, 14 Oct 2025 14:00:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ttm: Add safety check for NULL man->bdev in
 ttm_resource_manager_usage
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com, Lijo Lazar <lijo.lazar@amd.com>
References: <20251013085849.1735612-1-Jesse.Zhang@amd.com>
 <8ec09842-563e-4879-b505-bd82ea87bae6@amd.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <8ec09842-563e-4879-b505-bd82ea87bae6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26e::14) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 60cf1115-d57b-4153-de4c-08de0afbf27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEFoNE5iRTR2c1prYkFPbXVseFFXZFRsajZmT1YxOHRzQUFqMWRMTUdLZm9u?=
 =?utf-8?B?QkY5Z2pQYXdXaXdHT1FhbDFjUlFNTXRLQncxSktZUWVUeXgxRWovZVA3YkpB?=
 =?utf-8?B?YTVLRG1EQ1NGdEs2cklmd2VKczU2UjFaV3IzdTIzRmhUSE4rSHBocWlqdEcz?=
 =?utf-8?B?NkNDVTdZQW9GTWJHY2RqVkM2akxLUzB0N3N5dUtTcFFFcUpUaGdxK2JkaG5u?=
 =?utf-8?B?ejFhL0RWZStjbWJ2YVF2WUhRN0ZYU3VtelBwUm9QbHV2NmpXUzlTcFVLSVNZ?=
 =?utf-8?B?UXBaTkVvZk41U3hYWWJaYytONnhoTngzdGpNalZBK25DTUtYT1R3WHg3aGpV?=
 =?utf-8?B?cHhIRC9EVHF3VGJrcnIxbzFWVkx1LzNpUWdiUUp0clV6VEpCNTYvWS93V1Z5?=
 =?utf-8?B?Q2NNQ2VpUEk1VzdXejJrQjBXeUt4QjYzd2VxL1U1OFg4NEwrMHNrR3M4OEFH?=
 =?utf-8?B?akM5aGVZeTUyZWdQVWVRbmtDY3hNQ1F2YldTYXRRU1doY2FZTEt2UzkxRG9B?=
 =?utf-8?B?eUNacVNpMzdyYld4RnY0NXpwdm9tVVBkTWR6aFZCQlN1d0dXdEVvMytpeUNm?=
 =?utf-8?B?bWx5TnJRQ2YzT21mVUNJTlhHckRqK1k3SlNwcmxsemRPdWxTelRGYWM3eERw?=
 =?utf-8?B?cmw0TmtDZWh4ajRYb0hhNjBmdXVoTnh3b2NzSlRlUzhIV0RzcjFpK0JTSGtr?=
 =?utf-8?B?N3E5TmRRT1JlTll5Y2ZBL1FsNVpmZ0pvRUt3cDd1MnFRYjFRd1lWWktybkxy?=
 =?utf-8?B?ckRrdUVPK3l3U1dEeTR3UWJtTVkvYlNFQzNsN0R3Y2pUVFZDOVlDQVB1U0I3?=
 =?utf-8?B?aHFtWnl6N0hqaFZRYkVOQmVsblNOclhTaExGZFhKa0lDMWtRc1V0ZGJUUysr?=
 =?utf-8?B?ajhKcTFFVFhTclVDNE5KZVpzN050OC83UU93MTBTWi94VDdxVm5SL1lMNmVo?=
 =?utf-8?B?a1FxTDljZ1o3Q3MzbloreXJJQlB0RXBuT1hDbjZMS1g1R255QmZDeGpLUlZw?=
 =?utf-8?B?MFFHQ2VBTG1iS1lNWXllUWM1RXJNaFZ6V3FiOTM1eXB6OVN4OEx1RFBvb0R6?=
 =?utf-8?B?SHRRTHg3SWNoSG5RRzlaYkprNjlDS0pRZmJkOFp2ZnpheVpZZ0NaY0Y2OWtB?=
 =?utf-8?B?ai9TTVVTMnBWVGw2WlRLZDBuZ3FFOUtQVmpXM09zVlgralUreTVPOW9uM09i?=
 =?utf-8?B?L2JPWnBvdm9IOUd1VHJGeUo4dG4yNjVFU3hBL0owZDBzQkhjK1RwdUpXMnU0?=
 =?utf-8?B?Tk5XcWVjdTNzeG15dktEWUg4K1J4YWd6c0hYd3BINjNuRDVXWFYrREV6YjAx?=
 =?utf-8?B?SGcranh0ZDBXWjdzaEs1cjBBQ0pDd3JjeUtXQVB2S28yRmNyckNBdmNCaEh4?=
 =?utf-8?B?YWpuVi9CbHgwREhjdk9hWjByTVEra1ozcmp0RUJoYTd3ZHFzaWphZk5Yek95?=
 =?utf-8?B?NVRTaGU4SU4zbXhTSUZlbjdzc0hDbmQ2clJlenhoZG5hMmFQeGhFT2hXcWlH?=
 =?utf-8?B?R2pJM29Wb3pWaGNzdnBvNDdlNjVlejMwTzNObHJHYzFIdXkyYVJkb1FwZGRn?=
 =?utf-8?B?T0JDNWJFaTFrTkt1Z2pGRHI5OGRpY3hxQ0NCL3FJVHhzSzA5VlljV1VxWnly?=
 =?utf-8?B?c3NlbXZXMmhrTFpoaWVtQk1RamZoL1RwYzNDOVdiWXJuYmhEd0JFYWpqbEhU?=
 =?utf-8?B?VGpHTmtsdytZcGhXNUpZZkxWN2tJdSthSlowcWFZYjhXSXdwb0JRYTlDQWZ5?=
 =?utf-8?B?ODVoR2FHYUt4MWl3OXpwNitmMFZHRmZZcjdzN2FFZFZPVG4xQ1RqK2doZEVK?=
 =?utf-8?B?OFBWRm9EczBzdURmcmVEelBuc0tLLy82MHBhWldtWGZLcGVaZXNjMTBJUHUv?=
 =?utf-8?B?SDRJSGFBaER2YS9PdlF6bytYVzBKZm9yWU5VV2lBTzhaUmQ5YVRtL2R2RndS?=
 =?utf-8?Q?y+/zG16hZ/nn1L/O3oSh+xn76kywyjSM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0owb2dDaTZGT21nV05RNUxnQnV3MmtEdnZ6ekNaYnptSDdkZ0J5SzBhTG1j?=
 =?utf-8?B?QytxTHNLSklCR0ZWeHI2OVFrZTk4U2lSd041UTI4MHNHSG8wbHhUR0R2cVFG?=
 =?utf-8?B?ZDI4N3lMSDhlRXZHdWNUY0FQY01qaTh5dFNTYWxLbmZaRExGemdGSDVVWkZh?=
 =?utf-8?B?SEtHK3VNVWVhakpoQW5xTEFnYzQzUEZ2aHdQUElZRUFRL1BlZ2FSMlZXOERB?=
 =?utf-8?B?SFFNcFB5ZzNCR3ZXanlEZUZDS3loZWZBUS9HWE1JR0trcDFESDBuN2xEUk1a?=
 =?utf-8?B?NGM2ajd4WXc3SkFCS0VFekpzRWFvMXVHdUtkS2lkTzdOOFZlejBqeFZsRGZL?=
 =?utf-8?B?UHdmK2xIYjAzNEU0RUZUc04yWStWbkJiYXhjN1ZMNkpBWjE5eWZia0ZlaGVL?=
 =?utf-8?B?Tkl3WDBHOWpFYUxvMFJpRHVSbHpVZXJWd3l3Ym9HZFlIbVVaY3NTU3pzMTh3?=
 =?utf-8?B?MVA5RFZ4MmFqNkhVWHJVeVdjUWRiMmlwZzdWWnppYTBzRk9reTVud3I4SmpM?=
 =?utf-8?B?SDkzYzFEZisveWpPdnYzNHRnRjQ2d1paWFRUKzM1QzB1b1BIbzdEckd1ZzVk?=
 =?utf-8?B?NXJtNHBpcHVnWDU5Y2NkWUFCWFdnMWtId09qSlo4R25UckFJSVk0aTB5V0hS?=
 =?utf-8?B?bnpSRE9VOEt6NlllT21XSUp1T2piYVJiSGxGRFk1VUpjOXZzbHB4ZHBPMUNH?=
 =?utf-8?B?T3NZT1ZIejE5cFE0d2VCemRmdmtnaDFHZmZhZENzaVY2aEtrMVh4QytGOHVu?=
 =?utf-8?B?ZFlaYVhhd1RwUk1SbkdXUnZvYy9FK0VOZ29IdzgwZnBaUXFmUkJXSzhrN0Rw?=
 =?utf-8?B?dUxOQzd1K0xnaG5JRDd6aDRGZ1huTlFjTi9DclQvdjVTQTZPRjNuL282eVcv?=
 =?utf-8?B?L0hXTVA2bEY4bTh2NFdMQ0FKNVg1R1lrdlBOL0JXZFYyZXdHaURmKzQ1ZFRD?=
 =?utf-8?B?Z2t6NWVLdmNnd3E4YmZJbnhGTEIyNkhNQXhNTEJHcDZVWnVCZnlGYVFsQXhu?=
 =?utf-8?B?SE9UZzNlM3piWXdXQ2hFU0NEQ0xDNndCUEJFUDZnTmprT3hlblhCUlgzZ1Rn?=
 =?utf-8?B?R1RxTEpnMXI3M2hkWGxHamV6S2lvazJoeE5xamZvdXN1TGw1dVc3aExWdXYv?=
 =?utf-8?B?b21JdUFJOHNld0pXZHhmQzhXaEcyUW5FUkVUeVZOaktlVnNWb3RMNUF4SkF2?=
 =?utf-8?B?RGtEV3NEMGN2OU9sN1FoTUR5L3M3UnVQeWd5S09nc1NmRXdmWitiRmdxR0lE?=
 =?utf-8?B?WXErb3h6eHo0bG43a25FbEV0dHVqUXJ0bTlzSWliV3pRZnRDTXJNSkRFbE9Q?=
 =?utf-8?B?VjBoem5YbW1scTBkVVJYSzhMdXphUjh0c2oycngvOTZaRGJ4eGNXMHNQVVpC?=
 =?utf-8?B?TnduK3RhQ1Z4Y0dmTGdaUnIzNXh2NXNOY1VNTVJTQm9MZGtSZjFPdkNkcVNQ?=
 =?utf-8?B?bzJrWHFuaCt0NDRsdWhQMk5OdnFLV0VLZjVNcFYrVjZuUzRMcGZTTnR4RHhD?=
 =?utf-8?B?eEdaM0ZkUlFudVhiYkFJVDJmTU81MTkwYmQ4T0xsSzVYOVJqMmVLZ09zUHFL?=
 =?utf-8?B?VjV1Wit6SC91YVoyWEZWTnIzS2FpVmNJeU8rSVB2Z1cvdTJUN3UxK0RKSnRn?=
 =?utf-8?B?MGNvS1hTeWh3QVNvZjErZE9Ec1cvTTZ2TlhvMVYySzIvNEx0dUNKTDZQbzQ5?=
 =?utf-8?B?STdEU05hUDF4OC95MVhwOGVkV2poOHpEbDdsU3QvVllTVjlOTWNPL3BkaWNH?=
 =?utf-8?B?YklUSmtoWHltRGQvcTNROGMrVG41dHNSNUpMSm5rNG5Gb1FVbjdoN0JWRC8x?=
 =?utf-8?B?bWwvL1EwMW9Gaml0dmdIUXAvQTFvbkhDRlRza0NrQzRCNWJKVlhMSkVDVnVL?=
 =?utf-8?B?ekdLVVF6ZWhrUnJ3aENrWGdaKzlieWpReTJRTXdxM2ZobUdrdDhxM3U0UjhF?=
 =?utf-8?B?UDZudXphWDJYTE1rNXBLSURkWVZTejQxL09UTERBQlZpUkx2YmdQbWg5bDlX?=
 =?utf-8?B?bkZMUERpUVIvY1RIaVROSEpxbVN1NWh2a1dJdll0b1NvQjJnSlVxbWNsSDV3?=
 =?utf-8?B?cEpDOFhza2hmeGp3OEc0UzRjUWU4alcvb2FISnpOVFRCV2FzK1BJMGd2eFlX?=
 =?utf-8?Q?1Ggl3kBUk0DCBC8VJP0v2ntPa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cf1115-d57b-4153-de4c-08de0afbf27f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 08:30:35.9438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4d/9PlKX/m+qYa1Bc49TCmPPVZt7/xItZsyIEvMJrIDakP2Es6Fy3KAmaF+nNqoV0XSphCVtZRaV8meeqNqS9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787
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

Hi Christian,

On 10/13/2025 6:48 PM, Christian König wrote:
> On 13.10.25 10:58, Jesse.Zhang wrote:
>> The `ttm_resource_manager_usage()` function currently assumes `man->bdev` is non-NULL when accessing `man->bdev->lru_lock`.
>> However, in scenarios where the resource manager is not fully initialized (e.g., APU platforms that lack dedicated VRAM, or incomplete manager setup),
>>   `man->bdev` may remain NULL. This leads to a NULL pointer dereference when attempting to acquire the `lru_lock`, triggering kernel OOPS.
>>
>> Fix this by adding an explicit safety check for `man->bdev` before accessing its members:
>> - Use `WARN_ON_ONCE(!man->bdev)` to emit a one-time warning (a soft assertion) when `man->bdev` is NULL. This helps catch invalid usage patterns during debugging without breaking production workflows.
>> - Return 0 immediately if `man->bdev` is NULL, as a non-initialized manager cannot have valid resource usage to report.
>>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Suggested-by: Lijo Lazar <lijo.lazar@amd.com>
>> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> @Arun could you push this one to drm-misc-next if nobody objects?
I pushed this patch into drm-misc-next.

Regards,
Arun.
>
> Thanks in advance,
> Christian
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_resource.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>> index e2c82ad07eb4..d93d1bef6768 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -587,6 +587,9 @@ uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)
>>   {
>>   	uint64_t usage;
>>   
>> +	if (WARN_ON_ONCE(!man->bdev))
>> +		return 0;
>> +
>>   	spin_lock(&man->bdev->lru_lock);
>>   	usage = man->usage;
>>   	spin_unlock(&man->bdev->lru_lock);

