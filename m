Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C883EAF8E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 07:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842246E4C4;
	Fri, 13 Aug 2021 05:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2067.outbound.protection.outlook.com [40.107.95.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2836E4C1;
 Fri, 13 Aug 2021 05:18:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRMG5jumCnx3cc9Zd2dB/8g3zjCkBgru2Dkc5aBIIPW6pd3GYqohmw4LNCqcYPiFTvVhavJg5vPp/cBGrTGORMa3RrBj34aefI6p8Wimtuz8R5c2b3d3REGnQxqyyncyo+DjJNgfEL8jybLYN1nd9sSn7SakqBdZvHHoI2YgWUyc0RlhtiXw0u2pXKvn1N/qqhtcEw7gKb2SyeEoO4wbgHMwsgSWVw7HzE+a/p3pl08w0i0UGCbEccFxxfATNRdMdelDcplzEG+tgD2hM7aDx6rfw19mFJ8bz8lit6/vJeI760onCKmAot4LzN+QjSL9fx2tDb3ze+dqalWlqUhQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTlC2xTeEE9sBLcAV/JWRT8TLVHgWNdLDaUJUD1Kp3A=;
 b=W3barBpspBKlvQMEQ8YhbiLMGt3xkDf8HJncMW25wwZwiB/A8kDXmC0DsJlkcPMS0V/vsWHx5WpMv8lHlaif1EkU++Te3tG3+YenJ0SQBXhPG+baB1ncdhPsEqRervl/UpAgkA1ZWgnakGjQ8v7EWsp9oXJ+Gwb1IbDgd05qDH7yqZ4i7oxggOOI2lxRa0Dv8/u8jMTmcVc7OLOJXOxVugZvMEzymdehyXDFwh7cfl7KzdoP+Di87WjBRs+LSazlWA35Vo2Y5Kbn7rKt3ECJ58Ny7YGclyjOAlGhudApsKjHEqNOCOVuglgoobXA5EvHlbI9efFALbTvvMBPW36I+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTlC2xTeEE9sBLcAV/JWRT8TLVHgWNdLDaUJUD1Kp3A=;
 b=ZhijVqNyTZwDffIp5ZuUI3NYMnLZH0RyMpoFbe84oUl6f0+QWcrqlTue6reY7Ds932wliNQert7ZgbpU8RQSTy67X+kykbHWEcUTBS1IaeC08PqB8+nM6OgIKBnJSNcmNoRCdwDLeHYWYEQWAZaL4edEiqXfvP3sj7jU2lmLK+E=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4559.namprd12.prod.outlook.com (2603:10b6:806:9e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Fri, 13 Aug
 2021 05:18:53 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 05:18:53 +0000
Subject: Re: [PATCH v5 00/13] Support DEVICE_GENERIC memory in migrate_vma_*
To: Christoph Hellwig <hch@lst.de>
Cc: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
References: <20210812063100.31997-1-alex.sierra@amd.com>
 <20210812063417.GA26938@lst.de>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <863e6608-64bc-2d4c-b1f0-13277273e112@amd.com>
Date: Fri, 13 Aug 2021 00:18:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210812063417.GA26938@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SA0PR12CA0020.namprd12.prod.outlook.com
 (2603:10b6:806:6f::25) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.9.47] (165.204.77.11) by
 SA0PR12CA0020.namprd12.prod.outlook.com (2603:10b6:806:6f::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Fri, 13 Aug 2021 05:18:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd0e1171-4346-4a0c-424d-08d95e19d737
X-MS-TrafficTypeDiagnostic: SA0PR12MB4559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4559D08859CA4901DF809E69FDFA9@SA0PR12MB4559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gizVIjLvVSnrOBUZNkCJx4Y7qzsemdDtZ3SwWp/iafU931Wfjq68wXNx47pJ9r3IGQ4f5OkXX2h74m3GHvrTtPHJ5g5dyyKs+5uumd4GbH4KfKjt4jV4w62LzZJz+MgeEO0c5dpBfDt0mbe5WcmrNNfYu+lsiE+6f3C8/QqsPmdchrcIbQOiY2s74g/6oRgcY1tB7LUlt29FG9zMryVhDLXEr+nPB8T3ldrK61gzVNjhDwgx9gBi+M3asjoeWRbSWIHssKQ+3qlZefs8fCW7RFsQSga9Cv1h+L8XiWZx8V4N4n7WMgic8Kmxc3eLkHvzE3yqxmZrGloayU3kY3jnNnwEy5pJr8Vmgw4BSCGYst/7M14kvdSq+71XFpinKPTS6Yd+ULZ5fbPdVr+JB/TfqDSWEAbvnsE+/j0JteGCLGn8/Zp1BaAJkUw8wE2kBXhsK+BimN8bvT0REh199LyvuORn+c52Gku1o3M4Hu/fXXR74uyfCIf38nV5AnX2vCpQkZSeVBv+3sxikKvqFfGzOKgG82lZng6aIlSqA56ZCfkWg2H+XLNcnEESCocFp6zvkwxY3Vohm4V1lao9knDHWGBs6Cjtyc0ebV+IAouTicUYZ+eL+DJiDIMcLBVmDv52rGU8OEacDER9UY3OiG5knj3Gc58KQTxRwgEImInxFPJX+YRJph4QcEUTdweCRHV29mDBF5ZvVrr6doBjsSZtPqdlB9/19aE1oQ61YLeANkceAkhY5vYe+k9jg94VYKG5HiZEdlaA2cLxDNdcXUH048E0mXwJ5FVERJfbIdOvOeclGdbl0nB7uQvPdkNvs0y5LJ6ZjXzwAUkOnsPNbQyojqBb4prVP0PPJQ3yd686tHDsKrm7vwkg4mNONlEXQekd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(38100700002)(38350700002)(186003)(31686004)(26005)(83380400001)(16576012)(36756003)(66476007)(53546011)(7416002)(52116002)(66946007)(508600001)(956004)(45080400002)(66556008)(6916009)(966005)(86362001)(316002)(31696002)(8936002)(4326008)(5660300002)(2616005)(2906002)(6486002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkRzY0FJU1cvK1dPNjNrVWxZRmRSS0VqS2RWYktOQU1nQzdSeW1DTTY1VXk1?=
 =?utf-8?B?eGp3ckI1S2RpeG5GSHJkd3VPazlycmt2Y2EveGJzTVh1K1kwVEdnMlJ6UWNz?=
 =?utf-8?B?OUtKMEpIcU1VRTBSRitNZVQ3MWhSTUNYNzBZNzFpRzRvUnJCN0xuWTdqeHBX?=
 =?utf-8?B?Z1JXMXNDNXMyeVVKS1A4K0ZWWXI0bnRxYTNvUEdPMzVTTG00b0ZCb0xESDZO?=
 =?utf-8?B?L09PMyszUEJ5dUwxaHdEYlRXQ29RY1UyQytzemZuN0hvUkE0Qk1hWmJ5cDNN?=
 =?utf-8?B?emFEYmFYYlhsTU12aEd2cHFiVERzaG5oMGY2RFVaS1dWa2FvVGFuY0NWQkZi?=
 =?utf-8?B?M2NsZ3RsRFhsWlJSaU9tQjdXR1gxZ1ZEMkxXeHkzdU80YldqOTlxZ3VNODVN?=
 =?utf-8?B?SG42RFR2bmhLTTVLb0EvY2NtMSs3bmZudktXRDFDQ1dLYzh1MUQxYVl0a2hl?=
 =?utf-8?B?aHZtbW1xQmgvcG95VFpQWUsxMmRpeXArVS9nTzFUc09adUdmb3VWdzduM0Jk?=
 =?utf-8?B?czRwcm5vWG1CSHh1dStrcm5Fd3dYYlhFeHBQVWJaSmpwSy9qeW5Xb1ZkSUFF?=
 =?utf-8?B?dFl3QmdDcUMxbHl3MXFjRE4xb1F6WXlIc0ZXNSt0cWlGL2Q4anpERnluLzUv?=
 =?utf-8?B?SzAySU9sb2ppZU9nYWdhM1FoME83aEc3aHM1RWk1RkpBQVcwU2YvUDNJa2xU?=
 =?utf-8?B?c2tPM1NnSWMrRk5ULzFrNVEyaHBTQSs4blA0dHhHVXZ3eHY2YWdEcnpuWVZ3?=
 =?utf-8?B?b0ltbkF3Y29VRW1SNkxGS3FtZ1ppazV0aVBkZlJvRDVGMjM4WW4yZkVmSXk2?=
 =?utf-8?B?eWRiT0lkQU55RU50N2F2VXZwTDVKaEE2eGN1VTBLeFZOU2tRVllDKzJuREtw?=
 =?utf-8?B?MEJpTXpEOHFKcmIzSWh2WGtmY1hJKzVzS0ZGMkw4YUhWNG9LOU9zWUQwcmtp?=
 =?utf-8?B?TEtNd0hJVXJXQnQ5eFFWcHU4Ym11bUFJa0JHQWpwVGVRVi92RXc1blllOW9O?=
 =?utf-8?B?K2JSNDZlb0RRQTZSRUdORjNBMHlCK3BuNnkzSWZMSTBJU0NjZmRUTGk3VnMz?=
 =?utf-8?B?UHpFMExzMGtsWW01dUVydWpmYkhhU3FaWHJiT3BQNzFsVk9zcExZRmZQeGtp?=
 =?utf-8?B?L2RUWHdrQkF4UlVqRVM4Z3c4MElRMzhQeS9scW1mbUxsSFpBcncyN2htUHVV?=
 =?utf-8?B?cThNQTNsSGk2b2FVUTFPQ2RHemVyMzQ5NWMzY1dyK25Yd0FkM3RMbmgzUGVa?=
 =?utf-8?B?REpIdVljcUxFeEY4RHB0eEMzSUZrV25hRmMxZEE3YzR1ZzlFUEhGS3BsUlNt?=
 =?utf-8?B?ejBTYjRFRzc1YWR6eHh3S0ZPZnRpQzJhTWY2eVd5cXlwek5zMjhxV2VhL0Fx?=
 =?utf-8?B?VWNrTU5iWExKV25BRnVFOGxtSXJBWWhaMXVMWnZCbGl5dmhCVCtIa014NEFz?=
 =?utf-8?B?SDR1WXI0c3lIMXNhSGdwNStpMndxTlQrWXdCbmgxMGJ3VGVRbkRmbWprK24r?=
 =?utf-8?B?bEt4QXd1VmI3T3JPK0NyRi8rZys2SGxIZTgvRUZkY1gvSHE0U0VyTnNaQmFz?=
 =?utf-8?B?NE9PVjhqM3dsVVdDTTZFZVB3TStjOCtEMmVhaHhHb3VRdHFtY0lIVzFVam9J?=
 =?utf-8?B?eU1WdDRUZHpLSU4xSk5FR3A5QWRiNGtOaVp4VWVpTDhUOXlXMDd6eXNKeW9R?=
 =?utf-8?B?Y3dmMXo5RG50RlFqbVgwOHZ1dm9RWGR3dlBYUnpCaVZ3OXFZaGpDeXVWaUo4?=
 =?utf-8?Q?K6YZHb//2tYawMwjeQeGfGkDk86yRTMjZQDz4Vr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0e1171-4346-4a0c-424d-08d95e19d737
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 05:18:52.9304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxMpirIjnqJod70M1GPrE02EILOoiZJ04YMKebkTaejzpn2D3CZtmOaVzIbqEJcB0ibMkWZnGrR3cMl2da5G6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4559
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


On 8/12/2021 1:34 AM, Christoph Hellwig wrote:
> Do you have a pointer to a git branch with this series and all dependencies
> to ease testing?

Hi Christoph,

Yes, actually tomorrow we're planning to send a new version with 
detailed instructions

on how to setup and run each of the tests. This will also contain a link 
to download our

kernel repo with all these patches.

Regards,

Alejandro S.

>
> On Thu, Aug 12, 2021 at 01:30:47AM -0500, Alex Sierra wrote:
>> v1:
>> AMD is building a system architecture for the Frontier supercomputer with a
>> coherent interconnect between CPUs and GPUs. This hardware architecture allows
>> the CPUs to coherently access GPU device memory. We have hardware in our labs
>> and we are working with our partner HPE on the BIOS, firmware and software
>> for delivery to the DOE.
>>
>> The system BIOS advertises the GPU device memory (aka VRAM) as SPM
>> (special purpose memory) in the UEFI system address map. The amdgpu driver looks
>> it up with lookup_resource and registers it with devmap as MEMORY_DEVICE_GENERIC
>> using devm_memremap_pages.
>>
>> Now we're trying to migrate data to and from that memory using the migrate_vma_*
>> helpers so we can support page-based migration in our unified memory allocations,
>> while also supporting CPU access to those pages.
>>
>> This patch series makes a few changes to make MEMORY_DEVICE_GENERIC pages behave
>> correctly in the migrate_vma_* helpers. We are looking for feedback about this
>> approach. If we're close, what's needed to make our patches acceptable upstream?
>> If we're not close, any suggestions how else to achieve what we are trying to do
>> (i.e. page migration and coherent CPU access to VRAM)?
>>
>> This work is based on HMM and our SVM memory manager that was recently upstreamed
>> to Dave Airlie's drm-next branch
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm%2Flog%2F%3Fh%3Ddrm-next&amp;data=04%7C01%7Calex.sierra%40amd.com%7Ce4e14caf03de403b1e2208d95d5b378b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637643468663206442%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=W7NRFXF0t1bqAzsV1RZh4MAPly26c7XPn8kCKvaj%2FMw%3D&amp;reserved=0
>> On top of that we did some rework of our VRAM management for migrations to remove
>> some incorrect assumptions, allow partially successful migrations and GPU memory
>> mappings that mix pages in VRAM and system memory.
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210527205606.2660-6-Felix.Kuehling%40amd.com%2FT%2F%23r996356015e295780eb50453e7dbd5d0d68b47cbc&amp;data=04%7C01%7Calex.sierra%40amd.com%7Ce4e14caf03de403b1e2208d95d5b378b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637643468663206442%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=GZZrxedpAlYLfDgO1Y3jvpFacG313SXiUT3ErB4xO0Q%3D&amp;reserved=0
>>
>> v2:
>> This patch series version has merged "[RFC PATCH v3 0/2]
>> mm: remove extra ZONE_DEVICE struct page refcount" patch series made by
>> Ralph Campbell. It also applies at the top of these series, our changes
>> to support device generic type in migration_vma helpers.
>> This has been tested in systems with device memory that has coherent
>> access by CPU.
>>
>> Also addresses the following feedback made in v1:
>> - Isolate in one patch kernel/resource.c modification, based
>> on Christoph's feedback.
>> - Add helpers check for generic and private type to avoid
>> duplicated long lines.
>>
>> v3:
>> - Include cover letter from v1.
>> - Rename dax_layout_is_idle_page func to dax_page_unused in patch
>> ext4/xfs: add page refcount helper.
>>
>> v4:
>> - Add support for zone device generic type in lib/test_hmm and
>> tool/testing/selftest/vm/hmm-tests.
>> - Add missing page refcount helper to fuse/dax.c. This was included in
>> one of Ralph Campbell's patches.
>>
>> v5:
>> - Cosmetic changes on patches 3, 5 and 13
>> - Bug founded at test_hmm, remove devmem->pagemap.type = MEMORY_DEVICE_PRIVATE
>> at dmirror_allocate_chunk that was forcing to configure pagemap.type to
>> MEMORY_DEVICE_PRIVATE.
>> - A bug was found while running one of the xfstest (generic/413) used to
>> validate fs_dax device type. This was first introduced by patch: "mm: remove
>> extra ZONE_DEVICE struct page refcount" whic is part of these patch series.
>> The bug was showed as WARNING message at try_grab_page function call, due to
>> a page refcounter equal to zero. Part of "mm: remove extra ZONE_DEVICE struct
>> page refcount" changes, was to initialize page refcounter to zero. Therefore,
>> a special condition was added to try_grab_page on this v5, were it checks for
>> device zone pages too. It is included in the same patch.
>>
>> This is how mm changes from these patch series have been validated:
>> - hmm-tests were run using device private and device generic types. This last,
>> just added in these patch series. efi_fake_mem was used to mimic SPM memory
>> for device generic.
>> - xfstests tool was used to validate fs-dax device type and page refcounter
>> changes. DAX configuration was used along with emulated Persisten Memory set as
>> memmap=4G!4G memmap=4G!9G. xfstests were run from ext4 and generic lists. Some
>> of them, did not run due to limitations in configuration. Ex. test not
>> supporting specific file system or DAX mode.
>> Only three tests failed, generic/356/357 and ext4/049. However, these failures
>> were consistent before and after applying these patch series.
>> xfstest configuration:
>> TEST_DEV=/dev/pmem0
>> TEST_DIR=/mnt/ram0
>> SCRATCH_DEV=/dev/pmem1
>> SCRATCH_MNT=/mnt/ram1
>> TEST_FS_MOUNT_OPTS="-o dax"
>> EXT_MOUNT_OPTIONS="-o dax"
>> MKFS_OPTIONS="-b4096"
>> xfstest passed list:
>> Ext4:
>> 001,003,005,021,022,023,025,026,030,031,032,036,037,038,042,043,044,271,306
>> Generic:
>> 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,20,21,22,23,24,25,28,29,30,31,32,33,35,37,
>> 50,52,53,58,60,61,62,63,64,67,69,70,71,75,76,78,79,80,82,84,86,87,88,91,92,94,
>> 96,97,98,99,103,105,112,113,114,117,120,124,126,129,130,131,135,141,169,184,
>> 198,207,210,211,212,213,214,215,221,223,225,228,236,237,240,244,245,246,247,
>> 248,249,255,257,258,263,277,286,294,306,307,308,309,313,315,316,318,319,337,
>> 346,360,361,371,375,377,379,380,383,384,385,386,389,391,392,393,394,400,401,
>> 403,404,406,409,410,411,412,413,417,420,422,423,424,425,426,427,428
>>
>> Patches 1-2 Rebased Ralph Campbell's ZONE_DEVICE page refcounting patches.
>>
>> Patches 4-5 are for context to show how we are looking up the SPM
>> memory and registering it with devmap.
>>
>> Patches 3,6-8 are the changes we are trying to upstream or rework to
>> make them acceptable upstream.
>>
>> Patches 9-13 add ZONE_DEVICE Generic type support into the hmm test.
>>
>> Alex Sierra (11):
>>    kernel: resource: lookup_resource as exported symbol
>>    drm/amdkfd: add SPM support for SVM
>>    drm/amdkfd: generic type as sys mem on migration to ram
>>    include/linux/mm.h: helpers to check zone device generic type
>>    mm: add generic type support to migrate_vma helpers
>>    mm: call pgmap->ops->page_free for DEVICE_GENERIC pages
>>    lib: test_hmm add ioctl to get zone device type
>>    lib: test_hmm add module param for zone device type
>>    lib: add support for device generic type in test_hmm
>>    tools: update hmm-test to support device generic type
>>    tools: update test_hmm script to support SP config
>>
>> Ralph Campbell (2):
>>    ext4/xfs: add page refcount helper
>>    mm: remove extra ZONE_DEVICE struct page refcount
>>
>>   arch/powerpc/kvm/book3s_hv_uvmem.c       |   2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  22 ++-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |   2 +-
>>   fs/dax.c                                 |   8 +-
>>   fs/ext4/inode.c                          |   5 +-
>>   fs/fuse/dax.c                            |   4 +-
>>   fs/xfs/xfs_file.c                        |   4 +-
>>   include/linux/dax.h                      |  10 +
>>   include/linux/memremap.h                 |   7 +-
>>   include/linux/mm.h                       |  54 +-----
>>   kernel/resource.c                        |   1 +
>>   lib/test_hmm.c                           | 231 +++++++++++++++--------
>>   lib/test_hmm_uapi.h                      |  16 ++
>>   mm/internal.h                            |   8 +
>>   mm/memremap.c                            |  69 ++-----
>>   mm/migrate.c                             |  25 +--
>>   mm/page_alloc.c                          |   3 +
>>   mm/swap.c                                |  45 +----
>>   tools/testing/selftests/vm/hmm-tests.c   | 142 ++++++++++++--
>>   tools/testing/selftests/vm/test_hmm.sh   |  20 +-
>>   20 files changed, 405 insertions(+), 273 deletions(-)
>>
>> -- 
>> 2.32.0
> ---end quoted text---
