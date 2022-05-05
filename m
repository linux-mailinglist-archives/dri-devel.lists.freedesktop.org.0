Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D2A51B7ED
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 08:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3E010ED34;
	Thu,  5 May 2022 06:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DB710ED34
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 06:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVYe3hDU256cRgkfUa6q6eTsFuj4TfRX500bI32Pp2YPUj4HgcuQgmKtFxtbRa4Fd7Lv4/CWkcjjLfh1PPbwYFDiKJU2UyHRfP0HF2kTUeqNZI2MCVYBlWAVEz0pW+5y3DgMv7IldWorivxq7zryNZmpC5Dy+Td/yIRur9qo8k270IqdWyGP0elscLkvKVHenWjeb7Ha7phVqpZBIh8McLy6+dk2QpmU8/hEPvjfia8txZxj95F4UpCHXvRoBjUBv8MkCeg4tWALLxS0faVgHXbqrtlATjL6XAsBuNivIAnvzSTw1/4JU5c4K8vM6vTNqCRy7920cVtqPNMYAjDtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djNwQRBBzFnngmY+wZ7/f87vd13FLunwuJjXfpSg22Y=;
 b=IoJJEHt1hyEvgqXVM1Yk0fHX/q11mGjpmDTuda3sqBSM3t3eXunLGLTUlfhTTxm851b4A1DnyCyciwbFeMuHivCdNH4apP/0KYBYcFyV/ZBBWROqXWTQ2UW1FjCljeomtQ0n3vHNOGza/LNHZz3r4f552JTbxJqmz4TKnWMVK2CNh0R9VEVRYLLQm4jOM9ar/ZVDY+6wc+pDfHZnrRC+VJDDMaaDHR4GSF/Ca0+SSdoEjT44QmYI3OGv/pu2Scq/5knWtZeFI7PgL99HLEg6uGztQ9q+9KQKM5AH3h9bETQAxf83t4EQ7kNiYa1B5QbDM0awxLVDJLJgeu50B+Oibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djNwQRBBzFnngmY+wZ7/f87vd13FLunwuJjXfpSg22Y=;
 b=vAzCuJYKV+Xec0tPbkg01uQAhuGOidoQHp7MGAb111kMZJnnFrcf6rw08QYoUYW6t9V8qR5FfAyP5UCrhJED7+jM4FC6otXENQuu7CXdDQge2oAirO4VvtNRePJ0KJRB0iM3vkcSU+ophVjLBnkhyyNruEdmqCER+QWm4G8Bbis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB2974.namprd12.prod.outlook.com (2603:10b6:208:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 06:25:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 06:25:13 +0000
Message-ID: <7d478470-00fa-07a6-1479-dee80ced5b76@amd.com>
Date: Thu, 5 May 2022 08:25:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v13)
Content-Language: en-US
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
References: <20220504203404.1495485-1-jason@jlekstrand.net>
 <20220504203404.1495485-2-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220504203404.1495485-2-jason@jlekstrand.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0227.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 985ad8ce-fe6f-4494-9875-08da2e600348
