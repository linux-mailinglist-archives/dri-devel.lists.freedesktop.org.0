Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E741D9ABEDE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 08:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81A510E744;
	Wed, 23 Oct 2024 06:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V0l1Zbux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C54C10E36A;
 Wed, 23 Oct 2024 06:35:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1Tul1fYCx/9dTj4YehH7805P1pbrlBDTAfmoiBSa48NyqBpZEa7ELM8+ilgUbvaz4/GWe02i4JSbJBlIfvMtDlONNxfP5TV4YVoQKof/MJN3qSHxhctrsH2VhFEEWxEYsXbLre5Om3bquE53Bg2Grf3cqyKW/UD7QoXqWolFuZL0LOE3bTwfJyvBX3S5P4LW29zzqrRVOXW6KxW14gqqPS2iAinNTDRoh9osv5OMQ7wVcJ8X2OP06M07qCELiIisHHdUnRx4256I1+HOEV/xGNs4++uQcL5aWfx73N7pclLr6z9yuNufsXVIqZ3LWdRqxz9bZp6q71QOPDo1erFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mU8yQAN327wQdllkdtFGHFMpCyLVSzH5nGEVQIsGcPc=;
 b=dAQWVUayV7QCiwMtGnZH42t6bbK34/m4cHchPlj4vjvkzh347iUxv1lwJvntgheBmbncMGc17CUjKUfC3yo1U1a5yWD+PkK6F+Z4/8hbkA/4Diza4Hi6p2cAP3IF/CSPKmHbqsdbY/khbjnFNzP8PwY0Z8QIZcK3FvjdCocin9ZerL/7NZMErSjOjemMjH/B30HNWiNu36KJEAbl6VeA8Czzxw1mUYhL1YfmjFLi2VMeSdax0kaqCUoyJqWsfiMpGm8oJY3dGx+PHS8eb7U0kxr+VHXOPkC0aTUwl24J5gwebQVJIHHJycsIs5VrdDwoQuGLxIr+HzluQHOe+crZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mU8yQAN327wQdllkdtFGHFMpCyLVSzH5nGEVQIsGcPc=;
 b=V0l1Zbuxax4MQqt0dmG44yWfFzTBX9mgjQbxZzslotYIAjLs4MHq9mzwFlf4oKtjWuRaGIo5KLNfcy/93RQa36lAkhxc1In0M/zMkBt5T6I5t5CqWqh4WtUUmQQLESZsqNg22UEPnpGIA+ZGqY8QvoIS8EWlsqkq3LDaUg0ve64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 06:35:20 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%6]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 06:35:20 +0000
