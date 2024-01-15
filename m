Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E7282DDA0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 17:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8C710E2BA;
	Mon, 15 Jan 2024 16:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EA110E2BA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 16:30:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMClHZXrGSLQKjsHsvzFjtzIMOZcH80ClF1dJ810NuaW1xaUuKt8hdjcoQSfAXz5Hmbq6b/fxMnNgh60FsFE7PS2q2ODOoxA8w3nfUrSEBJGPQGf0cuJsQ7BWpX2VaSw887VFT+4p5QBeFOPGQNTDm26VHafcmAWqHgPPpKiUWbCLpzoz5Mv1+EBljuB2vxhF0kBtceCdHorFukdLJGxHMx1McHouFwWRigAcFGCPX1cYOhTQDKwFNy3b1d1x6B8jGs681eyuWSV3tmJKlcO3xEyGHWdCT/bVUinR4AGReEruqujk6Suhm8ULZF4Ec5EI9JxrGnHAdC0OcIVDqZlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtUxJGnUrbhTgqdW7Bd5yQ3shGHdFp388jP+R+TJBn4=;
 b=Rhd3l6gbhj77zA0IDXddIFiIX+wdw4IWSE8Qfcv4SrA7WpU7tUU9yQQgB4JFS9oz894F8yBhPmQUw1myB/1RijkfM1GBtSzDapmhOZTv7Kv/hIfupT2+TGGy98O+UBCuWfVUt/e0GEt5M4KzQx6SH5Jq7gsHUwH+b3bWRhJNXCX40wOl5doRxQ7w1mrMDIQuswQBpf8voOpMs6eYZkeqvTYe+/2wqSc8L/MWpCvrVTQgcSVStbwG3SgUW7SQbDc/9rKgwEKeTtIrDFFnfqmlcGvailojnlU7TcABlB2f9iRZ1z6qZPOAC+tYD8U5KLufBT0FXChMZiwY6B+JGXnc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtUxJGnUrbhTgqdW7Bd5yQ3shGHdFp388jP+R+TJBn4=;
 b=BAdpsCh5GjbejgyCHRb79rOyww5hHoMNsJdGjQeFp1S0I7Bc/FqBB1ySKZ1W5cWf0/VZLlxg1+y0JDwsK6vX3HVh4JlJX17KoCWvxc/NI/BdhzkrbVKMvgyPNyOYNJBZ3j9ED06vYR58JSTVreICOvSN5Ru/Uevvc4lvFACEl7iGcy+IobijzXPBkUenRXpP/fEUnMBf9JhAYUOPqaK8RAb2+asW3n/YaT+qVouL9aa43rql3yzzw+yI0xRvc9eOcKr+V5IaJCRHBg/ogLHs8SGC9ycokomy+WZp2JyaP0/0OEQiZJte32GAd6cP5lALoI6xZddKcM4GmHTLmi67LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 16:30:51 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 16:30:51 +0000
Date: Mon, 15 Jan 2024 12:30:50 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 0/4] KVM: Honor guest memory types for virtio GPU devices
Message-ID: <20240115163050.GI734935@nvidia.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
 <20240105195551.GE50406@nvidia.com>
 <ZZuQEQAVX28v7p9Z@yzhao56-desk.sh.intel.com>
 <20240108140250.GJ50406@nvidia.com>
 <ZZyG9n0qZEr6dLlZ@yzhao56-desk.sh.intel.com>
 <20240109002220.GA439767@nvidia.com>
 <ZZyrS4RiHvktDZXb@yzhao56-desk.sh.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZyrS4RiHvktDZXb@yzhao56-desk.sh.intel.com>
