Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0098CA080E8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 20:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B3010EF37;
	Thu,  9 Jan 2025 19:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EPw1mjNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEDA10EF37
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 19:55:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMqe8BqS8rQNmoJPOxn48feBnVweDLLSB2gJhwL3q0qG3/Ogstl/TVthO4Bjy+7zNH6OnPt8OXbQ8YfOXys0GY7F+S5isvW05yTj8AAvwi39WGWiuGW2Wrz+J3uS6yeJFqPYGzDJfe2JSJXDEEFN8e2E2nXZAlgO4J430HTTyVCutVI2sG7KPza8mR0FW5Ucf+gJmbsEidf0MarxmfSz2manmpE40PCCdduw/SDVlspE+prWbw2PlvKbQ419X1IYp3FlLau65RinQoTNBTLQWHD6Mw8NbC1nnpJvCB1C+SjUCO88q3gXDm1P7Wi9jt2HnUnT3FuKIwTZl2rPr3EKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cVZ1X37ZjmX4rckOn/3qLOCg0hY1KtN33LwNGYK4mc=;
 b=zQWqS42hT/YMkoHhG6T8Wz7SqLzGuYQvFZxrARPzze0LZbjVziG9PkEzmPOyPQwfHNgE54MZGvLhN/JJwl8zqSVF/vCf6GjLcW7d2q9fvRno+nS4xMMO97Fcg8e5v1E3CW7WMvxzxy782nmBumb+5/7ZdP3Hq8MnfeHEx1/qdzEXleH3Ddq91ADJTnQ4xe+tn8ED1gsaMMCfqNsGiAPoSf82kLoc8g5lNrk6iq1hIBBJUfvI5Q26BltxFLFyIxfA8smMruytb4xW/vsODoctB6Vy5RKStyLtp+/VpqwAWe9g3ZTKrv3DxXyVd5XR8XBTakEvlKUfSTtvsk5P/pgxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cVZ1X37ZjmX4rckOn/3qLOCg0hY1KtN33LwNGYK4mc=;
 b=EPw1mjNlt+UgfgmauSmgM1ZuwPaQd7W7NdkZvr2Z9tQHexlI/cQ/y3berSIdHSI4Lw2mZV1Jsw0yqu4nz2AP6p902hQbxtpc2MArG6UuDCU+usQ9Cb9WGyxAcK3/tPc8ULXVNkeG1eyT/0jJ6vtg2lVrQ427k4SbKkg3hN8rDkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5808.namprd12.prod.outlook.com (2603:10b6:510:1d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 19:55:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8335.012; Thu, 9 Jan 2025
 19:55:37 +0000
Message-ID: <d4b677c5-11c2-42ae-8eea-baf793006964@amd.com>
Date: Thu, 9 Jan 2025 13:55:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/amdxdna: Return error when setting clock failed
 for npu1
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20250109194811.499505-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250109194811.499505-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f20d401-28c7-42b5-3f70-08dd30e7960d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzhkRDBsYWM0M2I0MjIvY3BLb011UU1MdjBKenZXZW51aHFrWnYydU1lMjVl?=
 =?utf-8?B?bGRDQ3VMa0RTYXlXNkdrdTU0dkZvNDVZTGYxQmdieHZJY2I4a2wyWFlaK0Vn?=
 =?utf-8?B?WEpwa2oxdWVSSDQ4bmhOakJLSnE1ZDhTMGRLaDNvM3lSdjlJTHZWenFhalZO?=
 =?utf-8?B?dkovazV5M0hhNXNtek9WNXZFUG4vMGl0VEc3TmZvVnowRE44eEhLZXFvL0wy?=
 =?utf-8?B?TFVtaDlFRzlyUjFUWi9zUEJQMkJhT1VqK2V6WlhQTDhvYTk1TGZpTDNqY0dN?=
 =?utf-8?B?anlmZWxBbkQ4czJtd3NCSDIvQUtLOFB6ZlhycnpIaUxuZ094MFBXcEhaR2pk?=
 =?utf-8?B?SjNwVDlKMFB5bTJ1aDJKcUQ2cDk5V1h0eXdRWmdXalNwdG41cUw3Z28vSVQv?=
 =?utf-8?B?cjJLT0cxR2hVOVNuTThtRUtmVzlpZnQrLzA5L0NlQjV1djZYanJsMnVHYTBG?=
 =?utf-8?B?a3ppZ0pYN3JZUG5COGI2YjRZME9iUnNlL3M0NE5USjZqeTA0NFREemtuWDVo?=
 =?utf-8?B?S2I3dFU0bSsvOUREMW9kSEtnWnhPQ1FsclR5T1M3UGxuWitma2l4UUUrZ09L?=
 =?utf-8?B?SXJEc1NJRGs2ME0rOWFKcVEvNnlMenIxUnZwOC8xVVdhb3RKajkycmd3T0My?=
 =?utf-8?B?NHNHQ1lEL0w4M1IwMVl2WGh6ZWhiYTNRS2x3YWE3dGZCQTcxYXBtYW1YV2Nj?=
 =?utf-8?B?Rlc1aTU3Zmp0SjBBdEtvMVdsVU5ZOEw5QnlRZG1vSjJyNy9SLzlsTlJzay9Q?=
 =?utf-8?B?a2Rpa3ZLUk8xejkrYzNLamwrYm1JZkdoVDV1OE91VmVPR3RGNnpuYXltM25k?=
 =?utf-8?B?aXR4ZmhQUVM1a0xMeDFaSG01RkxnK3JRTCtVMGlZVmFkRFVaSDNtSGNaQUpC?=
 =?utf-8?B?d3I4T2FPemRaYzJBbVUxVnF2VUoxZWhMbXJlS254eWVtNTI1eGp4UkowTHow?=
 =?utf-8?B?ZUdpOHJYaSt2bTk5RDZoNGluN2lGZTlCTlpVM1FkZmhKMHN4NU9BZkpTTkdS?=
 =?utf-8?B?MFJZZXhvOU9iNGpIYkxYQm1TVXdjTm0rMDFtaFVMOHg3eHF5WmlkYWluc0ht?=
 =?utf-8?B?QnJ1ZFVKditCaGpkOHdGdGxaaVRUZ3ZNUnBqaHpBMWdtNGFzRFp3WURCblFQ?=
 =?utf-8?B?VzBEQXF4NFZaaFJrbEhSOXpGYXRQSlo2TTZBanV1VFAwM1JzeU8zaHdtTkdC?=
 =?utf-8?B?M0hYQUNVdlJzUU90QlplM2Y4TlpxeFZaNnBXWjV4MlJYV0lkd2NCMDFNT3dO?=
 =?utf-8?B?TS91aFJpdEhUNkpvTlF4SE9UM3J0cmFuUFUzQ3E0TVdOR00wM0psWG13cm9a?=
 =?utf-8?B?RUFHWTlGUUd3RW1PSGNaSWFFVTlza3dQdG96ZHk5TWxkVlRjc2RjM0VuRkly?=
 =?utf-8?B?WVdsb0hyZFErNTVsTlUzdmpxek1BUVRNUWFnYzRhSUU2NTRNMXpXYUZmUlRv?=
 =?utf-8?B?VHhPZWhXWFQxUXNGM1gxZERGVXBwTk02ZVNtd3AyaTlQbEl2NXR5c3hWbEx0?=
 =?utf-8?B?RXM1M0FXQkoyRkpIZVB0WTVKN0QrZU5Yd0RpejZQQUFGYUFMRXVwNnNoS2Rl?=
 =?utf-8?B?Vm9kS3FzYXRpMW1QTlA4Tm5DOElpZDQra0JRYmZrbjF3Yk50N1RvT1B2OVRa?=
 =?utf-8?B?Y3k1Sld0elpWQlJaTGpHY1B1NHAvT0pmOEx5ZVIwdVQ3dXNqR0l6TXpXOUhE?=
 =?utf-8?B?UVNta1BJSW4vUWE0WW13ajg5amh2ZlVBZEU5WE11Q3hERzkyTXpXcVNOSFZS?=
 =?utf-8?B?Ym05TmRGZ0ZnRmVzWUJmRWZXWllna0ZTSWNLTnQ5cFY1WWxhbWZmTVhEa1ZH?=
 =?utf-8?B?RmtMcDVWUXdVQUVmRUR3ZDA3WTM0VzZ3VDdkd004cWNsMnBTdnRPVk81TzNK?=
 =?utf-8?Q?HhosjOBSTohFL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0U5cFRUZ3NiZ2kxMGJKTjA4MVdWY3htTGJwQ011bEY4Z0hCVW54dnlGZ1VP?=
 =?utf-8?B?ajIrYmszYXpUK2RScStXazRzQ0dCaVJuL2VzdjcycW5tdEFwRTJxcHc4bUZL?=
 =?utf-8?B?OE55b25mQnUzOHhyYmFXVllFYzd5T1hUUURhVkc0MFpNdnlvZzgvZ29mblRl?=
 =?utf-8?B?dCt5R29mUVl6RVlHV0N3Q092Umk4SllQc3UzWmNHajZOTXVremlCdy85RTR5?=
 =?utf-8?B?N1YrbUNsWlFDN1N0aUh0eWRlYWMzTXdnVnc4c3VIb0swSmdVYW11ZFJzeGIw?=
 =?utf-8?B?RUFzU2g3S1RhdU13bWlnWVhrbXNVeUtCWlF0bnpzcVhHcVUyaFd3WVc5aElr?=
 =?utf-8?B?SkpNTkNITXdZWndUc0NPYVZPMFVDUkM2NFBrd1Y1RUp3Z0VKT1NLWEhrOVlO?=
 =?utf-8?B?YlFlSzcva3JXbWt2enNIMS90Qi9yLzJLSjlpNzhlZWhlZDVjY05PSWN3b3cz?=
 =?utf-8?B?MWlJbHo4WmQ3Q2tOUCtESDZjK1k2QkxKMksxcjgzSTJGbFNZSmRpc1BBM3BQ?=
 =?utf-8?B?QXE5bWUzNC90OGJBMUxVanNRRzk1Q1EwYkFoYnVqcTBHRVVpYnpiQ2grSnVO?=
 =?utf-8?B?WlhRU2x1dUFLRnFRTkNkZVpiSFpJdW9ZSlpNOEdlZWthU25HQktiKzFmdVVD?=
 =?utf-8?B?NTM5akNucHhiRTF1TjJUUmI3N2lWb3RDVTdMVU53aFh6MWlMd2FaNms3Q1RF?=
 =?utf-8?B?NzdIcmlObkhJZXB6TmhhaDZ3T2JrWWJyTSt4NnhVNStmTFV0N3BmQ09NMjk0?=
 =?utf-8?B?WDRFK2hCSWlqY3ZjSHhud0VGclErZHltNDZCOHBHN0JKTE4rNUVPaDdBODlY?=
 =?utf-8?B?dDNsa0lValdvbU53RFVDYi9qaWUrWUJScjFLWTJQWGh4ZUhwaWFuYW1aYzhI?=
 =?utf-8?B?eDNBNmJOVFpwMWZ0ZjhRUitCQXNZMk5KODg1cTFZckdtT1R5YzRYUTVTYy9O?=
 =?utf-8?B?ditCRGplNndBUncxNEdRdmpEeFR6cVh3d0hXejgxUFB1RS94cU54OEdFY3dr?=
 =?utf-8?B?N1ZkbE0yUHhUalAydWwwbU5uNnBNbG5EZXdNZXE4dTY4OHdLakVGZUNHS3Fp?=
 =?utf-8?B?c1Rsc0k4a0FnTXFrdVhNNlRFbm5aeFJkZG9KR3JFYXBabVhsbkNWUjM3T0pk?=
 =?utf-8?B?eDRkbTNjMVZLUzVwd0JpWFRjRkNMQnlGa1c4b1BmTXF3b0VpdGRjaVZXVURx?=
 =?utf-8?B?YlZ1TUNwVVdHUnVreWlOMWxCS1NYeTIxZXlvTmlWZEd2ZlFnYzNPbUlPS3pi?=
 =?utf-8?B?Q2xwWEIydHEyM212L0NPY3JRRDFsNkp1aE42a3hnMnJyRGQ5TVpJMTd2ZnRG?=
 =?utf-8?B?VEdEc0NkbHgzK0NOeEQ5NE9tbHd3QThkMW1maHkxRjk5aXlZeTlPVUtrY21q?=
 =?utf-8?B?R2JoOXRPZ05UMy8zbWRZNm8wVEZGWkVKcFE4VTdWZW9jbGwyV2FaK3ZRZnp1?=
 =?utf-8?B?QUVpa2tuRXBySlovWCtkaHRkT0IwZEJETHQ1d2tycThQWVR0bEx2cUVRa3hT?=
 =?utf-8?B?Y2NwY2hiS1B4RXJFZU9DL3ZWSi9SY2s5dzVTWWpFbU5VeE1JREtjbXdtRVRK?=
 =?utf-8?B?aEhpc2dXYis0L2FmRkdYeGVrN3hKWjBpUlNiazdFd29NWFYzZTFZUzNSeGZ5?=
 =?utf-8?B?WVQweXZubFdoaFQ1ak9jSmNRaGplMU0zNkVBVGRVV0h0U1pLY3FHL3pTd1hN?=
 =?utf-8?B?U0gyaEd3SUlXNmxnVXpTQ3NQY3MvQ2ZOMUEwVjVXU2NOTXJDN251UFRUS25U?=
 =?utf-8?B?bmM2V0V1K1JtMDFwWE5HS1dGZHVmam1tdEw3ZWlxY3MvZDd4UHJYQUo1MG0z?=
 =?utf-8?B?NUpmbVU0a3VhSW9GRFV2RUZXdlJGUldmNTdndTZyaUowMzczWnhNMjFiWXZJ?=
 =?utf-8?B?eWVnSTlRc01aNjZCMHprMnpYTEtlb2VkNldRaFUrR0Jid05qMHdEbjZmU2JS?=
 =?utf-8?B?cVBjdjdldW9oZFlydnV4dVQrUW1VVmNKNXJkdUh3OHNjRi9WK3M4d2tHL1ky?=
 =?utf-8?B?b21JanhHZjNnRGRrWC9GcXJhNm1NQnFWOWJWMWVHaGdqOVdQSXFOUXdUbzdR?=
 =?utf-8?B?ODNiRmtXdW1vODEwd0tRTHVLWWZNbWowM2U4dStSTEdvOVBMOHFvTWhHUC83?=
 =?utf-8?Q?y2JXwQ+BLJlhzQS2zpmq6DA3B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f20d401-28c7-42b5-3f70-08dd30e7960d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 19:55:37.0850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sj9r6I7flY9EJtAiDd3BmNcclMZ2v1+S9YYvCfbtGTmRpOH/tI5QpFHvXYgL7psiru7E+IOGdA9unXNj5iKi+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5808
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

On 1/9/2025 13:48, Lizhi Hou wrote:
> Due to miss returning error when setting clock, the smatch static
> checker reports warning:
>    drivers/accel/amdxdna/aie2_smu.c:68 npu1_set_dpm()
>    error: uninitialized symbol 'freq'.
> 
> Fixes: f4d7b8a6bc8c ("accel/amdxdna: Enhance power management settings")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/202267d0-882e-4593-b58d-be9274592f9b@stanley.mountain/
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

And pushed to drm-misc-next as:

0c2768bf81890 ("accel/amdxdna: Return error when setting clock failed 
for npu1")

> ---
>   drivers/accel/amdxdna/aie2_smu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
> index 73388443c676..d303701b0ded 100644
> --- a/drivers/accel/amdxdna/aie2_smu.c
> +++ b/drivers/accel/amdxdna/aie2_smu.c
> @@ -64,6 +64,7 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
>   			 ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);
> +		return ret;
>   	}
>   	ndev->npuclk_freq = freq;
>   
> @@ -72,6 +73,7 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
>   			 ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);
> +		return ret;
>   	}
>   	ndev->hclk_freq = freq;
>   	ndev->dpm_level = dpm_level;

