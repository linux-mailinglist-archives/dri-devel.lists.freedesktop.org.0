Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D3C4B8F20
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D5910E86C;
	Wed, 16 Feb 2022 17:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AC889EEB;
 Wed, 16 Feb 2022 17:28:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBO2WQCWbkJtVKlRQjdkf2BTFdZA4DTzvYuqtswX8rWd6z5sWs1oxtxEJ/gxVAK6qUedzu0PX11OJtr/sLb+Y6hp0eX89MWaT33VAZ0POl3029APH0TyEnT7S0zio5G6AlvandigvpDcweFrtZykSlOPQ4N1nfpwnjqoBGnuDJc6HoCs8iXZ3cN4NqjOht4lNppzi4VKV6DeNS6LjtDuAGgyhhFlDo4mnHGtOGS1Oskzf062bZ5NYZWPw1FMkRmvWMpw2LBgpWD5JmUZY688n5e4rt/ajL0//rpWPOuwWM7LYFC/V/CgmaOGw1+35oxmvYRASE0ZFpB8vLqg7TgUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkINBRzvNA5YZJEcNdw+3rZpbtAjo5x9RkoLuBjWvkU=;
 b=f8dZnp4tNN1KqZBF5h4QIG6OSrwtWTZ4TFgBwlRPxxu+H2+57ekxOC0dObmLRiINT6KrLPhut0PXiM9JKyJs/U67UT4hKwnvdRnCMxhHVF22c99REC+1bfIQq5rcJtconG8aaUnevmm8ujAJuLh0KzuBvYGeINphNQ5hOWwNL0/F1gSJDyDs57SXLgXnNHoqtXdvv1phx5i5ZooHWFzEgfoHfeUVLKb15eP3WJVCJc9V/zkCwQ9dl2gt9vqUGi9nwrghT2CarcPkdjIFbCQwq6CjFSt5ndbEcfT70a2fgjblDKMn0bCrpfcg/ucY/vpJHHNA7V7KbSQoFjt79JbNxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkINBRzvNA5YZJEcNdw+3rZpbtAjo5x9RkoLuBjWvkU=;
 b=XIHd0W6qrZ1XzV4dd6Glsann61l9SOkfEIleCsWk0sLygBX3WWMuV9NY2844VqpRTDGlRdZG0LwUbg1qGVqD75jzY9K4ZOz9pPiD39AlbMzh0LJIvOkZ2apbfm5CsmqFEevPqrHMsAZlkkOrSWLZsG7axdxhW/kLDtMOa7i8aunkk9WX405YbdtL95lwRl9iPXl4cIN8FQPZbKW7V+7VjXsUueWpqIh5Jhl6X6T1KyPHY8ba9UsXVIk1NQ0oE8teHgcP+TXkgHbPe54fG1OdlyKf8E3EMzkxAUav0P5QJUQneYIkvUdJ5quXU/nncRf1MCCQJv/8afJLPDjpjyi3bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1670.namprd12.prod.outlook.com (2603:10b6:910:4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Wed, 16 Feb
 2022 17:28:56 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 17:28:56 +0000
Date: Wed, 16 Feb 2022 13:28:53 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Message-ID: <20220216172853.GI4160@nvidia.com>
References: <a24d82d9-daf9-fa1a-8b9d-5db7fe10655e@amd.com>
 <078dd84e-ebbc-5c89-0407-f5ecc2ca3ebf@redhat.com>
 <20220215144524.GR4160@nvidia.com> <20220215183209.GA24409@lst.de>
 <20220215194107.GZ4160@nvidia.com>
 <ac3d5157-9251-f9fb-a973-f268ce58b4e0@amd.com>
 <20220215214749.GA4160@nvidia.com>
 <002ad572-4d32-7133-06f3-aa680c297be2@amd.com>
 <20220216020100.GC4160@nvidia.com>
 <4362b4ec-ceb5-a712-bd03-24b749d1d004@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4362b4ec-ceb5-a712-bd03-24b749d1d004@amd.com>
X-ClientProxiedBy: BL0PR0102CA0056.prod.exchangelabs.com
 (2603:10b6:208:25::33) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1019c52-9f90-4c00-c4f9-08d9f171cf09
X-MS-TrafficTypeDiagnostic: CY4PR12MB1670:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1670A73492BE5946D65735FAC2359@CY4PR12MB1670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TGggzd5aFAorn1Zuq5aAmHzCj7pSO07y9+XLYBBRcU2doi0Ryj0PiFFy9ZDQ6cHYx5Npn2DPgIDzALZMRObPKcLNHXfeSIBJBFqPIgYkQWoFsa26bA72c3nze3khd2gGnfRIDeGn4AFhv38xLNBdJBAdbWX4FKwSGuLLmCcKliiAUYkuBXXPprbHjX0VMHEM8OMoQEr4LDeNJ/HIJFvQsbSaW/r66Aqno9FBB6Z+6rCAOaTPWrfjxk9qyowAPNZY+YtPsLL8Ikh5PfQDeV7hNcazN+WPz3TRm8IBdfxLvFxsOAaLWCmz54jgH8ZsGX89u+tdgqp0eZpVJzRh/1NYb71Ad89CylfA264cNj0dBOsonFgN3qKLaig/WnwWTtBm7m7F1wIsQ2A6xNW50v/tizPRQG/qZxsueOnpHFJ/B+V83PZFG6EO+geK/BS/qJu7lDdUoKuhIJ6AjCL6mNw91OdNPID+nDwgDa1+J64FKrpn+cJcG2o7MdO7sSIRgmCrAhiabHX7/yAujNnrrZQ+S7SC1JqhRp66Eztd5bh9CDa3Xx4pQBxAVympubvfPce6m3skqFgt8WcV/sKOYlItaxpHHWPX+phT/oaOhuI0HfzgshB/q0sjeMbdeX7K9mZtrIkPKaAq4ye2zgQIvCJsuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(2906002)(6666004)(86362001)(7416002)(8936002)(8676002)(6506007)(5660300002)(4744005)(54906003)(508600001)(66556008)(6916009)(6486002)(36756003)(66476007)(26005)(4326008)(66946007)(316002)(2616005)(38100700002)(33656002)(186003)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O382RcBCuWhSp8w1I3jkqh06rRD6GJviAiEunQtwDY+EH0Im6BX/4K4WYRL0?=
 =?us-ascii?Q?WzQCQYnQgLMByiAUhAPrgUv/l13zM9J1KNWMA/T+OkS8mwthYlXEYjFx+h89?=
 =?us-ascii?Q?KqLcoVsXJCTBVa5hC+IUWdsYOMyhd6mgzf4L7qIlFj8HVzg91ZX2tBlSfGcu?=
 =?us-ascii?Q?zOfIB7ks1C5ObgjuzSfTb5joUy5ni6dUZ4OVQ/RmqGwR1LF0vUG0W17YdWdC?=
 =?us-ascii?Q?USmtcF1nPsyqHfRN1o1Afb0PA5ISzINs3YaV8pVL2B2s7cCUCP0j2tAWoIW4?=
 =?us-ascii?Q?BZjRxILIOePG5uorhrj9b1ggb+NAubI2PwjzRjuMMpKIrKMBfwKu41hIExXd?=
 =?us-ascii?Q?bH5xvKpKmcN33NaavmzXChEpjX6xgCYhUGELA3NyTt20FPlJPglFFqPTn2yJ?=
 =?us-ascii?Q?tgOjXWmZfSOSPOEwggo5NB8JgVG75NcnJIfslOiemf/m8i3GyAlUyx4TpyZ5?=
 =?us-ascii?Q?OVrweBrheb7a9hn6bFCxtOSiivlx3bY6NUMmKgPuknh0j20fiHRBdyG2DkZ0?=
 =?us-ascii?Q?v/5Ia5HjghUZyFcGF4EKaN1eNkyYZ1Y3HEMd8QaE66BJIhilv9sGz/u5dRhA?=
 =?us-ascii?Q?GQ3XscdayvZP4gBcFN7ez7ngMfgkhXw2x7sUPbQ3LuJJokG+Kwd7djBdelt8?=
 =?us-ascii?Q?DNbsHUFouEoGEidDWi62xs2/h6E1Se7DGbFgLciGz4zx6lAOh8QYOoGbvtUI?=
 =?us-ascii?Q?gR0jHTUaAzRG+4niN4MaaXbOVaTxwrYDutDOK73CPZKhc4O/JhQUj4ImG8g0?=
 =?us-ascii?Q?xianY7At04Ko/QnXtj5v7dcqCQIpNhWBDW3lXQbUuKxuwcBhblUgyF7RsnbZ?=
 =?us-ascii?Q?j2tNDAj7YpUfeKkcHCu/+mKUCIukR+uzoFC8kc1N6050bBpkAXs/AtRZNpn7?=
 =?us-ascii?Q?65iav2SKIP8Viph750tl85pItWHJUI7iBej3EHzLfqxR5ndkEUogTURzGXyC?=
 =?us-ascii?Q?t5JAP2QjFUtOmB7EJcwZgJ/2GHuWEpZ8DMq8tQE/afjRt8C5Cq84pMk4piJQ?=
 =?us-ascii?Q?COZbq6jQKHOk3SsXnmta/1pCtHJoUAv4mmhHEzE/Y8Edp+CpL6rPvjbkTo1C?=
 =?us-ascii?Q?OA1pQRj4mH7w8vja6z9tyCav5yeb/TPdhafZXSvDtBehjL2if8/frMWE/aEJ?=
 =?us-ascii?Q?HtC8jlq2WbuutpqmEPfmHXlsfmCsYeQNol2rDByHAeFvy3EpCoWz0VHBNhRI?=
 =?us-ascii?Q?6Qwi1kfUCtS6mx6IoAybk/qv4WtjNyvOmecif9sV6EHUaW/Cvpl224QIqUHv?=
 =?us-ascii?Q?to6KNv0zJEQaZDUrfjPWlZ0T+bxFwuwcvhdEASUTImrA+a5LFpiifkk01TTq?=
 =?us-ascii?Q?Ezu7qWE+uGTS//L4iASPF3twtKEPgAvXfEAm4OXrKVOJD8hvG7iS5lBkB5tP?=
 =?us-ascii?Q?hfpDcMJAzpo0geqQbsW5IAes2Z+ddFUfCTkPgcYX+tP3TqgNIhTbYQbxQAS8?=
 =?us-ascii?Q?Gz56LQO3Pu5m+//awO1C79DsIdOWVTH4aQEA2kcjBQPZd11/WNSm6W/pQZUm?=
 =?us-ascii?Q?FIYQBvoQvEx/wlkhZjAtD368eoWgInMB/oZMw2b/KROqLYFqVD3iCZfigRuI?=
 =?us-ascii?Q?ZdxSPMrpC0ipH1ZbTrM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1019c52-9f90-4c00-c4f9-08d9f171cf09
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 17:28:56.0549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCgI6GOPx6kIefV7maTsQOaCZdUZr4v35UTCoiIsMyXy8tX+fvv8tadNArGqS/6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1670
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, David Hildenbrand <david@redhat.com>, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 11:56:51AM -0500, Felix Kuehling wrote:

> In the case of DEVICE_COHERENT memory, the pfns correspond to real physical
> memory addresses. I don't think they have those PFN_DEV|PFN_MAP bits set.

So do DAX pages. The PTE flag does several things. As this would be
the first time ZONE_DEVICE pages do not set devmap it needs a full
audit.

eg the gup_fast bug Alistair pointed at needs fixing at least.

Jason
