Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMmgH92ReGmirAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:22:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3001492B2A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879FA10E080;
	Tue, 27 Jan 2026 10:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d0/LRjG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012010.outbound.protection.outlook.com [52.101.53.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A4710E072;
 Tue, 27 Jan 2026 10:22:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzsZAXgRchWlqfFiyXm3bilhJD0tzIq/6y99YHywCVBjQtsIi36uo+A7DaS+hyQeaEks0YoUFKVKuCngC78Q6y4TlFOTLDbPUtsDToWbVCG+OiHudCUEQnkSBGRpsk5xV6V9Da2+q7IFfdHfI/45Y05sOGjbg/Of9sE60aWbkmxY3nWFQz3dhC0CoOIWZSIaDxePlwJrXmXskuMSOUIiBDeaDl9GCIB1VvnsvS8oWxR/N0J9b7keDrJl2PCuGCsDMZer45GGueIDLGPEfq2mt+hjtB2HprFg+udpWWEPzZdVVGy0NpMZhIGXhzlKJI8StEjGdW7FROiC7j+1AwDChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0caF7ya4vTe7qlYWWyDZcgVKKyeXA06gk7eXkAWazY=;
 b=Jqb3/f7LdxJ87de0qXCgjOTAvkRXXqx93FsLyZ0+UW/gaMdebVJFQ0HauhkQtYLIWzLBnqVRwtLT+8Z+nZfdd8Geq50g2gUy2XVRIgz/h02MADfh43ZG9bkc9JrG2pgCHieL7bm6/xS8wG1TX/vS1sjljqN2HoqeFvZYEPUidVhjDEKXT8zpICTZ2rhCOMIK1NvgN7/GsgFK6tI0XmtOHh0D2LgPbvptSqmUpUWOjka2YSYB8YBocWc6k2fgavm9nvTH6gXH+YmNuMOdNWPrL9FRk0PJ2zeDMBxBzvxB9Wrtk4ZDOSS/QPNBQw4K8rudZI011BPLZbi/lrUehfVcBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0caF7ya4vTe7qlYWWyDZcgVKKyeXA06gk7eXkAWazY=;
 b=d0/LRjG0t5PqfzDSA+Kc/NAXXjtqlBPWZC1FpukN3FGn7A8KfBtepO5CiyJgPRMPxW1hv54il72KW5ri5XY49War9tVTxgYUB/xEpUxNAsSPI+VG6/bgbJcB72E15a7HjaW+lgumFr2RpV3I/FjpEidhcAhju7akKzORj2UtW5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 10:22:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Tue, 27 Jan 2026
 10:22:13 +0000
Message-ID: <1884d44f-6ffa-4974-8603-488f3979f4e8@amd.com>
Date: Tue, 27 Jan 2026 11:22:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] amdgpu/gtt: remove
 AMDGPU_GTT_NUM_TRANSFER_WINDOWS
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
 <20260126133518.2486-7-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260126133518.2486-7-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:408:f5::30) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d642f7-edee-40e4-f6b5-08de5d8df016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2xRT0VPYWVZNEQ0V1NGejVBeXVjUHg5eEZ4c252UGJuRzhrbFU2Q24vNjEr?=
 =?utf-8?B?LzdTMXcwSktmZnNmZ3cwRWNWZE5OSDg3UHdUd0RORlJPYnBBS09nelN2WWhL?=
 =?utf-8?B?elYvb3hyOUJyRW5UaHg0enZEYzQ2OEdyNFVZYmtNbENQVS8wbWZUL0RFS0Nt?=
 =?utf-8?B?Um5GZFNqdlovL3B0RlVURzMrTi9ZTGtQUk5EUlNLaUtoVndNb2V5OTMySnNS?=
 =?utf-8?B?SFFUMVo5YUVEeUVUYml4SGo3UjhVZEdld3I1dVVvSTFhbURoeFJ1RDNyRHhF?=
 =?utf-8?B?aFZBam91M1pySVBoUi9raEJuUURCRTIrSzFEZ3BOdWxWd09qMHZGYUkvNWtD?=
 =?utf-8?B?cEt3Tmh1MVhaMEl0OXZ0YWhEWjEweEZyUmQxWmZmTVE4WlpJS254dk9wLzBS?=
 =?utf-8?B?R295WURLTnlzaWNIVW41cVc1MWRwZFlUbm5kNWRHNUdyQ2x0SGdPRjFBaGFM?=
 =?utf-8?B?R0I0MnQzRjFSZ0Jpa1ZHQkRGcHg1Ym5KVmxhM1Z4UjcwRlZmWGZaUng5SmVo?=
 =?utf-8?B?aFZpOHlLcExjdDZVcFZPWklTK1RMa1Y0TE9Ya2NxYmF0NnJ6aitRSi82VDg5?=
 =?utf-8?B?Wk1KV3NCSVAzK0ZmdXdiQVVPbjBvYXdlUFUyLzJOQk9lMDlRUkJLNFphOW0x?=
 =?utf-8?B?cHVVZDNwU0NuNnhXQnRkcmNsWVhvMEtXZmhLWU1oejIwZ1VXOUIyS2FmVysw?=
 =?utf-8?B?bE1Sb05KNHhCeFBVU0theG0yeGs1L25RcEtpWFN6enhrM1dkN29MUktPK2ZT?=
 =?utf-8?B?OWZkRnR6QjNlV2F3WGRmc25KN1FsL2xzTzBtUHRQcVFPaXpmdEY2RXVGdkhx?=
 =?utf-8?B?Z2xpODhsK2pEeWtRb0hPZ1Y3MWZTdzR0eStvNDA5MWQzUUc3bGZ1NUkxcWxE?=
 =?utf-8?B?WGh5ZllUVS9mTmxjZVh5UXJacjNpbUdXNVZ6dTZaTXRMK2tLOCtxZnJvL25K?=
 =?utf-8?B?aXBraXdONWpHZW0zQjJCUDF1aWtnK3hUQTJpTzRDdUp2NUp4YmJOYnVUR2FS?=
 =?utf-8?B?YWlYMGZZZjI0NjQyVm15cUwwZVJXVVoxbGhES0FtUVdIZ04rdFJwdFRwVmNQ?=
 =?utf-8?B?ZFBFRk5yT3FXT1R4enh3aWtjWDVvS2Nsbi9sM1g2UUlzYnNhQVBFSDVhUXBo?=
 =?utf-8?B?T245ejFEK1R6c3JyMENqeGJlTFppVXQvenR0cXVuRnFuQkJCUGhnZ2Vad0ZZ?=
 =?utf-8?B?MFVFa1p4RWJNWnZybWhDbEtwUU1xRXZFSG5Jb3J0OERPZ0s4Z3FiZXovcGZ5?=
 =?utf-8?B?Z1VtYW5RVmlzU0RVaDlNQXJXbVlCMEI4MGZOM1hQSFNrR2IvWGkyQzdzbEQ5?=
 =?utf-8?B?enNGcno4NHV4RUNxdE5nTjlyTnVvTHlIc2pkZnVyaUlldGdNeTRCWm03SkNM?=
 =?utf-8?B?YnV6UGw0TVN6UzhuY25JTkRNdzE4aWY3bnJ1MmkwWXBldnQzL1RzcXlIbWpv?=
 =?utf-8?B?cDZhYU1sbWdnam1OMjVhYW9rVFVFVkJOSnB3NUkzT2NDU2tWMGxOdTJYQVpL?=
 =?utf-8?B?c3pBY21aY0tEWk92S2ptMkY4NGYrZzNmd2JJTzE1ZVd0MmZxSmhmdkVCYUxu?=
 =?utf-8?B?UkR1dDVuRUVKM3p4V2NmZjBhSmMzcWc0bU9YUjIzdkoyaFdOckZsSENFZkpv?=
 =?utf-8?B?MVpVUVAvMjlTT0ZYS3ZlQ05vZU9JZ3RyS2pxVW1KZUNMZUJCSWtlQnA3aXRR?=
 =?utf-8?B?M2JGUEtSRFlna2kyMnpZcXRoMFlaRmdydWJValFNdXp5L0ZrS0tVc0FmTHF4?=
 =?utf-8?B?Wmp3SWZTOWY3OXVDWUJmQ3hsdzRiOWRMOTRQSTJjVWExMjcxQ3hmb2JhYmlo?=
 =?utf-8?B?MnpKVWhnR0I3MUhQNDEvODQ5azFmTzJXTDh5T1Vrdm9wU3F1dno5RXBETlpj?=
 =?utf-8?B?aVBFTkZjakVzdWhzZmEzVW1HUWVmdFBrdkR4Q0lQTFFGL2pKdVFvSkMwZDZF?=
 =?utf-8?B?dnlxekpOTG94eEtJRVZpUXcwVFhhaGZDRkt0MEhJd1dLeTRjTzdJQVBuMVox?=
 =?utf-8?B?ditJYXVEaXNLbVZtU281K3g0bzdFTUk2TEdTYTU4L0wxb21hbW4yWXhObTc4?=
 =?utf-8?B?Tnh3L0VSeVFMQnRIU0lMNG9TL0RSbjBVdXlMdlJuZUN2bFRoWmVEVEJ2MTFq?=
 =?utf-8?Q?3N6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWVIdlQ1WThlZDFkWWxxdzE1MnluZmNaUDJGNzVmc211cDVCZ0ZzU2FGc2xV?=
 =?utf-8?B?Q2N3YlBJd28yeGZJcTRkZmNqUkNHVFFTZDlPUzc3YS9sRy9hRXdzMnRabU5U?=
 =?utf-8?B?bHlyRVFIMmJ2RVdWQ0s2M3RUODJLNzhEM3UrejFOUC9IMDZpRXA1VEhnVlh6?=
 =?utf-8?B?ZCtjTGt3Y1BKRGYrRmZwcGl1ODd1TWgwSGFmU0hDTTNGNGFUV1o4UVhpa0lJ?=
 =?utf-8?B?a1NMTllPSEk1VjVOUE0yNTloZzdOVXQ4bCtxdk1HeGQrVmtNNWFXQWs2TXdz?=
 =?utf-8?B?dlZqdHRVTHpDSm15alczMXVEeDZvYVp5S0VFSTYrYTFySnJOY0hKcW4wZHpn?=
 =?utf-8?B?QWFNaDFkTE95T3gxVFlPcnBHZ0dEeHZrNVp1Zy9rNUNOQzdJTU1WSjM2cFNy?=
 =?utf-8?B?NU9sSCtHZFZ3SjlNNnRZR1pnaGtzb2hkNlVidElLUnpFazdITnFEZkJqaHF5?=
 =?utf-8?B?NW4xb2JrVFM1Vk1ZZkJhM3dZQlQzbmozeHlPK242L092OWxoN3VNN04wa2JF?=
 =?utf-8?B?em5mQzJhU2pkb0N5dVg0aEVvTGFkRFpqOXlVcW9LS3kzaU1ZRThpU0xTUFV2?=
 =?utf-8?B?V085MzlVRkg4YzYrYzlnU3IrcDBEbjZ0ZDJrUEhiVWZRaDMvR0djTjJtdTU3?=
 =?utf-8?B?c3gxYWs5NGJoUnVoSGx1bUdsb1h4OFVtVWkzaHhKVTBRd3krbXA3WUZuVWdZ?=
 =?utf-8?B?NUF5bE0vN2FYMTVNeFdTd3Bwbm5QajZ2UUhEYVIyNkdUQ2JpcWxDRWZ0R0FY?=
 =?utf-8?B?bHJJbDhXT3ZlN2tQRjhHUDYybjlVYnB4MzA5TTJ1aHdPVmFVcUNDbVROWjBY?=
 =?utf-8?B?UWpnQTgzU05YcENHSnFzSFlwaTlGQnpvakxoZy9tWmxka1g3Ylh0eTRrOXA0?=
 =?utf-8?B?dTBuV0lqWVllelVmSVUxVGdKd0I2d3JhZlpXZXVMYUpGZWZ0cm9sUmFGRmE0?=
 =?utf-8?B?Q2RQQmVaQWlBVVpncU82M2VwUi9JYVpmUTJqUGxVYzJPdnQ0d1Jxb0NhZ3Nm?=
 =?utf-8?B?TFpIbUVLQ2k0ejl3d0N5ZW5RQ3VTWlI0K0VVYjZjM2g0aHluRTZZVTlydC8z?=
 =?utf-8?B?R0hqZW9SNDh5VkZuZXozQnZwOXlINU11akVxczdMNUhjaUU2cmJFR0lhb1J6?=
 =?utf-8?B?dkNsM3FrYVF0Q0QwNDdNRnNrb2J2akk3QUFHeVVOZTVzM0FYUTZWeDEzQTJE?=
 =?utf-8?B?QVREcUwwZ0U0U3cvWFZkeHprR1hGUWRScTQ0N0Jwc01FVHZCUzRaUDFtenM0?=
 =?utf-8?B?a0t3M0lDZEJld2FhRmRyWlBCTHRzZ2E2NWN5NDAvcVJIRlliVFV3akZuL2Jl?=
 =?utf-8?B?SjU5RzJwZ0FUZkE5YXlsSEYwSWdWVW9xNVl3Tk9sZmdiejFnYXFwNkliTU9u?=
 =?utf-8?B?d3VIZ0dnY3VWZVRNcElLTy9KampObDlIRTErMjJaRGtLUFdxbnMvWDQxa3Mv?=
 =?utf-8?B?LzZJRkRHTEh4NzBqOTBBV1ZRODNoT1dLNkp6YWJqTnkySVFSUCtSSUl1c1ZN?=
 =?utf-8?B?ZEpLcW1uRk1qNnVWTi85Wk9QWlJoNzBzWGxuc3lqLzAyUlNxWS9pb3ZsM25o?=
 =?utf-8?B?MEU4ekxBNHVaQ3BBN244MjNoWHVpYTh3ZEpNcFBrdk53NGEzWThtTnYrMXNw?=
 =?utf-8?B?N1JybEN6bWZCT0hwTE41c3ZYVStLWUNhNzUxT2Rxdm1zc2xiLzM2d3FwcFhB?=
 =?utf-8?B?QUJtWmpBTjdPZm44ZzIzdnlOeVhvWlE4amt2ZzJ1cGc4eW1yREZCREZFZ2Zm?=
 =?utf-8?B?V0VQT2RvNnFsZnMwVDViaGtxeDhHek9FNDlNYVA1MW9MeElOY3p4RE9pU09l?=
 =?utf-8?B?NkFYMEpEZDQxb0JyTkFMMGNIbmFpdzJPZzZuNE5TM25aekh5dGdFNzRBb3Zv?=
 =?utf-8?B?Sml1a2dFN2J2YjYwWVVxLzFtVTJFMURZMGVrTzgxSGZ5azBuZ1lsaHozcTJS?=
 =?utf-8?B?R01xMlp2ZTl5M0JYcCt5STZlRS9uL294R2plT1Y0czB6S1lUODdPeTV6RER0?=
 =?utf-8?B?LzFrK01MZ0lYazMzS3ZCeFhxRER2bXFxczRMZ0d5c1BOdUR3VUdsOUVIWDNs?=
 =?utf-8?B?RVZqUTNBZjRGNW9IcklkbHJIaVZnZXZ2WHVudmhidDdHbWd4NTdvY2FQYzBt?=
 =?utf-8?B?Nlk5MDBRRFNUYWxGN2RJLysvcGF5WlRJRFhGNHlBK1lRcDZ0NWtIdmRCOWVU?=
 =?utf-8?B?WTV3MGI3TDM3azU0Q0JzMVRGZjltcnFTTkxYNW4vNDQvSUxIVFRyZGoxcVFT?=
 =?utf-8?B?YVpsWWRBVUJUWWF4YkNiQVQrMzVMVTJIbWpjVXliaXc5QXlzemtiU0JmSE9N?=
 =?utf-8?Q?X+NQvC/30hwWHAm2zm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d642f7-edee-40e4-f6b5-08de5d8df016
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:22:13.4513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wbst0MIp3RBElwG0bXzJhL7xB8k93jPc3chAJN3oXNjNFJrvWt+U+RoZfOjpTXMX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 3001492B2A
X-Rspamd-Action: no action

On 1/26/26 14:35, Pierre-Eric Pelloux-Prayer wrote:
> It's not needed anymore.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 5 +----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     | 1 -
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index f2e89fb4b666..9b0bcf6aca44 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -324,16 +324,13 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  {
>  	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
>  	struct ttm_resource_manager *man = &mgr->manager;
> -	uint64_t start, size;
>  
>  	man->use_tt = true;
>  	man->func = &amdgpu_gtt_mgr_func;
>  
>  	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>  
> -	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
> -	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
> -	drm_mm_init(&mgr->mm, start, size);
> +	drm_mm_init(&mgr->mm, 0, adev->gmc.gart_size >> PAGE_SHIFT);
>  	spin_lock_init(&mgr->lock);
>  
>  	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 5419344d60fb..c8284cb2d22c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -40,7 +40,6 @@
>  #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
>  
>  #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
> -#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
>  
>  extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>  extern const struct attribute_group amdgpu_gtt_mgr_attr_group;

