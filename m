Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G1XD1w1hmlrLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:39:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1023102145
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0111110E8EE;
	Fri,  6 Feb 2026 18:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zGSOzCT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012024.outbound.protection.outlook.com
 [40.107.200.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC9210E8EE;
 Fri,  6 Feb 2026 18:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZfjTpUN5S7R9nWOmILo4YP7msjRguy5GHy5Tk+GjiEhOZXU1xynor5fFa9am8heQyacclRxw72iy9zPxPIlzsv2cPoplLF1edW7iDqd8BvwCz3fvgN9pGSN+KvyQxaFs86ISHYKRmS7/1eFOZncbno5y8WZrWRbditxt2aNEgPPOTgt7zMSXsjhynmt3xrEJ2OZZwY+jiPb9zZBKRmP3kM5M5vErSwSywpKXTj4nsKqJcQGGwmX90VxOq5mWthvTZlo5ZnF/1mENOpHLHsyzQM4M/dF0Z6WyEBaP0SNz97IBVyzkaqIbhh+mZPbBSlEPN2qzQXgH6otDlFTBETzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vy8RT5MmDe6GXHYrIer/6XxgS6VSLrjp7//LmIe11F0=;
 b=jrM6s+IcPAsKSagG+6vqo8crE5IbZtSLKtLJICTD6ojVfhUDKCuEm0bHTwMGYVti91rq55C0JvmVKm2PvfSaoSs9ep9u9WyZpnLXvPciZHrLEcElB5mp7J+IHuchbrmRq0fmmJuJFMWIoivAmlhwQ2YwH9qr+jDesDFHQqlxoalZAd/SDib23dVUK9JxiAjdniKvPlVT3LllrzJslP9EQr+zN31n/jlIiI1PtSPyP9E1XpXr27SyPCFi+ZZx6gmYy9vZEx06AnLffpFUWGY2aJIYvxudSq4zpfgmvBeLi3nxqgeiCQTH/3Iq4gYgRbaKscDBXMwda4+02EYhC3Bqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vy8RT5MmDe6GXHYrIer/6XxgS6VSLrjp7//LmIe11F0=;
 b=zGSOzCT00iGhnbcYXTGKvNpmzNwtv2mpo+/OyICaQk2XJ4HdUK5yLo1cp8ffaWus0D62ifuG+iRoXgjTAhgLZ8BCk903dxSFojvDO1bJsYTymLqrotbeMuDFlRbxluCT2O1qUmlM9QZOjnisxKD6v4VRg7QIlLQc8PnYaFeYUeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 18:39:12 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:39:12 +0000
Message-ID: <0d56fa79-94b3-414e-a3c9-5b142d116ec9@amd.com>
Date: Fri, 6 Feb 2026 13:39:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/19] drm/amd/display: Refactor PCON VRR compatibility
 check
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org,
 admin@ptr1337.dev
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-6-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260203185626.55428-6-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::40) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b709309-2f49-42d3-b7e4-08de65af055f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzMyY2cvUDFEMEpESEsxcFhxVHhhT1NrYnh3VThxOHR6U0xPQXFUUWU2WmIx?=
 =?utf-8?B?MElzQWorWUtmYzlWN21relNJaXBEK2F1SGN3ZGJpZnhVZS9qbmtjUm9WYVZh?=
 =?utf-8?B?eThrc3ZzeVdhRlh4V3ZGZmlnUUhNR0gyd2g1ZFFwMndjZE5Uc1g4NUp2cGRw?=
 =?utf-8?B?c1VCN2tXS0JHUHYyd1Vvb1YwUzF5Q3U1U0FzL0RCNHN0K3FiVXlDWmR1Tkdz?=
 =?utf-8?B?MVl2MnN0VnB2clBleUppRVlRNU9iWkxUTFhLQzJzU0t5OTY3aDExb1I3b25Z?=
 =?utf-8?B?NjFiNk42L0NmR1ZhZ29FSXd6YUtHdktVaHV6aUtYcG03OHU1RlVjN0t2c1ZW?=
 =?utf-8?B?dkJCS1RkZUVmTlA4Mk5DRHJ2eVo1dWtOWjRLN3ZOZVY2NkFmdHdXS25EWUFv?=
 =?utf-8?B?OVJseUZYQzlQYjBvand2dnQ5amJnaGxHM3Erd1RlSzEybXMrOUVkWkFJMlBi?=
 =?utf-8?B?cmo4bVdWZnpFMmpBTXg4UEdKWERnS29lMStudHNaYUhSMUs1Wm8yL2h6MXFF?=
 =?utf-8?B?OEV6ektPT1Y3MWVlSWRta3NYdnM0MytYWnN6UUVkYS9SY0NlR0g4MFpxTEww?=
 =?utf-8?B?UFJTTWJka2VJS0JaaXR5Q1FUQVNHVlFvWUlJVEE5OU1iODRsL3ROOS9hV1RK?=
 =?utf-8?B?OGFIVWlQTW4vNUxOZHp6TXVCQmNSOEpUMnBBb1Z2QjA1TWRGZEwxWGU0L3F3?=
 =?utf-8?B?dVhVQzJHRWwzcU5vcHcyb1VVN01IMzcvdWRMdjVjRVpOMFpOQzh6T1RRam1s?=
 =?utf-8?B?RWR0NFlxd0VhVmJtdm1rcWMxa3hwaDcwRzlqaXBiRVBZL1Q1djgrSmEweXow?=
 =?utf-8?B?TXJpOW1PWk5MMkx2WmZSWnBYMDZ1dkh2eUUxbUlaYVIzL1Bna1FFS2pmVldY?=
 =?utf-8?B?U3AyU0xDOXdSWFUwaW13MkZmTDFneGpxMTQzaGczRi9obEc4bHFkOUdPTWl3?=
 =?utf-8?B?Tjh6R2NwN2FQa0Z5eTBnNzBGNlRIbUwwYThQSUkyUENJbHcyRXpjSkF3K0pQ?=
 =?utf-8?B?K2tDRzB2b1BZY2JqV29nNGNkbm9JWU9zaXdIU1dWbzFVVnllblRQNjc1Lyt1?=
 =?utf-8?B?L20yc0I2YjZ6OUlGZFhjRnltY1EzWkIwbit6bmM2ZmgzcGl1N21tNytENyt3?=
 =?utf-8?B?WHlMcU9GR0VwV0Yxd3dqMWgyVHlsa0RvQUEralR5MHd6OUxwN2VTRTlSMDBG?=
 =?utf-8?B?ZVpEekp2ZDNRQjNTeUFoMjNSS2VvTUp1OTlaRHp5ZFBVMkUvMmQxT2dZSzc3?=
 =?utf-8?B?NGNZcGZ0bSsvMHhLRWthVVo1eE55dFEwSzlnanFqb1NWbWN3TFdGMTdEK05C?=
 =?utf-8?B?SE9vN0pvQTVxREI0aWowYnpxenZTNXRUN1JuVGpmUnNSRVhFZHJaQUZVSllF?=
 =?utf-8?B?UlkwVmU5c0hZaGpHd2hDMmFwQlI2aW5ad21YZ20zYkVuODlJQ3AwdG8yaThQ?=
 =?utf-8?B?OGIydlh1QW9NU1l1VGdYZitkcVI0YXpCSUkxSE5Hb3UwMm51WjFKcTZGNWo3?=
 =?utf-8?B?L2JxTU5qd2s0NXhsZ1QxRUxNMUZBWU5nODhGVDR3L2cyZzZxWHhBY0kvZExx?=
 =?utf-8?B?UEJmQVdSU2Zpcnp0WCtBaVdsTW5Zd25raWExWEJkQkd2ME1oUEc0RHp3ejI0?=
 =?utf-8?B?bUpDWGZLcTlQRDJPR0RnRmNHU3pSZGg3SWZlTlVDblcvdUN0SFAyc2ovLzJa?=
 =?utf-8?B?OFR2QU5RYTRtMWhuRGxoK1o0VUt3aWppNGVJamhmb040dHRuZkcyWHlxeU1W?=
 =?utf-8?B?Q2ZLd0VuR3dzRFpTWktoem5XNk9CSEc3d3d2ZmxNb25GcDVMeWlHRE1tZVNq?=
 =?utf-8?B?UWpGUnZ0OEl4U2JQY294eGFQcVdYZlFXNXh2MUIzQWN1dVBjZGFjTnp6emtv?=
 =?utf-8?B?MXhVZzMrL2dFbDVTWUc1dVNySm1VQmlLUUZyK0hFNE42SXFWYkt1Rm5WeDVI?=
 =?utf-8?B?N3RrMlUvbzFtbitxNmhOTi9RYjJDZllBV0lkSFl4OXc0R2NmbW9uU3U4YXZS?=
 =?utf-8?B?d3JROGNkaTBWVzZDSmdCZ3RVa3VDblh3ek1FdERZTFFRTWVSN0wwTEJzSDdF?=
 =?utf-8?B?a0Q5bHp2N3FkcVVvRFl4RVQ0ZU4rWXptT3d2M043c3NpN3VTYlJqNUE5bndi?=
 =?utf-8?Q?i81Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0paeGQzQXc3eGRmQ1lFajQyWTRuWitJT0l0S3gvYW9help0M0JaOG5aTlVG?=
 =?utf-8?B?VG1CanVraEdMRlR4WTBsVnVrc0d2cG9yV09ZME1NMTRUZmFzTHh3RDRMUkxz?=
 =?utf-8?B?aFdBREcvZEtNNzh2NUtHRXFZcHBtbVpUUGNkNGpua2FYUnB3dXFoNVdDOHM0?=
 =?utf-8?B?eUpjamtMSjVTOGNmbG1EOWd6L0oxcmMwb3kvL0wxTFVQV2ZCSk5zZHNjV29r?=
 =?utf-8?B?bUs5QXBLcmJWbzRpSmw4cldWN2d5MS9xa1k3UURibUxtUTFHYzVVVEQ0bHBF?=
 =?utf-8?B?ZmxrUTFpejdYdjZuOHZDbUZlRGFBeTBDN1pyakZKZTd2dDJhQUY5dWRvZnBt?=
 =?utf-8?B?Yy8zUmc4akRSa3BPcWswbmk5K2wwQWEwRFNlOTNSZW50MmFPWHl6WThhSEhv?=
 =?utf-8?B?VDlyQjBzb3p3eDY4WGFyUmM4UFozM1QxR2pZT3RrbFlzWnovMU9XOVUwSEVp?=
 =?utf-8?B?S2sxQk1TaGJYY1RlZzBnNU5MU1RGZGRULzk3NnlWaEJlcTRiZDU2UnpjcUU4?=
 =?utf-8?B?bFA1SjFWcU42OHJHR2drZStPTG9makwvcGQvTVRjNmdsUGlidkVSZVpaYXhO?=
 =?utf-8?B?WC9jb09MZEtrZ0I1OEo0dVd6K01SM29pTHBUQnpKZHBhZ2hGYzdPcGdHK1F0?=
 =?utf-8?B?SXBLb2prWlU0N2JXVEZwYzF4NmZoRzhJZTNsL3ArL0pEeFNQSVR6ZlBmS2kw?=
 =?utf-8?B?OXFEWW0rZ085THUrcGFZZTlsRlVtQVhVdSszcXhJNE9PdWJveG00eUIxUXY0?=
 =?utf-8?B?VDdjcXVZU3lpSU5LTnVjWExrUXE4RVpWTUJPU3lxdnYzTGl4cW1LYUpuZ1B6?=
 =?utf-8?B?WFF6U3orVi9LeWR0OTk0ekxYQjVKcGlMNmR1b1JaVFdWaEdlYTFGTzJMQk5W?=
 =?utf-8?B?b29MREtvZENBUWVaOFdEb2NtYndHZnZHbkxRbzlyYjBpazJlc0N5NUl4a1A4?=
 =?utf-8?B?TjZFdmh3OXczTUkwNTV5R05hNVZhR3cwWDlhOGdGWWc4QzkrSFJMdU5aamZF?=
 =?utf-8?B?a0lHVFdKZ3FUaFZxd2dSL3FkeG1ydUdDMjByUllnSTJlZTZLNnl3MWVpcmhF?=
 =?utf-8?B?RnBIaER3ZUZZSlZadGlmbERqemtuMTNrNE42MXBlUEV0SnVBY3NLZU5GQnMz?=
 =?utf-8?B?a3pXNkQxdjExOEFKRVJjcWdKMHU2c3BpY2UvSEJDSy93YUt1c1ZaMHBhQ2xC?=
 =?utf-8?B?SHdFYXVaV1VEKzJFUFJEUHpvLzNrZWZ4ZmdneklXdEZua2FiWVRvQWEzcjVh?=
 =?utf-8?B?STR6WUpFd2pnMWxqbmMxYndUZG44YkZVVGNLTldNSUhZc1FhcGY3ZE5UWUt4?=
 =?utf-8?B?UHdFaGxTL1pKeTkwekh0cHI5QjJKRjVodHh2UU9KV1BBZG9tOWdzb2pHdjll?=
 =?utf-8?B?b3RRb3VHZk9SdDJ2SlJHRFNBR1RPclhoVzdydmx6ODA4MXBMd05XOTVqMDE4?=
 =?utf-8?B?OVM1S3ZkTWNoeXQwczdQUEdoanFmYUtrMHl2SmRnelVBRitHS016UCtMQlFJ?=
 =?utf-8?B?TE15enQrZHA4K1BXTDZhODUzZUFXZWVJY29WcWcxWVg5Z0d2WTc2TDNCTkVx?=
 =?utf-8?B?dVc3RTNVWW9qaGlxMVVoZzVyNGJ4TTVHSWdaQVN0ek9rRmExdFI3WlIwQXhv?=
 =?utf-8?B?WldrRG82RXkxNGpFYjlxQlA5OG5sL0RScEltbVJreUdaUHlYV0Y5dzE4b1Jr?=
 =?utf-8?B?OStuVDZXR2NjODlBeUEvbHVwVmk1UnFHZk9Ydm8vd2h2ZEVqWnZiMUtUamtZ?=
 =?utf-8?B?ZWVVNUV4Q3NEYlJyclZONTVBNVFXK1NRdHFkdlprNUtMM3FxaUMvK1ljai84?=
 =?utf-8?B?b2I5WDJ6c05iQmJpbnRmN2ZmejRzOXgvek5TS3FtQk5VR2dIVUhYWG1HN3Y4?=
 =?utf-8?B?VWJCNEd3OW9iMHJiRkI1Z1JCWWt2dUdaaFpzZXBKUEV2T2pNL1NvSDdPUmpq?=
 =?utf-8?B?OEx3bk13ekF1bXFacnBFN1pkOEsxT3RGTFN3bEdGZUhOeFI3aHFpcGQzbFRJ?=
 =?utf-8?B?cldTRDk4eEdOZVFRSFdhZ1FJbm52eHJYY0paaldEUjlKQS9NelRMcVIvYWtV?=
 =?utf-8?B?enlKSHhlbWxaQ0hwSGJTVE95aTNET2thc3ZyQWRPWkFLR0dJdUNpN0U5akZy?=
 =?utf-8?B?bm5CcUw2clNRSEh4MmZQRm9pVDB1T1FBZ1lrSTZNdlVVSVB3MU8xVTl0TnRB?=
 =?utf-8?B?bnhHZ0hGeE90RFg4N2tjVk9wWFFIN1o5QTcyTUo5NzdFdEFyYzkzSXBXMUVX?=
 =?utf-8?B?bXdTOHhWL0podUVoeGUyNzVhaGh2bEZMcWFlcCtKME5GWWkyKy82OG5aNDZj?=
 =?utf-8?B?Z2hFaWVOY0xDTUs0aTg1SnNNMmF4bmRQOTJDeWhlTEU4QUJSQkE5UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b709309-2f49-42d3-b7e4-08de65af055f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:39:11.8429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOT/Aaod8uV3mqYrOo0gf+fl8gKY6TUHJ/ToiBkCBURcOmj94ouQ+dq7Pia69PSYNQ1tysibVeuljKOPwu+e+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: D1023102145
