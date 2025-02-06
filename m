Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313C5A2AAAE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 15:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1931710E85A;
	Thu,  6 Feb 2025 14:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="beafDzF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A90610E859;
 Thu,  6 Feb 2025 14:04:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUaUqjUx4IANDfymUOTWrhF2J5XK+AokOWtGcg1XO5rQt/9q5GEjpgAG4VmdOnINg53UjWGP6oNWsDK8HEoJzKCewirLZKebcnpQHO15thwVfBTvJ9kGEMcBbLPriF8LeR1oibfvXL6gOND7Djnb2mY9bp7so4ptiC8KOA9kUJZPjlj+2Nrzp0nKbnwpoorwlKhZUGk/1ea89dQeAxWV0K+dHHZYKZ2dTIntgr4tnU4Xut4aKXXj7PZKAsQt9za+AvpgwhhfJiC9BZoRP2/S43uWt8TvrW/IMPahOYE3CDudIaUd8y5rTrd9zNKKGUomXCjtPDUMBLj5UO1NA0mKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2qv+rrgXmsPryvS2ob/5BtQVGtOkFj2kCGlgxQOw48=;
 b=yirdXMA2Leo+R0Yb/Jp6vn0w6jRPaQjC1dZ3/5wlS2zXpbmPmmBlj0dvtmQXWNbcj1XLGR2R5ciccqbn0RX80mzMjDKLV/HP1B5YzTDTHWsTNAyhGI3JsDqb+4yDdsVmyM28L69m/4ScXKx1Wahqjn2YgXtwnOrPto9OUvrSwIJnwOhypbovgeY/B803xDeJaqSLd+EveHcCJqpojFugfJEN1W/mO9AzDllAIlVlOlsSSs8/9jZflnL+QtVK8BWMqsq7zIsRBeZ7NMS51KH85gQhn8USx2VNI4J2OpZGxH3GIuoSaVDqIodzTOaFqhcY5UKrKwHIwVb6ntSAb8j4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2qv+rrgXmsPryvS2ob/5BtQVGtOkFj2kCGlgxQOw48=;
 b=beafDzF8788CtkSLkXKnpTTm44FggTHNBgDnk+Ftq13j0gqyXyEK3Obmu6II7c/fhvb3TE3TNJoXZqfr1dWzlgv46e9xOI9eI7abkHw6N8lTxOlckLt0754T7rfiSE7Z4u8siFLoI9o0Ea4iczoVHctpHdCiOOTv539uxJBvs1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 14:04:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 14:04:43 +0000
