Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F584A816DD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D67410E751;
	Tue,  8 Apr 2025 20:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cJrm785J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05B610E750;
 Tue,  8 Apr 2025 20:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRCQOy168LBHk6oq9nhdsPx68uHSDlLkcC0sZkZVjPvV0d1y+XA9x6PLhKi3fGDycZ4NSw3K2ksVTzd0V5QJvWE75kcq1hdXj+lZN4IjwWPsc+YAK+W9wp2kmfjWnfpBzgUTgfEviwMEfI5K0Vk0jquiUpAtrY7Q/MfA/7abDzYtrHsHI7pbB5n3jH9F5yNuOIlfw1y3gedoSgkEQ6W4dSN0bElBA74G9OYxrK7K6btTLyLFrkgMaSHa93DZUIP8TjsLEcFDeu4+EkegryWijVyJ4KFOL9BM7ab8V75syqE2axRsL61KWC5hDRQHZJv+ZowkTuoV4+zQAxkR3EeUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8m9TCIvKNu+pOT9kx3zcU/DAfbJq6K37v1OUXFK2hWw=;
 b=HwtbT/4XEBy12hcGOXijPIfaPwgjbTqUVI/0/YSkpG85BjUjIF568BrldH4wgT1WYDVVYh5ukJyEgn5TVpWRqv9hoTGQaZdHtf39go621xUFz3ll1bjS2uMZsfDxb5840y0CRFpxlo24r/oDtv6YxMpk00t7g+ETQNcUk3K4ZKevBAVpFY9Ppr8gu/PRU6jGk8zGO2p8pRO6jdbe8VOFFALS+SkFFUvND7p/1qXoMQHIIfPDIcfCd5EiJTJ7W5N3A9YBdTcCsglnlb7E+Kf7m0PaAfV5dQowZYnlf6AlsE14hxvGVFmM8L/KIRjA4NY39TtAR0SH2bhjPgH0G8Fs+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m9TCIvKNu+pOT9kx3zcU/DAfbJq6K37v1OUXFK2hWw=;
 b=cJrm785JaL93CPEqfJXKkn4h6d+riHX9vrzuKxRNuM3V3gZVfNo14oI9A0Qbaim8tmsSmRy5r7fwzUg8Amm2WUuk+PYsqnSf1Gw3RCl71cj7ETAIdGllZIS4Z8v8YvZB5MrodLWD9wQphWad5jHB49h7Rl4NsUj7WczwLcrxHZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV3PR12MB9141.namprd12.prod.outlook.com (2603:10b6:408:1a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 20:29:43 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 20:29:42 +0000
Message-ID: <0b65112c-3de8-44c9-ae40-96bad5daddaf@amd.com>
Date: Tue, 8 Apr 2025 15:29:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fixed the warning at
 ./drivers/gpu/drm/amd/include/amd_shared.h:369
To: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, aurabindo.pillai@amd.com,
 boyuan.zhang@amd.com, sunpeng.li@amd.com, dominik.kaszewski@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
References: <20250405031242.64373-1-kevinpaul468@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250405031242.64373-1-kevinpaul468@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV3PR12MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: 80fb5936-d26c-42ab-2b20-08dd76dc17f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGxIakw5Rzh2U2xId0xvR0VGSFk4Y01ISzZmR1VBSGRxNlRpbVFuTVFzd29w?=
 =?utf-8?B?ZFJHUmw2UmUwWm5vOHdYOVRZNGlib3loRkNvMHpUVFBGUHdVTzREMGlYUzN2?=
 =?utf-8?B?eXlPQ2QyYU1oSDdYY3dxZHowT0ZvMEhKVEw3bDRPK2hPRTlveWNTSjlhV1dt?=
 =?utf-8?B?dWtSY2wwQld6cVJwNy9vZzRjRUtDTmdlM24vdmNBUEZvaXlpY2ZvbVdvTm1z?=
 =?utf-8?B?MXFFbk1tL3Frbkt2K2ozV3VjK0lQTmozZ2dUVGs2U1E5T2gxK3VvMjlZUk4w?=
 =?utf-8?B?K3pteGsvQ1JCZ1ZTZDhwUThGMEhxcEl3TkUxTjFoVkdCWVozZmV0L0RoakJp?=
 =?utf-8?B?MzY5bjZ6LzRQanNqZlVZamg2ZityQ2hNR05IZDdmWFZZSTJVbTRUdGFaUCtL?=
 =?utf-8?B?S3ZuSkxrOS9GL3BZLzJpbGVZS0lkZWpGZzQ3SVJZd0d3bVR1QTNNY2NHUGlB?=
 =?utf-8?B?anU3dGtjNGhtZ0pheFV2cGpVLzdnMUQxWHRaN01mdVZUcDdGdkNtWTUxd3ps?=
 =?utf-8?B?U2ViN011MGZBbVd3bTZDVU4wak42NW1zanpkRDZKMzl3TE43eXY0eE9tYWd5?=
 =?utf-8?B?NlRBNDhjNEtDWGhlYlBibVgxNmJZRStxejhXdFVaWTVSRkF3ODM3WThvcU5k?=
 =?utf-8?B?VzZCQURxK0FrQ1k0QWpjZ2tjalpZWVkvK3BqZ0ZXdlV0T3JsR1N6Rng4dEhY?=
 =?utf-8?B?dXRpak1mVUxZUjVocEllZGxUSWNGcUhhbkJNYVY5d01US05kSUlab1FGQ0xw?=
 =?utf-8?B?QWcrRllxWXRZWWM5d0gzMjdaVk5hN0xlamROT3dHWVdTYk5UR01tUmxscXJT?=
 =?utf-8?B?QkpsUENiWmd2Y1U2ZVByamV6N2kxUXU3VDZLdEUvNXhWNkJaK0tRRVdCelVV?=
 =?utf-8?B?bTlFdCt4VmtCd1lhajFIOTlKYUM5bjJZVnZnQy8wYTJFUis4SjNtSk93Nmlm?=
 =?utf-8?B?TEN3MG1pWEZQVVpBRTlCMDhkZ1g1QnNJYVA4emplSjU5WVJNSUNkWUY0bjhr?=
 =?utf-8?B?Z2plejhSZ24rckRtRC9DOHdTMEFyWHprNWorWk44QXlTbG13QXZ6SHM3NURq?=
 =?utf-8?B?ZVNKa3Z4ektvS3RudnI5eU12UTRVTHpYTTRiNGcvbTNnMDRRUEdPZENvcFBB?=
 =?utf-8?B?OVM1U3RHWE16Z0lHMEJnZVB5QVA0amtjeVc2T1lnQlg0TVlNMXF6UjB5MVFB?=
 =?utf-8?B?SG12VGtxaWJkei9tZFhCKzY3OFRUQW80ZzQ2elRrSDdlUGFuNkNPSDNWYXBG?=
 =?utf-8?B?N29TaGxWM2dMQmVmOGRjbk1LWWx6NlhBcFEwallRRW1CbE9ROTkwVU5pRFFZ?=
 =?utf-8?B?U2dNNEM5MmdjRzZmcHNjbWVMM09VcXdhSUQwWGdtYXZrOWZkMGJYRUFyenJM?=
 =?utf-8?B?Z1hrdnl0OUZHeFNwaGh2NTNjUE9melEvWFgzZzkxNUN1WmJvaWFlUmlOTnJ0?=
 =?utf-8?B?N1pUS0JBTlpkRU1yZGhQWVFoOURtd25UZDhoMGMzSlpLK0hOUXk4OXRsUDdl?=
 =?utf-8?B?UjQ3OTVqdnAxRG9SYVdyNUR6K3FCcXBOQXRQZVJPYnBwRXRPNVBnZnpzN1hR?=
 =?utf-8?B?VkI3aDJUMnVaMEhUUXNyeTlOWWxoa21DYThhZXlTOWZPRmZiZS9TL3UvRWRR?=
 =?utf-8?B?Yk9Zd3hDeFY1N1F5SVg1bngvUXFMZHpnUDlLMGRZSkpjbDJUREM1a3E4VUxa?=
 =?utf-8?B?MC9hbWozUDVUZmpvRm5IZ3pSdy9WcTFSdWlXS3hIcHI1QWNseXczYzFVK0Z6?=
 =?utf-8?B?Zy9uZEFuSGl6MmdWaGZRUmRTaEVuYTJPRlhEd29SK3RFTXp1OWZvaDA4UUxT?=
 =?utf-8?B?bU94WW5RZFlxSzB3SU9sMStobHBNQTVxOHhDbmxwQ1VJaHUyTUtudkRWTUhV?=
 =?utf-8?B?ZVd0S2ZEOGpBSjlMcnkrbzljWWI1RnRWa3pRZlVUT1lhU3QyMys2VDF1cDVK?=
 =?utf-8?Q?x0YtHM/MQNc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnR5S1NlQXFvU3BwNFE5WDVjU2NUb010YXF6Y1hwdTdvT3duMFllNkNSM2Jo?=
 =?utf-8?B?RjloNThXWWo1WGR4d2JkbEkxZGhzblRDdlY4RnljeWNjV0FOTDJDdlI3d0FW?=
 =?utf-8?B?Y1l5ck5NL1dTSWdpVEdKdnQzb0IwVFBkYXRacURqaVVkUDlDOVByNWRvRUpX?=
 =?utf-8?B?UWJBYTM2Z2R4K29oSXNHS29Udy9xQzZGQzFUdWlweHVqZ2piZDNMQ3RHSTlM?=
 =?utf-8?B?QmQ2d1lzWjFyOGtGZGxGcURXdzg3eG1RK0hHSmhFbjBvZG5Td2JZbXNQNnds?=
 =?utf-8?B?TldUbXp2eklVdmRLNFUvdkw1V0dOckdBdGtxa09namtNME91elM2UkdlU1FE?=
 =?utf-8?B?MTN1MFdqUzYrQ3dUYTNrZXlUa3NtZVN1U2l5eWN6OXpBNER2SGZLN3ZvY3FP?=
 =?utf-8?B?L1hOVFpPeHdsbEpiTmNJQ3ZSVDVmWnExZTNVSmttTG5UOGx6UkVoenk2bkRV?=
 =?utf-8?B?WndhSUZmODArVEhBSk1PVWM4Vm9Wc3lWYlV1ZTdnemlzSW4vUlkyTXord0hq?=
 =?utf-8?B?djIyY3I0aURGUzI1UG5qc2hNZFljVko1TnZFQlNWQzFJZDEyK3dKWHo1RUVq?=
 =?utf-8?B?Nm9DL3dRd3Urdy8xNlpDbTJmdGE3SXd3M0xmQXVCeFZrVGZHMTUrbjBVV2k3?=
 =?utf-8?B?OGgrNGh1a1U1UHZuUUhqSWtjZzY5THljY3dPWlR5VFp3K1k0Y3RqeHJ2TGwr?=
 =?utf-8?B?MGZCYlNoU1NqYytONVhNQ3dsNTJ5WE5wT2xidGljeWZDU2U0V3psdHRYbkNk?=
 =?utf-8?B?bzRqREtyT0dLSUt1M0x4TFgxc1p2R1VBdlM0d1hmK0lqNE8veTZhaUJQbXls?=
 =?utf-8?B?N2h0Z3lPM0tFM2JuUW5RSFUzbDZwMmN3ZnN2MmlVWTM1WUgvN0ZZZEdrZm5F?=
 =?utf-8?B?bk9kQytzU3E1TExIQ3RldlNBNzhRekJGM251UUFuOU55bnpkTUExMGkwK0ND?=
 =?utf-8?B?YlFndHJxUmRPbDdLWEFXdmZSNUpZZWRzQ1llT3lveDJsRnp1Y2ZoTTFxMlBG?=
 =?utf-8?B?NzVwOTMrZ05XRjRYa1hPVHlRR0hsWXNuQkpnQlp5djVoRU1teTk0d1VCaGVH?=
 =?utf-8?B?bm5xZGlPTWJrNERMV1JSTnZtWm9OZkxjY2ptVkd0N0ZCQkIwdDREODNXdlZk?=
 =?utf-8?B?L2o1NTBXUUlScmtpTlQwWkdCUjJDTWJYc2tQdHJhYTAzbjRoRkRSNGoyNHJ3?=
 =?utf-8?B?Y2dpR0VoVHlnMmpzdTNYR3VXMmtxRVhKZ3lsWnJOL1VzNUlpVVNVWE5VV0VU?=
 =?utf-8?B?czNFWXM5ODBTVGdrL1ZyL2lwTkFENHRablZUZ1VpWDhsaG9LclZxM0owTDZ5?=
 =?utf-8?B?RGxqR1psNFhtWTkyQzBBT2EyaDl2V0svVkRvdURrbzNIa050emtuTHhzTExu?=
 =?utf-8?B?VDR2d3FtazBtT1pPWUhBcm9DOGl2N3RadHZTdnRaVVNaaWF2K0R4aTljSm1W?=
 =?utf-8?B?T3Blcmpkclc0OHkwWSsvUGVtRGlJejQvanRFelB1Z3M4NE8yZmppcXBYcEpl?=
 =?utf-8?B?ejJVcmJKdUIyZ3VlamZRWDc4T0ZZbE83MW92blB5VDhXT0pQQ2YwK1pETXdr?=
 =?utf-8?B?S2ZUbWFqWkJlSS90OFpFTUhzV1ZqNXBWWitxbDhtazVGT3RkSWFKalo2cmpq?=
 =?utf-8?B?TlFhVDhiMUpBZDc0Q1VlS0tvbWk1clJwM2w4cVBpUzROQVF3UFFMcHY5emdn?=
 =?utf-8?B?RllGcTg1S1VIWG9ObElkcHAvTHF4clhBYW15RHpqYmVlZjZqZzhyYzIrbmVC?=
 =?utf-8?B?dEVZMHlQdC80MVhNbHpxdG4ydzhiMWZ5T2xmTzlqS2ovYUlMbnR6M1IrbDVG?=
 =?utf-8?B?MTd5TGxkQ1hyOEVEYng3cW5Gc3ZGY002QTVtWWo2WCtOQ0t4ZytiZzExY1E0?=
 =?utf-8?B?d21JYTJic0hLWndVZ0MzZ0xaWEhFWUZmTWQwUSs5Slo0ZlM1RFNRNVhoQkhL?=
 =?utf-8?B?bnFhT2tFemE2UUc5OVluaytGNHA2MFNFOHZmYVdjbXRwMllLNXY4RXJFVnpu?=
 =?utf-8?B?N2VxWllVdkFDRHNSbVRUV0lGbGV5S25lMHRRNEFsRENsOWZpWGJxUzBQaWxL?=
 =?utf-8?B?cVBpdnFSTjFRZnJZV0pNM2g0R0tWRTVUZnJ0b05VbXhScTl0bWpYa0tVWm1p?=
 =?utf-8?Q?4ZptylNgjolTv3Vh1ZRJSkhuI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fb5936-d26c-42ab-2b20-08dd76dc17f0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 20:29:42.6893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XMOt68gdIO977m+0aVKH0BzfzhraUB7nhW/wqrC76ZZrQiE1BkusPkEH/03Gp7x+u6ZVV7QAJoM9nDEKqtcCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9141
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

On 4/4/2025 10:12 PM, Kevin Paul Reddy Janagari wrote:
> warning: Incorrect use of kernel-doc format:
> * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
> 
> Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
> ---
>   drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
> index 4c95b885d1d0..c8eccee9b023 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
>   	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
>   
>   	/**
> -	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
> +	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
>   	 * path failure, retry using legacy SW path.
>   	 */
>   	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,

Thanks for the patch!  But FWIW this was already fixed in this patch 
which is on amd-staging-drm-next now.

https://lore.kernel.org/amd-gfx/20250319111243.14206-1-dominik.kaszewski@amd.com/
