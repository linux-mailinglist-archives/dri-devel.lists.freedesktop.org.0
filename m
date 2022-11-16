Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7162BD4D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 13:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486CA10E0E3;
	Wed, 16 Nov 2022 12:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B13E10E0E3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 12:14:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcjLr5EaShooH5b+iqAvvmv/Mksp7WSDCLtMsvvQVIULzQxEQd6SNLeRHAh2kFhB6Z62dkjHdAkvErOcwkNuOQ5zOiezX8/3SFe0ZHkjrq6oHwwsUazo+FGbcTMKrtapa3RRPfEeDRDZQduPpwPRX9zVVAVMEUTy5Yq9RbRn/9OKB+B/KdthP9O4cVVpWk6q1h8yqu3ff/i0qdpaSsm6gVQgLfg6799geaB/lJhp/V5mXGLDeWDG+Ub/hnHRpirQ66yVqFtf6BxLRTpsO/g295pFJ0FHsY679+xVeuUkcRMDHMaDkJQjw/bB2V64MM9Is9rkfS6udYd3dFLpxoDhFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z17ZUqkER7cFjc0ENXV6mKhP/7p/o134oAFOtdoNv70=;
 b=TjAMtlGqdFJaTZRzh/dLO3FA4kwqG8nvmZYfnpPME+haJlMYwOvPGrWsxBLasgMWiGVUZuLPT7Fvs6KSEoEc9nQmAiI7NW0/JKEPNZT+hjAQHbEPOmNdiVqTA4G4822KA8n15ghbZpvA+ou4tDjRJ1JBXVzKOwvdEpanm2qtPhmNLH+P3fyKWfUPyksE9gZoOu+QwF+/4/cR9J0K5C8Zcsia7FSwZmYd1PHf8B+MmMTyDcIt4sru2hnPF2LHoTRMBney7Cv1vRcmxxj9v7qPSB4LEtbHuSyXHMtpqGd2kpNzcPfDSJdtcvonbXWJzOfysXcQ8GFH4a7sX7mSQLoOSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z17ZUqkER7cFjc0ENXV6mKhP/7p/o134oAFOtdoNv70=;
 b=qhYfJIZsGEKpUeVjxdg5o4FXLLmaGRWtBu+wNoAY+9PMNWoUfDJHOR89mLWL84FoAn2+NtwRc8x+PVLQl3IIPu8a0W4xxOUCr9QvKwPCxD1v9T+etdq78poywF3C8ajj6S9XLQiCTjDOJLedf9xroyzWfokKfzcMySuu2bg3d5hZ0vGq+ySVCsk/sPVxMkW5AZqR/AOnd0TUjd9P8t8PKa94kxCAx19kVgJslxXsu15HvM/Vad/CVD61icntzEbiwWVvAwQhekysZGbMOweqKr6+CKcNtU/2FrQ2I3aZRa/6oV+2h6XzkHssw4FLV/3gBBx1oaXDJ9MUFIA7goS81w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3179.namprd12.prod.outlook.com (2603:10b6:5:183::18)
 by MN0PR12MB6365.namprd12.prod.outlook.com (2603:10b6:208:3c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 12:14:48 +0000
Received: from DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::f067:78f7:5a00:e67d]) by DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::f067:78f7:5a00:e67d%4]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 12:14:48 +0000
References: <20221111005135.1344004-1-apopple@nvidia.com>
 <1284e397-6d33-af04-ced6-7cc5f8628847@nvidia.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] mm/migrate_device: Return number of migrating pages in
 args->cpages
