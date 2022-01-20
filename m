Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 936E449472F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 07:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EB310E379;
	Thu, 20 Jan 2022 06:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12E310E340;
 Thu, 20 Jan 2022 06:15:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOvurWXxjdfeswMNwGcoe6L1xpDeYMEcABtbHO2r7hUIsYmcvhkm6wFdZgHF8LTh41t+M8bKLR84jRrifAwYwUQTbrihhYjBxfCKr7TCNKpkZFDteg2XdUSIfGm5dvDytjVK+uhHdqKLKFM0MbT0zaJ1/rMmMBpNM2UOhOUkshmQMaldAYru6edFVfz7fV88GztNW0VcAMyGX/YKITI3CVb7fcYDUTgtAM4X6mJh6sygRtn+v7pYhqU/VbRH6DYGKf0bj20ID/Us7ihbnyFEbo2ugJaYv8xEG80v5Qvi9G7XAFQr2HqFZJvyPUNpSSFMAIJu4ZODXLp+2ktGnON3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rikZUOQyw6McfAXcSFwn1WDHjOfWZ/mS2dFnYt9X1g=;
 b=ayUEDG5O1WJksljYfPFvFelrz5AXNvKlMjWRAwpWhgJB3IAoInvSofyOnNrHOL7wYhouI3grSOu66mBGg1ij2VGdHaHPmZHwQQQkodsfjTMCioYEeeR9DQcJ7buBPW/zSdu/qroydo12PPz8f1HyF90Afn7tjA09R2MfmQUh5vMjgtwFczxt1TufR/yGPOSs2xXSajpCaKyGeHchlqwZ0XL2t84UPjMAR4daY+O5CLSfT+CkMhnpo4Efbd6oQSUz+6i8ltbjmhNdEFEsjAhETVqIcSTRY38/XHL79KoKPJoC4ZJIMlX3sI95EuBIJ8Vy1NPm77TgBpb6LYSA44Ll+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rikZUOQyw6McfAXcSFwn1WDHjOfWZ/mS2dFnYt9X1g=;
 b=VbQEB6ARr4u8biujrg3Qh7Syi6JxRoVenk/Dkt3UTqGVVYBzt5gO4MnIZpx0ELZQ6gLkgfPj0Hp4JeDZO8FJg5Qj7Qnb3b8n9SgLHspsLgCY/5uWlUj1PZtJiTCSsuBdc+lp6+sPHYSM6EQOFRmZNUszhn5Y92YcwoXyvXV49yrbu1oNzLm9LPh4Kh1DyUPvtNhWcoEVqK+uLVEEmWdvf0SHg2Sr6rsaQWy+/Ha5zy2Lu7/XZBcXDYxrALtA6nDcX7qPQTn4Ros0tgpq25QCbxsdkHi8tOfwI3Gn9xTj4aqMx4RpDVJGmgfZRHGzjEcZIPIRkJD0aJtbzlPczubMbQ==
