Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 836FB463983
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458BA6EA9A;
	Tue, 30 Nov 2021 15:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35CA6EA9A;
 Tue, 30 Nov 2021 15:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcYo/W/0zfG9wJGObvL3xGzvQxDoRs4PrG80TBFsi9/MGN0hkmIp9ihz5GTDjerKCORRwXmeiEF3S+eWA8WwLNBj5PHFVkJ6Yj48fXQ1U8oG7U/Dv2gkh4XEiQaCmX3PclZKydJLiy8uDac7EXC0X12feT8qO58YzgRr3RHYwhdocXJnsPe+c3pan+Jb2uA/OOJYnn5osh6cnK0JYTdzlVdmUSMT+WBt7uprAYRbErgfOyyW6GrjF0Ziex3Gir+0e4pHRQmyRVHn/VZI65OXolKrRzlLR8zNmtenJVN4kd9WJE2YkSgvp4Y+VhCwPSJvYQ+EfITkHfOaDUlWtmVn3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=485eLoap/C48hl256+yns1z3Dn0GIhbcFjWuzNsOZgo=;
 b=ifgwenTgEEVypzLuDWp9y1pwSmEbCg4ubKf5+AEowjOyY/y3BQpIqe7969mVN4iTMYgZQY5iXbQgDdKGaxQExtmdc+wFp6fVIQjM7ua0WOjtmxU1So7fdZx3wnNU6s2FLaQbhD5QrDG2OBhuoWIs1E0WaxezzDK8VT4SFfgSTKf3QKEmKjMTsV6JMRCA6kCsywcNxhW0w5k3AGgv1YGu+C0QgdLgi9AXwnpWWQ/f087lEVYP7/VJe+gJPZh+xGkLZuycDRmd2vhHC+HBaCR/wzJQI/B6Xk9/MB+HJCKamIkOWCcASKdZHW7oh3Nbp60gGyuD+7KWu6+aevv7IROPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=485eLoap/C48hl256+yns1z3Dn0GIhbcFjWuzNsOZgo=;
 b=x+Wue/beXDBGebrog5EGLyiRNbHiyoOjywSjDh4dds3nMxEDUOK3xBjlI9YgGYwmEFLfpcZdzmyCaFYmiThO2/jHMHRnK13dkAUFGaL+1WesY4C+hsq4Yn2/rq/Ha45nXu2vaWGRHcCIJ3OCIq+7DCSlLZP09//5y1ADt26Q4iY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1839.namprd12.prod.outlook.com
 (2603:10b6:300:10b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Tue, 30 Nov
 2021 15:11:29 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.027; Tue, 30 Nov 2021
 15:11:29 +0000
Subject: Re: [PATCH] drm/radeon/radeon_kms: Fix a NULL pointer dereference in
 radeon_driver_open_kms()
To: Zhou Qingyang <zhou1615@umn.edu>
References: <20211130150449.166144-1-zhou1615@umn.edu>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <dc81cea8-f0f2-12c4-bb7b-a6e65dfe6f10@amd.com>
Date: Tue, 30 Nov 2021 16:11:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211130150449.166144-1-zhou1615@umn.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS9P194CA0005.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::13) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:fa20:e17b:e063:b6d3]
 (2a02:908:1252:fb60:fa20:e17b:e063:b6d3) by
 AS9P194CA0005.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Tue, 30 Nov 2021 15:11:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89d55124-92f6-4a26-ea2c-08d9b413af95
