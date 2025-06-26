Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE4AE9CEB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 13:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA5B10E8A1;
	Thu, 26 Jun 2025 11:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z2EoZceB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EAA10E89C;
 Thu, 26 Jun 2025 11:56:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cd2n3BjawnXV2ScehAKxMNvhBnLm3KH+7K4V1w43+wt0AT0MalDA0ifTyEPdrW5y88VxHz6W2Rt339NgPTCw/pAAeo8SJG9k5lUegL2fGRJ9ayZmZMDLjFTev5f/L6BvB8+tQbcJ9YahlVDaqIuBhFaToe6/bCtp2RSSRCVlCayhupgETcpe03hKHWj8WgXB9b8a/ZTqX9Mp9yNELF/DGkVzzMDUEX7ksmCJq1zHsmPzH9vSWIioh3OaCxteLvKu9EfMvLzXWRs/LNYyBhrxCjHXZIQEpXGlJqiQ9O1JNASbo7WdQgDIa+NZz44ON1OmOpZJkiGH3Yc5nBuSgymxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+ybNM1jrtzK4PXlOF5e6R58hROaug9XhIyiZ0OST8g=;
 b=jTCaG+SC02OcZP9j6495NWMB4Rg4JNrcY7qI/129HSMa1dJWRbiE11TO2mK/NsNoxK7t+FT0ayoGv2E7pMfR5b5L5xl07E3bIVid8yzYs+WibD0z2mWNP/D9MiFoe2sAuTksCHT/YTgmf9zq7gBFdri30jqiM6+HD2I2+J02kHvNNKqYwlVBv4LFFLk57pnvSVxbhjbi6pjQ7WPpQlX5Cj4NRzV9C7F78gbBNPojLBK7x3pOgl+4M91ND0R0XWIrCVYv+oVV2s/BA8aFd0+TdjKOJ7bjHyATYm41y1qpTYnT6BvQOCceV8fAV5mBQ/0Ytj5PCDAJEYEfLeKub5JN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+ybNM1jrtzK4PXlOF5e6R58hROaug9XhIyiZ0OST8g=;
 b=Z2EoZceB9ijNoAfxkXzF/nOmxTLKCAQL0uhQVmEfTqKm+nD4pUV0+mjeKZwKS8keVo3/3C4kcWOlimBBf799gAwpLGD8EpHj54SnokCxAmzZelJL3b8L7vUkJkJk4h7LtWVfSyCzF9DLZMIFcIGfxsWffF5svB8rYK4ga4DDQGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB8450.namprd12.prod.outlook.com (2603:10b6:8:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Thu, 26 Jun
 2025 11:56:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 11:56:08 +0000
Message-ID: <dd2e96de-d5da-4b12-b65c-13152f07393b@amd.com>
Date: Thu, 26 Jun 2025 13:56:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm: move the debugfs accel driver code to drm
 layer
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250624113454.2322935-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250624113454.2322935-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f74031-dd21-420a-925b-08ddb4a8700d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmhJU2t5Ymg1SE8zbEJ0V21qbUNOWjNEZERwYWMwUUxmcUEydGRuR0tMUVIw?=
 =?utf-8?B?eHFpNWhxMWVxbUN3SmRVSkxxMVpNeThVY3Z3R1J2UUJCVW9BZzUwalpldzlE?=
 =?utf-8?B?QmhzTlZJSTVhMWZOY1Nwck43UWlLL0xaMkV3ZnBQNjdmam9lcEZ4eGZMSHQ3?=
 =?utf-8?B?MWtpRXNDN0xORHh5SUI4a2ZoQ2JKUnpOUmR2QStQdkd0RVl2cUplM0JvaFM1?=
 =?utf-8?B?elRGQ0FnbWpKYUF5UlI3VGl3NEUyTTAzNDViVmFvbitjeVNUZTQrQVFtYXpn?=
 =?utf-8?B?cE5BYkpSTG1BWE9kYVZEMEltN3REbVNrNnk3V2JCTGJHMHJFWjNrdHRvclla?=
 =?utf-8?B?V2xFR3JXeG43Y3JsSGcxNXBvMEhIalpNbjB6TmR5M2tWYndxUW83L1F6WU5q?=
 =?utf-8?B?ZkVTU0w3cEtpVTdxUXc3LzBES3l6cks0QWxwREhQRURIK1FJVEZGZzVOdk4w?=
 =?utf-8?B?QXZhSmdXWUI3TDBkVzZQV055R0UzakRtQllsUEpBOEdsTGtQOVhTQkZ1WFJk?=
 =?utf-8?B?RExNNU1OVEhBZFNzcWloSi84dDRla0pja1RCL1hadlZLMWhjRnBBRktodUFo?=
 =?utf-8?B?WlRXeHR6QlFBWk9mUFc1ZlEzcFNjYllZRWU1TW95YjVjQTY4bUJNVGUzbWFO?=
 =?utf-8?B?d3ZRczRvTUliMklpMnhmVjFSUUtSK0gwcW1zMlJjS3NaclE0WC9weFM5M3F0?=
 =?utf-8?B?aEhvN0RDbXJ3RXQ3aTJZUmZtamlTYUl6UkZUMlBQeDF3NjI1UFluOVE4NXhD?=
 =?utf-8?B?NjY0VEdQVU9CcnRHdmtndGlxK1FYUWpRcmhRY1lwdWpQWG9VMnh3VnVDdkRG?=
 =?utf-8?B?VnZzc3ZMcmtKOEFpc3NzMXlUS3UxeTN5WnN2TTVBcExpK25aTDNuUHJGVmxP?=
 =?utf-8?B?Z2ZDMXJkNGt3MStVcGRiejNiU2ZSWEUveGVSeWpuNTlET2k0WE1Bb3BjOWcv?=
 =?utf-8?B?eDNrcWV3ckJ2V2Q0Z0hzQ2RUendJeTEvaktwS2pEZTBTdC9FQjdIQ2lIdjlV?=
 =?utf-8?B?Vm81Q0w0b3BBT2MrZW1vUEEyU0c2Sk1CRERqOWF3eU1VbDgweUhJVmVnY0JZ?=
 =?utf-8?B?K0cvUzNwRzBBcnJVcmdwS3JBSGp0aUk2SG1ZbitraGVKa25xWFhnZ2R4bXlt?=
 =?utf-8?B?RGo1QWtCeGRqbkV5d2NBSlgvN2piNmNtb3VQY2lPamFlUENyazFwOGdvM210?=
 =?utf-8?B?c2RwWE9CZTZKZTJaMjE1QXVCSmdEcFI5Y3l0T1E0N3IreEpmTEFlTU1pTUV2?=
 =?utf-8?B?V2ZpZDJCUW1mWk5oa2VOUlI1eFZUODQ0cElwclRqVWJsdkh1NFRXck5pNU1x?=
 =?utf-8?B?aGtrKzZxWG53d2ErNjFHbHFWc0x2ZDduWjF6VkFIaUJzZ3BzeUtIdCtQcnZY?=
 =?utf-8?B?a2R5ekVSM0ErOXpWTk5YV3dBNURrTXhiR3BEK1VMWEUxckE2OEUwbzN1OU9J?=
 =?utf-8?B?R3lEaEVPUk9CcnhKMUszRnl4cHpRcnhrbGkxQ2hQQWRPdTJrTDA0TXpmSyt1?=
 =?utf-8?B?YlRkbnNUb3JPMndTOTJDNEhXSmN4NHNjZXl4dkhlQVgvMk5RRVFyNnV4TFQ3?=
 =?utf-8?B?R0I4U3BWSmdMQnJleEl5aDU5cldpVlJ2SUo5ZUNETE03b0E0MVZSaW90Y0NF?=
 =?utf-8?B?TExCS1cwRGd5K29zV2tPcVRjeHJ1bmcvMkJZNXNSdVhZQ3J0L0hLZFdPdTdl?=
 =?utf-8?B?Q0hwMXRPaUMrQzVaSTZ0ejJadVRyTDV6VzQyNmYxbGdZUUR3TkNzeFlJR0Jn?=
 =?utf-8?B?LzhyWmh4RXd0OHZZWE1YQVVucmJ5UitiTEdJbXJCS0NhRGZwZ2FqSTg1UmFE?=
 =?utf-8?B?V3V0Z1lRUzRvMzl2cnl1QUVkWGJmMlF2NVhiREx0ZmVreHJML3l0eVBabjFj?=
 =?utf-8?B?VG12YVdRU0hsQWZpbXJLenVFNWNjd2ZjQ0hRSkRFRXlPeTNHekl5dFIzOEd5?=
 =?utf-8?Q?D2u7ZY0HRmA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmJZZjQ4VmZWa0I2eDhacmtPS2xWRjkzSlg3Q0t4WVJ1U0RnZ0E2ZWV1dlF0?=
 =?utf-8?B?bHRpTUtRSHdIcjhoUXB3akRkdEQ2SHVVVTV6MzZreVQ3aCtCZllmQS8yelZF?=
 =?utf-8?B?QXhIZ09Kd3RsckN2N0pmZjB6Z1BaTDVMNXh1Z00zdzR5UzhjMkR1dy9yQUlT?=
 =?utf-8?B?ekNCSkhMb0N5bFVRRlVvd1YvdTRTZUdoRHd6UUF4TDZpbllkeE5qR2FJbzBl?=
 =?utf-8?B?Q2JjM215cWloMzlpK2VjUUxSWTZDNS80R1pLV2RrNEVIWDErUXg0dmpFaWlN?=
 =?utf-8?B?Vko4ZVBIbnFNOGVzem9ZVmUzVnY4NC9lWGRIZ1ZQK0hyOENFd0lodnZCaTBD?=
 =?utf-8?B?anZ4bld4c2pRSnRZNmZ0a25WTWtLOGxPUnhhS0NwTEN4bnVjckxodEtQellj?=
 =?utf-8?B?N2EyaytNYVhNWThjc0JBWW90ZTQ5QW5mYmlseFBLWE5NVEJoR2swREp6Q1d1?=
 =?utf-8?B?UnNRTUF6UWlGT2krUGN0VDlkbWFwTnJaNXFtOFJNMkEwQWwwRDlCRnYxbDFJ?=
 =?utf-8?B?bEthVjFxMk94ZHo5U1ZwY05tNUNTQmJJcGRpS3Y0Q2RPYmNFazZmeEpkSTg4?=
 =?utf-8?B?YTE3aXFtQVpQZ0VtNHVSTjU5cEFwSmNETjhmY0ltVlFSQjc1emcvdVVyOHYw?=
 =?utf-8?B?VUtQeWFmdnJqa1FjMEQ0UVJYZllGdEFUMWZGNjExYWlvbWRyRjYyckVrSlh0?=
 =?utf-8?B?ZCtreDlMRGV4Nk93SzFaSW9jZTUwN1NtRE8yQ1orbVQ0ekRRWitnRXhnMG1O?=
 =?utf-8?B?ZzJ1bkZZQ0xza0RZT2tkM1lNa3NzbU5YZ2ZBTjJOaFF6Um9ZaGljcThQOStJ?=
 =?utf-8?B?NHZyMWpwN0FKMmsvc3VHUUcyRmNhdmo3NS9ZL0xUNUdqczZTNisyU0V2dCtS?=
 =?utf-8?B?eW1KYUplb3NnM1d3RThOYVFRTElBWDdNOVlJQWlWcGRMcEtXWCtqQkdRVkV4?=
 =?utf-8?B?djZMU0xvdDRKaUM0L2NQTzBUaFdTdDZ3dElQaXN3MVFHbWtRQWYwZEk3ZTlG?=
 =?utf-8?B?Y0oxcUxMc0RyVkRJZFMwZ3VsTUhqamJITXYwMW00Tkd1VWMxNU1IS0JaSGZS?=
 =?utf-8?B?Z3I1S2JWQlNZRHpDWC82dG9lQndIcEVUczZKdWpUZ29SWGs5QWFXS3pWM21n?=
 =?utf-8?B?SEJOS0U4ZlZSUHY3Z21XNHNPY1d2THJRbDFPQmUvcDAvNUt1a3BrcHJSNGZN?=
 =?utf-8?B?a01lSFEzWGdSc2RDWkVKc1JNWGdnTDA4RFJ5cG90YmdGZXJSNUNIZ1Z2WW5R?=
 =?utf-8?B?R0EvcWJHdGhjZE9OUjBnWkFkaWJQNlVrVmtQZUIyekhPcVdadGdZd0dISnVx?=
 =?utf-8?B?a21HWGpqMHFGYlByazdJdFdGQlpoUDYxSS9jcHJaMTVJQ3pSK2N1ZFdzb2ts?=
 =?utf-8?B?aUp3Q01nUDVicmlPYTZjRjMrYjB5ZkN1V1hTbkw4NU9zRkhRdTVUelcrVi9J?=
 =?utf-8?B?Qnc3TERFVEoyMUE1eWFUVXJ3RzFOb1BRRitnSWxETk96M1BYN0RZZFdqWXVB?=
 =?utf-8?B?dnJ3Y0laVHpQcjRiTmlrdjhEMWovZlNPaDZxNHhZUm5MZmdlK2V0SGR0VXVU?=
 =?utf-8?B?WUIyeVhpNm4xdjRlaS9BOWdCMktEc1A1aWo5SUYrMkU1TUl5cWgvbGpqTDNI?=
 =?utf-8?B?elhuK1BUTmgzN3czeXBTWVNSVnJGOE94K3ZaalpneGhJUE1GK3RIKzlrZlB5?=
 =?utf-8?B?aWNSenNHMjJLYVhBa1RwdldpcUZsWHIyL0VsSnBkSktuZS80ZnFHYzZOa2Za?=
 =?utf-8?B?czBOeEpnV0g1Rkw3b0VpLyt0YUg5UVhBZmRKeGtQYXcvR1JvTzlYRm1hWXd0?=
 =?utf-8?B?RmphOEJiS2ZnVDJYVFdma1lrbEJZczJ1bXJXOTVROGJEY0dqN1FqcWs2Y2lD?=
 =?utf-8?B?d2d4Y3h3Tm1BZ2dBMkNpZlp2aGdkd21hQlNDTWtmK0pQNlk5NVU0VmN5SnVR?=
 =?utf-8?B?aUdPKzZmN0FHN2U1LzQ3ZC8vdXA1anhpUGsxN08yTGk0Wmlka3p0MVpOV1NR?=
 =?utf-8?B?amIxUGUrTUJiL0FvVTJZUHA1ajgwd25Lcmk0YkJKOG9weTNiNGFSVW9lUmtG?=
 =?utf-8?B?eFlOVzdQbUF2L1BlVi9pVFgwZ3M2eEVZMCtDaUl0ZkQzSWlDZ1RyTm4vczVW?=
 =?utf-8?Q?12YSfhl8EMToNkJblyGvIANkT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f74031-dd21-420a-925b-08ddb4a8700d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 11:56:08.6278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LFWX9VMgVzDHaXnr4LUJX9IsSjTFp+9iqer0prbXRNpCTs+tssjsyrzoSLIE35z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8450
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

On 24.06.25 13:34, Sunil Khatri wrote:
> move the debugfs accel driver code to the drm layer.
> This is first inline change to move the debugfs
> related changes for drm to drm_debugfs.c

Maybe write something like this:

"And intermediate step to move all debugfs related handling into drm_debugfs.c".

Apart from that looks good to me.

Regards,
Christian.

> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/accel/drm_accel.c | 16 ----------------
>  drivers/gpu/drm/drm_drv.c |  6 +++++-
>  include/drm/drm_accel.h   |  5 -----
>  3 files changed, 5 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
> index aa826033b0ce..ca3357acd127 100644
> --- a/drivers/accel/drm_accel.c
> +++ b/drivers/accel/drm_accel.c
> @@ -20,8 +20,6 @@
>  
>  DEFINE_XARRAY_ALLOC(accel_minors_xa);
>  
> -static struct dentry *accel_debugfs_root;
> -
>  static const struct device_type accel_sysfs_device_minor = {
>  	.name = "accel_minor"
>  };
> @@ -73,17 +71,6 @@ static const struct drm_info_list accel_debugfs_list[] = {
>  };
>  #define ACCEL_DEBUGFS_ENTRIES ARRAY_SIZE(accel_debugfs_list)
>  
> -/**
> - * accel_debugfs_init() - Initialize debugfs for device
> - * @dev: Pointer to the device instance.
> - *
> - * This function creates a root directory for the device in debugfs.
> - */
> -void accel_debugfs_init(struct drm_device *dev)
> -{
> -	drm_debugfs_dev_init(dev, accel_debugfs_root);
> -}
> -
>  /**
>   * accel_debugfs_register() - Register debugfs for device
>   * @dev: Pointer to the device instance.
> @@ -194,7 +181,6 @@ static const struct file_operations accel_stub_fops = {
>  void accel_core_exit(void)
>  {
>  	unregister_chrdev(ACCEL_MAJOR, "accel");
> -	debugfs_remove(accel_debugfs_root);
>  	accel_sysfs_destroy();
>  	WARN_ON(!xa_empty(&accel_minors_xa));
>  }
> @@ -209,8 +195,6 @@ int __init accel_core_init(void)
>  		goto error;
>  	}
>  
> -	accel_debugfs_root = debugfs_create_dir("accel", NULL);
> -
>  	ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
>  	if (ret < 0)
>  		DRM_ERROR("Cannot register ACCEL major: %d\n", ret);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..5d57b622f9aa 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -70,6 +70,7 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>  static bool drm_core_init_complete;
>  
>  static struct dentry *drm_debugfs_root;
> +static struct dentry *accel_debugfs_root;
>  
>  DEFINE_STATIC_SRCU(drm_unplug_srcu);
>  
> @@ -752,7 +753,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	}
>  
>  	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
> -		accel_debugfs_init(dev);
> +		drm_debugfs_dev_init(dev, accel_debugfs_root);
>  	else
>  		drm_debugfs_dev_init(dev, drm_debugfs_root);
>  
> @@ -1166,6 +1167,7 @@ static void drm_core_exit(void)
>  {
>  	drm_privacy_screen_lookup_exit();
>  	drm_panic_exit();
> +	debugfs_remove(accel_debugfs_root);
>  	accel_core_exit();
>  	unregister_chrdev(DRM_MAJOR, "drm");
>  	debugfs_remove(drm_debugfs_root);
> @@ -1193,6 +1195,8 @@ static int __init drm_core_init(void)
>  	if (ret < 0)
>  		goto error;
>  
> +	accel_debugfs_root = debugfs_create_dir("accel", NULL);
> +
>  	ret = accel_core_init();
>  	if (ret < 0)
>  		goto error;
> diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
> index 038ccb02f9a3..20a665ec6f16 100644
> --- a/include/drm/drm_accel.h
> +++ b/include/drm/drm_accel.h
> @@ -58,7 +58,6 @@ void accel_core_exit(void);
>  int accel_core_init(void);
>  void accel_set_device_instance_params(struct device *kdev, int index);
>  int accel_open(struct inode *inode, struct file *filp);
> -void accel_debugfs_init(struct drm_device *dev);
>  void accel_debugfs_register(struct drm_device *dev);
>  
>  #else
> @@ -77,10 +76,6 @@ static inline void accel_set_device_instance_params(struct device *kdev, int ind
>  {
>  }
>  
> -static inline void accel_debugfs_init(struct drm_device *dev)
> -{
> -}
> -
>  static inline void accel_debugfs_register(struct drm_device *dev)
>  {
>  }

