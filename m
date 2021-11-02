Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19CA4431CD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D832772F8F;
	Tue,  2 Nov 2021 15:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FC972F8F;
 Tue,  2 Nov 2021 15:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqF0zjxcVgShwpWiSA2aiAefFU8+phP5RCxdZ5eupZDfLyHhBbhlIT72wpJDFVdgQHrQB/2WhIqRNZvPTHaiFPAdV80NazIONheMR0B6IvtiBr1Gy6cllNf7jjZ/CbL5ZQJYyCl5LXexON0G0ID1P9Se6ydXX2PGjZb/sygdUNM5PIWHTaXyPHUxQBWDjYebcKqayaAXGwqYLxihl5ap75SAnMC9O6hm91m1vAGOmyMxIlWoQv39M7yCsgSkx/A3uOHGxP6u4J8EpRWDLwoCbq264HF7vGwFBKzCrAuqcXCie/xo4VUKrxgYYv5bGkTbw4ECTqygr982ysav83hHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENzRM79VX7MqD30fE5giVyaiviLZ1bCUkk+lGeQ+vbs=;
 b=iZP6xXWZlO+2RtETOsyCvgg6JXE5VnnxQNg6UJPx+w2n1TUKlmCcstM57x0Bj3sLfRZncu4F/3NoyvgqplvxDmNzUarLNTL71pvKMZExS0uZU1NHEXlCGG4htBPEsgRO6gk6mt2cbk/pp7Yg1fzyv4+tK1iOXkSyHnOy/vEBK+Wf3KcOS22H4IlywV9lqXh1cBl+zB/2s4IkAc4mD0BqNph75x2nR39shu5J58muPJ5cqfEpEw0vivym3opR1J+AnbFhxUWtVQB3RvD0HR1w5CtupMBAfxltYlglIAZAskIn57dGmPrvEb7w+SYPOC0vKoVNO5pdmfiqgC8uwKZXrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENzRM79VX7MqD30fE5giVyaiviLZ1bCUkk+lGeQ+vbs=;
 b=cbTNZ3itZjjJtUOunBA5IaY9UnNZZd7Pybkbyy/9egh9/flIKRsBLEe26fEO79JTVKwdgeZ6ikxBQ4PNT35sEHC/Go+3gyaNpUZths0RF7TH6sndqBrSIdpe38EKKJGaxSf85mLefWmugmvJ5COD1ON20Cn/2NNccpKWJwP0xZroUvenkATMfXWTWoWFeSSLawIeVWctdxGHt2PiF2cEuC7q/4wC+YTeMAIySb2knYQv9yhSY1AK+95YBFibMTBSO6F5Pf3Q1P2LIiRTdz0rRRbbEb098RRI8sLHKUEdbd2OvscvGGmPwdCyksobIF9manmtxNVfwcQX1r/uxxPg+w==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5361.namprd12.prod.outlook.com (2603:10b6:208:31f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 15:36:03 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 15:36:03 +0000
Date: Tue, 2 Nov 2021 12:36:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/29] drm/i915/gvt: remove module refcounting in
 intel_gvt_{,un}register_hypervisor
