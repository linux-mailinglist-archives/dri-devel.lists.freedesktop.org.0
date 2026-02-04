Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJqxH+uKg2lWpAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 19:07:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F4DEB676
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 19:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37AC10E728;
	Wed,  4 Feb 2026 18:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JjWmIgLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010001.outbound.protection.outlook.com
 [52.101.193.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E13510E728
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 18:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3X41L9D1yx7Afs+cX27FFZsrrPkPG9ZdfQ4u8WEFdXoMaM6dVM4g7gGBmOFK/Eser6bmydDOSUf7y0EAX5mA1JuzjDEYSqnd/a+d5eMKRtRcPyKbkRhWrknA8yZj39lEd37+K11cge67QiwCb6APUcZ3+j1BNm/ch3+xmhimaa3PeG8SmY09OmPZ8xikR7IDVarHy7aiqgDylicDPGqkV8yprmBJyNobHsROP5NjmZDuDIfDAWpS/OWMCaRmaIkDAbY925Jpi1EiebtFa1Lwbx7nEA/YCcYZVLSinTuXSG3a30M9JZLdo5pt9T/7Kl1iJplX1EO99CnnvwFV7iLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmaPbT/AEbwY1En79eyP9+EgShbOdJfSySPf8Dt5lrg=;
 b=uFVP7tY1MaWeebAC3AKiM6WZEDyn1YmI0JKhpjuMuVX/k49sW5zkGZQm7wYIH6v9a6Ku7cqdD9XcR9YVIvcQMxnSgD9Xi0Dm+w64CKxne9wyQJxULC5vGOXwbBeBi2wEDcIT3GgE7p5hzx/Yz0sFgwwHCipuSQ8Wti9/+zdsffCLQe+3YYz0fxGNkRn+Dek5xC6aL1p0G2cCXOILsJLcf3IrU794Y1e8VdwympDWXUG3rDG5djVwvB2tWrK+35kg3P4ZdvA39roqBufEhMtdCMpyOjh3c84QF/phwRK1G9y0jeBZlKbU9xp6BJg8GCgtpPObrVx6HsKNNvHVqPdvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmaPbT/AEbwY1En79eyP9+EgShbOdJfSySPf8Dt5lrg=;
 b=JjWmIgLoAlhv7z9XR1ySbJEQc7DtrwrmwFjIHg2n9AeU6y1gTi5kMbPpu9t39EVIBvI7A7eA5CCtp0jwhVj/cAirgETyjXSXK/KMTvKxGadM/eZ5etHvGF7HAKjuma5/6CXtXkuiMi9QAx4hsq6AvDZE4IbRNocEplMJ18CPdP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9078.namprd12.prod.outlook.com (2603:10b6:610:196::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 18:07:31 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 18:07:31 +0000
Message-ID: <49984935-fcf5-4b69-bef4-d514ef67366b@amd.com>
Date: Wed, 4 Feb 2026 12:07:29 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Move RPM resume into job run function
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260204171118.3165607-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260204171118.3165607-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0095.namprd13.prod.outlook.com
 (2603:10b6:806:24::10) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b20fe7-4df1-48de-48cd-08de641843ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3FSR0Z0RjlnaUZ2a0pmZm92bFVsbDVCSWt5Y0pxKzExOUxOYzBDTWx1b1pV?=
 =?utf-8?B?cSs0Q1hkc2N4WDZSbDZUTTdnYlllSkNZZHhldG5DbWlsWElMNGZzampIMVFp?=
 =?utf-8?B?YTdhOU03dUM0QnUvYVpxK3JSaWFGUy9tVUdnUld5NEpYc093dFNJYjlCVUxG?=
 =?utf-8?B?eGdRRWxHa01HeXYwMWd2Q1pCVm9RV0xmZ1dac2VkUUVlV0toQ0EzbWIySzUx?=
 =?utf-8?B?UzR4RnViOWRKRUFUQmFMWStpRmlGZW90T0tnTG5BNnVEVzBIdU5hWjNMLzNt?=
 =?utf-8?B?TUM4ejdEbURQWWliMFFEd25GdFNuLzVHUnZwTGlvK0V6RXZFWmVIN01peUdT?=
 =?utf-8?B?bXNhUldPVUdtcVBRemJsRnhCNjVxdk5NK2lQQUJ2cUhkMjBtMWRoMlJCOVpp?=
 =?utf-8?B?ZFdzbmlKOU9wOFBpNkl4bFdXSkRPeWg1eU9FNXphWVdvOHQ4aVpkemZqSEUx?=
 =?utf-8?B?Y2g2djlYZkppSCsxVnppWGp0OExBTlJHK2d3VWFDTE1kbWh3eUhFWTRyL2hp?=
 =?utf-8?B?SVpYVHpNNDF1NEdqSG9CTXY2UjM2RUVJVU9IWVhyL0pWcjFkRHd1TzFhL0Ja?=
 =?utf-8?B?cldOeVdxNHQ0emFESWROZC9aSXJmcmtpYmhFL1lzOFBQY1lDell5VnpDOWZH?=
 =?utf-8?B?MmtOZHVZZkh4NG1rZ1pGczNWL011WE9CR3RvL2ZVZVlsa3kwcEhVUmtENTcw?=
 =?utf-8?B?eklpK3NMRHAyV05jRzZxT3pkc3o2NmdWRENuZ21GeU8veHVOZXU4bWMyc0Uw?=
 =?utf-8?B?T1pQYmgwL05SK1NHd3NlN0hTRnN5RmJzK3FTYy9pTWY3Skd2ckQzU3lodEdn?=
 =?utf-8?B?amdvOEVKS3d1OFBKdjlXRFpPaGlBeWhPS093TkZQcXY5cWQxTzFvb3NvSFR0?=
 =?utf-8?B?UzE3UHZVQjhBajQyV3haWDFyOHR3ZDNkK0VuczhkQ3ZWNzI1NWtVUTVhN25X?=
 =?utf-8?B?bnV3NStTMDRvWWMwSkMrWXp5YU5jTk1JdllVNEJ2WXVHUE9JZWI0c1diVEZm?=
 =?utf-8?B?bmZwZ2FjVWpKbENNclNBbnFsZjExYyswZGpOcWczYm5wYjcrclZhbVhyWGhE?=
 =?utf-8?B?WTFGNXVQbDFWRWM1UWxaZWVMQjhBZDBsVk13L2RVWVAzemhOMXp2b0loTmEw?=
 =?utf-8?B?UThIODFDaVo0TVE1Qk5rTHcwTnlEWVYvWEF4dXVDcVZZcWt0Y2dRUHRDRnFT?=
 =?utf-8?B?ZVBza00wSlFpKzZMbS9jYks5VXoxN3lGVDhWakxMS0s0ZHBkdGtJOUJERXJh?=
 =?utf-8?B?Wnlxem1RZFRIRzllS3NiREJqdkgwS0tNcWR6Wk52SEVsMFkyQWg3bGdJUkU1?=
 =?utf-8?B?RkFsdXhxdHlDcWdlNUdkQ2hrTDVEZUJJc01DaVZ1UEQ0RTIrbElTdWxNWlVp?=
 =?utf-8?B?Tk5qUnA4Nk5iRlVSaGk0V3pER3hNUjNXUlo4TVFGM2RjWlFTY0wrUDB2d1c4?=
 =?utf-8?B?UEd4REdkUVAvVEsySkhLN2lYd2hxUlloOEQ5UDFtdzVHZm8yRGVEOUM4SEpY?=
 =?utf-8?B?QWsxMXZBR051a2xTNWZUMjNmNkJOS3hKQWhZRXM0bDB5MkhtaDZZNnNTMXlB?=
 =?utf-8?B?QTByc05EYmVxS0V3eW9uUzZ6dWFlSEVvWW92bmoyS045bi9ScytVQ1ZiTGNQ?=
 =?utf-8?B?N0FBRkROWktNbXFnRVBlUDBublZ4QXl2dXd2ckRwNGNSdGJucGpFMEJHZktW?=
 =?utf-8?B?RzhuOUxXTGtiQ0w3cFNVb0VnYm5uT1dpS2hwUjl1MGdWMDcvU0c5OWw1ZjNi?=
 =?utf-8?B?cWsrVXVzQzRVVXpLVWloQnhBQTg4eDRHM1l4VCt1ZnFyTnJYS21hTDNKRlpD?=
 =?utf-8?B?cmVDQW51YkZFcDlBTEtreUpjNWplNzVBZi9HTEFtUUFRWUlxN2J5R3FlTW9U?=
 =?utf-8?B?QndOTy9ScW9zMGRrUjN4Um1BeGErVDhqT0lNQnEvNU8yL3NDelNDNHZHd2NF?=
 =?utf-8?B?Q21CdEJxVVRLOVJ4ZWR4c3BOalVhbC9UQUd1TndTTmd4QlV6WkJWZHRHZ1lj?=
 =?utf-8?B?RjRRVDJuSmgrM3Q0dnAzbkk0SUozc3NpY1NFL2tPVTVkVlp6RHFNd0MwMjV1?=
 =?utf-8?B?RnRLcEdtRGs5SjhGNEg3MW9pTUZuay9iV25tZVZXclJHcm1ZTzR0dkdhdWpG?=
 =?utf-8?Q?agBk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWUyM2QxeDVoVWUrUHp0QlBkalJkd25IYWM1OEFmMzNEakpzdE0rb0IvNWdz?=
 =?utf-8?B?K2VOaWc0Nk0rMVJXTFFvOUk0UXVkVVg3RjRoendEMzZ6REhZK1J0dFhiSWJU?=
 =?utf-8?B?Sm9mUklkdHZQNktFemJFb0ZDR0laNjFSZzVQQkRvZ0hvdEpaa1RYdW96K2pj?=
 =?utf-8?B?RkYvOUFKVUxlc0tTOTNEY2xqY1J6TG04dFdYbmw3Vjd5RTdPNXpoRWVhcHpF?=
 =?utf-8?B?N1dOeGZ4U1lNNEhlOWNGV3lBbmsxdjZjNlVUVlFXSjhnWVlsOEgyY3ZBWEJx?=
 =?utf-8?B?MzdNL08vQ2hhb0M0RVFlSC9zR0JHQUl3QmwvNjdoWWc4TXBpNVRLU0VReVJy?=
 =?utf-8?B?T0dhVzJnTGtqakhZOS9ZbzZadUhoVnh6MDNnR1NjT1dUOTBJTUdMNG5xUWUx?=
 =?utf-8?B?T0pJN3pDd1hWNS9JRU9mN3NFWHZPYmxjeDhzdDNVL1NZcmRkenFyTUh4Nmhz?=
 =?utf-8?B?ZGMwSDc3cTdEQ1c2Y1JYVXZxbzRnOGRzZllYYnhta283OGZNbFJ3aW5PY1dW?=
 =?utf-8?B?Q2dSWjRMa1UzY2k2UWcwRzBSajBscmNEdDZLRHNJY0ZRS1pnTGJIZGxwbStt?=
 =?utf-8?B?cm9ZNDh0OTM4NXJySi9qbFpjenNFMGVKZGJBRGJkMTRaYUJ6bVo2RFU4ZU4z?=
 =?utf-8?B?Y2ptd2tSZjJ6RS9aNW1GbTJLREwyMGlMdTN5bFQ0UWlGM0FWWDQzblhPUDRh?=
 =?utf-8?B?Q2RZSXBiMFhkcTNPRjNuMTFBNjAwVlVNV3Rjb29wWDhyRTRzK28reTREM3FE?=
 =?utf-8?B?ZnUybHN1VU9pWlVTQnBWZWxGU2FuZS9MOVRNTHlLTGlkS3dpdmh0cVZoMHFl?=
 =?utf-8?B?ejlqeG9wM1NacDZFZ0NMMnpvRTg5YmRGWkFObjJHczBJSXF2ZUZIVUxoc0xI?=
 =?utf-8?B?eWJ5MzVqdHIyVml6Q2VVMXV4b3dQZ2tJMUNZalhwbXR3VFdpNlFsTmdPSTJt?=
 =?utf-8?B?Z0ovalVSM09idktzUElTN1F5L2RqR1ZWRm5UcEwyZXJEY1NpRUU5cWN0ZDd0?=
 =?utf-8?B?YnJVK3B4MHY4eXpONjFXYzcyTlVTMzY4Nm0zNWdTdHlTbDFNc0xFaTVmdGZE?=
 =?utf-8?B?UHM3NDAzdlJwKy9WSEk0Y1hLNVZjL1gyRUcvTjFrUEljT1JlMG0xSitxSzdq?=
 =?utf-8?B?L0VORzY0ZWJzVGxQMDlacC9NKzdENHY2ZjJGcjc2eW5RSDVXdTExYzBjZEhu?=
 =?utf-8?B?UWI4REgweXk4TDFxQ0NDTWVsZlk5aDhJa1UrVXowOU90WmxNOG5uSUlCSlhT?=
 =?utf-8?B?QXcxRkQyK3ZWUFgyTDNsQ2hQSDBaTUJVTlRFZ09NYnRQSHZhWHlqUUdBdTZy?=
 =?utf-8?B?YjVaeGZvK3NEbS83MUwyRk44WnpBS29RZzl2eG1sNW45NVdNUVZ0T1c5ZUIv?=
 =?utf-8?B?dUhRUmtnQ3cxT3I1SnkrbVVTZGVTSGloVWdMUnBvZjhPYlZwa0JTb0RZblNw?=
 =?utf-8?B?UzNTSFR4MHJxRmFYZW1lS1NBODMxWkV6c1hYMDBBNkNwVm9kN2FFendlRTRa?=
 =?utf-8?B?TkNHdFQyclp4ZDJFajNNSmEwVDhOa1AwZ2tFUUw3U3E0cktOSHhKc2Y2b25m?=
 =?utf-8?B?OVZ1TXc4MWt1LytrRll3QWprMTgyK2w1Nm1FY2RjY0lUL3hpR1RJblBPZTFB?=
 =?utf-8?B?T3VpTThpeTQ3ZW9uQm9OMUpRNlJwaGFpRDl2Y0FramhKZTBEdVgydVFyeWxs?=
 =?utf-8?B?YUM1THBnZERvS2IwSTNpalhKaUgxUXJGNjQ4M2JFZDBPeDMySUN0YU42Zjc3?=
 =?utf-8?B?bHBzUUlFUG93bTNrWXdOY0s3c1pBUnB4TjRWbERNbE1UbG1DWkJwaDk0ekxC?=
 =?utf-8?B?V1Izbno5QlVudnY3L2pvYXprNmJhVjdDa1A3cjNuVkluakNGemowaXFFTmtu?=
 =?utf-8?B?WVlzeUNuYkFFeDUwMm9QYXlVVFpQVXZ2V1ZXemdpSlM1TlVzSkhMb1dORlhG?=
 =?utf-8?B?NWFIVVBUMnlaYmRjM2U2SmgzNCtTTS9pK2RHSWsxdEUxY0dmeERxNTdhSE5o?=
 =?utf-8?B?Wml4K2t4dGw0QjFpdGpncCtVUkUyblF5VGtYUXNQaUVqRk5GVGtlMXlQbWdz?=
 =?utf-8?B?TmZBWXlEd3JUS3l2blFqSEtPcUNZTkVCVkE1bUNNVG9OSWZSdEp1MW9JdXln?=
 =?utf-8?B?VDVITStKL0U3ZU0xcExqU29lbytCWkYzcjNMVGJZUW9Vd3JOS1VQeFFGbE1K?=
 =?utf-8?B?NUN6c3JpYVU0TEVRcklSVU5qeTZ0SldvUUt6S3oxOVBLSXQvUFJhS0V2RW5v?=
 =?utf-8?B?QkRScHF1WVV6K0RqaytNUTN1UTMwU2ZnYlVTZWZLT0lMbFNjR2VJTUVNUUI5?=
 =?utf-8?B?UGd5NVJHNnBFQnFOSmVoZmsvaHE2enlVTDZyemdZUlBud2k5UWdGdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b20fe7-4df1-48de-48cd-08de641843ff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 18:07:31.7460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UhFMMe2AnsSJ01wSfbyVoW2mxMq3oVrJu4rJQrX8hlRvohfzRCIJ0IwLxgS99XKdm48xDnZQn0Ag58T3YpRaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9078
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C1F4DEB676
X-Rspamd-Action: no action

On 2/4/26 11:11 AM, Lizhi Hou wrote:
> Currently, amdxdna_pm_resume_get() is called during job creation, and
> amdxdna_pm_suspend_put() is called when the hardware notifies job
> completion. If a job is canceled before it is run, no hardware
> completion notification is generated, resulting in an unbalanced
> runtime PM resume/suspend pair.
> 
> Fix this by moving amdxdna_pm_resume_get() to the job run path, ensuring
> runtime PM is only resumed for jobs that are actually executed.
> 
> Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index fe8f9783a73c..37d05f2e986f 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -306,6 +306,10 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
>   	kref_get(&job->refcnt);
>   	fence = dma_fence_get(job->fence);
>   
> +	ret = amdxdna_pm_resume_get(hwctx->client->xdna);
> +	if (ret)
> +		goto out;
> +
>   	if (job->drv_cmd) {
>   		switch (job->drv_cmd->opcode) {
>   		case SYNC_DEBUG_BO:
> @@ -332,6 +336,7 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
>   
>   out:
>   	if (ret) {
> +		amdxdna_pm_suspend_put(hwctx->client->xdna);
>   		dma_fence_put(job->fence);
>   		aie2_job_put(job);
>   		mmput(job->mm);
> @@ -988,15 +993,11 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
>   		goto free_chain;
>   	}
>   
> -	ret = amdxdna_pm_resume_get(xdna);
> -	if (ret)
> -		goto cleanup_job;
> -
>   retry:
>   	ret = drm_gem_lock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
>   	if (ret) {
>   		XDNA_WARN(xdna, "Failed to lock BOs, ret %d", ret);
> -		goto suspend_put;
> +		goto cleanup_job;
>   	}
>   
>   	for (i = 0; i < job->bo_cnt; i++) {
> @@ -1004,7 +1005,7 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
>   		if (ret) {
>   			XDNA_WARN(xdna, "Failed to reserve fences %d", ret);
>   			drm_gem_unlock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
> -			goto suspend_put;
> +			goto cleanup_job;
>   		}
>   	}
>   
> @@ -1019,12 +1020,12 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
>   					msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>   			} else if (time_after(jiffies, timeout)) {
>   				ret = -ETIME;
> -				goto suspend_put;
> +				goto cleanup_job;
>   			}
>   
>   			ret = aie2_populate_range(abo);
>   			if (ret)
> -				goto suspend_put;
> +				goto cleanup_job;
>   			goto retry;
>   		}
>   	}
> @@ -1050,8 +1051,6 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
>   
>   	return 0;
>   
> -suspend_put:
> -	amdxdna_pm_suspend_put(xdna);
>   cleanup_job:
>   	drm_sched_job_cleanup(&job->base);
>   free_chain:

