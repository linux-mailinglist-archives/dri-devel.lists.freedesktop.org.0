Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142C4AD7093
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B4E10E83E;
	Thu, 12 Jun 2025 12:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vMvvh9bw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC7B10E84F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:37:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6AnbY/iUV32YA2B9n3C1nj0/0Lqk8TEu9hDCjgv67LKNhKddNMI7vSz6joEFgo5DjPeGvTir0AJdS6rZWv/Ew9kliMvrP10BQXvytAfQOnUibUmTVQfv1fTwA57No23Y65Z1pkHolM2XEdCU/CXrDhXJ5qrJrJiGKlO3GFMJlR+snQZd8YrSso+YBd/hTGFqzNO+rn71W6xetjtKjQZCZbwsWqh72tN2rGAMa4+0QcEmIGwJaeRao6FYPJP7naIQSwqEE5W+OnbRAXpcB8Xr3YrIqd2z4NdXemcxSFGm5RvwJLgYJTTR2JlhH6cnXblUHccsZdmE1afFzxOm/PjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jL2ekh7tlZuCU5PkSU3UM7YVm0LhEgkDT+QJctGAvTg=;
 b=UCJvLmj5/xcdthhMH2+vmue3ozS3M1qrY4qtFzY0w9Bia6Tp9rTdkLAkFErfLUKDSG+jdctvUOFJco3DGgtPVIRYvSR6Ik58Ws6e103qwpD5L8SII2t57tnAtyGjtUHDgE1XJra+XM8bu8SR3Jw8CM9M5+e1Vz5SI3ZSJ0OTUm/P6J2Whb34SO83m3K1RLQWk7xE/jaTjXJzIfZ5LseDcMGeEcvNeHdR/p4OXfHVI0lqkuBIHeEVNpU7LflDGGOvGgNFyC6NR027LOQ8tYM7SIf7CMgHxu+F8xxYOSATTJmigguwnZeZ9/d0U9BlQMSN736JKS9fxMn+2quI95QQqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jL2ekh7tlZuCU5PkSU3UM7YVm0LhEgkDT+QJctGAvTg=;
 b=vMvvh9bwezaCxvbflbfyHrGl1RjLkwvoj7yHKY8qBzLPAL8B4R2N1J4kTv3ZIAzfuYNpa4/eYuLPBq9DjEte6okzgE/Iodef4n+6r/GuXc5043RALRkrYEuR9ILiIljAFN734o4Qn5scuMozmgEzVJycgxA/uh/be+QMICzUii0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.36; Thu, 12 Jun
 2025 12:37:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 12 Jun 2025
 12:37:11 +0000
