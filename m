Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7F03D2894
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 18:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339B86F47C;
	Thu, 22 Jul 2021 16:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EE36F476;
 Thu, 22 Jul 2021 16:59:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uf7AEH5ylQELbsL/uIYSP74qvgqm26A+y11dXNqvirHbP5VhGq1TbHwPBesrNzVC+sn50LS4FjnQCRTuIiuUNg50N8Iw6MTBoTmdhmS3lUo/JxRFK2eDuUY16lD/XdYk0+LM6uZdGo4A4emwt/rzqd2Ew1/v5vv8HyykVXCNCSlh7T3duVprDWwvUXggpZklP2wdEo4Ykcg4MIkNvZ/+Yb9ZUesZHb+YdQHrNrQHOQbB7ezUGdPNTpzpopzAxWZPjcwW8osQSrl/1ClA4UgVzFbeBnzDA3izdjxW+kQ5xwspAbubitMxcBQUpWbG938ibVlCO6KPf0QKtZ6GFyEYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIsgHz3pwL0k2pbTyA4Z4lxyQlIkstXp9eJb0CnJ9i8=;
 b=Jbm0V+I7GDi17QMPz0ZzxnvuHUVDsFXy+3BOi3lE7vVgU8/SapIR4eudLTju9iVW0icDnqiEk/w0vbjZvaExsVU4hOKl78JUs6VOzNhvwt1kH8dGe2FC+AOMZ7eYD1EX39pfsaX4FC5vtO2U1/8f5+O93X7J+G2zo/uPZy1Exqw1Ng6Cx25BBX8L5TVfKr5Zdmv5hxeCp9+Es3hVQX27H4CJWTFjL6pnVdsHMED03+OnNA6TpVkOUuMzTVS+RHh64evOLXuWK8b2lkCxqsiRzif2kJCdItkcgL07CVdH4K+elr7Wh7qWC74a1sWu0pjUUGWwaJZcK/5APEP3bYenLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIsgHz3pwL0k2pbTyA4Z4lxyQlIkstXp9eJb0CnJ9i8=;
 b=5q6fSN72vhhqCMQWg0frjGldSJ8t/+T6Zj8uYJlMyPS+NdRFGxwTPO6ws+08pHKB70CrPVR0vTZAhlVezaK1gsZVHuv6NTMCZOZpk9669DJZLPsMaOQvNKFABtio+P3lMswPjNDgCUzVQ4TZGtNNaG/0amM47F/PW4nMGjAkCJ8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4574.namprd12.prod.outlook.com (2603:10b6:806:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 22 Jul
 2021 16:59:20 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%5]) with mapi id 15.20.4352.026; Thu, 22 Jul 2021
 16:59:20 +0000
Subject: Re: [PATCH v4 10/13] lib: test_hmm add module param for zone device
 type
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
 <20210717192135.9030-11-alex.sierra@amd.com>
 <20210722122348.GG1117491@nvidia.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <4ee9e946-d380-ba84-d6ac-5ad337afc835@amd.com>
