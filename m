Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE92F3FDEDD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 17:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8231D6E20A;
	Wed,  1 Sep 2021 15:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4726E1FB;
 Wed,  1 Sep 2021 15:40:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnG99YxyMFxQdRra+pxl+qv+CZLseKmWUybQUS7Tb0qsQmahRL3I8vflUWfogjNF7zvuiHbiyr6faLwDZgTOgDJ2/crs/CKtDJVITWig3eXEi1S9bGZHzDDpJSHKcPJOKMc7iCm73A39UZj7qsSwUOthNVeddKfPsDtPHk8SjySahPpqbbf0MdqRaAyjACj/VlxixsNhDZQ6Yy8ueX+OPXuX/hp3Me/zib2Z32JkJa4ZkzOGENPWrynn+S/VnImiTXDjXIe0Vi5OpJO5FFnrRFh1khu/LMuOXtBtoEunlOppM2kull88ToGH48caMGnsoIDdk+kmm2x3yniCNZ7w7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eq1A3hWQGXYX+bVwQ4HYkoqrw6bW+rc4zaooUDnZbHE=;
 b=Wm/juQiepYSRXCWBW/sqbjp84IacURH/I+t4xhSBpQLfZuzkdCIAAc3j4AwkfW8+xKKRtOrj6Dbrmbl7zNaYsOAcOXZEc0Ou8bbsWS95PdkLECzupPcWPBkaw/XXIjrPkXk2958EqpCkO/o2Plm6d5NDGfm75ZkZ/22G8UrUAzBfcUqdz/Q6gXBqNMXMTzwNyMCSYur9EvwAeEuUlaA7PholNBOi+d4/Pif+aAOnsiXb4b2BHjzb73MqVeTnT1qAWfaU3OxGfAe5OrRILDMmQET/w1jntWnoqHdvwHS04UrhN6PUTSjchAGeMgLGIHQcV78yRP28juF3qx2oRmXGCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eq1A3hWQGXYX+bVwQ4HYkoqrw6bW+rc4zaooUDnZbHE=;
 b=GFkFkqV1OtE0lzDy6l/bdMqcyCAicDb8JATd+Jepwf5zZMCfyHu8uy5kxhb5gOfjWnxM9nk1Dk/EVwO5FCl9VEvTXTFefyZ6WiTggz+xrUlenyZilPzQF2vk9cz6rHAoFrI8Shuft9rha8mMRTzEp97SGLdU8nwh5D4uxth+iWU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5258.namprd12.prod.outlook.com (2603:10b6:408:11f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 1 Sep
 2021 15:40:46 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 15:40:46 +0000
Subject: Re: [PATCH v1 03/14] mm: add iomem vma selection for memory migration
To: Christoph Hellwig <hch@lst.de>
Cc: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-4-alex.sierra@amd.com> <20210825074602.GA29620@lst.de>
 <c4241eb3-07d2-c85b-0f48-cce4b8369381@amd.com>
 <a9eb2c4a-d8cc-9553-57b7-fd1622679aaa@amd.com> <20210830082800.GA6836@lst.de>
 <e40b3b79-f548-b87b-7a85-f654f25ed8dd@amd.com>
 <20210901082925.GA21961@lst.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <11d64457-9d61-f82d-6c98-d68762dce85d@amd.com>
Date: Wed, 1 Sep 2021 11:40:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210901082925.GA21961@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::36) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Wed, 1 Sep 2021 15:40:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c19172f-e664-4cda-8893-08d96d5edd4a
X-MS-TrafficTypeDiagnostic: BN9PR12MB5258:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5258594B9DB97C0D912E976692CD9@BN9PR12MB5258.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qtmr2r15kQFgb2D0iAxixnwQpA1HK2JD9AN7CeW6qxI1r8SYEGCYjY1KsvIK7Zn6UxPmfrVkl+6PCPWoh3Ke5az8juPjJU9JPHwUI6ZbpFmmrBkGLhdk5ATZIMMyCa/aJ+vw7mN5SIqfl6qOsUSmgKHRcLtqjGYXPZjb2DawmhBKl2IIC4kWtZ3mmGRvCfGwKA1qXoVswUFR47vHG5sPKauJUxljEQYi8KxVf5OyuYDc7rqeu6klW4tT6Uw9Psm6hXq5khsh2mTIevGs3PbM9kaetPKswX1lXV0ZB+fk78KCFwkVQDZss8/hqIBpTVSFOXc2faMMPsFdzZwLqkGDXdy+AXiANTVGEJNc35hvWPGM0ZyhcT0JGwMY/YdOWmu+EGMMxkmxP1RukGgAQWsiFILG8Km+6swJ7T90HIlbgFzMG9QqUg8dT9AAZkTZf8Xlj2CJG8SGUuC0BschrKgfHorkEcdhmWZnL1Omnrw2WkvHjByjTW+2Jal5hrC648e0r22Qxpx0jPLfI3amELBB3B6TZ5GBopz0XAo/7oUyn/rhuXXTembyL2NL68BFoBOupwQA9/yRDteO/kL2R5TdlE5n12dMAWJj06Oh+v8zuGkIaUnku256M03LeAC0yNZ3YfYq4Nx9n2qMJxhy4HsqALxEzlH7YTl6quQ3CpdEy1BrbunqONCeFNTGqF4u9LomRNMBQTcf+IrrV9Dn8EJZD46QOcPmqPu9JcvuG/PW/Hc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(6486002)(508600001)(2906002)(7416002)(26005)(8676002)(38100700002)(8936002)(44832011)(16576012)(5660300002)(86362001)(31696002)(956004)(4326008)(83380400001)(31686004)(66476007)(36756003)(6916009)(186003)(66556008)(2616005)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WitlZ1RyN21yeXQ2SFdSU0hhbTFqR2xhZCtXKzRUMjRPZ2RyV0J3ZWZqeHZ4?=
 =?utf-8?B?Q2xzRXdmNWlCWFd4REFrZGpod1N5V2VCYWhIUUo3TDEyekRuT3V3N05zOVpO?=
 =?utf-8?B?UmxMVGN3ZDlhYzlNQnNiUWVxc2Y4QmNMNkdNM0dNNllWU0VQKzI4UFJBQlp2?=
 =?utf-8?B?eXJhQkwzZHM3YytPcHhSRUNmTWUybWdQWTlBMVBUemplOFptWFhBc1RNWHo1?=
 =?utf-8?B?TUltM2VjOHh4VHQ0WnBYTVMwdWd6QUhtVVI3VXVWcVQ4M2cwQXFuNVp0NkI2?=
 =?utf-8?B?d25sS1JwRGlxOEh4Z3VHMzFQNFArcmJyM29vby85dVVJcjNFNm1WTktENjZZ?=
 =?utf-8?B?U1NYY29xODUwS1BVR2dkS2NpKzRDcUJkUjUzUWpxOHp1RVBJU2lkMThTYkRE?=
 =?utf-8?B?ekNoUXBwSEdUMVIwL25IelJROFJybHV1aTlFak5HU1dFWmNmTTczdmpvZ1VL?=
 =?utf-8?B?dTZ5NFhBaFhudTdqb3dyZDhzQW1qZy9UWnp3M2VxcFVuTVpXUW54R000R3gr?=
 =?utf-8?B?Z2thRjdpQjJ1SlpJK3VRREJ0VVdIa2R4MTdlZm41ZzQ4Ujhzek1tK2xTYW5Q?=
 =?utf-8?B?TUJBcmJKOTVxUFF5TTlkUDJteU9HUC9kUEw1dFdZY3UvcGF4cVZmK3QxWDJQ?=
 =?utf-8?B?KzQrK0pmZHpXQWhEUU9FRzdWT0lQSEw4ZEk4dFM2VGhCU20yR05MQ0sySTRU?=
 =?utf-8?B?NUJqOUF1YkZhd2x2T1lMcWp3bFBUd3RONk1EamdEakYrTDcrcTdzVExhbFJK?=
 =?utf-8?B?aFpqTE1XQ0VQNWxQNDdNZldGRDAyV2hIM2V2Y3hMTFEycUd0N0F2bWZjZ1VJ?=
 =?utf-8?B?ZzErOGpnOTNkNWk1Ylg4eEVxSVVvUFZYc0RlcE51a2Iwei90V1NnU2IybGwy?=
 =?utf-8?B?N2M1ZjFEcTAxZTJ3dVFiaFJlcG5PK3J2OUxyeFdYaVh2RldoalNYRzVKODFT?=
 =?utf-8?B?YzJ0SkJBSTBzUXRseGJlekFMbnc1SnVKdDJqc0syU0hpMEZIa0J3aDRTVEVO?=
 =?utf-8?B?S2ZQcGp4LzEvV0x4MzU1b09TV0pVeis1eXFtWmhkVUxpVmtOL3NpYy9HN1Ey?=
 =?utf-8?B?MmhDQlMyajZ5dDB6WlNYbC91eDBRZU5GNjlWZVExZUNVM2FKY0pwLzZvQ2Jx?=
 =?utf-8?B?MHJINkVndDZrak5zNHVMUTdZZ2dlVjdUM1VSSFlBODlwY04xOHE0Nm1WYU1V?=
 =?utf-8?B?VzFFMk5DSmF4eE5QWkQ5Y1lWZ1VXOUw4Ymw0NU1yOXRDNUFKZ1Q3ZktUUkoy?=
 =?utf-8?B?TmlZYXNYR2RKTUdMRjhOSmxQWnVGd1R1SldsUjRkQk5WZVJaYUJMSlpJVEIy?=
 =?utf-8?B?ajlsd1MrY0FJc2s4Qkp3YnNGSkpTZUlaMjNuaXVDbGN1YTg3V1dEYUFkdjNl?=
 =?utf-8?B?bm42ZEZEaXNWVkhpa3dMYmdESG9VY1FCRUNxaXQ2K3ZyaXVMVksrMDFGZVZa?=
 =?utf-8?B?ZHVxbWZtS3VHT3RFK3ZqbGFoN01ic1JlUnJyM2UxNmtLeTNBSktpWEMxYkxy?=
 =?utf-8?B?U0FMWXM3VVZ1N3hobDQwVThIU3pCdDlscVNtYzBQMXByU1hncUQ4MlBYeXZG?=
 =?utf-8?B?Y3V4MnJ5cmhGMFFyZ2tSMW4rODZLKy9lVldJNm5WdWVydUNCYlZ0ckd2a25X?=
 =?utf-8?B?WlNoKy84SDZCeEZSeDloTWNwYlZLMDFOYmtpdUdHRHB5WG1GaGE4ZFdHOXNN?=
 =?utf-8?B?cDZhdk5DZ3NMSlp1TWNxMmQrRGhsL3BUVkw4MC9jTXhvWVBaQUEzSUdwVlpa?=
 =?utf-8?Q?gOOUlcuRYyxVqzPra6WlWuvbv/WMk0B8ndhzfIy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c19172f-e664-4cda-8893-08d96d5edd4a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 15:40:46.0003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCpbIeEXW0ZMPL1fMdQvlgdM6IItpVBTzCRQpsd5sE8NplK18EHO73h5OlZGXnSrVxXvArIjVsTJt4F9N7aqOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5258
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