X-MS-TrafficTypeDiagnostic: MN2PR12MB2974:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2974D40E48EA60157A57913683C29@MN2PR12MB2974.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HdxFl09kqcts2mDNDysglE0t0knWITqYAQ218ufX5cumUkpO51tq21kFdKKEfPT81DaJS5Tc7HK3OX9mFpfzIImWi1H7Ayce506hChpEhgMTeotUwD5BKK/iuoE1WLyRwgkezYyS7R5rHb3NuIGOAOi7txt+ZlZ1TuLFOPtNUzFirBS9qC9WnLXVa/VLGMJPRNnamxAWCic/UT13ZmrCVIdZ07peVo70BsdKQBvLJYL93DtAgTGq6MsAN1DBKHeslhv+9UM/3MlzVupoc0UCxR/qRTnTz9g9UohQAWG/l7B25ab2dwVkkSIz4baEE7pTBYIqkCMmpjR3StnimRXMYraXNn2uVTKnQkwOfSKjeNkaj1QcKPhAYSV6QJ01NA8GciSpIgJe2ZznY6QrMUFTP6MFhS6QDptB2TbMa/rJnSoh7RymI1/Pwmi+M5jwDdVDViB729AIerfd/7y38XKjImNPEUCEdeFB9uUYw3vcSKpot4BPl56XqcjZpcsaqqnGyzu9o4+5RYQ8pzOOiXVbD3wNiQaANWp0C6thSMsUHVeGtVGAo5zcvBS5vFF1QT2RfRxwWCnlVJGQCQ5YLNC1ELKuYQxWl7d91zm63U1aABu/6YgwJmymQ1K6wpLgmzaenG3IJ6jMpnuG+up6tAjullZ2SXbomCBP5zbUtV86N20j3luMfc8++mXNPyCos/QwD1MPpJUp2V1od/xTn9kSI0khPHCUrXMxfY2i6ez9+/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(54906003)(508600001)(5660300002)(6486002)(31686004)(36756003)(66476007)(8936002)(2906002)(316002)(8676002)(66556008)(4326008)(66946007)(6666004)(66574015)(26005)(6512007)(186003)(2616005)(6506007)(38100700002)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlNnV05sOU81enUrZ3d1V0VXNnk0Nm5za3lndVBhZVVST1BxazRjbllqVW4r?=
 =?utf-8?B?eENWVTZMeFhON2FkRzVxZFYrSnJ4VjR3ajg1endUSDFGaU95SVdwQnd6WjFw?=
 =?utf-8?B?TnZORmJGakRVMDR4T2ZYL01DODFQaEN1UXFML0RkYVE2dzJLdnpzZFNYSStR?=
 =?utf-8?B?UlFNTklLNkgzaUhqZUFpNnJZRVNJT1hvMTZaZU1Wc25ycGtweFdQQmNMNzll?=
 =?utf-8?B?UzJGQnRvaVdNMEk1ODY5UTVFWENVSGp3SHZDZXcxNnlORnRZdHVKb3o4ZTFo?=
 =?utf-8?B?dkZlanVFSTNpTVV5RDhaZXZRL0JVQy9BbDZMZGFMRkQvcGJENlpadHFJcGt2?=
 =?utf-8?B?eGFCa0VHcFFPamVXSEtFc2kreC96M0o5Y2NWY0F1YWJxRWNocDEvWUFtSkJQ?=
 =?utf-8?B?dFBRVlRuYkpmUGdjbTZzOERaVXlNRzYzSm1sVnM2M3ZaRm54RkRmZmllK3ZZ?=
 =?utf-8?B?TS9CV2JNUnRHQ25LWGJnbHpIUTVxY0xncVZieHpNM1pXNHdxcXdTbXpITlBE?=
 =?utf-8?B?RzFqMEZZVy8yRW8zcnIxL1lxMXRpVHU2cjJEK2pxNXB2cUw2NktVY2ZHZmd0?=
 =?utf-8?B?Qm13Tis5aXZWT2dDRUkrSGFOYzg1TUpsWDF6Q0oxdGhZbVZ2cjFSWDZHTlB2?=
 =?utf-8?B?Nk9vTW5UK253Nkh3ZDFIYlFFZnd0QThMRVk3dVZpbXpmY0hycjFUNTlXOXRQ?=
 =?utf-8?B?N1EzRVgyRmh0dERhNXc2bWk3aGVFVEt3WWpBRjJFbUhpRnZRa1NNbVEralZS?=
 =?utf-8?B?M25WbVcyWnpBY0Z0ZjdOOUZTSXM2em0xZStqN1VuUjZGOWhVUnZ5SVY3MG13?=
 =?utf-8?B?ZDlheW91eXVXNXB4a3FQaE96Y1NOVzAzTUQwK3l5Q291NmtPTnVmYThET0Vk?=
 =?utf-8?B?ZEw1ektEdC9VSEJmUStabVZEZDloRHlSOU5lVmEwTUdFTzd1L0hOMzRCWERa?=
 =?utf-8?B?eFhONkVxNWpyQmpZVjZ3M0tBN1VBQ056NUI3YU5CWWFMUGFtYjladGliWHRr?=
 =?utf-8?B?UU1CeUVXbk9GNTNZRTlCSTR0bkFxUy9QVXNJYUFLckQ2K2lDOUJZalhNQkxa?=
 =?utf-8?B?dldoYkVCMWRGZWVWdXJ6NXN5OVRkZiswTnBONFBKSjUybUIvSjZLWVFoamRw?=
 =?utf-8?B?T203a2orUVI2b3pEa1p5cUtqcGRhUFA2TGlWN1FhdmdibjFpTmg0VWI3V05Y?=
 =?utf-8?B?VlhBTW05bVphQ240WXFseHhwTmN5bjJla290Y2lJVHRQZXc0RHVhM0FUZDdB?=
 =?utf-8?B?NExCaWJoNEgreVZ0Tlg4dG82ckV6Si9UUVFXOUlwNXZ6MmJTekdYcGNiV3ZI?=
 =?utf-8?B?TFZUNmt4ZmpzZjAzMTdweFVNV3FpRVJjR1d6eXUxV1g4K0hpeFRTT1V2VXIr?=
 =?utf-8?B?d2VPcFlXRFFnT3JTV1JROUYwVVFFWWdpcVhrcVkvK3QxWHdpZk5oak5DREdH?=
 =?utf-8?B?dkpzdFhzTkhRRytqRHRRMWhyam1Sb0ptYWt4WWE3NjduQyt3eHVITDd0TVR4?=
 =?utf-8?B?S1lmWXgrcjFCUWJHSmJXcDMyN0FUeEZEWmtLN09YSmo1dDcrdmc0UExxTWNO?=
 =?utf-8?B?TmhTdEdlcFNBQTh2RmdoamQrVHhmVWZUSGZGZksvTXN2MzFvcE9VRG5sSjYz?=
 =?utf-8?B?WFpsMHdGNll6Ukp4NVZ4UnpzZ2dRK1U3a1FxbkpvdGIweXRyNVYvd3NXSUNh?=
 =?utf-8?B?cVpsSlI4VHVCVEw3TTRkSUljd2NDWnZJbkQwRlNzdnBHZUdJMjlIOXVyOXNH?=
 =?utf-8?B?VUxuSHpqc0c3LzcyYlExRVo5Y0Z2MWV3cnJVNnBsbEdUVFg0YjYzSm1QVGtE?=
 =?utf-8?B?VDkzaVphQXJjVW9rOVRiVEp0VXRxQWNFOWUxeDhycHBnbFZoUGdvdUk0NnZS?=
 =?utf-8?B?VlhzMWpVNERNcDlCUm1aa1JsNEpWZ0FmZTRCTHZwdW85VVVwQXFWbDNpR0pN?=
 =?utf-8?B?QmV4TWtxeWVEdGZaY2RhMlN3VElaVlRJSnltWjJzTWQyTTA4ei9VdmJDVkNZ?=
 =?utf-8?B?QlMvVGRmTzZzWkFOMzFqMGltM0taWUl2c0l0bitzZmFrRXBFVzVkeWg2WUt0?=
 =?utf-8?B?Rm94STcwbXYwK3lSN3VGZ0lEb1hRa21KSE5rUDljNjErLzR0SExJME9ManE4?=
 =?utf-8?B?enp1N0NBOWYrVGpQK0dKdHo2a1YrVENkdXd4eVBuU0tjKzJZeC81azg3V1BK?=
 =?utf-8?B?UHVqKzU4WVZIZ1FIRVcwNkltRGU4SFpRTCtVY1d4alVRNmtodVdkY0kzL1lv?=
 =?utf-8?B?VXNJZlI4Vm1tSi9YM1BDNTVuSlp6bS82dC9HWDlnUWYvb1NSYjRsNFdvd2R2?=
 =?utf-8?B?Yk5mSSszY3lkaFRjbTlnSTFNemQ0ODFIelZOcktwOERzQ0xnZm01QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 985ad8ce-fe6f-4494-9875-08da2e600348
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 06:25:13.5673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCDneJjw3P109LKG8sBcE+vp/GLIS35J4fWHSQBgNSFLFYUPH74wzO+Rk2HOTU1b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2974
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.05.22 um 22:34 schrieb Jason Ekstrand:
> Modern userspace APIs like Vulkan are built on an explicit
> synchronization model.  This doesn't always play nicely with the
> implicit synchronization used in the kernel and assumed by X11 and
> Wayland.  The client -> compositor half of the synchronization isn't too
> bad, at least on intel, because we can control whether or not i915
> synchronizes on the buffer and whether or not it's considered written.
>
> The harder part is the compositor -> client synchronization when we get
> the buffer back from the compositor.  We're required to be able to
> provide the client with a VkSemaphore and VkFence representing the point
> in time where the window system (compositor and/or display) finished
> using the buffer.  With current APIs, it's very hard to do this in such
> a way that we don't get confused by the Vulkan driver's access of the
> buffer.  In particular, once we tell the kernel that we're rendering to
> the buffer again, any CPU waits on the buffer or GPU dependencies will
> wait on some of the client rendering and not just the compositor.
>
> This new IOCTL solves this problem by allowing us to get a snapshot of
> the implicit synchronization state of a given dma-buf in the form of a
> sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
> instead of CPU waiting directly, it encapsulates the wait operation, at
> the current moment in time, in a sync_file so we can check/wait on it
> later.  As long as the Vulkan driver does the sync_file export from the
> dma-buf before we re-introduce it for rendering, it will only contain
> fences from the compositor or display.  This allows to accurately turn
> it into a VkFence or VkSemaphore without any over-synchronization.
>
> By making this an ioctl on the dma-buf itself, it allows this new
> functionality to be used in an entirely driver-agnostic way without
> having access to a DRM fd. This makes it ideal for use in driver-generic
> code in Mesa or in a client such as a compositor where the DRM fd may be
> hard to reach.
>
> v2 (Jason Ekstrand):
>   - Use a wrapper dma_fence_array of all fences including the new one
>     when importing an exclusive fence.
>
> v3 (Jason Ekstrand):
>   - Lock around setting shared fences as well as exclusive
>   - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
>   - Initialize ret to 0 in dma_buf_wait_sync_file
>
> v4 (Jason Ekstrand):
>   - Use the new dma_resv_get_singleton helper
>
> v5 (Jason Ekstrand):
>   - Rename the IOCTLs to import/export rather than wait/signal
>   - Drop the WRITE flag and always get/set the exclusive fence
>
> v6 (Jason Ekstrand):
>   - Drop the sync_file import as it was all-around sketchy and not nearly
>     as useful as import.
>   - Re-introduce READ/WRITE flag support for export
>   - Rework the commit message
>
> v7 (Jason Ekstrand):
>   - Require at least one sync flag
>   - Fix a refcounting bug: dma_resv_get_excl() doesn't take a reference
>   - Use _rcu helpers since we're accessing the dma_resv read-only
>
> v8 (Jason Ekstrand):
>   - Return -ENOMEM if the sync_file_create fails
>   - Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)
>
> v9 (Jason Ekstrand):
>   - Add documentation for the new ioctl
>
> v10 (Jason Ekstrand):
>   - Go back to dma_buf_sync_file as the ioctl struct name
>
> v11 (Daniel Vetter):
>   - Go back to dma_buf_export_sync_file as the ioctl struct name
>   - Better kerneldoc describing what the read/write flags do
>
> v12 (Christian König):
>   - Document why we chose to make it an ioctl on dma-buf
>
> v12 (Jason Ekstrand):
>   - Rebase on Christian König's fence rework
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Acked-by: Simon Ser <contact@emersion.fr>
> Acked-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/dma-buf/dma-buf.c    | 64 ++++++++++++++++++++++++++++++++++++
>   include/uapi/linux/dma-buf.h | 35 ++++++++++++++++++++
>   2 files changed, 99 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 79795857be3e..529e0611e53b 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -20,6 +20,7 @@
>   #include <linux/debugfs.h>
>   #include <linux/module.h>
>   #include <linux/seq_file.h>
> +#include <linux/sync_file.h>
>   #include <linux/poll.h>
>   #include <linux/dma-resv.h>
>   #include <linux/mm.h>
> @@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>    * Note that this only signals the completion of the respective fences, i.e. the
>    * DMA transfers are complete. Cache flushing and any other necessary
>    * preparations before CPU access can begin still need to happen.
> + *
> + * As an alternative to poll(), the set of fences on DMA buffer can be
> + * exported as a &sync_file using &dma_buf_sync_file_export.
>    */
>   
>   static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> @@ -326,6 +330,61 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>   	return 0;
>   }
>   
> +#if IS_ENABLED(CONFIG_SYNC_FILE)
> +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> +				     void __user *user_data)
> +{
> +	struct dma_buf_export_sync_file arg;
> +	enum dma_resv_usage usage;
> +	struct dma_fence *fence = NULL;
> +	struct sync_file *sync_file;
> +	int fd, ret;
> +
> +	if (copy_from_user(&arg, user_data, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (arg.flags & ~DMA_BUF_SYNC_RW)
> +		return -EINVAL;
> +
> +	if ((arg.flags & DMA_BUF_SYNC_RW) == 0)
> +		return -EINVAL;
> +
> +	fd = get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0)
> +		return fd;
> +
> +	usage = (arg.flags & DMA_BUF_SYNC_WRITE) ? DMA_RESV_USAGE_WRITE :
> +						   DMA_RESV_USAGE_READ;
> +	ret = dma_resv_get_singleton(dmabuf->resv, usage, &fence);
> +	if (ret)
> +		goto err_put_fd;
> +
> +	if (!fence)
> +		fence = dma_fence_get_stub();
> +
> +	sync_file = sync_file_create(fence);
> +
> +	dma_fence_put(fence);
> +
> +	if (!sync_file) {
> +		ret = -ENOMEM;
> +		goto err_put_fd;
> +	}
> +
> +	fd_install(fd, sync_file->file);
> +
> +	arg.fd = fd;
> +	if (copy_to_user(user_data, &arg, sizeof(arg)))
> +		return -EFAULT;

I know we had that discussion before, but I'm not 100% any more what the 
outcome was.

The problem here is that when the copy_to_user fails we have a file 
descriptor which is valid, but userspace doesn't know anything about it.

I only see a few possibilities here:
1. Keep it like this and just assume that a process which you can't copy 
the fd to is also dying (a bit to much assumption for my taste).

2. Close the file descriptor when this happens (not ideal either).

3. Instead of returning the fd in the parameter structure return it as 
IOCTL result.

Number 3 is what drm_prime_handle_to_fd_ioctl() is doing as well and 
IIRC we said that this is probably the best option.

Apart from that the patch set looks really clean to me now.

Regards,
Christian.


> +
> +	return 0;
> +
> +err_put_fd:
> +	put_unused_fd(fd);
> +	return ret;
> +}
> +#endif
> +
>   static long dma_buf_ioctl(struct file *file,
>   			  unsigned int cmd, unsigned long arg)
>   {
> @@ -369,6 +428,11 @@ static long dma_buf_ioctl(struct file *file,
>   	case DMA_BUF_SET_NAME_B:
>   		return dma_buf_set_name(dmabuf, (const char __user *)arg);
>   
> +#if IS_ENABLED(CONFIG_SYNC_FILE)
> +	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> +		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> +#endif
> +
>   	default:
>   		return -ENOTTY;
>   	}
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 8e4a2ca0bcbf..46f1e3e98b02 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -85,6 +85,40 @@ struct dma_buf_sync {
>   
>   #define DMA_BUF_NAME_LEN	32
>   
> +/**
> + * struct dma_buf_export_sync_file - Get a sync_file from a dma-buf
> + *
> + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE to retrieve the
> + * current set of fences on a dma-buf file descriptor as a sync_file.  CPU
> + * waits via poll() or other driver-specific mechanisms typically wait on
> + * whatever fences are on the dma-buf at the time the wait begins.  This
> + * is similar except that it takes a snapshot of the current fences on the
> + * dma-buf for waiting later instead of waiting immediately.  This is
> + * useful for modern graphics APIs such as Vulkan which assume an explicit
> + * synchronization model but still need to inter-operate with dma-buf.
> + */
> +struct dma_buf_export_sync_file {
> +	/**
> +	 * @flags: Read/write flags
> +	 *
> +	 * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
> +	 *
> +	 * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE is not set,
> +	 * the returned sync file waits on any writers of the dma-buf to
> +	 * complete.  Waiting on the returned sync file is equivalent to
> +	 * poll() with POLLIN.
> +	 *
> +	 * If DMA_BUF_SYNC_WRITE is set, the returned sync file waits on
> +	 * any users of the dma-buf (read or write) to complete.  Waiting
> +	 * on the returned sync file is equivalent to poll() with POLLOUT.
> +	 * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ are set, this
> +	 * is equivalent to just DMA_BUF_SYNC_WRITE.
> +	 */
> +	__u32 flags;
> +	/** @fd: Returned sync file descriptor */
> +	__s32 fd;
> +};
> +
>   #define DMA_BUF_BASE		'b'
>   #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>   
> @@ -94,5 +128,6 @@ struct dma_buf_sync {
>   #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
>   #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
>   #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
> +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
>   
>   #endif

