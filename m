Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPA/KBFemGmOHAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 14:13:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A151A167B29
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 14:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E55210E08F;
	Fri, 20 Feb 2026 13:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yrNG11hH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012015.outbound.protection.outlook.com
 [40.107.200.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D03310E08F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 13:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUpq7scB6Gcr0Lpb2fniXfeOrsHmIPP9A5CLAWhhbff5SwJ0M8NDZ/kqNnE9phUJnzOW08xJWVr8wg+KSaLM3tZG05a2/CLXRx1R7kaI4D3z4bkqiWDRvBfKmxdFDsKidxgBTrGHpKW/9fB1rskKtLjYJCD7oJAJV2cvihCUVZhXuG1+xHTtqqj/5TvvqCHSJVrHf6i3FtVkaWwrrWyn73my+OxFhVu4z9/lBg/StffeX1xVH4I9eDnSa+nJOPOjSjvd+YIgNb9e0Mc/boFhB341IGb5y4WXIha/JFIljc2QTDDzbsX/AhKwmzEyD2SBTCCPxzJ+0j/Uu3P5R7ktyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edgoo9o43mLB1LK/CTO1VndJcMiYMFSA9epA+ltPwv0=;
 b=qPRuM+vvkuaxShUWqfcuVsN8+Xtj9eSAq3Vr4nM7kl7XXg4lA7EbS3UMnB7sOw2267ZY5eJV9KKkCls7MhXxmf7vFRPtkDPMPttgzDgmndJiP1wmA5PfU2cIgGXvRRQmiRoV6+IpxVt/ytXsBwtEqVwJCbGzKR8j9CTdGy3NDJMv2Z5RvI64gotIHHpKd3BliIV0PFbAzsr8VnyliLbGnnwqVJI/M9DEy6PkKYXtJ28KR3UawlfUs5aQHNKhi1XtqSOS1uWKxcvIenvhdHmGMt9GbGSRyrNVNWPocI1NJPKb7h7ggeOclD6AMWcCSV6wjl32uVsyl8+vp0QiKwK+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edgoo9o43mLB1LK/CTO1VndJcMiYMFSA9epA+ltPwv0=;
 b=yrNG11hH+lu3Eftqh8m31PjgCRxiPFw55E2F6fO/2OOVHzKS5QIOHRDFdi4+GaSQx7FiQ2Y2EmuBK3h5ho0gSySaOTa9iXYQ5uXPbV80YB5f1YaZgHAB7vHaGPi7qXHIwuHRnHOcnbUczQZIsWyF+fYXxQYOEu2jpZ9UDEbign0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9264.namprd12.prod.outlook.com (2603:10b6:408:1e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 13:13:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 13:13:44 +0000
Message-ID: <d27ae98b-b401-4110-b233-a8da2dd3de05@amd.com>
Date: Fri, 20 Feb 2026 14:13:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] drm/syncobj: Add flag
 DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
To: Yicong Hui <yiconghui@gmail.com>, michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20260220022631.2205037-1-yiconghui@gmail.com>
 <20260220022631.2205037-2-yiconghui@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260220022631.2205037-2-yiconghui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:408:f8::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f37e08-0300-4520-b794-08de7081dfdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGFFVm9LWVQyVXJaczBBQUw3Qng4b25EMC8rVnlzU2tGbVJudDdqK1NHV25x?=
 =?utf-8?B?U1V5bjB3dStuZHRyNjd3K0UxWVludmtLMGtqczNUSmVSQlloaVlIV2FVVytO?=
 =?utf-8?B?OEw5dmE3NG4yVExKZW9USk1IOGhXaTFDcFhqY2xycEEya042aDRzT1hORXVu?=
 =?utf-8?B?aUswcXZCbnhtYUw0TmUybEpqY08rUFRZMmtsY0NWMWJPa3ZYdE53UlpGbXdU?=
 =?utf-8?B?d1JmbDVTNldHR0xOWGhPQkhGQk83UXM1cndyWnZWdnBLN0d3a0Vza2VTU0JM?=
 =?utf-8?B?bE9OdEVnOS84akwzK3hVRkhPaXIzL3ZjTUZGaGF4S2ZBYUFEelZYWlBYTS9v?=
 =?utf-8?B?OW5xallEelZhallKQ3Zmb2JUZmNVVnlnaWV6d1lycVU2bFQxY1N3MlpIZ3BT?=
 =?utf-8?B?SHdxWUpXdkUwWVNWYW54YmcwdmRrekYzc0s3OW1WZGtkOVdNdW1JcnVJVUZj?=
 =?utf-8?B?WXh1bjIxRjUrc2dNQ0Z5QTJ0YlRLZ2tlSyszTTV5Ylp2eS9CZzlOMWJTeHJ6?=
 =?utf-8?B?STFjV1RESzVPQ2dnMk5VTkIyVHBtZk9hSGJRVFdFNEtlSDIyaUliQ2dwRWov?=
 =?utf-8?B?c0V6dnJZT0VrTHNxUU11UFpXVFB1SkdITVQ1c0xkTnZ3NWYxTlUzL0o3dFRz?=
 =?utf-8?B?cUxJZGcydnpFZU1kMFZFNnphblZjVFhncEdWTUlZOGJVb1ZWeFRsRlNaUDlS?=
 =?utf-8?B?dkRkeVlQM3F5bzdkbGFmcnJ5MEliSytPQkhzS2sxZ0xNcmxyRmIwekdLbmwy?=
 =?utf-8?B?WHJoVG1aZ2JLdlBGMTR3QkQ3MkNGUkZaRDM3bHQxNmFRRVhhOUp5YUtMZGdm?=
 =?utf-8?B?ZUwwbm53dkVuWjRVV3E4cWdoM2cwOFVaZENTbnpkalpVcUNwdW5wTndGbFFs?=
 =?utf-8?B?MDZHZCtZb2NRWno4OHBTRW51QnpwNU9XSGNaRW96QnEvanJyWEd4VDJBemRC?=
 =?utf-8?B?R0pDRzdNdG8yc05DaTdJNmYxZUd3bllva3JuQ3dsMDYwZTZZWlRyRUxLdElR?=
 =?utf-8?B?NEZCLzgyVUUyTm5TcG5vMkM2Sk5lYVhsUGpVWTZrZXZIMXFEVW1GOUx3d3Qv?=
 =?utf-8?B?ZlA3YlN0NHhUVG96bExFWFFhWWpUZ3lkV2hITnVnUC9zOWRDL0VUS0pSOXNj?=
 =?utf-8?B?ZkVXL1Nya3E4TjFuc1Fya2dYV29QOHRPbmR4YkdxQ1RlaloxUElGNUZudC81?=
 =?utf-8?B?dXpzQWkvQkh1aERkMUEwVk5PNW40UVc5N25lUmsvcGRNYmxCYmtNZk5YTTAx?=
 =?utf-8?B?NzhhUXh5QUZCdHJjbG5lZkFmd3dNUjZJbmxod2JYbVFaaDkxZ2g0RG5MTlB6?=
 =?utf-8?B?a0ZGTHRWY0hwVVcrd082cnpMZlR5VE9CU2cxcllWSUZJSEU2N1NtbktIamNy?=
 =?utf-8?B?bVM5eWw0R05icVgya1FEY2wvRnZmMDlvVUVnMWtnenZnZGRHMm83dDZkODQ0?=
 =?utf-8?B?cVRXeFBXV09tM2xleGlGbTNFZHJTM0hrOWNqcEp1clZzVkg5cnRDNjI2ZmVM?=
 =?utf-8?B?Q2tTcUlFZFVFZUhkZkVrZ1NQeXlQVTNpTjJ4eXRaaWN1WWhiWXZHbFdIVjRz?=
 =?utf-8?B?ME5jcmh4ZmNKQzRhcWhmU204N0ZWR3R3MDB4ZTJCQ0RFUnFmY1puMGoveEwy?=
 =?utf-8?B?UElCalMxaUJwU08zdU9ZWTc4NEhEd0xZYVk4Qkt2ZXhzZUh3Wlp0SkRqWTBv?=
 =?utf-8?B?VGZhcFUvcXo3bXhkRUNTckNSUG12Q3ZGOGhQbG10MVJ1eVAvZGtKc0IweU5D?=
 =?utf-8?B?M2RPOC9scDVmdzlIbzBzODE4bjhkTnAyMkdwd2YxbjRMQ3ZVY1dvdlQ1UXNG?=
 =?utf-8?B?Z0FIQ3FJMVhVRVVhREhZckNXTmNlWGxvZlp3LzFGUXlEYjM2cHVVejRWNldC?=
 =?utf-8?B?YTRKQ2FldnUxNUt4bHhPSDFjNmdqT3JwcTZVRWM4dCtxcGVkOWsvdUxMNnV6?=
 =?utf-8?B?Y2pra3dhRzFPZDUxSnJVVlR2V3Ivb25OUTRJamlPT296SEtxaG80UzRpK2hI?=
 =?utf-8?B?aUV4LzhUMUttSXM0NkYxNGtzRDRaNkQwNStySllvTmlZOWlTYnBZQ3RpRjRn?=
 =?utf-8?B?ang0ZzhHQkxCSnJSWlBoQ3h3dEl3RE4vOE1MZkNqano4OEpVYWE5UmhMSEwz?=
 =?utf-8?Q?zv38=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZSs0OVp0NUp1eXNKK2ZNWC9heVVqUGpXV2R4aGl4RlBreEhzUEg0alJkY0dB?=
 =?utf-8?B?eEx2VkVnVlhnanFMYlhtU0daNlRDNzdoOWprcERocnZHOHJzbkRzWm9jZjlR?=
 =?utf-8?B?NUJwQ0g4clU0eml1cnplbTNOKzhZdlBjVmlYT2lIUzdmRlZnVGp3TnNIRHhv?=
 =?utf-8?B?Vmt3SUROZkRyZmpZVko0UTNqekswNmpSMjdSN1JDZ0p4Y3ZaakxDTkdwTFcz?=
 =?utf-8?B?QUFDYzlqcE5Bd20vYnJ2OS90K2M1dVZRWURkakZheGV0WDFrd0dxYmxVUkxE?=
 =?utf-8?B?WllVU1lUL3lHbW93WVVYYmpKOVdZQ0ppTWt2ZElqV1NTZE1nTFVrNjZUV3Vm?=
 =?utf-8?B?SFl5S0FVdFpUeDA2eGk2dmZraVF2RHkyYkNKRXJiajQvRlp1dzR2Q05sNGhh?=
 =?utf-8?B?ck1tWG9hbTJ5Yk1XQmtlYmNkczBTd29ia1hzaSszSkMrWEpldXJEaldHUU5p?=
 =?utf-8?B?ZWpQZ1p4SlF3UWloOVpMMlphQjdCWUh6d1hxdndZbXBlWVo3MWxFbzE4SUxh?=
 =?utf-8?B?NWNyUVc2TnJSdko1U3JCOGhoUWZsZm1JbFpCdDZOM2xjV1NiRTFFaVdTd3hD?=
 =?utf-8?B?ZnJsTURXZk8vNkN1dFJrNkRqQmZLNDd3c0ZLQ2w0R2VFVG9SdnhQTHJISU9B?=
 =?utf-8?B?R25zWDF4dHNtYm9iaW5QdUdseXU4TFRydmFkU2pkSURqcTFHU0xRY1hyVGFI?=
 =?utf-8?B?ZzdQcE9UOTR5Q3lNUVhPRU1MNFNWd3pLSnhlNFFzS3Z4bHhhY2lkV08rLzdJ?=
 =?utf-8?B?dDRaWFJKUUxzeU9udjVUSERoMk5IUUdBdjJhSFhRSHBUYVVHeUxGdjVNRTFK?=
 =?utf-8?B?S2ZCa1ZOQXVhSFlnQ2dnQk5RbVQzUVNETncrR21qZmpWUXRQMWV5OUN4UUpZ?=
 =?utf-8?B?M0tCbFdXd21GZkwyenp5UWNZNGovdzdOWVF1Yy90d2dLVEtxYXRZSHhVNTlm?=
 =?utf-8?B?R0xDd0VGTGpBeFNmVHl2Zy91TTBTNmZ0THFhcjZuNGkwems2eXpvQXJlTEU2?=
 =?utf-8?B?N0NHOEZQUnpQVlVobXhFUkhMS0tqa2M5bEREN0pkSFBMOHN0OUZJbmIzUWJW?=
 =?utf-8?B?ZW1JaC9NM2dRTW14bHNXS0ZtdG9xTjF5K0hiWDZUeENBM2RCVkFLSVVaeVVX?=
 =?utf-8?B?LzNUMUI0amZaV0labGtWWlFDbXlGVUpZWEpjU1hDUVNWUjZjdE1IL2NicHFq?=
 =?utf-8?B?bXFoaExXMFJDWHRnOVp5Z2tTUE4vd3pwaDZSM3QrVE5EVkVPb0pXTG1NaXNN?=
 =?utf-8?B?dzliZWdjcklwL3ExUzRmQUxjZ3JqMnBoRTdkRXJENk90b0RnK1cyTUVaS3BX?=
 =?utf-8?B?UllIS3NFMU1WZDYxWWxScERFTTNqYkRQUW9DVm5GdVZLRzFSM0xZRFp6SVJP?=
 =?utf-8?B?UldObnRzMXUweG9JZWxVN3ZaRzN5ZVFnbXNleERyTno0ZWFJcWZqRmFLdHo5?=
 =?utf-8?B?VzJ1K1hiZXAzTFZUN2xuYXlaL21jT3I5bjRkanczVjFjZWVPUnNCdG5mL01a?=
 =?utf-8?B?dWVzUlk5TTFCMCtuMCtVOVpoZ2lOK29qYVNxVEw2MVJHOXloZmt0OHBTaDAx?=
 =?utf-8?B?TjY4UWR5Wjg2NU5pcnlnVDI5RjZjSHRmWlg4OXp5eGFaSEVaTVF6eEJNVzl0?=
 =?utf-8?B?UkF3UTZ2RGdDRExJQXJYcEswOTQ1U0ZGdnhIeDFCNjQwQnJtSGRCUFlBU2p5?=
 =?utf-8?B?VkQyS05sV2lGK0JkUUlvaTJpUnRveklzV3E5L2NCVzZBTDEyRHZhWkpJUG5a?=
 =?utf-8?B?Q0RucDlVTzIyUC9RM1k1ajU2NHVlQkJVbXpKdkdNblEyMEk3UDhOcjlBR1Nn?=
 =?utf-8?B?TWttTFIxK1dqNWZ6NkhQdGc3TC9MekVtSVF4cENQZDNyVlNWMkFiZFdGem9S?=
 =?utf-8?B?eXdyNFhlSG9YMnpLMloySVErYUhzSG1WZXAxMVJiVFZPaWErWUxKMFVQZTcz?=
 =?utf-8?B?L1FZK1ZoN0s4Wnl0eExLQ1dLODNYM0xwOTJlZzNMRUtJZTB1aGs0MlkwYTZ5?=
 =?utf-8?B?Q3pIVXNrNTl3UUxzMk9PM2RMeDYxRUVYVmpzc3VNcXdVREFSbmpJTEJjajNk?=
 =?utf-8?B?M3NpSVVmWHp6bHdMWGsvUU9oSWc3UjFVbXFyM0ZCdmhXaTJUZlZDMWNjUGhM?=
 =?utf-8?B?WmYwanpoMjI5bmFLZURVaWpDTVh0TTVnTkdxUGRKbHEvV2ZuQXpSM0tOUmJD?=
 =?utf-8?B?T2F5djl4OXhxaFU5VThaaVAweFQ3dzRyQmNtQ29BcDFtZHNjOTRsVkphT2dk?=
 =?utf-8?B?dkQ3dW5CZGgxMDI5K0I0QUVnYjgzcldDQXpFYkVmVUxHMEtZQ081TVRScEZ0?=
 =?utf-8?Q?SO5bIjLikVKR1fuoCg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f37e08-0300-4520-b794-08de7081dfdc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 13:13:44.6365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNdCvjPzTq2EDjTp2V2AGKrEF6UKA7tcFiVWu4DBnWoQpkHZiJvBd1SjT4txflTk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9264
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:yiconghui@gmail.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: A151A167B29
X-Rspamd-Action: no action



On 2/20/26 03:26, Yicong Hui wrote:
> Add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR to make the
> DRM_IOCTL_SYNCOBJ_QUERY ioctl fill out the handles array with the
> error code of the first fence found per syncobj and 0 if one is not
> found and maintain the normal return value in points.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Suggested-by: Michel Dänzer <michel.daenzer@mailbox.org>
> Signed-off-by: Yicong Hui <yiconghui@gmail.com>
> ---
>  drivers/dma-buf/dma-fence-chain.c | 52 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_syncobj.c     | 21 ++++++++++++-
>  include/linux/dma-fence-chain.h   |  1 +
>  include/uapi/drm/drm.h            |  1 +
>  4 files changed, 74 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index a8a90acf4f34..076d78b73379 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -76,6 +76,58 @@ struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
>  }
>  EXPORT_SYMBOL(dma_fence_chain_walk);
>  
> +/**
> + * dma_fence_chain_find_error - find the latest error
> + * @fence: current chain node
> + *
> + * Walk the chain repeatedly until reaches a fence with error, or the
> + * end of the fence chain. Does not garbage collect.
> + *
> + * Returns the first error it finds in the chain.
> + */
> +int64_t dma_fence_chain_find_error(struct dma_fence *fence)
> +{
> +	struct dma_fence_chain *chain, *prev_chain;
> +	struct dma_fence *prev;
> +	int64_t error = 0;
> +
> +	chain = to_dma_fence_chain(fence);
> +	if (!chain)
> +		return fence->error;
> +
> +	if (chain->fence->error)
> +		return chain->fence->error;
> +
> +	while ((prev = dma_fence_chain_get_prev(chain))) {
> +		prev_chain = to_dma_fence_chain(prev);
> +
> +		if (prev_chain) {
> +
> +			if (prev_chain->fence->error) {
> +				error = prev_chain->fence->error;
> +				dma_fence_put(prev);
> +				break;
> +			}
> +
> +			chain = prev_chain;
> +		} else {
> +
> +			if (prev->error)
> +				error = prev->error;
> +			dma_fence_put(prev);
> +			break;
> +		}
> +
> +
> +		dma_fence_put(prev);
> +
> +	}
> +
> +
> +	return error;
> +}
> +EXPORT_SYMBOL(dma_fence_chain_find_error);

