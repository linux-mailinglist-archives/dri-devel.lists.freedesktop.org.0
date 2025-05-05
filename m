Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6415BAA9B71
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 20:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA8410E430;
	Mon,  5 May 2025 18:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NbDblfGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776F110E100;
 Mon,  5 May 2025 18:20:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlVc6v8dv7JPrHet4y6kkZ2GuJWMV3VbCmpIQu9pjpWqcvsClhWMyyIxVAWdYYRZHzydpu7umei/4TLZvlTSKnAb5RNtHkKjAkKNV4ebPfWaUq8jw+SMCgvypDbpw1CXBSfP46/HWs7BhwxfV6sf/NpBugTuezhqFJ3y+oybt2QPW/MfMYVALrGzff6KWaDGgdnimATD44b5p1PMLmtpEpk68/RCHgs2U7Al9G42Hqvv72zTIOF4EUvgEsZKm+KWpT4e+3/QiGL8edW33L52uOW3h4I1uJrYO4l8Zk83E+n4ruNhzjF8AryXC4dZMG71iFUTRMiUdyRpBZ0g7wwVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BksRU6LgrCB3MBhywVPWR/0ZQG1GJBAdM3O0Nqrfucw=;
 b=TV+iD2UO8npXSP8nc9lyNUt2/qOk63981i6IT/ZQ8kVE7DRN0xBXkvFSIJSz2CXrNmxKZeRCo7CJ98+L97DB90Y31usWeN9Ukcn6sLdEzRol7lM+Ktnl+avonhhaFT3HIBAW+dh+biC4rcxqTut1N7eQOkmhSatF0mXGJv/VExlX7I0i/nFAqepRr4S397bAUWmDgFP9icussFGfRjBZKYlSCpHALfq+8jb7wMow+UdIviiiuGWmOs4o7QIqe6pH5rD0Und2VsLra0W2lVznUTkaPgVeWtpZfkFOz03xkdn4bzt5HsOV2fP/L6EZYRquEIKF1lPpUH7UiM57zDicBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BksRU6LgrCB3MBhywVPWR/0ZQG1GJBAdM3O0Nqrfucw=;
 b=NbDblfGUmTGEK/JUKBc9sJRMGcw1EtpX9vtUed7sXWfoFIuoQfyZQgz5UbhfHDZaAToeif97KGCEsnZiFvq25SZ3faqwvdm9EfjPqAVDFxrYJ+MQ3RFD/dqV0fIAYwuKUypTH4sRdOb5scit9QEmB2+L2MHBs62PaQrJY0iNKaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Mon, 5 May
 2025 18:20:35 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8699.024; Mon, 5 May 2025
 18:20:35 +0000
Message-ID: <c75f63b2-b562-4396-8779-145e2642b8aa@amd.com>
Date: Mon, 5 May 2025 12:20:32 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display/dc/irq: Remove duplications of hpd_ack
 function from IRQ
