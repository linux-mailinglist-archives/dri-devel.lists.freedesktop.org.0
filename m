Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D717B4B1453
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 18:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718C710E45D;
	Thu, 10 Feb 2022 17:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6EA10E45D;
 Thu, 10 Feb 2022 17:36:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7cyu7xiqAHvjwPW+45RKl69DP6PtrbT3WzMshDxfGlj0YpMeJrkPmYBXQArn6rEVcXSa65DU7yiJGUe3LeUUTELwU9/rdH36kaP/Omz6JeZbOaz4l+pYG8M3yF6s5HE+a7sWgm2XCWuc0se5fSAZ/TZa0IN4jTR/VHaIGmAiW/tm0eO7Gvld4m0PMPUhkY0bSAHZIuzvqAah1ZMfKs49Qx6IzOJARzTpRTYzkwMgMIWw1ckBApq2uXxA1nyhz8tHR40MAO5D/SoN5JFoYlmt8l5IZSryAmrWqQElmtTQ3QWawhPrtsdEbTuYTUokoqI0RHA57E5EK9ll7M9IIn0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZH9j1MVJ4M9avwtaAH+KtuO8LNSN19ucO1LiCqNbBSg=;
 b=QSwHm4CMXvhgnJ6r49cK20rim8WUGcDjyPUbVkZbNtgbSodvI6dm2uieqTRh2z5EbbnczAowFsWyPgnDdBblJ2YP3DM7SipdYpXxCe8xBb/KNEUvY0k0mwSYZfCr18cqKGRp3IGhwke6Hxdynjb6UiDOvFjGT413GPh1f+PdOODfh0akMyMqTUZk4o3VdtSddPyxO7ISR0YaRTkfWSnj4/L9fPiINYUhOXydgDlL9SAQ3sB4OBIvLSLZPIOn8ouB2V0fC3QNJTBGsIPHW/anbZ7bD5QDn+Xmk69Taki6b/NLwHmuakOQEaZgZSNNHq5sYgD6Mj0cVb6XvVmPGSohkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZH9j1MVJ4M9avwtaAH+KtuO8LNSN19ucO1LiCqNbBSg=;
 b=sFYWsnpvVaIeWB3xCgbJfFK7ptog8lIf+0D/OFi6CVJrBCqQtrfBNUO2uKwkWw5NK1e6GDyoEXCPMWBVdXHh4N+kvDyDJqJ9WqxniFyVDKcUj3NNbOaBK0C/JrkIbNCte4u+zGjaiGrAK/5P6pIYCzK5ShQWIo40i26arG2Royg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by DM5PR12MB1706.namprd12.prod.outlook.com (2603:10b6:3:10f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Thu, 10 Feb
 2022 17:36:29 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::c819:2722:b002:d75a]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::c819:2722:b002:d75a%3]) with mapi id 15.20.4975.014; Thu, 10 Feb 2022
 17:36:28 +0000