X-Rspamd-Action: no action

On 2026-02-03 13:56, Tomasz Pakuła wrote:
> [Why]
> DP->HDMI PCONs prevously entered the DP path

Again, not a fan of changing behavior in a "Refactor" commit.
Maybe drop refactor and put the functional change in the title
instead? And/or disentangle the non-functional and functional
portions of the change into two separate commits. Though I'm not
set on separating this into two commits.

Otherwise the change looks good.

Harry

> 
> [How]
> Restructure amdgpu_dm_update_freesync_caps() and move
> dm_get_adaptive_sync_support_type() to dm_helpers_is_vrr_pcon_allowed()
> to better reflect what this function does. It never actually gave us any
> other info.
> 
> Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 24 +++++++-----
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 39 ++++++-------------
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  2 +-
>  3 files changed, 27 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 284f5b326c18..9346b62d981b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -13278,7 +13278,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  	struct dpcd_caps dpcd_caps = {0};
>  	const struct edid *edid;
>  	bool freesync_capable = false;
> -	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
> +	bool pcon_allowed = false;
> +	bool is_pcon = false;
>  
>  	if (!connector->state) {
>  		drm_err(adev_to_drm(adev), "%s - Connector has no state", __func__);
> @@ -13306,18 +13307,23 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  	if (!adev->dm.freesync_module || !dc_supports_vrr(sink->ctx->dce_version))
>  		goto update;
>  
> +	/* Gather all data */
>  	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
>  	parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
>  
> -	if (amdgpu_dm_connector->dc_link)
> +	if (amdgpu_dm_connector->dc_link) {
>  		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
> +		is_pcon = dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER;
> +		pcon_allowed = dm_helpers_is_vrr_pcon_allowed(amdgpu_dm_connector->dc_link);
> +	}
>  
>  	/* Some eDP panels only have the refresh rate range info in DisplayID */
>  	if (is_monitor_range_invalid(connector))
>  		parse_edid_displayid_vrr(connector, edid);
>  
> -	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
> -	    sink->sink_signal == SIGNAL_TYPE_EDP) {
> +	/* DP & eDP excluding PCONs */
> +	if ((sink->sink_signal == SIGNAL_TYPE_EDP ||
> +	     sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT) && !is_pcon) {
>  		/*
>  		 * Many monitors expose AMD vsdb in CAE even for DP and their
>  		 * monitor ranges do not contain Range Limits Only flag
> @@ -13342,17 +13348,15 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
>  		}
>  
> +	/* HDMI */
>  	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_info.freesync_supported) {
>  		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
>  		freesync_capable = copy_range_to_amdgpu_connector(connector);
> -	}
>  
> -	if (amdgpu_dm_connector->dc_link)
> -		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
> -
> -	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST && vsdb_info.freesync_supported) {
> +	/* DP -> HDMI PCON */
> +	} else if (pcon_allowed && vsdb_info.freesync_supported) {
> +		amdgpu_dm_connector->as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
>  		amdgpu_dm_connector->pack_sdp_v1_3 = true;
> -		amdgpu_dm_connector->as_type = as_type;
>  		amdgpu_dm_connector->vsdb_info = vsdb_info;
>  
>  		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 1f41d6540b83..45a91df619d9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -1381,40 +1381,25 @@ void dm_helpers_dp_mst_update_branch_bandwidth(
>  	// TODO
>  }
>  
> -static bool dm_is_freesync_pcon_whitelist(const uint32_t branch_dev_id)
> +bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link)
>  {
> -	bool ret_val = false;
> +	if (link->dpcd_caps.dongle_type != DISPLAY_DONGLE_DP_HDMI_CONVERTER)
> +		return false;
>  
> -	switch (branch_dev_id) {
> +	if (!link->dpcd_caps.allow_invalid_MSA_timing_param)
> +		return false;
> +
> +	if (!link->dpcd_caps.adaptive_sync_caps.dp_adap_sync_caps.bits.ADAPTIVE_SYNC_SDP_SUPPORT)
> +		return false;
> +
> +	switch (link->dpcd_caps.branch_dev_id) {
>  	case DP_BRANCH_DEVICE_ID_0060AD:
>  	case DP_BRANCH_DEVICE_ID_00E04C:
>  	case DP_BRANCH_DEVICE_ID_90CC24:
> -		ret_val = true;
> -		break;
> -	default:
> -		break;
> +		return true;
>  	}
>  
> -	return ret_val;
> -}
> -
> -enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link)
> -{
> -	struct dpcd_caps *dpcd_caps = &link->dpcd_caps;
> -	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
> -
> -	switch (dpcd_caps->dongle_type) {
> -	case DISPLAY_DONGLE_DP_HDMI_CONVERTER:
> -		if (dpcd_caps->adaptive_sync_caps.dp_adap_sync_caps.bits.ADAPTIVE_SYNC_SDP_SUPPORT == true &&
> -			dpcd_caps->allow_invalid_MSA_timing_param == true &&
> -			dm_is_freesync_pcon_whitelist(dpcd_caps->branch_dev_id))
> -			as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	return as_type;
> +	return false;
>  }
>  
>  bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream)
> diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> index 7014b8c2c956..e51f1e489129 100644
> --- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> +++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> @@ -220,10 +220,10 @@ int dm_helpers_dmub_set_config_sync(struct dc_context *ctx,
>  		const struct dc_link *link,
>  		struct set_config_cmd_payload *payload,
>  		enum set_config_status *operation_result);
> -enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link);
>  
>  enum dc_edid_status dm_helpers_get_sbios_edid(struct dc_link *link, struct dc_edid *edid);
>  
> +bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link);
>  bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream);
>  bool dm_helpers_is_hdr_on(struct dc_context *ctx, struct dc_stream_state *stream);
>  