To: Sebastian Aguilera Novoa <saguileranbr@gmail.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: saguileran@ime.usp.br, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250503035949.11132-1-saguileran@ime.usp.br>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250503035949.11132-1-saguileran@ime.usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH8PR12MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2bff69-742c-4ba5-61c5-08dd8c01879b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SThybTVxcWlaTGJSRWRnaHp2SDR3WGhTNXZGODZNNlhCdWg0UFdWU2I0T2V2?=
 =?utf-8?B?b3FCc3dkQ1dhVVN1TTJMS1lzMU5ldFpFU1d0L2cyR0RlLzM4czBRRWs2UWNq?=
 =?utf-8?B?cVA2SkhzU25sbW4wMGFqeEszRXBkN0wrZ3ZrYmtvQStsTHJPWU5kaHJjQ0hX?=
 =?utf-8?B?S2c3Q2U4T2VaMHBYMlljRnFtdWZRMUNoUUp5UlIxRGlQTjZaRXdIWXpjZVQ3?=
 =?utf-8?B?NEYrazFGL04zMzVxVzc0d09hcWtVSGlrZlFOY29HSmQwNzhNbVFTM0dHaDJH?=
 =?utf-8?B?OHNvbjdpR3hqUVR5aWxhWk5CWkFIQTVmZHRnaVpjVVB3ZitVT21qd1A3Yng2?=
 =?utf-8?B?N1JVNVcvcWtUdWQyNjNaVTY2V0FQL1M4YkV2aHJQR3NQSnU0RDJEMzI5VlBh?=
 =?utf-8?B?MWR5YjFkeEpjb1NScDQvZnR0cGtqc3dqcWxnb1E3TVJUOG5RUndBOVVCejN4?=
 =?utf-8?B?L2VWNWlDMCtzR3Erc3h5Vm9URlR4OW1PSU84VkNCSTV5L2FqTytsTWZPaCtT?=
 =?utf-8?B?M2xNV2JJay94VTZNd3VZbVNKTlVDM2tVZnZNSmtXM0krbVJzc2k4djRKYnA3?=
 =?utf-8?B?NG5kMm4vNG9zZjlEOTlUZ0ZxTTdVWHE0cVBSTU5wcGxuUk9BaXJVaEFRbXox?=
 =?utf-8?B?UTI1dXdFVTdxaUx5RzQrd0h5NWYrVElRd1dISWk4UGNrdHZaWUVvYU1RaGpE?=
 =?utf-8?B?ZE1nTVZXbHhFSkY3Y3VQK0JXQ240SWJRVFZqdUNEOWFNK0U3TEdHSWVkVDhB?=
 =?utf-8?B?UHIrK1lQZXBqUitXSStOaFh5WFpJQVFZaVJWUXppNWUrUmgyMHlMcUk2RUg5?=
 =?utf-8?B?YTdRRk1PSjZta1pieGozOHNERFpQb0hTbkc4S3FRNDFld3BoSjhjZVhUL3Bx?=
 =?utf-8?B?YTYwZEdScy81Q0JRaWprS1RINzJGcmUwczU3bEdiSlpyelgvcUxraEQ5QW1F?=
 =?utf-8?B?S3d5YWVrYmJNdzRwYjNadVhnNFRRRDdWd3dQZGROa1NleUtrVUt1eENjK3FO?=
 =?utf-8?B?MUcxZ3l6cUJLSGJJMi8vRktyKzZScFhRb05PVVVXVXFneW4vV1h0UGt4enlB?=
 =?utf-8?B?a3BsU3V4NW5VSE1QYUhZa3pnbGxnUFYramVBSjdReHoveERhTHdEdk5RY2tS?=
 =?utf-8?B?cVNXY2VkVVE2Ulc4SUN2MW9xMGRscnA0RXRTWmtHRlphbXFrcEdYVVRjMHJh?=
 =?utf-8?B?UllKSGxKQXp5S0NjaW10K3pSOGczdUlkSU42bTlxQnA2bm9FVHhLeFk2QTVJ?=
 =?utf-8?B?QlA5R1NJRzhUMzc2LzBrVmIzK3ZMMit6K3hoT2lnSWQxdkJjQlpwYkdLQldR?=
 =?utf-8?B?QkNXWGxTZGdocmF0cXpzS2w5SnQxOEJrMHBUN0RhUXFTWWxVRGJDOGJNeDlP?=
 =?utf-8?B?MndkRDE3djluelRqYkp3RFhXKzZBYnpMZGZNS3NmaXp5S1dHVHJiMy9vNnds?=
 =?utf-8?B?S1BBZGtaS3ZsZFgyR1ZETDZCclJrQWtaWHlwRjVhRXpSaHZ1OTRHNUZCRVlP?=
 =?utf-8?B?SmJya3dsTng1ZC9oTDZWSUZxUEhyNzJRRk0rTjdiZ1FVUElJTEZ5ZEU5ZXNh?=
 =?utf-8?B?WEJvV3Z2RURBY3VPa3hqejE5bUU4RnRIS2lyaGVORDNzd0Z1T01WSlJ5OFNN?=
 =?utf-8?B?ZFEwdThvdi9yMWZSMUVwdWdidWtEcWN3WVY0c1hjTHd0MjI0RG1ENDNtLzJG?=
 =?utf-8?B?WUMyVER0YnZYa25HVm5PcVRqVzErd1Y0WVZwL3ZUalFLVlhvM2VBMGkwak9J?=
 =?utf-8?B?ZG1PeExuektsbGNnUyt0ZjJoUGZ6dVJENDJoUDZ5NVhjMmE3eEhzNDdia2V0?=
 =?utf-8?B?bHU4cTFqa2VOc0dYSGFQVEpHVlNkOFYzTG5DQVhnbm1WRkE2K2dWU2htWlFY?=
 =?utf-8?B?VCtwMzdIU3RTY2ZrUi9TSUtLekI5SEhySEtab1FrWlVackJRb1BPdHIxWGJS?=
 =?utf-8?Q?w9MszLTOy1Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZytlMXlQOHBlZFlWZGtYTzgveUtkQTdSd1ZsSSsvNDhxV1NTRHUvSmxUK0da?=
 =?utf-8?B?N1Bzb1VSRlVUREFWZ2diWVdyU2VVTXJZMmlqcHcwNUhHWlBsMEFhbytFbWwv?=
 =?utf-8?B?STlkVWRXR1lCSWtscVNjQ04wOXJONm9uVjU4ell4VzhyQm9PckFaZ0FHWTkz?=
 =?utf-8?B?VDR4K0hLcHNNcCtzVFFES3BSRElOMUZDR3lRVnY5cTVNSXFpakIza01lVlJr?=
 =?utf-8?B?bjI0cU9ORDYvZFc3V2I4VSsyUjRUY3p4QnRRUXFVWjlBaE41OVZJSWY3Yld1?=
 =?utf-8?B?ck42dVZnbzVXbExPQ0VvNHU1ZUtCUCt6ZHI0R2ZxU25pUUN6Zlh5MW9WSXAy?=
 =?utf-8?B?M3FuY3B1L29BbU1oWWlGcGp3UG1lMy92aXhhSjBxOHFPMGF6dlRwRmRyZ3VD?=
 =?utf-8?B?VUNLU3RnQXZjNDhkdi9uejh0a2lFOXRvOUpkYjZkTkFwTTN6N01TbmpMSHRi?=
 =?utf-8?B?clE3dlR2ckxzTTFGc0p2VUE5RVltMXNWRHdRM1BSZkE2SzY5MlM1Y1dNbmZZ?=
 =?utf-8?B?NlhjZ1ZzTTBDQVBFQlNUQkNnYlhobElqbWF5K0pnTTBiQ1pyQ1FxaGFUU3Zy?=
 =?utf-8?B?ZjV2YmRxdTFIZS9qRVhVOHpNbFRCb2swL2hrak55V1liSFRYYkk0VW5SMjcw?=
 =?utf-8?B?TWRCelR3MTVQdXhpRlhzeVM4Y2R2WVBlaW42TVMybzVLMFd4YU1XWjl6NWpG?=
 =?utf-8?B?bGxOVnZZOCtXaG9jYk8vU1hoeGkrcytHTXVYcmo1OXdkSUNobkRrakRnejB1?=
 =?utf-8?B?dXpuck82Wm5KQ3NZVlIzczMxQnRibE0xZlNnN1FPUzFieVpJM2liQWc4RWtt?=
 =?utf-8?B?UFphckNzdUx5VCtzZHRLd2VsdE0yREY3U25DekpUMDlwTFFrVFhLcWQ3Zjcx?=
 =?utf-8?B?NEl0cER3dm9MRHo3S1VnRGRWY2NZR1dweGZOb2w3ZElNYzdINXZSbS9EWHBm?=
 =?utf-8?B?alNhVnFSV0ptd2U3T05XYW5saWlhWXpmMnY3TFVKRW1DMTZrWXMyUGhJMEx1?=
 =?utf-8?B?Vll2ZkZMVTJIYnEzdXBuUzkwQUcyM3FsbEhPS0pxRTNDOWNtTXhyVTJ6SUd1?=
 =?utf-8?B?VHV5dVRHZFVRb1VBaG5pZzBqSUViM1dTV1NpUnIwQWJlQ2Z3MDNORG5RNnpi?=
 =?utf-8?B?UWtNLzI3SmtGb0dWK1c2dFZvS3VIb2Ric1dWVXN1VUZqeEs3U0xkeEZPQVdx?=
 =?utf-8?B?M2Z3SitmYXRqSTE1ajJtS2NUQ1V4ejN1VCtLMmVXSkZFYTNMVkRYVko0Nm9o?=
 =?utf-8?B?UktkSDJKQmt3RFIvR0Y4WnoyK2lZNjRxTllYblM3ZFE0azFiSjdSd3hxSlAv?=
 =?utf-8?B?NUJJMEpCWUlNaHdyTFVUOVFDWDlFclF0d0ZGa09OeWdIcXdIcEFYSDZNbXVu?=
 =?utf-8?B?WU9jNTBkalg4VExlMXoxMmlhdDM1d0FXV3p1WmllVjVYNncyUXV6QXB4VDhu?=
 =?utf-8?B?UnRNY1g1UVA3NFdnOW9NNGdVcmhTY0M4V1ppMFRkb1ZXUjNIdGdEQjhsWGJN?=
 =?utf-8?B?WWNYbnhhR1cwWk1ac2RtcStScXc1eDV4dGhQb3pKaTF1MTErcFpDSVFpcDRY?=
 =?utf-8?B?cWdhSmdIQzVsc0J0R2JBcHhQRmVmTjJDRHhVNUg0cFhyMU5FWkR3QlhBaTdJ?=
 =?utf-8?B?a2NDaHM3clE3blZXdkRCcXphNVpuQ25BWXZCWm1ZTzNOMkhQc01jSmxuSWlF?=
 =?utf-8?B?M1BUL2lNNWxtS3N2OElQT3FwWW9UdDFZVFlyWkhodTJ2MkJISlFOWUYvcEVV?=
 =?utf-8?B?TmlxNW1HTjNvbGg4WHJraDRwM0s2eVBpTnlNSjBPa3U2cUdwRjlVRlQ2ajVB?=
 =?utf-8?B?NGZtN3loK0lFOTlDOFBVd2NJMmMvOWtiMEM4eXRLeFRUb24wQWpFbEdGcjlo?=
 =?utf-8?B?Z0xoZFVXQVJMem5RUktxSHBXVHJpSDdSWHdMcDBlSG9Qc1ZkazFFa3FzSWlv?=
 =?utf-8?B?RjVJUU1qMDZpeGpvWVZEQ0RZdml6Z0dEaDVkYUJmR01XYXNlRVBaelpxaHJU?=
 =?utf-8?B?aWtWZEg1QW5LeFJuU1N1K3RFWFlxVUV6M0FyS0JlYmRpSGplWVk5QmFRSVJ3?=
 =?utf-8?B?RkxNUmRlNWNpeGhnQTdsbStQZUpmbGxhYU5DeEVwQWQvQ2dZN3N3TENvOUVt?=
 =?utf-8?Q?qOw40ScuC2tVLhxgUsBDvxS13?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2bff69-742c-4ba5-61c5-08dd8c01879b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 18:20:35.6174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoLDLmphs0Kkt2blcjmMk8UGfnZBtDSD+P6xw0oEJDtE2TDmAS2kBkNnpVfKDBQop2uBaqUfymip9r/sEiCZnw==
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

