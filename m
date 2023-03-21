Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256966C3C6D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 22:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EE710E362;
	Tue, 21 Mar 2023 21:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C04E10E362;
 Tue, 21 Mar 2023 21:07:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8zLVUxiQF9i747DFzk43r0/ImChhDSL2GFv8XFyu+whcZDcXmDl9k8U6pv9Q2PGNTirrrtB5sDCp6z0BRukhWpJW0zMKUFZo+ypcQy8yTMy+ape8kPUY3Pp2gtq0D8LYItWt9K3d31B6hD+/bh59DAhUKG5jXfEUfVecKP/AsExtTm3wI0VjSgrPt5vaGqKaiGWnx4F75YJ69bTooFv/f0q1c+65J7E0MTPPuu8+zI5fwnGKrc5RTiHj0RefCWE/2LMVmhkYwp/+QufgmfklPtfzADtlLprcagjMQ3jtPnb9eQuBeuasB4p6mopmSM81/Zi8sp3RO7PXJgjmK4+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dqej6UEMPML82x0muDKs09FdbYegu8dJiAE/iJgLf/Q=;
 b=laCqfQd/z7NBMu31wdYnlioVvWBYqDztVlfXuF0Ig9dBXSgrHZ3X0ckdyVOVxQq1gkn+d8tocyZ6DOtB7QGbGC4+UNqA0e/gamh/BNxrHBPIQ9fNvEgI+VqW/FwPoJHwbsenjJEf5byccKfVvfjxvKw6NuxT8hZ0fLGVbKqpuZtL6yXmrq1kp0exmmwctkqrADrTkrqF8swBKHn8aoH1mb/1/PgrhYR0v4QKTwBr1vU30650S/vkrWF1IJ/zLlteiiEu6vBzjsNr4xmU+OdVkLZzsRriVARYq7QrUn1DehpJHBHse4DeKERykR5AZmedeOOidiRl8m5lZfjXSTwIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dqej6UEMPML82x0muDKs09FdbYegu8dJiAE/iJgLf/Q=;
 b=EhYowgoivB1CBRvV8+9uoi3C0sONqLMBU60byhGnvLo3K2h8USVCIABROHeKXFD8MdIPIoefCCAttOEwzELwd510VnqiABGhwh/ECUqzo9PLe43SFsBcj5uvqzTF1PZSpmPv6rR6QqKSTCweptLuTm2ck9HbFRd663KC0EQ2O98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 21:07:29 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 21:07:29 +0000