X-MS-TrafficTypeDiagnostic: MWHPR12MB1839:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1839CB5C5517372FD9399EE783679@MWHPR12MB1839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6CkUx98UdMEeP/Je2mJyXUSnQh9unVMNblCVjTMDfwJvyI5EEcTlKq5E3QzWuLxlIuunFYcsTaoqZLCizAmQgNou+I+ijnqhHpD78QuH3phQlwrSA+finEhN/w+stElOLueN+ny6krRrbONUiI6Y/4JLl8pvAUttyRyS9oyRZXClCo/YL0ZjAYr++3JaYvrpxjfudm2lX48BovXmJk0MqD7IWbkM/feNR5W2Ba6M7Pw2Sdr2ilqlcrEVX5ag4pVyaN3Ac3Om5TUa026huEL08lgftbnSmISpDXji+78ysJ5qm7OlxruKJ6fyPpIODkk2QYIrarvBXYnIaXWDQCcixFKkJibG8nk5yFweBspQUKd3bTIA6sA+lwFvZqEm5Ly6vIAXKVOcvpe1+TgEwb9nCxIHxruy52xD+UFVK/h+1LDowEZRU44c4A8zMvzXHms8soU8FlL/eEOUNFHGO3wwmtwyNBpC9/lJVctrylCnDeSLxSQ06s0SLhU8MisHKzLN5s6tOyXXaWV6DxDKxdXG7dWibMv0eFbCo3KpVSDrL/2d6HdRHy6Wsc2ifhYzByGUgswYw7rn5LEM8hQZhBEbpPqySZVfY8/7TpB+604K6yefsv42xL02TF5uVOdf6VinLJqzUW9BiVtpH5B5d+c+nMG7gWRFR8bhWd9EC4qSlCD8plMMPSE3mYVOwyyubijHYX+ubDPEimnVarTrxjvtyMAEbzPRLb4ZYan65HuF6ohTIK/ulR//STZcQYPThdnB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(316002)(86362001)(31696002)(6916009)(66556008)(31686004)(8936002)(66476007)(66946007)(6666004)(186003)(4326008)(8676002)(6486002)(508600001)(38100700002)(2906002)(5660300002)(83380400001)(36756003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFlyR25FYUt5dkczZzM2czZqZlNJVk1adGlQb2RHZFh5UjJ3WEs0TG1YTTNV?=
 =?utf-8?B?ZnlzZzN6eTRzd3Q1UE52clM2R25jY3ovdm9sVzBSWjl3eTdJcEM1eEd5ZGZt?=
 =?utf-8?B?dmVIOEhjMUxFdFN2WVBWeEgxejBCaHkxMUMxZ1FlUTEwOW5VeEw4dWU5Wkg4?=
 =?utf-8?B?a3RITFBYTWZFNnNnYzhqMnpOTXBuUmo2WVVIYTJJaFZCQ2FobW8rNGlIV29j?=
 =?utf-8?B?a1ozTUk0WlNjN09JczR0Q2U0cXoxekVMY0xlNnF3czZjWFNRRHh3QlhsaHFr?=
 =?utf-8?B?clFTU0sxVWFvSjNCSE0rS0FjVTArMUFPUHkrMXZtcjBGOS9vL2J0dmlwclNi?=
 =?utf-8?B?N0l6Wi9TMXlmYm9kRDdVTlU0MCtoWitiWXdkZWE2WlFiQlVacTdOWHEvdXlH?=
 =?utf-8?B?STBzd0tvYTkwL3MwcXdRVnRBbS9FSTE1cjhZb2dicm5raFN2ZUM2UFFMRzh2?=
 =?utf-8?B?NEdzL0Z5MkpEdlNSUTU5U1VVSmM2dHRXZWxtejhxQnA4MExXbFdjMVNKeC9H?=
 =?utf-8?B?bmxiQmd4UXRHZVlZeHo3N0w4YTByekFwREdLU0lZWXJGWnh2SlJGdDBMRkc2?=
 =?utf-8?B?ZXFlUGIvZ1NLaHZoaXlObVZaZUNHYmtLUzJXbit2SXptM1p3ZEJVdmllRU5r?=
 =?utf-8?B?bWhGZjk2dHNFQ2cwMDdFSDk3SE5XY2RjdVZyU3QyQmd6NU5vZ2JrUjl2OGdR?=
 =?utf-8?B?K3JQbTBqMWR4aU1sWkp6QXpZZU5BNUZJWm85ck1ETXVYTWpITGVFbVh3ekNz?=
 =?utf-8?B?N1ZmTjVheDFDWDZtQUlsTWRFK1lJbi83Nll0eDVVS0oyRzhkRXhnRlg1Q205?=
 =?utf-8?B?ckR2NDJxcGdKYml6RjVBeFc4eUdPYzM2dHBpbG5ESDBHVVRJZG4zM2VyUHE5?=
 =?utf-8?B?MzV5ekJ0YVR1QlhxRnkvUEJlOFlJODZIWXBMUE5pVVVpRDZ1allUcS8wZnNH?=
 =?utf-8?B?b3krMmIwY2ZlMitmb3g2dFh6VHovWFNkMVJtSGRiR20xckozM05mQ0JRcGE5?=
 =?utf-8?B?bUR2cExxb3NYMCtTWVhYWmh5UFRUN0xCUDZYTkZyejVGWnpSQ1dSM2hoTVRK?=
 =?utf-8?B?S3QxT0NaQkE5YTR5NFlJQ1lSRU5xMjA3d1VhbGdBUlQwTERoMTZtT0tMcXhm?=
 =?utf-8?B?eG9SZEE3Rm9EZ3ZEUUNJQkpsSGVlZjUrVjlZcUo5aXZ4RlM4aG9TZ012MGE4?=
 =?utf-8?B?dHk5SWtueWpxakFxYkNRK2kyVGNPVDhLK01Ndmt2bktkSW4zWmJYb2U3N2sw?=
 =?utf-8?B?dGc5YnVaVThSQ1RxV0JGY1Ezb1pJbStlOTFjY2owa01DeHFFcEl1WEpPQnkw?=
 =?utf-8?B?UW0wY3RsWGdPNkorS2krRHVwVTFnc0sxMnNrMjdOL1huSzJDTDVhYzloQmQr?=
 =?utf-8?B?QncrRkJOQldvVFdsN1F5b0FvRWVOWTgyOUtLdkVycFoyQXlrUGc0MERHakxl?=
 =?utf-8?B?dUNMVTVHczNJUStIZWV0ai95L1pFM3JodVF6NHorUXpWYitnaEFOQXVqTHBm?=
 =?utf-8?B?YUtmNlIxdUIzYzc0N1RBdlo0OGM2L3VOVk9vRU1maXNuT0llaWVsZzBFZVNR?=
 =?utf-8?B?RERrZmJ2RzlDVG5NQUFxakRWUmxGY0kxdzk1eFF3NVBNNHV2bmRPcWhLTU1s?=
 =?utf-8?B?VFU0czljRzRCSlhGZmRtazY2dHlCNFNHOTdXczNEaWdLUzVkN0UvdVI3MGVH?=
 =?utf-8?B?SjVwVHcxeTEwUGVWY0hUcDlOSFZZWDdqQWdjVEJYVjhSbTQycHloVmVUbUsz?=
 =?utf-8?B?YmJTQ1hTQ0dubGcraCtpSU1GVGdpY3ZsVFk3TDVhNHdPMjhJRVlpVWkrR2JV?=
 =?utf-8?B?QThQMndaaGxBbnJmL0w2encvRWtpZzQ4SEhxTXJibitZOEc0YWFWZmpGUHF4?=
 =?utf-8?B?OG1RdXRmTmVWSTd0aHdlME5qZXRjYk5KNktmZHV6K0czdERMVlpDb0FibXc0?=
 =?utf-8?B?cnRpdEdkTlNuMStlVmZlSVI4UWI2Nng1UW5iZUIzOG0yUTRla1J3MGRERzhW?=
 =?utf-8?B?Tzc0aVRrTFJ0UUEzY0EvZlNhdGlrbFR5Vmw5dERPVkVHTDlMcVJyekhJK2pm?=
 =?utf-8?B?cEJpem50bG85ZGVhYzkyZUtwL2cvNnA2bzFYQWRQNGxkTnVDQkx3MVZFQ1pD?=
 =?utf-8?B?VndoM2hDRXcxWXVHdE1pTVhUTFpQZnp1MlhKYk1DK0ROdm5qSUtaZDFEeW1Q?=
 =?utf-8?Q?Ra2kGye9kBpDClzMRaCaKqc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d55124-92f6-4a26-ea2c-08d9b413af95
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 15:11:29.4970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94+/Nm+swgUX25lWenzdTUzECkzwck6Nk6W5fKvyKOAP/4xIUPIgUElFgO4Pwyyz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1839
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.11.21 um 16:04 schrieb Zhou Qingyang:
> In radeon_driver_open_kms(), radeon_vm_bo_add() is assigned to
> vm->ib_bo_va and passes and used in radeon_vm_bo_set_addr(). In
> radeon_vm_bo_set_addr(), there is a dereference of vm->ib_bo_va,
> which could lead to a NULL pointer dereference on failure of
> radeon_vm_bo_add().
>
> Fix this bug by adding a check of vm->ib_bo_va.
>
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
>
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
>
> Builds with CONFIG_DRM_RADEON=m show no new warnings,
> and our static analyzer no longer warns about this code.
>
> Fixes: cc9e67e3d700 ("drm/radeon: fix VM IB handling")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
>   drivers/gpu/drm/radeon/radeon_kms.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index 482fb0ae6cb5..ead015c055fb 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -688,6 +688,13 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>   			 * virtual address space */
>   			vm->ib_bo_va = radeon_vm_bo_add(rdev, vm,
>   							rdev->ring_tmp_bo.bo);
> +			if (!vm->ib_bo_va) {
> +				r = -ENOMEM;
> +				radeon_vm_fini(rdev, vm);
> +				kfree(fpriv);
> +				goto out_suspend;
> +			}
> +

Impressive catch for an automated checker.

Please improve the error handling into goto style since we now add the 
fourth instance of the same error handling code. Apart from that looks 
good to me.

Thanks,
Christian.

>   			r = radeon_vm_bo_set_addr(rdev, vm->ib_bo_va,
>   						  RADEON_VA_IB_OFFSET,
>   						  RADEON_VM_PAGE_READABLE |

