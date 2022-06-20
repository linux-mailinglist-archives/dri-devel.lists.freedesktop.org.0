Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D9550EBB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 05:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2ED10EAFE;
	Mon, 20 Jun 2022 03:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A605910EAFE;
 Mon, 20 Jun 2022 03:00:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlHgz9OqHTcUnq091ekKUd7SwsbUNOVldNXJECRWxPtPgJRVTkTQinXhfxhFctKphXQcTg4tYVL0nro2pNV/MuD411Nt/fy8A/+UohrcGg4teFRyf3ZaXHtqYAtjikmSh0zv/102H8NgCJZ7YlKlQas4Jk0JO6LdJE8jw5uzAFLkiMZMexYbfm10wupv2PLhV2Noo4P4SfpUlTF9gFvXjZYoJ/SDHfFk0P+9RsQXWYy/lrOlqzSW1ly9a7LF8atu5VEaRP9uJY8J8dqvG0gFA8taKID3ldewzTlH7xQL5CBxaG4zM55AQBhWQTZEDyOLANSW7PJqHx6hCmMZa0DIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNPUk/pK/3CvOADsqC9rUWR68D328XrUxxeYNh9+Pi8=;
 b=WHIby9WBgFIaQ5B5quW4YFhPw+hnJEZ8LORHqsrKPRyvYaed78zCyK6z+xTU4OwkAKGAWAAjb80emGQ+M7JcWCHdKnjM3mpfMf/nHL9urHxvxdvWIBRDIjHOo1741w/SthGDRn+JSR+3ySgGFR8xGDnJtc0y7LX7R9E1x+8L6o5y/y34CJ9LX0yv8/gennCJ5yMYhrQxTy3ZPl3/Yk82x6jxiF+QeEADLjjsbwwvtyExrohrLZnyF9UWTsZdNTtnpD623MZUMqX8qT6kOuDWUYi9e5/7v/7/ruqVHS5PL0YtCBpI9fP7bfbGFSdXij1308B4xN2AxAH/pJO0P75Wdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNPUk/pK/3CvOADsqC9rUWR68D328XrUxxeYNh9+Pi8=;
 b=WJcSYABDi4zgF5FK9GFaWxEwxMx673igP/FEBW1Hs3P2DGKsdHGXCkx0p0V06eH6objplOVBCGV4I7pIFdt3TlVT4ayLBGjCcCzZq8TrU36cNNztzwLey7JsUE83zFDcuyLx+MeSpwh+N0X3uKG5vMf41yb40Pq+/9cZtsyqZ7cq6HUnDWFEoRZ/HiWrMPySzQdg+1fJeAIN+MGaiPwrxDd2wcekimWL+/OTPNd0mUr8ko9qUNFOhG1uMPmm8ARe+sF2NmzdDh91dlDCRrdwXLh1rd2cy2kjddvolw7WoXvc6Goc66kK2+gCcqyPnCgtZrIFm1xjCrMyERbG9WYWfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN6PR1201MB0019.namprd12.prod.outlook.com (2603:10b6:405:4d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 03:00:48 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 03:00:48 +0000
Date: Mon, 20 Jun 2022 00:00:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFT][PATCH v1 6/6] vfio: Replace phys_pfn with phys_page for
 vfio_pin_pages()
Message-ID: <20220620030046.GB5219@nvidia.com>
References: <20220616235212.15185-1-nicolinc@nvidia.com>
 <20220616235212.15185-7-nicolinc@nvidia.com>
 <YqxBLbu8yPJiwK6Z@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqxBLbu8yPJiwK6Z@infradead.org>