Received: from DM5PR15CA0052.namprd15.prod.outlook.com (2603:10b6:3:ae::14) by
 DM5PR12MB2567.namprd12.prod.outlook.com (2603:10b6:4:b2::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.13; Thu, 20 Jan 2022 06:14:55 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::3b) by DM5PR15CA0052.outlook.office365.com
 (2603:10b6:3:ae::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Thu, 20 Jan 2022 06:14:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 06:14:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 20 Jan 2022 06:14:54 +0000
Received: from nvdebian.localnet (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Wed, 19 Jan 2022
 22:14:51 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v3 09/10] tools: update hmm-test to support device
 coherent type
Date: Thu, 20 Jan 2022 17:14:49 +1100
Message-ID: <2346143.zzXRFGWsWK@nvdebian>
In-Reply-To: <20220110223201.31024-10-alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
 <20220110223201.31024-10-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4383bb3c-f3d6-426f-9ee6-08d9dbdc2dac
X-MS-TrafficTypeDiagnostic: DM5PR12MB2567:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2567CCC6FD56DECC2E939C9FDF5A9@DM5PR12MB2567.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iyTmJt5ECxhwmCTtPuirE9OdEGQ/kVsROk2caIrfj2yP1YrKroiwgzgGIFhzepLmSg2neZ8UZiFxvZ1BMtyLz4Ait9FOygr6umUjpjKSxuuHA60ZKNdgfR8Zgx8jMp3Ca/auC3nEXNhDOTt+r1oIgesclS9SK6NJu/vpJ6x+K1Etys6AXfkyFfW187GEwN2JjQfvqohSOY9zX/F31Q6LAp6ljoYdMiGJ5vml5XHLXvDcHV9wlno1XTGLLkMlkvcTaHgtWbfvlOykBsMoMf2xnousRX3fqGVDC/eVTj4WrUrmTMWnFm5HSlWql+zPQchzrKpKAmPbCdkKxateSjdkc92QIqUr6RCfDin5jKWvMsYfrw9F7kEgL+prdN2/Kqn6PbQQ88zy6uiv/mWB2yoqLpd+v+I/9GPwyTEy7vH3jNxmSGEfZ99yaCf0rTqX7i+X5bGo6+g6MhQU0XLl35S7IMUM8YhhFwUWilBLT3iwls1pFlApIf4gxsmpOkLX9Wf674TojYqF/CdBgmVpMNOm67nLcyem2MPApzk5IS/PYwSXwiDReuXqjFxpOI/lXS2+jSJO+6LGimlTc6Xh+B6ydpjnlSkN2ZyUOZhuDUbiUlrTKDuUaz+fWfs1fjLwx8LvZ3pMu5umNuyAlv/P1aJsON0weIM2blsEXOJiXwjOxCFwrjhsC+/fd75Enk/3qtIYjwFCxj5wiRNK6xr/EkwZUsIT37pbDdoGlOs7piLgWH3QVDVMNrAm+GyqHHhzJDJkOHpUmG0XDBRSU6UHfXVqS1hkz9SjLIM6jFS2YEGua8AmPAHQGNo8U9U85XKrB+OAuOynWXA+BAgvvbDo8gGug2tcj7VEVhICENY0eK44Jas=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(8936002)(110136005)(33716001)(356005)(26005)(508600001)(5660300002)(426003)(83380400001)(7416002)(8676002)(82310400004)(316002)(86362001)(9576002)(47076005)(4326008)(70206006)(16526019)(36860700001)(70586007)(9686003)(40460700001)(54906003)(81166007)(336012)(2906002)(15650500001)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 06:14:55.3492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4383bb3c-f3d6-426f-9ee6-08d9dbdc2dac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2567
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 11 January 2022 9:32:00 AM AEDT Alex Sierra wrote:
> Test cases such as migrate_fault and migrate_multiple, were modified to
> explicit migrate from device to sys memory without the need of page
> faults, when using device coherent type.
> 
> Snapshot test case updated to read memory device type first and based
> on that, get the proper returned results migrate_ping_pong test case

Where is the migrate_ping_pong test? Did you perhaps forget to add it? :-)