Date: Thu, 22 Jul 2021 11:59:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210722122348.GG1117491@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BL0PR01CA0008.prod.exchangelabs.com (2603:10b6:208:71::21)
 To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.4.141] (165.204.84.11) by
 BL0PR01CA0008.prod.exchangelabs.com (2603:10b6:208:71::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Thu, 22 Jul 2021 16:59:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e76c6d4-a0db-40aa-0a32-08d94d320c88
X-MS-TrafficTypeDiagnostic: SA0PR12MB4574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4574B232C4787B0B0591B9FBFDE49@SA0PR12MB4574.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LaGN2dasEcwCVvRlHw+LG0eYVWxzEc3/mBb5cC0zgDfhm0bFHEKlPADNP8F2GVcEggxsCi29ANu+miV3rNWlPiwdcmYFHPloChm3Bqh0DPh7CiTED/Ufkx6JWNq4P35coragW/46MI0U1P0ALxkdaRlyBLWdek0GZgQXTvK4coumuPFLba7OpkndLxqwfuhM76W5pqP3HZVxoNuIDVIemOT4GK+XPz0cjR5rTIxOMnKgG7QVqc9Ar+3oD2tbjh17eOmYp/8imeJ/uCCtC3zPabaDfIBdI8dVop51VE8yy6EosYtT/85lZt8zyRDoJc5ghF/t3xxBuPwEiZz+Eo0jnse+DA4xcUxudzaKAW+A4DD3zbBWfbYH5i4/iccpXsnJrGp6oGO5ol8pEzLt+br23pR1X4o+ZF4M+eMUYg/zyMOJvk/Ev25iviXrwXN1aVdXgJwpV32UEdlT8nSesWrVClIt8oFo6FaES90jid+/B29V/X4a9oBXskeyh52Ktchp8SbCourQnGhrhAWappAWLE27Rjw4ULz0wt1nlGzI1Zn9VObj49rniAH11an014LuZ6M87rPiO6id0JX82SJm5GSbBZbLpN9FV6lNciRbxqib7apQe0u+gDhXbWQ08d7HU37VQwPVcd4SI3Q14brTU/G/qmCW1Ij9GPMDGebcY4zY8tHSKcuB5RK4d7DlaJCRBgoJCixouvre2ndV1e7oLbd0MGh49s9nvb8cuiA5TPQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39850400004)(136003)(346002)(376002)(86362001)(53546011)(31686004)(66946007)(2906002)(6486002)(2616005)(6916009)(4326008)(478600001)(52116002)(38100700002)(8676002)(36756003)(5660300002)(186003)(66476007)(16576012)(66556008)(956004)(316002)(83380400001)(31696002)(7416002)(4744005)(38350700002)(26005)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THhVQWJZNVVZQTZoY3lzYlZJRmd6Y0F2RG0xeTBtR3VSZ0M5VUxscmdIdks0?=
 =?utf-8?B?L0x5SlFzYUxmMWV6bzN1ZFZCQWdBMms4TGQvT2EwSzU3dVhoU2tId2QvcmFz?=
 =?utf-8?B?Qkhtc1FlU0J2RkJ5OHFZaWd3NlhpaSt4Wk53VUt1VTQxRHNCLzY5MjcrT3JY?=
 =?utf-8?B?QmM4Y0dTRGpkQy81djlYdy9qUWtuRjl3SUZva3pPeXNNd2JyQVdaVzYxbWhG?=
 =?utf-8?B?M09mYm1jeG4yRUc4LzFWckhxMG9qcWlZdlhtREhjVzdVLzVsY24wZEdNQkJG?=
 =?utf-8?B?c3MzNVdFZ0wra1JJekV6aTFhSFlCc0R6a3I2RHlUVnRwK2RDaTBBNWlaTE5C?=
 =?utf-8?B?NCttZGZEem5zMk1LSXFJSFl4MFFCbStCSEtGOGVtcGgwSWphRlNJWUhUcG1y?=
 =?utf-8?B?cmRkMmVXRVlBSWlFU3QwQzcyZE12bGV3emZxS2hNam1IMmxnb21SQXlFZTRv?=
 =?utf-8?B?d3kvTU5WdnUrbVdWSDJQd1VIVVFIN2NpRExKMFVlME12aFN4ZTF0WVBDS21z?=
 =?utf-8?B?UWtLNVZQeXFQMmErQ1hlWnMwekx4ckZkbzlZazAzeHpmRVc5YnI0UDVsWDV3?=
 =?utf-8?B?VXhtejVmMGtWdXNJbUN6K3dpNit6ZnVJQWNFdjNrTzRyUFg1eDIxYkprWlZ0?=
 =?utf-8?B?cDRwOWpRdjh3QndZWXRPWEZ1dzI2Wno2c0hKZkhGd2J4OGZ4TXNVVTFxWjFP?=
 =?utf-8?B?bXdNVkRPRFlwWndtNzIrT3RzdnhoZktiZkI3TjZ3NEFJUkdMeU5HTHlTdW1o?=
 =?utf-8?B?TTMxVlNSb1JVS2QvVmRUdm9hRFB2V0FlZGpmVk01ZHExZzVPUjVPR25oaDRq?=
 =?utf-8?B?MUZONFpPM1ZKV3h6RkVFZUV4MmV3aGIxbmJzWXdlVG1iamZpWWdIK3UwdFYy?=
 =?utf-8?B?L3RkbWgwVE5WU2ovZDlPOVdJRll4SjNRRGVJcC83bGpBWUhQWFVSSmtHV1pQ?=
 =?utf-8?B?aExmeFIvdWVNa2k0UGdzUzVoZHo5dDgxTlhXTGRtV2dNcXMwbXM0SzczUzNw?=
 =?utf-8?B?MmdwN29Jc2pwNHdCK3FJWFRrVkNydFlkckNCY2NQZE1NR3BmWHFxSktlYUk1?=
 =?utf-8?B?bmxWQTFMbCtzVWR5WWV3Q1JyYXhEbTF1V0FCRnZUK2MrNDVOT3NUSEhKdDBQ?=
 =?utf-8?B?UTZqWDF4ZDRQTEd0bVZQSE1jOGRMdyt5bFRpMUQ3NnFaKy9wOG51L21mQ3NS?=
 =?utf-8?B?L3ZLaTl3dTdwUllIS0thK1hHQ1cvL3EyTEhJdWx4bFdZNWowOUFKRkdrQmI3?=
 =?utf-8?B?QlFVclJTYk5DUWI2TjlJbFl2VTB0cld0d1haVlZjZXZITDhuaG1hbkRndTFY?=
 =?utf-8?B?aDJja1lxUkZpQ0xZNC9PSXZOdVdFQ2U5L2JySVViU2ZxaHJ1QTVzVCtmUU44?=
 =?utf-8?B?ZXFyY1dUcEJRUTY1TDI0aHl4bTVQU1Z4RTZncWpHT3c3c2hkT0dUT3VDZmdm?=
 =?utf-8?B?NFZGb1pHZys0Tzc3N1VXVDFXa01wUjJ3QVVMMnRUcEdnNmpIMTIvS0RRd2Vl?=
 =?utf-8?B?V0swdk04c0RyTUwxMHJCdzJWYzR2ejkvWFcwMnBMNVJvOEVqMjNVSGN2eFRC?=
 =?utf-8?B?dG80dldKUjZqVFcrMFlEUnBBV2hwMm9WemphSHRVYzZnT2dBS0NhdVBERzEx?=
 =?utf-8?B?bTN2M1JHaXFkTW1lbXVFZ0ZMYzkxSzRja2ErV3hFc2xybEhHUDhoQ2gxV0la?=
 =?utf-8?B?UFNjaGVXV25HNnFrMEoyUlU2OHAzQmZ4ckpaR09lQ1lESXJPTGZvVHo1NnpG?=
 =?utf-8?Q?BHekqy8BJGvab4v/xTRtA+4gxPQaMQkm/BVBa93?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e76c6d4-a0db-40aa-0a32-08d94d320c88
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 16:59:20.5522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlxE8oCI7305uDru1YKiN0G6TmosgDGb2bxgbvLrz7XYWKMYI2FfT+9YgYG8lYk3Orpkw8Ykuf2B17MhHIZMMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4574
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
Cc: rcampbell@nvidia.com, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/22/2021 7:23 AM, Jason Gunthorpe wrote:
> On Sat, Jul 17, 2021 at 02:21:32PM -0500, Alex Sierra wrote:
>> In order to configure device generic in test_hmm, two
>> module parameters should be passed, which correspon to the
>> SP start address of each device (2) spm_addr_dev0 &
>> spm_addr_dev1. If no parameters are passed, private device
>> type is configured.
> I don't think tests should need configuration like this, is it really
> necessary? How can people with normal HW run this test?
Hi Jason,
The idea was to add an easy way to validate the codepaths touched by this
patch series, which make modifications to the migration helpers for device
generic type pages. We're using CONFIG_EFI_FAKE_MEMMAP to create fake SPM
devices inside system memory. No special HW needed. And passing the kernel
parameter efi_fake_mem. Ex. efi_fake_mem=1G@0x100000000:0x40000. I should
probably need to include a small example of how to set this in the 
test_hmm.sh
usage().

Alex S.

> Jason
