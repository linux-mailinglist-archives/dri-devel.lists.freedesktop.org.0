Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644959C6ECC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 13:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C49E10E237;
	Wed, 13 Nov 2024 12:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2xPynM92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0BB10E237;
 Wed, 13 Nov 2024 12:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4jOTekuw2+dBfJVE897rz0pr/6gjAKdBSlFejyGEHiQwqdNglYFiHO5T+dPh96BrFQVfM3bxcfLc5P02vPLH8RXqA+rBRUHHgTUmQCNLjmZeMOLR2Vlow7A5SN0CT/ik2uq3fY7266BbecXR1u861I5xiHw6NKPMFW8Jo18rFj4d1a1FEXyTrZhWRRp0fU4ztJHUEnm09EKqQw4jZyyoVmcIf+rEcF4g0sIZjCGrSCM1SneJqZGYxpcX0U3OUvVwX/+DxjNY3aOul7chKDYD2vbu+eo+ZGZ3Wy4DFZpJ0h2Tn/QzcMZkKOc5LjpRx4OlSIZeRNQf9q7h92lL7FcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtVosDZ5arpUAqZw1lSIq+Q38cbDsXTVoOQ2WeRWc+U=;
 b=vDtxzB2+WsgBe77d9u/WrQ8IsLT7fk+DXrB9A9rdrUx62lQ4ygctDVQ2KyISW2MQS3pe7meYP3TWhev88focqiV0mWHuvZco9PSh6ZDZ+9vVXeOTsiUlguURtQfO7Si3D9S/Cir+Oq6uZc6Ou9A/XNe6egaPW8A6s8fEMc+on8Y9WXHnxhMsxxE8PDQuOdszcX6Gre5bb65dsJfX6j6bd0Wy4/3E+JO0d/05ulIP2ApseWlfBva4QzToAGh319A9XtgaTgoPoDpu4L6KANRPOiU+vNqbbpCtZuh3787lbC2Sot1pqLbDnu4eXc9zjIbqlb4DLRDWWRqnWIjJPVKLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtVosDZ5arpUAqZw1lSIq+Q38cbDsXTVoOQ2WeRWc+U=;
 b=2xPynM92jFkgYrAmpdYL3IQAqycTEg5kYgDrXR2q7K4GjyP98cy66xPlljyy1U1UHhrwrywLz8UohAca0KWYIE6UoLdZs6P3M6oYiLJvjGUUhdNhKl1SWGIGIr45mBc9dJ7QxlEVivMYadwNTd6t5w0+Tcf86/4hWyS7L9H17+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7951.namprd12.prod.outlook.com (2603:10b6:806:318::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 12:13:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 12:13:37 +0000
Message-ID: <7615f2ae-2563-4939-934d-0b02e3f2d10e@amd.com>
Date: Wed, 13 Nov 2024 13:13:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6.1] drm/amdkfd: amdkfd_free_gtt_mem clear the correct
 pointer
To: Vamsi Krishna Brahmajosyula <vamsi-krishna.brahmajosyula@broadcom.com>,
 stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: Philip.Yang@amd.com, Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, vasavi.sirnapalli@broadcom.com,
 Sasha Levin <sashal@kernel.org>