Message-ID: <3979bf14-244a-4613-8141-8f7e80107c5f@amd.com>
Date: Thu, 12 Jun 2025 14:37:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/file: add client id to drm_file_error
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
References: <20250530062929.1954784-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250530062929.1954784-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:91::30) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 50881ad4-df89-4508-482f-08dda9adda66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzlURnVVZzYxbFFCb043eDh3cXFhbm5Pam1hc2ROVXErWm9mc09LMVpyZGxJ?=
 =?utf-8?B?VHdBeFVxQVFhc0NKSjRTN1VLN1lKK0hjL00rV3dHZnp1Smp0T09laUx4dDZh?=
 =?utf-8?B?TCtxQVVqVmxMUHc4UVFOcFhKSi9LRURZTzNuMTNSeC9WRGdPdE84L2dmTUtB?=
 =?utf-8?B?OGthVWQ5SzBsc1NTY0I4ZDVNMXkxT2FPdDdDT3VmL01SUm9FdzBLSlc3bkJ4?=
 =?utf-8?B?QWRJTHFDN3JvV1BtY001NStzcGdnMkNrNlVGK3V0OUo3d052Z2VlcHJPRjhi?=
 =?utf-8?B?dFV6QXdUbHZGK04yTGkwTVVHQUdMbzZMUDdPdlBTaCs1S0VxUUZVODJ0SWVi?=
 =?utf-8?B?cGZ1d2F6UFFFVnZYN2pELytsb29wb21XUm51ODhRRmw5dzNHekNBbjEyVXpN?=
 =?utf-8?B?eC9DSThOMk1GM0IveGNDYW9LNUNhWUZlWGF0L1ptcWNhN2hMaTcyOWhJWnVm?=
 =?utf-8?B?Z2VoVmY5NVVCZmpET2Q2RE9aUkZSNTlZUW4yS3dzOTIyQUplT0xSU21iNTdi?=
 =?utf-8?B?Z091WnZTYkVEcDYwMFJCM2YrSWt3VlpjUXltcDRVOTZkVzNaTUJiWFRhNlJP?=
 =?utf-8?B?cmxBNHkrazRyVEdTVXNSOVBIOWRaVWZ5Um1seWZhbTRZKytGb1YyUkg1S0dn?=
 =?utf-8?B?RmdmaGJxaTh0b1pBejhrdXFlWHN4TFRvUzNnTlR6WW9NeXNoZHFGRGFkTjc2?=
 =?utf-8?B?TXRmT0dPc1I3bVJ3K0pycWhWeUU3dExreWs1c0V3OElvNmdBNlRWM3d4ejZa?=
 =?utf-8?B?aHlBMjhjdGV3OFZEQjZmd3U1U1prSmtka0VxZHZ0ODRqc3Z6UTJlQmQzWGht?=
 =?utf-8?B?MjZSZ0c1YXVtRTVpMkpsT3FsZXpGWjFTU2tnTGNrOGM2QWhWZlFibWxIM1Bi?=
 =?utf-8?B?OHM5S2cxUXFuTzllSnRocjk0anJtYWdaL1ZZQkZTMWc4cVFETS94SEZGcWlh?=
 =?utf-8?B?eDJqbzNoaThpWU1IeVRuZWZuSmpIYXNPcktaOG5JbElnVG9sbmZGMk1XQ0Np?=
 =?utf-8?B?dkdSN3lYeS80ZWlDc1ZFZ1lvbkJKa3lobVhyeGNCSGRnZGpqV0gyRFRPcXNZ?=
 =?utf-8?B?REEvNVREcWZHWlRVNWVDZEtDbEdVWjFHaGNXYTZFZm1SZElVeFFFQ1hHZ2k5?=
 =?utf-8?B?YkJIeG44Qy9ISlFIait1S1lnSGRLS1lIVWtHdW9Ydk5qTnZHbFFNZ2hnV0pw?=
 =?utf-8?B?K2RIV3BlRjY3SG9yLzRBcDNGckFYRjV5c1cvT2lnU09HdjdoVHozSlRmWUFv?=
 =?utf-8?B?QVAyVjN1dVIxWHN5dW9tOTF1MGQ4UFZ3eUpyMk54K0R5ME53Um0yQWRzYXQ3?=
 =?utf-8?B?ODBuNWNsUm9OZVB2NWNNL2JpdVhyZkZVQURtSE5OWGZCWG83VlY4OGpXMk10?=
 =?utf-8?B?Y3JEa3RHQlpzb3FBc3RwQS83WksyeE13c0MydUFQSEd6MnN6RFZZUzJBcnUr?=
 =?utf-8?B?b003aUVLVS9CY0o2WjNBamtjQ2dnWnhXamJ2UmJVZmFtNGdvM3RCOUovdUR2?=
 =?utf-8?B?UlRIWkUwSEJ0UHNtVFMwdkMzTmxwdGxOcW9EOHlqSEtjcGpSRGdySDd6Qk9j?=
 =?utf-8?B?b295bU80YWdQT281VDNPWjF3Mk1uWDJQbE11aVo0c2Myc2NneFJDNW5HdDRD?=
 =?utf-8?B?S0JLM2JCdUc5aTU0cmxaUDdPWlB4MStwRFlMTTdacWtIOGkyQXlGQVg5Vi9T?=
 =?utf-8?B?MlgwRTlYRFA0V1UwZmFJbjJLbHpDK3IxeldtZ2syRkxtQTJWU0U1UkNyM3lE?=
 =?utf-8?B?ZWt3cUdXNzlrclcwOUYrU3c1WmcrRHppVXlzM2RmaHJxSFZjVldYNGtRQ0NJ?=
 =?utf-8?B?c1dQRklqNFBpenRSN2NNTmNWbGFYcnczYmovVU5OcXBmdDVZWlh6WGxkMVFr?=
 =?utf-8?B?NU1lTmlQUWR6OG5Qc0N2cFJGemh2aXdDei9zWWlORHNVanlBMk9ITnFFcGN6?=
 =?utf-8?Q?i6B1Y6dgfo8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aksvcnRiZjZlbS9TSjNjWHZDZmpvcmJIa1V6K29MNi9OSmdSWE14YW4xYkpT?=
 =?utf-8?B?QWJ1SDlyUFNLeWlzSDQ1dGo5dG5IZmtiUHpPdmswZlpPeEx6WlhhK0VGRXdK?=
 =?utf-8?B?elFyOVB5NzFkbnBuS1p2VkNrUlk0YjRieEJGeWJsRUdPbHZyZG5BV29sd0Vl?=
 =?utf-8?B?ZVMyM1djVCtCbnFuelBGc3dGVEZGbTlPYnozOUI4TVdhVENibDRwTTZKK0F0?=
 =?utf-8?B?TlRmeEtGclplVzdQU0VPNU5NWk5DMWh6Lyt6V3I5cFlheEVCcCtmc01LN2VP?=
 =?utf-8?B?cEpyTDZNblFvT1JMNUQ0dUthOU9YRTl6a0lXcURjN1dCTnU0SXVKWmZDSWpi?=
 =?utf-8?B?TWs1QnNDYTdFRVZ6SXp1VjVXenJGWW14SUo3UVZjQnRtOTZiNmxQeitYQVQ3?=
 =?utf-8?B?bzE5Wi9wbEs0ZEdPVUp0NnJPcFk0dHRra2w5VC92SmhQQ09YRUo5UnRWZ0Vv?=
 =?utf-8?B?cGI4a0pIWWhKb2tDL1R4eHR0clRxRVRaeURib3RkRk5ZY0dWQ2J1SlFkZFNO?=
 =?utf-8?B?aFdnTUZrdEp5S25qcEpONUU1Z2Ztbjl3RVMySENQc2xFSElCL2JvSjR2RmZ2?=
 =?utf-8?B?TWd5SGFuSHNQU2hrVytEbGVnZFc0ekRPamFOMWExcHYrdkNwV1l6Z0JrZkZm?=
 =?utf-8?B?bFc2MlNzZTBxazBSbUZHS3BOU3hJNTdyWkxITFV1anM1K0N1REpoL21zbi9O?=
 =?utf-8?B?UzJ2emRKRjBmaVhBSlhScUZuSVB0clZQRVdNdG9OZURLY29aR29DL2p2RHBa?=
 =?utf-8?B?NUM2MWllTUZ1RVdmZmNSZDNsQ0RvWmJvTXFRcFN4OWJRRFZ2U3BXNXFkMWZX?=
 =?utf-8?B?MHpaeDhObXNFSkJYeDV2cVNOYWJtbWIrSno2ZkJUa0I1T0xWZHJNdE1IT0Z3?=
 =?utf-8?B?emlUMkxkR1ZHTjBGSjRPMXg2TWRZV2pWRTU2enBrRG8vUlRLMk9QSkdXR1lS?=
 =?utf-8?B?RVlJQ2lkZjdXcFhua1VPSzhMcUo3bjlXVVViUGxJMk5uQzJsREhBb0xaRWgv?=
 =?utf-8?B?VDhLUGZ1cURDZXpWZ1hkRXJFd0JTSUJVU01aWFBGQ1hNK0xlTzhkck92Y1Qw?=
 =?utf-8?B?SDRBemVJZ1lsRGliSjhKVlk1Z0JQRkJBMzl3VExnTzB2Skc2N3lqMHI5VlJ4?=
 =?utf-8?B?Tm5oUnI4bEE5VHNDZjlKNTVaQVEvc1llWnd6T1ZGVnhTejlCL2JBMzViQzIx?=
 =?utf-8?B?eUE0a0g1YndTS1BsS2I5cTE5UzhMR01UK05QbHFjcndFemtPeHJ1ZW9STXY0?=
 =?utf-8?B?MkQ0L2UvNFY1KzZVeW95UGZBZjl0M3VoZVNIU0FzMEZoWGVHU2ErVHdYczYx?=
 =?utf-8?B?SW5XZUlkaTc5MUQ5b3JQcFE2RXZ0bkVqL0htVWo3MklycnM5SXp2dGdlMlVs?=
 =?utf-8?B?YmplTGFyQmJlN1NQWkdiNFBsanFVWVBmMUtuRExpWU9MSWthWi8zSlhTamxP?=
 =?utf-8?B?elRvTHpXWkJvL2JaMGZaQmxGb3BEdXAra3ZTRzUwWWVHQzBQUUdRblg1TkY4?=
 =?utf-8?B?c0lOaDNUL1VDbmN1YmsvYkJrTjFadlBDUmN4bHp2TE9LL29TQnhERCtDQUlY?=
 =?utf-8?B?VmpOVFY0c3VjU0dBOTdzMElucDFMa1BhZE44NHU3NWlNOEw2Y0VpdU9lK1Y5?=
 =?utf-8?B?a0xZRURqcHdKQ2VKQ3I0TEhLWTBSbW1RZGdmM1pSZGtxS2FidkNNdy8zMmRk?=
 =?utf-8?B?QUJPUkd4bHQ1N1dqRHRaeWNVS1ZzalUva053NEE2NXJiVGNJNFk2bHAzNG1Q?=
 =?utf-8?B?WWd0VmNrNi9raG5BdUc0bmtuWXhMNUs5NVEyRWpQWjQ4TFR0QW5RUGlyQm5y?=
 =?utf-8?B?ODIxRVdueVdzeExnUGNzdHJhRk4xdkhHQ3BHRzdpZkZQc2I3M1piVGVFdXhs?=
 =?utf-8?B?czFzYkRVSEZ6dGEwMVhEZ2xyRmZ2MXRidW1KWGYrT3A5TWQ4eUNqYS80dnJB?=
 =?utf-8?B?TlVxcmlUeTdYTGNKWW15Mjl6Ty85ME5KdWxzS1F4WUxmLzFabEdqQjdXQWhM?=
 =?utf-8?B?cVdYTXI4YkxsbGhRQXZTVXJGcU5ud2dBQ1Z0YlBpYUprR0NOSnNuUnh2eG9Q?=
 =?utf-8?B?VEhmUEVpazBhbnNOejkvU0pJT2V0Y1ZlMi9iVnA5ZnVDMldQaVNRYTB0WFJ1?=
 =?utf-8?Q?nTBfNS5BcxEiHnQ4JjEkao57x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50881ad4-df89-4508-482f-08dda9adda66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:37:11.8673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIY+xIiRpg9pwWJ/VdSo1sYbe99ThmsiiZ0s2QTwNcFr6ARQUVDTxG6Gm0FIVGr4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175
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

I finally found time to push this to drm-misc-next.

Sorry for the delay.

Regards,
Christian.

On 5/30/25 08:29, Sunil Khatri wrote:
> Add client id to the drm_file_error api, client id
> is a unique id for each drm fd and is quite useful
> for debugging.
> 
> v2: Swapped client id and client name order [Chrisitan]
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_file.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index dd351f601acd..06ba6dcbf5ae 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -1011,8 +1011,10 @@ void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
>  	pid = rcu_dereference(file_priv->pid);
>  	task = pid_task(pid, PIDTYPE_TGID);
>  
> -	drm_err(dev, "comm: %s pid: %d client: %s ... %pV", task ? task->comm : "Unset",
> -		task ? task->pid : 0, file_priv->client_name ?: "Unset", &vaf);
> +	drm_err(dev, "comm: %s pid: %d client-id:%llu client: %s ... %pV",
> +		task ? task->comm : "Unset",
> +		task ? task->pid : 0, file_priv->client_id,
> +		file_priv->client_name ?: "Unset", &vaf);
>  
>  	va_end(args);
>  	rcu_read_unlock();

