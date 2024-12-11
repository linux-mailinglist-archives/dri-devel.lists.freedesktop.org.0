Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A609EC0BE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 01:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E741710E08B;
	Wed, 11 Dec 2024 00:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JBi89TW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E428810E08B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:30:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSHnbGBgmgpjzkP2O6RCt8DloQALPI/PpiVyFYjRlr8avCEGIOnyGkIdBybYZBhn+ujTElAeAhQZINHTw8fnLnJBC6h4HQc8ECIszeUm9f5DnbPfJP8V20ARFQbXnjatBL7sYp1eVUJc3Bji6Xx6ciPD0JTSZinkO9YV9V6aZD6aEFFVjh3iwIj8PkRDbv94SJx+m/ORx6ftvubS1GjTR9TBK/h49TZtcJ34ikWYwe6o3X4IrRsQ//osq/0/qjSNvEzvc6ljmhlkZMbSNu0Vde3E8Mf6R63RJ3jQvknrRxSdvneqglPWuRozZNSqnT7u+b1uV7R8yTWSuoPAAO3Eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVAJfOBy8WWZZMlBHEnqxDKwHkL0lX9igDHHL4V5nDM=;
 b=UGcOaU4KyVYFo+g7CqhZMHWWZLNFSE94g34UhxGOWsy5Aj6H/SqYjYadmvNm1JfonxRihHbfqjWaRUMnqF8qUjiI4YaHtqbS1IdG6jbH1CUUoVdfc01Zdgl9fVAryLgjegWzHOGDwxbo6WtAcEoH3lka+zKuo32NyYmy9Z2RIT/qXCG5sGIxadfyZKSqr6XW3bXWTteIx/TFvIfuWOhM+sYQc51oSrQnpMLaszofOVUt5XLPyYhmwAfq4vn7ZltNQsb5orEYLxvKEYTXwR0+SenuPjC0oTyYW6KgQdkpHaSqOouET3vnk4nLNVOW6A/R01/jR9Vdri8Kb3WWDUNwpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVAJfOBy8WWZZMlBHEnqxDKwHkL0lX9igDHHL4V5nDM=;
 b=JBi89TW+tevG9gz9UXdePHlikZywA+yhgIIIic3HULbhfu1qIKzAxjo7neFtbhvI3yisP8itYsNuxQk0C5z8uuQPaotv3MM3skJ05yuF3fW9WL+wUTGWv6FWB/SGkV4dpn8vqf91TK164s5DWDU5PnZaH7kPoCcFi4p+TOlFBeI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 00:30:21 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 00:30:21 +0000
