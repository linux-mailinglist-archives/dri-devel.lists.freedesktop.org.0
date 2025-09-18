Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732F6B83EF1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 11:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F67810E002;
	Thu, 18 Sep 2025 09:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C/DAB/ch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012037.outbound.protection.outlook.com
 [40.93.195.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D707210E002;
 Thu, 18 Sep 2025 09:57:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8OkJYZ0Vl+WNYeTENU/p5sJa6PMCgCt7bzxts3+7xzFwukHAIiHBogTNiC8YLIbT9pTgskkauR5QTAZZy4o63ivTIU2IokcJG5mCiROPS51qXRXtjdArqkMijzEw0EoniQQxIYDmbqU4EVipc6rXCwYN15gnyde/euEvKm9q2GR3GMUWFUNH6efKdw6oDUXMwOirxMeuy3gi9Znida1Lj/oUNLm5bAa2EOtXvTrxb9axPrjAXlWehfT9cdkLnPGsDZW6iKvXVksauuZTKsZCs5TyXUonXZ5Ma7LnPhGryoiXc6zisDvHEmm670BZEwHNwcnNv3rofNB5B6E1sZYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb8Ro6KqL3PzYJu+n4FmQQnWzNmm9J5wCvSBI5djFNY=;
 b=iAiAcAszUOp+bWVonJnLHvnwL/C2zDYyp1+9yMIS4n4xLO0ChkqqI9qOF4o39u1Kz6efMu4ld7rdFoXXDuvAqf8ZYekkRyeCiQ9AYHV+2DyzXVWu/DgCLZjI1PJBU0YOgAQE5I+2Zu5rnlGdulBLN70PUwgrtpPQn8AiylZ7cMWoPDnpoM8m+h5SK2Tq/t8Eb5pJmvZdVLYavbzC+pYQ3twKhmZ/SrK5/8j5W80XnDL8N503Ws5CwsfXPhnIVAPx9gKx16VdRHYwSo2yQBDU3pcmn3hM7kSwUUweH4AeQa/lrGttzKSGC2q58SpU9AxgmrUDIbnqoD9tOm97w+5dIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb8Ro6KqL3PzYJu+n4FmQQnWzNmm9J5wCvSBI5djFNY=;
 b=C/DAB/chv6pBQnnvr1op+bqbYtd03mOUsbbkGVtGLRdLgRPCSvmn2JcDWzbGPNkwbZmW0yf7eZSnVnhSXYUaTYmUWtYUYiq2xSDOhDVn/Ha1/lxh91mfhFx0VrgIUqnbm1VMIbFC0J2cu28KnJcZKJaKZbR+WZBuy2C+Jc58uDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 09:57:27 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 09:57:27 +0000
Message-ID: <111d7bd7-57bb-4873-a62f-876128281572@amd.com>
Date: Thu, 18 Sep 2025 11:57:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/amdgpu/userq: Fix error codes in
 mes_userq_mqd_create()
To: Dan Carpenter <dan.carpenter@linaro.org>, Prike Liang <Prike.Liang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aMvVAsrczM9W2S7P@stanley.mountain>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aMvVAsrczM9W2S7P@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:208:23b::29) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|SA0PR12MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca5073c-0843-4a84-e9e9-08ddf699c62d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2hrU2QvNUVqWldrQVpQZEZzakJCblM2T2NkQUpQanoxdlZWcWJzK20xUjYr?=
 =?utf-8?B?b2tUeW1wS1dCQU5EbFQ0VlhQZUlVOHh4NURUa2dhMEhwODBnODgxM1k3c2E5?=
 =?utf-8?B?eWViOTNvV0VKallrb0J6KzhseDdveWpLVWVyOHlFT29CZzhoZXZ6Y2MweFlL?=
 =?utf-8?B?U0VwQnBWUDd1STlheGx4a3F3cnBodndFZ2V2SkM1a1ZNWjlCekxQQ0k0V1lr?=
 =?utf-8?B?aTgvdUhVZHNKUGJoT0lTeUJBT1cvditGcDBNZTMyWkp6MmxDUm9rZGlrOCtj?=
 =?utf-8?B?cE1pRHJWb2RJTFpWcFY0dDFyOVVTT0d2ZVNpa0pOS1UyTU1hR2JGRUNjWW5L?=
 =?utf-8?B?Qy9DbStkVUVBTWFYbWl2OE9KT3hLREQrSXhsNGd2VXdlRTREcnV2TktkUGRB?=
 =?utf-8?B?WWh0b3BxL0VGUTRVeXYzVEYwRVk2a3d2TTB0SUJRQlZwNG80amZ4WjErVDkx?=
 =?utf-8?B?eWlaNTB3WS9aZ3hCUXhGYzlZdmJ5VEkrVnpMZDZ6aE04REU2RjE4eHdUTUJ3?=
 =?utf-8?B?bEsyblZzT3dzTzdWS0d3VGFlVCs1ZnViWldZbmQzTUZIdGVvYnFoY2hKMkxp?=
 =?utf-8?B?UE1BUEtadXJvZTlKT3c2Um90Wm9YUGpXY0haMCt5eUJyTXVkV0tJeWc2VWVx?=
 =?utf-8?B?elNMQXlKTUJEaExhN2t0TVFtVFpOZmNDbUo4bWNkcFpkMHRJdld0SnU3dlZj?=
 =?utf-8?B?VHJpVWhYVkFKVWVDdEJ1ZkdFaklTaC9IK0FvSHVhN25WOW9VV29YKy96Nk92?=
 =?utf-8?B?Qk4rT0x3K3ZVODhpeS9CU1JWMHZYc3libk1QbTgzelE3WHczZ1Q5SDNVNDVE?=
 =?utf-8?B?aDRaWTRPbHE3Y1J6MFNSSzB3cHI1amZyNWlhbVR6UUdkaklLMEdjKzY1blRh?=
 =?utf-8?B?cVROZ2I5UTJLZTFKc0gwYmhxc255QzZxeEFQbGFYSmNTa2xFSG1CRkpCY0tr?=
 =?utf-8?B?RG9xK2dnRDkvanpmdkdhTXZacHFNcGMrWlo2VkZkY2FxYjNlT251N1BITm9v?=
 =?utf-8?B?aFpJVXJnUTFRclo4RE1vYW5vQmtkbElZdDEyR1ZGUXVKNE0rWmpQbWVuT2Y0?=
 =?utf-8?B?WTdNVS9mMXFMNUV3dDN3c0g1MU85Q3VjYWRFOXdPOVR6MUpoZWlmUUg4WlJr?=
 =?utf-8?B?clRvQ3pZK3VOSmtCZm51eGVoU0JKakhhd1ZvaUpXcTU3UjFOWFpDd3Nldmo5?=
 =?utf-8?B?a0ZobFpLdnhKd3U3Ti8rNjVSVHJWRnduQUNOOXRKS3dsRGRBNEozVHBtZWdx?=
 =?utf-8?B?V2R1SDkrV0NWNnJQakpKUERLSWMwVEs5cmhpSDlMa2VMcUsrU1VWbHphNEk1?=
 =?utf-8?B?WDd5R3E4VVY2bEhESFVyNUpNbUlrUkVtRUZaZjM0VWlheXBESnBPNUNmTHQ5?=
 =?utf-8?B?d2VvOCtObEQ4T05uK2Q2cUo0YWRmbHZWS1l6V1dBbVVsQVUyQ2wyOXZGcUtD?=
 =?utf-8?B?QlpvUTUxM3ZYdTNQZW5DT001VEZEbXExaG5HQU55V3AzZHQzR1F1LzRqUkJM?=
 =?utf-8?B?L3JOZFlyLzhxV0dueHByQWhjL3dXd0poN3g5TmdPckpMdFlsZ3Y0VEhkdGpY?=
 =?utf-8?B?aVRwcVJuUUhJcmJrTHNKYVpJblRpWnFLckhYc0k5QlhsSXhDUHk0eUxxeE5n?=
 =?utf-8?B?Z0pTc0ZLRW5xR0p6K2lvZWRVVTBsNW1JMHlZUkgxMGdWeEFaQmpOR0dHM1Jo?=
 =?utf-8?B?Y2RCeEJ3YjJsVkxmZmtReGpkQ3lwdWNLU0lHTGZoVVBnOE9qUXVMeG1Dcldj?=
 =?utf-8?B?aFMydDlqL1RaZDRYdmpQcFlPN0xjbzVMWG5UdUhOSEFlcXVocFZXREk1d0VI?=
 =?utf-8?B?WGQwTEIvN1JHdkZvVEpSRVJQZmZEWTJxOUl0TjVtUlByZnNpUVhoR3hTemJ5?=
 =?utf-8?B?ZlpINXVFbjlXL0xyYzREdzRyUmRaOWRMTkhJdG01U1RrZGo5MmNJZTVUMU8r?=
 =?utf-8?Q?PmjUDNfNIys=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFNkcW5qRHpqRW9WQ0pDVHltYkNjS1dRSDRnNU1pRXJ1MzJUVWZON3kxME5j?=
 =?utf-8?B?SGJCZ2sxekJEREVhTmFTSkt0YklMSG84OFNQSTBqY1RxdGF5ei9MUlVCVFox?=
 =?utf-8?B?dC95R3ZZU0VwSitIeXpQWHo0TTFHZm9aV3BZQjJDeFl2aHBBZ2ZXa3RBMUIx?=
 =?utf-8?B?aXNaT3BWM00wMlliT0dsVHJoZFZvQ1hUenJxU2UyaytIRzl2aTdCS2ZkWk5I?=
 =?utf-8?B?SG93TFlib2pkN0tiZ0tWcVR1aXdDME9Say8xMXJqN3kwQ2dqZ3o1NzhXSkhX?=
 =?utf-8?B?R001SDlyUHFvVkdyZHV5MFVOVXNldVVpOVl4bFpvTTlIdmdDbklEWitOL1ZR?=
 =?utf-8?B?UXBNRkNyaEFuaWFFWWNCMUZYSUt3OS9XdjRoMm5OQTExU2dwaytUYWZMUUlU?=
 =?utf-8?B?WlZJU1hpT01wYkZnK1I0M1Z6a1Noc1NuUm1ZUFJid1QyZ1dNVmpXbExidHVP?=
 =?utf-8?B?ZUhvcXFlSFFzbmFwa3BNUnE2WFpFbGtrUlBDalk0UVZiNnV5ZGR4cmxCSEdP?=
 =?utf-8?B?RGxaQkdmSEtkekltY1hKY3A3bThBV3ljb3JBNFNKKysybFRKbjlqNFBJVDI1?=
 =?utf-8?B?VmF4bmZ1bE1BR3Y5VmRTanpNbmE5ZVpiUjREZWVDSFVBb2QzM3JkSWpjQzRX?=
 =?utf-8?B?QytUbkhqUTdjRHExa1dTT1JRajZPYlFqWnR1OWdYNnBtWS9RS1NPMURaaWtu?=
 =?utf-8?B?cGVLbHFIN2FDbEZhSlorb3Zsd1JlZUN2NDh1NHJsT2lrVEhwOE9VWk94TlVn?=
 =?utf-8?B?S1B0QUpUYU1TUEZMWVIzZFFNd1F2UzVoNDdwMEQzR05ITDdXN3RuR29mdFNS?=
 =?utf-8?B?UHp0aUVMOHVCYU42V1lOOGVHbGdKZHhqVjRHNHprL2oyYk8wQzI4aTI5bUNY?=
 =?utf-8?B?eXpRcmRqZXRnZWtPQXZ3NkN6SE42b2U0dTZXUitRS0E2U2krRFN3YkR6QzVq?=
 =?utf-8?B?eUVRL3hNTGh6ZytDTm5lT2xZZEM3TTNlVXg4N2o5VjRYQTVveFlzZjhqN0dV?=
 =?utf-8?B?WlhpTzFNaXNBMWlLektMRFdyS2F5TkdTZDhiT00vbXYxblpsUTV3NythWW94?=
 =?utf-8?B?RDVpdEFCYS9ZSUNrQnpGcDFvbzhyM0xXaEFLbElJNkFuMlBVWkg0OGZYYTBW?=
 =?utf-8?B?RVc5TTluL3htS3RicWhRZXg0Tno2ZWdCN0VZRnNJVHlMd1ZBcEp4Vk9kc2Vj?=
 =?utf-8?B?T1ZFVktOaldtMFVNektmV0ZDNXh5Vmc2cUI1VmcrR3JJYUNibCtWWmZBb2F3?=
 =?utf-8?B?K3M4a2NuRGVQYmk2Y2RlNkRrTTUzRFUzalRWNzZwdElEZkN2c09GeWNFTnlp?=
 =?utf-8?B?VzFOV0ZhRlRqR3YrQ2tCazZqWGk3SXpEdWlsWXM3UVRtbUlmWjhWV01uQXBM?=
 =?utf-8?B?YjQxV1hBMUJoWEFSaUVCcU03TS9yZ1IvT01tMnpQakFvT1JVenZzdEtWdjVh?=
 =?utf-8?B?T1loOVQzNEZJNFIyMVd3WVJrQk9JMlNsUENiREYvRjY4bG5nWlozeWhUUlFx?=
 =?utf-8?B?U3QyYVVMVUpKLzMyVGlXNkpHcGRVa1N1RG5ocXYvVTlMaTVJaFFyMms3ZjhU?=
 =?utf-8?B?M0lyTWFsWm4vZzhvbGZPSTNoRnM4d2JPRVRYcmVIMlU1WUVOeExyM0JKNW5Z?=
 =?utf-8?B?QWVIbjljekg0UU5sSkRaVjRyMEFSa1N6S1MrR0pnYUhodXFBcWJBSmFjWmxu?=
 =?utf-8?B?UUgwRUJha0w0d04rZXd6UGdvbHlDTDhDaXRaenF1dytLdjh1aTRUZkk0VzBq?=
 =?utf-8?B?U09Ua1VPT0J3RWJWb29yS1k5clcrSG1XM0JoaWlvOFBJQmpFU280LytwcjNH?=
 =?utf-8?B?amtsWHRvQlhpOFRyVG45WkJkU0xCcUhpWmprZzBtNHB4YWpQeW9XRlFQMFlG?=
 =?utf-8?B?RlVYc3NGS2dvRElMaTJ3OUx0Nzc5QStpbXEzNlY4dzZ6SEs3aGpKQ0loTFpt?=
 =?utf-8?B?WFdaTUVTQnd0b2ZoVnNwUzdncEFTRkh2WDdjYzFIaW0yWTkrOTRDcFMwZXhI?=
 =?utf-8?B?OGxXTXNwV1U1R2h5d2FDR09wWnRBdVZhODN5NkJSZ3FhOXNBNGJhRXEyRmQ0?=
 =?utf-8?B?Rk5GZGVXUTRTMis0QVVJRlF2b2J0U0pWSnprOHo1aEo3dDdzWGliSW1aKzA4?=
 =?utf-8?Q?zMNoa2seR9aVN5xJjDWEjPCBt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca5073c-0843-4a84-e9e9-08ddf699c62d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 09:57:27.5467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PT8Z5t8Wko03O04KYg0Kc+thzk19Po31GL2OAQcVdHadJybDd7fXrKhTKDebqsM9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448
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