Message-ID: <b5711d1b-07e0-40fc-9ad4-984e80fff3e5@amd.com>
Date: Thu, 6 Feb 2025 15:04:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/7] drm/ttm: Use fault-injection to test error paths
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20250130101325.3068-1-thomas.hellstrom@linux.intel.com>
 <20250130101325.3068-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250130101325.3068-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: efcb6867-5d72-48c6-173c-08dd46b7347d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0M1VmtLYm01NS9lQTgzc25VRjByTnBkM0JuZWhNTEJwajI2ZDI3MEduWDZh?=
 =?utf-8?B?QlZGRE1hV1UzNzA5clh3azVtWndvN0xJWUxtSTR1a2Q1UDJCQks5ZHNYNmFS?=
 =?utf-8?B?UkloUEswdk5YWXB1bGQxYjlWQ0xPdFBaQWhPVlBFdEtMeFhsVXNuOWZaWXFW?=
 =?utf-8?B?dXI2RzNGejFienpMSzJDUVlHNGh1QVVlOXI1b0RIald0dXZuM3JkQXdxMnM5?=
 =?utf-8?B?QjNvcDZNY0NMeDRxYU5TbEduRkhOT3pqMDFLclcxUHE0Y2FCTmJNUDVMbWlK?=
 =?utf-8?B?ZkNwcXkrRjBoNWVrbkZ5Wk04R0Fqdm5JRWRDWk9CRU9NaDY5aHVGQklvcFNC?=
 =?utf-8?B?U2syUEF6VnpSd214ZGRWOS9ycEZ5bmFtVk4rZE11RDVVaklqZld3cU5uaWls?=
 =?utf-8?B?STlIZHhSMG1jTmg4eHRVUkp5ZHk4YTZ6L1V6bktnZG5LTHhVZk94bUhUbVk0?=
 =?utf-8?B?KzVPTk1uY3B5TlQzZW1FY1hWSEJaNHVlaG12YjRWYVhkRlpZVWNPOVpwK2Fp?=
 =?utf-8?B?ZGpkQnEwM0dmYUVYMmJxbXJjMU91UThJSkU5UEN3akMrY3h6d0x4Q3R0SVNI?=
 =?utf-8?B?ekNtQ2lWaVlyMFNWYWZrVjdOS2VpTGIyZ3U3VmpxSGQvZXB0T2VrKy83N3dF?=
 =?utf-8?B?dldlTDlMUVdxUUk1RjlxV2JZdWExeGlucWJibHVBM3dlc3FyUjhxM0wxREJu?=
 =?utf-8?B?ZkR4Ny9TTHBtMlV0QXllcHJLck84TUhJU3NWZHZkZlBKNWJQNG1yWTdlVHFr?=
 =?utf-8?B?cGFDaEZBbitOQ0ZEMEpJMXBBK0dKRGxXNlZwRkU1RjBNdENRcXY4ZmZabTVV?=
 =?utf-8?B?c2NDendRVHBOY0h5N2NaWDJjZXczN1BTMTM3NEhjNk1hdzZVRzdiekpnODJE?=
 =?utf-8?B?YTQxSGcreW1DbE5uL3QwUWdzUEUwTTZlNGlHSHJaaU04enNYeDlZK0k4RGlq?=
 =?utf-8?B?MXM3WFoxNWkydUdXdFFzcGRocUk2NlhxZm9uR2RabDV5ekpXbjB3TGJWenZD?=
 =?utf-8?B?eTFEMmE2MnZWUlpYUjVQWTFLUi84SEhuc3c4WGhISHNlVHhSMkRqc1VjSTNm?=
 =?utf-8?B?NWJOYld2aWhJMzR5RytHSXFVYkJYTG9rL0gvRHJqc1hnNFhnWjVCQy84N040?=
 =?utf-8?B?WnoySENJWTRINWhySzlraFUrL0lNZi8yTzFWN1RzUzBQcVpZRzFXY05EUU9M?=
 =?utf-8?B?dTlOL24rbnhGa1pqeStBODl5YjJub1l3RU9CK0UrL0FFMHFOVkVMNnkyQmpX?=
 =?utf-8?B?bEZIaytQanFPV0Y3Q2hPYVFhWmo2WVhBTVhNS0tscklmVjJpOEhQSWFiN3h1?=
 =?utf-8?B?SnRMRFlnR01uQlJCOXV5RnVWaE5yck1YSGlYNmhxZFJIUUlycldlK09QQmJI?=
 =?utf-8?B?K1JuRjMzdUV0OEFCS2NmSExOc1RMT3c0c1oxM21HbjJqTzcxaDBiZGpMMUlz?=
 =?utf-8?B?dnVjdkhMbXZBdjNCUlFGY1hLU1g3OE5sV3hGcEt6bWpXSFlFaXBNT2lERDNs?=
 =?utf-8?B?U1NITEVoMUxhUi9xNWhXQ2NPWmdhZ1dzOUVWVTBQYzhQdEY0aE5iNVEzSVZM?=
 =?utf-8?B?OSsvdWdPbVlYSDZRVzRISitBcjVvc0Q0Q09UclhUMjVvOENwQ1NkSmNNc2ky?=
 =?utf-8?B?SXI3UGVGTkRNQzAyaE9MOEk1cWlDTURjS0RtU3YwRVh6WXJGaDJraktPRVpH?=
 =?utf-8?B?L1p0ZUh4VDlmR3BzRDBTTG8xU1FMcllNOG1iTUg3VkxYQ0RtN1ZrYmI5RVBD?=
 =?utf-8?B?WDRMYm9jd3dUTnMxT0FUWHA5UG9LcmEyNWlPbGdtRGNKRTVNWU51czlVOEJi?=
 =?utf-8?B?bVB5SEJ6NG9xb2pjaXlaMTdvejI0STJYSFVPRWNYN0I1L3hUbG43SldqNlFu?=
 =?utf-8?Q?TGC1+rB1MbjWo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anpXc1BoV3Y4WFl1aVd4RldNQ2taRjVnYnVxOFhGRGxMRFhwVm9OWGhsWlZj?=
 =?utf-8?B?ZFp0UzhNTWpiMVhabVZsOUFMZjlCVVk5YWxrRG84YjJYWGJ6eExwWmdlM2Zn?=
 =?utf-8?B?b3AzalBPamFDa0h3aGNGTXdDbC9WRFhTRkpkUEhOWHlZS2JlaE51dHRBYlBT?=
 =?utf-8?B?T2FrcGxLOTQ4Vlp5NGd3VkMrQ3VsOVFWeWlHMGZJV1llY3FYSXRuRGdKbXA0?=
 =?utf-8?B?T2VOc3MxKzZZcnhJU21sSU1HY0RxQ3B6VHZUVVMyekt3cndiQi9QaXFvQi80?=
 =?utf-8?B?Y0FFVEN5UXRqSWJIWjM5R3Q0QVUza2tHTnFtM3N3YTVMdW9CTHI0ZFVqMDdP?=
 =?utf-8?B?NGVvTTVxalY4TDdObHIrd0g4Rk4vOFp1V1JSL1V5aDRSdWtFZEF2Nk9XcDY4?=
 =?utf-8?B?UVpvVjZoM2htbDJ6S0d3RHhld3VKcm0vOHF2dnlObDdOTkdGR0lRMVNXdEpt?=
 =?utf-8?B?eUZoOGxkSlRGL0N6RU5JWDlEWitnZFptRXpWT3R0SlpTNVVtM2JyNmRLUUo4?=
 =?utf-8?B?RUNlNmV2Wk03Yitzd0RnQVVkR3NSUmpNdFFKYldTWHNTUC95ZHpjMEdQRFBR?=
 =?utf-8?B?S1E2dzRIVUkzQ1pSSVdTVWpGa1NVYU1sb29kVE1ZR0ZkWTVVd2RBalpxOGRu?=
 =?utf-8?B?eXpTaVU4V3doMnJNekNQR29kMWQvVFo1ejczK0R5emt3aE8rL0s0em05ZTZs?=
 =?utf-8?B?TEs1bkQ1YWhKK3paSGl3eFdLYTZWY2gwcmFjbnlRelZqbnNMVDdXbkp5dXFD?=
 =?utf-8?B?K00zRjdlbWt2VHdDU2s1V3gxNURlRDNsVGFhUDR2RTBOVktZTFVUMFlOWGM3?=
 =?utf-8?B?Q0o0MUhyakRlTVo2OXF2RWdoVkMzclRLRGdoOHN1dFh0N3QxRmFXRHp6WWph?=
 =?utf-8?B?amNmL2pLeWYzQXloVXhLVzc0aVQ2MTVqSFprdlEwY3VDL09xTlpESERRZTZ0?=
 =?utf-8?B?ZlRFeU5xSTZaZ1VpdTZRZkhLeUVveHFjeWZxT1RnckNMdXJkQ1BreElwYlVi?=
 =?utf-8?B?eTY2UGpwekloTGJVbEdBOVNLZ2JVdDZ4ZGo4MTlYczNJdFUwRnlWbHhnSnVj?=
 =?utf-8?B?WjRJcVV3RXhqZDUvR3oyRHJoeTA5QnhoazVWM3lYTitOWktmZWIrbnhlRUZn?=
 =?utf-8?B?eWVkYWJSVU9lcGpFRW1BRE55djBwSmgwbmZCeTBoWDZFdlpORU1mMTVWVTRz?=
 =?utf-8?B?d1dzK2pad1BqcTZOL2FRdUxhRWlVN1lveFNGaGRwUVhiUlBYOGZkSVdNdW82?=
 =?utf-8?B?Ukw2cGkxWE4yRG5wcHhCbzU3OVI5dWN1dWZNTkFvQlg3OC9CZzFhTVpZZS81?=
 =?utf-8?B?TThrV1dmYzV6dFZRMDlpK09pRTdQcGUzZHdHUXlQeCtzbHJiNk5vWUpiMHc0?=
 =?utf-8?B?dGIyY0FMUUJNdWVjcURiNjRSS05rZ1EvcTU5ZysvWkJ4bTBSV0NlTUpxRTZP?=
 =?utf-8?B?MjZENlBZQ013SGxiT1BOZEtUbE9Ia09RSE1NK3p5cEkyMVk0UXphcWlxR09E?=
 =?utf-8?B?aDFTbnliSmZIa2VmcmdxVEJ3L3lyenlFeU1INE8weHZaNkxzOHg4bUFiaDV6?=
 =?utf-8?B?a3k4TjR4OVNSTXQ2dGdLTzV2VWI5S20xQkZ2cGJGUjlaZnlYSittVjNPSzZU?=
 =?utf-8?B?NXhJcDZMWkJXMTlTZTBLRDVhRTN2VXdEQW93bnNTWEtSd1I4VWJ4dXYxT0Fw?=
 =?utf-8?B?V0haQzR2VFlUYS94OUt4eUoyZm9lems5MVdKTm00MjN3eXdROTNDRElNUEhD?=
 =?utf-8?B?S3E0MVpLYWZLVmZJQm9EMjk1Z3hTZlh4TlkrUEpQT0VEWmlYdWVpdnI1RHo3?=
 =?utf-8?B?N0N6RjBzN0RPaWl3T0c0MU5yR1drd3hUTlRGV3R2clhmanFxV1hXSXp4N0Zm?=
 =?utf-8?B?OW1KS3BZcENMTW8wK21GY3ZJMjhPQkROQ2tHdW1kOVBZeTlRdkhqK3hGZDlk?=
 =?utf-8?B?SCs4RkJrTnR3cGlSN3BZMTZyTHBGSEdsazRtUVlNMkZ0MHVIaWN3eVdleWcx?=
 =?utf-8?B?L1FJT1hyWHpRbkRDb0pIcldQZ04rVnRZYkQrWjFCWlBlMkFIMGNJSm94NktY?=
 =?utf-8?B?ZlRxWEp5MnJLZ0dhcXV1cStxMlU1YUdTZmtXRHh4T2RERURxL2hsejF2UHhZ?=
 =?utf-8?Q?T5ud4r6DxeBttvhD4YOO5vaWF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efcb6867-5d72-48c6-173c-08dd46b7347d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:04:43.3863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAvLLHhqN/WtK53cWu0jPGVEw+sQEBSO0KD4xFBv5vZY4Fe7H1Sz2ljVgPWdkJFJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884
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