References: <20241113121030.2405520-1-vamsi-krishna.brahmajosyula@broadcom.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241113121030.2405520-1-vamsi-krishna.brahmajosyula@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: c27749c7-2d1a-496e-aba0-08dd03dc9a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEQ5Um5SWjA5UkpZUG9GN3pXd3ZwMUNydnlvVkljRDhaWG1CelVDSHdhdzJu?=
 =?utf-8?B?SXFuazNiSWV2WWc1cEg1SmpNUDJnTzkrMDV2KzY3OHpRRlFTeGt5a24wWGRy?=
 =?utf-8?B?czJXMHFPYXZPOVZYWHVycDNsaVRlektpUUNkQUt5UDBSS3ZDMHE0a0ovYVJv?=
 =?utf-8?B?SEtaMVBSMVUwOEJJU1ZsZGYxaHk1SmE4OVpGcktwdGtxNG9yNCtiMk85S1ZQ?=
 =?utf-8?B?SXk2V1hYbkRsNDM2OTFYOVN1YlhFOG4rK2ZBTWtsL1VHZEJGYjhyQmhuRm9j?=
 =?utf-8?B?SktuYzhzeEZFTmo2TXF3SUdlKzN5cXlQeGJFcVdWOXFINGFUNjRrYXNIZnZa?=
 =?utf-8?B?MFdaNHZpZ3hQdmgyWmdJNmYzZGpTWDVtQjBiVXZ3bk0xa2VlaHFZenVXaVVK?=
 =?utf-8?B?VEhqdjNieEdpN2dJVHZsWi9MQlRQbHdEZnlSL1BkSjJpWk91QXE3S09PWWVS?=
 =?utf-8?B?Q2cxUTk1Wk10UlozYjRzb25QUXJXbTFQYzNnN1RpVmwwWmhTb1RtWUt5WFZw?=
 =?utf-8?B?Tkp1V08rV3ZvUWxYbWVJZTFlQnFCTXNWMWhoMHAxQTU1Y09VSnArbS9RdnZp?=
 =?utf-8?B?WXFvT3oreG5mUGVma1Vma2NrdE5qaHJkM3Vvc3hob0hKMGpLOE9ZWEE4QlJx?=
 =?utf-8?B?RzQ2RXluNmJESW5NMjBUejdObFR3WUh0VDY0NFJ1dHhYaFVJZUVkVkFQNFEw?=
 =?utf-8?B?cHNiVXlMRHhobHVMVElxT09zTW9XWTVkSmVGL0N1ZXBHdTdxNmpUQTNnRFEz?=
 =?utf-8?B?a3UyeGpTcmN2VGpMN2NNblJOR0ZUK0FBR1FnZklheHpQUmhaRVFVQTk5K1di?=
 =?utf-8?B?L1A2dThmdDExeUlJQVJ1N0J6c094b3lzQjByYlh0MzFxTHl6dnBXejdSa016?=
 =?utf-8?B?bmxsK0ttTWxrL3NES3MyRndJcUhkL05lVnNSQlFLTFdBS0pyZDBhRkp1RXo1?=
 =?utf-8?B?MVlmWE5VTFo2RFF6R1MyaE4vcmhMeUVKbzJoVng1ZURIQW5YYVpldVNzSTJh?=
 =?utf-8?B?WHkxUlRKNExrY2FIUjFTNStCclJycGtDTW0wdkl4YW9MZGxWR2l4ZlZFWVpZ?=
 =?utf-8?B?QklnaW91c1dValFlVXM0VU94NEY5eE9RdDVjcVZjaTExQnZCQzloY0RHZlBv?=
 =?utf-8?B?MEFCRDg5eWZJbWdiMEhFMVBTT09IeHZqVmRTUDRRWThFdzg2MWhid1lUQ3Nt?=
 =?utf-8?B?U2xUNmQydzZ4S2EzZW9MRXFXVXBIelJHUFpHVE00V3cxcjFvTlZwWEdvMmJj?=
 =?utf-8?B?cDIrYnN3S3dGcjVWS05RRlpjV0p2Z0t6bWNnN0NVcWMwV2NaOEI4WURSRVFD?=
 =?utf-8?B?dEI3UHdxQWxpUW94dDA1eEd0MHA0YkZUc2JMVUtDQ0RjMUg1LzRkYXVycytR?=
 =?utf-8?B?eGY3M082ZUhyRjlRcFJIOVp1THl4eWtCQ200YmNUNnRQNUdaaE5EWkNVS3VV?=
 =?utf-8?B?cjdMbzBtMW1OYWtnZmNCOVVZMjgvZ25SS3NpS2VlMDltUjJYbzFtVURnZlFB?=
 =?utf-8?B?dS9PamJrRkFTR3ArMkpWL1BUdnl1Q3RvQk4vNEduWDFFeHJxMHlCSFRQdTdv?=
 =?utf-8?B?SmRtb0l3UlpMbFl2UE1venlPRGxtVmxrUUp2VW9CU3dhU0ZkeHZwTXJUQis0?=
 =?utf-8?B?bG1hWkd4U3RQa200V044SmtiMEJkWXJkRnZxZzZaVks3YWtwM1NFaDRva3Q0?=
 =?utf-8?B?NENiTnRDTmxuZmZWZU1pVnEyL2llOXpRRE0zUEZTTUZvTHMxa05aMnNESklp?=
 =?utf-8?Q?pEVhA1IRiDLmfOW0Rc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emxRZzAxNy9neHZFZ2JmN2x0d25La1JOTitveDVuZklwTDRyQUxuR1JmL3ZI?=
 =?utf-8?B?Qld1YjJmRTFFdDM0V1dVV3hkUlozQUl4aVBlTm1yQUZFMzBaaUl5M21LZ1Fh?=
 =?utf-8?B?SEVJbWNPZ2VweGd3N0huUDkxRXV6SXRPN2x4WmJXNnE1ZFFnSFVmZjlqRVg1?=
 =?utf-8?B?T2VTRWYxTVVwLzZVWFc1QW94TTZiekdkNk00d2NBM1cvZmRaZWh4ZUtPNkFx?=
 =?utf-8?B?UUhEL0VnMnd4N2Jrc1VVb2VFVnhxWUZoUnpwZWNQSDlMZC9yem5GNmxUY0JE?=
 =?utf-8?B?MTJGbFd4NVIrcldnY3pFdzdvUjArZGtXN2s3QU8vRnd1ZzVYcElxd1FCRzlQ?=
 =?utf-8?B?QmxsUXVoZXkvRHlkWUNKaERQaU9oZDJtYktubmw5OTFZMDZMSHpPcEE3M2k5?=
 =?utf-8?B?bWJCcUNDR2hjTmFsdU84WmR3ZW4rK1kwYWNOaGVqZVVGaDZ3SjIwM04zc0pi?=
 =?utf-8?B?aDdCSlNXWCtrb0N0b2VyRHdySG1IMEZJaXZIMXZiV1B1T2h2S2hrUFVFOHc5?=
 =?utf-8?B?VGl1aC9TQjRFUDdXcllDK25ZN01NRmVxTTRDQlFYRVlndGJidjNQZVhsNnkv?=
 =?utf-8?B?aGNVaXN1QUlxekxscmRrU0pnVDVsVzZ5K2ptNE96VHBQNytUc2t6b21sNER0?=
 =?utf-8?B?Y2FyMlhUcTU2SVlHSHZ5NFkzK2U3TGt2UUVFNGZFVzlUQVNoZGs5TytnOThn?=
 =?utf-8?B?UFY1dWZ6YVFXVHFtcVNCZTQ0WG1jTUh1N3JPYS8zQitaK0pkcmlnbzlFODZQ?=
 =?utf-8?B?WENhNStYcFhkWVJuOWh6ZEhLcC84L0FnQldYN3hCN3VBTTFsb2xncC9ScklD?=
 =?utf-8?B?UzFJVWkvN0NxQWE0WGZTNklnRytqMnNmZFdQWkU5QWwzQUczZWlKd0YvU3p1?=
 =?utf-8?B?SUpkNzQvSUo4cE1ML0g3WDQ0TmNyZmUwcnVyMnZDWngxR1ZVeVFlK2RFVDEx?=
 =?utf-8?B?MnJvMWpLL0NzUE03ZHVsTXZScXJTS1ZhdkMrUkxSSFpkWVlmZjFIaUdocGNS?=
 =?utf-8?B?VmxyV1d3eld5SlErSDQ0V3ZsUk5pS1loNUV0OGdKZDlPVmlnQzdiT1pIdkNU?=
 =?utf-8?B?bDh4V1luV0pNUzY1SGtsOGdOdG4yTEFWSUxLdkxJb2c3R1BYQVM2eE1tcTlk?=
 =?utf-8?B?R0Z6S00yUStLc0tWM04zUVEvNFkvejRnRVgxK2t2YmMzdlY1aW5McElwUkd5?=
 =?utf-8?B?ZndwdDRiTjZxc1pBZHE0MU1SekNJTUlEUWphTjRCQ3dkeU9oR3d3RGdUU3JD?=
 =?utf-8?B?Q05ZSnpCTHdMVnV4RUtGTW1JWWtaN1hzK1pwN3JzTzF1V0RxZU1tb2lPbE5V?=
 =?utf-8?B?STAyMGY2aktGNXMya2VocGFSTytuWFFtWFBWL2k3Nk13Rzc0aHBjeDRna0dr?=
 =?utf-8?B?ZGhoaGJScjEzc1lzYmZvSXVmTk1TbU0xUXJSeFdMRE03VDBpT1JCV0dSbnll?=
 =?utf-8?B?czlFOFk5UU8wMWZ6dEdqVDQvcmFXYWFySlRsalp4RUxDa012S3M0L1NKSjZi?=
 =?utf-8?B?VkkyR0lVMHpyTkMzNFo0Zjk4ZHdseTBudldSUFkxbmF5RHdRVFludCtwS3dH?=
 =?utf-8?B?VHErdk5lWDZmVXFIKy9sdXRyRXFHZHZ4ZHAvUkdKRmd5MkFoeC9Wd2drMjRa?=
 =?utf-8?B?SjJLK1JxcElUR01UTGVQYjZmb3h2MGNXdm5KYVIyQ3BhV2xuUzdtN0p0S2RT?=
 =?utf-8?B?a20xYUFmbmgwNWtMelovYkR6cTIrVTdKRzJXWktQbHp0VEpjdFp5RkQ3dE9T?=
 =?utf-8?B?bncwN1VJUVQ2NDliaWhJNysyMGZtM1hXamdKYVBXZElYL0FBa0NwVkE4dStO?=
 =?utf-8?B?TFJ1R2hpY05Ed2kxLzR5Y2UvdWhBY2p6Tmx5ZFFCZmxLWmJPZ0VqOFNSR2pn?=
 =?utf-8?B?bUlZcmNLemdqSjlFUTVReXpHdlZWbk41VXRVekpObnZXWlFqNXFmeWpvRE9n?=
 =?utf-8?B?N0JGeTJtbjBjKys2eGJkazZBWTQ0TFZSNHVsdWRRUFlqR3Ria2I4cXc0bWdY?=
 =?utf-8?B?QlhxdEJQcDAzYitHRjlyMWdOc1RKOG01ZUYrQVA3cXJpQ2ZWbUExWlhESXlS?=
 =?utf-8?B?WWhKMzVMODloYys5MFdJay8zODRMTWRSSU9qcHlPM3BBM3FSNGdwTkpzaExK?=
 =?utf-8?Q?YaHpph8sWsgfAn83Iu/tYLMCf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27749c7-2d1a-496e-aba0-08dd03dc9a0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 12:13:37.1281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pA06uvUUMysXGBZuJicMEkaaWNB1hk/VSxTOqPePb//Q+QM8GdjNB6qgJgN/ViSF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7951
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