Message-ID: <760fa2c5-7de0-4f95-a8dd-966003a30d47@amd.com>
Date: Tue, 10 Dec 2024 18:30:18 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/8] accel/amdxdna: Add RyzenAI-npu6 support
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com, Xiaoming Ren <xiaoming.ren@amd.com>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
 <20241206220001.164049-4-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241206220001.164049-4-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e0611a-c112-4e05-510d-08dd197aff49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTI3YlpMaHZtd0piMzlLZHhRdTVoQXVPMlBXMHpSTjQvVW40L1NPYzRiUWVz?=
 =?utf-8?B?a21Eeko4QUptd0NMT05HWVpaSjJOS2lUUGY1bFNBWjNpcDhBK2NFZ3UzWWl1?=
 =?utf-8?B?QWRjdEtrWUFmcjI3dmlXajBGZTl0Z0R0eHdrQ2lkK2JyZ0h6a3oyeVI3OUpY?=
 =?utf-8?B?d1liN01xUjVtRzhZOXpBdUNTZjlrL0cxN3NQWUJSSy8vVENmdkFieWZqSkRB?=
 =?utf-8?B?KzJ3c1NORFI5dWlnOUdoNFk0Qml1ZVpITFVzL2REVkc1WjcxTys3RllPQVRz?=
 =?utf-8?B?UVoxenZaeHFuR2YybWZLR0tTTXMxb0l2cGJvWDVMc2ZsY2JteXFlZjdYNG5p?=
 =?utf-8?B?d3FSZFBhN0VtdnlIaWdSbkh3SFFXcmZXTWhlU1BXWnRKTzRqTTd5WGJaNzhw?=
 =?utf-8?B?T1cvV3dXdktQUzRKdWtWSUQxdFZ0YnBoSVFjRkFPNjc2K05VWnNWeVVxdndi?=
 =?utf-8?B?UlVPZ1pHNVNOY3UxRms0dVJOaEVCL3hRWEo4ODFuVVRrdndzTTZXdzJ5cGQ5?=
 =?utf-8?B?WExSZ3hXbUFBdzcyVE9XaWpyNjZsWm5QQ1J1NlQ3dGlkeG0vOWpBOGd1Nlpy?=
 =?utf-8?B?UmdNMEdzb3F0eWxFdlI3RkUyOFNXYXRhbFdhSGNlNGNrVlkvdVFIOFhhVks4?=
 =?utf-8?B?RWpoMS8xbFdSaHFVM3lPZE5wR1lBbHBtQlB5bGJuRUNVZzZGeGZlOEtkaXJE?=
 =?utf-8?B?bDM1UDM0Y1NOSkFNNWNMU0hQN29RRXp2Yi9WNTBhaWloeitLK2FhOWRYTDdz?=
 =?utf-8?B?NzFrTVpQTDBUM3VkMEt1R2tERGprZ0hmQTRvM3ZKWVBMVU1xbTF3dm5KRkRV?=
 =?utf-8?B?a2dkUjFjVFBUS2R6MzVNdnhhWEhLaDd1MG9jOTdMZ09adzJ0T09rWjU4c2xq?=
 =?utf-8?B?SW9aK2RFZFNmaGVYc1lVR2FQY3pZRFMxOXBIUGZGNXJxSzl6KzlRSWNrRWs2?=
 =?utf-8?B?MDBpTjJicUNuYmxQb1BVVUV4L0JHTFNhMCt4MVljZ3RYanNibk1rVS9rZEVl?=
 =?utf-8?B?TnphMTBTaG1qd09ncVpGK3U3QmxsbmdyVkVaTWJPVU5pZzZZMzJOd1RBcGNt?=
 =?utf-8?B?RUZqdk9WampONytWM0ZPNXlybGpZMldISU5kU1YvRzEwc0lsMWlEcGt3eFdZ?=
 =?utf-8?B?ZWhicEVUZGlJOHVYQUpic2ZORE1qL29hWGJIRU5MMW4vTU9qQmo2djN6S1Vt?=
 =?utf-8?B?TXVHMVpYUCs0b3Rhd1hOSExHRVlrQWVDR3k0U3hLTitQVERwZmJMRWVQQzlT?=
 =?utf-8?B?Z2tGVndybTgrSnRMR0RvWFhiQmRmcTI2WFY2Sm9TWEpnU29ob1NvRFlnUGZy?=
 =?utf-8?B?SjQxM1RuSFJpMGRGb3JiczBxWGxIQkM4UlpJRkFlUm15RmQ4bkRXRUhHbFNi?=
 =?utf-8?B?UlJNck9jcG44eGhqQzZkb2RkRHY2dlFTZXYraUxNZnorRzFDM0NBVzEwbHpM?=
 =?utf-8?B?QWRnOWRPelFxa0xac0JYUHgvMEdNaTNEQlhuc0hVdDhEbUZ6V3NuTEN0NUU5?=
 =?utf-8?B?ZHgyOEZaUURxMGd6Z203Q0xvVTlhNk9PUlVBZk94ZUtIQkwvVEVNYUtVaUE3?=
 =?utf-8?B?cU1XWkV4OTF0cmJocGR1OUNqbmFISG5QWXZ5WDkrYTZsV1NlVHhqMStObVZn?=
 =?utf-8?B?QkNJMUlRaE9CNE52RVlzYUdWNmh3d08vNG9IU1NEUEhQdWs5T3J3NEU2SERN?=
 =?utf-8?B?emdDa0djdzQrZXFwZ2ZDbUtzbWxQQXQ1RHZCZFhTSEJHczJYR1lkSVF6L09u?=
 =?utf-8?B?RWIxYlZHc2JDeUhwL2FxRlJZenRSWTN2TWEyVUFzenp3V24vRTBTWnJWNldX?=
 =?utf-8?B?R00rM0k2TE1JUFpPKzRKdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXhKKzlUckF1cFd3Yjc5bWJGTzdVVXJURE5PNjlLWVBEK3hOVWUydVBqY3N1?=
 =?utf-8?B?MHVCTW9UMWdJSXdnV2dqN2x4RnVydGhVUHFQR015UjZ5QlFzTER3dVZ0TmhG?=
 =?utf-8?B?NWphbXpkOSt0dHRWR2p4MWttbjVuR0IwazlpWFl1WXB2ZEdlK2hiMTdaQW1m?=
 =?utf-8?B?OFJYM1habjJDWWNFZmJBRFFPMy9UZzFMNDVSWTZuaWs0dVJYekp1Wk5QL2g0?=
 =?utf-8?B?RG1CdzJQK0NyL1pZOTZSb0JQbkFxU3BLamNLcVhqZ2ZFWk1sd0lZRVRpRUlr?=
 =?utf-8?B?MGF6d3dFMFFHdWU1RCtEemJ6SjhZYkdjeGRzSkZ3WGJ6VWZjVEF2RXZKbVFT?=
 =?utf-8?B?ajM0QUw2emtMVmxRVnloVFpYdUFSR2lZdzRMazE5QWNYaUtmOWNoc20vcDVX?=
 =?utf-8?B?aG9Sbk5scldBRlhnTE5ucnpHdGZiOU85MWhzakdnWE9aSkh5Kzd4WnJrdDRN?=
 =?utf-8?B?SEtXcWsrV0ZISE9ueGE3Q29YTWZpV3pydDA4NDJJQ0xWUXg5QXZjM1V6azN2?=
 =?utf-8?B?WGpnR1Y5R01TRW9SZFdGNnMzdWZ4RGFkb2lSM3pPMkZ0SFdhOS9TTGNYOEhj?=
 =?utf-8?B?WEdVZzU5WjlOYU9xRVdVME9aNjV2bkNxb0x5YVhYRm5Db2ZWMlV1QXErSDJn?=
 =?utf-8?B?ZGs1c1k4amdFdlRsRnNTZXMzMzduVS82eFNNWjBVTCtVbjJZaDl3eUp2bkRD?=
 =?utf-8?B?NXhCOUp3SEJob3MrVTRyR0xoMDJBWmR1c21HUkdUbStXQzByODhRZk1iMFQr?=
 =?utf-8?B?aHlsd2J1cERkOTh2L3g2c1FjMTNBa084WUVlVmR4czJjcDdyS0p0L2ZrWXRU?=
 =?utf-8?B?N2ozZzZhT1hEZDdVZmhYM1ZBcTRmS3lFMjBuTSs5UDNHbjBDd0FRNWNaT1BD?=
 =?utf-8?B?T2wwaVQwbklqNlZQRklOdnhmUXFxT0VaNjF5L1Y0aTM5bWFxTXZtYzlqKzRj?=
 =?utf-8?B?Y2FYWkRDRUZUOEpKZVdXU2JUejF4MHgwRFljaFhINkYzWGJNOUROU3N0Yk5Q?=
 =?utf-8?B?R2ZHTVhzbERFTzFNdi9uZ2swSDN0WVV0VkYvTTYwLzRDait1VXd2WTBVSHhG?=
 =?utf-8?B?NC9LMTVRTCtBbkhpUm8zQW9Gek1UZWR3U1RBNHJ2MkNhUWlVR3lYNzlFc1k0?=
 =?utf-8?B?U2ZrT244K2hDOHliaW1rVTlETzVTc0d5dmRCZm5KU2VyK3MzZ2haOG0xaEJx?=
 =?utf-8?B?YkRJTFBSZDhWaVpYVmkrSXFXbUdKQUdWYWpJVjZSaTJIeVYyd1FvTmRwV2JD?=
 =?utf-8?B?R2Y4ODlVS1BVQkVHWTNQYkZqLzN0NzdESE11WDRVbVQyenIyMnRKYWgzdE1z?=
 =?utf-8?B?N3JFSkVTV0h0VTdWMkZCVkkrOWcrc0VOendXaG9aNkZ0ZEhpREpMbHJFZG5O?=
 =?utf-8?B?UTVES3cwVGRRdS9qS25LdE96elpuTWU4T0xWdVJGWnRKQjJMQzExcy9aUlZT?=
 =?utf-8?B?QlJ0M0NzeHd6R3QxQjFrMUVUSlNXZzVpS0RybHpaQ00xN3Z1akNTTG9uUVJl?=
 =?utf-8?B?RXZ2dVpvOXRzZFNjZ0JRcHhlWkRadHU2bGlXN09RYVJnRGRLa2ZnOVpvcjZI?=
 =?utf-8?B?L2E4WWhSWno0UTF2L2VEck5XeEMxcFpaOW5oUEs1UWozRlVIYmVENURLa2V3?=
 =?utf-8?B?Zm5YamxjTUltLzJJdFJmSmxtNFFwZFVXalE3cjdscW1RMnhGMyt4d0IrSk1R?=
 =?utf-8?B?UUFSS0pkaUpmTkZ4MWdYL2M0K1dQVzVBdWdtaEVhU0M1MlRkSEtYVlBmbEVy?=
 =?utf-8?B?d1hEWU9PcEduYjFrZ0tIVGZ2R1o3UWQzVm9VTC9UaW9FSWRub1hMODdpaWV2?=
 =?utf-8?B?SE9FYUJWV0VOYzUzakpNckphWXRHY3FxaFB2Sm9mSHRNMm1yNmY0SUwwNWhF?=
 =?utf-8?B?ZkxOK2QraVhQN1k3YVdyOERZNWsveTVxajExcDZQaHkzMm1WdTdpVGtTYnEr?=
 =?utf-8?B?NkVILzdWLzdJOFhmWjdtQ1BROVZQcm1QRHV1M2lYQWlnUmRCVWRGT1Z0d3Bj?=
 =?utf-8?B?V1pjUGU1b3A0TUNYQ2xYMmFvUEFNaW9oaXJtWnQvQWw4SDk5YkZWenhYS3k5?=
 =?utf-8?B?TC96WVpveVRFT2xaRVo2Qk9ndXZrMzZCUE5BYkYzRitzMXpxNmxrRW1JVTBJ?=
 =?utf-8?Q?ZG00bxPil9/pMe/uK4KxZFBGL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e0611a-c112-4e05-510d-08dd197aff49
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 00:30:21.8028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XcpBXxb9vrWTC/C/Y/jJMYo/oCDgVjFjs+fPucKcrEBNqya1g3ik5NTTbHIB2hgt0mbSGbysRfO/WDx/RJ48Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6772
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

