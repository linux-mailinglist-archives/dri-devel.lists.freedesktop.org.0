Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150889B716D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 01:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB2B10E81D;
	Thu, 31 Oct 2024 00:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WrkL+r5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A2210E81D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 00:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EufI2rmvSYjjKBEKKG2ukuofOLHZanPJwRLit4nJWlhqCjG28//r6YeUbIwY4Vk0qWhq+heYmXphZQ8m9fEX77Xbi9EROzDE0qRMQ6zs+vQCs0/sbRZTQfo5iK28Z0XCzg64CJYunxPoJzmfgyOB1NJD4uwejU+Gm6mMFvenqD1CxHMqpBDsM1fr3KbsooQ/by6LW1GqJSxBpOkvyDarflOaVhGrq9zR7tqPsU1truW01xKz9hiK/5groRjWZKZfbE3oCLR6EGYen8mbO0/r+qTUTHCY07LTqPYZg7Ynne0bEK/SPNaXKC7bEgbobseTp2MsjOSQDGQS4vVtHACHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgI/CZtCrPbROhSuigz/4alQX1huY9smok7DJnODc8M=;
 b=uR0s4LckEgX2SzKCtKQILvYgAivNnr/ID12fqqzHnVSW0EfKzjlf9uC7wSWMheRfebSTB7UTD0lT1eYlEbCK7D0tSc/MGjFnB+Vz6Rha4Tnz5Kkr+zUyCaImHd9MWomYtmBy8S84pPxpCuysEsm9NLOApwAvmTlWDLeWWrNc2aZJz3R5E5lj3aWLqBier9ep8rM7+P9OLkOapfoOt5FhXSJs9I81pON3toDCQlXiAuF588jjAdOzDMacc0Fjs0F17RS6un+QOwx1+MZr14tHBjETv/VJUnPxsc/KQq2IcrjaWOP5VJHxoZcUoxciMtdaxfAsUKF7jwKhhmBV0tIbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgI/CZtCrPbROhSuigz/4alQX1huY9smok7DJnODc8M=;
 b=WrkL+r5JyY5OtMzmXWsrjSIQxgJHPvQQXFLYPQKvYOEwJRvhwwGKmuMlAsRC2NgNUwjqnu0oeLthgUy14Q4jmSY7EFqtu5rSkiSDTRGCi4XgRSFkoLJ4LGKyjymcD+iDDc558OVsPtCrOdHGXpl46VBOcFs+mFKbYY2oHWKZMJrmLKdTr+WER2w8jgWqh6b/ueoY7jJ6gqGJpidd3nUifaPNfHprQiEKELCUcvy5ctmKksKzAK8/1+rWJkppyPg2yTpCntO3DsdCPkuPA208pxp0fk/NK9CnbT/YX2toYRCVp13BaQx3cfy+YJrH2k4tD3LhDM9Ee4a3J9LNDAogVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB7914.namprd12.prod.outlook.com (2603:10b6:510:27d::13)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 00:58:53 +0000
Received: from PH7PR12MB7914.namprd12.prod.outlook.com
 ([fe80::8998:fe5c:833c:f378]) by PH7PR12MB7914.namprd12.prod.outlook.com
 ([fe80::8998:fe5c:833c:f378%4]) with mapi id 15.20.8093.021; Thu, 31 Oct 2024
 00:58:53 +0000
Message-ID: <33d7c0ca-8459-4b85-a0e6-97f2e1e8db91@nvidia.com>
Date: Thu, 31 Oct 2024 08:58:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI/VGA: Don't assume only VGA device found is the boot
 VGA device
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Luke Jones <luke@ljones.dev>, Mario Limonciello <superm1@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20241014152502.1477809-1-superm1@kernel.org>
 <20b48c6f-7ea9-4571-a39c-f20a9cf62319@app.fastmail.com>
 <f56c555f-7313-43ff-abe4-28fb246e31cc@nvidia.com>
 <CADnq5_OjfJzcOqa=NbWVw5ENvi+nmvNAZX0u_0hOvk3EVoh0bw@mail.gmail.com>
 <fd7cae9a-5ee1-4e18-915d-4115f0a6a156@nvidia.com>
 <CADnq5_NTBXPbW+u_AxTewH-aouLNn4gxebpzUSzsyev-VxOtcg@mail.gmail.com>
 <46b487ec-e8a6-43fb-85d5-f264618f2e5d@nvidia.com>
 <CADnq5_Mh7B8Kk144terpvV9kf2Z4xcQ0nhVakHOcDdwgd3Y1Fg@mail.gmail.com>
