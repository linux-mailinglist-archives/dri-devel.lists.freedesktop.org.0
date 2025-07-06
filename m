Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B4AFA7B1
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 22:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0C010E102;
	Sun,  6 Jul 2025 20:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A/8gmhVi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1289DA9;
 Sun,  6 Jul 2025 20:34:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMwF1TlYqXI4ktG0cFr4Zhc9yTwIYkqnA5/I02+rROQaWwc/hEpeTcAaVBjR60EuOVye6YXMB54VEKxwmdih+pI1C6Xz9AmXjaEnbDZFIKdhCN84vwoEJNa+4VqJFXxxLmnPo7FGUSEcSEd70J6nOHVxq81lwMSbCxj8W7zNJhulTRYnEVw4Y+fpJxdbfFhSBycPxsWLHntfdTAjBsgfn+7/xOpJ4wjqJaSIYZ1MNgW5b3nDxA2epYnC+dp91bTOhZh/fvVTWlGyXPquCkmwg5etlIi78jf1OZv779HLNtSyBmlynQ5PXgMua8/dmfprH7+KUlAF323ihWNn6DKwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ree+RMSCCpbxugGebO34O4spfpK+5h2OGbtZWz6Znr4=;
 b=P49cH52XoD9SQ8SUO2KCj3sVsPzybVBgJih3htmKQ0zmnftWdh0gFnRZZ/zHpwM3+HlbEccks0/c1jQp6dT2PFDiJw4ZApoBsaLHXPhzTxy6JxgBBwaOOGezKrqc+p/hIvBpzg9v/Fdrn+dKGgr8MXS+PjJYtD1JagHRMNTR+CpTBDLTWrRV8zlp8glISs/QpJvWlC1dxob456NZoFatKRmvzE/kxVQU38pYUH4WRQQAuzFNYHx3+Fof5c3HEHG1eqTjD4wRyYMDhdIbrkdturMQZz0XaN0Wy4DJNNZb6F86BRv7q8Gd3i17+Tii0V9fVK0R0HG7o5R0n1Twq3scdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ree+RMSCCpbxugGebO34O4spfpK+5h2OGbtZWz6Znr4=;
 b=A/8gmhVi+iIDi3z8Tiu2pXPokNJmqx0IuYrJhMd76eScx4kz9TP2kja6nl9kixPPimdw3uBYEIMdAxvZdgIpWXEZ7fTCDxROBqdHfCaAM3DGzkHwE40MuBdOa/NVggi3USDUIYc7Jm2VTtkDUPPxuJZGQjS8lT+4INQrTEYCh/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6877.namprd12.prod.outlook.com (2603:10b6:a03:47f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Sun, 6 Jul
 2025 20:34:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 20:34:13 +0000
Message-ID: <c847783d-eb92-49aa-919c-447cbc34baed@amd.com>
Date: Sun, 6 Jul 2025 16:34:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
 <20250704101233.347506-6-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250704101233.347506-6-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 7352f33d-03a0-45a7-090b-08ddbccc77f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnduTU5xdG1yUHJtQ0tuTU9Pa0VjRVhHZ3JVMjdGSEFwWkY3SGwwbnlHWTho?=
 =?utf-8?B?dFJqMjJZMDNDUTBWR0xlVkhmVzFCc29JZW9QM2dRTktlY21mdWhCTUZHVHlI?=
 =?utf-8?B?bklPMmM2M2VVSVhJbFdwR2hTMzluV2Q0OURCMlNFRmk4Y1NVZjVOa3NsM1R1?=
 =?utf-8?B?enA5M2NWQnNwS3pzRXlhaWNwU1cvRUVUZzF5QldNWVVsajBhVzNLSDhWZWtV?=
 =?utf-8?B?emRXMmhjNHpoV1ZldkJrWGtPT0prUkVSdDBZUUx1am9LcU1lZ0lpUllKZmJJ?=
 =?utf-8?B?V0pncXRIb25JSTRkekxzYjBuZzYrUDFNOEtvZWlhVzEzN1hxR1cvb2h4NjE0?=
 =?utf-8?B?UlNua3dUd0ZFREQwVFlVdXZsOUxWVUxFbEdwZm1wbkl1dG9kNVEyZUxUYnFC?=
 =?utf-8?B?TVFIK05uNFJrUTVBWXVtL1c3a3lvc0hTWTVOclU5ZGhsKzVrYjRVQ2FOZFBL?=
 =?utf-8?B?SVFOWWN6b3paTkdtanpxNmpqYUFZdVNVRGFxWEVIaUJGY0lDUU4zQ2U2UDdp?=
 =?utf-8?B?SjVXWkRiUmdlK1R3dlFtZDNUTHRUVHNMSkkwTEwzUXpSQlA3UHkrbzBwWTg4?=
 =?utf-8?B?clRyRUpHOFlhVWdwNytUSDB6a2dNZ0JHdVo2djNXUTBjcTQ4V3N1K053YVIy?=
 =?utf-8?B?d2lFY01aSlFrMmFyUjExeUdwU0JuREVMbkhqZ2FNcEorYTRZeUw3b3F3cWlG?=
 =?utf-8?B?Q2dVUHVpSlBqOGZzVk8zZWtTNHFoZHZkZ1lORXBpcHUzWVhjMlFORzRPNVdx?=
 =?utf-8?B?MlZjY1JCMUx2R1dqUHB6cEs0OE9NQ1ZNZC9kUjFiN2gwbkxLU3o5cWRqSjFB?=
 =?utf-8?B?TVBjQm5XYVVKbndlMzNrdFpHSTgxUE05WURyRkU1RDl6RExJMlRXK2JldXpH?=
 =?utf-8?B?UTNNNVZiUUlpcFFrUm5FZURLY0E5ZkZCOHdDYVh3UFFPWTdzbUdPdXlUSzFM?=
 =?utf-8?B?TE85SlFEcVFTU1RycWs5ZVRTRkdRNk9QY3pFdTNkczgvM2RZZlpDYUI3RmNI?=
 =?utf-8?B?a1llZVNMbE1hWExYSStqL2NWb2FKQlZsNVpscnVuOHhaZkNyT2F6Wi80S1hy?=
 =?utf-8?B?L2Z5Z21tb1lRUnYxTHlKSHJ1bWR0OXRha2tnSXV6R1JWemRuTlZ3WVhpcWxW?=
 =?utf-8?B?WisrcWdSUVdvMGMya1ZYK1FKbzZQWjRCbW1OOUdVckVWaytKelJVZ2tJNXNw?=
 =?utf-8?B?TExCaDdCcW5pRDdxV2VDcWRidzNnWlhUcVhFL3NVVnN4MkJKTFZmcndvbEZZ?=
 =?utf-8?B?bGFISHJWdmN0U21CZWprSVZGZ2FLcVE5M0kvTVJLODhBbitzUHM5Y1B1dGp0?=
 =?utf-8?B?UmlxNXZScGVKY1JpVmVQbW1ZTk1FejdNYmV5TytmNjQwb2xwQ096RWZKb3o5?=
 =?utf-8?B?TnQreFJiZklERzhWeDBWbUpIYnFoS25qdTU0OEN1b09DQmVRMVhiOE90WU9S?=
 =?utf-8?B?dzBpTEhZZFVjZVRZU3QxdHpxdGN5cTBwbmhJVEdWajZ3RXVZN0N3S0ExTk9h?=
 =?utf-8?B?Y051UTcwWFNiQ3k5ZmZ3N09kOEpkeGNQajQvaHdpNEhYbmlHcnMybU81K2pv?=
 =?utf-8?B?cXI3ZlhXMUt3V1kveVZmMEtQOUlOZkFiTWQyUXlsR2V2WHYySkdaOFFQdE1j?=
 =?utf-8?B?R01iTm55S1N6MWMreWdIa2V0QVVFRUJFUGdJSGliU3ZTY01rUDlDZTUzRWlJ?=
 =?utf-8?B?NGFzVFNtYmZpU2JhSVlkTFJqbDhLdHNTb0c3MTk0NlNyenJkaGppVlRtMlRt?=
 =?utf-8?B?ZTBGU2lvUlA4MTBySEtlS05sT1grVlhOVko5WElabS9maXB6Qnh3Y3plSStl?=
 =?utf-8?B?am5MN3l5RTY1ajJLNjZGc045LzMvU0pwalFuSHowcDBZUWUway96aUxXMzFj?=
 =?utf-8?B?MExlSWJkd1hma2VBVXEveTVEdWxmQ3JJSlAyM3BhcDZkVDhDYklhSzJ5SmFN?=
 =?utf-8?B?VWlxZE9pbDFha2cvcGNPanR6S1gxaVhnTllXRGlkTkVqUXNKNTgzTDdkQlgw?=
 =?utf-8?B?cWhvcFNBKzhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUR5TlVGVUFEYTV3MmEza3pwS1BUWUw2MHBQTzF0U3RDbDRNL1BXNjRuemgy?=
 =?utf-8?B?Q3ZCVkV5MnVkSml2U1h2UHNzYmZYU05jcFExOFovWWJhajVGSm0vMUdNcmVY?=
 =?utf-8?B?R2piRExTNUtLdHdHTm0wMC9NdXNuOCtZWHBrcXAxcEd5Tyt1R0F5aURBNStr?=
 =?utf-8?B?Q3crRWxUdkRBVTNySTVXQTFuOEpaRkRjV0xNQmZXamZtVGIxekZEY2tpUVZ4?=
 =?utf-8?B?TU55SmNIV2hjc3UybDFsLzBKdVdySlV0dHNjaUw2ZGJXV3cxdUMvaTUzS1I4?=
 =?utf-8?B?b0wvbW5tL01UeXB0eFR2NFRheCtuWjJ3aWdtTUdmWkM5K0dSWUo2MXNQQnVX?=
 =?utf-8?B?V0NBbldoaWNqRENPQVc2Y2FQOVFPZUFrWGlCalN1VkVJSzV2M2lrM1ZZZ1BI?=
 =?utf-8?B?V3JHNVpsYmF6ZXdaUUd6ZkhRTHMrV25kbllUYjZCL0xrZ0ZpZURWaC8vSXR2?=
 =?utf-8?B?eVJ4STlkU0VZR0hXYlR0QmZXaG9YbEhWUm0zU2RudEQzdjdwVmlWc1ZUdVFQ?=
 =?utf-8?B?Y0xQUFRBL21kWlpNWEtHcnhndk1nQTUzRiswR0IyaHlrK1d6cG5WcGNuUXQw?=
 =?utf-8?B?bWI5U2NpRmhjbmNYN2s0R3Y2YzUxdFlQYTJEWHFRM0crMTE4cDJUMVdQTmNG?=
 =?utf-8?B?Nkx3dXR6eHBPWU4yRXgrRGdZemxLdHhMZzlqRWJuRkszYmxZbzRFc2RRTkZP?=
 =?utf-8?B?elhCejRSays1Qk5rUGQvNVRoc3YwZ1Vydjd6Qlo4a0QrNzNEOWFqTjFlbXJh?=
 =?utf-8?B?VFpjWDVGNmRBVkpJclh5K1JqbVlzYmdQUDRXZWMrWFVVQ3BMNTAzcWliakFs?=
 =?utf-8?B?aVBuVmcxbG84dFpPalJNV212RlBaVXpYMDZxU1Z6M0Z4Y3ZYcTlHckJiOHlh?=
 =?utf-8?B?SEFBZnJaS2toYVkweWJqalo2QUJtOVFXeXd5MENGcHZkc05kdy9mL04ray9M?=
 =?utf-8?B?MnpydnEvOVN6UTB0S3k2NmZPT1I5RkY5WllOSVZzYk5rOWh0eGZNMjZzVFgx?=
 =?utf-8?B?YTJZdWpIZmxqbFFnWkRZclJMR1VVdTJ6WWVPM0U3TTh4OWRiZGVrSXh4NXNE?=
 =?utf-8?B?WEdUZFliUGczTnQ0ZWFQNVgvQ3A1NUhHWXovK0pOTkxYeU9NeXA0Y0Jib2pv?=
 =?utf-8?B?TWRobjlSODNESzhwSTBIellMaXgzaG11QWlrcFJRR29oQkFTd1JZZmxtSkUv?=
 =?utf-8?B?S042Z1Z4UWJqTTVJUzRtOTFQc3hVUnp2cW5URHpINDN3SithMFZpUFBPMnpx?=
 =?utf-8?B?eW1JUVBST3RJcWYxS0lhbEE5WUN3a3diakw0dm8zOEMvL0xvWHJZRlp3Mk5l?=
 =?utf-8?B?Z0UreWxLM1phc3R4MzNZNG9hUGM5UkpES0wweVdRdmtsWVdvY3FiYmxJMURD?=
 =?utf-8?B?cVBtMmwvL05MSUcyVm1hUEJvakc0Wno4RFdGYkRtQWQrMm93SHE1VFV2UEY1?=
 =?utf-8?B?VHlYWXNJcUxmNzRRVDBIa3crU1B5MXd1UTdaR1V2N3QxcytTMGtHdkczWHcz?=
 =?utf-8?B?ZmxJdjM0bDBiSmdiQllnMTB6NnUxYmdqeXkyNVREYnpVdytMMDVjS2k1UHR5?=
 =?utf-8?B?d2tycFVpNlY5MmN2Q1lZQUJiUnNRQ0dveGpIOCtlcjVobzdxM3NuRE5zSE40?=
 =?utf-8?B?TS94WGZyWmdhMDRGVk96VElnLzlqb0xUaFpHQmp0Qm5QYVRFazdMYlM0M3Y0?=
 =?utf-8?B?MjQwbTFJaUVGYWxab0Y5ZlFoUEVQdFFMSTVzYzZieGtKQ25TcEorQTRlaXBv?=
 =?utf-8?B?c2dQSHlRTU80QjVUYTMxZlA0NzNNVE1UT3Nud1kyZCt4YWlIbnpva2lKV21z?=
 =?utf-8?B?ZkE2bE94QnpnM0FzalJTTWxEbHVNb1pyNW5RTkFqWnIzS3M5T1Z3bGNGaEpo?=
 =?utf-8?B?UGsxTlhmR3Yyb1FacUxrTExLQm9hb1FpN3FaNGRnM0xNYytvUmxLU3lsSVd1?=
 =?utf-8?B?VlBZc21XcDlQWUh6dDllZHFkcTFZWTNTbmhwQmhDRmVLUitxVHozL2hqYTZZ?=
 =?utf-8?B?YXovMmtHL1c4a2o2TnRDTE5wUXYyY2UxYTlJanRPL3dkZ0N0eU9iOTVtQ3px?=
 =?utf-8?B?Ym11MDRLYTRPV1o1RTF3N00wZHc0bktzek1jbWJ6K0xpWllKUUJLbkI4NFRo?=
 =?utf-8?Q?6n+kbs4OWZQuHvX+EGgwJDrpx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7352f33d-03a0-45a7-090b-08ddbccc77f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 20:34:13.0403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qr982NDepu7InhZuPlrJijXMkRtm9+LtQ5MAAoxDG917qqIVWXj+E5/Ppkm2m+4vvqUdOERqpGhnFjyODQimxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6877
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

On 7/4/2025 6:12 AM, Samuel Zhang wrote:
> For normal hibernation, GPU do not need to be resumed in thaw since it
> is not involved in writing the hibernation image. Skip resume in this
> case can reduce the hibernation time.

Since you have the measurements would you mind including them in the 
commit message for reference?

> 
> For cancelled hibernation, GPU need to be resumed.

If I'm following right you are actually handling two different things in 
this patch aren't you?

1) A change in thaw() to only resume on aborted hibernation
2) A change in shutdown() to skip running if the in s4 when shutdown() 
is called.

So I think it would be more logical to split this into two patches.

> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 4f8632737574..e064816aae4d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>   	if (amdgpu_ras_intr_triggered())
>   		return;
>   
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return;
> +
>   	/* if we are running in a VM, make sure the device
>   	 * torn down properly on reboot/shutdown.
>   	 * unfortunately we can't detect certain
> @@ -2655,6 +2659,10 @@ static int amdgpu_pmops_thaw(struct device *dev)
>   {
>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>   
> +	/* do not resume device for normal hibernation */
> +	if (pm_transition.event == PM_EVENT_THAW)
> +		return 0;
> +

Without digging into pm.h documentation I think it's not going to be 
very obvious next time we look at this code that amdgpu_device_resume() 
is only intended for the aborted case.

How would you feel about a switch/case?

Something like this:

switch (pm_transition.event) {
/* normal hibernation */
case PM_EVENT_THAW:
	return 0;
/* for aborted hibernation */
case PM_EVENT_RECOVER:
	return amdgpu_device_resume(drm_dev, true);
default:
	return -EOPNOTSUP;
}


>   	return amdgpu_device_resume(drm_dev, true);
>   }
>   