On 18.09.25 11:46, Dan Carpenter wrote:
> Return the error code if amdgpu_userq_input_va_validate() fails.  Don't
> return success.
> 
> Fixes: 9e46b8bb0539 ("drm/amdgpu: validate userq buffer virtual address and size")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/mes_userqueue.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
> index 2db9b2c63693..775b0bd5d6c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
> @@ -298,8 +298,9 @@ static int mes_userq_mqd_create(struct amdgpu_userq_mgr *uq_mgr,
>  			goto free_mqd;
>  		}
>  
> -		if (amdgpu_userq_input_va_validate(queue->vm, compute_mqd->eop_va,
> -		    max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE)))
> +		r = amdgpu_userq_input_va_validate(queue->vm, compute_mqd->eop_va,
> +		    max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE));

That code is nonsense to begin with, AMDGPU_GPU_PAGE_SIZE is always <= PAGE_SIZE or otherwise the whole driver stack doesn't work.

We should probably drop the max_t() as well.

Regards,
Christian.

> +		if (r)
>  			goto free_mqd;
>  
>  		userq_props->eop_gpu_addr = compute_mqd->eop_va;
> @@ -330,8 +331,9 @@ static int mes_userq_mqd_create(struct amdgpu_userq_mgr *uq_mgr,
>  		userq_props->tmz_queue =
>  			mqd_user->flags & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
>  
> -		if (amdgpu_userq_input_va_validate(queue->vm, mqd_gfx_v11->shadow_va,
> -		    shadow_info.shadow_size))
> +		r = amdgpu_userq_input_va_validate(queue->vm, mqd_gfx_v11->shadow_va,
> +		    shadow_info.shadow_size);
> +		if (r)
>  			goto free_mqd;
>  
>  		kfree(mqd_gfx_v11);
> @@ -351,8 +353,9 @@ static int mes_userq_mqd_create(struct amdgpu_userq_mgr *uq_mgr,
>  			goto free_mqd;
>  		}
>  
> -		if (amdgpu_userq_input_va_validate(queue->vm, mqd_sdma_v11->csa_va,
> -		    shadow_info.csa_size))
> +		r = amdgpu_userq_input_va_validate(queue->vm, mqd_sdma_v11->csa_va,
> +		    shadow_info.csa_size);
> +		if (r)
>  			goto free_mqd;
>  
>  		userq_props->csa_addr = mqd_sdma_v11->csa_va;

