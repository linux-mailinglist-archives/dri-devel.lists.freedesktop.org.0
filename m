Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30197B371D7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 19:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359F4888D9;
	Tue, 26 Aug 2025 17:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qTVNqvlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159FA10E6B2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 17:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qa2gJeQGG9YRd2nhNKft1oljx84+CKu8rcs5/diDVz77qCxInxWyBNSH1PUUj9M77bCdfdz1JUV65aKUcFc4Q4zbv/rovgxT/jrJQHpPaR7mOMfGKgONZoz+rRWx1GgGYZLA9lxjETqkYAYXWxXtSpbQUj2L4C1W81LSGaydk4W96jUgVjFXSOKcPohJ6pM1JeZoRtxT8988VQzXh39wfCpmwrYCd/4t5PodXfHrYD1uRTGPRF8R9IV/NTa760B9ms6eXHgSuvCPSkWDh9AdwTDVt/SMa+E4tHQ4HFPe7Fv+57bnH0fc8jfoVcMNEU/GWiEUAl4fgngliUkE1+IoKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cn8Krq8EBHwiJ7wYTi4doFBMy5cQ8DTQ0PMrOwgVFSQ=;
 b=AgdG3jmsghn9yZu6no7OD8dUTmJJ+fPOggYFyxRwRp9d5d0CC774HW4tiFyj68HlkI2Wed3yinZNhJBxWCiIa71uiiA7rS1Z88gDQ0N949kUP1wAEqO1CLcc4v3K+J+fEvFj45boq1bHNN42klGx2yKEzlrV8hhAp4vpPs8vUh2S8qq2O/PHEvZpX2MMR2d4oIY/mCtytzI+K96Jz/+wsOpeOdVyLS5v6QVkZ1Egy97yxM9C7IJyAl4eEYvUkTfkjbZmxU5h5vQFPuGLFkU+Pdkr6B24Lb3NxEU/OzxDz8B95PtQSycV0Q33vD2IOk3b9P5PgRmGvv78UzxPfWJCpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cn8Krq8EBHwiJ7wYTi4doFBMy5cQ8DTQ0PMrOwgVFSQ=;
 b=qTVNqvlIzVxmrY8obSp8QK8FKNM/8aYqo4yk4Eyak3aikXyXBPwazacn3IurALqNxsdsROr4UztdHAsuPFoLWROOBltX1pDRLiFjY9w7WCg7pyMWDmexYLlA9eIZegEFpzDnhcGpUBEXYFiAOZbBjrYb9sVLaobnHfUec8AsGzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6712.namprd12.prod.outlook.com (2603:10b6:a03:44e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 26 Aug
 2025 17:58:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Tue, 26 Aug 2025
 17:58:29 +0000
Message-ID: <b758a72f-e30e-42f9-a6aa-6f6297b8cce3@amd.com>
Date: Tue, 26 Aug 2025 12:58:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20250822172319.377848-1-lizhi.hou@amd.com>
 <2bec1429-4f8c-472c-99a1-420a33a3d316@amd.com>
 <d6a02baa-3b05-73e6-9c2a-66c257efecc3@amd.com>
 <a9814644-96e3-456f-90b7-8705a102c938@amd.com>
 <2a21100b-2078-a166-0b47-9db6b4446b5a@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <2a21100b-2078-a166-0b47-9db6b4446b5a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:5:337::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 55723792-dd05-400b-a025-08dde4ca29a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnlHaUFEMEoyOXlXYTRIQUt1dnNUQ2lYSGdVamdZTDY1WjJ1a2lKbTFZWHYy?=
 =?utf-8?B?UC9tZDdGNGVqTWtabXJuMEV4NzV1bE45QmdWZWtQTEVLdUtKclJoejVJdHZn?=
 =?utf-8?B?ZHdSaDNXYlViT3ZialMrbnMzS1NXUGh6emhTdTJ2aFNEcDM2c1ArMDZ0UnRn?=
 =?utf-8?B?WEw5L1pNZHBkOXJZYVl3bWlwMllxbWxFN3NrT2doUTVteDFoalRBUC9XNndi?=
 =?utf-8?B?ai9UY25CaWdLaDREdzZXTWJFVmRSOGJ5S2xUc05iUFlwbTE5MHh6TE9kWTF1?=
 =?utf-8?B?U3lyMUoveTlYekxVS0NWcVNCV3VTa28yUjFkbCtnYWhnbU5Gc0xpTlBrMEM3?=
 =?utf-8?B?OVljOU8xbE1RSk1aeStoYU53VWRnelF3MVNzL3FmL0cyM0ROVHArUm5qVW0w?=
 =?utf-8?B?ZnhDNURXbHFWWHNOcWpIME9yRk9heitDZk9Tc0JCNHRtMDAwL2lRcEk4Y0hm?=
 =?utf-8?B?Rk9ZOE1mbXo2K3lWTHFkT1FNckRIS0V6ODlpQ0JiTnpDdlp6dUYwQVpwMUI4?=
 =?utf-8?B?WUVwVTc3ODRLNDNZeUZKYWkxc2VkR3lFdkwyZlFsZ2NrOW1oVVJQbEN1emkr?=
 =?utf-8?B?d3VUQnM0eEE5bHdtZ3pmTEJCcm92dXlKNGhCQk0wb054eExZY2VVNFBxclBG?=
 =?utf-8?B?aEJLWDZiSDRQTjcvdXpOQUx2eDZlK0FCUWNaQnpweExmdzNUMUxUTEdIdE1y?=
 =?utf-8?B?RnZ4QUNsNm9CY2d3R2wrQjN6WGZNR2lPN2k2amdOQi9HbEhBVkcyMjNNaHN1?=
 =?utf-8?B?U1VWV3krc05HNGlIcTRBc0tlQkdzemZUUUR3dnlxVjdSck5oa01PZ0s3WkhV?=
 =?utf-8?B?ZkNFdEQxZzB4UG5vUWwvY2I1MzdUcFNVK2d6LzdQbjhZRlNTRTBYWmpvYUZP?=
 =?utf-8?B?RHgyeG9IR2JxazdtcEZCcG9RSDB5VWdMQ0VLV0MxMER3YjRFbXRWUEhtZ0xY?=
 =?utf-8?B?anRVdm9GVkRLQ1FNSlFRZmR5YWZwR3BUb29taWZLLzc4T2h5ZFB1RkhVV2sr?=
 =?utf-8?B?ei9hK1pXejVQTVMzVUdLU3d0OTR3UzJFNHFtSmsvLysrajJ5VGhVRDN1OFA4?=
 =?utf-8?B?SEM1N1ByZ1UxbUFnbWhxc1BqNVdPVHRYRzZSWHQ1V3JRbnNzcUg3OHIzZmZQ?=
 =?utf-8?B?QjlFekpSVVFiYTZLdEkyanU0TU1ZbFZsVllYWDhwcVRGOUpWNndxTDVEaE9K?=
 =?utf-8?B?SlFCckpabEIyME5ieXQ5OUhJdEpPOUdXNXdnL0hGZVo0QXFIK0EyZjJjYzRD?=
 =?utf-8?B?OCtZSUZXUWd2d2NwRUNZVXJNZHpiRlhEeDkrcUo5eEVaVW01VjZ2UWFSVkE1?=
 =?utf-8?B?OWtEZW1OYVNtUWIxYVlyaStlWmxKTUpYaG16N3dFOGptdWthekdaaFlEc1p5?=
 =?utf-8?B?cTVnNDlCUHNsakMwVmI4Tm5wTTN3d1kvRlhCNS9kVk92T2tmVkg1YzFVVUl2?=
 =?utf-8?B?U3BFcWo5dERsejlIcjZwS3NwYzJoQ3hMQm9vRXNvUjg1cUYwd0hXNSs5S3dr?=
 =?utf-8?B?OThmVEQ2Q2hIa0wzUEZUWTk0cURhYklRRE1pVUk1L0RqeW9YejBkWmpHSlV0?=
 =?utf-8?B?YWpJS0NldWwyRnk1ZDcyYk5xampOTm5uVEZwcHB3RmVacWN2OTlPMUxXR2Nk?=
 =?utf-8?B?eFkxeUx3SmFpNEdZcERiRitpK1MrVFFocG1ZZDRIR0gyUkhjV0dXaG1iOHF4?=
 =?utf-8?B?MHFKSmx5MXA1Snh6YWJYdm4xSStHVFdsMUxYRzFYM3NuWTQ2b0NCbXJFc3hN?=
 =?utf-8?B?eStGbjM0anY3SU4weUx2NEd3Y1NONUdHVTJ5TXdFeCtVNytkaStPcGt2SWV5?=
 =?utf-8?B?WUFlam1ERUJuN0wxYnVWWWROc1dqb0lVSFZUL1FETmhqVExCVklFYVNQVlB3?=
 =?utf-8?B?SVNWSlRJNnJWa1RqZU4vUkVkVlNwUDdobUZ3TUI2Mk9zckxsYjRpVy93OUc3?=
 =?utf-8?Q?NTwRDWC5IgU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGdJcXBXRW0xdWlLWEJXVVBweDVvR3pyMzhsaW5BSGV1aFY2Q09pTitrVlNz?=
 =?utf-8?B?dlBlWmRhY0REM3c2UEpvcHoyL25Yc29GZVhWakFwUjlaSjdhZUtMcnNPb0hO?=
 =?utf-8?B?Z0xsSGIwZnRkY3lmY0ZKTGNzVnRNUTBCazNqaWRrd3BYR1BCUjNlem5KRTVh?=
 =?utf-8?B?emI5Y3lhMmpPclJiSFR1ZVJKdEw2cUxCSm5wNjZQZTg5RUhzdzBFRFMyRmJs?=
 =?utf-8?B?aHJkbU5yeHYwYi9zQXRqcEhTY05TNURYb2JvUGs2Vm1iczNzYy9ZVWlkVmZS?=
 =?utf-8?B?SlI0ZUVTVGVFcTNMTlBkbytneXpIQmFFdUNQUlJteERodThjTHFZeWdkOGt4?=
 =?utf-8?B?TFcrb2ZsYnJTSTkzd05xSDE4TXNMWnhNQ1BETVpNTzc0dWI4akhKbFlEbjVE?=
 =?utf-8?B?d2FOT3U4MVcvWlhGNU9CVU9XaTJaYjVZWXVZM1VabENtNkgvSHFuWDRhcGxX?=
 =?utf-8?B?NkpKQ2hOUWFlTWpySytZczArb2lCMExLZFdoMVEyTDlrUWpiT1pzWEVWeVVB?=
 =?utf-8?B?QmNvQkxlYmxkeHExSE5aekdzRzZiVnFWbldBeGxSeldkK045cjloeUVtcndq?=
 =?utf-8?B?RjZTdUZMU0VBQnlUdGdHUG9xa3ZPT3NKT3hWYTBvdXlQMys3bG1xSTdiWVZ3?=
 =?utf-8?B?RU9OUHVlSENrZCtpdjliUWlpbTZvbjQxYnlnZDN4aUJydENLTTdRK0JwOUZG?=
 =?utf-8?B?MFV0WFAybVpjREdUZkxHZjM3TE5hR0tIbUpsNFJCdHlyU1ArdHUra2kyVkhq?=
 =?utf-8?B?ZU5VWlhaeXVCbm1LM2piSTRzQUwrYnFHZjBVQjdIQnFmcXdkMXlLMTdESHJl?=
 =?utf-8?B?N29tT2Q3VlhVeWE3RmY4V3E4aDdoVFcwc0RjTEpGLzJveDBaTlJnYWdnUnp1?=
 =?utf-8?B?WFJQQ0psdXJVdlJPaHpoVkJiWWdyOGF0c1VyL0F0T090VlFmSjRQQk5udWVZ?=
 =?utf-8?B?WURuRFhpTXJ6cm1jSDlYcXpIWG80ZGFReFgzK0luVzAxUnBpWk9qRDY0K0Vl?=
 =?utf-8?B?UGZnZHozaGhKUW05Q1NNa1pXdktJRHhlSHFWZFF1YWlJZnNtYlRoMmlSSHBW?=
 =?utf-8?B?RlkvR0FhUGRMY2tJZm5OakdibUhRMUNVZUQwbXp1RFRSUXFaU3hrZldjSHBG?=
 =?utf-8?B?UGZnVG44MWtISXp0RjE5SnMyWks2eGMxaUtFNmhkL21nZG5NUlpsWERHbzkz?=
 =?utf-8?B?R2dtamFoVWt0YU1iR2RRcVdLZGVsVDhWaFZWV3QyVWc5b09IZTZpOGU3Rlhm?=
 =?utf-8?B?UXk2MTZFMHpaeVB2Wm53U05iYm90OGxWSG1RckVFOUJnZ1BaZUxpVVFZSVNn?=
 =?utf-8?B?cklteGY3MFd2Sm5MN3JuYkYvSHNOd0piRHBqY29scTR1VWJMQjcyMy9ieGNs?=
 =?utf-8?B?RkFISy9Yc2lzUlFrNFg0YXd2ZXZPd3ZyTWE0ZHQxUWYvRmc0SFEyZ3lWVTA3?=
 =?utf-8?B?eEFKR3hZS2UwVDAxYWV5aWttNTFxRlBCRkp4TTdGaFJuaUU2eVI4d00yODN2?=
 =?utf-8?B?aFBvTC9sN3NjVVhHdFFMSGxZOE4zY2FER3FJdE53SlZjUG96anRwa0dyVWtY?=
 =?utf-8?B?eFkzVzFmeWgzZEZ3UzVXRC83Q09MTlB1emZmQ01GUzlmQnllQ3FBTUtiV2h1?=
 =?utf-8?B?SXNEUXRGWG8vQkx6Ry9BSzI0R2VKWHk4dTJOL29lSG51OFRhUjE3RFZNL0xx?=
 =?utf-8?B?SFVZVStXbS9WRkxjS0xMNmpQckN1OWthMy9XTi9KYURKYkFHYmxvVVFXRGhI?=
 =?utf-8?B?S2s2NWM2SllKTU1ITmFsZy9uZlZhODlBa2xXcjB3WHo4SGNOQ2RlV2VmOFVU?=
 =?utf-8?B?cm9NR2hXcDMxSmtXVGRYT3UvTVNOemtrd2hKWmZpUUNML1FsT3FpTm9zQm54?=
 =?utf-8?B?eVMyWU1NbTVMSis0cDR2aFdWc0pBbExFUXphTjlzN3NVRmdNaFREbXVPYTJw?=
 =?utf-8?B?dW1DVDFJU2xHWGFoZFNJcGZNZEQyUWZsNS85WXhDck1OZ3BSV0pIRHNoN3Za?=
 =?utf-8?B?N3NZSGlNRjVaek9PbTkyNVJUTjVtZFBwdmxPTTMzMHM4aER6THdDSDFLQ2Yy?=
 =?utf-8?B?eTlaUnNveFFwL1NIKzhIWTljSjIyNnVpeGY4OGtKSVZCaHBXRlp3bVF6YjUx?=
 =?utf-8?Q?4x4hsSvSVyH2G5P7/+Wrxp1qn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55723792-dd05-400b-a025-08dde4ca29a6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 17:58:29.1579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2g7AOLQ5L8x74XwvZvqMWnVlud0HJ6Fa6c0cE/8wp6cKfKr6P2a1px8c7tXfx274OnLaLjIRtse5P4uMyTh9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6712
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

On 8/26/2025 12:55 PM, Lizhi Hou wrote:
> 
> On 8/26/25 10:18, Mario Limonciello wrote:
>> On 8/25/2025 11:48 PM, Lizhi Hou wrote:
>>>
>>> On 8/25/25 14:28, Mario Limonciello wrote:
>>>> On 8/22/2025 12:23 PM, Lizhi Hou wrote:
>>>>> Add interface for applications to get information array. The 
>>>>> application
>>>>> provides a buffer pointer along with information type, maximum 
>>>>> number of
>>>>> entries and maximum size of each entry. The buffer may also contain 
>>>>> match
>>>>> conditions based on the information type. After the ioctl 
>>>>> completes, the
>>>>> actual number of entries and entry size are returned.
>>>>>
>>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>
>>>> How does userspace discover whether or not the new IOCTL call is 
>>>> supported?  Just a test call?
>>> The kernel header version will be used to determine whether the 
>>> application which uses new IOCTL will be compiled or not.
>>>
>>
>> But it's not actually an application compile time decision, it's a 
>> runtime decision.  IE I can compile an application with the headers on 
>> kernel 6.18 that has this, but if I try to run it on 6.15 it's going 
>> to barf.
>>
>> To some extent that comes with the territory, but I'm wondering if a 
>> better solution going forward would be for there to be a dedicated 
>> version command that you bump.
> 
> For in-tree driver, I did not aware a common way for this other than 
> checking the kernel version.
> 
> And here is qaic patch of adding a new IOCTL.
> 
> https://github.com/torvalds/linux/ 
> commit/217b812364d360e1933d8485f063400e5dda7d66
> 
> 
> I know there is major, minor, patchlevel in struct drm_driver. And I 
> think that is not required for in-tree driver.
> 
> Please let me know if I missed anything.
> 
> Thanks,

Right; so bump up one of those so that userspace can check it.  Maybe 
"minor"?
