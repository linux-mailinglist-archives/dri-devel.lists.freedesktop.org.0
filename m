Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC26F3EEF55
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 17:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802436E1E0;
	Tue, 17 Aug 2021 15:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F72892CF;
 Tue, 17 Aug 2021 15:44:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yd0N/2neHctFWuquuE14T8begTCGZlpBdBLXy7dTNQhn1aeuj4qs8FbQ9ZL8JdS9F74FUyHYT76MRzNg2C/f5GfBwnGlDLMN3wsyRQPqyujo9HNNFOSyUNme1OwUB1eGoHl47ZvRfwplLSkc9h3aiFPaDFysGxiOkgfxFD8ODmrVYuoRdB/5UPb+8mZqDy6bfAqW5T00criAluIz0TfLN2b3CUohyUJ5bj3PM1AAzgcBFJmBdS03jFozlejnlYksUM/SWcMwGhx+Di4S5LpqiVvd7JOZMj4uL/L++q1rH1tSa7pCFZGeo5T6Z34f4lqCrEOtxRnYznqazw5L+qiA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2eVlr+b/OJMS8dZqmTWaXlegDT5hqA4TmoKcUGqQuY=;
 b=CsUGN1d713wsPgJsFM6Qfq0Rb9KRMs2t6YswIPZniR2p66a7MzWaCnR5Zx4W76l4ittX8D19k6SdoRJlcjIg7FhcTtGYdqHDmZro51VpsuOYFVwXmYTTQP8ggKFnICe9Xv25WNIglnNBQNLv3ZLMZlQN13XXKRAIJUw8xbQRUj+fJ5XFd8k9NPHqS8WpBfyq36npTbCbD+aEIOCycM7fB/7G6upvVqfFNanNqsw4wovDNBXpuGHiMiwy1na3FiEWMbJ0Qq87hhu63RLM5TbUchZBhSEF8fj3RiDsdeTnZrqzCNoy2W22H6j/ql7AiFTOtPYDTbG975Hr5dl4vI02zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2eVlr+b/OJMS8dZqmTWaXlegDT5hqA4TmoKcUGqQuY=;
 b=2aK9LrMzWO9u9AgbMv7Lq3DVssJIXF5i0wWPZRETQmDPhSuYKklddTtvIdi2dxcAA8dYQLuFPL/RXc6+M9BDsNkb+BhB4CF71TeSn8uXHM8BgWKEeV4tJ9INjXOVUHNAIVMmU04dbG8MEfzFtM6/qKtqq1n+TEBNnn/087sFM4I=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5033.namprd12.prod.outlook.com (2603:10b6:408:132::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Tue, 17 Aug
 2021 15:44:57 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%4]) with mapi id 15.20.4415.023; Tue, 17 Aug 2021
 15:44:57 +0000
Subject: Re: [PATCH v6 08/13] mm: call pgmap->ops->page_free for
 DEVICE_GENERIC pages
To: Christoph Hellwig <hch@lst.de>
Cc: Alex Sierra <alex.sierra@amd.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, jglisse@redhat.com,
 Roger Pau Monne <roger.pau@citrix.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-9-alex.sierra@amd.com> <20210815154047.GC32384@lst.de>
 <7a55366f-bd65-7ab9-be9e-3bfd3aea3ea1@amd.com> <20210817055031.GC4895@lst.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <e5eb53f9-c52a-52e1-5fa0-bb468c0c9c85@amd.com>