On 12/6/2024 15:59, Lizhi Hou wrote:
> Add NPU6 registers and other private configurations.
> 
> Co-developed-by: Xiaoming Ren <xiaoming.ren@amd.com>
> Signed-off-by: Xiaoming Ren <xiaoming.ren@amd.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/accel/amdxdna/Makefile    |   3 +-
>   drivers/accel/amdxdna/npu6_regs.c | 121 ++++++++++++++++++++++++++++++
>   2 files changed, 123 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/accel/amdxdna/npu6_regs.c
> 
> diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
> index ed6f87910880..6baf181298de 100644
> --- a/drivers/accel/amdxdna/Makefile
> +++ b/drivers/accel/amdxdna/Makefile
> @@ -17,5 +17,6 @@ amdxdna-y := \
>   	npu1_regs.o \
>   	npu2_regs.o \
>   	npu4_regs.o \
> -	npu5_regs.o
> +	npu5_regs.o \
> +	npu6_regs.o
>   obj-$(CONFIG_DRM_ACCEL_AMDXDNA) = amdxdna.o
> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
> new file mode 100644
> index 000000000000..d1168fc55533
> --- /dev/null
> +++ b/drivers/accel/amdxdna/npu6_regs.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> + */
> +
> +#include <drm/amdxdna_accel.h>
> +#include <drm/drm_device.h>
> +#include <drm/gpu_scheduler.h>
> +#include <linux/sizes.h>
> +
> +#include "aie2_pci.h"
> +#include "amdxdna_mailbox.h"
> +#include "amdxdna_pci_drv.h"
> +
> +/* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
> +#define MPNPU_PUB_SEC_INTR             0x3010060
> +#define MPNPU_PUB_PWRMGMT_INTR         0x3010064
> +#define MPNPU_PUB_SCRATCH0             0x301006C
> +#define MPNPU_PUB_SCRATCH1             0x3010070
> +#define MPNPU_PUB_SCRATCH2             0x3010074
> +#define MPNPU_PUB_SCRATCH3             0x3010078
> +#define MPNPU_PUB_SCRATCH4             0x301007C
> +#define MPNPU_PUB_SCRATCH5             0x3010080
> +#define MPNPU_PUB_SCRATCH6             0x3010084
> +#define MPNPU_PUB_SCRATCH7             0x3010088
> +#define MPNPU_PUB_SCRATCH8             0x301008C
> +#define MPNPU_PUB_SCRATCH9             0x3010090
> +#define MPNPU_PUB_SCRATCH10            0x3010094
> +#define MPNPU_PUB_SCRATCH11            0x3010098
> +#define MPNPU_PUB_SCRATCH12            0x301009C
> +#define MPNPU_PUB_SCRATCH13            0x30100A0
> +#define MPNPU_PUB_SCRATCH14            0x30100A4
> +#define MPNPU_PUB_SCRATCH15            0x30100A8
> +#define MP0_C2PMSG_73                  0x3810A24
> +#define MP0_C2PMSG_123                 0x3810AEC
> +
> +#define MP1_C2PMSG_0                   0x3B10900
> +#define MP1_C2PMSG_60                  0x3B109F0
> +#define MP1_C2PMSG_61                  0x3B109F4
> +
> +#define MPNPU_SRAM_X2I_MAILBOX_0       0x3600000
> +#define MPNPU_SRAM_X2I_MAILBOX_15      0x361E000
> +#define MPNPU_SRAM_X2I_MAILBOX_31      0x363E000
> +#define MPNPU_SRAM_I2X_MAILBOX_31      0x363F000
> +
> +#define MMNPU_APERTURE0_BASE           0x3000000
> +#define MMNPU_APERTURE1_BASE           0x3600000
> +#define MMNPU_APERTURE3_BASE           0x3810000
> +#define MMNPU_APERTURE4_BASE           0x3B10000
> +
> +/* PCIe BAR Index for NPU6 */
> +#define NPU6_REG_BAR_INDEX	0
> +#define NPU6_MBOX_BAR_INDEX	0
> +#define NPU6_PSP_BAR_INDEX	4
> +#define NPU6_SMU_BAR_INDEX	5
> +#define NPU6_SRAM_BAR_INDEX	2
> +/* Associated BARs and Apertures */
> +#define NPU6_REG_BAR_BASE	MMNPU_APERTURE0_BASE
> +#define NPU6_MBOX_BAR_BASE	MMNPU_APERTURE0_BASE
> +#define NPU6_PSP_BAR_BASE	MMNPU_APERTURE3_BASE
> +#define NPU6_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
> +#define NPU6_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
> +
> +#define NPU6_RT_CFG_TYPE_PDI_LOAD 5
> +#define NPU6_RT_CFG_TYPE_DEBUG_BO 10
> +
> +#define NPU6_RT_CFG_VAL_PDI_LOAD_MGMT 0
> +#define NPU6_RT_CFG_VAL_PDI_LOAD_APP 1
> +
> +#define NPU6_RT_CFG_VAL_DEBUG_BO_DEFAULT 0
> +#define NPU6_RT_CFG_VAL_DEBUG_BO_LARGE   1
> +
> +#define NPU6_MPNPUCLK_FREQ_MAX  1267
> +#define NPU6_HCLK_FREQ_MAX      1800
> +
> +const struct amdxdna_dev_priv npu6_dev_priv = {
> +	.fw_path        = "amdnpu/17f0_10/npu.sbin",
> +	.protocol_major = 0x6,
> +	.protocol_minor = 12,
> +	.rt_config	= {NPU6_RT_CFG_TYPE_PDI_LOAD, NPU6_RT_CFG_VAL_PDI_LOAD_APP},
> +	.col_align	= COL_ALIGN_NATURE,
> +	.mbox_dev_addr  = NPU6_MBOX_BAR_BASE,
> +	.mbox_size      = 0, /* Use BAR size */
> +	.sram_dev_addr  = NPU6_SRAM_BAR_BASE,
> +	.sram_offs      = {
> +		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
> +		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU6_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
> +	},
> +	.psp_regs_off   = {
> +		DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU6_PSP, MP0_C2PMSG_123),
> +		DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU6_REG, MPNPU_PUB_SCRATCH3),
> +		DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU6_REG, MPNPU_PUB_SCRATCH4),
> +		DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU6_REG, MPNPU_PUB_SCRATCH9),
> +		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU6_PSP, MP0_C2PMSG_73),
> +		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU6_PSP, MP0_C2PMSG_123),
> +		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU6_REG, MPNPU_PUB_SCRATCH3),
> +	},
> +	.smu_regs_off   = {
> +		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU6_SMU, MP1_C2PMSG_0),
> +		DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU6_SMU, MP1_C2PMSG_60),
> +		DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU6_SMU, MMNPU_APERTURE4_BASE),
> +		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU6_SMU, MP1_C2PMSG_61),
> +		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU6_SMU, MP1_C2PMSG_60),
> +	},
> +};
> +
> +const struct amdxdna_dev_info dev_npu6_info = {
> +	.reg_bar           = NPU6_REG_BAR_INDEX,
> +	.mbox_bar          = NPU6_MBOX_BAR_INDEX,
> +	.sram_bar          = NPU6_SRAM_BAR_INDEX,
> +	.psp_bar           = NPU6_PSP_BAR_INDEX,
> +	.smu_bar           = NPU6_SMU_BAR_INDEX,
> +	.first_col         = 0,
> +	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
> +	.dev_mem_base      = AIE2_DEVM_BASE,
> +	.dev_mem_size      = AIE2_DEVM_SIZE,
> +	.vbnv              = "RyzenAI-npu6",
> +	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
> +	.dev_priv          = &npu6_dev_priv,
> +	.ops               = &aie2_ops,
> +};