Am 30.01.25 um 11:13 schrieb Thomas Hellström:
> Use fault-injection to test partial TTM swapout and interrupted swapin.
> Return -EINTR for swapin to test the callers ability to handle and
> restart the swapin, and on swapout perform a partial swapout to test that
> the swapin and release_shrunken functionality.
>
> v8:
> - Use the core fault-injection system.
> v9:
> - Fix compliation failure for !CONFIG_FAULT_INJECTION
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v7

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index ffb7abf52bab..83b10706ba89 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -48,6 +48,13 @@
>   
>   #include "ttm_module.h"
>   
> +#ifdef CONFIG_FAULT_INJECTION
> +#include <linux/fault-inject.h>
> +static DECLARE_FAULT_ATTR(backup_fault_inject);
> +#else
> +#define should_fail(...) false
> +#endif
> +
>   /**
>    * struct ttm_pool_dma - Helper object for coherent DMA mappings
>    *
> @@ -514,6 +521,12 @@ static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
>   		if (ttm_backup_page_ptr_is_handle(p)) {
>   			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
>   
> +			if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
> +			    should_fail(&backup_fault_inject, 1)) {
> +				ret = -EINTR;
> +				break;
> +			}
> +
>   			if (handle == 0) {
>   				restore->restored_pages++;
>   				continue;
> @@ -1007,7 +1020,13 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>   
>   	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
>   
> -	for (i = 0; i < tt->num_pages; ++i) {
> +	num_pages = tt->num_pages;
> +
> +	/* Pretend doing fault injection by shrinking only half of the pages. */
> +	if (IS_ENABLED(CONFIG_FAULT_INJECTION) && should_fail(&backup_fault_inject, 1))
> +		num_pages = DIV_ROUND_UP(num_pages, 2);
> +
> +	for (i = 0; i < num_pages; ++i) {
>   		s64 shandle;
>   
>   		page = tt->pages[i];
> @@ -1293,6 +1312,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>   			    &ttm_pool_debugfs_globals_fops);
>   	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
>   			    &ttm_pool_debugfs_shrink_fops);
> +#ifdef CONFIG_FAULT_INJECTION
> +	fault_create_debugfs_attr("backup_fault_inject", ttm_debugfs_root,
> +				  &backup_fault_inject);
> +#endif
>   #endif
>   
>   	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");