Message-ID: <dad5d902-81ec-4ae1-b3c0-901e701be92a@amd.com>
Date: Wed, 23 Oct 2024 08:34:55 +0200
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
 <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
 <SA1PR12MB859939F759D6B661D49FC924ED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <3930f491-10a2-4863-8e24-009d3fbc2b23@amd.com>
 <SA1PR12MB8599EFE21B3D23648FEEB157ED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR12MB8599EFE21B3D23648FEEB157ED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR0401CA0024.apcprd04.prod.outlook.com
 (2603:1096:820:e::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: b33cae92-f5cd-452e-6190-08dcf32cd4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OW5VYnBiZkdWVzUzRXp3TVh6SGZFa1VvMy9IVWhWOW5DUFQ1cHRIR2hwemcz?=
 =?utf-8?B?YzluVkErZi95bGp2NUluSUl5RjU0aGF3eE5IYnVRS0JmTGxZTW40UzlIdjYy?=
 =?utf-8?B?NkJrZDJKTWM4UzBWME1icFRDbzFCeXlVMjBMNkNCd09uRTdRV0tkRENkQTNl?=
 =?utf-8?B?Nk8xWW04cWJvWlArSHh3dFRNSXVINlhFb0FERVRReFIwWmsxYVpuVXZOTFVK?=
 =?utf-8?B?Y2tPUDJJVitJdXhMUkpRbnR2b3pIWkxhZEhkYmNLaVF4VHdXRzZnUXhKUmNX?=
 =?utf-8?B?SHlDYmdYRVdHN0Z2Q0hVNUFnaFo0UnQ2OTZSTnlZMStNRDhaQ016ZEp2YkVB?=
 =?utf-8?B?WWI1dmFUSXVaSlcyVFNZK2xoZ1FiekJtd0Z2c0FUb2hXL01xbGczVytsOU1S?=
 =?utf-8?B?V0NEWmFnQ0cyR1VzN3psa1V5T0FGQTJGcXVJc0VEK1JQQ3crR2pGU2VOd0hy?=
 =?utf-8?B?WmhxNVc3QUc4eTlmWFZqaUxsOHVSQTcvaHg4MWNSYkI0bVFmZitBVkRQNUVi?=
 =?utf-8?B?U1E5bmgwbkJSOTVSbDdubzE4b2V6azZkZTdvM2NkNlZRWEE1MWFqQnV5Uk1Y?=
 =?utf-8?B?Q2RwNUkyYlZQVVNzRldsd3VoUjAzWjU2MTJ6ZzlUeWlHM3NtczhVaVFrU2Q0?=
 =?utf-8?B?U0pLM0lib094cGNjYlNkdUZYQ2s0NFEwMVdnM2FaZ2hkcHhaM21SQStQMkF0?=
 =?utf-8?B?Y1hrN05NalQrQlFkMmRxS1FlazRnMWY5RVFTYW1rR0EyUmd3cktrRTdJbkZJ?=
 =?utf-8?B?M04yS2tnUEJLdFhCYVFvRVNVUXF3aXk2OG9rTUJsVmY4S3I3THA3d0pBWTkx?=
 =?utf-8?B?bVhFK3Nrdkp4c3gyc3F1dDBMZmFWZC9GclNIVUJERjczaWhrR0JoeUdvUlpF?=
 =?utf-8?B?cVh1VUxyczRwV3NKdXdpTlA3elZnSU1TUVZ0Zk1kT0FHS0ZSSHpWQk15NW0y?=
 =?utf-8?B?QmpVUnJwU1Qxc3ZVSFNDYmZiZjhDNFNCbTBwcTBoeU5McmZ4WjNmN0JpamVs?=
 =?utf-8?B?RnRtWnpnd1ZRSExnRWFBTmhvV0JyQ0R5am5Fd29hTVJVT2VBR1hOaTEwY05p?=
 =?utf-8?B?OTVVSTVsU1BqU2ptYW5VWjllYnNMZVc5ZjBzWGZCUXZnUStRMWQ2Q21iNkhU?=
 =?utf-8?B?NkRla1ZPVE1rZGs0UVVUdSs2dzdETFVxYnRjKzVkZkpCcmhFaEpzREVOQWFl?=
 =?utf-8?B?SWtRNWl5NUxDTlFYSy80N01BWEdlWTNkNUkydmhrV0JvMG9uVWVSNnBlYkp5?=
 =?utf-8?B?alRyV0tSN2ZaWmVjMFdzbk9BQURScjM5K2ZUSlVORllxQlhjR2FaRmNUSjdq?=
 =?utf-8?B?V0R6ekJLZE5GeHNsTmt4dWNTOUk1ajVXa3Q4OFJJMlNEUTkvUVVYZTRmREFT?=
 =?utf-8?B?UTZyT1pSZ2YrNlM5clRLRkRSRllYSWNnTTRnQVB4bFYxOEdMS0ZMRytuN3VP?=
 =?utf-8?B?ajJoZGFJalUwV3NXYXM3R2pRMEc3S0ZsYUJRYTAzVVVHcE5zN3JhdGdWdlI4?=
 =?utf-8?B?QnNUTEdIZ0dPRUNBZXhiRmRlS014Zm5WUlozRGVUT0g4SUtPMzJaa1JiRzFV?=
 =?utf-8?B?ajRKdXIvNVNGOTQ3MWRvVUlXZEs3V1dSNCsyMHR0cStVTU9EdHhGZWYya1lF?=
 =?utf-8?B?Y1FuTW5iVVRjaHFlWTgrUGNsWkE5QkRYblEyYkg2eTJVWGRveklpZUpXblhW?=
 =?utf-8?B?dWhOdUN0NFdFWWltOVhlU2N2SkhGdjBKazE1RDVIQ1E2U2xPZ21HZXN0ZmZQ?=
 =?utf-8?Q?jfp09JQRdk9ejgOqLkt831pfXzbxBIsTPx/c9JU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zjc5Nm1vbjFIRnd5dHlLQUY2U0NNcG1GRnpEM1J4dFd1SzhvbC9Nb2k0eDhD?=
 =?utf-8?B?R1UzYjBFUmtpWEswT0pGSnE0MW5aenpCM3gyb3lWWDRoNExXdUJYaVVtTE8y?=
 =?utf-8?B?aS9ydFl3NUVKaVFMV2p3WlJPZ2NXcDR1ejFISTZDdHVkWEQralhBMjdiZjhW?=
 =?utf-8?B?SlBIOU96enFzOW1MRjc1NmFyYkhveVRPOHVQV3I4bkpBRTJzNlJ6ZDhZVEJm?=
 =?utf-8?B?ckhFZGpGYkpJSlIyajZ2R2tEYlo4RDBqNmxUT01GeGFHK056eUdlUU1DVWs0?=
 =?utf-8?B?bUk0Tm9Zbnh4eHF1SEZ3dzI3NHQ4UlNwNkdjSTFkazJuVjdqZHRwWW1WcW9R?=
 =?utf-8?B?VGIrRXJ2eXZ0eWlTYkgwSkdPZEk1QVJnUWMwTUR1bHR4RmFlbFBxWThoSDRZ?=
 =?utf-8?B?eFloWHVseDBHZUJ4dEdZdjc2algvMnA2ZVNmOXN4TENtWFNqaG1MSnlKU0NC?=
 =?utf-8?B?K3pXL0FmS2M5S2Z1U05zWTMwU1Y1ZXAvZVkvekl6cFdhRWxiYnErNFVENUhI?=
 =?utf-8?B?aVhUcHlhSXJOdDdSQWpGa1JpSzBGK2lKckd1RGdPR1BQTmlsL01oRFpidUd5?=
 =?utf-8?B?OUM2czhwQXcvY2VjeTZkMXo4ai9xWTRwWkZqYk8wT2dsZTJTbGdhQWFrY1Ra?=
 =?utf-8?B?MVJiNHk3S2REeCtOcTZjaXR5eWVYaERSOXB6TGx4YUdvV3ZIUWtlWEx0N05p?=
 =?utf-8?B?YWVyYlF2WFVaNDJ0QjVSZDFzOVlVR0JjenpTcndRWXRFeXdWOEJpYVVqa2NS?=
 =?utf-8?B?M2tVZVVFSi84UEZVelc5aVNtL0lqUlhyR09TTGZrY3BvMElkU25wWXB0d3NW?=
 =?utf-8?B?Q3JzdFZmd1FSd1FEeFBuVFRPM1NFZ3NZRndoUTJ6OTdXNktlTWszNXpmUGRl?=
 =?utf-8?B?Zm5jTVB2cnVya1FFNXhVUmdVSVNET0xoeHE1ZVRoS3pXSUlYSVhxY015NTFE?=
 =?utf-8?B?dysxL2c5WUlWNi9MVnJoWW43TUlnQ3R0Nnh0RlErbmZjZ1EzKzBzcmhmVmxx?=
 =?utf-8?B?Z25FZ2phTU9yRVNPcGhLbWJQY3FsYjN6UE5aUVAzSGZ1ZnJyMXg4WlVXdkNS?=
 =?utf-8?B?c0RhS0FSb0ZTckR4cGd6aHN1bEJYclBrR3NLU3RGUkQwMWZVdWdHOXdwbjdR?=
 =?utf-8?B?RU1YSjByODhuVEZub0ZuZUlROUVsZGU4cEQwSExITHB3RjE0Ri9rTlhmM1Er?=
 =?utf-8?B?eVlGMk8xT1hOc1FPNkg5V3cxZW1BNnFiOGdUcFNyNjA4NVhISVJiRG9ER2Vr?=
 =?utf-8?B?MlJGK2dpMjRqakc1ejltc0lFWHA2K0ZNU3llb0tJQ1pIL3NaQTgrZUlkTXFF?=
 =?utf-8?B?NVM0djRGK0FlWS9VcEJKdmlBc3FkSnd2MS9iUHBLVy9MVCtZcDlINFQ1TUxE?=
 =?utf-8?B?eW82eDlqRTY2U09aSTN3L3FyalR1QXV4VWhMejhLVmxTRHEzd1BFcURLcytt?=
 =?utf-8?B?eEw3dWJ1eWVHUHllRTgrVjI0blZlS1lSblRmck9Pd0FVNFR0cGVYa2oybmh2?=
 =?utf-8?B?YjRqbjllR0ZxQ2x6Q25IWU1oNjZSR3J6aStPVi9oMzBtckJ1SGFuMEsrUGVs?=
 =?utf-8?B?MGdhU1pYUXl6UGlZWmlHdDYvbFhBZDR0bVYyelNYUGVRYjlNM2pveDV2UW9C?=
 =?utf-8?B?aDRFV0xpY2RVT3hmaU03dnF0RHhDRThuQkZsSERQbytONmFuZ3ZnWGozbk8w?=
 =?utf-8?B?LzJMc2hrSHlrRmEycmxuVDJZUGNUdzczcVBpaVNLbWxUOHBSMW1Tdmo4d2M0?=
 =?utf-8?B?MUdMVWt3WndXQjNYRlJXdEt5cG1TY2pDYStHUENnYzFzcE50UGpabHpxcjA0?=
 =?utf-8?B?QnB3WDVGTkpyVUpNaXg5TFE5TnN6aUczMG1vWXNWQnk3K0MvY2dNTk1CMDJX?=
 =?utf-8?B?VFZlb0dVSm1GRExGekVyREg2OHlwQWVtZlhvVUd1U1NEN3dYYWlMRU1DdGVL?=
 =?utf-8?B?NCt1Vi9CNEY3VCtWaFNXK1ovYkZScUJER0NvWnczaTNWS0ZGNGNzRU1McVZn?=
 =?utf-8?B?b1JsbDNhbzBGdkwwSXBrMXppaG1qbTJlZFFBRUdRTVZ4ZVZxdkhROHdmc2pw?=
 =?utf-8?B?V3NUS3VLVmREUGtobzBVOS9ZcENic3NNVWNvU1BrTmxlRzRvRDZrN1crdVIx?=
 =?utf-8?Q?j8zp4bmui7fWlG+uyDi5utGNg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b33cae92-f5cd-452e-6190-08dcf32cd4e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 06:35:20.4613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQdgSUgTQ2tblZDWN94rLvYjCsDbUbncmrhdUooT0Bzu6OqDgMio53ibT5tsisN1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

Am 22.10.24 um 19:09 schrieb Li, Yunxiang (Teddy):
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> It sounds like it makes the most sense to ignore the BOs that have no placement or private placements then, it would simplify the code too.

Yeah, that works for me.

Regards,
Christian.

>
> Teddy

