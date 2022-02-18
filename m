Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1EA4BAE4A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 01:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3258010E1A3;
	Fri, 18 Feb 2022 00:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8762310E1A3;
 Fri, 18 Feb 2022 00:19:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Olz2oqoXxzBgX4xHIKCky0UEDgMiaELhlVSbCmrYzK6/dwvBCJWwxauFh2JCQXKwPImm59laHRcQ40z/ztMImdcHshWt7onW5qIAFhtN01C5KdPmK+uEMpYp4JhWvPHbFryoawuwGqIUzGEswP3DDsEblrGALDqkYxZhdhEZsyIqS0jfc0J+rZp8nzf0khFAcJMIkJbl8mu5qf3Vhl1up6i8xLUx833Pg3UTdTmdDDx2p6IbCeKuTsCnlf/JdKdYsmz9zCOWlKiITqk1/6EpLNoy2I938x2ci7wSyuPKwIbVXdQ/aae51pk9hyFXXT4XW0CIRmunNJTnc1NE59xSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6ldf/yGhzb0XYIgTLIVh2MEdD10JW916kxG9oQil18=;
 b=QwXjXZxeaFfweCjsMhGmZdb5emPgwinnFZCDXF0YIKbdoEB4d3POv4jM2fDPE3YXJcAzt4JE39hvbX1163YOEu246RQL06EYZZoSD866+xwUJAtfQy2+CUWdtiFrk4zoY6KhN3AgioCvgtbluzWZbdSAqaitPka/St1Jil48Yl6BQgGESLvAhHrzKv8tq1mXMxDP3YVmv2y64+tdh7mtwnBbPmmw1tE9CVueFT/FKn0DtoVn5VrHg49wPrwaSv/2j1l/lIq+Y0HDG9mfYX715H2UhWiT/11itdZZRkR7jYZ7PAC2aQoW07PAYGzNMU7WDdc9hp1ndljZ0mVn51nNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6ldf/yGhzb0XYIgTLIVh2MEdD10JW916kxG9oQil18=;
 b=PplYozhVE2MTmFe7uwHtQESAt/wOcFlzH5Vybv9NFM94WxD4t7dJBWIxKrimC1A8j1gCpEMPahLHYTlqYFekQSzbo3e25X0MbhurhWpL4FEM1RrnPLUFrbD/CLo8s1LjsDH2g0JmOxs5ZW0mx4EAzAHImmjh49izrPUY4yEHQIem6pI0L0vYTr5wuwCrrbqp+yR0fHHnb/opZ/gODOZ8S47z+t+ub2qVUKNJ6zAcQXHIWDWXEVTO4/U1oXR919qA7kQN3nXhajXx7aml/af6A1OM2keTHaIkYlPPhvuVtfrUzoXRoIY8jz4lDi5e93yWrltS4UOP64NDwmBpc7lfWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BY5PR12MB4817.namprd12.prod.outlook.com (2603:10b6:a03:1fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 00:19:37 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%5]) with mapi id 15.20.4995.018; Fri, 18 Feb 2022
 00:19:37 +0000
Date: Thu, 17 Feb 2022 20:19:35 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Message-ID: <20220218001935.GN4160@nvidia.com>
References: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <877d9vd10u.fsf@nvdebian.thelocal>
 <20220216020357.GD4160@nvidia.com> <6156515.kVgMqSaHHm@nvdebian>
 <98d8bbc5-ffc2-8966-fdc1-a844874e7ae8@redhat.com>
 <20220216122600.GG4160@nvidia.com>
 <bf16195e-2570-3687-2b53-3f597ebfcfec@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf16195e-2570-3687-2b53-3f597ebfcfec@amd.com>
X-ClientProxiedBy: MN2PR18CA0014.namprd18.prod.outlook.com
 (2603:10b6:208:23c::19) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 682bd472-d920-4442-5e15-08d9f27458c4
