Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBz3OY/6jGn5wQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:54:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7A1127E8A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1914C10E65F;
	Wed, 11 Feb 2026 21:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SDliBCaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4483210E65F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 21:54:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBjjx6gynVNg/qoT6tRF2l51Y/6KzkakSwz+EsoAmZRwxDfu/37STaO9fjzTHqi+M6qT6YefoKvZh6ldah/eAkBUks7iHHtc8q75A1o6OV9Ovzf7VZNc1j+XO/aQXrBvMR6arOGCSnzSa3m9n4D0OwdKV/SSt9o6hCZBoleD+GlqS/2A6gHWO94SLO56Hal+Onh0Wp9IDgvJ0zuhfNYPfAZppCfEJzHOtKokdGRXY/iPVjq1vYm3kARmIsYNpLcgPBFezAmERrtH6guYC0f8ap8HcnagnbLZ986akrRoP1yc+IAPGTSIYDAhe+LYnVp1LsZzoN7Nd6jOw24zk/4NBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTyrysAluGcVhVncACSaW4xLFSogZXxgbBfQV/34sWk=;
 b=qq69dnuC5yBQcSzWRQOm9bcQZFczRr+HoyKus4Mowr/l+RxlBbGl42TujTJBY//cVVOmrt8pxXRVaz6ceGKM2pl0Q7KhuczntbcRDItpxCCWdbBVuZfwXL5F46XbBT3Fs3e/SUtww72ebPtkFIY7heX4z6b9if3wAEwiMQZ3reniRBHDd12TcZKwm3vA37hxV1HO5MtIhR+1AYWGp6U8u3AGQ76PG7F7mzmWLfGTVsMvZ104Mdj6Z/o2UrnaDd4HdNtJzIGeMIcui+smz0imx5PGGUqgZ41W8VicMHsA307TgICAd7FeKPKk2aXLWfYyEl2FmkLVJoyY/dC3ZfKURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTyrysAluGcVhVncACSaW4xLFSogZXxgbBfQV/34sWk=;
 b=SDliBCaSrwgTSqoSHrmebXtHFj1AF9D5a/IQC6dpzHpmWK4gbPbNfigW9rGZcj7/Plc/iWi5huuJ0vHCz3kwkSpzjvLLsFcCKJ8dA+3m5OzrZ2+t/MZNrDLJbkrOaUpnbP8TeKqp6bsVVDCLexuSBgcnTax0DuIgCzu5j+jppUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:54:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 21:54:17 +0000