Am 2021-09-01 um 4:29 a.m. schrieb Christoph Hellwig:
> On Mon, Aug 30, 2021 at 01:04:43PM -0400, Felix Kuehling wrote:
>>>> driver code is not really involved in updating the CPU mappings. Maybe
>>>> it's something we need to do in the migration helpers.
>>> It looks like I'm totally misunderstanding what you are adding here
>>> then.  Why do we need any special treatment at all for memory that
>>> has normal struct pages and is part of the direct kernel map?
>> The pages are like normal memory for purposes of mapping them in CPU
>> page tables and for coherent access from the CPU.
> That's the user page tables.  What about the kernel direct map?
> If there is a normal kernel struct page backing there really should
> be no need for the pgmap.

I'm not sure. The physical address ranges are in the UEFI system address
map as special-purpose memory. Does Linux create the struct pages and
kernel direct map for that without a pgmap call? I didn't see that last
time I went digging through that code.


>
>> From an application
>> perspective, we want file-backed and anonymous mappings to be able to
>> use DEVICE_PUBLIC pages with coherent CPU access. The goal is to
>> optimize performance for GPU heavy workloads while minimizing the need
>> to migrate data back-and-forth between system memory and device memory.
> I don't really understand that part.  file backed pages are always
> allocated by the file system using the pagecache helpers, that is
> using the page allocator.  Anonymouns memory also always comes from
> the page allocator.

