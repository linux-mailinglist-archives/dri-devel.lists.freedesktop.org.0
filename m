Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF5A96A7C2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 21:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7F010E2EF;
	Tue,  3 Sep 2024 19:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cY+268dJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EFA10E262;
 Tue,  3 Sep 2024 19:48:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIrRXnQQl6VCnJso+/exOzZDhT1ICq21iUwhrWl2diwtNzRTN7qZL+s/t7Krx4vNQIitY5lJ2M+xRPIwVw20iVn9C0p5fGdIpXchDjP3ybnAH1yr1Kt60aOoAn54avojzMWrwtUaJwOxx0iihHCXflA5PaEdvleilHm1zj8bnLN/dHo/8WMkXVr+EQPUwbbnsEyTf4nfSId8QivWRQBYX1nrNv9ClSQ9cSnLyi6TY5k7RK2LHXsccMN+zAOg9sN9YwtaIHL+LX31YzfWIO2VjYLdrfyOJbYJ/P/sqrgDZVo4sHLYJye/MeeUi/7GRje6FypOP6B5Haes20x0bKr3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8SvT33zo7I4AzdOVURxsxjoNjAXaobzKa9sjY/62t4=;
 b=VlSdscQfIIuw1YEVWvj/20mxVGHRuWjHGH4NyoQUBW7/kWG81ore59UGEivq95mLydHohZZ9jBw3LuRNd8KN6hKzgxE4x9uZGCyjYd786pzuI2aBFUb+gRHjTWzTENBLCL0QA2/qLIlU6TnMuRs2l9Xw9gcq7KXvpPg25sSaxTbNWFcKXGD8MpoTNNVqzgo3x3VMJGTZN91OQ/17RI8tKnxXAeUUn1GkxHV9tQt3W6ktx4K4cmtnAwrqCdo6wu1183M2LIfPoAtQ/QOJ3CqIxoyopatTCDdnXflrfztSEUg0UrfgoTOgmOWtskQOhCVFdBMgYEg+h0YK9fshViKi2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8SvT33zo7I4AzdOVURxsxjoNjAXaobzKa9sjY/62t4=;
 b=cY+268dJENtMcZJvu2dEA3+wnoyzwmNDYoM9s3ihKKtN/sXL7FSF/GHXJwCQk7NcXvk+l+pFJo09FdjZYYfimlXXSjzYTnQKNKs7DcVVqTfJfzPU32RHSA/xoXCdRKVEo8eoI8acR/r0ftbfof0rAH7TjxEc5Qo/AoCoTv/aVKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by MW4PR12MB5627.namprd12.prod.outlook.com (2603:10b6:303:16a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 19:48:29 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 19:48:29 +0000
Message-ID: <b81827b7-0ce4-477f-9de0-4b1daecfc951@amd.com>
Date: Tue, 3 Sep 2024 15:48:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amdgpu: drop redundant W=1 warnings from Makefile
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
References: <cover.1716471145.git.jani.nikula@intel.com>
 <c7dffe59c8abe6beaef70ea1f726a6598c9dad77.1716471145.git.jani.nikula@intel.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <c7dffe59c8abe6beaef70ea1f726a6598c9dad77.1716471145.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::37) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|MW4PR12MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: fca54c5c-42ad-4ab5-2b22-08dccc516211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzRPUEdXTUh1ME1Oc1ZmVFpjNWdNMllJZHNYbU1hQmhWczBqTFpHQm5CYUEv?=
 =?utf-8?B?RHJGUVluVzFzbFowejZZMzkzSlErcmpQVjcwcWlicUR3RmUrUUF4Y1AyK2hS?=
 =?utf-8?B?SnVSZlZ4YUpCM25TeWZDY25vdDVXcGtXSWNHSkhnZXNDZW85bXo4YVBiUE9V?=
 =?utf-8?B?eEVpd3lha2VLazBvQ2RPLzY1VEdGU3o2amN2L1ZpNys2eTRZUkp5YWkzTHF0?=
 =?utf-8?B?VnNzOFBhUWhJbnhseUxpSE5hWkM4bnVITzkzeE1RSE1WeDVjSDlWQjQ0OFUx?=
 =?utf-8?B?amRjRHZoVEFJeCt2WGoyRGt0bzBHUnZRRHY4eEJKOW1HdUo4ZVU5OWU3djdz?=
 =?utf-8?B?RTE0eWxOUjhESytXTytTb3Q2OXp4RjRGYVh0T3pmV2lKSWMrOXQ5KzJ5LzdB?=
 =?utf-8?B?a0QzMmU5Q1dpVVhZcW9xcDZCUnNKc3AzaFVCQ2ZJa1BNNlh2QTE3Skhtc2ZX?=
 =?utf-8?B?YVZtVVZZbmNmbGpqbkdsUEdDS3EzU1hDZTVxV3MrTkxYemROUzhkcGFpaERO?=
 =?utf-8?B?SmZEVFFaMmptalMrQUMxOVlCV1RtanZnZUF3REZrZzhQZ0VzZkJNK0pTN1lV?=
 =?utf-8?B?ZFpTMkFoODVCeDBvdGdrU21jSy9nQmJwYWtxVnQ3MmRLR1N3dEpCUEZROStu?=
 =?utf-8?B?RXgvd25GblFjZlBaWXVLdWplbVFWb1kvRjhvc242c2V6MGdEMVNlS3pLZGtV?=
 =?utf-8?B?TS9DamYvUC9DYWJxazd1eFRXVWU3djlMeldheHE0dkZGYnplbkNJZDBsNk9Z?=
 =?utf-8?B?VCtTV3orcm1BdHI5T0FPRU5vamhYbFMza0E3YzcveGhlM3dMbHlrM0cvMTdu?=
 =?utf-8?B?YXVmM29kUXNaVmtEekJCcGZXVjZZbmp1VEVxTFJUZ1JWVFlsdERuSlZXSVZS?=
 =?utf-8?B?dzh3VW84ejFORUFHNGdMNzhXby9xUlhWb3h2WVFteGdINHgzcEF3ZHBMYWxu?=
 =?utf-8?B?LzNlS1VLTjkxZWtHRkxWSi9GK2gxU2Vuejk0RXQzRFE5L2tXUVBOdmpuTHlP?=
 =?utf-8?B?ODRYZEFLNklNam1ETDZNVTZOWDJncURObkM4bXZzemFuQlBHNEp2UXlud3Jw?=
 =?utf-8?B?OXFxaENHSm4zaEw4KzRqRng0T1NVN2NSdkh5TkRCOXhxcUJzYUlObFRCTkl4?=
 =?utf-8?B?eG5ETFd3UU1kTlQ2cVBEVElhTVJXSWpXOUE2ak54WWNxcFlBallVL3lNUU5u?=
 =?utf-8?B?ajcwNlRManA4QXRuN2F3V0FDMVQzbHJONE9yTkxtK2FPaXlteWlXMFdiL2Zl?=
 =?utf-8?B?cHNLSFNnZkpPY1EwN2JPeGF0bEwyc0NRQ29zSzNyV3grNU1JMUpEOGozR0xy?=
 =?utf-8?B?TktNUHlmK2ZrM0loQWNsc29ETnVNcUtIRFNsNnBTUUZsSEp2SmZhTmo4cUFJ?=
 =?utf-8?B?T0svWHpQLzVFcjlJQXdXcHMwNXRsRzNDQW80RWIrWHRWVm04SE43RkZxLy9T?=
 =?utf-8?B?UVFNWFUrOEFIcDZObHJybVg2WUdLbGIvSmE4cVY5bFJzcGhsOE9UQktSZ2NP?=
 =?utf-8?B?K1E4WW9La1RJWmFVQXhPUEt2TjFIcWtwU2QvR0ZwRjhGOEthK0FRYThieXFT?=
 =?utf-8?B?OTB4SXFNTk0weTVLaWw4Qk8vNHBTc0VtK29DSGhSeXJTWi9LdjZjVXA1dndT?=
 =?utf-8?B?azlDUDlabk90eUhCbU9pQ1k5c1E3WlRHM05adEJFc3dDLzNJQVgvS3JBa1Ex?=
 =?utf-8?B?NE5jVjI3NjZiYkdhYTBpUjBkdm5oUlU3ZWl3RWNQVldYQXdJNUVuQUQzbGho?=
 =?utf-8?B?RmdZZ2djSHNsM3FCNUpKZHJBODlYeWsyTmcrZUlNTFpabzA5aFdxMW9uZ0JX?=
 =?utf-8?B?Q3ZUbGRoZS9MQUs4QUErZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkpiZ0xOUDFWVjdWS25UYnlnOGRnWHJ5T0hXR3ZzQ082cnlwV0NuTWdkTSts?=
 =?utf-8?B?SzVaRE5SR21ZaUVUV1RUSUFEaElZU1J3YkgrTzI1TVhUcjJSZ1Jqa0V0clBy?=
 =?utf-8?B?Tm15bGNQbTNYQXZTWVJNank3UHY2L2s1QjRxV1JnOStwNWY2dkpZR3RMemk0?=
 =?utf-8?B?empZWUZYZjFHeGRiU0hKN1BVS1ZWS1FaSk40S2FBNUVxY0F4M21YL015UER5?=
 =?utf-8?B?UklMTzVOcFUxYWpvOEZWeHdoTGUzZFhXbzgwcDNkNllKR1U3ZE5FS1VOZG0x?=
 =?utf-8?B?WFRIR0N6K2lscm1NcXZYYlpxbXRrU1RPNHdkdUdjQmF2bCtqMldsY0lSR2JI?=
 =?utf-8?B?UExpV3c4U0FjMWNMWHJLRlJTSnBoNmtWVWFWTWJzOHJBQWFtTG9ZUkdZUEJh?=
 =?utf-8?B?ZUhVSU43c05UTmx6VFRPT0tQM1o5MWhiOFhDR2tLS2pCckdQdmJCalY5enVs?=
 =?utf-8?B?OEt2dTNFUDZSTGJsVC83czFJVFpmQzJTWWNGaVRzMTB6U2xWdVNrRFpkRDZF?=
 =?utf-8?B?NGRPL2JZeHlicHRJMm8xdk56SFNHMnR6K1FwQW53OGNaZjAyNHNxNkRvVlJw?=
 =?utf-8?B?a1phd2JhQ0NTdDAvaWcyWjhCQ3ZSMlg0VEZyOWZ6VVZJVEhLaXY4NFp1STVO?=
 =?utf-8?B?VTF0eVFiWUVtd2Rab3NSNVNBYkh0cGdVVmdhbEFrVXdFQ251bWNqY01HaWFv?=
 =?utf-8?B?RUQvQTRzRlhFaUMvVDZjY2l0dkFRZlNkVm1mcndORmRJdDlQL281V3pKVTBF?=
 =?utf-8?B?WU5yNDJURC9JbEhlZ3RyZTErVi9MV0VVbkduTHQzRDM5WXNQUW5iWTJ0S0dZ?=
 =?utf-8?B?aGl3WXNGOEtzT3hSK0cvMzcwOW41U3dOU2pXUG9xb0l6ZlFSVXhOVEZVeHNx?=
 =?utf-8?B?R1dnK1d2SlVsRXlHcVJhWUp1UkdBTzNsWUYvUUNPMnhSZEhaUGNYWVVMOGI0?=
 =?utf-8?B?empQakVyZFB2SEp4ODZKMkRxSHF2RnprYVorZkNGUm1CQkR2MFpiZEZqS3NL?=
 =?utf-8?B?YU51M1JtM0RVdjZSY1grZnUrbVREZGZMbFNxaVc5cDY2dUdmV01NMUJLMFcz?=
 =?utf-8?B?S3VvVU1sY0ROUnJtRStRZWlyUUdDaHZpK2o4Z3NnL21iTG45Mkgxc0NUWFRR?=
 =?utf-8?B?WHNwS3JNTjAwUWFVMkFRdTFQZ3dtWHJGdEZOeHRjcEdTV3M5dVA3QWFJTnJN?=
 =?utf-8?B?dFAwTEdYRlIrNWNoUGpPdkljK1ltRGZrckJpMjRYc1FicW83cHpOMTIxUE5X?=
 =?utf-8?B?WGNlQlowNXJiVWVUb2hZZlZKS0N1aUFEMUFCQXpRenlPcVA2WHNRZVBSbjZw?=
 =?utf-8?B?aCtUU1U5elpBZ0s5M2FYL1RucnBaTWtMZU5TRER6endOd2F1QzU3NXlkNFdW?=
 =?utf-8?B?dFc4QytHSTF5SkJuVndGT3VTKzFWRTZMRjQ5SzUvY2xWcjBtMUk3ZGxXN3BY?=
 =?utf-8?B?WFB2RnhRYUx5NWQ5Q29RMEQvSkNZR1BLSGtrTkdXN2U0MmJpUUtnSzdmTlpM?=
 =?utf-8?B?Y2ovdnlzMzQyRG90eU5mb1dkNlBvRmwwaFl1MEhJVkh6NXd1QUNYaWNBb3Zj?=
 =?utf-8?B?LzVRcDdZUlNickxDTEtYVEV4SG8rOVBEL3JQcXBKNlZSNWM4NVFVTzVQbm1u?=
 =?utf-8?B?dSt0M0h2WlJvaDB2eWF6WHVxaTRGYnhwNHFxSXczaytzU0RuT0lmazMraU9S?=
 =?utf-8?B?NHI1V2t0UU1VT0JTMmJvczYwQmdveXJrMm4vOGZWaklJb2xYZzVxejZTN0hh?=
 =?utf-8?B?a0pNVmI5Ymk0ZFBObWloZS9MbnlrN3Q4ZkxUd3F2RGdKTzhJa0NHVHJORjVU?=
 =?utf-8?B?cnRSVHRMS3FCcU81cWY3UmVJdTZFaUIwekFVWFBBcVJ0bkZSOHFia2lnRVdK?=
 =?utf-8?B?U1RBNWNTQ0ZweW5aK1Ezc2c5MVN5VlNoSktVdDRiUzdyTzdDcnR1TzhMSHJ2?=
 =?utf-8?B?YW5NcktJZUxYRVNxcGJ3Q1dobURlcGlZb3QwQTFIa09iOGZta2dDMzQ3RElO?=
 =?utf-8?B?YnhWMWEyMk4rRUxwNkx0YnZHNWdrMUlLNGNUcjRHM3F3cS9WUFNMQVduNWJr?=
 =?utf-8?B?TW5TcVRyaTlvK1Z3ZEhQS1pjKzZidzZ3RFRIWVBPZFJxUUw1TGcwcEdSVURJ?=
 =?utf-8?Q?x0gopzlOiUWo3vUuWWMSeX5Z4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca54c5c-42ad-4ab5-2b22-08dccc516211
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 19:48:29.0861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zx76K5nQNYFJzVTja7ZscbPpCZvMWnYflibpX1MsoakeiWfcwd3J086CcM0eMWQzq4u1PfXm0v1xSQjxY1GKvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5627
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