X-ClientProxiedBy: MW4PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:303:b9::29) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2de7e6a-82a8-4a66-969c-08da526913c0
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0019:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0019D2922F422B39FE3AAB77C2B09@BN6PR1201MB0019.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvUwHxvJ0d9ZrY6KdLjH1QRNynDD1lmglgs3+36BILUZy2e15LLb698YCE7WBuxinHPcCJDmpqka2qdM3WPV6i/9YYw6qMrewoTdw84+Day9TIPl7y2cVIGHqcDpB4RNnAJomeLl66LjMntifEKBMN9ZWVAIz2QrFaddK0T5dMFbQCWXIwiU3JZtj3Z2aPYU0rczDc/jgv5No0x8P7i1r7rE6Ea6yunO66k45tF2BEGtKWPA/D2O9YB7gy/F+NGlRSjlK+vxAJKomt/AA+Gyi8+LhseQdymiCQ7SEW2rS/WuTI7iO4mmAD8FPUIrOy4f3u7TvasCrbBd0/a5axg3E7GjvyKpDU9/4yQW5gfd+iFTAjBOlE1RbavD4mNTekPK0owMyYXivj2+OFuGp4rqvwNNWr4aZNX3fDRoSPDocoKnQo8zDyVyQSSGbw/WfZNrb/gAzb2W3X8M71MFUmMV3a+lwOc/U8yG7eA5Fg658aOo2lsQuxd7kmI1I7AwImlwMPcoUZP5mZ04kzYFkNsWuoATXN/uLkXvqGDPj3qD9eHpkdx51goX3vkaYrENjFrgr1OJbztCFAP8e3/VWd7UTjXNMZRcSMr19O5L4Yya3RSxKxD/1YnbOVk75xxYVitnUG/HTNM+xLpb0G14b2UPAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(8936002)(7406005)(86362001)(2906002)(6506007)(7416002)(26005)(5660300002)(6512007)(4744005)(6916009)(6486002)(478600001)(316002)(38100700002)(33656002)(4326008)(66946007)(66556008)(8676002)(66476007)(36756003)(2616005)(1076003)(186003)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6YBtcR622JoiQ6Gly0oCoen9Zg34gBhHxC62H6QXb0rPY5tuv+0V+JR1VEsn?=
 =?us-ascii?Q?QWzg3mfitlA/rw68Op6EkX8zAd0MI3iHzLevuRPN4ROjxIHDq2zCV2HFDfjQ?=
 =?us-ascii?Q?uTtM7NSWb6c8yDNR1v1uESrC7D6LXv7eVnNNAb/l2kqFAFCGQ5kMDdVEJfb6?=
 =?us-ascii?Q?1iDN/toXgltpFlxW8Uvpr2HwJfXjcrTOwi+a/+FwLUzli6RzGcK7lk4iPP/Y?=
 =?us-ascii?Q?j2P87zgZwiyy6p6MIJMjzA6VzBl3D9q3KcIKpPIW6Fvs/cfCh7wS5nzX+zmS?=
 =?us-ascii?Q?1Z4RxD1HSIJN0W+F1wpH5eqZDUThWGh5tV+O38c3uc6cDVILP4z0P5enMk2g?=
 =?us-ascii?Q?KJqOEwjOTXLKOqjU/yXGHT+PQKauf7oxdJvl4aSOtYGd9VTZ/cC+8r/kvwFj?=
 =?us-ascii?Q?BtJg8R6K4ah7C0v+nRHYxF4woIjBV2DLFsMeybgl1Ui3IiNPwMNhCsNR1ruh?=
 =?us-ascii?Q?OiijQivuqY5oWhlDOaPQm/TIigsLmZIV8JDOifWZ1XXcxrDGE49zXqtyWsPc?=
 =?us-ascii?Q?95EmUTVBKa8as/Od5vZSzSzFnzXmQpV/kfigH4VvVejfbGaHr/sjooJkgktR?=
 =?us-ascii?Q?h8x1xnOB5Xe+/XarXT3Y+oAvzHgzMrCDAS3J0X9na32AsJqgWTAhR/OSXATu?=
 =?us-ascii?Q?Jky49CgfP2oOGK6TEblCZIvKiHceGOpC0sR0bBpPq7wiXCcFe3uMEHMBMdxV?=
 =?us-ascii?Q?HZbbdk6N0MlNOn0vK1fTgX7/hRW/on2E0LGQELS0G8FoldzN4UaNsAxqRZHG?=
 =?us-ascii?Q?vwrjSeU/KvBiXAhqvX3186+WVh+olbXhavsuOweHN8xKMCYixihFq0iLTwdE?=
 =?us-ascii?Q?T+vhfFpQ3aqczNVCy1QLpBPpQkDeVZdN6HeUEqg14LpCcVEmY7q2VLHXlBm9?=
 =?us-ascii?Q?T/n3zgn4IC5g+0CfL+6H3ImeFxBlBH2fIKtAdyDGLsbnFJefigDcbeDYcWZL?=
 =?us-ascii?Q?acblS8O481ewI3rV/3J4zU/k6q+t/TNXmqq8q9JbR/cUxrmevnVdytFq5wtU?=
 =?us-ascii?Q?i6ff6VoJqgeCIrn9u9K1zmWyIErGfsZ2NNqjxGMkgknxwdGgSxysjxNpeLJ3?=
 =?us-ascii?Q?xkzSQQJsVA5NDzyDp/SEPTxyYHCXI9c5i4lYIjJ4jScX7QzhFZidX+HdhW+t?=
 =?us-ascii?Q?le9Hb+FePQMsvHVap/nAyg6yLCLv8xOHrqRwrQnmymDRZtOVGzKU4sTUysuS?=
 =?us-ascii?Q?235BmaJt8vmTBev7hd5Qv0A5s+dW4yhnXsrTsriiGcmsSpzH7iA1Wn8h7976?=
 =?us-ascii?Q?tIUGsAJi8LTa2MtUWZEBGSQ8kETEiU5M6s6JLd0Kl4PqX4idou4QIA9qTTPX?=
 =?us-ascii?Q?LIjGcGA1f0f06+mEoXVGR/DSqgTZsO8nsC+trv0Wmz4VwIXoRN37m8pMfFTT?=
 =?us-ascii?Q?Mdh3p9QVh2sGNxr2z7o8SmM0Z1gz7/jBmztU62ZXD8O05S/0npfN0YlfiQDs?=
 =?us-ascii?Q?Ek9/u7ZQoAauuAAXbpb8+OcpqlYlKzyHNZZ6w6XIFQs0H7jAJCZX12n+5Ioq?=
 =?us-ascii?Q?aabT/T2YElPRaz2Zq034R7pNmuj9IgkV4TobvU4Nv+P6DB4JUFUpl1AV37/G?=
 =?us-ascii?Q?kY4i7Fn/RAg9i9WMiYZRXk80CUatlvjiYop0dahVbAVbDXlyznsxoWR2XGfp?=
 =?us-ascii?Q?WMi914cGGs93rS4XbB0zxRarsAqn1ENTGaOZ1tAG0liG5idB2ce75ueuPkuj?=
 =?us-ascii?Q?PVNcK0ynS0s5NleLOTdjWgjRtwSwGVT2CFv5uoQti8A1DP+4YrB51TB60Yq0?=
 =?us-ascii?Q?mhjTC752FQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2de7e6a-82a8-4a66-969c-08da526913c0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 03:00:48.3872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jo90rOh9cD8QXgbW+SpJcUxb2VWq+OPTOymBd1eqZuV+Nzuyg3N0shlicuRUgUAY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0019
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kwankhede@nvidia.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 corbet@lwn.net, pasic@linux.ibm.com, Nicolin Chen <nicolinc@nvidia.com>,
 borntraeger@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 zhi.a.wang@intel.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 jchrist@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 alex.williamson@redhat.com, freude@linux.ibm.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 01:54:05AM -0700, Christoph Hellwig wrote:
> There is a bunch of code an comments in the iommu type1 code that
> suggest we can pin memory that is not page backed.  

AFAIK you can.. The whole follow_pte() mechanism allows raw PFNs to be
loaded into the type1 maps and the pin API will happily return
them. This happens in almost every qemu scenario because PCI MMIO BAR
memory ends up routed down this path.

Thanks,
Jason