I'm coming at this from my experience with DEVICE_PRIVATE. Both
anonymous and file-backed pages should be migrateable to DEVICE_PRIVATE
memory by the migrate_vma_* helpers for more efficient access by our
GPU. (*) It's part of the basic premise of HMM as I understand it. I
would expect the same thing to work for DEVICE_PUBLIC memory.

(*) I believe migrating file-backed pages to DEVICE_PRIVATE doesn't
currently work, but that's something I'm hoping to fix at some point.


>
>> The pages are special in two ways:
>>
>>  1. The memory is managed not by the Linux buddy allocator, but by the
>>     GPU driver's TTM memory manager
> Why?

It's a system architectural decision based on the access latency to the
memory and the expected use cases that we do not want the GPU driver and
the Linux buddy allocator and VM subsystem competing for the same device
memory.


>
>>  2. We want to migrate data in response to GPU page faults and
>>     application hints using the migrate_vma helpers
> Why? 

Device memory has much higher bandwidth and much lower latency than
regular system memory for the GPU to access. It's essential for enabling
good GPU application performance. Page-based memory migration enables
good performance with more intuitive programming models such as
managed/unified memory in HIP or unified shared memory in OpenMP. We do
this on our discrete GPUs with DEVICE_PRIVATE memory.

I see DEVICE_PUBLIC as an improved version of DEVICE_PRIVATE that allows
the CPU to map the device memory coherently to minimize the need for
migrations when CPU and GPU access the same memory concurrently or
alternatingly. But we're not going as far as putting that memory
entirely under the management of the Linux memory manager and VM
subsystem. Our (and HPE's) system architects decided that this memory is
not suitable to be used like regular NUMA system memory by the Linux
memory manager.

Regards,
  Felix