Date: Wed, 16 Nov 2022 22:59:51 +1100
In-reply-to: <1284e397-6d33-af04-ced6-7cc5f8628847@nvidia.com>
Message-ID: <87fsejumdr.fsf@nvidia.com>
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0067.ausprd01.prod.outlook.com
 (2603:10c6:10:1f4::14) To DM6PR12MB3179.namprd12.prod.outlook.com
 (2603:10b6:5:183::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3179:EE_|MN0PR12MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf00929-c6ab-4c54-d212-08dac7cc27a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JfwWI3UfLvnZnmRDjlrCmQla3FK4TYvM0m0F01iY62a51gTUss23l8hO7CZ0npBK8r1Nb6uVGOHQm3T5kPDlDetwLlwohEaQlaov5iMgpJgW4RibCxpCEeqFqAaqPtL2HGgDxNHL4su2sAEFr462EAPgyJbwiRcub3irz/2I+nY4D5k2CD76zcYbpJSUD4nFrYc3igztcOItvnd5wIl/LFoUdSKyBlh+fDXKZf2je8QlKzZPH3jubzYYH4p+YdC5PWqS1h+fO1JhWlPj5abDS38bL8YWkv4LQctd0s75PJUfCm6aPurdDalVHwikTV7BNHSM89B8LJ72vqkysu20cQA8mCs99xIWs/84CN31gpSTDjiT515KHZrbl3aQ8X9lbTDLqcsH2idiymZsHjKBCwATmtbdl6tmtlrcfSI0UPlhyZuxaRL4u8Rs+JnHrRGoZu4YBD+0Rd0gL/nv/I5DFK3qpvukIsLrfF5gvV3XoFSsrg3LqdlRPY/9jxUut29iD4jr6g6dFX5BKYMEtCJruGaj6lfadLV75X2B5iRZVuyAG23dqco63jv9CgCdwYXmOdTsapgQMEdAhhZ/M/fE+6DyJkVcNQ2zZFD3Sz+y6Z29oXN7SaCV9hNwrmDjZriJxkGluJCFsjRnaVeHJNG8F5o8AcPCJJ7/bcTdbgsaQAr2cEUUbjfOgtx/L+JfzpwQBLQD6MED63HPo08iwjAWsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3179.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(36756003)(41300700001)(4326008)(54906003)(8676002)(66946007)(53546011)(66476007)(66556008)(6486002)(186003)(86362001)(2616005)(478600001)(6636002)(316002)(6666004)(26005)(6512007)(6506007)(37006003)(83380400001)(2906002)(6862004)(8936002)(5660300002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3yLA2SjK+1KvOjT9yyI/mJJrtUZqZy3RMU19g9P0jb7ykmUIKxPODGp/gXwE?=
 =?us-ascii?Q?DhNbznnHln4ESghcpAs3hvxTDIhMBI1X36EdemVRDBT0kqRb1vNHPoB2pSXF?=
 =?us-ascii?Q?JFehmwisggYhGe0ECc37bMeTbLEekBS3o9ygKOQo3h2t7Kzb5PKssYlPOJcB?=
 =?us-ascii?Q?y4HyZyUERIyt5r7U1jntR15BVYsICyuiAREqmosE8Ra3fLdIPfqOdSBZGXTC?=
 =?us-ascii?Q?gWD1I8j+y94kzm+v6FF+2SDMVKOQOXWKwPhDW8L0Rf/u0gQcc/UTP1pzUU+l?=
 =?us-ascii?Q?kbpJIshGXbuP9sfCtsSFQwZLDJWWGWFL0Xjs2s/eTzicigZn9BI12tfYZxTi?=
 =?us-ascii?Q?LbpKMYE653D2ICoJq+OuzLGo68q8Bc487oYuxm2STLlcZk2OeWe2nlB6sast?=
 =?us-ascii?Q?orDLv9aGfDiXyJsDlmMvUybxcV8ObVUkKvV+Ze8fatMvDNmJAAZAIRT+jwTD?=
 =?us-ascii?Q?pscbwkPgFUsOtz61M5vOd63IOekp2zKyySN6tB2o4b6/Na1Q3E4CkV4vIlmG?=
 =?us-ascii?Q?x2UItuQ+49vW8tAVj9yeSK+14DmabPhskLXXc4bDQovOMZCKKck/w1+YY6EN?=
 =?us-ascii?Q?dpYbLFFO/BR4RDxSDNNwZr3cb4+IgW4KU2mGNlBwMBTigR+XzmYBzIKO1ZYO?=
 =?us-ascii?Q?i8RVGXTtoMun7++lcSFPYy1eP3ThAOSiRvzn1b7LVRNWCapj+GeXsiGXTHDo?=
 =?us-ascii?Q?uV9B0Zx2Ho3BnGVZ0iiuLRsn8VickhJvq+mkfSxQH/rQqXe8pdnrCxj03SN/?=
 =?us-ascii?Q?eNQ+0YGWSVtE4WdLks4hgqfSbS0aKiEn17LwVl/6SQ1xGnbLHODNJnxy7MG3?=
 =?us-ascii?Q?xCxgGXjF6ZhJ96NhSJQHsT9lwXoQlPs+uE9bXrEfsYjy807bN82Yw1ncrzwT?=
 =?us-ascii?Q?ysybFm19Jb4FuDkQt3eVVge2aNpbewEDQUYKdlFdMXb9NjSTUQbb4AKY0EDQ?=
 =?us-ascii?Q?TVPXN86Qfc6hR2OurZp6Sq75EgBXyNN1e4jbrLXlS+6Lo/Ma6zlzFSfCV3O9?=
 =?us-ascii?Q?XrMW28zLPe8+ZZaPZu2TEichLfcFo98JIpcurs5m7FZKcned3L5i5h/KG5rz?=
 =?us-ascii?Q?8LNXgKIgas72HqmP70W46sZx+dlBzLwVCiG9BHmVVpcjJfRzB91RbaAmvKDo?=
 =?us-ascii?Q?y3ungs8UuIBNwxNhYrD6RqCk04/pKOrB028XOiZDhT81U1GEkQU6JPC2N6/b?=
 =?us-ascii?Q?GMR4KqwhBcGuTJDlNb4AXlkwoy+hAyKbiAMhQg6K4JL7m7Pt8aVJZJNbuGXy?=
 =?us-ascii?Q?UUKvnAdIcQrd/5qtrShy+62E3ayXFJyLIcpp/PHHaPTJ2MiRPMuCjeWgnIEG?=
 =?us-ascii?Q?rnQ7/+O2kl1svlbl/F0HgYNJkLhARu/bGq0Qz73tTjjJ9EyCVcPZ6xHtCDi9?=
 =?us-ascii?Q?hTpyCf8pu3fXVl4evXQ935yX8Qw5lNN+XQ94FOXReNkIDig0B6vh8PjNpVfm?=
 =?us-ascii?Q?tsPY2GFYPN5vmAyd6iZNdPu/pkHrKTVIOks7yzcT/xFu+0GcIzpyN6iv047t?=
 =?us-ascii?Q?qFkuzKqyBQPm8lTIZHjlRfRqCGQTsnvxOy5MFzS7hZ9nX5Z5a8hjrmpNYqwC?=
 =?us-ascii?Q?+KcTdf/zuN5/BqglF5HnvDn/RIp9I+FYLTANdsOg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf00929-c6ab-4c54-d212-08dac7cc27a3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 12:14:48.0680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWNYZiq1dWCCdLBev90iFOxq6ImY549WA3RxwzETxc9PuYKYjLH/k+uclACV7UTiv6yGRnKS8in2uydxzoD7ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6365
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
Cc: Alex Sierra <alex.sierra@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Andrew,

I realize it's getting late in the cycle but any chance you could take
this one as well for v6.1-rc6? It fixes a minor bug introduced in
v6.1-rc1 which could cause some drivers to think they can't migrate
pages when they can. Thanks.

Ralph Campbell <rcampbell@nvidia.com> writes:

> On 11/10/22 16:51, Alistair Popple wrote:
>> migrate_vma->cpages originally contained a count of the number of
>> pages migrating including non-present pages which can be poluated
>
> "populated"
>
>> directly on the target.
>>
>> Commit 241f68859656 ("mm/migrate_device.c: refactor migrate_vma and
>> migrate_deivce_coherent_page()") inadvertantly changed this to contain
>> just the number of pages that were unmapped. Usage of
>> migrate_vma->cpages isn't documented, but most drivers use it to see
>> if all the requested addresses can be migrated so restore the original
>> behaviour.
>>
>> Fixes: 241f68859656 ("mm/migrate_device.c: refactor migrate_vma and migrate_deivce_coherent_page()")
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> Reported-by: Ralph Campbell <rcampbell@nvidia.com>
>
> You can add
> Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
>
> Thanks!