Message-ID: <20211102153602.GH2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-4-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-4-hch@lst.de>
X-ClientProxiedBy: BLAPR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:208:32e::13) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BLAPR03CA0128.namprd03.prod.outlook.com (2603:10b6:208:32e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 15:36:03 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhvpS-0059nI-Ib; Tue, 02 Nov 2021 12:36:02 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20d75093-ace5-4b99-00e4-08d99e167a8e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5361:
X-Microsoft-Antispam-PRVS: <BL1PR12MB53615836EC31F9B8A8002259C28B9@BL1PR12MB5361.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dTxKQYs2NuPVDGUa1G2zfzSRrhvbDFZXkXuzvKAqUrmTNlYBWISzud4zILmqY/Q3IPRWGpYWIp9zlQXYp4YywAVMGY4jpcCRuuoXT5CmEiJef+GDpG8wSD8PC9/I7DMVbAHKO8ny+lh03tRUZlRg93N5K0D/sK+w2n3yJfhgMBJ82lDc29gdZ9ZgVrXup/VSdR11A/90joEObJ3GIO3dHre1DmkERmHczU8RWRFWrusngY2ctHYdbCjN+9ckdRAg01cxlceA0DgRvU838nXQvkwHYWZNxt7XIf0vdxadt9gpbMUJeUfQgBfmwvysfYhU865J03dDuUpcqRVmHxNEuTIE+LqKV3uDnWckhILjw7SCMwBT5rTD8cEiveMQ+dSHwMH5IK+ktw2HCgg8n4hyf7rGlcbWQVezyXDIiD1IEvIzHeF1f29rC5qh0eeUdSybee/GnDNiOGbVtpriiRNv0dXsG1vSm1VleT8UEr9posJWuL51R5PsprdCG1/gBc9Va9yutWCCqw1MvvWcQqZUxaaKBtSDFdiWMKtz9pxx8wofKmUBABdMGT2e24q/LovEIohdPl+yp0oi4ncQmIhc0gVBO42Ap+NGkF1/V0S/PEtbF+wecj59KuwW27My0dG6aGEgroFWeml2Aclq4KmxWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(1076003)(66476007)(8676002)(33656002)(4744005)(426003)(186003)(38100700002)(36756003)(5660300002)(6916009)(7416002)(9786002)(9746002)(54906003)(4326008)(508600001)(86362001)(2906002)(26005)(2616005)(316002)(66946007)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y+lLpPufRL2a3IAnMibxe3Ee2fyfoUJCiYGsegY8A/jB6F1Nnv86OBMZUcSQ?=
 =?us-ascii?Q?4VMRyoeCGYOhsCfsUpDqsg/TZMJzcCjnn2mhXj61XdMftsrcdyam/HaJs8nP?=
 =?us-ascii?Q?/OGWZCE1t2wrFy6V0aYKrJeAnoXVVWQFiQmru5LHLb8CtAKZYXq1weIYJJz4?=
 =?us-ascii?Q?cPIok4MitZkNUWFikdHiPtycqrtIpil8NF8dg1ocY9bOIhp/cUNceJpWUZi1?=
 =?us-ascii?Q?xM4wN+zsHt1yUB9VY1yBCiF3YroALWvWHzvcfRzUM78nS2Evfl4A9U52GMqV?=
 =?us-ascii?Q?01eD/t23avmSGS1vR6CTYDncBoHImxEJv4Z0srNdOg8dtUo8EQqc+taZC7Mk?=
 =?us-ascii?Q?jGZZ65Zu217v7CaFVwK0rmzqxOQSPmrntyrrxS0DxRzV/nH5GgRZvgncgtZZ?=
 =?us-ascii?Q?NEDCd4Lu9MldvJg36QT0w6EAZ8fPu1tPjb/BCYusvL4HmaorargwPJOc32fV?=
 =?us-ascii?Q?5QcJrVbwvOvE7YW0kiz8YfwzMahUBptMKjfZ1KVyU5kVXCaMSw4gdrfblVMh?=
 =?us-ascii?Q?yakTZ+lAt5Z5nF10zH9zdgD6a6qYa+AVIeT2EwwWRI8Kmi59ddipUnB0tySI?=
 =?us-ascii?Q?JqmsZCn8ekgMQOwDj8OnsPvXAFUnxRrqLUfkClvrH9MPqGFYaZUU7yf/fap8?=
 =?us-ascii?Q?hTmtf/tp7vuQ1syXWAWE5psH+xGx+/as91asJoRhLEiDJsHY5aBDEdBPUD1k?=
 =?us-ascii?Q?G1nj/er03xhsIl4L62K40sWSE0q1vw5XSqi2UepKzu2EeQVj4dOkBnAjXRff?=
 =?us-ascii?Q?TsRA2tDXGNNb0crvzvN4gzKw7x+y7wbMtP9VO0xX34Q1ETQHScrVTlg/I8iq?=
 =?us-ascii?Q?QhXtt8ln5/l8Fv1prc/Ucczn9jMr49scvnKpy9P0qoyXIrGV3GPTg1eVMUci?=
 =?us-ascii?Q?n4ByZ7rzMTqsxzXelgFR9Vi0antloOkR7Cm8ZZCLRK7pM4vh8h/N/iuv2unT?=
 =?us-ascii?Q?P+PQcxesELpS+MlF/t/RPYaGgTqVVtXlQMnxez76ROOJ2sXznxsMxbRDGEEa?=
 =?us-ascii?Q?BjapVSRchSTZoUnnZzz8o5GzBOgoHczesHQAQuTrnljXG/sZiOREQ6ScS5IP?=
 =?us-ascii?Q?cKKfve14mkXXkJttTGGMlw5DZJ6PKtsxa1zVXyKQ1CbwPjYy+LieBtvodXfa?=
 =?us-ascii?Q?elSkRPZQCOlE5Sx6mE5vS84kfFdO26YamnO0Bz134pwI9vL0fTSQ8Plt2HNb?=
 =?us-ascii?Q?pfKIzsF6VdNFXN3SYkKWcVk6zQq25hayahKU4nODGke8GXf6R219dTWQ19Bp?=
 =?us-ascii?Q?EtdGakvVREhJSJgMASdCnJDFPP2k9wRWfby35qKumcRk1zOMSSk7bY/0cmfb?=
 =?us-ascii?Q?D+Zy3RtYT+LW1yACbGBqNl/E10AKXSl5RqFh9lNWQ/6A68jtaDidPzWdLQJQ?=
 =?us-ascii?Q?VVtGtRycH14eEQqPRA5L0JoqXAxealiG7NiMr2/MPAbTzRU4pCqAPsIr6M2t?=
 =?us-ascii?Q?x21XQWo5ySLQht/NeVYBiV7+hgvYMlXw+IwdY7jbpxcesa3cXKSsYM/rHOdJ?=
 =?us-ascii?Q?ICwG5THuhwt96kkB+YzS75OsRFsYxzroj90d0offfS6SjSrE6A7JFEshQNdh?=
 =?us-ascii?Q?zfKNOpKZkioVesWABBA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d75093-ace5-4b99-00e4-08d99e167a8e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 15:36:03.3983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txZfwG23qtVzsOL1B/5BZu/qYCKvkKE/f06FaDUSSQVVd4pCT3PdWg/D2LHR9GOU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5361
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 08:05:35AM +0100, Christoph Hellwig wrote:
> THIS_MODULE always is reference when a symbol called by it is used, so
> don't bother with the additional reference.

heh, these functions are only called from a module init/exit even

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