Am 13.11.24 um 13:10 schrieb Vamsi Krishna Brahmajosyula:
> From: Philip Yang <Philip.Yang@amd.com>
>
> [ Upstream commit c86ad39140bbcb9dc75a10046c2221f657e8083b ]
>
> Pass pointer reference to amdgpu_bo_unref to clear the correct pointer,
> otherwise amdgpu_bo_unref clear the local variable, the original pointer
> not set to NULL, this could cause use-after-free bug.
>
> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
> Acked-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Signed-off-by: Vamsi Krishna Brahmajosyula <vamsi-krishna.brahmajosyula@broadcom.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         | 14 +++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  4 ++--
>   .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  2 +-
>   .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  4 ++--
>   8 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 5d9a34601a1a..c31e5f9d63da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -344,15 +344,15 @@ int amdgpu_amdkfd_alloc_gtt_mem(struct amdgpu_device *adev, size_t size,
>   	return r;
>   }
>   
> -void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void *mem_obj)
> +void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void **mem_obj)
>   {
> -	struct amdgpu_bo *bo = (struct amdgpu_bo *) mem_obj;
> +	struct amdgpu_bo **bo = (struct amdgpu_bo **) mem_obj;
>   
> -	amdgpu_bo_reserve(bo, true);
> -	amdgpu_bo_kunmap(bo);
> -	amdgpu_bo_unpin(bo);
> -	amdgpu_bo_unreserve(bo);
> -	amdgpu_bo_unref(&(bo));
> +	amdgpu_bo_reserve(*bo, true);
> +	amdgpu_bo_kunmap(*bo);
> +	amdgpu_bo_unpin(*bo);
> +	amdgpu_bo_unreserve(*bo);
> +	amdgpu_bo_unref(bo);
>   }
>   
>   int amdgpu_amdkfd_alloc_gws(struct amdgpu_device *adev, size_t size,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 4b694886715c..c7672a1d1560 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -210,7 +210,7 @@ int amdgpu_amdkfd_evict_userptr(struct kgd_mem *mem, struct mm_struct *mm)
>   int amdgpu_amdkfd_alloc_gtt_mem(struct amdgpu_device *adev, size_t size,
>   				void **mem_obj, uint64_t *gpu_addr,
>   				void **cpu_ptr, bool mqd_gfx9);
> -void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void *mem_obj);
> +void amdgpu_amdkfd_free_gtt_mem(struct amdgpu_device *adev, void **mem_obj);