Message-ID: <b337200e-8e5d-2d45-8e81-391ae08dcd9a@amd.com>
Date: Tue, 21 Mar 2023 17:07:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 21/32] drm/amdkfd: update process interrupt handling for
 debug events
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-22-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-22-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::17) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BY5PR12MB4322:EE_
X-MS-Office365-Filtering-Correlation-Id: efef0557-d924-48e6-f56f-08db2a5047cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ar+ndV7a0SCgLKVhkOgL/GP6lNc87l5rzkTQdQgzdRUpuDNEU4RzFa9aaKxquyV2MrZ5aEvuzB+HtOjwoZ5TJI+2oKmdp8UvOnmInGsUjeWnCYpk30+7eCgbqcXICyaMlKaW6jz6sNszMd2o4+tHoVhgXQCUmtsDGBDMnYRjYsy+ibYYZ+GwuLNB479ZCw2q53QSzbDEv5weYtHOGe98T0BmT8x84dPsxvHQD6fNYfKaG5oQo10rbfX5q5F4ykMrlNp4GydfVowM6M8UmMgTq0LPJAV0YJaXZ3l6NaEU45Cs6gNHLnCGOxZMrWw4FFcquXC0sVGY05h57uodAgFQTnvFTfkSPP4DubhUoByGknU4FpcjN5Ob2FPILRJmXzJR1i6sXmy+mdC9zwRSjHpFBggzPiLa1lqyJ+aVhgePd4RhZudd3XRYGqnAiiBLrYzNm3iAhd35mE61/vuTbfZP4quVxeBDIDD/GPc+dPUA6VY+AZIhZoFLGzXuhOqUvbqc0vCTzGcmj02dpNdJhAdrxOM40QxnpY8Vx/l7yjZbmUWkBCzmQb2s7bDSLjy+XmbV9sYFS6rov8AO9mJRGviYDpNohg53oklxyGDKZ1gr21oAGMP4mS43jbgv4+vZHuFMmXWlrx86Ur2eoss8dQ5CN5aYjgmSoKdvUK5UXlgYAtKXIjoddtHA2hKcdq+7N1ctpWXmdwIFh/kNGOIRJ83jt2DUJV+KW6qAQrBrKO69dcA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(31686004)(2616005)(83380400001)(6512007)(316002)(6506007)(53546011)(26005)(186003)(478600001)(31696002)(66556008)(6486002)(36916002)(86362001)(38100700002)(44832011)(66946007)(2906002)(5660300002)(8936002)(450100002)(41300700001)(36756003)(8676002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmZoZjB4QkpXdVlHN0NpcVRHbEdvWWZKUGVZcHJDY3lyYjF2S3J1eENsUWFG?=
 =?utf-8?B?eHhHWkdkVm9JViswUnZOdXdqTVhGNmgveTlLbTVsbGp1U3gwOHpGVE9SWkMr?=
 =?utf-8?B?RVhQWWM0WnAyUDZuTWhlbEZXOEFTQUtaZnpaRjJsWXVYN3ZyRkJ1cEFRS3J6?=
 =?utf-8?B?WGpIc0tac0lpRWhVZ0UvVmNla3ZBSHpCQmJwbnR3M09IRU91OVdqSEJnVkhN?=
 =?utf-8?B?V2FMSVpMVHNQemhUZ2hndUpXZExPNS9QNjJ0eDBBL3R2TVhLNmhUckptNnZM?=
 =?utf-8?B?eWZ5Z29tcmVWaHM1OXE1elVxdDY5d21GUmJuQndkQjF6cWxDVFFtRWt6Y1VT?=
 =?utf-8?B?U3ZVNzArb0NaLzhYcUtRcHQyUmFDSGJHRzhrZWxxZllZbVI0UU1iTTMxV01y?=
 =?utf-8?B?alZuQnFLN0Frd01CM2JSVGNGM1FLbUhxbzhjYnl6Y3VJNjhEOURSdmhleHly?=
 =?utf-8?B?alkzak1UdERMWW9wUDVtNm5EOEpjK3RUc2gvUEkybFBvZXJJSURmWkVrSFZE?=
 =?utf-8?B?cDVnUkVORk11YitaTE9MNHFyYmhaTkNWZzJQVi83WGlBRGc3RHpkYXRGRFZ3?=
 =?utf-8?B?L0hZc1BxV245QXZvT0NBalFwZFFVR2UvbTdCalRKRThFOUxNcmVtWmJqUDd3?=
 =?utf-8?B?RE9ncmpNeDBhR3JtdHZOYmZ6VjFRM1lTQUNlL2VXOTQ3RkdXQjF1eDhkZmZM?=
 =?utf-8?B?WDRtd0F1TzZMODkrTEwxR3hRd0VTaEdFaFVLbW1kZVBSVG1kSkg5V2JSL2V2?=
 =?utf-8?B?aEpoVHNDWTN6eENqdTcyTmloVG1wcTlYbXVyNkZxc0oxcW9vWE5acmdBaVBj?=
 =?utf-8?B?Q2lMRDBFY1FRNzZYNXZaaEJOZkQwbnRBOXVONTl6TjRGWTludGlVdEFTRUwy?=
 =?utf-8?B?WnlkWm05aERiaXFMckNlbWRGdFlhNzZLK2QvbUVyN0I3Vm0yd3lKajRnNVVn?=
 =?utf-8?B?VVZGUnlNcnJwRzM3L25XMlhRUHZlN09WQ29kVjgzOXN3ZklMVXY0QTllbHl1?=
 =?utf-8?B?bFlKT0xRQm1yU2gxRGdOT0swTHk4WXRXSDVGMmpOZG9VK3V6M1lMNGJmSWRE?=
 =?utf-8?B?aU9OWFhNSGpZb0wyajFyRlFXK1RoNjdjendEakxkbUYrdURCeFdGNWEyYmgy?=
 =?utf-8?B?ZlZvUEIwTVcxM2sreWU1ams2VXlXcit2MG51Nk5xYXMva3ZuTjFmQmJRaTdN?=
 =?utf-8?B?dEJnZVVjWHcxRjB0a3phTUtxalhXRWQwNmlHdFA3OTVjQjBlYmlzL01xZjNG?=
 =?utf-8?B?VklhOXlFTWNydWRaNkxEaWloSTFSc0tTY2NhdC96N2Z3NURBNTBXRisydURQ?=
 =?utf-8?B?d3hSaFRBT2RFcWJ6a1o3K3lzVC9nRkJCSDhwT3FtdUoxOWx1YlpwaXdpVnVF?=
 =?utf-8?B?UnRES2RCeTgxb3ZnYTFzZXYxdDhtaVpwSU9PTG1tTTZnUDBJUVBFWkkvUHBh?=
 =?utf-8?B?UEZ3SjVZbjlSZURyNi9Ib2lrUDA2S2RpWWJhUUl4dFB0enVMbVU2OHVlM1RQ?=
 =?utf-8?B?R0NwVTMrWjYvUzE2QUtJM1dCeFRLZG5FN1lpN0JuNENzNTh5c0Z2OFR4Y01B?=
 =?utf-8?B?Y2hwQUIrMGlTN2YzakNVTlFsdk1VUXd4UmNKVTQ3UVNMdWk1ejh6ZGM1Zk5F?=
 =?utf-8?B?d1piTk5Ld05hUlpYWjQ1cTUyejV3VjRJSGF0c2lxdzlGT1VhTHdza1ZTRy9G?=
 =?utf-8?B?WnV3WXZlK3hVSExEZVY2Sk13OHZ0UUxmTVhjM1pTOGhsQ3dLRVlvalU0OU03?=
 =?utf-8?B?ZjN1NnVUa2dhZ0NacGtBVEVTMHVRdGFuWkZQSFVsdkJHSFI1OGNyRjdycWhL?=
 =?utf-8?B?dkowTUpJWXFYSWxlYWZRVDRFV0dlYUttd2VzR1V2VEcweGlRNFBpRUJ3RmxP?=
 =?utf-8?B?QktUc3Y5ODBaK2hQS0VvcUI4eFpvdVB5eFJleHJvaU9jL2doa0txT1Jvbyt5?=
 =?utf-8?B?RVd0eTRTUnFBQmIwL3M2dGtWQmR2QnQyYzdqcmNZM1hTTW81cUhiZzhNTEov?=
 =?utf-8?B?M0J0dDd3MHRJLzF4UGlGYVBqV2x4aysvSFVUMTVmSVU0OWZRT1VWeVpOSE5m?=
 =?utf-8?B?d3JnU0tqNU1ndWk3c2t6WnNSQjYrdE8wM3VDcXVRbE95OXRRMUlZWVptSHZC?=
 =?utf-8?Q?W+CKzMliIBL9EprI1ywE2diIL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efef0557-d924-48e6-f56f-08db2a5047cc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 21:07:29.4827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPRSaimET+fElN4cs3MxWhyxFjtyFF2fScvcl1fo/oDLA8lOu1Ct5utH1RKEpVWr90PicLxnB2gg7tXvvF24Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4322
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


On 2023-01-25 14:53, Jonathan Kim wrote:
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
> v3: enable gfx11 interrupts
> v2: fix interrupt drain on debug disable.
> fix interrupt drain on queue create during -ERESTARTSYS.
> fix up macros naming for ECODE parsing.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Some indentation nit-picks inline. With those fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  16 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   2 +
>   drivers/gpu/drm/amd/amdkfd/Makefile           |   1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        |  85 ++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |   6 +
>   drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   4 +-
>   .../gpu/drm/amd/amdkfd/kfd_int_process_v10.c  | 405 ++++++++++++++++++
>   .../gpu/drm/amd/amdkfd/kfd_int_process_v11.c  |  21 +-
>   .../gpu/drm/amd/amdkfd/kfd_int_process_v9.c   |  98 ++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  12 +
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  47 ++
>   .../amd/amdkfd/kfd_process_queue_manager.c    |   4 +
>   12 files changed, 681 insertions(+), 20 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 8816853e50c0..60c3b0449d86 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -763,6 +763,22 @@ void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev, bo
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
> index 333780491867..df782274a4c8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -241,6 +241,8 @@ int amdgpu_amdkfd_get_xgmi_bandwidth_mbytes(struct amdgpu_device *dst,
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
> index 16acf3d416eb..0c876172db4b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -125,6 +125,65 @@ bool kfd_dbg_ev_raise(uint64_t event_mask,
>   	return is_subscribed;
>   }
>   
> +/* set pending event queue entry from ring entry  */
> +bool kfd_set_dbg_ev_from_interrupt(struct kfd_dev *dev,
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
> +					exception_data, exception_data_size)) {

There are some coding style issues in this function with the 
indentation. For readability the second line should be aligned with the 
open parenthesis in the line above.


> +		struct process_queue_manager *pqm;
> +		struct process_queue_node *pqn;
> +
> +		if (!!(trap_mask & KFD_EC_MASK_QUEUE) &&
> +				p->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED) {

Same as above.


> +			mutex_lock(&p->mutex);
> +
> +			pqm = &p->pqm;
> +			list_for_each_entry(pqn, &pqm->queues,
> +							process_queue_list) {
> +
> +				if (!(pqn->q && pqn->q->device == dev &&
> +						pqn->q->doorbell_id == doorbell_id))

Same as above.


> +					continue;
> +
> +				kfd_send_exception_to_runtime(p,
> +						pqn->q->properties.queue_id,
> +						trap_mask);

Same as above.


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

[snip]

@@ -2074,6 +2076,51 @@ void kfd_flush_tlb(struct kfd_process_device 
*pdd, enum TLB_FLUSH_TYPE type)
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
> +							irq_drain_fence)) {

Same as above.


> +		pdd->process->irq_drain_is_open = false;
> +		return 0;
> +	}
> +
> +	r = wait_event_interruptible(pdd->process->wait_irq_drain,
> +				!READ_ONCE(pdd->process->irq_drain_is_open));

Same as above.

Regards,
   Felix


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
> index d8f032214481..0ae6026c7d69 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -330,6 +330,10 @@ int pqm_create_queue(struct process_queue_manager *pqm,
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