Content-Language: en-US
From: Kai-Heng Feng <kaihengf@nvidia.com>
In-Reply-To: <CADnq5_Mh7B8Kk144terpvV9kf2Z4xcQ0nhVakHOcDdwgd3Y1Fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0033.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::14) To PH7PR12MB7914.namprd12.prod.outlook.com
 (2603:10b6:510:27d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7914:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: f7954e81-fa28-41a3-d1f4-08dcf9473092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWx5bGc3eUNRSUxWbFdNdlZpaGdpU3pCUGREU0ZKT0l4TlQvVHk3T21CN3h4?=
 =?utf-8?B?UmVSVy9YbkZVazVZL0VIRysvWjlIS1JaZmxSTkJieGl0cjVVOG5NYmRuSmpN?=
 =?utf-8?B?RUNJNkZ2QnVhdnIrSzRNc1RyMm5aMzhkb05EWm40b3Y4RjVFMTVzZlNWZnVS?=
 =?utf-8?B?YTRHdjlCMEUyOExjUmx6b1k4U1o5bXFZVmkyeHpWMzhOREhrWklvVThwN2NS?=
 =?utf-8?B?YUpDOWYwOUg2L2E5TVRsMW9kY3lFdCt0Mlg5MlVLSGVUR3hIZld6RVB0aUty?=
 =?utf-8?B?RllLVDRuZXEvQnJEbEhhYzIwcGV2K3F5MlJTU0YrMitSTEFMUTFaSUx2b2Za?=
 =?utf-8?B?MVZyRWVUSHl6NnRxdGNld3ErTTN3R29BbFlmRDRuNDgwSmJKWk5udG5PeFNp?=
 =?utf-8?B?NzMydS9GQ3U1T2tTcW5WM1BJcVdIVVRLbzRFZzlRcThKdVlyZXZES0FnWkh4?=
 =?utf-8?B?cmJrT3M2cTMwL1lFdEg3TXlVTFJKNE5lSWdYU3pvWExJcXBCbFkwT0lDM2tZ?=
 =?utf-8?B?TEExaGxRT1pMUG5RRnRqU0ZXbENhRDduc1hZZU9jR0Rucmh6Z0kybGI1OFN3?=
 =?utf-8?B?V1FrdFdUTlU2SDZMSldoL1FzeEpIaU9rZE9lblZvejFHUW5uMVNMdXFPZFl1?=
 =?utf-8?B?UWdwUWVBM0NpaWtCc2FyTkNpTkpQYnR0T0FVb1lhVnBZdDNnNWx6a0VlWmEw?=
 =?utf-8?B?R0YrVEF1K1lsT0pjS2MyaHZGZ2pTQTR2dmJsbGJJS0g3YVczRUxoZWttT2tP?=
 =?utf-8?B?VnlxZXphMWZZVVJwWVAxd0hGTEhLdUpWMG50b1NmTzBlNFcxbEM3a0VwUTNw?=
 =?utf-8?B?R093RmozTGhqTlNlcitxVUtiS3orQmZVU01qYmxjcGltclBRaC9ySDYzMTB0?=
 =?utf-8?B?OUVVcmFLb0N1bUh0b2VTNzN5NlVhcVd6OVcveU16UHlWNnAzVWJnakNtREIz?=
 =?utf-8?B?N0tGc0w4MjEya0UyVUNNaXBxOHZ0dVBySmRpWE9vYUlwcWdqWnZZaTdPUjRV?=
 =?utf-8?B?MGRMd2ZLSVdiOWpWRTZZV0NydEdqb3NTR2xrOGJRUzltQzV0RmxUVmpuMjJk?=
 =?utf-8?B?V0tIeGp2VDhUYWlnY2hlb1FJNXM4WmdKNCtaeXlDZUJnVGJXb1pxVkE5SW4w?=
 =?utf-8?B?ZzMyeTF3OVRvSEIvTjJMUnlJR3ArRkdxWlVxdFZYV0J1bllCUUNXalRLV0FE?=
 =?utf-8?B?VGtESDNBZGVLeE9vU1JJbkx1STdMTzFvcEtLUUx4cVlzblVUK2tRY0ZzMFhl?=
 =?utf-8?B?TEJnai82Y29CZURQdHlGS3E3aUh4Q1FvL0NwL3lKTGprNzZFYzZpcm0zNkoy?=
 =?utf-8?B?MkdoY2FBNEovSDByKzZSODM3TnFMV2ZJSnZkOWFpdEcrQVYyTG5sK1ZpOXp3?=
 =?utf-8?B?ZkVZcGlWeHFwUVJ3Y3RxN2lXMlJ0dlBUNkx4YkFVSVRqWEcvL1NybXZYS3Ju?=
 =?utf-8?B?b0IzYXJ3OUo1NktMZThhZ0cwd2pxRGhkRFJqYUNJeUJqWnVZeXRYOTVIOHI1?=
 =?utf-8?B?OWRjWnBpWEpoUFlCSHM5d3N2Y29FQ3JDOThmeVhlQWRZSDhKcERwUWRBbkw1?=
 =?utf-8?B?cFZRdXZ1bkV6cDdJWUlUNlFlN29TV0RkZWZoMGZlamI4UTUwTTNENDU2eHY0?=
 =?utf-8?B?cGRwb3R1VEJkeVIzNmtOOXRsVzIwSVVLM3pQOVZGa3pqVVJZMkNSTjdqd1Jh?=
 =?utf-8?B?WHFRZjcyaHdmT2o0b3NERVozMWZvZWlRZ3RTWTZSdk9YZFF2RitHOFlOcjZ6?=
 =?utf-8?Q?cvB0l5J/YUWhu3rmefNXgzd1f4RBoMnwFcprgwe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7914.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckJpQ1R5Vm92THE2SjJoL2doQzhmRWVpQmhIZFhteUc2S0p6WloxeE5KcEk0?=
 =?utf-8?B?UDA0ZHg5Vm5SbGs1dElId3RORGRUWHcxVkllMkNSVlRwSmZIWFo0Ky95MHZS?=
 =?utf-8?B?UWVXWitRZEZFVGlUNnJlTkgvZzBqalVodDA4RDBMdzBUbDZKQkJPZEZYWUJa?=
 =?utf-8?B?b3BWbnFkdFNPQVZxUm53b2h0OGRkUlhVZVpiandpS3V3YkU0TlFxd0tXTkZW?=
 =?utf-8?B?OGhabFpOUGdldEN6VTFlcndadmNrOTVvcEJLUjRMbjd3U1ZOSGF0bEdjQ2pH?=
 =?utf-8?B?MVFyNi9Rc1BKd1pYMk9TU0ZtRFVady8zUHhOZW02L0RyNWFkbjdkL0piNHRx?=
 =?utf-8?B?ZUZ0aDlhL1ExODVPOTdUQ2x1NWRCUURqVXovcXNkRUFCZmk4VXhRdmtwckU3?=
 =?utf-8?B?RFBHSDVjMzJ5cDRmcjNIQWhtajNxYTdmR2JVczZ6YUhlSkpqbVJ4OVdTTURx?=
 =?utf-8?B?L05rNHpJRmZIN3RhL1NzYmF0TGhOcGtJOVRiOWJlVE95N1RpSkZJUm9pRnFm?=
 =?utf-8?B?cnVjRGVIcmRPd2FCS0cyZFJrMVV3MC9veWJvUEFqUHM2aytFY2MwWHJtNmdn?=
 =?utf-8?B?UjJETjBoZWVOY0x5S2NneGlxSDFUcHdkYzdkTlR2RHBBdFh4dDNmQWFsQjBD?=
 =?utf-8?B?T3RsMUcza2I4VmJaYUl4eUErcU1yZExCQ25IeG5XTDEraFdMcDVMSzRjQlZF?=
 =?utf-8?B?VUZiejZxQUY2ZHFKRVpyeG9GWlJiTU1tVW5OSUhYcjhTTXdBaUV0SkxVbm5m?=
 =?utf-8?B?NElNOHdHcTFld1JPUEYxZ3BIQ1FoSXUxK3VBMjErVkxOOVVKNlB0MXVqVDlw?=
 =?utf-8?B?d1dnM05WbVZldG1mNVJ6WlNaTDVmaTYzRWFJc3hIYWh0YWN2Y1FObWl0bmNt?=
 =?utf-8?B?M0MvSGQzT0xNRFFSUFV1UXVLVHZVMnNERGpGQmE1dE1YNDZKdHIxME0wYUYv?=
 =?utf-8?B?RVJ4SFlvdkx6TGdkL3Q2d0VXdmdHUWRpRzFrVTgvR2MrWC81ZDVPdGlnajRH?=
 =?utf-8?B?YitQMjU2Szl6TlZ3SmFGQUM3TGlrWnNXUFFJeElycWkxNXQxaWdiL1htQ0d3?=
 =?utf-8?B?eE12M2lzdGZZT2psaHVOY29paHBqTk9CdVZIQnFqRm1WM0VTamVCd3hjUlE1?=
 =?utf-8?B?d2w0cDZQdDBSYXhCallJalQ5dzVWOGJqUWhPbXRUV0JiNnNYWkxTeGZOTGNC?=
 =?utf-8?B?SWJpbVJacEVUbXZEdDVuNjBWUmQ4S25taUN1RkZRdTJXOWR3NXpvcklYSVhW?=
 =?utf-8?B?VUlNenVWdTgxM3pWaHVBQ3FEYTR4WG1vRjBtczFjWkU1M05vUThhR3Q3RSs1?=
 =?utf-8?B?NWhBZkcrbko5Yy9QMzA4RGVhUmM2dmVacUFtMUtsRmxZT2RadGxvcVliZkNk?=
 =?utf-8?B?UHlxaXpDeGxhN2FJb0dpMnhlTGxkcXNtVWJJNGlyK3ZGQUZuMk8vZ2dGaDRv?=
 =?utf-8?B?UTdsTmNjZEF2R3hVZURKRlgzYlZkdW1ZYS9IemFQLzRnaTJ5bXA5aXhuT3Jt?=
 =?utf-8?B?M0YyZ2s4VE4yWVpkUkV0b3pueTZZQXZpR09odFVQNzdCQjQ5aExyeXdQMS95?=
 =?utf-8?B?Tk05RHlpWGFoSFVFRGZ5eEFWZDRyMWxRclN5UVRiRnpoaE5rVmxWK3N0T0NO?=
 =?utf-8?B?T3ViQVA4dStyNnBQWnJCMkdNbTh3ZG16dTNzaWlNNkMvcGV4eFRwK1NidVdO?=
 =?utf-8?B?ZklqcVZ3MmJtcjFuQnBrTDRlZXIwOW53ZFNockpBTmVhcW9JaEVpMXpwK3N5?=
 =?utf-8?B?VmJiMDRheHlmTUduK0Fac2Rha1hGTVFMdnpBMFRtZDMrcUtOZXJ4dUFJc2ti?=
 =?utf-8?B?bjF1Y3o2aHpKMkR3VlNMa1o2MU1KamhlbytWLzNSR0JLNG9nNmJud1JzdmRx?=
 =?utf-8?B?bU9xcFlvRjdFLzVmak42aG9SSkphMkMyWGRMcU9rTEVEZkpJRGdjQi84dGtv?=
 =?utf-8?B?SHdsZDJidEgrNHVLTGVYbFpNdUdha3g0SXNleWgrNExMUVZZRTQ3YmNpOEEr?=
 =?utf-8?B?ZktET3VVdzA0WjdqNHlYQXhqZlc2aU5FbkZSckVEeXNXdkp0MHMwQmtua0Vs?=
 =?utf-8?B?b0xTNkdVVVhJVjlFVWxtdHpHblZobU1nK2lXWi9Ia1RPUG9hYW9xZURhNnpH?=
 =?utf-8?Q?dFwETQ/zR2rlIGbJ4sLZ2DZ91?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7954e81-fa28-41a3-d1f4-08dcf9473092
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 00:58:53.4268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVrcrrF8Zi/JgwQOZLyinF3pw8B8wdZjqtFBDm5orc8uccGWvT4wbgjxjjrdYu39hs9Sg+bVLPFDMXv2/A0zDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283
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



On 2024/10/25 8:55 PM, Alex Deucher wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Fri, Oct 25, 2024 at 3:51 AM Kai-Heng Feng <kaihengf@nvidia.com> wrote:
>>
>>
>>
>> On 2024/10/23 11:27 PM, Alex Deucher wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Tue, Oct 22, 2024 at 9:27 PM Kai-Heng Feng <kaihengf@nvidia.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2024/10/22 9:04 PM, Alex Deucher wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> On Tue, Oct 22, 2024 at 2:31 AM Kai-Heng Feng <kaihengf@nvidia.com> wrote:
>>>>>>
>>>>>> Hi Luke,
>>>>>>
>>>>>> On 2024/10/15 4:04 PM, Luke Jones wrote:
>>>>>>> On Mon, 14 Oct 2024, at 5:25 PM, Mario Limonciello wrote:
>>>>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>>
>>>>>>>> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display device.
>>>>>>>>
>>>>>>>> ```
>>>>>>>> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeForce
>>>>>>>> RTX 4070 Max-Q / Mobile] (rev a1)
>>>>>>>> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI]
>>>>>>>> Strix [Radeon 880M / 890M] (rev c1)
>>>>>>>> ```
>>>>>>>>
>>>>>>>> The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU as the
>>>>>>>> boot VGA device, but really the eDP is connected to the AMD PCI display
>>>>>>>> device.
>>>>>>>>
>>>>>>>> Drop this case to avoid marking the NVIDIA dGPU as the boot VGA device.
>>>>>>>>
>>>>>>>> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>> Reported-by: Luke D. Jones <luke@ljones.dev>
>>>>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
>>>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>> ---
>>>>>>>>      drivers/pci/vgaarb.c | 7 -------
>>>>>>>>      1 file changed, 7 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>>>>>> index 78748e8d2dba..05ac2b672d4b 100644
>>>>>>>> --- a/drivers/pci/vgaarb.c
>>>>>>>> +++ b/drivers/pci/vgaarb.c
>>>>>>>> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>>>>>>>>                 return true;
>>>>>>>>         }
>>>>>>>>
>>>>>>>> -    /*
>>>>>>>> -     * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>>>>>>>> -     * other VGA devices, it is the best candidate so far.
>>>>>>>> -     */
>>>>>>>> -    if (!boot_vga)
>>>>>>>> -            return true;
>>>>>>>> -
>>>>>>>>         return false;
>>>>>>>>      }
>>>>>>>>
>>>>>>>> --
>>>>>>>> 2.43.0
>>>>>>>
>>>>>>> Hi Mario,
>>>>>>>
>>>>>>> I can verify that this does leave the `boot_vga` attribute set as 0 for the NVIDIA device.
>>>>>>
>>>>>> Does the following diff work for you?
>>>>>> This variant should be less risky for most systems.
>>>>>>
>>>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>>>> index 78748e8d2dba..3fb734cb9c1b 100644
>>>>>> --- a/drivers/pci/vgaarb.c
>>>>>> +++ b/drivers/pci/vgaarb.c
>>>>>> @@ -675,6 +675,9 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>>>>>>                     return true;
>>>>>>             }
>>>>>>
>>>>>> +       if (vga_arb_integrated_gpu(&pdev->dev))
>>>>>> +               return true;
>>>>>> +
>>>>>
>>>>> The problem is that the integrated graphics does not support VGA.
>>>>
>>>> Right, so the check has to be used much earlier.
>>>>
>>>> I wonder does the integrated GFX have _DOD/_DOS while the discrete one doesn't?
>>>> If that's the case, vga_arb_integrated_gpu() can be used to differentiate which
>>>> one is the boot GFX.
>>>
>>> I think the problem is that the boot GPU is being conflated with vga
>>> arb.  In this case the iGPU has no VGA so has no reason to be involved
>>> in vga arb.  Trying to mess with any vga related resources on it could
>>> be problematic.  Do higher levels of the stack look at vga arb to
>>> determine the "primary" GPU?
>>
>> Hmm, I wonder if all those heuristic are needed for EFI based system?
>>
>> Can we assume that what being used by UEFI GOP is the primary GFX device?
> 
> Yes, I believe so.  The SBIOS should use the GOP device as determined
> by the user preference.  I.e.., in the bios configuration you can
> generally select iGPU or PEG for the primary display.

UEFI spec, 10.3.3.1 ACPI _ADR Device Path

"The _ADR device path is used to contain video output device attributes to 
support the Graphics Output Protocol. The device path can contain multiple _ADR 
entries if multiple video output devices are displaying the same output."

Luke, can you please see what are the _ADR values of the iGPU and dGPU? Maybe we 
can find which one was used by GOP this way.

Kai-Heng

> 
> Alex
> 
>>
>> Kai-Heng
>>
>>>
>>> Alex
>>>
>>>>
>>>> Kai-Heng
>>>>
>>>>>
>>>>> Alex
>>>>>
>>>>>>             /*
>>>>>>              * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>>>>>>              * other VGA devices, it is the best candidate so far.
>>>>>>
>>>>>>
>>>>>> Kai-Heng
>>>>>>
>>>>>>>
>>>>>>> Tested-by: Luke D. Jones <luke@ljones.dev>
>>>>>>
>>>>
>>

