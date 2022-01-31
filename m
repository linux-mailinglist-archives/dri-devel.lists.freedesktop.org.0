Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400594A5353
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 00:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF9310E456;
	Mon, 31 Jan 2022 23:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA9410E456;
 Mon, 31 Jan 2022 23:37:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnWVu/cK0CWlXCJnjStqFO+yMXyNow01hZBIjEDBsupkST/ywOABf5+pd2M2uuyoZ7p9X/ENATeCKSKdHRKVtPSGsw6hQtpTMrD53ah9fVtq84nRClC7UxEVFgfLHGZOIc3aXyULcrpnvBbIXdb4oWFDy065LfcFn26GojWuuGiaQV6jMe3kA150/nh4MizbIn3HUNEpFNjrkBoYzvzUPCkB8HGSvV2t0DdC4ikk21archNaf03ZpCOF9lVqc2++AteGVwKH0RT6Y22cGgKrxpRgisY7vHEKBK59cyeB/YyPSXXS/Do2P1lWM6U4+tpCztkfm4/LNlOvqR2N1lnvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhlD9e4vcJB+6I9ww66UQ9a4OTzqlUzS3gcAFVGpk3U=;
 b=P5gPtohaC1R04tSjDgO90tr/2e7ewUxnvZ3ABJPBGwo/UvnU6eBKZWuehBmi2NKgBw2X31+V8YriqITdL0SBngZBhM/wdp+KZYBtAnvC6XF37UZhQg9BDJq9yK62CCbcx0j9thM1+SdreQnXE0vg16ZFxzuesd15CvKT+9j06sSJ4I7IiipnvIy3jDqAsRiptaHHBezJns5fgTBZMny+lqZ1DDSfWTlow3mFivbB22ugKHMGYfWkJ7akVli2jv2YgU1prGXu56h8wKUQccuK1CZGCTKUyfZnotfu18hKHyvta3c6MhlRQBxEB/WIoSETu4zTeiUTN/KkxdLYTudVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhlD9e4vcJB+6I9ww66UQ9a4OTzqlUzS3gcAFVGpk3U=;
 b=dwjwjWIqXCxyRfKRN7i9DTGbhErKtg5/AtliRaPJJy70fq2B0ub9ddqHWmmPmoO1bAVS2/6a+o7lZL+bAuJ2BuhYRRuDSKy68kV/C1rMGRzyIqnDyI27ohqJPUoohH8X9plaR+tQL8jwl2QiEqy2pZ0BeLIcpKGaPZQJn9U6ualzC5aerf7j9okN7xpWE+gWySvFcA3QPWRnkCC/m3daLLv8KY42rmfmiGkNh0XJtP0Ivt7kV95mpdJHa5YVA9rHqbaOZA0mSjJYk9VMGJJ3zSDOOuiqWNwvgk25EzvvdjgIkqfDSzy6Qb7h6oZ9tDFP8CoCgI0otxvnj13KDYlzRw==
