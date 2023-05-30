Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596D716E80
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 22:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF66510E125;
	Tue, 30 May 2023 20:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C2110E125;
 Tue, 30 May 2023 20:16:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYnY04O+kY0pB0ZT+G7ZVQckXJnPBy+r0oOOeQ/qk3GhgAHdZrwHNmi3cjWeyd4JoPAXehWpteIKMsx5hNDrQLqOAbGfvaUGsWovIcAAYC0TNyDIKd3Emon4kfLxaRn73DbV1tHnqFLss/lgWj6pQpnFBmuzP+tFHJxiyUJZsgekdVUmPPUQk0JpQpvq+I6rKIMOrlwzJxeZZeExp9LcsjGS//43llFHeOZbP9tpbt0HbtbdZJcC2LBgXDM8KaiSipyPke9bUAwTp81NinVM9IWJNViYCfcqC1dAR2nHqAnHJ1d9G4dt/09a++WRRYnUqQSVi7kfW6IgD3ueq/qJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0HmXv2vgC9JiOiwC2owc/7NNYqlKUPIIwTzWTcU0C4=;
 b=RQ18FBSNucJLcOHo/hqk8m3hPtblcLdGYtLkj9veXWWeg6263eXqK1g1GS7q+ANylunMPxvqiTurc29/RKJX4S+203V87gtTIEdbcgk6wrDGJYkpTDikn7CPwuYmpg75Hou0SZhbwV+q2MakR1GAwphIRN772ys+diwKubm8LNMKfAdWPfodiS6zF++Rl5rP+Shjsoj6xF/ip6jbbpCKqJNDup7IgQj9/TfKZ03d2UXrgJBZDJHZ8pPJx6CgbhNZeUrabpWLB1ZC3YwalpiA1eS7pjjd2MDJW6Qr12V3ZKJBNKJkFi/1j1EwtXqj1lkuxgCwVSdtISgfsmqytRmzBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0HmXv2vgC9JiOiwC2owc/7NNYqlKUPIIwTzWTcU0C4=;
 b=beJiLyh8Ju38VtMZJ2cvusAYdhKB1xtrCAa8g44WGIYg3pMyPXp6OFdFbDrluALVdv4ZfAv2tRUMXcsOCUP2Ti4e3F2JkE7yn+XUzJz1LpnLi0y1TqrH+b3fyWdZQ72oM6iaK4qMV65U96a++kxKp8Qs5EhhrrtbnsCyb/YqFBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ0PR12MB6967.namprd12.prod.outlook.com (2603:10b6:a03:44b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Tue, 30 May
 2023 20:16:29 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 20:16:29 +0000
Message-ID: <dfed0531-e75b-13b1-0d75-4fdabc1b2ca1@amd.com>
Date: Tue, 30 May 2023 16:16:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 22/33] drm/amdkfd: update process interrupt handling for
 debug events
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-22-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-22-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ0PR12MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 058544db-c249-4dad-56d1-08db614ac0a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ugxx6U9AWRB4fGYFtnErBwwHb9e8Dtn9WvmYI0ZDORP4BxKw9IEvQB1tyZKeVBKHusxnphCXbWXA+NVDF1ljfinsvS4E3twLBl7Ksq2pov0gSfocm7lYzKrcFZ8MRjBm7iGeuZfVnTqe89qMOKnwIeCOrXQlBgn/L9hZkKohpQ5EXuWNwegbVJgYavLOOd+1FvY/R/i1aSL/KHvjSU9vZ+kYhQlkTFicm9Sfx+3TZc+oCqhVKBGeDw4kxeuDFVuwRnHKk92gTY/S0LqkceqjZudaRTxOXA4bX3fEsz1cM0HFNQXqjdpkF3FktigEfIRCniTt09VllXF7rTYpjADYHvq8ReG8WhDryie4uDqG/XZE6NY54hU+g1yBn66qi31E6D28QoEIm7iYl8uWRAUU03Tz20Hr4KhUGO4dAWtw8FGJZBXteaERxNqrya8jk+C+94Px84v58P5vT3Hx0J/vJWInd/A4xjSLriSbxicjUKn+bV0uv97W9mTthPZaXS2tybHKFw53rJ3yi9F5YQflHN5OcIUS0O0KARAoz3CJMC5rj7yN5sRVi5hsXowuYKxdSZIbdyYcTlRiMqNCijFTRgaS3fMO5ttRwrNpqFgSQ49Lprjcf411ABicyvLAd/KkXEzWWg62erx63L+rHPFuqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(41300700001)(66899021)(6486002)(5660300002)(186003)(8676002)(8936002)(36756003)(38100700002)(6506007)(6512007)(26005)(15650500001)(4326008)(66476007)(66556008)(44832011)(31686004)(316002)(66946007)(2906002)(30864003)(83380400001)(478600001)(2616005)(450100002)(31696002)(86362001)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1FsdWpQdjZ0K2tYbHo0aGxvTzBjVzhvY2NwdUVUdUZaM3ZYWkR1WEs4dU5N?=
 =?utf-8?B?Z25CR0xYcnhkbjZNZ1VHOHovZ3VLUFlZTmNHWTZZRENYTGR3Y2pPc21YOUZq?=
 =?utf-8?B?UTk0YmhldjZHeUQxbzNHZmNyVDNsa2FJOWd0aDJXWWdDNk9DN0ptSVVhVHFy?=
 =?utf-8?B?OVpVcWlnZWlkUmtSZUhPUWNKN2xhSE8wS3hQOGQ1TzFzbTB3K0tZekVQRHFB?=
 =?utf-8?B?WHJpb0ZVTWMzU0VZVDBORjlKQlFTK3J1SkRwYmlGU0VvcTlRbXI1RTRBeHZE?=
 =?utf-8?B?MVlHbnJlZ21aTW1VR0JBcWJ0MFNObmdTN3lZaUZqWmphUUpOa3ZEVHNpR2ZB?=
 =?utf-8?B?TUhIZ1preld2R0xDa29TYUsrc1RwUHZPVXRBNEdrdUpGdTBXVFplYXJoTTVC?=
 =?utf-8?B?RVFCUVk5Nk9ieWRGQ2VnQ3gxMnJzZDhFUTNFZVVZbnJIdHRjL0ZMYm1Fak50?=
 =?utf-8?B?aHpkZzI1dXZKQm91MFptMEIza1FsTDR1T1VJWEdEQ0kyNkE0V3RkYUJtWlQv?=
 =?utf-8?B?T3Y5S0hCT3M2bWdQbkVaVTU5SmZ5cFRtSC85UUJrRDFtWS9xRHN3ek1BRGdx?=
 =?utf-8?B?dS9pejUzUDgwVEVxbkNicytSb3lJRHNqZVF5Qlo3M2RBa3lsRVBJcXkxTmdp?=
 =?utf-8?B?elRiSUNmWk83NXQ3MWFkc3RGU0l2aXlZeWFKb0RaQTVhODNJZTRYUmZDTjVX?=
 =?utf-8?B?bVpJbmIvc1R4ZjcvVzFwaUMwLzQybks2SnExNjIyVThMeDRrTGJRdUhlTUo0?=
 =?utf-8?B?UUFvRksxRzVWZ09PelhJYUlhZ3E0WUExUnFMZ2tHTnV0VjUrVVFuKzFJbVdT?=
 =?utf-8?B?VUd5MTEvRlM5WFhjUXdKZDE0cTJuaUcwenFOTmlrWkpZS1R0YjVlbGdRZUVE?=
 =?utf-8?B?V0Y4OXpDZ2FibTc0dTRzSjdJRmtOb1djR2pMMjlENG9DeTFJTFVnZ1h1a2lt?=
 =?utf-8?B?aURqN3F3WnhOWi9tVk1Ba0xiQkwvOXlFOS9KdkVrcmtlcDNYN2NaOUR5MzVX?=
 =?utf-8?B?OFBpM3RqUEkyMUE3YXlONkJJWnhDQ1lxNFg2Ulo5K3hpendZb0hCcTZqY3dP?=
 =?utf-8?B?Ly81UFJYS3NyQ3hqOW5EcUlZSmxXYklteFpnOUdZbk5HczNwYlBJbURUc3g0?=
 =?utf-8?B?VDZQcURsOTB1MGZZZEZ1VzZCZHlIeVdzTUJRUWE4ZmtJTDVZYTIxVDdzblZK?=
 =?utf-8?B?MDZRd2tQL2Z0YkljQlFrT3prMm1NT1FjOWlqUFVMQWlYbXRPeXJhMlFrWXhm?=
 =?utf-8?B?a0oxeU5TcjU0UUROTUVXZ2ZXVUdPWXNuOS9pcVpCakJWMDRYdFpmK3oyMXVm?=
 =?utf-8?B?YWNwWFYvNk94MXBlUXgwZkZxSThKcCs0YXl6UVh3eTFpODhnc09VQ2xzQTla?=
 =?utf-8?B?VHI4alJJd1RCQUZjTXQ3TmFIQzIrLzJ0b29peGtKR1E1MEp6T00wanE1eWZq?=
 =?utf-8?B?RXZHSDlVbmRwSmw5MHVCa1RKTUw3cTNTUEFLaDBOTGF4a0pocWNGVUh6NEZM?=
 =?utf-8?B?MmFsY21KVVErN2tDcU9XYWx4WjVTdEh0WWh2RnZLOWVDeDFMSzhSd1pWa095?=
 =?utf-8?B?UDVTeFlJN3NOQVBxSXgrNkorVDV1ZGpkTmZDV1UxakRvUnJUWmJZSWRXdGcv?=
 =?utf-8?B?WFhQa0FlOXArWlpRNy8xZXNZWTdsc1puSnlNOTFiYVZVdkgyZkpqajhMWFJV?=
 =?utf-8?B?OHVxNTQ4ejJxaGVoWFQ3TWtTOVBTRVRYUVRoQi9LYmViYzA5TmFvalV4ckNj?=
 =?utf-8?B?NzNqNThaZURxMnh6VDVvd2txS1Q4L1J0VHpMZGdYdFJoVU1WWmF0L2FUNnZa?=
 =?utf-8?B?VE9rVlFrV2FtR3ZqSjhUb1FNZ3BWUjdtMnFiS1pub2hLc2s0ZEZqUG80MU8r?=
 =?utf-8?B?WlAxSVhlZnU0Nm81T05pWWNSVWZVZVFLN2p5eE5xdndIbDNFSkdjQ2s2VURK?=
 =?utf-8?B?K0phS3RPTUdwRnh5b2gwVVRCOUlHeDFPUUM5SXFiSUNzZVNjdlpvWC84L1pW?=
 =?utf-8?B?YlJNNWtxb1pqaGdSY2FKMlRNdDN1QUtWc0h3aEE0aS95a1l5NGRiZ1pXUStp?=
 =?utf-8?B?STFnWEtmREgwMGVUMWhoQWJpY0NROGY4ajJYRW5MRGlJOTNSRTRQK1N0Y2tx?=
 =?utf-8?Q?bG+pjmqu1u6C3WlcHbXedX70V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058544db-c249-4dad-56d1-08db614ac0a9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 20:16:29.3453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTWnG+//jbrpCcF7Y5Sg9xS12ZcoAVKsmdDOs8APSlvpHyq4S17iUkLhuBeXgun4DhAIE+PZx/APm/HzFKZM1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6967
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> The debugger must be notified by any debugger subscribed exception
> that comes from hardware interrupts.
>
> If a debugger session exits, any exceptions it subscribed to may still
> have interrupts in the interrupt ring buffer or KGD/KFD pipeline.
> To prevent a new session from inheriting stale interrupts, when a new
> queue is created, open an interrupt drain and allow the IH ring to drain
> from a timestamped checkpoint.  Then inject a custom IV so that once
> the custom IV is picked up by the KFD, it's safe to close the drain
> and proceed with queue creation.
>
> The drain must also be on debug disable as SW interrupts may still
> be processed.  Drain at this time and clear all the exception status.
>
> The debugger may also not be attached nor subscibed to certain
> exceptions so forward them directly to the runtime.
>
> GFX10 also requires its own IV processing, hence the creation of
> kfd_int_process_v10.c.  This is because the IV from SQ interrupts are
> packed into a new continguous format unlike GFX9. To make this clear,
> a separate interrupting handling code file was created.
>
> v2: use new kfd_node struct in prototypes.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  16 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   2 +
>   drivers/gpu/drm/amd/amdkfd/Makefile           |   1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        |  84 ++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |   6 +
>   drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   4 +-
>   .../gpu/drm/amd/amdkfd/kfd_int_process_v10.c  | 405 ++++++++++++++++++
>   .../gpu/drm/amd/amdkfd/kfd_int_process_v11.c  |  21 +-
>   .../gpu/drm/amd/amdkfd/kfd_int_process_v9.c   |  98 ++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  12 +
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  47 ++
>   .../amd/amdkfd/kfd_process_queue_manager.c    |   4 +
>   12 files changed, 680 insertions(+), 20 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 66f80b9ab0c5..98cd52bb005f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -777,6 +777,22 @@ void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev, bo
>   	amdgpu_umc_poison_handler(adev, reset);
>   }
>   
> +int amdgpu_amdkfd_send_close_event_drain_irq(struct amdgpu_device *adev,
> +					uint32_t *payload)
> +{
> +	int ret;
> +
> +	/* Device or IH ring is not ready so bail. */
> +	ret = amdgpu_ih_wait_on_checkpoint_process_ts(adev, &adev->irq.ih);
> +	if (ret)
> +		return ret;
> +
> +	/* Send payload to fence KFD interrupts */
> +	amdgpu_amdkfd_interrupt(adev, payload);
> +
> +	return 0;
> +}
> +
>   bool amdgpu_amdkfd_ras_query_utcl2_poison_status(struct amdgpu_device *adev)
>   {
>   	if (adev->gfx.ras && adev->gfx.ras->query_utcl2_poison_status)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 94cc456761e5..dd740e64e6e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -250,6 +250,8 @@ int amdgpu_amdkfd_get_xgmi_bandwidth_mbytes(struct amdgpu_device *dst,
>   					    struct amdgpu_device *src,
>   					    bool is_min);
>   int amdgpu_amdkfd_get_pcie_bandwidth_mbytes(struct amdgpu_device *adev, bool is_min);
> +int amdgpu_amdkfd_send_close_event_drain_irq(struct amdgpu_device *adev,
> +					uint32_t *payload);
>   
>   /* Read user wptr from a specified user address space with page fault
>    * disabled. The memory must be pinned and mapped to the hardware when
> diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
> index 747754428073..2ec8f27c5366 100644
> --- a/drivers/gpu/drm/amd/amdkfd/Makefile
> +++ b/drivers/gpu/drm/amd/amdkfd/Makefile
> @@ -53,6 +53,7 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
>   		$(AMDKFD_PATH)/kfd_events.o \
>   		$(AMDKFD_PATH)/cik_event_interrupt.o \
>   		$(AMDKFD_PATH)/kfd_int_process_v9.o \
> +		$(AMDKFD_PATH)/kfd_int_process_v10.o \
>   		$(AMDKFD_PATH)/kfd_int_process_v11.o \
>   		$(AMDKFD_PATH)/kfd_smi_events.o \
>   		$(AMDKFD_PATH)/kfd_crat.o \
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 17e8e9edccbf..68b657398d41 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -125,6 +125,64 @@ bool kfd_dbg_ev_raise(uint64_t event_mask,
>   	return is_subscribed;
>   }
>   
> +/* set pending event queue entry from ring entry  */
> +bool kfd_set_dbg_ev_from_interrupt(struct kfd_node *dev,
> +				   unsigned int pasid,
> +				   uint32_t doorbell_id,
> +				   uint64_t trap_mask,
> +				   void *exception_data,
> +				   size_t exception_data_size)
> +{
> +	struct kfd_process *p;
> +	bool signaled_to_debugger_or_runtime = false;
> +
> +	p = kfd_lookup_process_by_pasid(pasid);
> +
> +	if (!p)
> +		return false;
> +
> +	if (!kfd_dbg_ev_raise(trap_mask, p, dev, doorbell_id, true,
> +			      exception_data, exception_data_size)) {
> +		struct process_queue_manager *pqm;
> +		struct process_queue_node *pqn;
> +
> +		if (!!(trap_mask & KFD_EC_MASK_QUEUE) &&
> +		       p->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED) {
> +			mutex_lock(&p->mutex);
> +
> +			pqm = &p->pqm;
> +			list_for_each_entry(pqn, &pqm->queues,
> +							process_queue_list) {
> +
> +				if (!(pqn->q && pqn->q->device == dev &&
> +				      pqn->q->doorbell_id == doorbell_id))
> +					continue;
> +
> +				kfd_send_exception_to_runtime(p, pqn->q->properties.queue_id,
> +							      trap_mask);
> +
> +				signaled_to_debugger_or_runtime = true;
> +
> +				break;
> +			}
> +
> +			mutex_unlock(&p->mutex);
> +		} else if (trap_mask & KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION)) {
> +			kfd_dqm_evict_pasid(dev->dqm, p->pasid);
> +			kfd_signal_vm_fault_event(dev, p->pasid, NULL,
> +							exception_data);
> +
> +			signaled_to_debugger_or_runtime = true;
> +		}
> +	} else {
> +		signaled_to_debugger_or_runtime = true;
> +	}
> +
> +	kfd_unref_process(p);
> +
> +	return signaled_to_debugger_or_runtime;
> +}
> +
>   int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
>   					unsigned int dev_id,
>   					unsigned int queue_id,
> @@ -281,6 +339,31 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
>   	kfd_dbg_set_workaround(target, false);
>   }
>   
> +static void kfd_dbg_clean_exception_status(struct kfd_process *target)
> +{
> +	struct process_queue_manager *pqm;
> +	struct process_queue_node *pqn;
> +	int i;
> +
> +	for (i = 0; i < target->n_pdds; i++) {
> +		struct kfd_process_device *pdd = target->pdds[i];
> +
> +		kfd_process_drain_interrupts(pdd);
> +
> +		pdd->exception_status = 0;
> +	}
> +
> +	pqm = &target->pqm;
> +	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
> +		if (!pqn->q)
> +			continue;
> +
> +		pqn->q->properties.exception_status = 0;
> +	}
> +
> +	target->exception_status = 0;
> +}
> +
>   int kfd_dbg_trap_disable(struct kfd_process *target)
>   {
>   	if (!target->debug_trap_enabled)
> @@ -304,6 +387,7 @@ int kfd_dbg_trap_disable(struct kfd_process *target)
>   	}
>   
>   	target->debug_trap_enabled = false;
> +	kfd_dbg_clean_exception_status(target);
>   	kfd_unref_process(target);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index fca928564948..5153ccbd7fd1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -27,6 +27,12 @@
>   
>   void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count);
>   int kfd_dbg_trap_activate(struct kfd_process *target);
> +bool kfd_set_dbg_ev_from_interrupt(struct kfd_node *dev,
> +				   unsigned int pasid,
> +				   uint32_t doorbell_id,
> +				   uint64_t trap_mask,
> +				   void *exception_data,
> +				   size_t exception_data_size);
>   bool kfd_dbg_ev_raise(uint64_t event_mask,
>   			struct kfd_process *process, struct kfd_node *dev,
>   			unsigned int source_id, bool use_worker,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> index 862a50f7b490..1eb57a4798f4 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -140,6 +140,8 @@ static void kfd_device_info_set_event_interrupt_class(struct kfd_dev *kfd)
>   	case IP_VERSION(9, 4, 1): /* ARCTURUS */
>   	case IP_VERSION(9, 4, 2): /* ALDEBARAN */
>   	case IP_VERSION(9, 4, 3): /* GC 9.4.3 */
> +		kfd->device_info.event_interrupt_class = &event_interrupt_class_v9;
> +		break;
>   	case IP_VERSION(10, 3, 1): /* VANGOGH */
>   	case IP_VERSION(10, 3, 3): /* YELLOW_CARP */
>   	case IP_VERSION(10, 3, 6): /* GC 10.3.6 */
> @@ -153,7 +155,7 @@ static void kfd_device_info_set_event_interrupt_class(struct kfd_dev *kfd)
>   	case IP_VERSION(10, 3, 2): /* NAVY_FLOUNDER */
>   	case IP_VERSION(10, 3, 4): /* DIMGREY_CAVEFISH */
>   	case IP_VERSION(10, 3, 5): /* BEIGE_GOBY */
> -		kfd->device_info.event_interrupt_class = &event_interrupt_class_v9;
> +		kfd->device_info.event_interrupt_class = &event_interrupt_class_v10;
>   		break;
>   	case IP_VERSION(11, 0, 0):
>   	case IP_VERSION(11, 0, 1):
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
> new file mode 100644
> index 000000000000..c7991e07b6be
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
> @@ -0,0 +1,405 @@
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "kfd_events.h"
> +#include "kfd_debug.h"
> +#include "soc15_int.h"
> +#include "kfd_device_queue_manager.h"
> +
> +/*
> + * GFX10 SQ Interrupts
> + *
> + * There are 3 encoding types of interrupts sourced from SQ sent as a 44-bit
> + * packet to the Interrupt Handler:
> + * Auto - Generated by the SQG (various cmd overflows, timestamps etc)
> + * Wave - Generated by S_SENDMSG through a shader program
> + * Error - HW generated errors (Illegal instructions, Memviols, EDC etc)
> + *
> + * The 44-bit packet is mapped as {context_id1[7:0],context_id0[31:0]} plus
> + * 4-bits for VMID (SOC15_VMID_FROM_IH_ENTRY) as such:
> + *
> + * - context_id1[7:6]
> + * Encoding type (0 = Auto, 1 = Wave, 2 = Error)
> + *
> + * - context_id0[24]
> + * PRIV bit indicates that Wave S_SEND or error occurred within trap
> + *
> + * - context_id0[22:0]
> + * 23-bit data with the following layout per encoding type:
> + * Auto - only context_id0[8:0] is used, which reports various interrupts
> + * generated by SQG.  The rest is 0.
> + * Wave - user data sent from m0 via S_SENDMSG
> + * Error - Error type (context_id0[22:19]), Error Details (rest of bits)
> + *
> + * The other context_id bits show coordinates (SE/SH/CU/SIMD/WGP) for wave
> + * S_SENDMSG and Errors.  These are 0 for Auto.
> + */
> +
> +enum SQ_INTERRUPT_WORD_ENCODING {
> +	SQ_INTERRUPT_WORD_ENCODING_AUTO = 0x0,
> +	SQ_INTERRUPT_WORD_ENCODING_INST,
> +	SQ_INTERRUPT_WORD_ENCODING_ERROR,
> +};
> +
> +enum SQ_INTERRUPT_ERROR_TYPE {
> +	SQ_INTERRUPT_ERROR_TYPE_EDC_FUE = 0x0,
> +	SQ_INTERRUPT_ERROR_TYPE_ILLEGAL_INST,
> +	SQ_INTERRUPT_ERROR_TYPE_MEMVIOL,
> +	SQ_INTERRUPT_ERROR_TYPE_EDC_FED,
> +};
> +
> +/* SQ_INTERRUPT_WORD_AUTO_CTXID */
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE__SHIFT 0
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID0__WLT__SHIFT 1
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_BUF0_FULL__SHIFT 2
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_BUF1_FULL__SHIFT 3
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_UTC_ERROR__SHIFT 7
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID1__SE_ID__SHIFT 4
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID1__ENCODING__SHIFT 6
> +
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_MASK 0x00000001
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID0__WLT_MASK 0x00000002
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_BUF0_FULL_MASK 0x00000004
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_BUF1_FULL_MASK 0x00000008
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_UTC_ERROR_MASK 0x00000080
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID1__SE_ID_MASK 0x030
> +#define SQ_INTERRUPT_WORD_AUTO_CTXID1__ENCODING_MASK 0x0c0
> +
> +/* SQ_INTERRUPT_WORD_WAVE_CTXID */
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID0__DATA__SHIFT 0
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID0__SA_ID__SHIFT 23
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID0__PRIV__SHIFT 24
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID0__WAVE_ID__SHIFT 25
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID0__SIMD_ID__SHIFT 30
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID1__WGP_ID__SHIFT 0
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID1__SE_ID__SHIFT 4
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID1__ENCODING__SHIFT 6
> +
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID0__DATA_MASK 0x000007fffff
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID0__SA_ID_MASK 0x0000800000
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID0__PRIV_MASK 0x00001000000
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID0__WAVE_ID_MASK 0x0003e000000
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID0__SIMD_ID_MASK 0x000c0000000
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID1__WGP_ID_MASK 0x00f
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID1__SE_ID_MASK 0x030
> +#define SQ_INTERRUPT_WORD_WAVE_CTXID1__ENCODING_MASK 0x0c0
> +
> +#define KFD_CTXID0__ERR_TYPE_MASK 0x780000
> +#define KFD_CTXID0__ERR_TYPE__SHIFT 19
> +
> +/* GFX10 SQ interrupt ENC type bit (context_id1[7:6]) for wave s_sendmsg */
> +#define KFD_CONTEXT_ID1_ENC_TYPE_WAVE_MASK	0x40
> +/* GFX10 SQ interrupt PRIV bit (context_id0[24]) for s_sendmsg inside trap */
> +#define KFD_CONTEXT_ID0_PRIV_MASK		0x1000000
> +/*
> + * The debugger will send user data(m0) with PRIV=1 to indicate it requires
> + * notification from the KFD with the following queue id (DOORBELL_ID) and
> + * trap code (TRAP_CODE).
> + */
> +#define KFD_CONTEXT_ID0_DEBUG_DOORBELL_MASK	0x0003ff
> +#define KFD_CONTEXT_ID0_DEBUG_TRAP_CODE_SHIFT	10
> +#define KFD_CONTEXT_ID0_DEBUG_TRAP_CODE_MASK	0x07fc00
> +#define KFD_DEBUG_DOORBELL_ID(ctxid0)	((ctxid0) &	\
> +				KFD_CONTEXT_ID0_DEBUG_DOORBELL_MASK)
> +#define KFD_DEBUG_TRAP_CODE(ctxid0)	(((ctxid0) &	\
> +				KFD_CONTEXT_ID0_DEBUG_TRAP_CODE_MASK)	\
> +				>> KFD_CONTEXT_ID0_DEBUG_TRAP_CODE_SHIFT)
> +#define KFD_DEBUG_CP_BAD_OP_ECODE_MASK		0x3fffc00
> +#define KFD_DEBUG_CP_BAD_OP_ECODE_SHIFT		10
> +#define KFD_DEBUG_CP_BAD_OP_ECODE(ctxid0) (((ctxid0) &			\
> +				KFD_DEBUG_CP_BAD_OP_ECODE_MASK)		\
> +				>> KFD_DEBUG_CP_BAD_OP_ECODE_SHIFT)
> +
> +static void event_interrupt_poison_consumption(struct kfd_node *dev,
> +				uint16_t pasid, uint16_t client_id)
> +{
> +	int old_poison, ret = -EINVAL;
> +	struct kfd_process *p = kfd_lookup_process_by_pasid(pasid);
> +
> +	if (!p)
> +		return;
> +
> +	/* all queues of a process will be unmapped in one time */
> +	old_poison = atomic_cmpxchg(&p->poison, 0, 1);
> +	kfd_unref_process(p);
> +	if (old_poison)
> +		return;
> +
> +	switch (client_id) {
> +	case SOC15_IH_CLIENTID_SE0SH:
> +	case SOC15_IH_CLIENTID_SE1SH:
> +	case SOC15_IH_CLIENTID_SE2SH:
> +	case SOC15_IH_CLIENTID_SE3SH:
> +	case SOC15_IH_CLIENTID_UTCL2:
> +		ret = kfd_dqm_evict_pasid(dev->dqm, pasid);
> +		break;
> +	case SOC15_IH_CLIENTID_SDMA0:
> +	case SOC15_IH_CLIENTID_SDMA1:
> +	case SOC15_IH_CLIENTID_SDMA2:
> +	case SOC15_IH_CLIENTID_SDMA3:
> +	case SOC15_IH_CLIENTID_SDMA4:
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	kfd_signal_poison_consumed_event(dev, pasid);
> +
> +	/* resetting queue passes, do page retirement without gpu reset
> +	 * resetting queue fails, fallback to gpu reset solution
> +	 */
> +	if (!ret) {
> +		dev_warn(dev->adev->dev,
> +			"RAS poison consumption, unmap queue flow succeeded: client id %d\n",
> +			client_id);
> +		amdgpu_amdkfd_ras_poison_consumption_handler(dev->adev, false);
> +	} else {
> +		dev_warn(dev->adev->dev,
> +			"RAS poison consumption, fall back to gpu reset flow: client id %d\n",
> +			client_id);
> +		amdgpu_amdkfd_ras_poison_consumption_handler(dev->adev, true);
> +	}
> +}
> +
> +static bool event_interrupt_isr_v10(struct kfd_node *dev,
> +					const uint32_t *ih_ring_entry,
> +					uint32_t *patched_ihre,
> +					bool *patched_flag)
> +{
> +	uint16_t source_id, client_id, pasid, vmid;
> +	const uint32_t *data = ih_ring_entry;
> +
> +	source_id = SOC15_SOURCE_ID_FROM_IH_ENTRY(ih_ring_entry);
> +	client_id = SOC15_CLIENT_ID_FROM_IH_ENTRY(ih_ring_entry);
> +
> +	/* Only handle interrupts from KFD VMIDs */
> +	vmid = SOC15_VMID_FROM_IH_ENTRY(ih_ring_entry);
> +	if (!KFD_IRQ_IS_FENCE(client_id, source_id) &&
> +	   (vmid < dev->vm_info.first_vmid_kfd ||
> +	    vmid > dev->vm_info.last_vmid_kfd))
> +		return false;
> +
> +	pasid = SOC15_PASID_FROM_IH_ENTRY(ih_ring_entry);
> +
> +	/* Only handle clients we care about */
> +	if (client_id != SOC15_IH_CLIENTID_GRBM_CP &&
> +	    client_id != SOC15_IH_CLIENTID_SDMA0 &&
> +	    client_id != SOC15_IH_CLIENTID_SDMA1 &&
> +	    client_id != SOC15_IH_CLIENTID_SDMA2 &&
> +	    client_id != SOC15_IH_CLIENTID_SDMA3 &&
> +	    client_id != SOC15_IH_CLIENTID_SDMA4 &&
> +	    client_id != SOC15_IH_CLIENTID_SDMA5 &&
> +	    client_id != SOC15_IH_CLIENTID_SDMA6 &&
> +	    client_id != SOC15_IH_CLIENTID_SDMA7 &&
> +	    client_id != SOC15_IH_CLIENTID_VMC &&
> +	    client_id != SOC15_IH_CLIENTID_VMC1 &&
> +	    client_id != SOC15_IH_CLIENTID_UTCL2 &&
> +	    client_id != SOC15_IH_CLIENTID_SE0SH &&
> +	    client_id != SOC15_IH_CLIENTID_SE1SH &&
> +	    client_id != SOC15_IH_CLIENTID_SE2SH &&
> +	    client_id != SOC15_IH_CLIENTID_SE3SH)
> +		return false;
> +
> +	pr_debug("client id 0x%x, source id %d, vmid %d, pasid 0x%x. raw data:\n",
> +		 client_id, source_id, vmid, pasid);
> +	pr_debug("%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X.\n",
> +		 data[0], data[1], data[2], data[3],
> +		 data[4], data[5], data[6], data[7]);
> +
> +	/* If there is no valid PASID, it's likely a bug */
> +	if (WARN_ONCE(pasid == 0, "Bug: No PASID in KFD interrupt"))
> +		return 0;
> +
> +	/* Interrupt types we care about: various signals and faults.
> +	 * They will be forwarded to a work queue (see below).
> +	 */
> +	return source_id == SOC15_INTSRC_CP_END_OF_PIPE ||
> +		source_id == SOC15_INTSRC_SDMA_TRAP ||
> +		source_id == SOC15_INTSRC_SQ_INTERRUPT_MSG ||
> +		source_id == SOC15_INTSRC_CP_BAD_OPCODE ||
> +		client_id == SOC15_IH_CLIENTID_VMC ||
> +		client_id == SOC15_IH_CLIENTID_VMC1 ||
> +		client_id == SOC15_IH_CLIENTID_UTCL2 ||
> +		KFD_IRQ_IS_FENCE(client_id, source_id);
> +}
> +
> +static void event_interrupt_wq_v10(struct kfd_node *dev,
> +					const uint32_t *ih_ring_entry)
> +{
> +	uint16_t source_id, client_id, pasid, vmid;
> +	uint32_t context_id0, context_id1;
> +	uint32_t encoding, sq_intr_err_type;
> +
> +	source_id = SOC15_SOURCE_ID_FROM_IH_ENTRY(ih_ring_entry);
> +	client_id = SOC15_CLIENT_ID_FROM_IH_ENTRY(ih_ring_entry);
> +	pasid = SOC15_PASID_FROM_IH_ENTRY(ih_ring_entry);
> +	vmid = SOC15_VMID_FROM_IH_ENTRY(ih_ring_entry);
> +	context_id0 = SOC15_CONTEXT_ID0_FROM_IH_ENTRY(ih_ring_entry);
> +	context_id1 = SOC15_CONTEXT_ID1_FROM_IH_ENTRY(ih_ring_entry);
> +
> +	if (client_id == SOC15_IH_CLIENTID_GRBM_CP ||
> +	    client_id == SOC15_IH_CLIENTID_SE0SH ||
> +	    client_id == SOC15_IH_CLIENTID_SE1SH ||
> +	    client_id == SOC15_IH_CLIENTID_SE2SH ||
> +	    client_id == SOC15_IH_CLIENTID_SE3SH) {
> +		if (source_id == SOC15_INTSRC_CP_END_OF_PIPE)
> +			kfd_signal_event_interrupt(pasid, context_id0, 32);
> +		else if (source_id == SOC15_INTSRC_SQ_INTERRUPT_MSG) {
> +			encoding = REG_GET_FIELD(context_id1,
> +						SQ_INTERRUPT_WORD_WAVE_CTXID1, ENCODING);
> +			switch (encoding) {
> +			case SQ_INTERRUPT_WORD_ENCODING_AUTO:
> +				pr_debug(
> +					"sq_intr: auto, se %d, ttrace %d, wlt %d, ttrac_buf0_full %d, ttrac_buf1_full %d, ttrace_utc_err %d\n",
> +					REG_GET_FIELD(context_id1, SQ_INTERRUPT_WORD_AUTO_CTXID1,
> +							SE_ID),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0,
> +							THREAD_TRACE),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0,
> +							WLT),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0,
> +							THREAD_TRACE_BUF0_FULL),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0,
> +							THREAD_TRACE_BUF1_FULL),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0,
> +							THREAD_TRACE_UTC_ERROR));
> +				break;
> +			case SQ_INTERRUPT_WORD_ENCODING_INST:
> +				pr_debug("sq_intr: inst, se %d, data 0x%x, sa %d, priv %d, wave_id %d, simd_id %d, wgp_id %d\n",
> +					REG_GET_FIELD(context_id1, SQ_INTERRUPT_WORD_WAVE_CTXID1,
> +							SE_ID),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
> +							DATA),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
> +							SA_ID),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
> +							PRIV),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
> +							WAVE_ID),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
> +							SIMD_ID),
> +					REG_GET_FIELD(context_id1, SQ_INTERRUPT_WORD_WAVE_CTXID1,
> +							WGP_ID));
> +				if (context_id0 & SQ_INTERRUPT_WORD_WAVE_CTXID0__PRIV_MASK) {
> +					if (kfd_set_dbg_ev_from_interrupt(dev, pasid,
> +							KFD_DEBUG_DOORBELL_ID(context_id0),
> +							KFD_DEBUG_TRAP_CODE(context_id0),
> +							NULL, 0))
> +						return;
> +				}
> +				break;
> +			case SQ_INTERRUPT_WORD_ENCODING_ERROR:
> +				sq_intr_err_type = REG_GET_FIELD(context_id0, KFD_CTXID0,
> +								ERR_TYPE);
> +				pr_warn("sq_intr: error, se %d, data 0x%x, sa %d, priv %d, wave_id %d, simd_id %d, wgp_id %d, err_type %d\n",
> +					REG_GET_FIELD(context_id1, SQ_INTERRUPT_WORD_WAVE_CTXID1,
> +							SE_ID),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
> +							DATA),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
> +							SA_ID),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
> +							PRIV),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
> +							WAVE_ID),
> +					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0,
> +							SIMD_ID),
> +					REG_GET_FIELD(context_id1, SQ_INTERRUPT_WORD_WAVE_CTXID1,
> +							WGP_ID),
> +					sq_intr_err_type);
> +				if (sq_intr_err_type != SQ_INTERRUPT_ERROR_TYPE_ILLEGAL_INST &&
> +					sq_intr_err_type != SQ_INTERRUPT_ERROR_TYPE_MEMVIOL) {
> +					event_interrupt_poison_consumption(dev, pasid, source_id);
> +					return;
> +				}
> +				break;
> +			default:
> +				break;
> +			}
> +			kfd_signal_event_interrupt(pasid, context_id0 & 0x7fffff, 23);
> +		} else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE) {
> +			kfd_set_dbg_ev_from_interrupt(dev, pasid,
> +				KFD_DEBUG_DOORBELL_ID(context_id0),
> +				KFD_EC_MASK(KFD_DEBUG_CP_BAD_OP_ECODE(context_id0)),
> +				NULL,
> +				0);
> +		}
> +	} else if (client_id == SOC15_IH_CLIENTID_SDMA0 ||
> +		   client_id == SOC15_IH_CLIENTID_SDMA1 ||
> +		   client_id == SOC15_IH_CLIENTID_SDMA2 ||
> +		   client_id == SOC15_IH_CLIENTID_SDMA3 ||
> +		   (client_id == SOC15_IH_CLIENTID_SDMA3_Sienna_Cichlid &&
> +		    KFD_GC_VERSION(dev) == IP_VERSION(10, 3, 0)) ||
> +		   client_id == SOC15_IH_CLIENTID_SDMA4 ||
> +		   client_id == SOC15_IH_CLIENTID_SDMA5 ||
> +		   client_id == SOC15_IH_CLIENTID_SDMA6 ||
> +		   client_id == SOC15_IH_CLIENTID_SDMA7) {
> +		if (source_id == SOC15_INTSRC_SDMA_TRAP) {
> +			kfd_signal_event_interrupt(pasid, context_id0 & 0xfffffff, 28);
> +		} else if (source_id == SOC15_INTSRC_SDMA_ECC) {
> +			event_interrupt_poison_consumption(dev, pasid, source_id);
> +			return;
> +		}
> +	} else if (client_id == SOC15_IH_CLIENTID_VMC ||
> +		   client_id == SOC15_IH_CLIENTID_VMC1 ||
> +		   client_id == SOC15_IH_CLIENTID_UTCL2) {
> +		struct kfd_vm_fault_info info = {0};
> +		uint16_t ring_id = SOC15_RING_ID_FROM_IH_ENTRY(ih_ring_entry);
> +		struct kfd_hsa_memory_exception_data exception_data;
> +
> +		if (client_id == SOC15_IH_CLIENTID_UTCL2 &&
> +				amdgpu_amdkfd_ras_query_utcl2_poison_status(dev->adev)) {
> +			event_interrupt_poison_consumption(dev, pasid, client_id);
> +			return;
> +		}
> +
> +		info.vmid = vmid;
> +		info.mc_id = client_id;
> +		info.page_addr = ih_ring_entry[4] |
> +			(uint64_t)(ih_ring_entry[5] & 0xf) << 32;
> +		info.prot_valid = ring_id & 0x08;
> +		info.prot_read  = ring_id & 0x10;
> +		info.prot_write = ring_id & 0x20;
> +
> +		memset(&exception_data, 0, sizeof(exception_data));
> +		exception_data.gpu_id = dev->id;
> +		exception_data.va = (info.page_addr) << PAGE_SHIFT;
> +		exception_data.failure.NotPresent = info.prot_valid ? 1 : 0;
> +		exception_data.failure.NoExecute = info.prot_exec ? 1 : 0;
> +		exception_data.failure.ReadOnly = info.prot_write ? 1 : 0;
> +		exception_data.failure.imprecise = 0;
> +
> +		kfd_set_dbg_ev_from_interrupt(dev,
> +						pasid,
> +						-1,
> +						KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION),
> +						&exception_data,
> +						sizeof(exception_data));
> +	} else if (KFD_IRQ_IS_FENCE(client_id, source_id)) {
> +		kfd_process_close_interrupt_drain(pasid);
> +	}
> +}
> +
> +const struct kfd_event_interrupt_class event_interrupt_class_v10 = {
> +	.interrupt_isr = event_interrupt_isr_v10,
> +	.interrupt_wq = event_interrupt_wq_v10,
> +};
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> index 0f0fdea4cd8a..1f92c6c6f181 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> @@ -26,6 +26,7 @@
>   #include "kfd_device_queue_manager.h"
>   #include "ivsrcid/vmc/irqsrcs_vmc_1_0.h"
>   #include "kfd_smi_events.h"
> +#include "kfd_debug.h"
>   
>   /*
>    * GFX11 SQ Interrupts
> @@ -238,7 +239,7 @@ static bool event_interrupt_isr_v11(struct kfd_node *dev,
>   	client_id = SOC15_CLIENT_ID_FROM_IH_ENTRY(ih_ring_entry);
>   	/* Only handle interrupts from KFD VMIDs */
>   	vmid = SOC15_VMID_FROM_IH_ENTRY(ih_ring_entry);
> -	if (/*!KFD_IRQ_IS_FENCE(client_id, source_id) &&*/
> +	if (!KFD_IRQ_IS_FENCE(client_id, source_id) &&
>   	    (vmid < dev->vm_info.first_vmid_kfd ||
>   	    vmid > dev->vm_info.last_vmid_kfd))
>   		return false;
> @@ -267,7 +268,7 @@ static bool event_interrupt_isr_v11(struct kfd_node *dev,
>   		source_id == SOC15_INTSRC_SQ_INTERRUPT_MSG ||
>   		source_id == SOC15_INTSRC_CP_BAD_OPCODE ||
>   		source_id == SOC21_INTSRC_SDMA_TRAP ||
> -		/* KFD_IRQ_IS_FENCE(client_id, source_id) || */
> +		KFD_IRQ_IS_FENCE(client_id, source_id) ||
>   		(((client_id == SOC21_IH_CLIENTID_VMC) ||
>   		 ((client_id == SOC21_IH_CLIENTID_GFX) &&
>   		  (source_id == UTCL2_1_0__SRCID__FAULT))) &&
> @@ -312,9 +313,9 @@ static void event_interrupt_wq_v11(struct kfd_node *dev,
>   		exception_data.failure.ReadOnly = info.prot_write ? 1 : 0;
>   		exception_data.failure.imprecise = 0;
>   
> -		/*kfd_set_dbg_ev_from_interrupt(dev, pasid, -1,
> +		kfd_set_dbg_ev_from_interrupt(dev, pasid, -1,
>   					      KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION),
> -					      &exception_data, sizeof(exception_data));*/
> +					      &exception_data, sizeof(exception_data));
>   		kfd_smi_event_update_vmfault(dev, pasid);
>   
>   	/* GRBM, SDMA, SE, PMM */
> @@ -324,11 +325,11 @@ static void event_interrupt_wq_v11(struct kfd_node *dev,
>   		/* CP */
>   		if (source_id == SOC15_INTSRC_CP_END_OF_PIPE)
>   			kfd_signal_event_interrupt(pasid, context_id0, 32);
> -		/*else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE)
> +		else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE)
>   			kfd_set_dbg_ev_from_interrupt(dev, pasid,
>   				KFD_CTXID0_DOORBELL_ID(context_id0),
>   				KFD_EC_MASK(KFD_CTXID0_CP_BAD_OP_ECODE(context_id0)),
> -				NULL, 0);*/
> +				NULL, 0);
>   
>   		/* SDMA */
>   		else if (source_id == SOC21_INTSRC_SDMA_TRAP)
> @@ -350,11 +351,11 @@ static void event_interrupt_wq_v11(struct kfd_node *dev,
>   				print_sq_intr_info_inst(context_id0, context_id1);
>   				sq_int_priv = REG_GET_FIELD(context_id0,
>   						SQ_INTERRUPT_WORD_WAVE_CTXID0, PRIV);
> -				/*if (sq_int_priv && (kfd_set_dbg_ev_from_interrupt(dev, pasid,
> +				if (sq_int_priv && (kfd_set_dbg_ev_from_interrupt(dev, pasid,
>   						KFD_CTXID0_DOORBELL_ID(context_id0),
>   						KFD_CTXID0_TRAP_CODE(context_id0),
>   						NULL, 0)))
> -					return;*/
> +					return;
>   				break;
>   			case SQ_INTERRUPT_WORD_ENCODING_ERROR:
>   				print_sq_intr_info_error(context_id0, context_id1);
> @@ -373,8 +374,8 @@ static void event_interrupt_wq_v11(struct kfd_node *dev,
>   			kfd_signal_event_interrupt(pasid, context_id0 & 0xffffff, 24);
>   		}
>   
> -	/*} else if (KFD_IRQ_IS_FENCE(client_id, source_id)) {
> -		kfd_process_close_interrupt_drain(pasid);*/
> +	} else if (KFD_IRQ_IS_FENCE(client_id, source_id)) {
> +		kfd_process_close_interrupt_drain(pasid);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
> index 8cf58be80f4e..d5c9f30552e3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
> @@ -23,10 +23,40 @@
>   
>   #include "kfd_priv.h"
>   #include "kfd_events.h"
> +#include "kfd_debug.h"
>   #include "soc15_int.h"
>   #include "kfd_device_queue_manager.h"
>   #include "kfd_smi_events.h"
>   
> +/*
> + * GFX9 SQ Interrupts
> + *
> + * There are 3 encoding types of interrupts sourced from SQ sent as a 44-bit
> + * packet to the Interrupt Handler:
> + * Auto - Generated by the SQG (various cmd overflows, timestamps etc)
> + * Wave - Generated by S_SENDMSG through a shader program
> + * Error - HW generated errors (Illegal instructions, Memviols, EDC etc)
> + *
> + * The 44-bit packet is mapped as {context_id1[7:0],context_id0[31:0]} plus
> + * 4-bits for VMID (SOC15_VMID_FROM_IH_ENTRY) as such:
> + *
> + * - context_id0[27:26]
> + * Encoding type (0 = Auto, 1 = Wave, 2 = Error)
> + *
> + * - context_id0[13]
> + * PRIV bit indicates that Wave S_SEND or error occurred within trap
> + *
> + * - {context_id1[7:0],context_id0[31:28],context_id0[11:0]}
> + * 24-bit data with the following layout per encoding type:
> + * Auto - only context_id0[8:0] is used, which reports various interrupts
> + * generated by SQG.  The rest is 0.
> + * Wave - user data sent from m0 via S_SENDMSG
> + * Error - Error type (context_id1[7:4]), Error Details (rest of bits)
> + *
> + * The other context_id bits show coordinates (SE/SH/CU/SIMD/WAVE) for wave
> + * S_SENDMSG and Errors.  These are 0 for Auto.
> + */
> +
>   enum SQ_INTERRUPT_WORD_ENCODING {
>   	SQ_INTERRUPT_WORD_ENCODING_AUTO = 0x0,
>   	SQ_INTERRUPT_WORD_ENCODING_INST,
> @@ -84,12 +114,32 @@ enum SQ_INTERRUPT_ERROR_TYPE {
>   #define SQ_INTERRUPT_WORD_WAVE_CTXID__SE_ID_MASK 0x03000000
>   #define SQ_INTERRUPT_WORD_WAVE_CTXID__ENCODING_MASK 0x0c000000
>   
> +/* GFX9 SQ interrupt 24-bit data from context_id<0,1> */
>   #define KFD_CONTEXT_ID_GET_SQ_INT_DATA(ctx0, ctx1)                             \
>   	((ctx0 & 0xfff) | ((ctx0 >> 16) & 0xf000) | ((ctx1 << 16) & 0xff0000))
>   
>   #define KFD_SQ_INT_DATA__ERR_TYPE_MASK 0xF00000
>   #define KFD_SQ_INT_DATA__ERR_TYPE__SHIFT 20
>   
> +/*
> + * The debugger will send user data(m0) with PRIV=1 to indicate it requires
> + * notification from the KFD with the following queue id (DOORBELL_ID) and
> + * trap code (TRAP_CODE).
> + */
> +#define KFD_INT_DATA_DEBUG_DOORBELL_MASK	0x0003ff
> +#define KFD_INT_DATA_DEBUG_TRAP_CODE_SHIFT	10
> +#define KFD_INT_DATA_DEBUG_TRAP_CODE_MASK	0x07fc00
> +#define KFD_DEBUG_DOORBELL_ID(sq_int_data)	((sq_int_data) &	\
> +				KFD_INT_DATA_DEBUG_DOORBELL_MASK)
> +#define KFD_DEBUG_TRAP_CODE(sq_int_data)	(((sq_int_data) &	\
> +				KFD_INT_DATA_DEBUG_TRAP_CODE_MASK)	\
> +				>> KFD_INT_DATA_DEBUG_TRAP_CODE_SHIFT)
> +#define KFD_DEBUG_CP_BAD_OP_ECODE_MASK		0x3fffc00
> +#define KFD_DEBUG_CP_BAD_OP_ECODE_SHIFT		10
> +#define KFD_DEBUG_CP_BAD_OP_ECODE(ctxid0)	(((ctxid0) &		\
> +				KFD_DEBUG_CP_BAD_OP_ECODE_MASK)		\
> +				>> KFD_DEBUG_CP_BAD_OP_ECODE_SHIFT)
> +
>   static void event_interrupt_poison_consumption_v9(struct kfd_node *dev,
>   				uint16_t pasid, uint16_t client_id)
>   {
> @@ -168,14 +218,16 @@ static bool event_interrupt_isr_v9(struct kfd_node *dev,
>   	uint16_t source_id, client_id, pasid, vmid;
>   	const uint32_t *data = ih_ring_entry;
>   
> +	source_id = SOC15_SOURCE_ID_FROM_IH_ENTRY(ih_ring_entry);
> +	client_id = SOC15_CLIENT_ID_FROM_IH_ENTRY(ih_ring_entry);
> +
>   	/* Only handle interrupts from KFD VMIDs */
>   	vmid = SOC15_VMID_FROM_IH_ENTRY(ih_ring_entry);
> -	if (vmid < dev->vm_info.first_vmid_kfd ||
> -	    vmid > dev->vm_info.last_vmid_kfd)
> +	if (!KFD_IRQ_IS_FENCE(client_id, source_id) &&
> +	   (vmid < dev->vm_info.first_vmid_kfd ||
> +	    vmid > dev->vm_info.last_vmid_kfd))
>   		return false;
>   
> -	source_id = SOC15_SOURCE_ID_FROM_IH_ENTRY(ih_ring_entry);
> -	client_id = SOC15_CLIENT_ID_FROM_IH_ENTRY(ih_ring_entry);
>   	pasid = SOC15_PASID_FROM_IH_ENTRY(ih_ring_entry);
>   
>   	/* Only handle clients we care about */
> @@ -194,7 +246,8 @@ static bool event_interrupt_isr_v9(struct kfd_node *dev,
>   	    client_id != SOC15_IH_CLIENTID_SE0SH &&
>   	    client_id != SOC15_IH_CLIENTID_SE1SH &&
>   	    client_id != SOC15_IH_CLIENTID_SE2SH &&
> -	    client_id != SOC15_IH_CLIENTID_SE3SH)
> +	    client_id != SOC15_IH_CLIENTID_SE3SH &&
> +	    !KFD_IRQ_IS_FENCE(client_id, source_id))
>   		return false;
>   
>   	/* This is a known issue for gfx9. Under non HWS, pasid is not set
> @@ -247,6 +300,7 @@ static bool event_interrupt_isr_v9(struct kfd_node *dev,
>   		source_id == SOC15_INTSRC_SDMA_ECC ||
>   		source_id == SOC15_INTSRC_SQ_INTERRUPT_MSG ||
>   		source_id == SOC15_INTSRC_CP_BAD_OPCODE ||
> +		KFD_IRQ_IS_FENCE(client_id, source_id) ||
>   		((client_id == SOC15_IH_CLIENTID_VMC ||
>   		client_id == SOC15_IH_CLIENTID_VMC1 ||
>   		client_id == SOC15_IH_CLIENTID_UTCL2) &&
> @@ -302,6 +356,13 @@ static void event_interrupt_wq_v9(struct kfd_node *dev,
>   					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID, SIMD_ID),
>   					REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID, CU_ID),
>   					sq_int_data);
> +				if (context_id0 & SQ_INTERRUPT_WORD_WAVE_CTXID__PRIV_MASK) {
> +					if (kfd_set_dbg_ev_from_interrupt(dev, pasid,
> +							KFD_DEBUG_DOORBELL_ID(sq_int_data),
> +							KFD_DEBUG_TRAP_CODE(sq_int_data),
> +							NULL, 0))
> +						return;
> +				}
>   				break;
>   			case SQ_INTERRUPT_WORD_ENCODING_ERROR:
>   				sq_intr_err = REG_GET_FIELD(sq_int_data, KFD_SQ_INT_DATA, ERR_TYPE);
> @@ -324,8 +385,12 @@ static void event_interrupt_wq_v9(struct kfd_node *dev,
>   				break;
>   			}
>   			kfd_signal_event_interrupt(pasid, context_id0 & 0xffffff, 24);
> -		} else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE)
> -			kfd_signal_hw_exception_event(pasid);
> +		} else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE) {
> +			kfd_set_dbg_ev_from_interrupt(dev, pasid,
> +				KFD_DEBUG_DOORBELL_ID(context_id0),
> +				KFD_EC_MASK(KFD_DEBUG_CP_BAD_OP_ECODE(context_id0)),
> +				NULL, 0);
> +		}
>   	} else if (client_id == SOC15_IH_CLIENTID_SDMA0 ||
>   		   client_id == SOC15_IH_CLIENTID_SDMA1 ||
>   		   client_id == SOC15_IH_CLIENTID_SDMA2 ||
> @@ -345,6 +410,7 @@ static void event_interrupt_wq_v9(struct kfd_node *dev,
>   		   client_id == SOC15_IH_CLIENTID_UTCL2) {
>   		struct kfd_vm_fault_info info = {0};
>   		uint16_t ring_id = SOC15_RING_ID_FROM_IH_ENTRY(ih_ring_entry);
> +		struct kfd_hsa_memory_exception_data exception_data;
>   
>   		if (client_id == SOC15_IH_CLIENTID_UTCL2 &&
>   		    amdgpu_amdkfd_ras_query_utcl2_poison_status(dev->adev)) {
> @@ -360,9 +426,23 @@ static void event_interrupt_wq_v9(struct kfd_node *dev,
>   		info.prot_read  = ring_id & 0x10;
>   		info.prot_write = ring_id & 0x20;
>   
> +		memset(&exception_data, 0, sizeof(exception_data));
> +		exception_data.gpu_id = dev->id;
> +		exception_data.va = (info.page_addr) << PAGE_SHIFT;
> +		exception_data.failure.NotPresent = info.prot_valid ? 1 : 0;
> +		exception_data.failure.NoExecute = info.prot_exec ? 1 : 0;
> +		exception_data.failure.ReadOnly = info.prot_write ? 1 : 0;
> +		exception_data.failure.imprecise = 0;
> +
> +		kfd_set_dbg_ev_from_interrupt(dev,
> +						pasid,
> +						-1,
> +						KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION),
> +						&exception_data,
> +						sizeof(exception_data));
>   		kfd_smi_event_update_vmfault(dev, pasid);
> -		kfd_dqm_evict_pasid(dev->dqm, pasid);
> -		kfd_signal_vm_fault_event(dev, pasid, &info, NULL);
> +	} else if (KFD_IRQ_IS_FENCE(client_id, source_id)) {
> +		kfd_process_close_interrupt_drain(pasid);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index a02fb939614a..cd2d56e5cdf0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -963,6 +963,10 @@ struct kfd_process {
>   	uint64_t exception_enable_mask;
>   	uint64_t exception_status;
>   
> +	/* Used to drain stale interrupts */
> +	wait_queue_head_t wait_irq_drain;
> +	bool irq_drain_is_open;
> +
>   	/* shared virtual memory registered by this process */
>   	struct svm_range_list svms;
>   
> @@ -1144,12 +1148,19 @@ int kfd_numa_node_to_apic_id(int numa_node_id);
>   void kfd_double_confirm_iommu_support(struct kfd_dev *gpu);
>   
>   /* Interrupts */
> +#define	KFD_IRQ_FENCE_CLIENTID	0xff
> +#define	KFD_IRQ_FENCE_SOURCEID	0xff
> +#define	KFD_IRQ_IS_FENCE(client, source)				\
> +				((client) == KFD_IRQ_FENCE_CLIENTID &&	\
> +				(source) == KFD_IRQ_FENCE_SOURCEID)
>   int kfd_interrupt_init(struct kfd_node *dev);
>   void kfd_interrupt_exit(struct kfd_node *dev);
>   bool enqueue_ih_ring_entry(struct kfd_node *kfd, const void *ih_ring_entry);
>   bool interrupt_is_wanted(struct kfd_node *dev,
>   				const uint32_t *ih_ring_entry,
>   				uint32_t *patched_ihre, bool *flag);
> +int kfd_process_drain_interrupts(struct kfd_process_device *pdd);
> +void kfd_process_close_interrupt_drain(unsigned int pasid);
>   
>   /* amdkfd Apertures */
>   int kfd_init_apertures(struct kfd_process *process);
> @@ -1421,6 +1432,7 @@ uint64_t kfd_get_number_elems(struct kfd_dev *kfd);
>   /* Events */
>   extern const struct kfd_event_interrupt_class event_interrupt_class_cik;
>   extern const struct kfd_event_interrupt_class event_interrupt_class_v9;
> +extern const struct kfd_event_interrupt_class event_interrupt_class_v10;
>   extern const struct kfd_event_interrupt_class event_interrupt_class_v11;
>   
>   extern const struct kfd_device_global_init_class device_global_init_class_cik;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 2a60c630ab5d..e3a27c31f61d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -862,6 +862,8 @@ struct kfd_process *kfd_create_process(struct task_struct *thread)
>   		kfd_procfs_add_sysfs_stats(process);
>   		kfd_procfs_add_sysfs_files(process);
>   		kfd_procfs_add_sysfs_counters(process);
> +
> +		init_waitqueue_head(&process->wait_irq_drain);
>   	}
>   out:
>   	if (!IS_ERR(process))
> @@ -2136,6 +2138,51 @@ void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type)
>   	}
>   }
>   
> +/* assumes caller holds process lock. */
> +int kfd_process_drain_interrupts(struct kfd_process_device *pdd)
> +{
> +	uint32_t irq_drain_fence[8];
> +	int r = 0;
> +
> +	if (!KFD_IS_SOC15(pdd->dev))
> +		return 0;
> +
> +	pdd->process->irq_drain_is_open = true;
> +
> +	memset(irq_drain_fence, 0, sizeof(irq_drain_fence));
> +	irq_drain_fence[0] = (KFD_IRQ_FENCE_SOURCEID << 8) |
> +							KFD_IRQ_FENCE_CLIENTID;
> +	irq_drain_fence[3] = pdd->process->pasid;
> +
> +	/* ensure stale irqs scheduled KFD interrupts and send drain fence. */
> +	if (amdgpu_amdkfd_send_close_event_drain_irq(pdd->dev->adev,
> +						     irq_drain_fence)) {
> +		pdd->process->irq_drain_is_open = false;
> +		return 0;
> +	}
> +
> +	r = wait_event_interruptible(pdd->process->wait_irq_drain,
> +				     !READ_ONCE(pdd->process->irq_drain_is_open));
> +	if (r)
> +		pdd->process->irq_drain_is_open = false;
> +
> +	return r;
> +}
> +
> +void kfd_process_close_interrupt_drain(unsigned int pasid)
> +{
> +	struct kfd_process *p;
> +
> +	p = kfd_lookup_process_by_pasid(pasid);
> +
> +	if (!p)
> +		return;
> +
> +	WRITE_ONCE(p->irq_drain_is_open, false);
> +	wake_up_all(&p->wait_irq_drain);
> +	kfd_unref_process(p);
> +}
> +
>   struct send_exception_work_handler_workarea {
>   	struct work_struct work;
>   	struct kfd_process *p;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index 43d432b5c5bc..70852a200d8f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -337,6 +337,10 @@ int pqm_create_queue(struct process_queue_manager *pqm,
>   		kq->queue->properties.queue_id = *qid;
>   		pqn->kq = kq;
>   		pqn->q = NULL;
> +		retval = kfd_process_drain_interrupts(pdd);
> +		if (retval)
> +			break;
> +
>   		retval = dev->dqm->ops.create_kernel_queue(dev->dqm,
>   							kq, &pdd->qpd);
>   		break;