Message-ID: <84012a87-9d20-4b3a-a278-5da9af73e10c@amd.com>
Date: Wed, 11 Feb 2026 15:54:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Fix suspend failure after enabling
 turbo mode
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260211204716.722788-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260211204716.722788-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:805:ca::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: 581c67b7-92ef-4482-4be6-08de69b81a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDcxbThKNjJydFpXRnVVVXVXOFg2c0dFM1hSMGkvYUNuRGhxaDBYUWZJRGJs?=
 =?utf-8?B?VXdQaEI3Q1JjcmpETXFoRUg3MzM4bXdOdndOazVQek5hTlpUTmdCM29vaU51?=
 =?utf-8?B?d2VFSENZOWtpcnRXQXAzeXZLZDNMckZGMFR3U0xKRGtmRkN5b3pOaldJVlJE?=
 =?utf-8?B?V3NTNlBBTzdXL3BqRFNvZkwyRHEzRGlZcml5VHdMdWVob0Q5cG0xUFJ3Q1cx?=
 =?utf-8?B?cjk5OTg1VUdKL3FWbGU5NFAzbE44Uk9MNFE5RkYycW13R0RlVEx3eWNIRzhN?=
 =?utf-8?B?YjFKWWJFeWYrNDB1SlJEV3JYdmNCTHlVMnFTemQxc1VxTDd1Q003b3pxZ0kw?=
 =?utf-8?B?aEdsM3VyZlYvRjVYdWhUczdVTm5adWI2L1ZHUlpyZ3NNQkxldDhiQkhBSXZm?=
 =?utf-8?B?RWFseldjdXVyODMvdE9vL2VDTlphckJPOE5WcEp5VEllVGhlR3JYWUJzY3p4?=
 =?utf-8?B?MmkxSW1uQWxlN2ZsVlFVRGhQV01YcXVNVWRsckR4UXVOcmlPOHF1bUZJcnMy?=
 =?utf-8?B?bGxsSnJkbFVGd1hSTjNZZzNYdU9oNEdLc2lvM3hMTGtEWDdKLzN0TjFkem15?=
 =?utf-8?B?K293RFVVRDI1NzBYSGoxUXFiZFQxYUJyditmYW04UHJxTGpxMnZ6VkVDZnBZ?=
 =?utf-8?B?czBCVDFFM0RYcnRrVFF2Rmh2REVsVDY3aXZZRGt2UzBSY21FYjRYTUkweEIw?=
 =?utf-8?B?Rm5WNGo2bjhNVkNRZXZrcFJySDlRNzZhaFNnRkZlZ1BIWnJmZHZTWjFqUHd6?=
 =?utf-8?B?a3lONFN3YlJQMStIcE1ydHAzais1WlVzM2NDLy8zd203WHh2NjNrTERtbGNO?=
 =?utf-8?B?elpkUGRlRnNoaHY4aWk5bDVGNXhyT1EvNG45OEhrS0x5OGtJdmlaOFhDMFRE?=
 =?utf-8?B?ZmEzLzNNMGU5dXBkT3VQKzdRVUJlY0NMd3ZBdHQxMm9KQ2VDT2l6bnFGSXB2?=
 =?utf-8?B?cWpEY3oveG1YSXFaN0czWkFjRSthTURPcWJTdExsVE9uaGh6VG5sTXo3RllX?=
 =?utf-8?B?U1RBWkRGZUZ3angxZ0xUak13bnovbUJaK3UwZG5qczJkRkFFNDg4TFNPZ0xo?=
 =?utf-8?B?RzNKNFN2WkwvWlBSNVJhTUJ2SmVUTlVsRU5EOVZRMSt4RFRvMUMyU2tJYWQx?=
 =?utf-8?B?Y0dxbnIrZG9EeHNLMEVOSjJRbXB6L2tmKzI0WlJFNm8reThzaWl3RndQbnpE?=
 =?utf-8?B?MG9tNHpaakFRbEVZUENsZWdldDIwUWEwY25mcjVoNUJwbFI5WjU1RGNvWkVT?=
 =?utf-8?B?MmhZVkZPbzFlT1NyQlB6Tmg3T3BDRDZHZU1hU3NrZE1mSGhUYjU0VjNCNTY5?=
 =?utf-8?B?OHZXSU5XK1B1VmFvYlorTG1rY081TVRhdVZVeFY1NE9OeFMzdDArRnRHOFJh?=
 =?utf-8?B?RjBVLzVROTlERm9rNFJTRC9hSk9mKzliQXFibzZHd2toS3JFNTI0VHNqSXNR?=
 =?utf-8?B?YjJUWlNaa3g5c05uMWpiczdQLzNuN2xZdjE5a0NjMU9yajIrcXMvOTlBN1BM?=
 =?utf-8?B?V3ZjT3FlUEQzSFBZSFJ6Y0ppY0hqdkhoa29YMnJob0N4RDlNRXB6cThXRHcr?=
 =?utf-8?B?b3dJSElTS2oyMldDTnd3dXdJclA5WnpFNk9iZ1VCa3k5YjBKS0l5NUV5c0pj?=
 =?utf-8?B?K0ZCMjBkZmgwMDBVWmVxNDVJbGR4MU5tVVhORnhXU3ZxWE0zOGNXZXRRT0xI?=
 =?utf-8?B?aFlLWkVxL1o0Z1NoK1ViUlVLQmF3dGM2SEJJWUNycFoxQytBRlJ6dUtoM1Jh?=
 =?utf-8?B?ckE1RUFGZGlDcDJHRGs0YmlHOFIxSkx5cWpFemZJM3FaRXdwNVY2bDVUNWZs?=
 =?utf-8?B?NFpSek0vd1RKQ0MwNHd1SytodEdjSHV6L0VuSVZhNGtWck42NzNTMlJpRFY5?=
 =?utf-8?B?Y1V0elVmMjYyM2UxeXVyMVFiMGJKZ0I4VFNUQjhlWXV4alI2Q1JoY0R0S01J?=
 =?utf-8?B?akZxK1FUZURpT2UwUG1ZV1pIRFRuMGxUZDBGQ1dPOHhhdG5EcGRGU1hVeWg2?=
 =?utf-8?B?TENlRDhRTkVhREN4d2M3V3pjSzNpRUJ0SnJVN054akpaYjBVcC9YMnZtV1ZX?=
 =?utf-8?B?T2liUks5cjhIaSs4TkMvNU9yVWVXckVsWGVJcVFiZVJBQmtSdjUzMTRjNnA5?=
 =?utf-8?Q?ivDs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2NQOUliZk9MMkpVSUtSOWM3WXAvcDh1dE43VkgyZzFkc3J1Z3F3WEV0bmx6?=
 =?utf-8?B?Y3ViRTRPTFZaR1VPb09qSXYyaUlTeENRSGJod2gvMnQvK3dXNkdVZVJqTUdy?=
 =?utf-8?B?bEY1bVU0USszK2hDaTdHMm4yU1ZDbXhPQVY5ZGt6ZkFhR1NnRzd6RHVrTmZL?=
 =?utf-8?B?NWs3SmZpaUh2SGp1ZkhBMmxXOHlEWmxlK082d3VtZHRiWUdOVFM4bm1YVnJs?=
 =?utf-8?B?WElnR0JqeXlDaTRYdDN6WW1ZNk9ObElQTk1IdGtkOGw1NjZicUtRYm4wNU5V?=
 =?utf-8?B?U0Uvc1BVOHZMRGxNYjlaWUJzQkxmUmJBV2hhaisrNFVjdVhWMTY3aVpiaDFm?=
 =?utf-8?B?ZUpSUjRpbjhKc2hFL0U4QngxL2hKUzFjejcyU2ZVVGNSMnJYQWx6QTVtQ3Jv?=
 =?utf-8?B?a3F6aUF4a2pYTXVKOWhVS0dtWEhFdGkzK212MHRhdUFBNlpwdllVZGI5Z1A2?=
 =?utf-8?B?b250UU14bkpRUEcwbWc1WW9xRlFBUEdHSmFpY1RTYStZcDBDaXkxQVpmeHhI?=
 =?utf-8?B?N1BVTW1FWXFnSmYxUmE5aXA4S3VEckRtWldNTVJoVzB0SEc3MGtoMFk4d1ph?=
 =?utf-8?B?MXREZkV2cTUzbVU4N1JNVmV4WlJ0Y0paUG0rb3RXaGk0a203REFBZ0FOcm8r?=
 =?utf-8?B?M2RjN3BjSGxnckd4djlnN2dqWkIzVUgrT3hZdGNydXdRR1p2c0t3bUVKbTB4?=
 =?utf-8?B?SDNOampVWW1HYmI5cWh2RUFMRkhwUXVlZzEzTDdjdm92azRHN2paencwWHFB?=
 =?utf-8?B?VUNEWC9peTFobUQvTEt4cEd2clVUa3lrQXVKYTZqcW1VMk1meWFPckVKa3VM?=
 =?utf-8?B?NHdrRW9tQVFDUm1lRllkRHVsU0I5RTQzR2pLOUxuOHUxamx0NFlnZHBMVjlO?=
 =?utf-8?B?dmZtWG56Rit3YzBOay93N3NLZWk4aWhqc1BWdXRuV1I5N1BQNmkzRzlkWGZT?=
 =?utf-8?B?WVArQ083MVMzZkt2eUoxV3hLQlJqeEZkdXZRVVRrcU5RcUZpbmdPZ0VSQ0NC?=
 =?utf-8?B?dGEza1lHbVltTkRmL2E3amZZVzd6bDJ6aHRreWpPVTRWK3k1dUZ3R0xQYUVi?=
 =?utf-8?B?aHJhQVRDcjVuaVZxaVJyR1VFRjFyZXBNelJMRWVlaktMSUlBZCtCUGEydkpZ?=
 =?utf-8?B?OXlvOURvWnRwYVlyc09wV2ZURmJveWJHWFpWMzFuSFRYVXNXN2RaM3Y4T2x2?=
 =?utf-8?B?Q3d4SlNGVUkwZ2pXYWhhMU5XTWwxSVdsVVR0RGo2L3o4Mm42T2lRZTNHWEo2?=
 =?utf-8?B?TENQRjlTSUVrUTlHOEhPS2xvRFlLOTJEcmJQV3duR09aWmJUNWRXcmtQdWds?=
 =?utf-8?B?YXB1TTZqTXVMb3psU1lUMDJQRmVrOHVPVzJQaFR6L01abHpMUmRzRjYvSXFz?=
 =?utf-8?B?d3lzU2Y1NDNqVmJ4WlFkakNwTWJ2bjRiWVJ3Q1ZRSTNZazIyTjVTOVc1OVg4?=
 =?utf-8?B?U1NtRzhsKzBwRmV5UWRycTlpYU9GbmpnNy9tc0FoVU5IbTdiR0NacHJlaU81?=
 =?utf-8?B?dWY2R2g0S2NlQlBvNWZ2WVJYZG1wVVpNS3NGVDVpSFlYV2p2WDRGdFI4NU1p?=
 =?utf-8?B?OWw5bmdrbUpDTHFQckxMNkR5cVFWajQvMzByWjRrTnVsMDVYQ3VwdXdYNjM0?=
 =?utf-8?B?aTY2RmhHdm8rOURraEpoRld1SFR4elljY2pmcHV2U1FWeUdyWG1vbjBVV1VO?=
 =?utf-8?B?WWdjaG40VC9OVGIyU2EzUTJKNVpMQ0tJUVk4dDJhWDBLZ3FSOG8vWHhEM25K?=
 =?utf-8?B?T29ZSTFHVHI0NklkeUVtcGNlTHpaTHN2eW1KOVo5ckhsbDY3cXI3OFQwOXRS?=
 =?utf-8?B?bzBjeVVKTm1XcHB1blh4aGx3RkZTYkkvT3ZFc3VDVktjVXRSQTlQcGRMTms2?=
 =?utf-8?B?VWJYZVJRWTlTUTRtQkd2Z2c2YmJUMkFCVW8vZWhCNXFpSHJBMW5EYWdqS1p0?=
 =?utf-8?B?eHh6dUlMekxVSDFLdXZkRjBiR2JQQU8zWHFwYlRBc0F2c2hFaDk0bTBsbE9Y?=
 =?utf-8?B?bjJXb1dMeXQ3THRQSTd3QU1jbmp6R3BqbVFGamRoVHZEbmZCRTlNY003M3Vk?=
 =?utf-8?B?dk1iOVEzTzVuNmxWazJhdEs5QjNzcUJvR1FLZXkrQWpvY1lHVUpIc053Z1ph?=
 =?utf-8?B?eHIyMVRnWHhBb2ozUmFxbzMrOERYUnhaWEYrdEpEampPTThjQlArcHIyVkU4?=
 =?utf-8?B?dklZdTBVWWIwVks2ZmsvbGVwSG1WdzVQMU80WXFWY2RKUVA1b3VCc1p1MVBt?=
 =?utf-8?B?V3pLbjUyd05tdW9OQ0N6anJwZmRZc2t2SVNyeUMyQVRFWGt4cld6TjN0b2x6?=
 =?utf-8?B?NHB3QW9COW00bnZmQWZKMW9tNCt6RXhhWXZ1YTI4MFEzYUpGUkFtUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581c67b7-92ef-4482-4be6-08de69b81a8e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:54:17.5009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVflxfiwth4M/RnANXfvNZd8/g/Hds5cq6nyN8sZUl5WDEra8UTNIlJllOWzaC4dLGkHt+yuDCo8HIzQqageYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
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
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 5F7A1127E8A
X-Rspamd-Action: no action

