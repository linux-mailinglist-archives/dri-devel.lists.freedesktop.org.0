Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2304B4596DB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 22:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACF389B57;
	Mon, 22 Nov 2021 21:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C9789B57;
 Mon, 22 Nov 2021 21:44:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BICZX0oC0IoqS4xF7Tce7VgzPDPVvMdpZSDWfk4UBBnKgJoRZAh7joMdruw/dMn0YfRPR5fZTxIR4WP42qbm7mxS9KiCHzxOuqrnuZZN5RYGKo2jk4Iti8VZmQJ4nFe5fJtpclHBaSmLXPVLrlHf3ylh5Dy+ALuodISRIwtuBbkEDsD3orLQAUndOkAyjOS3YP/PTDtHSqH9rkqc2RvMq82Gdf1dj/qi7ubVWWwF143gQQ7GYb8g80Ov6+YfPegCj2LMIjtnzcdFROt3c0RRzP5Hol0TeSjJzufsAgujnuFu2fHgcBEUqat+iX3emi7ruWUCYv9TjW2vqrnWcVhnow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTjHgCZFecF6Fv6D+wCuwFZQbzKLRmJ4NmTyrq35yFY=;
 b=XneU5W0Hq/KJpxhsS7TgGZ8A1MngLbsuy6AXPyiu/nThNDib1W0kDvjh5LUvxr3vzl6YqdFnnMQiYfif8N/iF0/EVHfelpNbqfkSMck9y22S1OrDoSeytiyqD6TfwZIMg7k3q69kCHo9cIr5UkcFoqoEZwArQo8snWPFZz89fo9j3BjwaDV+QsBzeTBhFkOIe6fCc0iMNpJrj766Q4svQy83mpoYXxZnm7FDa4z/aKe9YteJf1gq8CwWXQw2T1PHW1RxtSgo5QRCd54REqJbz3JoJ6dS1BBp9AKK2eb772lxzccPa0fyDPcKHvCLowfA/DEyN/eQ/k76RMEN1uV+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTjHgCZFecF6Fv6D+wCuwFZQbzKLRmJ4NmTyrq35yFY=;
 b=3qgygZl4zCe62I51pFJY+nq/iL7V+rgO8T/mxSUG0ytLi4MxCOpZXrscmHjMJtP43/jPha4G3zYQBpWWyKiyjr3l1d7kqum3Dq+UdmE5FIl+man2QfayuTZiTBAZs1tM3CrRYhGY6D+7cZfhcBGJzaqf4ON0lDHbSFTTDw20+is=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5036.namprd12.prod.outlook.com (2603:10b6:408:135::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 21:44:23 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%8]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 21:44:22 +0000
Subject: Re: [PATCH 2/2] drm/amdkfd: Slighly optimize 'init_doorbell_bitmap()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <2343a4e6547a8436419308744ba8c433088922a5.1637516393.git.christophe.jaillet@wanadoo.fr>
 <3e54737649cf94daabaa5b51db9f4c21d43124fe.1637516393.git.christophe.jaillet@wanadoo.fr>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <283c0b53-ff4e-85f8-4738-2d477365f458@amd.com>
Date: Mon, 22 Nov 2021 16:44:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <3e54737649cf94daabaa5b51db9f4c21d43124fe.1637516393.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.127.191.123) by
 YT3PR01CA0114.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:85::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 21:44:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e38f3c7-884f-4020-8f24-08d9ae013e9d