Date: Tue, 17 Aug 2021 11:44:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210817055031.GC4895@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::17) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 17 Aug 2021 15:44:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43da59a3-7b43-46b7-6beb-08d96195f6d8
X-MS-TrafficTypeDiagnostic: BN9PR12MB5033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5033B025227E7AB3A633A73E92FE9@BN9PR12MB5033.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9PdZs+1AST24Z3onUDpuyp3JpO0lYpLYaGAu5xUB/QmWdPNCt844dxbCBkxXUbc4tH0cjMgiAB//MyMicGtUJJ9Vne47VHrvrfaxUkCMMS3i+bVJPpOp6gTyjMbPJqeOH8ve5G2YVslIVb/JdnBq1z5+xHiDK7t6URCk1aYeWXTisxGhkLVel82mW/9UVtiJz9CAM9hvN0/BeBlBtGLgGUgaUMHM0LYGhpdUgNAuwiL3TTo1LBr1orT3+vdRFnjiuAtpGL51gtcaPpEw8VcwCpEbnPUJPG2Zm5He3ihWHcZ7xUwMSEXstvWpaXmHhSDyVENxc5PtsyoFWECeTYYxQ1FiH4r0//MkdyzduVEanOQuXtscfNOIOWIdCGInWirEtetHa8vD8AJHGhFQi9L5eyzzqyCwHD2oiEXd2IufpdXZZvj+eH4ct9iTnH0PMZ2BHxv/nzlJbHQCoz8OucvQiH/AzJVSlkeJShQ1n4SGK+mM74YYSOj04geoULRXWmSCmbP+JquZHJbmk+p+nTcuceSEUXOKMCOqu4xEQq5Ay4slnTfKEuO93E52H6ajPjK7v0RcL3IQg6EOgNPnmWDgflV3nDQifvSiBqnKXy9r1MIfhnzhwCCal8ZN696iAUhoQL8YdoMZmyRiKsLINih9rWflPQFd25XcUMBh+XYSpELuy0uK5Rt5t62HwyAUDk0Iy3dM0PCCANtgyhJ/j8SkSBt+XQfDzHTEBN6XCmF9sTbMOqmFsO5REVsZ6taXCefP2hwlIpHHJAdiaTsr1TLvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(16576012)(316002)(5660300002)(8936002)(38100700002)(31686004)(66556008)(66946007)(66476007)(8676002)(4326008)(2616005)(26005)(6916009)(31696002)(956004)(6486002)(86362001)(7416002)(83380400001)(478600001)(186003)(44832011)(2906002)(54906003)(36756003)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cCszOEpoRVNVUzdRa0lyRHVjQXJHWGkwYUxBb0hKL3lScFltQk0zeWNtR3BM?=
 =?utf-8?B?UjN5TSthbDlaZFZGNG9vbjhJeEszZkpRMWZaRW4vSWVZdDErK3h5TVVPQkRh?=
 =?utf-8?B?YVlhYXJFVERoT2Vva0MyNGRDemFVeEdLWHVFNHdQMmFPaDdSUjlqN1VqRU9u?=
 =?utf-8?B?YW5zK1R6RG9kSFY5amU1NXp3VEJISGI0Y0RYSWorZjRlK2hGVkU4WFJKVExi?=
 =?utf-8?B?bnI2b3dRSTRnc2UxVnR5bElybUkxbmwzdHI3c1l3SG5sTjMwWGhKQi9vTlJz?=
 =?utf-8?B?bUUxM1BLUzR1NmRzV2x2Z0lhdUtuS3VINGswTkZtVTZKSW5nTTY5SHRWdkJu?=
 =?utf-8?B?QnduS3IxN0JGUFpCUDNaSEp5REpRVkUrMzgzdmJ0aUxRb1FEaVBXQmg0NTlC?=
 =?utf-8?B?UFJiazZXVldvNnczbGlCV21ZRFRacVVnb09BM1c1d0VxMXdaVXI1VGw4S1F2?=
 =?utf-8?B?cG1EdDZhdDRXQ1o4b2k2Y1BFZGVXbTBTWnIvVmEwT3NPNlVJZDRvb01XclNz?=
 =?utf-8?B?R0Qrc0l6NkdkNS83ZG1zeGEvaFBETG1adjg0Y2ZnRHRlM0UrNWN2VFF3a0la?=
 =?utf-8?B?RGxKdXlqMXNHOHNWOGM4RmJaWXgwZDBkLzdYczNUTWErNklicEx2Z1BkcWhE?=
 =?utf-8?B?ME5JMmY1Ukl0QXozR3VNWjZMY1lZL2dJNFlRWENUQjdUUU9GQXZqYmxTQlFN?=
 =?utf-8?B?VGJFSEtqVmdoREgxakVVbHhoR1laRXZ1SmFUSmZuM3p0ZklHb1ZyNXVTU2dT?=
 =?utf-8?B?RGdqVjFmZjRzV1JIakluaGNSQXFIRENvelN0NTdabG1oWjVKbTRxdGJIeTdu?=
 =?utf-8?B?L1FzZURiVS9BRE9ialNuYVFoRmNrbldDN1AvSkw3bEEzSndYVnVQMXZleTZT?=
 =?utf-8?B?Q1lmZHE3K004Mnl1RUpsVCtnQTRFZ2ZiV1FuTU5reHZVVi9vZnZTSWVuNXBk?=
 =?utf-8?B?MnhnaG0yMFR1ZVBuTlJBQ0xtaXA5MHVnSkNFZG9IdmpNazhZU240dmVVUG9z?=
 =?utf-8?B?VVdGNXEwYVVuUnYxdjI5N2JweG40NUNQMjFHZlBYUDRyZTlFYkVrMGJrSSsx?=
 =?utf-8?B?OGdJWmVBVmpjcmQyRmNkSTk3MndnYmI4ajVqZU95eG44TmxsQ2Z6RWgwWUwy?=
 =?utf-8?B?Y3NnaWVEZ2JBSGZJQlY2ZHRySllIbENYZ0cybjZaWFBsSnR6OXdvUlI0Qita?=
 =?utf-8?B?dTNwdUY0eE1vbW5VL3ZGUlg1VGlBd2lINWZUTTN5ZnNQQ2FxK3kyM2Z3MFFH?=
 =?utf-8?B?YVBBWDZLTGxsc0RSSUxrdytiWGF6VHVMRm8wRFdiUkZ2VUtrV3ZDVU92M3V0?=
 =?utf-8?B?QzY3SjVOenpSWWt2VjQvWGdzaHFsWm13eDk5aGtPR1RhUzI4WDNXMUdrY1hG?=
 =?utf-8?B?Y0ovRHJzVjU0cm1nRUg4RDZOb3FVUTNJbnBzRkN4WTdJTjBwNC9mOFA5UmNE?=
 =?utf-8?B?MzdxTUtRYTVMNElSVS9Va3RQZi9LS2pVa1VpVmdNcTloNGcydUZTclNsVEhF?=
 =?utf-8?B?Wmphb2l5QUd4Sys5TUlSYmJ1ZGZQQW5NOFR2MVdTSVEvbnNHVXZtMDJVYmt5?=
 =?utf-8?B?cGl3L3FXVFVqbG5ZdVROTVd4TDJoV1BCY0FuV1NVbVMyUUtsajNPK2owR0kr?=
 =?utf-8?B?WmVWRHQ4REFHWlZQUktQSGpuMVJCWVUxdVp5Y0RIKytVVHpWWWJUREVGYXJI?=
 =?utf-8?B?RDNwOTJJY2pNUTBwYXp4M2E5dFRLZ09aSkxTTk00cUlUaE9ta1BycVNRazZY?=
 =?utf-8?Q?5dZfa4ZH2oTpr4wspD1N84eNMQKidLURx5cHGpX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43da59a3-7b43-46b7-6beb-08d96195f6d8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 15:44:57.1206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQWbtDEwJwnLpjfasNNQqfEtjWhebNtGIlXbuT+/StJXfrIJkuqtjIwXopJGlgpLpl4R3iExYJu5xv86KW4x3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5033
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