That is superfluous, only signaled fences can have an error.

> +
>  /**
>   * dma_fence_chain_find_seqno - find fence chain node by seqno
>   * @pfence: pointer to the chain node where to start
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 2d4ab745fdad..322f64b72775 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1654,14 +1654,17 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_syncobj_timeline_array *args = data;
>  	struct drm_syncobj **syncobjs;
> +	unsigned int valid_flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED |
> +				   DRM_SYNCOBJ_QUERY_FLAGS_ERROR;
>  	uint64_t __user *points = u64_to_user_ptr(args->points);
> +	uint64_t __user *handles = u64_to_user_ptr(args->handles);
>  	uint32_t i;
>  	int ret;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>  		return -EOPNOTSUPP;
>  
> -	if (args->flags & ~DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
> +	if (args->flags & ~valid_flags)
>  		return -EINVAL;
>  
>  	if (args->count_handles == 0)
> @@ -1680,6 +1683,22 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  		uint64_t point;

Make a local variable "int error" here.

>  
>  		fence = drm_syncobj_fence_get(syncobjs[i]);
> +
> +		if (args->flags & DRM_SYNCOBJ_QUERY_FLAGS_ERROR) {

That should probably be just another functionality before the existing copy, but see below after the "if (chain)".

> +			int64_t error = 0;

The error code is an int and only 32bits.

> +
> +			if (fence)
> +				error = dma_fence_chain_find_error(fence);
> +
> +			ret = copy_to_user(&handles[i], &error, sizeof(int64_t));

The handles are also only 32bits!

> +			ret = ret ? -EFAULT : 0;
> +			if (ret) {
> +				dma_fence_put(fence);
> +				break;
> +			}
> +
> +		}
> +
>  		chain = to_dma_fence_chain(fence);
>  		if (chain) {

In this code path whenever point is assigned something do a "error = dma_fence_get_status(fence);" and then eventually copy the error to userspace after copying the point.

>  			struct dma_fence *iter, *last_signaled =
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index 68c3c1e41014..b4ada124d7b6 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -122,6 +122,7 @@ static inline void dma_fence_chain_free(struct dma_fence_chain *chain)
>  	     iter = dma_fence_chain_walk(iter))
>  
>  struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence);
> +int64_t dma_fence_chain_find_error(struct dma_fence *fence);
>  int dma_fence_chain_find_seqno(struct dma_fence **pfence, uint64_t seqno);
>  void dma_fence_chain_init(struct dma_fence_chain *chain,
>  			  struct dma_fence *prev,
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 27cc159c1d27..2640cc0a09fe 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1044,6 +1044,7 @@ struct drm_syncobj_array {
>  };
>  
>  #define DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED (1 << 0) /* last available point on timeline syncobj */
> +#define DRM_SYNCOBJ_QUERY_FLAGS_ERROR (1 << 1) /* fill out error codes if they are found */

First of all comments please never after a define! The existing code has that already messed up.

Then the new define needs more documentation. Something like:

/*
 * Copy the status of the fence as output into the handles array.
 * The handles array is overwritten by that.
 */

Regards,
Christian.

>  struct drm_syncobj_timeline_array {
>  	__u64 handles;
>  	__u64 points;