Message-ID: <955957ed-7201-71da-7a88-659da592fdb6@amd.com>
Date: Thu, 10 Feb 2022 11:36:23 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: start sorting out the ZONE_DEVICE refcount mess v2
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>
References: <20220210072828.2930359-1-hch@lst.de>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <20220210072828.2930359-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:c0::34) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 195c0eed-55f4-43fd-3e28-08d9ecbbde7c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1706:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1706E8A1BB88E919A1D83423FD2F9@DM5PR12MB1706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TNTkbsxGbifTk+FoC/4lRzpDa85fQv7x8saayjeUozrPF8VZDXRP7r6AILt66fFYzofLwMSn59GhMOQSQmohAnLjyhPL+5CetY7UNhchoWrO+3z8WJJT8o+nBme6mQKuiM+zYCv2vna/tQSMBNMnYxoVgMa6/uBCEAxhZC5H1BZhWfkntFonYOA6fbzjdE2+kkHRame5HgHd5o1g32nA9xExNPsp2cteDkPXc5w2AOezpkq8MqER+cqXjdslwO0wpUgjnu4LCf0AfRcRYCGCX3qmQeF0+JWDVjwf7x4sq4HlIGy37bhJqSvavIDyFtaOiz76cvl73CCyvYFCAEfRNptVNC0yyti4oI4EOWtgI/h7fjkymVAGliajVdvz8V3IQ63JWc0IbwoZ1wJax7H+UNs8dPvprWmkAJjyNhzGG6W+KD7Yp2RgiKWAyTk2W1+O8Ho3HLy0uRqpSOGsUfBwPo8jQUPww8PgjnCTioyBGZoHv7YkZ/FVvSEaWGwsDGmEJLGChN1q/5W7P6Bo7MqnV9KcyMTOqQEtQ9r61pep7DKNxlRxyBcwxjfxkIeRAD27x57z4SGCT9msylXNWHK+c3uZ4nBgWbTGrl7CfXLJUkmkkPmCmI+GfXLxJtrPbb4uLiU+a1kE0R2XrERM2YDp2tKSXAOzBodUEkV6knNZihhldmvEig7vXPFgDI2eDZd/ygtV/lNEdQGrrVY2J5qxWdD0GyGhhwMVlGodGVapHJpcU/UNJf1V2i4DnvYEE5DLBWzGtkFQ3eZ5YKoFxxV9YPUWJMUqEZlWz0gL7BOJ1C00DyGVhNWjHWo1wz2qrzJW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(186003)(36756003)(83380400001)(2616005)(2906002)(26005)(53546011)(6512007)(38100700002)(508600001)(6666004)(110136005)(6486002)(966005)(316002)(54906003)(7416002)(6506007)(66476007)(5660300002)(66946007)(66556008)(86362001)(4326008)(8936002)(8676002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDVFOFdnekhzMXNwQURpbHl6NndTcllGUnBuSjBOeVk4RWx1OXdCeUdYL24y?=
 =?utf-8?B?TXNxMzVrcEgyRXVTTThyc0hFbWcwR09XeTBZcWNrRFliUnB3a0g0Rnp0eVlD?=
 =?utf-8?B?Q0haZ3FUTGY1ODM3WVUwMGpHV0pMRDEzcG5oV0FPakJnZzZ2NEZmUThXSkZQ?=
 =?utf-8?B?NVpPZkkvaThHV0U5QllIRHYzcWYxSklyenJELzRvMzNYeUxhcC9xbU91bUZr?=
 =?utf-8?B?dXdPbG9WRENYb01KSWg3bkgwWmtReC81Ukl1NmlpWGprRVY2YlBqSldlRXUw?=
 =?utf-8?B?VENpQ201N3l1WTJJS1E4dFIyLzN5R3JLQjdCNnBhUmk4c2IvbTVDVHlOZmxE?=
 =?utf-8?B?Q2VzR21LMEl6TGlDS2tlTTZsQWVEcjN1Y0JRUnJxMWNPdngrQkRWemtWb2xE?=
 =?utf-8?B?UmNrMURCRUovcU10UnJMUSs5RFpLS1A2Z01nb2JkNmFOMWVMT3kyL1FlS1Z6?=
 =?utf-8?B?emh6d0k5R1ZxSzdhZDVUelNxdDAwL0wvS0orUTNmS2RqUFdVanlWT0s0eDRi?=
 =?utf-8?B?azl1L0tWSm5nVWZGR1RpNDBlaEtzcG80NjI1Z1lndnQvQ2YrQlZ0Z1BnZUhx?=
 =?utf-8?B?SFlQYTVXS1Bha2NBRXdXcmQ3eGVWek5DWmVLTzhpSTdZNlhPRFQ5QURpd1RR?=
 =?utf-8?B?WnlXNFE5M2s1dEwyTVQ1ejBUYitHcUhWeFQ3Y0JjeEU3bUZXa1V6Qi94Zmor?=
 =?utf-8?B?NFlLemZ6aUxaWW10OFJHLy9CUGRlUHA2YVpjekdCbUVCbmo0Yk83VFViOGwv?=
 =?utf-8?B?TUJpTzMyR1FxQTFIcVFqSS8zbXVNSFJQSnhQWVhvK2t3SnE5S1BrS2VUZXBP?=
 =?utf-8?B?amt1MlAzMXBSVTdka2FJUjFlclJ6eGJhazh0RFpYTmNweStEeXd4TjdheDR5?=
 =?utf-8?B?VmQyeXlIMG12ZHo0MGR4dVJSSlM0ZUg3VEx0VDZ2alFJbUk4bllxNnFEcS8r?=
 =?utf-8?B?bjFXRXRYdmlKLzBHTlI3RUdlRkRGcit6cUUrK1VEYlcxWVk3S2xvRlZpcGg4?=
 =?utf-8?B?WkUzN1dxcUZxdTRhdWhUNm80cVBvUkZyZFl0aUc2eHV5WUFlMno4dzliQTNi?=
 =?utf-8?B?SUVEN2d3VUlXelVlcUtCczVPS3hWL1V3UllQYUI5YTMzMERpU0o4TzluZk5H?=
 =?utf-8?B?UFdLVEpHb0xuMnBLejcxcjQ5ay9nWHQvVENZOTlVNWNyV2duQmNROVZ5ZHN5?=
 =?utf-8?B?cmFUaXZITVdkWW5vUmpYTWhWZjh3a0J0UGJRamRlVU9ya0tNekpLeWlwUGRN?=
 =?utf-8?B?SW9iNXhiWDNFdmlpTkM1N0RTL0N4K1NBNk1oNk5ZM2RrRjNmcTNpL2RMUUw4?=
 =?utf-8?B?SnBNdEpaQlFHWUJmWWpjTnczRnVGUWd4NUtWUENXOE9LTDB5Rzg3eEhMTFN4?=
 =?utf-8?B?Y0R2SmxTcTI5ODE4MFpqRFJYbXMybE4wUVllS1BTTUVORmdMZFJpa3AxdFdu?=
 =?utf-8?B?THhFdVVhTlpCYXZNTktwOWxBVVBHbXNDSXhJUWZPaUhtekczZ3BHSWdWaFNn?=
 =?utf-8?B?bCswSmJiaFovMStiWW9CWTdUTDFBTzZCQnI2L2UvaGE0cktua0pFWmVjY0ZM?=
 =?utf-8?B?TXkrYkJ3ZEFCeW9pOW1BK3dSQVgvZ0RQVHBEUmhGMWRHZVZzc3I0VEhoSG1O?=
 =?utf-8?B?bytXUFlBZ25hWU5EZ1JtYkNNUm1vTi9YM2U5Mm5XRzJuZTBQcU1mUGpXNDdv?=
 =?utf-8?B?WVNYRzFtajY1bEJVTW1TWDNMaThPV3JIUmVjaHQ0RnRpTEFHWjUvTzVFcWRy?=
 =?utf-8?B?eFRPVk9sVHRValJGZi85Z3JNSStqM2w2YW8zV2wrZnc2OUc1aEhkSjdudjA0?=
 =?utf-8?B?bEdpREwrUGtMTnNHOG1JY0xsR3lEQTJIZWJOdzB6dHhOb0pqNE9XMHlzaWJi?=
 =?utf-8?B?ZDFrakhPWWkzNm1UWjVpbnM5Q25vU1lWSWRYY2lSSk9QcTNWVkxGOUFTRDh3?=
 =?utf-8?B?RVNKL2grSnpFU3BZTjlBNmEyV01uYTFJUUx3Z1lkNWdlbHdGSXRmbmJpSDRE?=
 =?utf-8?B?elhVeEJLMDFicnVqSzRrMFdVUGwzbXdXN21COHhzb3hsZlBjVGZtMWlJMU4z?=
 =?utf-8?B?aWNtcHFsVVhiRGJDcFlvL3hJSms5MWJ6Q3ZLWXgxWHJEQnBldjBoSzBFWVJt?=
 =?utf-8?B?Q0M4OVNFZHlzTTAySGF0MUV3anBGWTlnR2h6RzlWWURjRi9kQ3AvcCtYelJP?=
 =?utf-8?Q?Oa6uhltqDaXyGpcx1WguOJY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195c0eed-55f4-43fd-3e28-08d9ecbbde7c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 17:36:28.8171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WJ9ThEeLYiV9uVA2LtvY6tBQL/gPxmBYxfRzjvhN6Ed8vaxQGR9uM8BLrSlc977cY/4LKewtjbmEcQXzslvLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1706
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Karol Herbst <kherbst@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Christoph,
Thanks a lot for rebase our patches. I just ran our amdgpu hmm-tests 
with this series and all passed.

Regards,
Alex Sierra

On 2/10/2022 1:28 AM, Christoph Hellwig wrote:
> Hi all,
>
> this series removes the offset by one refcount for ZONE_DEVICE pages
> that are freed back to the driver owning them, which is just device
> private ones for now, but also the planned device coherent pages
> and the ehanced p2p ones pending.
>
> It does not address the fsdax pages yet, which will be attacked in a
> follow on series.
>
> Note that if we want to get the p2p series rebased on top of this
> we'll need a git branch for this series.  I could offer to host one.
>
> A git tree is available here:
>
>      git://git.infradead.org/users/hch/misc.git pgmap-refcount
>
> Gitweb:
>
>      http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/pgmap-refcount
>
> Changes since v1:
>   - add a missing memremap.h include in memcontrol.c
>   - include rebased versions of the device coherent support and
>     device coherent migration support series as well as additional
>     cleanup patches
>
> Diffstt:
>   arch/arm64/mm/mmu.c                      |    1
>   arch/powerpc/kvm/book3s_hv_uvmem.c       |    1
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   35 -
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |    1
>   drivers/gpu/drm/drm_cache.c              |    2
>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |    3
>   drivers/gpu/drm/nouveau/nouveau_svm.c    |    1
>   drivers/infiniband/core/rw.c             |    1
>   drivers/nvdimm/pmem.h                    |    1
>   drivers/nvme/host/pci.c                  |    1
>   drivers/nvme/target/io-cmd-bdev.c        |    1
>   fs/Kconfig                               |    2
>   fs/fuse/virtio_fs.c                      |    1
>   include/linux/hmm.h                      |    9
>   include/linux/memremap.h                 |   36 +
>   include/linux/migrate.h                  |    1
>   include/linux/mm.h                       |   59 --
>   lib/test_hmm.c                           |  353 ++++++++++---
>   lib/test_hmm_uapi.h                      |   22
>   mm/Kconfig                               |    7
>   mm/Makefile                              |    1
>   mm/gup.c                                 |  127 +++-
>   mm/internal.h                            |    3
>   mm/memcontrol.c                          |   19
>   mm/memory-failure.c                      |    8
>   mm/memremap.c                            |   75 +-
>   mm/migrate.c                             |  763 ----------------------------
>   mm/migrate_device.c                      |  822 +++++++++++++++++++++++++++++++
>   mm/rmap.c                                |    5
>   mm/swap.c                                |   49 -
>   tools/testing/selftests/vm/Makefile      |    2
>   tools/testing/selftests/vm/hmm-tests.c   |  204 ++++++-
>   tools/testing/selftests/vm/test_hmm.sh   |   24
>   33 files changed, 1552 insertions(+), 1088 deletions(-)