Am 2021-08-17 um 1:50 a.m. schrieb Christoph Hellwig:
> On Mon, Aug 16, 2021 at 03:00:49PM -0400, Felix Kuehling wrote:
>> Am 2021-08-15 um 11:40 a.m. schrieb Christoph Hellwig:
>>> On Fri, Aug 13, 2021 at 01:31:45AM -0500, Alex Sierra wrote:
>>>> Add MEMORY_DEVICE_GENERIC case to free_zone_device_page callback.
>>>> Device generic type memory case is now able to free its pages properly.
>>> How is this going to work for the two existing MEMORY_DEVICE_GENERIC
>>> that now change behavior?  And which don't have a ->page_free callback
>>> at all?
>> That's a good catch. Existing drivers shouldn't need a page_free
>> callback if they didn't have one before. That means we need to add a
>> NULL-pointer check in free_device_page.
> Also the other state clearing (__ClearPageWaiters/mem_cgroup_uncharge/
> ->mapping = NULL).
>
> In many ways this seems like you want to bring back the DEVICE_PUBLIC
> pgmap type that was removed a while ago due to the lack of users
> instead of overloading the generic type.

I think so. I'm not clear about how DEVICE_PUBLIC differed from what
DEVICE_GENERIC is today. As I understand it, DEVICE_PUBLIC was removed
because it was unused and also known to be broken in some ways.
DEVICE_GENERIC seemed close enough to what we need, other than not being
supported in the migration helpers.

Would you see benefit in re-introducing DEVICE_PUBLIC as a distinct
memory type from DEVICE_GENERIC? What would be the benefits of making
that distinction?

Thanks,
  Felix