X-MS-TrafficTypeDiagnostic: BY5PR12MB4817:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4817D0F1153F8AB8B22014ACC2379@BY5PR12MB4817.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzG6g63vvtYHiMXiG2/D1NZRyzb/MjNNDrW+O3SSsH5RKjBmdJdbTjJfyLfayiDEf0pE8WTDR0ptEZZb1pFktbAiHMct8ekBJU/TIhG0op4bEJVdXcAAzQznCIKrF5VeAJSaqCY4p45SEpTwltxfGMdjKUfOZ7UMggUD21RRusZcqKeGapc2QXwVN2V7PjfTX9pa7ohOKWUXas7PV3GOhypib1ZOFR2RJcM54Lyrmia/eKkyge7vmth+BKUf1rseLtxrocQdQNrw9wLG4Bu3ODwkeqhduolTZt55/UWNOawzUlCg4KOL/YtWN+oeI/KTsRidFd4iYgHcMtZaA8sH3l/77DpjPxwpNmpEZHFrbrRSllM0Np8BQmAXGnr8pW8xJOe3VCcRx20f+JREfi1/bSFYHio+dxZRjVoInWq7p0NS1i3KADCg1BpI+A2WC8GGNzeRDSihVW0VQBDYcdgCeRPrDf7aQqLQq7EAefVuMpswqLcLrrjO4uh4t+Ak8jb+ToJTrULyPHJdVTab/K0oC3PtBmSS2J91IIpzhqTiYrsmq6MrJmk75assQ6moCtOOTMrjAdpYLtGyKXCsGgJkSZqLoVXqo/rkYtUMFHWxx1Mze1JTAjXjFDf0TRxElaB5mSrFMPdifnUlyb2p7rQtNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(7416002)(54906003)(6916009)(5660300002)(6486002)(33656002)(6506007)(6512007)(86362001)(2906002)(508600001)(38100700002)(8936002)(26005)(1076003)(4326008)(2616005)(186003)(36756003)(66946007)(83380400001)(66476007)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JfsDVCLqXXf6G/NbQyGXqKUwhuXemavJTXOuAHlCq1Dk0zVr2mF+g623LDsI?=
 =?us-ascii?Q?GCIrCNuvFs3Y8HGaAPhaA8icB/HQm9pyJr23gjga+yk9z4PPLKiJK2fYAoOp?=
 =?us-ascii?Q?GwJ59FThbnNbO9VLfFmE59KKVWjkJlJeqvzEBu2o06VR9kms4WVkgbxuaYpO?=
 =?us-ascii?Q?0NfWnrhtXBbwYHTZyo3F4Dy7IC8fr/wgZ827G688bSNl6bLwiIYHOJ5Apju8?=
 =?us-ascii?Q?murAD/aDk97bYuTIQKKA1A6UXmbjlOdZqVW6jamMjtpQAHqLiJtyeTVqY48p?=
 =?us-ascii?Q?7Un7K1Qmv4rCwSJxZUC5dIat2hk/qypEGAKxnS8C6wUCY1lcSqV5rzdrUSzW?=
 =?us-ascii?Q?+JR6yJCh+QlRiE/eEhkn72ADz11XJ46JGas13nGkPwMxwXLqn4oL5cCQLTIE?=
 =?us-ascii?Q?zXag7haXgHA9gRceRcLcj/h0QGI0bSJlURq2WQLuXkc/ZpRvyYmnBRgrawtk?=
 =?us-ascii?Q?oygWgtB/S3zTIJ79awZ0WyxsIH8VXgICvEJy1A8iFr8rpMS56T8t8XNTaYgV?=
 =?us-ascii?Q?PgmhB4UYVyoXRsnOQKUsBtmpKtWkp8gGEB8SqqYCR/BKhTtmmD32MOuxt3CL?=
 =?us-ascii?Q?KggIDtTaNV5OU3bF/eZRltTwjO+md6oKzpjQ//N41nObv9fnaKJIK74kQPYx?=
 =?us-ascii?Q?PtsyHn8RICsOwUylUR39Iu7elahwyB2gnh/mfEfguMhBCC5U2E6kSTsBF/vX?=
 =?us-ascii?Q?suYnIFprQuLoI6Jg7q8r9lDKmNrHA3YRxMNDjASFahT9u4XATLNHiiQ8/N/I?=
 =?us-ascii?Q?yKX/RYEU8IivQiQhz0/mUpJQY0icvBHzu4UTZH+1JJ9pxr61tfW3rZ9YFWMp?=
 =?us-ascii?Q?303VEP7aRbwityDyLafsCJTFPLg6QrgJRl2sdAR9jvKMmFZNEF8q44O4AGw2?=
 =?us-ascii?Q?HwEC/MReeqKv4ZH4WTASj80mXkic09W27L/eZ96fSOKZCJm8YJzykinTYN3R?=
 =?us-ascii?Q?3yVBVfZZtVyFMPuDFgATxc+X/M40XoUgCTf2tlzq4YQvpeI7WfE5YjlFnsm5?=
 =?us-ascii?Q?1Y1cgFxVvqK9UKNzjqwcMFXJBNTCFwTpzHFo8rUrrM7XKE1Z1d2FIXtPJ4Uv?=
 =?us-ascii?Q?rkEwtgnbpLsz8ULpi5y4QeP+4ZnJtpJ35Ret3EtcrqXvk2SEqRzHrwXS0wOZ?=
 =?us-ascii?Q?V1CBBGimLKA/Y8G9uMLdft/6KniOdpU9jNBVfBY65lAVIpPESG7iqZVPVAXW?=
 =?us-ascii?Q?G11DSvn33sr/JphtiCUSbQlrYLPzoGRC1lyQjM1FdYEaQjz++OHQma9klere?=
 =?us-ascii?Q?Gci3ifUEkhmZxChHfNVW8RYFactJfct/2yXRoOxtX//il3KzLEnwdeVzPH2A?=
 =?us-ascii?Q?O7ftw1ckeV1cY4MuLs+yceB+2FwkrBK88YyGxvhjCb2inSo2+p5XmdielpRz?=
 =?us-ascii?Q?uuGItmKXNBteybJ3M5bHP1K+F5FYfSoUDyd9o5Dns7aUDF0FGtTE8MTSGlq3?=
 =?us-ascii?Q?YA0rlGKmhJI8nxhWrZhiwM7cBgmj8G5BrUnLyTqGlyxTr3VUpB7d8OiZMtxh?=
 =?us-ascii?Q?u9W8TUFpeLPo4jSCEzZxNML+5gmVTdlJ9bL+hjmgniZ78I5t9HIC03UMf2e1?=
 =?us-ascii?Q?kJldyem8MdXwLAnVTb0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682bd472-d920-4442-5e15-08d9f27458c4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 00:19:37.1863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15kAOkAMdyf1tOP9+DUAYY0eoMj1Fkp6/kuUcKyzqfaiue52Vvlm9rCMktn4yQJI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4817
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
 willy@infradead.org, David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 04:12:20PM -0500, Felix Kuehling wrote:

> I'm thinking of a more theoretical approach: Instead of auditing all users,
> I'd ask, what are the invariants that a vm_normal_page should have. Then
> check, whether our DEVICE_COHERENT pages satisfy them. But maybe the concept
> of a vm_normal_page isn't defined clearly enough for that.

I would say the expectation is that only 'page cache and anon' pages
are returned - ie the first union in struct page

This is because the first file in your list I looked at:

static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
				unsigned long addr, unsigned long end,
				struct mm_walk *walk)

{
		page = vm_normal_page(vma, addr, ptent);
[..]
		if (pageout) {
			if (!isolate_lru_page(page)) {

Uses the LRU field, so this is incompatible with all the other page
types.

One mitigation of this might be to formally make vm_normal_page() ==
'pte to page cache and anon page' and add a new function that is 'pte
to any struct page'

Then go through and sort callers as appropriate.

The 'pte to page cache and anon page' can detect ZONE_DEVICE by
calling is_zone_device_page() insted of pte_devmap() and then continue
to return NULL. This same trick will fix GUP_fast.

Jason

