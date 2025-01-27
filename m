Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABCFA1DA4F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 17:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD7E10E57B;
	Mon, 27 Jan 2025 16:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DaXru6ZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2049.outbound.protection.outlook.com [40.107.212.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E12610E57B;
 Mon, 27 Jan 2025 16:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrAdwOVRX8r7wzZfKMtwpjgwAz8GZQYZ6d/Ktg0SzqQS4tYrbJGlHIr90P2NUu2helm8Z9JW5dm38bieaVoO4rkl70N5LorQhVWyTwXlVm8gXOXNy/b43IedjmjCsilAUj7QjT027ydvXAJWIXOYkwP+P70aMn/D+6jdKE0Xg28Bk1umR7sQDEHLcyCxAnk6XPn0pJ/tO3ZWrXH5yjEx2kgGbaMRU8l9aIhc0J8ytEo+Jnu9jvX20bv/ZPE/gn77rl6EBfM8wuclGpx34wEw1cGPNXilnZQAMSp3W1tdtzkvnw0A2NEfy2lNFpggmGtNFCD8BtaZoYy26mDIbSkOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkQXGotuVUYtPLBjOX+bwCXUmO8qIGkRJcta5DGJtrE=;
 b=m4MdoKIFUtVg4x31Ynznj/9zB+FPD/cz+6vN5xSF2LRHY0JcHBShaxVVpu+Sx1mUlFGWJ+YuOnrLv4Tnw3+9lYPA8KKiBYHPN2ZOoFdwpVhfoklQ59gL9oq0esv5kHcZ433WNJZGVIFlegLMyVxsUTqpUDCnCC0TwfHL2IFy7U7YZmu+NkiojRO5kpfQpSbHbSA+1MKOF0BkEUDge0tGIzf35I3jegDSFGwpkbUWKaBmC7ccdkPDziVgPCarA0XaFJptI2pI+UMVvWXgkhlJh1+ed9k5ye7xRZGKZkc9tvEiWZFUvqcZZF+6Kc6LQjGyF4HzFZfVhv9LmpVBcmAKaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkQXGotuVUYtPLBjOX+bwCXUmO8qIGkRJcta5DGJtrE=;
 b=DaXru6ZJWFQMDwIL5zrbT7L1zQ/3vZihRwrHWTXLn3UrPcOENCNW1mPGIBla7CAVyzgyOQk1Oa0IVFEd8bhq09qqNZvf9rhEfwIp6sRnSM+FxIkUfHu5Inm2uGcjaRh1XWkRk3G1Q50RRK0q4Dgnz59tLgVUO34wY483sPwdWRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8130.namprd12.prod.outlook.com (2603:10b6:806:32e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Mon, 27 Jan
 2025 16:14:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 16:14:32 +0000
Message-ID: <280a3079-d213-4892-869f-004776fd90d0@amd.com>
Date: Mon, 27 Jan 2025 17:14:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: restore wait-free fastpath for GEM_WAIT_IDLE
To: Lucas Stach <l.stach@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250127160258.289035-1-l.stach@pengutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250127160258.289035-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 3523746d-c71c-4922-1981-08dd3eedaf0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MS9yZkJpUytYOTRoQjVLUTkwMzJEWE1JK200SjFtM3laV1FUK1hpZjE2d0gr?=
 =?utf-8?B?bjRCUVd3OTV0U1g0T2haYUNvSmtvaUhocFlGbVRYOW9UQk9lOUZaajdDTVNt?=
 =?utf-8?B?UWVndkFTN2ZpRWlhUTUxS1IzQWY3VTk3Y21ySTdFNnl2UW9jQzhpSTJObHhi?=
 =?utf-8?B?aTUzYTNYU0xpL1NKQ1VVVDdwVEtxYXBESTkzSXhnZjdhYmVFT05zTWRJeDhF?=
 =?utf-8?B?WFp6S3B4Q25GRGJBOEJlbjU4VmRCZWRmdmxvU0RieFIwR24zUWRWT3I5S0pO?=
 =?utf-8?B?QjJJampaOHA1SlZMQ2JFOTVpdXB1N2ErSmUzeVJvTnR1ZFhKYVdCdWRFaWtF?=
 =?utf-8?B?U3puUExOZFZpYXIrR1d4UkxLMmpaUE5DU2FLMTBrdjhjdVlHbGhRUTV1Nyti?=
 =?utf-8?B?eDd4ZCsxaDdOUXBvUExlYm56a3phRlVLRW5OYnR5S1FiMGt6WWE5eUdpemhQ?=
 =?utf-8?B?aFg5c3RtZGFjV0p2Lzd5WGdpUU9RQ0c3SmVzY3JRVXo0NWwvZGlWcGdjOU8r?=
 =?utf-8?B?dzFUMGs5eWlXRjg5UVlzSVJRNHpkbTRsbm9LZFAzeWdpbm9ZVjJzRjcyZUt3?=
 =?utf-8?B?c3Uwb1o2VUhBMmRQU2xpUmNFYkJxRE9Oalk2ZVV1NTdqZWp1MWdBMDlLUlNK?=
 =?utf-8?B?Q0ZCOXdHNHZyaWFOWk1zNEJMWHNjRWZkQktnSjB5alR4bXFoQnd2dm1takZr?=
 =?utf-8?B?Ums1ZjZBOE1XQ3RNTUZJUkVLMjNHZmxhbUpNbU14REJwZWN0bThoWlZVVmJK?=
 =?utf-8?B?S2hzRGNEOVhDb1IwTFVGZzh6M1Z4SzBzZ01Wa01lVTM4TUx3WXZvcHBlUEl5?=
 =?utf-8?B?RlllT1hWQWdjK3VEbWIvNzBLQUdMbSs1ZTh2a0xZeDNNVGlQV0s0U3NsTDZC?=
 =?utf-8?B?U0xJOUl5VFdFaDloY09oMU41UHpZWkVTUThjU2xmS0tid3VCZmxFMldsL2hO?=
 =?utf-8?B?b2xkVDZxR0lCeHJTdGpKbi9ZWUNOR0doOFBkMEpXRWZaVlR0bTRPUEEydXBs?=
 =?utf-8?B?eDZIazRhMllUY1ZhcFlrR015cDlubGoxVW5IajUwVHBrblpEbUFDMjFnc29t?=
 =?utf-8?B?SmNhL2ozWHRBeVNiZitVNkZHanVDaHZvQ3Z3QkNSU2xZYzJGS0oyT2JXQ3da?=
 =?utf-8?B?akNweGdUcmNOOFVTVG5pUTNvVXllanVlTk9oNjVaRit3VC9aVmcweFR5N0pK?=
 =?utf-8?B?emFKdWwzVHd5T095aFZnQ0dSMVJDeEEvcVhWMHk4bVF2bzFxRmVzTjIxTmFZ?=
 =?utf-8?B?VWpSWE9hU1pnSVNHSWlrNzN5TkRLV3lWUUdsTFZTaFRzR2M3WHI4OSt2VVA0?=
 =?utf-8?B?RWVlVy9hb3FQc1ZTOWVMNzAyQjJrcUZOdUF4Qkp0cXBhd0d2Z21Ldzd3aUht?=
 =?utf-8?B?QllDTGlKaHlyZFpjbnQvdzRXcGlxcjhtTmFVZVlreHFaUlgxNkU5dmc5OXVt?=
 =?utf-8?B?RDBEd2lHbWNJdUE2YXhUcm8xOXpxSVpOK1J0YUkwOFF0dlkyaEJTa1NjeVBz?=
 =?utf-8?B?aWl2ejg0OSs0VWE3T2dnYWFqdmlseGJMTWFjMUJudWhCT3ZzaUo5ODEyeStP?=
 =?utf-8?B?MVN2RkRrdDU4V0lxbnBHalFvYVVmYTdWL0hpVzhlZU90Q2l3b29tSmc0UGVv?=
 =?utf-8?B?em9qSEJCeGtweUFaTWVyVy9lbEl4aVlmZFpCNUF1VHJscXY4cU5zS1Z5RHZN?=
 =?utf-8?B?Q3JDNVRtVlo4RWNkTVVFMGpsdExmdlIwNmNxaTRGNjlPNkdydmoyTVY5d1lx?=
 =?utf-8?B?WDVBbUpVRHYxWS8yaTJGVEc4eUx4WThxbTQ2VXUxVEloZVYrSGhqakNQL0pt?=
 =?utf-8?B?NnpjbE1MSFZZeUZZNm91QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGlyS3NqUGJkMG5lUTFpQjJ4ZHE2TU9obkVPV1VUS08wZ2Q3RFk1UVdCVzdR?=
 =?utf-8?B?dkVVcEMxTVBRRnRSV1hVcnM0OFphYi9GQXJUaEJvUGVseWRQQVlWdG9BQ0tB?=
 =?utf-8?B?eCsxWnR5K0dLdm56REhmQjk3aGQvc2FTNk1ZNDVVdmxMa2lwTWdPQ3FneXBM?=
 =?utf-8?B?VEMrSmVpSUFsdVJJV1Eza0plUyswRTNVMkRYUWRIUWJHT1FGS2RNY1hKckRH?=
 =?utf-8?B?Qi9hOGhMTDR3OGN5M3NsQTdmdzlXR3ZnOTVTM0FMQmE1OWZ4RGNhQTgrTE1O?=
 =?utf-8?B?aUZHNlYwTnZ1ZGxLVU5YbmlHRWhmYWRhMVhsZ0RvdktxU0J6SEgzSFhtWEZI?=
 =?utf-8?B?M1VDcmVKMW9QNlE1WXZRTzBPaU1OZ1MrUlZySUlwMU1WdzZmYkpLMGNrcUQ3?=
 =?utf-8?B?ZWVXelhYM3lyaWVoK21sWk05WEpjcHhkbVgvc0xOT1Bpbmdwb3haM0l3bktR?=
 =?utf-8?B?TFVHL3FPRUZuMWpQZGZPVDFxV3YxWk5rTVlseTdldzhrd0hMNm4rVmtkQnZJ?=
 =?utf-8?B?bzlBZlo3RDBmaFNJTVRiNXRDUnVnY2I0WUlqQlVFY0IzNFdBSGlOQzlZcmxx?=
 =?utf-8?B?bmVlS1NmWHErdGlUY1dTODhtczhHU0JEQWVYZC81OW5HYUxUTFZDQ1ZEME1D?=
 =?utf-8?B?MHpmN3dmUXRST3lkRTZwOXB4TTNQMlRobGJVVGNvcXNoK1hZRXdTS1ZDQnBH?=
 =?utf-8?B?RkxQcmFiTXA1YjNRazlyQnlRdVBuM2d0anJLNWVsc2J0K2lVSCt1Qm5hMjdN?=
 =?utf-8?B?cCtRZ05zQTV5TldqQVQxSjRoUktseW9aTXFwK0Qrc2luSDMyYk0rUnpzQ2hT?=
 =?utf-8?B?R2tLNVFrMDR6YS95TzRuWkZGemhEekpneFRwcVBJREo4ek9GMWNZZmRYRGo2?=
 =?utf-8?B?U1R5M3ZzbjVoUXRzWjJCMEliM1ZUNk9Vd3JENEFjL282WENBRzdXdkpmdW9k?=
 =?utf-8?B?OWFTL2srTVJOejJYSlVqdENaNHNFSy9zNGZqcE5iaVIySFV6TTQ0K2xSK2t4?=
 =?utf-8?B?VjhTVE8yQ2V6QzBFNS9uQW92d2xpT2g3Q2hhZnVxOG8xcENmSzVVQTNUWDdi?=
 =?utf-8?B?djJXN3l5NjJEY1pwR3pVaEJVWE11R05DU1hQeWgwYUJIOHBrMGlZZStDTjQ3?=
 =?utf-8?B?cUZXOUx2d3k1VVFaM0FMbDdYbjRwQi82SzdhcXNZSGVMR1drcDFKaldWT1Nq?=
 =?utf-8?B?STNWKzgvNkVNVkhVUzdDVFpLUzhPNkVFcDgraitPcmYyV0wwbTNUMDBMeFpT?=
 =?utf-8?B?ek4xakxUbkYvdkVtYXBBMWY5TGRhKzc4YWpwaEd4U3lWVGRFQlV2cG1ySElr?=
 =?utf-8?B?K1FHUVZNMCtWbHdhMnV6eWhpZjdDc2tuOVE4VC9GN05VaXE3ZW5USk1vTXJY?=
 =?utf-8?B?TkxEaWNUd016L1drVk5wblFHbTIxK0N4ODBtV0FCSnRDTFNRcGc5VjUyREhE?=
 =?utf-8?B?QnJIWEJxWTdEMEV0L3hVenhBWUtrMWxqVXowVkRYbll2VDFmWFN0bTduQzFw?=
 =?utf-8?B?azRLZnhEMXdoQ1FELzN2MVU5RFR2WU9nc2pSSjNPeFdLelBUQ2RDTlRCanYy?=
 =?utf-8?B?UHVMMzVad3NSVFVnVnpCbUhjK2xhZHo2UEJXbUQ3MmVIZW9CUHd3bFJyK285?=
 =?utf-8?B?b0k0TkFRTXZEWTI2aUdRa0o2RWdFRDdoSXNoNHp5WDlmZnBUbDhGbU9SZS9B?=
 =?utf-8?B?NlF4WmZHUDZ3bUxGMnZaREg2UTBJSjVsejZmbmh3NzZIK0U0QmlxYzdBYlFE?=
 =?utf-8?B?QVN6eFB5cnlvM1B3SG9KckhudURSa3oxREtFOW9FeEVLcWlaRGxUaHhnekZm?=
 =?utf-8?B?aGNSUDdDUHFjWHk3akMrK09NN1k2MURnOTJvNi9VRHZYMEZkcVF4Q09CTzNu?=
 =?utf-8?B?b0ZseVdaMVlhNE9PRGpvdmRoQWtTeEZpSUhVdUxUakMxQWk2NmlrckhXcUQr?=
 =?utf-8?B?alh0UHNydmNpMko3R3BZUXZudXlrVm9iVFVIYThUZ1VZakhaVnRCWXpUdG4v?=
 =?utf-8?B?eHhrdWVrRFVJT1FxbVA5YnY0ZVpxNzg1YW9FNmQxQVRYZnA2ZjhrdVppaUdR?=
 =?utf-8?B?L3l2L2EzSEdqL3dDN2NFRC9GWXRkellmUGNtSlJZNm5UYkt6V2FkVVRxRXVw?=
 =?utf-8?Q?u/qcSyjBBNXQhGh+r1LMqNUyA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3523746d-c71c-4922-1981-08dd3eedaf0f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 16:14:32.4804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjQKTaTPmr+1ZQAtbP9NHgrrjItZp6pt8xfj0rineg5BorAE2s1hbsYOJ0Xcw8QO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8130
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

Am 27.01.25 um 17:02 schrieb Lucas Stach:
> This effectively reverts 0fea2ed61e7f ("drm/amdgpu: Remove call to
> reservation_object_test_signaled_rcu before wait"), as the premise of
> that commit is wrong. dma_resv_wait_timeout() without a timeout will
> not turn into a wait-free dma_resv_test_signaled, but will wait a
> jiffy for unsignaled fences, which is not at all what userspace expects
> when it calls GEM_WAIT_IDLE with a timeout of 0.

Marek pinged me about that strange behavior as well. That sounds like a 
separate bug in dma_resv_wait_timeout() to me.

I don't see why the function should be waiting with a timeout of 0 and 
we have multiple cases where that is assumed.

What should happen is that dma_resv_wait_timeout() should return 1 when 
all fences are signaled even when the timeout is 0.

My educated guess is that this behavior is somehow broken and instead we 
wait for at least 1 jiffies.

This here is probably just the tip of the iceberg.

Regards,
Christian.

>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> This is most likely the correct kernel-side solution for the unexpected
> slowdown worked around with in userspace with this Mesa series:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32877
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 1a5df8b94661..75b5d5149911 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -567,8 +567,13 @@ int amdgpu_gem_wait_idle_ioctl(struct drm_device *dev, void *data,
>   		return -ENOENT;
>   
>   	robj = gem_to_amdgpu_bo(gobj);
> -	ret = dma_resv_wait_timeout(robj->tbo.base.resv, DMA_RESV_USAGE_READ,
> -				    true, timeout);
> +	if (timeout == 0)
> +		ret = dma_resv_test_signaled(robj->tbo.base.resv,
> +					     DMA_RESV_USAGE_READ);
> +	else
> +		ret = dma_resv_wait_timeout(robj->tbo.base.resv,
> +					    DMA_RESV_USAGE_READ,
> +					    true, timeout);
>   
>   	/* ret == 0 means not signaled,
>   	 * ret > 0 means signaled

