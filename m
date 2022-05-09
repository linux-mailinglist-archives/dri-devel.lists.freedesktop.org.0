Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3808051F40D
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 07:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB5910EABC;
	Mon,  9 May 2022 05:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D6810EABC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 05:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGhf1Su/NnyBR95TFo1c1Bp8v203fN+jc133D4l8tc8MJGrEkRQHp5FfPYax0Ak/I9BrCS0V0XZfMrxnVh7Z+o4rw5J290oIoNd3NRqyPDgDWXer5QhaT1KF67HJ4IU6XDLW9vYOxCfbKaN503NOhZYmDhY72q0d5roNn6Gpv8Vr+xmRx2nqvSvRsJM3YLvfsfveSNrkuYpeQcsin7ZlPLdEDlpRJwEdJCvzgx6DWL3NhfXx3ViljXL5TRUC5TOpgSsND4JPTwkqYwh+PEhGYmLhT1WWY/GnQ1BbCxMRwKbfv09o9RZT414SCx+g7dxg4/qSbuxYj9ZHFzj6adfYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9eZwTRCsygBbxwsum2Af2KVuCqPy3A0R74GAVsh+Es=;
 b=Hx9kwUH7iw8jydpHuSqmLVw8Ef5SUHs6Z9aQw8HPv0qXMqyebgKuQU8+aCpXuKsI9R5Ws8q9GMF8CSQkmPDlg14pJCLr781FzaALnaWOgRrcu6rAg2s0/bLnESz9LIcxMXQm4/WD3eMGAegjYGDX/uKdLfaarR4/z/jnR8rPbK4UrL4kB+ACJVhHjnbf29FFwWg2TDuNkJSQDsE6vREDmtz4hkmy1RlqVoTSYqtC5Q4HI3Lp95aXCPhTPVW6jzAHk7lJWIPcYIVzgXlFuXwq900h8csZ8yqZ1enbLBE5psz65DbjeHaLDlkUwguBISFXyul2AJ9vKyFmUqNsdGHdNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9eZwTRCsygBbxwsum2Af2KVuCqPy3A0R74GAVsh+Es=;
 b=Lw6DhpvCLPWaKsuR8BjTtjs5bB6VC+W9omeRyJ/hRyvsBUIRRC7BjbmymgZVS2FGoLjJvZoSvrG8T4wTedylSEsmdEKLmIw2+uzuZY3L+HUSoK91PGMmas+ftX+KZRXhI6LlueeTBBRn9FxyO/66vPXlKQF8Gk0qubugccDOdKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB5546.namprd12.prod.outlook.com (2603:10b6:610:63::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 05:54:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 05:54:23 +0000
Message-ID: <8bdd71c9-970b-219c-0d5d-67eabe1ab11b@amd.com>
Date: Mon, 9 May 2022 07:54:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v14)
Content-Language: en-US
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
References: <20220506180216.2095060-1-jason@jlekstrand.net>
 <20220506180216.2095060-2-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220506180216.2095060-2-jason@jlekstrand.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0024.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc866cdd-15cc-47ea-2a89-08da31805e0d