X-MS-TrafficTypeDiagnostic: BN9PR12MB5036:
X-Microsoft-Antispam-PRVS: <BN9PR12MB50362B92D0FBD1CEC82807DB929F9@BN9PR12MB5036.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jS4Fbe8Otnun9t5vnNBq+U1qjTNr4OPOPexTi65BnikFseJ2xT9xyNOWCpLNxWDM9SkK292UfVhHs6iWZvk27TfRqiNhiHCf/aPuGJHLQBG3jHEcwv+vke0dQSPG/NBFVpfKqn1sR8DSyNapn7alX1RAHqDVMf27+/vrCSjudiLDs+7sxAMf7ZMxMRHF8GwquEKCfoky/vClpkOS3QHgNkI9w8zXJFZyvefNMrVoeIoDzHZ1a4QJEvu1tWk16GLPryvKhEqE9McY9UV4nrIeMRtQpVK6uiwMPDE1OPN0kPjx1jBVRbwjdi/KqZHFxCH5ypNZ2unHnF3VJNA4rJP6a8vIjpy6Sz9yQrpz06QIzZszF4L9SB5P9O6Q7SOey91BGe5I162LuxYcnQAxnnwkH4GieviXEn1y5sdV1hYLwhhPHyJuNe+aDMUazrroEvmLOy6CwpZu8JmxraKjnARfcStKT1DqhxIgZpvdwRgV+rRCqHnMmK7gFOKo8uNnpcFB+mF2yCqseJzaHh3wR+by4KCVPqzAit+KstJxtKoJBXRtyebRAyoLbTQgyIW0mdiOu+dSRp+3duDX6e/1JZxc7CmniqCaKUPuEU+OG8S33QKS/JT00Ue1t7ngkocyD9E0EMvE00IXmz45pITg5ffZwYAAWRnCM3eWuvc5s+vVDh9+46O+9425jZoav7b5jj8JUEn9Iax6TTUZROn4psf6usIIT4DDzCEUtpEHRkMiEt4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(44832011)(956004)(2616005)(8936002)(5660300002)(66476007)(66946007)(16576012)(316002)(2906002)(6486002)(66556008)(26005)(83380400001)(31686004)(186003)(508600001)(31696002)(38100700002)(4001150100001)(8676002)(4326008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWZyVXRwZThJa2xCZDBORmh1SFBtckZ5bW9rZ3VieVBkcFExbnhuZmh0SEJX?=
 =?utf-8?B?M1Q4VnFwTUp3VTB2a3BBVHYrQUU3RjBFU0JVMmV0c0FPdm5ONTlWa3JiOHZL?=
 =?utf-8?B?TnNJdElUQmU2YVJDcmJTUEdBYUZzc09jNWV5NE4xMlZYc3hocE5YbWRISVI1?=
 =?utf-8?B?eTdlVXRNWW9vTlpyNWlyU0hJTVYyUDk2M0ZhUWZrcGkyUzdlL3lQMWJjaHRz?=
 =?utf-8?B?OGd2L0NQUTJkZlAwckRXR1N2N0JFdjNoTk1jYWp1T1dZL0xrMFQ1cjdqd3RE?=
 =?utf-8?B?VEt1by82UDd3MjNlM2pVQnRCV210aUFwQ2VpTEppTFRwM1E1bm95YjhkaHU0?=
 =?utf-8?B?OWYvUWxkcWplQlVSOWJtN1VvOHgxTnhzdkthYXdhRGFic0N3OFhoSC9mZUdi?=
 =?utf-8?B?SEl1cjltSllxY0NLNm9yT3JUbVZVaGZPRWZFc25HN2lvbDJKemVzWFFQYkVw?=
 =?utf-8?B?bXBOWER1bGxaYlBqSm1lNys3N1JmY0ZTZzg3bVFKY0V3by92bHR3UlU1WFpq?=
 =?utf-8?B?SGx3MXpUeUxJTzBwMk9nVDFBYklzRFFhZ3NUajVmMDJmUTNPTWdMYlBVOHp3?=
 =?utf-8?B?MSsrZldvQjZ1SVpRbFZqdlRVQ2R6b2YvZmtrVE9oVzIwcU5rRVdPYmw1RFh3?=
 =?utf-8?B?N1RITUJocVA5S0szVDNaNHBvL2kwaktMK2VUNGxHcUNxcGpPRXlWRGo2ejk4?=
 =?utf-8?B?MWtQdTBCRnF2TkJrTFlCbXdnUkYyMDlOd2ppMldIYWpQSlc1ZTU3dHZ3RkNH?=
 =?utf-8?B?SkZVQy96Q3VTT0M3Yit1NHBVSzcvZ0xqOVBaNWZ3ckZZU0lzYTR0Z2cxdFBN?=
 =?utf-8?B?SER5UDI4eUYveGtUc2ZTVHMrM0ViT08rdUVtdGoyM3JJRUFncVRnMHhpQ1FN?=
 =?utf-8?B?ZEp0VDR1VUVJTTBaQnVzUzREd0dKQjF6Q3k2VXVqamZFYjFIODBzaEZGMEty?=
 =?utf-8?B?YUQ4azVWOGs4RjFjZWNyaENONkhMbFVMdjEwcUkydXNROHg5cFZpMmU4VElY?=
 =?utf-8?B?NWU5YTlRTmt5TWFDc0svdUo1dDhJRGE4bW50ckJkZXRBWERDNWFlN04zdXNu?=
 =?utf-8?B?RVNCWTVqNzdPeVhCZWdQbDRDZmNmSldleE5icVlLbksyN01IKzRYd2VBNks2?=
 =?utf-8?B?TFd0M09xRUNlTDMzZThrbkdpdXBjdzlJQlc4S1p5c3BQOWhWNHpOY1hFN096?=
 =?utf-8?B?N1dpVDdTRm5CTlRRTUQ0OHpLU2hFaDJmcHFVTkkwQnJMWHYwQjE3WE4zWnVj?=
 =?utf-8?B?OUlKRlJjMEE0NWhvNDdUNzhwK2R1RkJmMkJ2U2FkN2tqZmNWSXN1NWVEcEhq?=
 =?utf-8?B?N1V4Mld2TFJFSVZMUHQ5TC9xWlpXaDR4NDhkTnArNGNyTURkUG9wM0U4UTEy?=
 =?utf-8?B?OFRpMDRaVmJVSml0eTg4UzZKSk8wWUtnNGlaNllXRU11TEdzUjhnNUUyNGJv?=
 =?utf-8?B?bDlVSnZNK0JaTkVEaEFZZUp6K1FzZjRVeWVkc3AvVWdRa3IwZlhUZmtxL2lP?=
 =?utf-8?B?a2M3ekRDWHUzMXAxM2dwaU02Y1VmcTlQS3BpekIram9JYWt1QldFZjVrSHds?=
 =?utf-8?B?LzIzT0loQnJteitZVVRvaHJyczVUa2RMVDQ2ZUdkTE1oaWk3bWROSndsendB?=
 =?utf-8?B?bjB3WC9zek8yM1JxRnU4NnBmZnF3RkVrRnlKMG1GTU1uUWp1VklZYXA1OWNH?=
 =?utf-8?B?ckNhSm8wRHNkQ1ZoMHJVeHlhWUNnUE1Zbzc2OEF6UDN4OUkxdy9rYXZEWUxz?=
 =?utf-8?B?K3pxQnlYa1AzaHVoVVBYQUFlS0FnN1hRcWltK1JrckQvazZVRjNwYThWSUh6?=
 =?utf-8?B?V1BUaTZ2NlVackZ5VnZDTGMra1d3SE52NXJJVElDZEhvWXZtNVVKeVpxUnkv?=
 =?utf-8?B?TzE2RnNqblU3aEZubkpGeUdPRnZqU1ArdDE4L0FRTEJFOWNIZXFXc2p2UTZY?=
 =?utf-8?B?cXMxaWJJOXlPMmFzTnNORXo1dHhUS05zSFUyRlV0aDFCRnJZdjhlOVBvVUow?=
 =?utf-8?B?eWdxR1FjZG1yT1Y4aEFGenVrYzgveTVSOU9GS0gwM1RVdHUreTRGWUwvUXpl?=
 =?utf-8?B?ZWVvNU8xN2NoWUlkSHYzVXVlSjVxRmNac1VUbFBaZm4xMUlldnFNVDZlWTN5?=
 =?utf-8?B?azBuYnZuQmtTVjRHTWZaaE14UkpBNzlZV3BabW1IUEVCZHhITkN5djZiMVhI?=
 =?utf-8?Q?Lbd6SsxslBpParJuAQIW9Ls=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e38f3c7-884f-4020-8f24-08d9ae013e9d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 21:44:22.2565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QcsIOpxbHp55LNYOJkfeodnncxXnL0fkbH9y89sQzOyfcHxB4qLNdX6NVkR3i8/HNmJG25rTBrShgeSPYcMXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5036
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-11-21 um 12:41 p.m. schrieb Christophe JAILLET:
> The 'doorbell_bitmap' bitmap has just been allocated. So we can use the
> non-atomic '__set_bit()' function to save a few cycles as no concurrent
> access can happen.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thank you for the patches. I think the same sort of change (at least the
allocation/freeing part) could be applied to the queue_slot_bitmap in
kfd_process_queue_manager.c. Would you like to submit another revision
of this patch series that handles that as well?

Either way, this series is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
> bitmap_set() could certainly also be use, but range checking would be
> tricky.
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 172ee8763523..2e9d341062c4 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1447,9 +1447,9 @@ static int init_doorbell_bitmap(struct qcm_process_device *qpd,
>  
>  	for (i = 0; i < KFD_MAX_NUM_OF_QUEUES_PER_PROCESS / 2; i++) {
>  		if (i >= range_start && i <= range_end) {
> -			set_bit(i, qpd->doorbell_bitmap);
> -			set_bit(i + KFD_QUEUE_DOORBELL_MIRROR_OFFSET,
> -				qpd->doorbell_bitmap);
> +			__set_bit(i, qpd->doorbell_bitmap);
> +			__set_bit(i + KFD_QUEUE_DOORBELL_MIRROR_OFFSET,
> +				  qpd->doorbell_bitmap);
>  		}
>  	}
>  