On 2/11/26 2:47 PM, Lizhi Hou wrote:
> Enabling turbo mode disables hardware clock gating. Suspend requires
> hardware clock gating to be re-enabled, otherwise suspend will fail.
> Fix this by calling aie2_runtime_cfg() from aie2_hw_stop() to
> re-enable clock gating during suspend. Also ensure that firmware is
> initialized in aie2_hw_start() before modifying clock-gating
> settings during resume.
> 
> Fixes: f4d7b8a6bc8c ("accel/amdxdna: Enhance power management settings")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>   drivers/accel/amdxdna/aie2_pci.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 5b326e4610e6..0d41a6764892 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -323,6 +323,7 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
>   		return;
>   	}
>   
> +	aie2_runtime_cfg(ndev, AIE2_RT_CFG_CLK_GATING, NULL);
>   	aie2_mgmt_fw_fini(ndev);
>   	xdna_mailbox_stop_channel(ndev->mgmt_chann);
>   	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> @@ -406,15 +407,15 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   		goto stop_psp;
>   	}
>   
> -	ret = aie2_pm_init(ndev);
> +	ret = aie2_mgmt_fw_init(ndev);
>   	if (ret) {
> -		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
> +		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
>   		goto destroy_mgmt_chann;
>   	}
>   
> -	ret = aie2_mgmt_fw_init(ndev);
> +	ret = aie2_pm_init(ndev);
>   	if (ret) {
> -		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
> +		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
>   		goto destroy_mgmt_chann;
>   	}
>   

