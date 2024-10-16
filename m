Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A353D9A0D95
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 17:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5287010E0A6;
	Wed, 16 Oct 2024 15:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QrCISos2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B3610E0A6;
 Wed, 16 Oct 2024 15:05:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1uKIv48Pp1NjrWs/4LyNgqFACtBdZXQi/aQLg9mVg/54m7vMZIgKNw2sFlWeZuO7wMzelw8ctfFamUT+iGUb5eqzA6Ugn9Utg85vjELm8AINMa7wbuK1R/B8klBp+Xke7pI9NrxPHUF3e5pppoYz0O3TuPe/Zz/uMp5IkAX7BN6yqpunEiYNFUZC3SSJfC3TPRKJa8mn7597J1wNVoIGB9VGdE/HT+hVVcYko5DJ2kwQTVLuZ+BYUbnfcr9zFZ/K98eNT+PDpUnThk0bbAI0u8gqrFrIdIh6bX58MejIR1nwEl/pRG07NzbdL39Ok+0QGe+C7gL6m6ff5nq+5zQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r21QVNySOvB72lyOro0d9HXEdBmMsNjMQbvZafs8zMc=;
 b=m1A0IPKZys7bNnbPFBb2G7d+q50HfEa/e2ttL1+Yh5t/uEvBw7iF3iZh3ADPCk44AuD06pVWjEZLkRGabPlqXT54nhBoOfovEq1+5UxMQw1yC2DqBU8VB7+EvXY28GNzF3wlAJmn+shYu3/Ii6UoLs3ss9ULrK5ilbijsZOg9zobJtcGB7ztxymdKU33eD58q5U8+AScQP/jItZFr859/O7KdVJWZFcSLrKVpFZ5Grhuu1Pq6Mad5ngoLlShnuTwz68grlBA7IvMM01AOScdvsvCJ7j1O4JPcAwm4ZgInLpTYEOY8hgnctqk5xZMknvMemv2SbaW9LbttbugW9wtRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r21QVNySOvB72lyOro0d9HXEdBmMsNjMQbvZafs8zMc=;
 b=QrCISos2xBbpeGj96fukSxTgt7EoHIOW7+8Z8AGrBhJqmSwecmz+//U6MrX+Qph5ZTX0atM1Z8FieAxeKBdStOLUIV3qm6i67auVo7iUO9TpmPTnKk2LiIuh3Gkg01T59OJdOZOh2c8hhQ09C8uFGmyylMBeRNIISsHJ3AWRMsxVqKSrcn6yT/72POn6ymOFVXPBF6UOjATNnDlQI6yxNSewpxpySYJNqQr25TWp8AErS4PJiMQC0Wk1NVE7ex48Fhn+BIwsoNrc5vpo7TdUkG1bsZI3ygfy91Z4aif1fhcZCdq2yNMTmCuwv1YOphuv7SFwRYWLoyyJ78iPGEIiEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 by PH0PR12MB7096.namprd12.prod.outlook.com (2603:10b6:510:21d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 15:04:59 +0000