> added to test explicit migration from device to sys memory for both
> private and coherent zone types.
> 
> Helpers to migrate from device to sys memory and vicerversa
> were also added.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
> v2:
> Set FIXTURE_VARIANT to add multiple device types to the FIXTURE. This
> will run all the tests for each device type (private and coherent) in
> case both existed during hmm-test driver probed.
> ---
>  tools/testing/selftests/vm/hmm-tests.c | 122 ++++++++++++++++++++-----
>  1 file changed, 101 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
> index 864f126ffd78..8eb81dfba4b3 100644
> --- a/tools/testing/selftests/vm/hmm-tests.c
> +++ b/tools/testing/selftests/vm/hmm-tests.c
> @@ -44,6 +44,14 @@ struct hmm_buffer {
>  	int		fd;
>  	uint64_t	cpages;
>  	uint64_t	faults;
> +	int		zone_device_type;
> +};
> +
> +enum {
> +	HMM_PRIVATE_DEVICE_ONE,
> +	HMM_PRIVATE_DEVICE_TWO,
> +	HMM_COHERENCE_DEVICE_ONE,
> +	HMM_COHERENCE_DEVICE_TWO,
>  };
>  
>  #define TWOMEG		(1 << 21)
> @@ -60,6 +68,21 @@ FIXTURE(hmm)
>  	unsigned int	page_shift;
>  };
>  
> +FIXTURE_VARIANT(hmm)
> +{
> +	int     device_number;
> +};
> +
> +FIXTURE_VARIANT_ADD(hmm, hmm_device_private)
> +{
> +	.device_number = HMM_PRIVATE_DEVICE_ONE,
> +};
> +
> +FIXTURE_VARIANT_ADD(hmm, hmm_device_coherent)
> +{
> +	.device_number = HMM_COHERENCE_DEVICE_ONE,
> +};
> +
>  FIXTURE(hmm2)
>  {
>  	int		fd0;
> @@ -68,6 +91,24 @@ FIXTURE(hmm2)
>  	unsigned int	page_shift;
>  };
>  
> +FIXTURE_VARIANT(hmm2)
> +{
> +	int     device_number0;
> +	int     device_number1;
> +};
> +
> +FIXTURE_VARIANT_ADD(hmm2, hmm2_device_private)
> +{
> +	.device_number0 = HMM_PRIVATE_DEVICE_ONE,
> +	.device_number1 = HMM_PRIVATE_DEVICE_TWO,
> +};
> +
> +FIXTURE_VARIANT_ADD(hmm2, hmm2_device_coherent)
> +{
> +	.device_number0 = HMM_COHERENCE_DEVICE_ONE,
> +	.device_number1 = HMM_COHERENCE_DEVICE_TWO,
> +};
> +
>  static int hmm_open(int unit)
>  {
>  	char pathname[HMM_PATH_MAX];
> @@ -81,12 +122,19 @@ static int hmm_open(int unit)
>  	return fd;
>  }
>  
> +static bool hmm_is_coherent_type(int dev_num)
> +{
> +	return (dev_num >= HMM_COHERENCE_DEVICE_ONE);
> +}
> +
>  FIXTURE_SETUP(hmm)
>  {
>  	self->page_size = sysconf(_SC_PAGE_SIZE);
>  	self->page_shift = ffs(self->page_size) - 1;
>  
> -	self->fd = hmm_open(0);
> +	self->fd = hmm_open(variant->device_number);
> +	if (self->fd < 0 && hmm_is_coherent_type(variant->device_number))
> +		SKIP(exit(0), "DEVICE_COHERENT not available");
>  	ASSERT_GE(self->fd, 0);
>  }
>  
> @@ -95,9 +143,11 @@ FIXTURE_SETUP(hmm2)
>  	self->page_size = sysconf(_SC_PAGE_SIZE);
>  	self->page_shift = ffs(self->page_size) - 1;
>  
> -	self->fd0 = hmm_open(0);
> +	self->fd0 = hmm_open(variant->device_number0);
> +	if (self->fd0 < 0 && hmm_is_coherent_type(variant->device_number0))
> +		SKIP(exit(0), "DEVICE_COHERENT not available");
>  	ASSERT_GE(self->fd0, 0);
> -	self->fd1 = hmm_open(1);
> +	self->fd1 = hmm_open(variant->device_number1);
>  	ASSERT_GE(self->fd1, 0);
>  }
>  
> @@ -144,6 +194,7 @@ static int hmm_dmirror_cmd(int fd,
>  	}
>  	buffer->cpages = cmd.cpages;
>  	buffer->faults = cmd.faults;
> +	buffer->zone_device_type = cmd.zone_device_type;
>  
>  	return 0;
>  }
> @@ -211,6 +262,20 @@ static void hmm_nanosleep(unsigned int n)
>  	nanosleep(&t, NULL);
>  }
>  
> +static int hmm_migrate_sys_to_dev(int fd,
> +				   struct hmm_buffer *buffer,
> +				   unsigned long npages)
> +{
> +	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_DEV, buffer, npages);
> +}
> +
> +static int hmm_migrate_dev_to_sys(int fd,
> +				   struct hmm_buffer *buffer,
> +				   unsigned long npages)
> +{
> +	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_SYS, buffer, npages);
> +}
> +
>  /*
>   * Simple NULL test of device open/close.
>   */
> @@ -875,7 +940,7 @@ TEST_F(hmm, migrate)
>  		ptr[i] = i;
>  
>  	/* Migrate memory to device. */
> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>  	ASSERT_EQ(ret, 0);
>  	ASSERT_EQ(buffer->cpages, npages);
>  
> @@ -923,7 +988,7 @@ TEST_F(hmm, migrate_fault)
>  		ptr[i] = i;
>  
>  	/* Migrate memory to device. */
> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>  	ASSERT_EQ(ret, 0);
>  	ASSERT_EQ(buffer->cpages, npages);
>  
> @@ -936,7 +1001,7 @@ TEST_F(hmm, migrate_fault)
>  		ASSERT_EQ(ptr[i], i);
>  
>  	/* Migrate memory to the device again. */
> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>  	ASSERT_EQ(ret, 0);
>  	ASSERT_EQ(buffer->cpages, npages);
>  
> @@ -976,7 +1041,7 @@ TEST_F(hmm, migrate_shared)
>  	ASSERT_NE(buffer->ptr, MAP_FAILED);
>  
>  	/* Migrate memory to device. */
> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>  	ASSERT_EQ(ret, -ENOENT);
>  
>  	hmm_buffer_free(buffer);
> @@ -1015,7 +1080,7 @@ TEST_F(hmm2, migrate_mixed)
>  	p = buffer->ptr;
>  
>  	/* Migrating a protected area should be an error. */
> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, npages);
> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, npages);
>  	ASSERT_EQ(ret, -EINVAL);
>  
>  	/* Punch a hole after the first page address. */
> @@ -1023,7 +1088,7 @@ TEST_F(hmm2, migrate_mixed)
>  	ASSERT_EQ(ret, 0);
>  
>  	/* We expect an error if the vma doesn't cover the range. */
> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 3);
> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 3);
>  	ASSERT_EQ(ret, -EINVAL);
>  
>  	/* Page 2 will be a read-only zero page. */
> @@ -1055,13 +1120,13 @@ TEST_F(hmm2, migrate_mixed)
>  
>  	/* Now try to migrate pages 2-5 to device 1. */
>  	buffer->ptr = p + 2 * self->page_size;
> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 4);
> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 4);
>  	ASSERT_EQ(ret, 0);
>  	ASSERT_EQ(buffer->cpages, 4);
>  
>  	/* Page 5 won't be migrated to device 0 because it's on device 1. */
>  	buffer->ptr = p + 5 * self->page_size;
> -	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
> +	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
>  	ASSERT_EQ(ret, -ENOENT);
>  	buffer->ptr = p;
>  
> @@ -1070,8 +1135,12 @@ TEST_F(hmm2, migrate_mixed)
>  }
>  
>  /*
> - * Migrate anonymous memory to device private memory and fault it back to system
> - * memory multiple times.
> + * Migrate anonymous memory to device memory and back to system memory
> + * multiple times. In case of private zone configuration, this is done
> + * through fault pages accessed by CPU. In case of coherent zone configuration,
> + * the pages from the device should be explicitly migrated back to system memory.
> + * The reason is Coherent device zone has coherent access by CPU, therefore
> + * it will not generate any page fault.
>   */
>  TEST_F(hmm, migrate_multiple)
>  {
> @@ -1107,8 +1176,7 @@ TEST_F(hmm, migrate_multiple)
>  			ptr[i] = i;
>  
>  		/* Migrate memory to device. */
> -		ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer,
> -				      npages);
> +		ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>  		ASSERT_EQ(ret, 0);
>  		ASSERT_EQ(buffer->cpages, npages);
>  
> @@ -1116,7 +1184,12 @@ TEST_F(hmm, migrate_multiple)
>  		for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
>  			ASSERT_EQ(ptr[i], i);
>  
> -		/* Fault pages back to system memory and check them. */
> +		/* Migrate back to system memory and check them. */
> +		if (hmm_is_coherent_type(variant->device_number)) {
> +			ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);

