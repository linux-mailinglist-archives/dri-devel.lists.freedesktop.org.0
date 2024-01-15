Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD482E064
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 19:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C3510E364;
	Mon, 15 Jan 2024 18:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBB610E364;
 Mon, 15 Jan 2024 18:58:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bk0yyPKlb5ZAq1fQzKYH+lEhNeZbKGVKYtUyzzAEsWpnUdAl0BDSEAhFJ75dpe2AjRBZn6PCZyuFhjTovwZ5YCb3mFbFKR55Cl/xiwREWXpvbXLWcmwWMSMuOqnL5fvOmzymYYCUjfVIIbA09IL176RQqjXqIkAppU8RURnCb0tjvCmHD+zQucKicmGICspIAsD4dEPhKMtnGQ9eoAKwfJHmX5KUGITLv2IdhqzdLVmTYWSgFEHfDRIr9e6pZK63qVFUPSz8DE0FVWKuPEf5v4wfSlpcyKm8caLC82abR6+G7LcOqWcx8dTMBTbtiWa0f6WALHfJ3OCVFz6Asucjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klcuwU8uIW5PYFmV2OecKTfFuU+ebKVyj37+BOA0JO0=;
 b=NIQAHYnRqigfrpKUtcwfUAmuCNYCf98RjisuIIds7XrIQsn2QLOUC2+Ry21COvtqhaal9yorVT9wtBokb+BxQJmBGCYX+CVluyJU0cTIpBHd45nlvGxvEHPBRLw47F403+5uXmlMDlauWy5KJGKR9SnObZ57VDejtxpOuxBZ5C3CceNRy5tMz/y1r35PZdKS8b4Oq4DFbAFCkv80HsiB4YNqJV6ePBzZV9HYXz0gImAbpFoRrkrocReqxktCRRV9jddkExvNXjpYMJoP6G57EiFCdBHUKs5EVqhAWrPki084Q4da2jfIE2In/jyBLv1ulWYc91Xd8LwajF47362IBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klcuwU8uIW5PYFmV2OecKTfFuU+ebKVyj37+BOA0JO0=;
 b=j9V0T3crz97llJdDbmqOj33YWuZZiXw7LJXEGJQd03+qU5/ItU+4uMWAAILRMSq5La85ojUlmBFyFuJA9ctANrrgAW9C3cR9ebeOYSf4GyFB2xpoRZCC5LvBzfvCbKzOOPPgHc0YF3kV+FRAWpRGCAwR1T/Ri3yWiElmn5WiyH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB7426.namprd12.prod.outlook.com (2603:10b6:510:201::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Mon, 15 Jan
 2024 18:58:19 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ed98:3dd5:fe85:ead7]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ed98:3dd5:fe85:ead7%4]) with mapi id 15.20.7181.022; Mon, 15 Jan 2024
 18:58:19 +0000