Received: from MW4PR03CA0106.namprd03.prod.outlook.com (2603:10b6:303:b7::21)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Mon, 31 Jan
 2022 23:37:55 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::38) by MW4PR03CA0106.outlook.office365.com
 (2603:10b6:303:b7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Mon, 31 Jan 2022 23:37:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 23:37:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 31 Jan 2022 23:37:52 +0000
Received: from nvdebian.localnet (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Mon, 31 Jan 2022
 15:37:49 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, "Sierra Guiza, Alejandro (Alex)"
 <alex.sierra@amd.com>
Subject: Re: [PATCH v5 09/10] tools: update hmm-test to support device
 coherent type
Date: Tue, 1 Feb 2022 10:37:47 +1100
Message-ID: <45726756.eMkXEF23lS@nvdebian>
In-Reply-To: <922553fd-a19b-e3a6-2a99-c31ced3b4281@amd.com>
References: <20220128200825.8623-1-alex.sierra@amd.com>
 <20220128200825.8623-10-alex.sierra@amd.com>
 <922553fd-a19b-e3a6-2a99-c31ced3b4281@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6f47f7a-4569-46fd-989e-08d9e512b426
X-MS-TrafficTypeDiagnostic: MN2PR12MB4157:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB415764CA0EC59B959A93898EDF259@MN2PR12MB4157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/PG4EypagbHjootMahmWfnlL0Nz1VIjCghgIAXhI5rpG05f4La+zgONJJ5pA8C1EJm9eHY3DZKN4XtF6GVxArf+6CsUzUF++gqwxCeJj4OtBG+ZiYOpgDzJ1zslsvnJ++Gfd4C0rtX+Meb0ekQ3hOINWlFk56XebGS1e32ZB1pLrN9vyiU/ziY3oKkwSlb3D6ktWCrT1oiulkrLY35QyXGZkhEjuet6blKT7NNpnADs+wh6CN3tjjJl2FzF/ylr7QNTCk82MPMeHwGpTSTqbUzOeR87Jw6NKPW2ra4WunYQSo1lRRpd7HYNv50ycYlWvx+hfxRBomV5hTdOlBlSb93QimOlKORpFowfeI8/1ETYP+Ng+eypeLaXMPZBf1AinHuvik1pPjIxMUx6eTA3iK/unVsx/9Aa0HB4F2P3B7QK+e9VXoswhhlWN08dVytMrXcb3ZTyRwcgZUouvE1qA4Lb7G+GoVg6skdhhNwQnDQsAzv36RLVUXr6vUU9Zhm/Z5cpa+PfBDxVglI2ppfV8kCSD5fVUgvE6J5fcdJ7eOESWvfct4ss93M595gsLcn3kognyBzbSKs3Dqpn6/JiueJRhIS/yjwYl0Y8fnn3nEw2KaCcY4Er7VIQcMtuE2CEdBO+TgnkG1ao1+j64dlPnXffSoG9CODkRavZv9X8/a+ws/+WFRy1nTWbr/asTsC95J7NcRIEV04ymx0+OkWIAkHKmHhHZL8j7fODpcWeZZLKNLRpeoSnNlTMwXQXU7Fk
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(26005)(53546011)(186003)(30864003)(33716001)(16526019)(70206006)(70586007)(316002)(15650500001)(508600001)(54906003)(36860700001)(9576002)(5660300002)(110136005)(8936002)(8676002)(7416002)(2906002)(336012)(426003)(83380400001)(9686003)(86362001)(81166007)(47076005)(82310400004)(356005)(40460700003)(4326008)(39026012)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 23:37:54.3142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f47f7a-4569-46fd-989e-08d9e512b426
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157
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
Cc: willy@infradead.org, amd-gfx@lists.freedesktop.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oh sorry, I had looked at this but forgotten to add my reviewed by:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

On Tuesday, 1 February 2022 10:27:25 AM AEDT Sierra Guiza, Alejandro (Alex) wrote:
> Hi Alistair,
> This is the last patch to be reviewed from this series. It already has 
> the changes from
> your last feedback (V3). Would you mind to take a look?
> Thanks a lot for reviewing the rest!
> 
> Regards,
> Alex Sierra
> 
> On 1/28/2022 2:08 PM, Alex Sierra wrote:
> > Test cases such as migrate_fault and migrate_multiple, were modified to
> > explicit migrate from device to sys memory without the need of page
> > faults, when using device coherent type.
> >
> > Snapshot test case updated to read memory device type first and based
> > on that, get the proper returned results migrate_ping_pong test case
> > added to test explicit migration from device to sys memory for both
> > private and coherent zone types.
> >
> > Helpers to migrate from device to sys memory and vicerversa
> > were also added.
> >
> > Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> > Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > ---
> > v2:
> > Set FIXTURE_VARIANT to add multiple device types to the FIXTURE. This
> > will run all the tests for each device type (private and coherent) in
> > case both existed during hmm-test driver probed.
> > v4:
> > Check for the number of pages successfully migrated from coherent
> > device to system at migrate_multiple test.
> > ---
> >   tools/testing/selftests/vm/hmm-tests.c | 123 ++++++++++++++++++++-----
> >   1 file changed, 102 insertions(+), 21 deletions(-)
> >
> > diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
> > index 203323967b50..84ec8c4a1dc7 100644
> > --- a/tools/testing/selftests/vm/hmm-tests.c
> > +++ b/tools/testing/selftests/vm/hmm-tests.c
> > @@ -44,6 +44,14 @@ struct hmm_buffer {
> >   	int		fd;
> >   	uint64_t	cpages;
> >   	uint64_t	faults;
> > +	int		zone_device_type;
> > +};
> > +
> > +enum {
> > +	HMM_PRIVATE_DEVICE_ONE,
> > +	HMM_PRIVATE_DEVICE_TWO,
> > +	HMM_COHERENCE_DEVICE_ONE,
> > +	HMM_COHERENCE_DEVICE_TWO,
> >   };
> >   
> >   #define TWOMEG		(1 << 21)
> > @@ -60,6 +68,21 @@ FIXTURE(hmm)
> >   	unsigned int	page_shift;
> >   };
> >   
> > +FIXTURE_VARIANT(hmm)
> > +{
> > +	int     device_number;
> > +};
> > +
> > +FIXTURE_VARIANT_ADD(hmm, hmm_device_private)
> > +{
> > +	.device_number = HMM_PRIVATE_DEVICE_ONE,
> > +};
> > +
> > +FIXTURE_VARIANT_ADD(hmm, hmm_device_coherent)
> > +{
> > +	.device_number = HMM_COHERENCE_DEVICE_ONE,
> > +};
> > +
> >   FIXTURE(hmm2)
> >   {
> >   	int		fd0;
> > @@ -68,6 +91,24 @@ FIXTURE(hmm2)
> >   	unsigned int	page_shift;
> >   };
> >   
> > +FIXTURE_VARIANT(hmm2)
> > +{
> > +	int     device_number0;
> > +	int     device_number1;
> > +};
> > +
> > +FIXTURE_VARIANT_ADD(hmm2, hmm2_device_private)
> > +{
> > +	.device_number0 = HMM_PRIVATE_DEVICE_ONE,
> > +	.device_number1 = HMM_PRIVATE_DEVICE_TWO,
> > +};
> > +
> > +FIXTURE_VARIANT_ADD(hmm2, hmm2_device_coherent)
> > +{
> > +	.device_number0 = HMM_COHERENCE_DEVICE_ONE,
> > +	.device_number1 = HMM_COHERENCE_DEVICE_TWO,
> > +};
> > +
> >   static int hmm_open(int unit)
> >   {
> >   	char pathname[HMM_PATH_MAX];
> > @@ -81,12 +122,19 @@ static int hmm_open(int unit)
> >   	return fd;
> >   }
> >   
> > +static bool hmm_is_coherent_type(int dev_num)
> > +{
> > +	return (dev_num >= HMM_COHERENCE_DEVICE_ONE);
> > +}
> > +
> >   FIXTURE_SETUP(hmm)
> >   {
> >   	self->page_size = sysconf(_SC_PAGE_SIZE);
> >   	self->page_shift = ffs(self->page_size) - 1;
> >   
> > -	self->fd = hmm_open(0);
> > +	self->fd = hmm_open(variant->device_number);
> > +	if (self->fd < 0 && hmm_is_coherent_type(variant->device_number))
> > +		SKIP(exit(0), "DEVICE_COHERENT not available");
> >   	ASSERT_GE(self->fd, 0);
> >   }
> >   
> > @@ -95,9 +143,11 @@ FIXTURE_SETUP(hmm2)
> >   	self->page_size = sysconf(_SC_PAGE_SIZE);
> >   	self->page_shift = ffs(self->page_size) - 1;
> >   
> > -	self->fd0 = hmm_open(0);
> > +	self->fd0 = hmm_open(variant->device_number0);
> > +	if (self->fd0 < 0 && hmm_is_coherent_type(variant->device_number0))
> > +		SKIP(exit(0), "DEVICE_COHERENT not available");
> >   	ASSERT_GE(self->fd0, 0);
> > -	self->fd1 = hmm_open(1);
> > +	self->fd1 = hmm_open(variant->device_number1);
> >   	ASSERT_GE(self->fd1, 0);
> >   }
> >   
> > @@ -144,6 +194,7 @@ static int hmm_dmirror_cmd(int fd,
> >   	}
> >   	buffer->cpages = cmd.cpages;
> >   	buffer->faults = cmd.faults;
> > +	buffer->zone_device_type = cmd.zone_device_type;
> >   
> >   	return 0;
> >   }
> > @@ -211,6 +262,20 @@ static void hmm_nanosleep(unsigned int n)
> >   	nanosleep(&t, NULL);
> >   }
> >   
> > +static int hmm_migrate_sys_to_dev(int fd,
> > +				   struct hmm_buffer *buffer,
> > +				   unsigned long npages)
> > +{
> > +	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_DEV, buffer, npages);
> > +}
> > +
> > +static int hmm_migrate_dev_to_sys(int fd,
> > +				   struct hmm_buffer *buffer,
> > +				   unsigned long npages)
> > +{
> > +	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_SYS, buffer, npages);
> > +}
> > +
> >   /*
> >    * Simple NULL test of device open/close.
> >    */
> > @@ -875,7 +940,7 @@ TEST_F(hmm, migrate)
> >   		ptr[i] = i;
> >   
> >   	/* Migrate memory to device. */
> > -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> > +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
> >   	ASSERT_EQ(ret, 0);
> >   	ASSERT_EQ(buffer->cpages, npages);
> >   
> > @@ -923,7 +988,7 @@ TEST_F(hmm, migrate_fault)
> >   		ptr[i] = i;
> >   
> >   	/* Migrate memory to device. */
> > -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> > +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
> >   	ASSERT_EQ(ret, 0);
> >   	ASSERT_EQ(buffer->cpages, npages);
> >   
> > @@ -936,7 +1001,7 @@ TEST_F(hmm, migrate_fault)
> >   		ASSERT_EQ(ptr[i], i);
> >   
> >   	/* Migrate memory to the device again. */
> > -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> > +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
> >   	ASSERT_EQ(ret, 0);
> >   	ASSERT_EQ(buffer->cpages, npages);
> >   
> > @@ -976,7 +1041,7 @@ TEST_F(hmm, migrate_shared)
> >   	ASSERT_NE(buffer->ptr, MAP_FAILED);
> >   
> >   	/* Migrate memory to device. */
> > -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> > +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
> >   	ASSERT_EQ(ret, -ENOENT);
> >   
> >   	hmm_buffer_free(buffer);
> > @@ -1015,7 +1080,7 @@ TEST_F(hmm2, migrate_mixed)
> >   	p = buffer->ptr;
> >   
> >   	/* Migrating a protected area should be an error. */
> > -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, npages);
> > +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, npages);
> >   	ASSERT_EQ(ret, -EINVAL);
> >   
> >   	/* Punch a hole after the first page address. */
> > @@ -1023,7 +1088,7 @@ TEST_F(hmm2, migrate_mixed)
> >   	ASSERT_EQ(ret, 0);
> >   
> >   	/* We expect an error if the vma doesn't cover the range. */
> > -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 3);
> > +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 3);
> >   	ASSERT_EQ(ret, -EINVAL);
> >   
> >   	/* Page 2 will be a read-only zero page. */
> > @@ -1055,13 +1120,13 @@ TEST_F(hmm2, migrate_mixed)
> >   
> >   	/* Now try to migrate pages 2-5 to device 1. */
> >   	buffer->ptr = p + 2 * self->page_size;
> > -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 4);
> > +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 4);
> >   	ASSERT_EQ(ret, 0);
> >   	ASSERT_EQ(buffer->cpages, 4);
> >   
> >   	/* Page 5 won't be migrated to device 0 because it's on device 1. */
> >   	buffer->ptr = p + 5 * self->page_size;
> > -	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
> > +	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
> >   	ASSERT_EQ(ret, -ENOENT);
> >   	buffer->ptr = p;
> >   
> > @@ -1070,8 +1135,12 @@ TEST_F(hmm2, migrate_mixed)
> >   }
> >   
> >   /*
> > - * Migrate anonymous memory to device private memory and fault it back to system
> > - * memory multiple times.
> > + * Migrate anonymous memory to device memory and back to system memory
> > + * multiple times. In case of private zone configuration, this is done
> > + * through fault pages accessed by CPU. In case of coherent zone configuration,
> > + * the pages from the device should be explicitly migrated back to system memory.
> > + * The reason is Coherent device zone has coherent access by CPU, therefore
> > + * it will not generate any page fault.
> >    */
> >   TEST_F(hmm, migrate_multiple)
> >   {
> > @@ -1107,8 +1176,7 @@ TEST_F(hmm, migrate_multiple)
> >   			ptr[i] = i;
> >   
> >   		/* Migrate memory to device. */
> > -		ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer,
> > -				      npages);
> > +		ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
> >   		ASSERT_EQ(ret, 0);
> >   		ASSERT_EQ(buffer->cpages, npages);
> >   
> > @@ -1116,7 +1184,13 @@ TEST_F(hmm, migrate_multiple)
> >   		for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
> >   			ASSERT_EQ(ptr[i], i);
> >   
> > -		/* Fault pages back to system memory and check them. */
> > +		/* Migrate back to system memory and check them. */
> > +		if (hmm_is_coherent_type(variant->device_number)) {
> > +			ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
> > +			ASSERT_EQ(ret, 0);
> > +			ASSERT_EQ(buffer->cpages, npages);
> > +		}
> > +
> >   		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> >   			ASSERT_EQ(ptr[i], i);
> >   
> > @@ -1354,13 +1428,13 @@ TEST_F(hmm2, snapshot)
> >   
> >   	/* Page 5 will be migrated to device 0. */
> >   	buffer->ptr = p + 5 * self->page_size;
> > -	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
> > +	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
> >   	ASSERT_EQ(ret, 0);
> >   	ASSERT_EQ(buffer->cpages, 1);
> >   
> >   	/* Page 6 will be migrated to device 1. */
> >   	buffer->ptr = p + 6 * self->page_size;
> > -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 1);
> > +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 1);
> >   	ASSERT_EQ(ret, 0);
> >   	ASSERT_EQ(buffer->cpages, 1);
> >   
> > @@ -1377,9 +1451,16 @@ TEST_F(hmm2, snapshot)
> >   	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
> >   	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
> >   	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);
> > -	ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
> > -			HMM_DMIRROR_PROT_WRITE);
> > -	ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
> > +	if (!hmm_is_coherent_type(variant->device_number0)) {
> > +		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
> > +				HMM_DMIRROR_PROT_WRITE);
> > +		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
> > +	} else {
> > +		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL |
> > +				HMM_DMIRROR_PROT_WRITE);
> > +		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE |
> > +				HMM_DMIRROR_PROT_WRITE);
> > +	}
> >   
> >   	hmm_buffer_free(buffer);
> >   }
> 