Received: from BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938]) by BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 15:04:59 +0000
Message-ID: <afeece76-b02c-482d-91fa-739c320cd3c5@nvidia.com>
Date: Wed, 16 Oct 2024 18:04:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
To: Christoph Hellwig <hch@infradead.org>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, herbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 jgg@ziepe.ca, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 apopple@nvidia.com, bskeggs@nvidia.com, Gal Shalom <GalShalom@nvidia.com>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com> <Zw9F2uiq6-znYmTk@infradead.org>
Content-Language: en-US
From: Yonatan Maman <ymaman@nvidia.com>
In-Reply-To: <Zw9F2uiq6-znYmTk@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0391.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::15) To BL1PR12MB5851.namprd12.prod.outlook.com
 (2603:10b6:208:396::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5851:EE_|PH0PR12MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: c8117a6d-8208-4f10-9fd2-08dcedf3e71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjhBdnVKUVVlditFcGtHeTc2bWhxdnZZNnJxdlFWQ09IYkJwU1dHWjFhaW83?=
 =?utf-8?B?b05MSjlFaU5UQkcwRDRxV1VsRVdQVmVYRi8yOEZtRzR2QW00VVdoTHZoY0h2?=
 =?utf-8?B?Y0hSL3JhNlJ0OVRmdFZLaVRuWkNjUkV5SkZwcXhOc1FUY1owaFNiSWVvS2c5?=
 =?utf-8?B?RHBnd2tYS1ZaRUtubm9URGhnbUttcWdjczhJcGVjNTdwcVZBNlV4NDFpRmUy?=
 =?utf-8?B?OVdqOERSTmt0OHZNQ1huZjJjaVB2NDRtYnFKNk9JVURjUWxORUdNME1ObXJz?=
 =?utf-8?B?L2pwREhoc0w2Wm5tdjV4d0h2ZmFEMCtwVEh1Z21GVXhqdWdpZmJyeHcvOVB4?=
 =?utf-8?B?RGR5Lys1UTRvTEZhYUMxRC9xOGRTcWcweHp1d2FKOVpsQ08wZmFRZDYyQjhi?=
 =?utf-8?B?L2lwOFVManMxYnJ5UkRuODI3SlZmRFFsMWFveDNRM09UZ0k4bEtJc2I2NGox?=
 =?utf-8?B?UUxteW0vUzk1MlZjNFRIeS9CM3A5MkFiOTJKMkJoTHRndDNBaThDTEFyYkI5?=
 =?utf-8?B?OVVZaHRQMnpNdXIwUmtmcHJNaUZPOHQza3lDU3BjdjIrdFlvOEdtZFZKUmc0?=
 =?utf-8?B?RFJLelpYeGN3ZWwyYnRJRmkxUHgyT3hmU0JMN3NiSkxpblhZb1lTb0dKMmZG?=
 =?utf-8?B?Nk1xTDBXaTRhTEYwamRaYmFNMjdwZTQyZ2s0eUNGY3JsTHA5WVQ5bmVTdUpl?=
 =?utf-8?B?NkFHM1pZc3ZCZjRndlZzdTByWGltZk93S25LdDRSWEtKU0VqbW5CWTUvS2Zk?=
 =?utf-8?B?S2tETGp1TEdiNnRzeEw5d29JSExNZkhtWVlwdWF3c0F2YnEreS95WGdHU3p6?=
 =?utf-8?B?RzR6NjlmaDduUXo4NnFtMUJEK2p3bFBzQ0VPYlhGd2VGRU9uNTh2L3lLc0c3?=
 =?utf-8?B?eDF3eTd4V1NOU2lRcUhiaWZiRlB4Q1I4RzFkY0dxencvelM4cjk5QXNWN3hw?=
 =?utf-8?B?SXlZdUlqTVVSdDFMcVBBcFRDb0RDMlM1cDFhSThodWJ3MWgwYjhLaSt3S2FH?=
 =?utf-8?B?M0J1elUyMEQzRDFQNTA2UDBDZTlhNkV2OE1mbUNNa1pCaFJQRDNkNkRpTGZ6?=
 =?utf-8?B?T1dqMnNTLzBaUjVUMDFEeTd1VE95dDVwTU9JV1ZMVTZRZGNacUtrVkxlVlBx?=
 =?utf-8?B?RFl3UXV2UVRCUXJCaVBVQndZUWtBYkFpV2RpcW5XYUhXZHhvQ2kybnJlejVx?=
 =?utf-8?B?TVVNOWE4L1FRZ1FVeWxnSldRaW05RVY2OFpIaUtnMGJhMVJrYVB6RmxBZGxj?=
 =?utf-8?B?M3FVSnVDZ2JnQ2xnY3FzY2hDbWhIY3NCdlFtVE9IMy9ra3dRa3NKdTBXVDBz?=
 =?utf-8?B?d0ZZaWp0VmhrK0xVcEhTNUJreUk4VXEyR2V1NnBaczZyVXV1KzZIUUN5WDV2?=
 =?utf-8?B?RjBVbWMxdHVtY2U5djhGSGFjQjFobS9pa2pmbzhmWHBKbkJiZ05iMVIwYURO?=
 =?utf-8?B?WnBYU0hQdWxvUk9SQ2RkVTRtT0wwYklKSmZxb2dBTzJoTE44RnRCaTg3S05V?=
 =?utf-8?B?U1VreUs5Z2wzN2VTMDBwdkdURm1HWTRtcVRkbmpvVkIvc3dhMk1MUmk1cGVo?=
 =?utf-8?B?b3MzVXJyWldvaVdqbm1WeHlSdks4S2UvZ29raHBDdW9hcEdMREhsbTlTTW5H?=
 =?utf-8?B?TjROSlBLTll1dDVhUnd5MEZKd0lVelhTM3lieGRubm0zelMzdlFlWFlKVzdN?=
 =?utf-8?B?c1NPZERTc2xhb1ViNW9rdC9LaTA5OHRWRnJuMDRxZ3JWSTJzOG9xbU5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5851.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU93OS9WeWN6S3E0aGczbjBURnZpOWhIenBLWUNzODBJTWJPbXlJNFpMWHZ0?=
 =?utf-8?B?UU95bTV2WU12T2FWeFRMYWlaNzR3SWZXZm50enUvYVd3cmZ4RDVRd3JCTWMz?=
 =?utf-8?B?cWRpU0RLWkZ3WktZeERzelRhY3MzK2dqVURMZ2QwWkV0NS84WHZBWlJJcG1v?=
 =?utf-8?B?Yjk3U3QzL3VxaklVamlaMXl5a09tN09ySWJocmltZVdSVm9FdS9SRkZFdjBC?=
 =?utf-8?B?ZjBuRmZxQ1VoU09HaHJKeDB2S05nallLOE55czhkQVU1NHZkejNWTkt5ajlk?=
 =?utf-8?B?SXJIemhIb2psem14VWsvZDRGNllhMm5STktsQ1hOTXJtcnNXb2JSUzVRQU9Z?=
 =?utf-8?B?Vkt5ZERSZXNKVWVFUkF0NHF5UVFyUldTVk5UTjhsMFhNSThyQkdrRVZNYjc0?=
 =?utf-8?B?Mnc2dVh0WXN3RlBrbHRNWTNQSVAzeDJCTTloTzhiM1F1U2lzSnVpby8rU204?=
 =?utf-8?B?QmJmYXhPR3ZoSjIwZ293Q0I0MVFrWXlUZ1ZpNHQ5OTE0MDVBT0VDYk9JVGEw?=
 =?utf-8?B?OEpla1BVckNLNVpSQVJpSXF5YjFtekhPQ2o1K2xMZkxqRUdmTS9iYmNpcnR4?=
 =?utf-8?B?K1VpdG1TNVd3MFhVZzVGcG5mRHdrdEZ4Z2lIOEUwOXhmbEVVZ1ZXRHIwZGJI?=
 =?utf-8?B?WTQvVkxNdnhRdFRxc3RtNk5HTUplZkZvdVZPby9kazVlZEpMTGNiZGtYb1ZE?=
 =?utf-8?B?TWVJaGVnTlRWLzIzdThsVGpEbHhoeEtIcHVNNTUrdmNWMkxVSmpocFBvZ2V3?=
 =?utf-8?B?aW11L0lUa21taFhUWDR2WVZtdnhtaUk4K2ZZd1A1TXVyY0NnSzE0L05FcUZl?=
 =?utf-8?B?K3gxdnVCaUFnNk81MWdHOHBPY2NQMkhwcFVpUC9Cem5wNlNBTlR3N056T0JT?=
 =?utf-8?B?SU0ydXhBZG1mRnpaVDREVVJLR0pFNEJSZW1jczJENURDMDZBQ0VtTGFYWTJY?=
 =?utf-8?B?aGIrd2QrTFZpYlJiTktlM0t1UGREenBjZ0dsVTJ5bVFnR3A5UlJ6NGhlaWRo?=
 =?utf-8?B?L3dxSGE2WDhTQ1pVeGpvZHdZYzBMbzE0YWlCNGpEWkRXSFZTeG9hWFFhNkJi?=
 =?utf-8?B?U254Sm1LeUdncUFwY3dtR0swSFhwcEJ0Q3lxVkt0SUVKMXZjbzEzd2E3a25N?=
 =?utf-8?B?bGU5VnB4WHVSQW9PelNSRGJZSjZuQlVQNmFIYUg4bSs3ek5jQXB3eDRyYUlh?=
 =?utf-8?B?SG5XUUhjcXd4TklvRHV5SVBvMGFwTG5SMjNRL1FjOE4xOE93ZGhGVW9KZEJC?=
 =?utf-8?B?MDcwb3VYUURYaWl5dzhKRFF3TGk1VGQrc2FnOXFHYXJuOFlJNTNsOUdRV04r?=
 =?utf-8?B?Q2xFaEZjbUIyQ2UxRVUxSVplZ2hBc0lYUVRXT2FOdkxTdm9jaHZpQTUrdGlP?=
 =?utf-8?B?QlJFVUV0SjZYL1V2SXM5YnVtcnNqS1N3TWxkVlhWWVVKZUJzNVdKOTVBeUFp?=
 =?utf-8?B?bkxMV0t4TjlzbmhORS83NkdmeFFZcWtHOVZvWWkxSWFnWDB4YnVvUnQ4SzlG?=
 =?utf-8?B?MUhOUmx2clhKNXRacVlrNDlBcTRHVzdFR2c0dlhUeWVGelZPSDFURWk5bmJS?=
 =?utf-8?B?MHcyT21CMEd2U05acVhCMlVIYk80eXdzdDI3UWVub2RuSUg1L0hvZGJZZ1Zu?=
 =?utf-8?B?UDFGcjBNaUlVOTRnbWxwWVFSS2VVOTFHV2pkTVpsUmh5MGZLL0l2UzVhOFJ2?=
 =?utf-8?B?ekt4YTNBU21PS2lnbE10WFQwb1V1ZnlBVkVFVnN4VmxLVUFFeTNhSDd4OW1y?=
 =?utf-8?B?M3dKYVB6dVN6NWc1WVFtbDNtWDRRVWdzSGRocGhLUjVDK0xIY1lxTFZmcEh6?=
 =?utf-8?B?RXFadkV3VlNlN1NTVCtzeDFjOEFPWEN1MFg4bmlWQUdYcG0vV0FueThObURn?=
 =?utf-8?B?RmVGNnlhYmhaSTdaRDJFQWRJZnRqNzBzMnZxbnFNMlpPOWI3Z3dDRk5NOUtz?=
 =?utf-8?B?UWV2Um1yV3NsQ2tUbmlQc3RHWUdoTHo1NWFlMFN6TjEyMWRnU29DZ0owd2pl?=
 =?utf-8?B?a3l1M1pGSldJZ2l3a2xWaUMzS2s1U3NWdUFtR2tzakNjYm1DTWI2QW5QYzIz?=
 =?utf-8?B?amcrYVV5K0pFQnBEV3VSYk5Tamw3TitQU2phVm5yVWNoRktzbmJqVENSWW53?=
 =?utf-8?Q?Rx3MWyzfHnHmNSrta6SHQJP0I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8117a6d-8208-4f10-9fd2-08dcedf3e71a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5851.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 15:04:59.2890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3h7Vc51BtftStPhBMZckJilL38FnL5FSSIv/SjVJizFQCOjenl5n6d8sHDHSxlBntS9s7vn8MYdqvCdGFJdckA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7096
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



On 16/10/2024 7:49, Christoph Hellwig wrote:
> The subject does not make sense.  All P2P is on ZONE_DEVICE pages.
> It seems like this is about device private memory?
> 
Correct, thanks, I will change it to `mm/hmm: HMM API to enable P2P DMA 
for device private pages`, on v2.

> On Tue, Oct 15, 2024 at 06:23:45PM +0300, Yonatan Maman wrote:
>> From: Yonatan Maman <Ymaman@Nvidia.com>
>>
>> hmm_range_fault() natively triggers a page fault on device private
>> pages, migrating them to RAM.
> 
> That "natively" above doesn't make sense to me.
What I meant to convey is that hmm_range_fault() by default triggered a 
page fault on device private pages, which results in them being migrated 
to RAM. In this patch, we are trying to provide a different (more 
optimized) handling flow of P2P instead of migration.

I will clarify this on v2.
> 
>> In some cases, such as with RDMA devices,
>> the migration overhead between the device (e.g., GPU) and the CPU, and
>> vice-versa, significantly damages performance. Thus, enabling Peer-to-
> 
> s/damages/degrades/
Fixed (v2), thanks
> 
>> Peer (P2P) DMA access for device private page might be crucial for
>> minimizing data transfer overhead.
>>
>> This change introduces an API to support P2P connections for device
>> private pages by implementing the following:
> 
> "This change.. " or "This patch.." is pointless, just explain what you
> are doing.
>


Fixed (v2), thanks

>>
>>   - Leveraging the struct pagemap_ops for P2P Page Callbacks. This
>>     callback involves mapping the page to MMIO and returning the
>>     corresponding PCI_P2P page.
> 
> While P2P uses the same underlying PCIe TLPs as MMIO, it is not
> MMIO by definition, as memory mapped I/O is by definition about
> the CPU memory mappping so that load and store instructions cause
> the I/O.  It also uses very different concepts in Linux.
> 

Got it. I just wanted to emphasize that this function could be used to 
dynamically map the page for MMIO. However, I understand the potential 
confusion between MMIO and P2P, so I’ll remove that part.

>>   - Utilizing hmm_range_fault for Initializing P2P Connections. The API
> 
> There is no concept of a "connection" in PCIe dta transfers.
>

what about "initializing P2P Transfers" or "initializing P2P DMA"?

>>     also adds the HMM_PFN_REQ_TRY_P2P flag option for the
>>     hmm_range_fault caller to initialize P2P. If set, hmm_range_fault
>>     attempts initializing the P2P connection first, if the owner device
>>     supports P2P, using p2p_page. In case of failure or lack of support,
>>     hmm_range_fault will continue with the regular flow of migrating the
>>     page to RAM.
> 
> What is the need for the flag?  As far as I can tell from reading
> the series, the P2P mapping is entirely transparent to the callers
> of hmm_range_fault.
> 

This flag mirrors the GUP flag (FOLL_PCI_P2PDMA). The purpose of this 
flag is to ensure compatibility with existing flows that utilizing 
hmm_range_fault but may not inherently support PCI P2P.

>> +	/*
>> +	 * Used for private (un-addressable) device memory only. Return a
>> +	 * corresponding struct page, that can be mapped to device
>> +	 * (e.g using dma_map_page)
>> +	 */
>> +	struct page *(*get_dma_page_for_device)(struct page *private_page);
> 
> We are talking about P2P memory here.  How do you manage to get a page
> that dma_map_page can be used on?  All P2P memory needs to use the P2P
> aware dma_map_sg as the pages for P2P memory are just fake zone device
> pages.
>

According to our experiments dma_map_page is fully worked with PCI_P2P 
pages, I will double check that. If not we can either return this 
information using HMM flags or adding support to dma_map_page.

> 
>> +		 * P2P for supported pages, and according to caller request
>> +		 * translate the private page to the match P2P page if it fails
>> +		 * continue with the regular flow
>> +		 */
>> +		if (is_device_private_entry(entry)) {
>> +			get_dma_page_handler =
>> +				pfn_swap_entry_to_page(entry)
>> +					->pgmap->ops->get_dma_page_for_device;
>> +			if ((hmm_vma_walk->range->default_flags &
>> +			    HMM_PFN_REQ_ALLOW_P2P) &&
>> +			    get_dma_page_handler) {
>> +				dma_page = get_dma_page_handler(
>> +					pfn_swap_entry_to_page(entry));
> 
> This is really messy.  You probably really want to share a branch
> with the private page handling for the owner so that you only need
> a single is_device_private_entry and can use a local variable for
> to shortcut finding the page.  Probably best done with a little helper:
> 
> Then  this becomes:
> 
> static bool hmm_handle_device_private(struct hmm_range *range,
> 		swp_entry_t entry, unsigned long *hmm_pfn)
> {
> 	struct page *page = pfn_swap_entry_to_page(entry);
> 	struct dev_pagemap *pgmap = page->pgmap;
> 
> 	if (pgmap->owner == range->dev_private_owner) {
> 		*hmm_pfn = swp_offset_pfn(entry);
> 		goto found;
> 	}
> 
> 	if (pgmap->ops->get_dma_page_for_device) {
> 		*hmm_pfn =
> 			page_to_pfn(pgmap->ops->get_dma_page_for_device(page));
> 		goto found;
> 	}
> 
> 	return false;
> 
> found:
> 	*hmm_pfn |= HMM_PFN_VALID
> 	if (is_writable_device_private_entry(entry))
> 		*hmm_pfn |= HMM_PFN_WRITE;
> 	return true;
> }
> 
> which also makes it clear that returning a page from the method is
> not that great, a PFN might work a lot better, e.g.
> 
> 	unsigned long (*device_private_dma_pfn)(struct page *page);

I Agree, I will fix that (v2).