Message-ID: <63a87925-9af4-412c-9edc-1619ccb542c7@amd.com>
Date: Mon, 15 Jan 2024 13:58:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal to add CRIU support to DRM render nodes
From: Felix Kuehling <felix.kuehling@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 criu@openvz.org
References: <03a9977c-2044-40c7-9688-9ab326abb81c@amd.com>
Content-Language: en-US
Organization: AMD Inc.
In-Reply-To: <03a9977c-2044-40c7-9688-9ab326abb81c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::9) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: d56873d0-8d74-4c16-d4b8-08dc15fbf091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LZIMYKfCa2VZhpxbcmPWzuJp64HCw9uat0XQzwpY0+TGjUSiy2KgTXjeQnaULhE5wvRwfGxNGRmuYm0gQr/3csx6ec8F4MM7MtqGgSDlL8Tl3fbAYvEkjnjiDCPgyQr7qDeHN7HkC/tqgIm1IvUXV6i6ai0LjNqaCgVm7kaDNcGZwNtqMaEnF6ojYPkmCxDI5LAmfoCBbjDEH+YE8RxVudQZJUEytHWZf1DmJD4LhP56Q81IBBUU/rqJn5nbTfp3QW7NP9aPE6R5Cis96CB+c7ejY5eDsUmVDUBcqckLCQFBYFERcIINEy2wrjOGiilfcm49aZMsv8bByCBfuuenyTPS7IgBwQjumyMViG+sX1lIJzlZuogDeI5P+gpKX0rQzPEdD8sC8BFdOO2eOuSYcy2Y2YASjTmxwzGNoK3KtJgv/YAyN2+YN+vKtayZHXRnkTPfDCWeb0PVFFIJIqa3mUnCv4ZALaxzT0P6bu2kB5RfprN2nsKQxGwPbxVHkzEBIkJkCeDMwl81asZUcOzfLw3+6YvnOCh6NHUc1QlgSmyVLAPkgdR4+xJzQrNuyl/n+kMqBikzx3LC8tJsIvr3DfUIda+srCGbhktVzSKyj7yTUv2H8GX/xiNEsCvDyyHzPJZjMwt6P4X761EJ43TuuyPU6Kvg/yv3Vn85ASOiW9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(8676002)(8936002)(2906002)(4326008)(31686004)(44832011)(66556008)(66946007)(66476007)(54906003)(316002)(110136005)(66899024)(6512007)(966005)(6506007)(6486002)(478600001)(3613699003)(41300700001)(83380400001)(36756003)(26005)(38100700002)(53546011)(36916002)(86362001)(31696002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmJ0ZGlGM0M0TGpJdE94cmYySW9KbHFnYk1UbWRBR2ZhcEFrYW1XaHBiekY0?=
 =?utf-8?B?dEV1eklrd2xCN1hteWgyeUN5Vm1xUzU0NFN4THlHUjZHcXJRTEJGd1grUVhl?=
 =?utf-8?B?STlZSnlwTVlXODZkTXY3U2FmaDUyc2o2c0d6TUNJVXpQV1pscWNvS3NmQWs2?=
 =?utf-8?B?R2hGWWFRTllhMitWcWpHQk02d1dGZVFXekhwa1BGckE1M09EVXpMZ0pLSFBx?=
 =?utf-8?B?MjluYTJGSjc1UEQvaEZabGdqUkRFRkpVSWJURWIrdGVMSnV5ZjE2NlJJUmNI?=
 =?utf-8?B?QkhGRGZ2ZnU4RDJ3dkVHR0pmVy9KUVZLcTdjcDM5NlpqNlkrRElEV25OQWQw?=
 =?utf-8?B?am1JanZLeGRJV29Fb1BndHQ4bGs0ZStydW9wUkVWVUM1bzNNUWJsNkJXMFVB?=
 =?utf-8?B?dmdhUWxtNVc2T3AyaDh2T2tEVVFQcy94S25Tb3dGM1c0bVFJNnBRenJUdzhE?=
 =?utf-8?B?c3ExOXhqdFZKQmNOVHBsbWtuNEpxOEl2N0QrSTdTWVI0d0RKYmNKOGZqdWVl?=
 =?utf-8?B?ZHhBZTRHeUpsUVEyRXlNSUV1b1BKdVo2bXAyYVA1MHVGekx4cDlHUkZYYTlL?=
 =?utf-8?B?VXNOYlNWMDhVdlc0ZFduYkM5MHU4TUFNaFVsbmRnT2JvQnRtd0pJaURUWXZv?=
 =?utf-8?B?U2Y4T3J4QmJ3MUoyMVQ3UzVKVXFXcFlKNUJvendpaDN3K09IdVQrMmkyekJK?=
 =?utf-8?B?ZlVzR2tueCtzQVFKWG1XbVpDTlpqZVAxN3pYUTNZL3J3U0VTTUZrRHY2b2g0?=
 =?utf-8?B?aWFCMURONlJmUHQvMndCQjBVWFR4N2RYWHJTWTA3M0RMQ3VDN3lyUElyU01m?=
 =?utf-8?B?SDhoektHQU11cEVxb3FSMkwxZStPRm14c3dMYWM0djBJQ3pJcHl3aU81czF3?=
 =?utf-8?B?S2J4djh4WCt6am45Y1lJNmdaYVViL0dmaUlKQ2RvQXprT0Q3Zm1NTk5pTVB3?=
 =?utf-8?B?SXIrSmprcThkOVFFNjdhS0V2YWdHNWpMd0d5eEFQcEp4V2dWYU1JTW1TTGgr?=
 =?utf-8?B?MDJ4S2RvZmFOQzlxVmo5V2JHaExxa3ZZUHRleFdMK1YvSnBDZHM5Mmx6dG5a?=
 =?utf-8?B?VmcxMHBYa3FEWGNyd0Y5ZS9SNFVuU0xlTFVtN3ZYK0h1K3I5cHFaWHFJbDRJ?=
 =?utf-8?B?TGFDVkQ4N0RacEdkTmhJS1hJQ2RlUU1GQ211cjNtSG9PL3NPdzlLS1RhU2lM?=
 =?utf-8?B?Nk9Oa0FneHdBWGhFNi9xVHJmQ3RNNnJnUFlLZ1djcVEwYmcwLytqRWZpcVlX?=
 =?utf-8?B?ZWJ5a2taN1VkdlFyaU5pbkxRYUh4S3pLTnhsRWJHcUQ3YXBsU2NxOVREMVJ2?=
 =?utf-8?B?a3NmK2w3L2NveWtTWFVTZFNleGhKbnVKT0ZIaWRiZTZ3UDVrd3VmZWRjUmJN?=
 =?utf-8?B?d3RjTENFUWZJbGpGQ0dlczY3NkNhYVcwVTN0WTFjTVN4eVArSnl5UWN4VG5r?=
 =?utf-8?B?eGVXN0MvUWRPbmlpMklHYjRteFJGY2pISG1VNjJwTks2RGRZYTFmeldMVHBk?=
 =?utf-8?B?d09EWWFzeHNpNXJBemRGZlI1MFZTU3BSYUw1VzhDTSs0UXNMR1FyLzRyNWZ6?=
 =?utf-8?B?QjhsdnFWd0VaemxYdFJGemRuemZuVWlKYm4yOHlRTWVCR1RTamlMMjQ2UW4z?=
 =?utf-8?B?RXoyZVN0TjZaME0ybHBrUEU1ekQ5WTA5SnBaVXJLU1J1UDFmSlZia3FXTDZV?=
 =?utf-8?B?OHZVUGtlVDdieTJsTUZaTU1ULzM0K0I1VGdNbURUcEhzMnhvZFVJVldPby9I?=
 =?utf-8?B?Tzl0cy9paGU0RXU1bjhCb0ZEem44SE41eERWUmt2MFRGMGxHS29uRVlLRkRt?=
 =?utf-8?B?cld0bUpSVlYyVGdYZGs1dVhiSlBRUDY4RGxUSW1oWnJaUldCdWZqTEZQSFdN?=
 =?utf-8?B?Ymtnc1RaTTdEY3gxSWNUMmRTMTNmNGlhUmRLcWhabkM0OThKTGxEOHlMVmJW?=
 =?utf-8?B?dVkxMW9WcVBYU2dQMnFDaTdaMk5RVFk3bmNGazZSOU5iVFpEdUpvNXlRbmdk?=
 =?utf-8?B?TUM1Wi9HZExWay9BRXRPQ2VSanpLYnMxQU1JOUZITTRPUlBEK0d1WExTN0Jk?=
 =?utf-8?B?c1JYL0RJNDQyRHpBZTNpcUdMY2ZoZUt5cW9VdlU5VGtRekJ1d3d2Skd1Y2xZ?=
 =?utf-8?Q?zwkdmXAs/45PfWAXOhXJV5L8c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56873d0-8d74-4c16-d4b8-08dc15fbf091
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 18:58:19.7950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBOhkabsqNhOqT+qgnlcocgC7WN/FIaZbp05X2OjSiBUFmYJsuvGyZY3b6K5uzBj+rgbT+5eLEJ5BQ7ihYIqFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7426
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
Cc: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I haven't seen any replies to this proposal. Either it got lost in the 
pre-holiday noise, or there is genuinely no interest in this.

If it's the latter, I would look for an AMDGPU driver-specific solution 
with minimally invasive changes in DRM and DMABuf code, if needed. Maybe 
it could be generalized later if there is interest then.

Regards,
   Felix


On 2023-12-06 16:23, Felix Kuehling wrote:
> Executive Summary: We need to add CRIU support to DRM render nodes in 
> order to maintain CRIU support for ROCm application once they start 
> relying on render nodes for more GPU memory management. In this email 
> I'm providing some background why we are doing this, and outlining 
> some of the problems we need to solve to checkpoint and restore render 
> node state and shared memory (DMABuf) state. I have some thoughts on 
> the API design, leaning on what we did for KFD, but would like to get 
> feedback from the DRI community regarding that API and to what extent 
> there is interest in making that generic.
>
> We are working on using DRM render nodes for virtual address mappings 
> in ROCm applications to implement the CUDA11-style VM API and improve 
> interoperability between graphics and compute. This uses DMABufs for 
> sharing buffer objects between KFD and multiple render node devices, 
> as well as between processes. In the long run this also provides a 
> path to moving all or most memory management from the KFD ioctl API to 
> libdrm.
>
> Once ROCm user mode starts using render nodes for virtual address 
> management, that creates a problem for checkpointing and restoring 
> ROCm applications with CRIU. Currently there is no support for 
> checkpointing and restoring render node state, other than CPU virtual 
> address mappings. Support will be needed for checkpointing GEM buffer 
> objects and handles, their GPU virtual address mappings and memory 
> sharing relationships between devices and processes.
>
> Eventually, if full CRIU support for graphics applications is desired, 
> more state would need to be captured, including scheduler contexts and 
> BO lists. Most of this state is driver-specific.
>
> After some internal discussions we decided to take our design process 
> public as this potentially touches DRM GEM and DMABuf APIs and may 
> have implications for other drivers in the future.
>
> One basic question before going into any API details: Is there a 
> desire to have CRIU support for other DRM drivers?
>
> With that out of the way, some considerations for a possible DRM CRIU 
> API (either generic of AMDGPU driver specific): The API goes through 
> several phases during checkpoint and restore:
>
> Checkpoint:
>
>  1. Process-info (enumerates objects and sizes so user mode can
>     allocate memory for the checkpoint, stops execution on the GPU)
>  2. Checkpoint (store object metadata for BOs, queues, etc.)
>  3. Unpause (resumes execution after the checkpoint is complete)
>
> Restore:
>
>  1. Restore (restore objects, VMAs are not in the right place at this
>     time)
>  2. Resume (final fixups after the VMAs are sorted out, resume execution)
>
> For some more background about our implementation in KFD, you can 
> refer to this whitepaper: 
> https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md
>
> Potential objections to a KFD-style CRIU API in DRM render nodes, I'll 
> address each of them in more detail below:
>
>   * Opaque information in the checkpoint data that user mode can't
>     interpret or do anything with
>   * A second API for creating objects (e.g. BOs) that is separate from
>     the regular BO creation API
>   * Kernel mode would need to be involved in restoring BO sharing
>     relationships rather than replaying BO creation, export and import
>     from user mode
>
> # Opaque information in the checkpoint
>
> This comes out of ABI compatibility considerations. Adding any new 
> objects or attributes to the driver/HW state that needs to be 
> checkpointed could potentially break the ABI of the CRIU 
> checkpoint/restore ioctl if the plugin needs to parse that 
> information. Therefore, much of the information in our KFD CRIU ioctl 
> API is opaque. It is written by kernel mode in the checkpoint, it is 
> consumed by kernel mode when restoring the checkpoint, but user mode 
> doesn't care about the contents or binary layout, so there is no user 
> mode ABI to break. This is how we were able to maintain CRIU support 
> when we added the SVM API to KFD without changing the CRIU plugin and 
> without breaking our ABI.
>
> Opaque information may also lend itself to API abstraction, if this 
> becomes a generic DRM API with driver-specific callbacks that fill in 
> HW-specific opaque data.
>
> # Second API for creating objects
>
> Creating BOs and other objects when restoring a checkpoint needs more 
> information than the usual BO alloc and similar APIs provide. For 
> example, we need to restore BOs with the same GEM handles so that user 
> mode can continue using those handles after resuming execution. If BOs 
> are shared through DMABufs without dynamic attachment, we need to 
> restore pinned BOs as pinned. Validation of virtual addresses and 
> handling MMU notifiers must be suspended until the virtual address 
> space is restored. For user mode queues we need to save and restore a 
> lot of queue execution state so that execution can resume cleanly.
>
> # Restoring buffer sharing relationships
>
> Different GEM handles in different render nodes and processes can 
> refer to the same underlying shared memory, either by directly 
> pointing to the same GEM object, or by creating an import attachment 
> that may get its SG tables invalidated and updated dynamically through 
> dynamic attachment callbacks. In the latter case it's obvious, who is 
> the exporter and who is the importer. In the first case, either one 
> could be the exporter, and it's not clear who would need to create the 
> BO and who would need to import it when restoring the checkpoint. To 
> further complicate things, multiple processes in a checkpoint get 
> restored concurrently. So there is no guarantee that an exporter has 
> restored a shared BO at the time an importer is trying to restore its 
> import.
>
> A proposal to deal with these problems would be to treat importers and 
> exporters the same. Whoever restores first, ends up creating the BO 
> and potentially attaching to it. The other process(es) can find BOs 
> that were already restored by another process by looking it up with a 
> unique ID that could be based on the DMABuf inode number. An 
> alternative would be a two-pass approach that needs to restore BOs on 
> two passes:
>
>  1. Restore exported BOs
>  2. Restore imports
>
> With some inter-process synchronization in CRIU itself between these 
> two passes. This may require changes in the core CRIU, outside our 
> plugin. Both approaches depend on identifying BOs with some unique ID 
> that could be based on the DMABuf inode number in the checkpoint. 
> However, we would need to identify the processes in the same restore 
> session, possibly based on parent/child process relationships, to 
> create a scope where those IDs are valid during restore.
>
> Finally, we would also need to checkpoint and restore DMABuf file 
> descriptors themselves. These are anonymous file descriptors. The CRIU 
> plugin could probably be taught to recreate them from the original 
> exported BO based on the inode number that could be queried with fstat 
> in the checkpoint. It would need help from the render node CRIU API to 
> find the right BO from the inode, which may be from a different 
> process in the same restore session.
>
> Regards,
>   Felix
>
>