X-MS-TrafficTypeDiagnostic: CH2PR12MB5546:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB55468662CB641B3DEAE2192983C69@CH2PR12MB5546.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aFNyrFPl0DvZRTbYY7gVKhu6OHxFXkcIu5f9Vgzoru0y/UY7N0EV/MgtPwvivhVSCGoAeIQAivhXNyy3ymxRXN004m/VLNIWOst3Ld0Ud+eVx8Exfm6NSAPK0Y1uLyLrePTjaI/y7tecBf2IQsLuEvud8OmnD6iztB35Uo7AvyqgFDpuw9yJ8bO7Q48/rIXLkJUFqxVEtbs8Sv1/KdMxvtRd9SHBWTmibOJ8pvCzKjdIsnlm7ETqRChC1+TXw1HUlSi1gQNQNRqu0DpjzxhazWSnmYROLuSEPRMzSZd0V6PGgBT1hrYJtwD6kLBHyXu4TOwfv8yY9Lam/oVQ1nl5MybOs+calLtpl+C3ZdPG6QKSB213E2ddnkfLR9sHeJfIGyaJcz6c5qlhS4FHjyP36Xk2AhR9tzSl16IjDz1UVPCteevpp+T7GRmGr5SA83gtVMUqiNXSyst84AWfAnoSqTJH1yPw1OkoYxmWUmNTiBpyUGmbPRdUMLr5yizeNRzVDloDZuH3TZ1R9Q3qi4w/saPq+wgz2QLpojk3eTOlgisVSQ0Z1AlWlVeZnU1WEf1d5yvmqmeg9HSR5DRq/MQqXn/SasINwgsAs89BjrurT+ZY4B5dzNULf40pSkn96XuZT6TO49iyV5k2Ydf5Z6dwO3/IGGHxR10k1W7KHRcN2QEz1BmblA7OuhvAa+V+or9QLS00c3R70OKz89va5H3278eWgdDMVmB7/Sgr8x+W4hvsPxoC4Dm0YVdcpg4jgpZO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(5660300002)(2616005)(186003)(31696002)(66574015)(316002)(2906002)(66476007)(66946007)(8676002)(4326008)(66556008)(31686004)(36756003)(8936002)(86362001)(508600001)(6486002)(6512007)(26005)(6506007)(6666004)(38100700002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFBKeEVtQlFWdFBFRXVTUlVwbE8zN0hhMzdmcWNPN0w0NHNvODFQNFFqd0lQ?=
 =?utf-8?B?SFdEeDVDMFo4YkZhMmJ6TVNWS0tsbEM5L1NyTHVRWTRlN1JxT0lTSzhvSmg0?=
 =?utf-8?B?VXFxbVd0bktobjhFT1FicktnT3FXVEYySGt1YXliaHJLd1pLbjZac0EzSXJq?=
 =?utf-8?B?S3RueWRVT2grdUlYMUNVUTRGOUFRZ29iNnJNM1BQekxmMm9XL0xBeGJVMjhz?=
 =?utf-8?B?TlJmcFdtc2pLdHBPN1JVY25YZGRidytrbkMvTWZEcHIwc2NKMFMwVmN6dERq?=
 =?utf-8?B?VGY2Wk42N0pqeU9RT2VRYmVLa3JBa1ZSaVBLWXJwVit6SW5vcWhFUW03Y2Fi?=
 =?utf-8?B?cFVsdXpCOEtkaHlKYktTR2poZ0lwRHBaM1RxWmRhL1h6dUx4dWdXb1F2ZlZx?=
 =?utf-8?B?N3kzblhneUJ0UmdVdEV1QmlHdHJtSGJxM25kRFVWMzcvdG0vOU00VnNTL2FK?=
 =?utf-8?B?blU1b0hiZXNzTGFaSlgySW5WUHkyaGxNYVdwbDhYSDh3QjBzU3ZTWHYzTHR2?=
 =?utf-8?B?WDlUNVNUV2VOMzd2OVdEb2JJVmlNcFBXWFcyU1JxQkcwV1Nvd2VlMksxYVZS?=
 =?utf-8?B?M3ZqL25uQ29oK3BsYjc5NHNKY2k3d1VyeFJGVUpxc0FGSkhLejEvWUZVdjZa?=
 =?utf-8?B?UTB4M1Zja0RTTE9lV0lVZGRaM2ZuNk5ESk1hazNSTzdRL3AraTIxckk0S01a?=
 =?utf-8?B?K3dtcFR0L2V4b3ZSSDZLS3lSR1ZzVXRodUYyajRHZVIyeG5OZVVueDRmWjA0?=
 =?utf-8?B?SjhKSzAzMmE2aGhIMmwvVlg5enFpMjk2bmZmNXVlalRLVUZqc2JHS2x3RHhq?=
 =?utf-8?B?Q215YlBicjRoM3pPVE9GNWlFTGRqV0FCdmZsdy94aDhXR3dBb3ZFY2NvTDl4?=
 =?utf-8?B?dDdudnFSdkNQaW1JVmw5UFh5d0VDR0ZrL3pud3k5NjE5OU02ZDNHd0xBaHpj?=
 =?utf-8?B?T0hVYXZXd1A0L1d6SEg4SDBNL3BSRUlZenNqWUl4N000MGlMK3lUaVFwamJu?=
 =?utf-8?B?Q0xEeG94OS9kZXphczd4aGd5Ymdkakx6RDdKYVE1T1N5UG1kLzM5dzhFeXJB?=
 =?utf-8?B?MGJZUHo3UmdUY25PaUdBbk5UWW03QmFOOXkwZEJId08vVWJXOUNPbndQN3pv?=
 =?utf-8?B?dVZOQnh3S2lyVXV0NWtkOXZackdvNUlGSnYrK3lJa0FYVU1tc2Z3M3lBZEJV?=
 =?utf-8?B?SDViQk9CKzJVQjlrMVpNSTVhOGx5N1YwM3VUZnkzNVNvQm0vT3RRM2NXTUwz?=
 =?utf-8?B?eVZyQXBSVXFrUUkvRGJCSDdoSzBzK0dYUTJUZWVPRWo3SStyaHZSNHFkRGtI?=
 =?utf-8?B?T0lUOCt3VEdJU1Z1R0g1dEl0SXd4bUNHWVRvdTB5STRRMHZxU0pYblFxNXEr?=
 =?utf-8?B?eFhZWklKdE5BVUlHK0JpVHFyemtoZVk2UUdKSzN5em0rZ2lWR0VUV1VDWVAw?=
 =?utf-8?B?ektiSWlRU0RHbWtjM29ab1RrZWZKcTFZdXZKMDMzSmkzUXUwSHRYL2Jpc09V?=
 =?utf-8?B?Zm9yeGZILzhMc2VzZWxDSUo5WVVtbHB3bk00WHBWWVZOc2pKSGp5cVU5UFJJ?=
 =?utf-8?B?dmpjalBscXM1NjdGQjBQb0ZtS1dsWW1hTGZEOTNFaFZwdVpWd3MrayszY2Vk?=
 =?utf-8?B?YithNFZ6SENPWlZ3bHo2bUdGenRuMmVRR3VPNWc4VlRROTdqT0h1UThjL1Bz?=
 =?utf-8?B?TGg0bk1SY3ZoQkx0K3crYXdlQWR0UHJsMGdxTldLTWtBVEZxWmF4OHlwV3Fi?=
 =?utf-8?B?SUtBb2c5SzBHV2pQUENsVW51eWEwNUNrMHgrZ2t1a2Qvd2h3ZFdCaGFCdXFV?=
 =?utf-8?B?L0ZDMFRHTEZGMnA1cFN0c01FM2pYWUNISmhKeHNTNFlhQ1EzVGZQK0RHMFV4?=
 =?utf-8?B?YjZCUWgrckpXZG1CTGVxdWw5OWg3MzkrZ3IrLzY5UytEK0MrRTFvS0RBSDVZ?=
 =?utf-8?B?dVlXQjF4T2RvMDJmOWZLVS93dTE5dG5NUEx5OHFRTXJwNVdFNHRnNVlpYXhF?=
 =?utf-8?B?Z01lNUhGaThkVUU5R2xRWEdWempjdWZKcHY2VjJiWmdOTDVhNFVHcVArSDg5?=
 =?utf-8?B?Q1ZKWlNWakJYV01zV1hNSTBtMWtLZUVRSUZwZjNxbDhvb0pPYU1SM20xcFNL?=
 =?utf-8?B?OHhRN0picm82YnNhbjRWSUhVemV6dWVMQlRUdGwyVHJwVXlrQmU1MjNsOTd2?=
 =?utf-8?B?TzA0RXdYZk1LSVEvMGY1T3VpNTJVb2hOWFcwcC9iUlBTaXNSb21IeGl5SlEx?=
 =?utf-8?B?YTNMdmpuemV1dWdHZkVWcTlDWTIxejFXU3lJbUo2SWpGa0FVT1NOVmpPMjJq?=
 =?utf-8?B?NEoyREtid2RzNWNyQWM2MmZZUGtHNDlYZWR6MThDWktrdi9CTHBRdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc866cdd-15cc-47ea-2a89-08da31805e0d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 05:54:23.0936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqHjk5HKg1TCOhcliWIhi8mBSN9RcW6YiRfBJvwLxNKvko3nwBMYKjwvVxRALWkl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5546
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Christian König <christian.koenig@amd.com> for the series.

I assume you have the userspace part ready as well? If yes let's push 
this to drm-misc-next asap.

Christian.

Am 06.05.22 um 20:02 schrieb Jason Ekstrand:
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
> v13 (Jason Ekstrand):
>   - Rebase on Christian König's fence rework
>
> v14 (Daniel Vetter & Christian König):
>   - Use dma_rev_usage_rw to get the properly inverted usage to pass to
>     dma_resv_get_singleton()
>   - Clean up the sync_file and fd if copy_to_user() fails
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
> Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
> Acked-by: Simon Ser <contact@emersion.fr>
> Acked-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/dma-buf/dma-buf.c    | 67 ++++++++++++++++++++++++++++++++++++
>   include/uapi/linux/dma-buf.h | 35 +++++++++++++++++++
>   2 files changed, 102 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 79795857be3e..6ff54f7e6119 100644
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
> @@ -326,6 +330,64 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
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
> +	usage = dma_resv_usage_rw(arg.flags & DMA_BUF_SYNC_WRITE);
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
> +	arg.fd = fd;
> +	if (copy_to_user(user_data, &arg, sizeof(arg))) {
> +		ret = -EFAULT;
> +		goto err_put_file;
> +	}
> +
> +	fd_install(fd, sync_file->file);
> +
> +	return 0;
> +
> +err_put_file:
> +	fput(sync_file->file);
> +err_put_fd:
> +	put_unused_fd(fd);
> +	return ret;
> +}
> +#endif
> +
>   static long dma_buf_ioctl(struct file *file,
>   			  unsigned int cmd, unsigned long arg)
>   {
> @@ -369,6 +431,11 @@ static long dma_buf_ioctl(struct file *file,
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