Why is that a pointer to a void* in the first place? It looks like all 
callers should work with an amdgpu_bo object as well.

Regards,
Christian.

>   int amdgpu_amdkfd_alloc_gws(struct amdgpu_device *adev, size_t size,
>   				void **mem_obj);
>   void amdgpu_amdkfd_free_gws(struct amdgpu_device *adev, void *mem_obj);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index e3cd66c4d95d..f83574107eb8 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -408,7 +408,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
>   
>   err_create_queue:
>   	if (wptr_bo)
> -		amdgpu_amdkfd_free_gtt_mem(dev->adev, wptr_bo);
> +		amdgpu_amdkfd_free_gtt_mem(dev->adev, (void **)&wptr_bo);
>   err_wptr_map_gart:
>   err_alloc_doorbells:
>   err_bind_process:
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> index 27820f0a282d..e2c055abfea9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -673,7 +673,7 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
>   kfd_doorbell_error:
>   	kfd_gtt_sa_fini(kfd);
>   kfd_gtt_sa_init_error:
> -	amdgpu_amdkfd_free_gtt_mem(kfd->adev, kfd->gtt_mem);
> +	amdgpu_amdkfd_free_gtt_mem(kfd->adev, &kfd->gtt_mem);
>   alloc_gtt_mem_failure:
>   	if (kfd->gws)
>   		amdgpu_amdkfd_free_gws(kfd->adev, kfd->gws);
> @@ -693,7 +693,7 @@ void kgd2kfd_device_exit(struct kfd_dev *kfd)
>   		kfd_doorbell_fini(kfd);
>   		ida_destroy(&kfd->doorbell_ida);
>   		kfd_gtt_sa_fini(kfd);
> -		amdgpu_amdkfd_free_gtt_mem(kfd->adev, kfd->gtt_mem);
> +		amdgpu_amdkfd_free_gtt_mem(kfd->adev, &kfd->gtt_mem);
>   		if (kfd->gws)
>   			amdgpu_amdkfd_free_gws(kfd->adev, kfd->gws);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 1b7b29426480..3ab0a796af06 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -2392,7 +2392,7 @@ static void deallocate_hiq_sdma_mqd(struct kfd_dev *dev,
>   {
>   	WARN(!mqd, "No hiq sdma mqd trunk to free");
>   
> -	amdgpu_amdkfd_free_gtt_mem(dev->adev, mqd->gtt_mem);
> +	amdgpu_amdkfd_free_gtt_mem(dev->adev, &mqd->gtt_mem);
>   }
>   
>   void device_queue_manager_uninit(struct device_queue_manager *dqm)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
> index 623ccd227b7d..c733d6888c30 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
> @@ -204,7 +204,7 @@ void kfd_free_mqd_cp(struct mqd_manager *mm, void *mqd,
>   	      struct kfd_mem_obj *mqd_mem_obj)
>   {
>   	if (mqd_mem_obj->gtt_mem) {
> -		amdgpu_amdkfd_free_gtt_mem(mm->dev->adev, mqd_mem_obj->gtt_mem);
> +		amdgpu_amdkfd_free_gtt_mem(mm->dev->adev, &mqd_mem_obj->gtt_mem);
>   		kfree(mqd_mem_obj);
>   	} else {
>   		kfd_gtt_sa_free(mm->dev, mqd_mem_obj);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 5bca6abd55ae..9582c9449fff 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1052,7 +1052,7 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
>   
>   		if (pdd->dev->shared_resources.enable_mes)
>   			amdgpu_amdkfd_free_gtt_mem(pdd->dev->adev,
> -						   pdd->proc_ctx_bo);
> +						   &pdd->proc_ctx_bo);
>   		/*
>   		 * before destroying pdd, make sure to report availability
>   		 * for auto suspend
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index 99aa8a8399d6..1918a3c06ac8 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -441,9 +441,9 @@ int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid)
>   
>   		if (dev->shared_resources.enable_mes) {
>   			amdgpu_amdkfd_free_gtt_mem(dev->adev,
> -						   pqn->q->gang_ctx_bo);
> +						   &pqn->q->gang_ctx_bo);
>   			if (pqn->q->wptr_bo)
> -				amdgpu_amdkfd_free_gtt_mem(dev->adev, pqn->q->wptr_bo);
> +				amdgpu_amdkfd_free_gtt_mem(dev->adev, (void **)&pqn->q->wptr_bo);
>   
>   		}
>   		uninit_queue(pqn->q);