X-ClientProxiedBy: BL6PEPF00013E12.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5c896e-532e-48ff-446d-08dc15e75641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hRAdsLZuMsxMPY7uVqdV0sc5fJbYOvRTWj7P7Sye7OPd//JaK44iyAzdBxM7HwxxCNK8y1OUO8k8TqTeqgS9JFNDVHdcrXnYg8zrsR02mlg2lfKcM/yrSa7PkKHCWisy5tz1t711iVEZRcOkeOaiyEJYgU3smxpWVsKMa70j0Lw7A7IzL8dxAjRhj+fe7sE1g4Z7Il7yRDV//dX8CLZ41Y5y1I8LsjRBGAtb7WZ6LTC5vleJLoLqUmbbBArjyeHSTTmu2Ez0JtMIpiMZIosMjeRORWaRggScy+ajVEN+j+9vDFWJGUnWcn7HJWpQ+8nJtyf/DEaLJZa9wBNqBDg/xXBF/KhRYPVzfDHb8du/Nbo5Rho1SQDwYNSyJBOqAofP816jwdVC+1LzVomsAxw2e2x3DIsZssh56dZ3g6Lg84Dchcq7OcCrKZYzZBg7FPUeWts450aFKmArpvX/YaHagXu0ch4yfWZnJRqGq/iL1HuwDOcsJHNl86MeOiMFJCaSGUnsIU2GS+NuxWjZT+GvgwC3iLoVMHsaVTDwKlkXOF8QGqS3sTT9HxW6ZqVpwntHbvUWeofR/bKbn2l0qFtp0cZc/3AG2+su+mG14lmMej64pCqufmhfpzRCc8Apeoem
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(7416002)(2906002)(8676002)(4326008)(8936002)(5660300002)(316002)(6506007)(6512007)(66556008)(66476007)(6486002)(6916009)(66946007)(478600001)(41300700001)(38100700002)(86362001)(26005)(83380400001)(33656002)(36756003)(2616005)(1076003)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H3q3n5AEbJ46yj8W9v4c3wGHygdVGb0qNtsm49bLALtlY8jJmEIV57iRnMT4?=
 =?us-ascii?Q?JjH5VvrIRoOdDBypeyTNtVjCuVHNa1laP/THKf/a/ptuj5Gsrcq9dUWNypB3?=
 =?us-ascii?Q?lbsIXrWAV6COficJiSxiDFckA9HKwA6q2mTXx2AZS9IKzbdcaOF7dpASn8Jb?=
 =?us-ascii?Q?Vqnrau5aKg8+FVwVkIo9OdxgE1U0/ndpraEOfZ6qcWKd0d8RBQp2cMBTkiD7?=
 =?us-ascii?Q?9mEy4amQhKmVnhz5/gl99ZjXbyQdmJXlvyjl3VXf11hEwYThqDHfuWQ0A+b3?=
 =?us-ascii?Q?PmEJtoR5AFm4gO2jw9MA3NgklS3PGwV4z40vcnTY+sZpYJ9LkSwsdLSgcGtV?=
 =?us-ascii?Q?9sMUzvVzG0YIFZDGEav6Miv2geEWUgNGcy3N+gdIaosvJUuukYhuOjLLHiAR?=
 =?us-ascii?Q?zWFmuhILvhTHD/PBdnsSPRAXbIM9xIhMASm3z+uBFuzxb5Yvz1moQq9v5j2Y?=
 =?us-ascii?Q?2m35LAd6AvgnASaswO6xHJg2DXUYlbOpbJAaB8LjcDK7t9rb8ARtsCuGisKV?=
 =?us-ascii?Q?rCzxhIn9jdzlRreYzTfE3omihfy1aVVP75l3fB4IGMxe0sDh3ySUBmrM1Jf/?=
 =?us-ascii?Q?rhLgQrttFk2FKbLcgd3ieZeI1SN/TRk5EiLVOEhekk9kqFO46FN4e3PPaFHE?=
 =?us-ascii?Q?jV+kV81pjm6nylHN6syXK/kgiLXe5k8eKV8XQUbOXBLC0YhPQkjA01oVo3nT?=
 =?us-ascii?Q?Uu26oBXpOlxuUftClOusyw1iDHtKlUbE7UFGNAoObgtT5LiLggKRwtMwEWXI?=
 =?us-ascii?Q?ycil3YjodWkBNTfEzNcmeCL2Ga7Ghx4lNrCyDlJn3toxNqHOGgrocFTO+nmU?=
 =?us-ascii?Q?ztk67WySrhiEC10Nh0tNz7EEgCTpbupKVV8cu5LhkJNRSZl5OI2s1gmkOmhe?=
 =?us-ascii?Q?lPrHen2IbWCd7zyLtyVEvtXSPwBqJMzHjhE5NwGgu/YSQ91+wybWJcRvHdko?=
 =?us-ascii?Q?XZ5oQd5xzXSOGlAqeV4Cf/6hqQXwUSu/tVWTVGkYvsziBSEyW+ygRU3v/ENs?=
 =?us-ascii?Q?SV1I/V9TI4QXCO+BXCK6z4pRxk6NEQQt3yKD3pqwftMFl765jvM2c2V3i9a2?=
 =?us-ascii?Q?NFqoadlbG27fTiZB9sClNTVprv4uaYpWtQHkZeQlGRAV49ns1SMECagI82sE?=
 =?us-ascii?Q?KYZb5Fa4R2xbQjPjRWuONXaJPWwNRq6nHbhfN4idC5P6Q/tPpv9A13QD67kz?=
 =?us-ascii?Q?96xgtWrd7ubwpl3dytZDoMW17Fh/XmeOjXqUYnRvrvXUvH2/IzXEQZ9FeQNX?=
 =?us-ascii?Q?5wzcErzknGi24il6BuU5s/iuefB2qUzer/xotmsBS9P7bz6713Lru4qVt2vb?=
 =?us-ascii?Q?xXNWHDveYaAQkL4oMraTv73cDVsXOvQDqLJvGSjO6jw7/SELfNXhNpH002Uk?=
 =?us-ascii?Q?ghWg5tODPF6ge5ZyguhlTWjHqMBOC7P7Ql+52OnR4EGSfVs4yzgtuZClE5T1?=
 =?us-ascii?Q?8giKRBPN3+e2swhIGGCJwor3HW0Pok+ZlUWgokfSidmWZEaqpHFdt2jqwjCn?=
 =?us-ascii?Q?CeBGjZaUXa1VfggF7PqsLmTEeGWB3aIE7FcdsLpQKMwNS6FTTfI9ZH3Yl1pM?=
 =?us-ascii?Q?ls1TIRmeyPupuu17nGNowy1Lo7LeXlmJck3AMNVK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5c896e-532e-48ff-446d-08dc15e75641
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 16:30:51.2101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AIHJwb71f8rhhBjwWloZUpy8nJwJnUKouE+dKUDacEXUY8nQEFSHBPDbiDj5qa6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kraxel@redhat.com, maz@kernel.org,
 joro@8bytes.org, zzyiwei@google.com, yuzenghui@huawei.com, olvaffe@gmail.com,
 kevin.tian@intel.com, suzuki.poulose@arm.com, alex.williamson@redhat.com,
 yongwei.ma@intel.com, zhiyuan.lv@intel.com, gurchetansingh@chromium.org,
 jmattson@google.com, zhenyu.z.wang@intel.com, seanjc@google.com,
 ankita@nvidia.com, oliver.upton@linux.dev, james.morse@arm.com,
 pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 10:11:23AM +0800, Yan Zhao wrote:

> > Well, for instance, when you install pages into the KVM the hypervisor
> > will have taken kernel memory, then zero'd it with cachable writes,
> > however the VM can read it incoherently with DMA and access the
> > pre-zero'd data since the zero'd writes potentially hasn't left the
> > cache. That is an information leakage exploit.
>
> This makes sense.
> How about KVM doing cache flush before installing/revoking the
> page if guest memory type is honored?

I think if you are going to allow the guest to bypass the cache in any
way then KVM should fully flush the cache before allowing the guest to
access memory and it should fully flush the cache after removing
memory from the guest.

Noting that fully removing the memory now includes VFIO too, which is
going to be very hard to co-ordinate between KVM and VFIO.

ARM has the hooks for most of this in the common code already, so it
should not be outrageous to do, but slow I suspect.

Jason