So I think this will still pass even if nothing migrates so as mentioned on
the previous patch I think we need to check for the number of pages that
actually migrated. Alternatively I suppose you could do a snapshot and check
that, but that seems like it would be harder. Otherwise I think this looks
good.

> +			ASSERT_EQ(ret, 0);
> +		}
> +
>  		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
>  			ASSERT_EQ(ptr[i], i);
>  
> @@ -1312,13 +1385,13 @@ TEST_F(hmm2, snapshot)
>  
>  	/* Page 5 will be migrated to device 0. */
>  	buffer->ptr = p + 5 * self->page_size;
> -	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
> +	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
>  	ASSERT_EQ(ret, 0);
>  	ASSERT_EQ(buffer->cpages, 1);
>  
>  	/* Page 6 will be migrated to device 1. */
>  	buffer->ptr = p + 6 * self->page_size;
> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 1);
> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 1);
>  	ASSERT_EQ(ret, 0);
>  	ASSERT_EQ(buffer->cpages, 1);
>  
> @@ -1335,9 +1408,16 @@ TEST_F(hmm2, snapshot)
>  	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
>  	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
>  	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);
> -	ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
> -			HMM_DMIRROR_PROT_WRITE);
> -	ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
> +	if (!hmm_is_coherent_type(variant->device_number0)) {
> +		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
> +				HMM_DMIRROR_PROT_WRITE);
> +		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
> +	} else {
> +		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL |
> +				HMM_DMIRROR_PROT_WRITE);
> +		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE |
> +				HMM_DMIRROR_PROT_WRITE);
> +	}
>  
>  	hmm_buffer_free(buffer);
>  }
> 