On 5/23/24 09:37, Jani Nikula wrote:
> Since commit a61ddb4393ad ("drm: enable (most) W=1 warnings by default
> across the subsystem"), most of the extra warnings in the driver
> Makefile are redundant. Remove them.
> 
> Note that -Wmissing-declarations and -Wmissing-prototypes are always
> enabled by default in scripts/Makefile.extrawarn.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Sorry, it took me so long to get to this. But, I guess as they say,
better late than never.

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/amdgpu/Makefile | 18 +-----------------
>   1 file changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 1f6b56ec99f6..9508d0b5708e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -39,23 +39,7 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
>   	-I$(FULL_AMD_DISPLAY_PATH)/amdgpu_dm \
>   	-I$(FULL_AMD_PATH)/amdkfd
>   
> -subdir-ccflags-y := -Wextra
> -subdir-ccflags-y += -Wunused
> -subdir-ccflags-y += -Wmissing-prototypes
> -subdir-ccflags-y += -Wmissing-declarations
> -subdir-ccflags-y += -Wmissing-include-dirs
> -subdir-ccflags-y += -Wold-style-definition
> -subdir-ccflags-y += -Wmissing-format-attribute
> -# Need this to avoid recursive variable evaluation issues
> -cond-flags := $(call cc-option, -Wunused-but-set-variable) \
> -	$(call cc-option, -Wunused-const-variable) \
> -	$(call cc-option, -Wstringop-truncation) \
> -	$(call cc-option, -Wpacked-not-aligned)
> -subdir-ccflags-y += $(cond-flags)
> -subdir-ccflags-y += -Wno-unused-parameter
> -subdir-ccflags-y += -Wno-type-limits
> -subdir-ccflags-y += -Wno-sign-compare
> -subdir-ccflags-y += -Wno-missing-field-initializers
> +# Locally disable W=1 warnings enabled in drm subsystem Makefile
>   subdir-ccflags-y += -Wno-override-init
>   subdir-ccflags-$(CONFIG_DRM_AMDGPU_WERROR) += -Werror
>   
-- 
Hamza