Thanks. I will send this patch for testing.

Note I still see a warning of mismatch of author and SOB as below, but 
that can be fixed to "Sebastian Aguilera Novoa <saguileran@ime.usp.br>" 
manually after testing and before merging.

$ ./scripts/checkpatch.pl 
v2-drm-amd-display-dc-irq-Remove-duplications-of-hpd_ack-function-from-IRQ.patch.patch
WARNING: From:/Signed-off-by: email address mismatch: 'From: Sebastian 
Aguilera Novoa <saguileranbr@gmail.com>' != 'Signed-off-by: Sebastian 
Aguilera Novoa <saguileran@ime.usp.br>'

total: 0 errors, 1 warnings, 740 lines checked


On 5/2/25 21:59, Sebastian Aguilera Novoa wrote:
> The major of dcn and dce irqs share a copy-pasted collection
> of copy-pasted function, which is: hpd_ack.
> 
> This patch removes the multiple copy-pasted by moving them to
> the irq_service.c and make the irq_service's
> calls the functions implemented by the irq_service.c
> instead.
> 
> The hpd_ack function is replaced by hpd0_ack and hpd1_ack, the
> required constants are also added.
> 
> The changes were not tested on actual hardware. I am only able
> to verify that the changes keep the code compileable and do my
> best to look repeatedly if I am not actually changing any code.
> 
> Signed-off-by: Sebastian Aguilera Novoa <saguileran@ime.usp.br>
> ---
>   .../dc/irq/dce120/irq_service_dce120.c        | 29 +--------
>   .../display/dc/irq/dce60/irq_service_dce60.c  | 31 +--------
>   .../display/dc/irq/dce80/irq_service_dce80.c  | 31 +--------
>   .../display/dc/irq/dcn10/irq_service_dcn10.c  | 29 +--------
>   .../display/dc/irq/dcn20/irq_service_dcn20.c  | 29 +--------
>   .../dc/irq/dcn201/irq_service_dcn201.c        | 29 +--------
>   .../display/dc/irq/dcn21/irq_service_dcn21.c  | 29 +--------
>   .../display/dc/irq/dcn30/irq_service_dcn30.c  | 30 +--------
>   .../dc/irq/dcn302/irq_service_dcn302.c        | 19 +-----
>   .../dc/irq/dcn303/irq_service_dcn303.c        | 19 +-----
>   .../display/dc/irq/dcn31/irq_service_dcn31.c  | 29 +--------
>   .../dc/irq/dcn314/irq_service_dcn314.c        | 29 +--------
>   .../dc/irq/dcn315/irq_service_dcn315.c        | 29 +--------
>   .../display/dc/irq/dcn32/irq_service_dcn32.c  | 29 +--------
>   .../display/dc/irq/dcn35/irq_service_dcn35.c  | 29 +--------
>   .../dc/irq/dcn351/irq_service_dcn351.c        | 29 +--------
>   .../display/dc/irq/dcn36/irq_service_dcn36.c  | 29 +--------
>   .../dc/irq/dcn401/irq_service_dcn401.c        | 29 +--------
>   .../gpu/drm/amd/display/dc/irq/irq_service.c  | 64 +++++++++++++++++++
>   .../gpu/drm/amd/display/dc/irq/irq_service.h  |  8 +++
>   20 files changed, 90 insertions(+), 489 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c b/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
> index 953f4a4dacad..33ce470e4c88 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
> @@ -37,36 +37,9 @@
>   
>   #include "ivsrcid/ivsrcid_vislands30.h"
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c b/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
> index 2c72074310c7..d777b85e70da 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
> @@ -46,36 +46,9 @@
>   
>   #include "dc_types.h"
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			DC_HPD1_INT_STATUS,
> -			DC_HPD1_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		DC_HPD1_INT_CONTROL,
> -		DC_HPD1_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd1_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> @@ -391,5 +364,3 @@ struct irq_service *dal_irq_service_dce60_create(
>   	dce60_irq_construct(irq_service, init_data);
>   	return irq_service;
>   }
> -
> -
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c b/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
> index 49317934ef4f..3a9163acb49b 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
> @@ -37,36 +37,9 @@
>   
>   #include "dc_types.h"
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			DC_HPD1_INT_STATUS,
> -			DC_HPD1_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		DC_HPD1_INT_CONTROL,
> -		DC_HPD1_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd1_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> @@ -303,5 +276,3 @@ struct irq_service *dal_irq_service_dce80_create(
>   	dce80_irq_construct(irq_service, init_data);
>   	return irq_service;
>   }
> -
> -
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c b/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
> index 9ca28565a9d1..4ce9edd16344 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
> @@ -129,36 +129,9 @@ static enum dc_irq_source to_dal_irq_source_dcn10(struct irq_service *irq_servic
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c b/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
> index 916f0c974637..5847af0e66cb 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
> @@ -130,36 +130,9 @@ static enum dc_irq_source to_dal_irq_source_dcn20(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> index 1d61d475d36f..6417011d2246 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> @@ -80,36 +80,9 @@ static enum dc_irq_source to_dal_irq_source_dcn201(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> index 42cdfe6c3538..71d2f065140b 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> @@ -132,36 +132,9 @@ static enum dc_irq_source to_dal_irq_source_dcn21(struct irq_service *irq_servic
>   	return DC_IRQ_SOURCE_INVALID;
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
> index a443a8abb1ea..2a4080bdcf6b 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
> @@ -139,36 +139,9 @@ static enum dc_irq_source to_dal_irq_source_dcn30(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> @@ -447,4 +420,3 @@ struct irq_service *dal_irq_service_dcn30_create(
>   	dcn30_irq_construct(irq_service, init_data);
>   	return irq_service;
>   }
> -
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
> index 8ffc7e2c681a..624f1ac309f8 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
> @@ -126,26 +126,9 @@ static enum dc_irq_source to_dal_irq_source_dcn302(struct irq_service *irq_servi
>   	}
>   }
>   
> -static bool hpd_ack(struct irq_service *irq_service, const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status = get_reg_field_value(value, HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(value, current_status ? 0 : 1, HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   		.set = NULL,
> -		.ack = hpd_ack
> +		.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
> index 262bb8b74b15..137caffae916 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
> @@ -77,26 +77,9 @@ static enum dc_irq_source to_dal_irq_source_dcn303(struct irq_service *irq_servi
>   	}
>   }
>   
> -static bool hpd_ack(struct irq_service *irq_service, const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status = get_reg_field_value(value, HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(value, current_status ? 0 : 1, HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   		.set = NULL,
> -		.ack = hpd_ack
> +		.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
> index 53e78ae7eecf..921cb167d920 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
> @@ -128,36 +128,9 @@ static enum dc_irq_source to_dal_irq_source_dcn31(struct irq_service *irq_servic
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c b/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
> index e0563e880432..0118fd6e5db0 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
> @@ -130,36 +130,9 @@ static enum dc_irq_source to_dal_irq_source_dcn314(struct irq_service *irq_servi
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c b/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
> index 2ef22299101a..adebfc888618 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
> @@ -135,36 +135,9 @@ static enum dc_irq_source to_dal_irq_source_dcn315(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> index f839afacd5a5..e9e315c75d76 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> @@ -129,36 +129,9 @@ static enum dc_irq_source to_dal_irq_source_dcn32(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c b/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
> index ea8c271171bc..79e5e8c137ca 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
> @@ -127,36 +127,9 @@ static enum dc_irq_source to_dal_irq_source_dcn35(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c b/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
> index 7ec8e0de2f01..163b8ee9ebf7 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
> @@ -106,36 +106,9 @@ static enum dc_irq_source to_dal_irq_source_dcn351(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c b/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
> index ea958628f8b8..f716ab0fd30e 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
> @@ -105,36 +105,9 @@ static enum dc_irq_source to_dal_irq_source_dcn36(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c b/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
> index 8499e505cf3e..fd9bb1950c20 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
> @@ -109,36 +109,9 @@ static enum dc_irq_source to_dal_irq_source_dcn401(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> index eca3d7ee7e4e..b595a11c5eaf 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> @@ -41,6 +41,16 @@
>   #include "reg_helper.h"
>   #include "irq_service.h"
>   
> +//HPD0_DC_HPD_INT_STATUS
> +#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED_MASK		0x00000010L
> +#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY_MASK		0x00000100L
> +#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED__SHIFT		0x4
> +#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY__SHIFT     0x8
> +//HPD1_DC_HPD_INT_STATUS
> +#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED_MASK			0x10
> +#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED__SHIFT		0x4
> +#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY_MASK			0x100
> +#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY__SHIFT		0x8
>   
>   
>   #define CTX \
> @@ -177,3 +187,57 @@ enum dc_irq_source dal_irq_service_to_irq_source(
>   		src_id,
>   		ext_id);
>   }
> +
> +bool hpd0_ack(
> +	struct irq_service *irq_service,
> +	const struct irq_source_info *info)
> +{
> +	uint32_t addr = info->status_reg;
> +	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> +	uint32_t current_status =
> +		get_reg_field_value(
> +			value,
> +			HPD0_DC_HPD_INT_STATUS,
> +			DC_HPD_SENSE_DELAYED);
> +
> +	dal_irq_service_ack_generic(irq_service, info);
> +
> +	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> +
> +	set_reg_field_value(
> +		value,
> +		current_status ? 0 : 1,
> +		HPD0_DC_HPD_INT_CONTROL,
> +		DC_HPD_INT_POLARITY);
> +
> +	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> +
> +	return true;
> +}
> +
> +bool hpd1_ack(
> +	struct irq_service *irq_service,
> +	const struct irq_source_info *info)
> +{
> +	uint32_t addr = info->status_reg;
> +	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> +	uint32_t current_status =
> +		get_reg_field_value(
> +			value,
> +			DC_HPD1_INT_STATUS,
> +			DC_HPD1_SENSE_DELAYED);
> +
> +	dal_irq_service_ack_generic(irq_service, info);
> +
> +	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> +
> +	set_reg_field_value(
> +		value,
> +		current_status ? 0 : 1,
> +		DC_HPD1_INT_CONTROL,
> +		DC_HPD1_INT_POLARITY);
> +
> +	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> +
> +	return true;
> +}
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h b/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
> index b178f85944cd..bbcef3d2fe33 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
> @@ -82,4 +82,12 @@ void dal_irq_service_set_generic(
>   	const struct irq_source_info *info,
>   	bool enable);
>   
> +bool hpd0_ack(
> +	struct irq_service *irq_service,
> +	const struct irq_source_info *info);
> +
> +bool hpd1_ack(
> +	struct irq_service *irq_service,
> +	const struct irq_source_info *info);
> +
>   #endif

