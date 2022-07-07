Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4B956A8F4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 19:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988CD11A846;
	Thu,  7 Jul 2022 17:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755CA11A870;
 Thu,  7 Jul 2022 17:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCW3Mar/r+1CQY9xdq53VVltwc9yXij9fMTUpUjkKEwz4RP5Zm207lOG6wVbd9hsZfu/EdiPUY7/DsLeeHn1fl5km/zC78UwGoWNhVKKEcvsX50ISrV+EQn6wYknNNfyQyfNCx1peneBDspoTOPw5wpLqEqKcuhr33BhrcirP5jPZSlcV13Ai4SKnxlqF1nPypIGyHeuC0Pq6QYGxV0VFkvbNta0BeB2fPK8W7jcipDbMh4Iri+3dtAbK4rDN/39QFjPHsoR4ciZ7trnXue0c9C/VQBi/NC5HLLUf86txhBn3LI5R3NcrtmWCAdGoKyKcOHy+iPnOh3o86z9KS5kJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN44ME50kgo6d4CgabURsu3s49tmnmTpQ6RmK36Ur5I=;
 b=fIF4Tf3UgXlyFK0VjExglXzu5h8kp4+jS+tzVQn1xL+GzKvKDKal/MKXVHaEUVwLiS8v/zGEuLYls+M7epBY7LgNRgJjOH6yTWWNTXxx3Igq5nJiR9PkJu9XUhyi1Mv9zvB4NOxLPvkIK1z/mBXHuQkSnorpZ/kF91lRATsHWRGHOyeJKHVEhH4yXfD6BQBtxnKOT/w1u2c0DzcuKHh8kn/z8CAI9kqCjPwCiQL3VEMndZL22R/voPo8xdJDyIVJHvNTicCFrhafn/bimm+SxN3kQydhxsimliBfScWCR5JMS3AyR/Em924MrGXl8hf7xbJsoBBOdpGIiBIjVk41zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN44ME50kgo6d4CgabURsu3s49tmnmTpQ6RmK36Ur5I=;
 b=d7v2BDTx5aQhJ9V154p5AuFFGacNCgcKEPy+KhQBTCTyKwoclWC2sSWJBIqqoEbRVvjtcGMDka8S5orno0py7SMRA1lNjiEy47JjsZyihhNakByVQeDuzhoNDniNIoW+k9dHHyp4VwYGbdvMcVkhTOkXuD8NTzQmP93Ce9pb2O+1C/gNQIa8b+Fu0L+w46aXPgcPoxAnOtyJPHKNZHZcrumI88CDL3vCJ5pIB51IqBjpcOky2Qg9kBLY17zKfDyszRZ/IIiAxtoaeRP9bfhkrKHy7C7E9LykrEGGwaSMWUdjNK6vsgypCKkWtQLIsnD4ephGkVHxKrgjhXmkn4OJmg==
Received: from MWHPR02CA0006.namprd02.prod.outlook.com (2603:10b6:300:4b::16)
 by MN2PR12MB4286.namprd12.prod.outlook.com (2603:10b6:208:199::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 17:03:31 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:4b:cafe::8e) by MWHPR02CA0006.outlook.office365.com
 (2603:10b6:300:4b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Thu, 7 Jul 2022 17:03:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 17:03:30 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Thu, 7 Jul 2022 17:03:27 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Thu, 7 Jul 2022 10:03:26 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Thu, 7 Jul 2022 10:03:25 -0700
Date: Thu, 7 Jul 2022 10:03:23 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFT][PATCH v2 9/9] vfio: Replace phys_pfn with pages for
 vfio_pin_pages()
Message-ID: <YscRU48SszOEkJML@Asurada-Nvidia>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-10-nicolinc@nvidia.com>
 <BN9PR11MB5276AD70E90F20A3439883A58C839@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276AD70E90F20A3439883A58C839@BN9PR11MB5276.namprd11.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd61a924-e745-4df7-ad18-08da603a9e41
X-MS-TrafficTypeDiagnostic: MN2PR12MB4286:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RAIC8TRt8AsxXx44d88OORahKCsojzwP/pUrYn8GIXhIWGZY/2IK/nhubCtLZByaXoYydAVG7vsKifwY0DI90bzgoBwRX3rgNgQ62qnVjENlnrbVlJOmZstLOVKWyLXiuB+wjPa/5wSVrCpezBfelnvM50x5jyu/rPAapHWsORVzyCrKZUekBPQpBYzzqYA121j3ELWxTBlf0R85Cj73GEjrFomjrliCD6l2AWhPNmN7srnMAkATSqhdAHGDQmpKjtr5A0txtkUwvxhdNZkcWLhcEEDZZ+Fim0sIptcQ3+7kcXbjV4eW10dLwsL6DeOfFSL3QN98xOnbecopwUDSK8eKXWJKzNCeBkFdDfisgCY5HWUA4Q4F6QvxKvRNErSABdMVWNqffFe26BMnOzPKH45Oh4QP9pNd2UqoUnRJ+UBUMdT7NNdHdncuJtmnCe1QOLShACMdZSik4SMjtCFuYc1XIxWo9DgyISblv1OlHYsjQof35yXZrAfz1jyDOFrHtQMIh8fF13uphm2GJZC2+iKygW+DlOA88FNsQrN5VXvPAieQE8RSxMRxDVOqQDaAETu+e9Oo9M1Qq/cQvDYvVcimG7hsBkGut/TV/7Ww3SGvn1Zu1Tj03XCf7TbjJO6WHtaI3RRGaLcM7uofcIIYGNhrD7sZHvnOVudwjf08WMLUvqVBbFJ+Erc/JVzsefzYttHD2A4oJlvzBbRUvDeJXYzlxlUHaM1nDwUxgEeuo3QGsjhhG65+fZMkCQrkdjk/JQ4amYM+y1Z3FlbvC9BkfshrJbt5yByil1gdJ3yZ6LV7IzsUJQsDvTv+qZX2GGK7mqItzXSedfoRbpu6L13xYKHRdIX8HCCt5ORD1QspXU=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966006)(36840700001)(40470700004)(9686003)(26005)(2906002)(40460700003)(47076005)(336012)(478600001)(40480700001)(83380400001)(82740400003)(186003)(55016003)(8676002)(81166007)(86362001)(70206006)(36860700001)(82310400005)(6862004)(8936002)(7416002)(426003)(5660300002)(54906003)(33716001)(316002)(41300700001)(70586007)(4326008)(4744005)(356005)(7406005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 17:03:30.3633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd61a924-e745-4df7-ad18-08da603a9e41
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4286
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "vneethv@linux.ibm.com" <vneethv@linux.ibm.com>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "jchrist@linux.ibm.com" <jchrist@linux.ibm.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 07, 2022 at 08:49:28AM +0000, Tian, Kevin wrote:
> External email: Use caution opening links or attachments
> 
> 
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Wednesday, July 6, 2022 2:28 PM
> >
> > Most of the callers of vfio_pin_pages() want "struct page *" and the
> > low-level mm code to pin pages returns a list of "struct page *" too.
> > So there's no gain in converting "struct page *" to PFN in between.
> >
> > Replace the output parameter "phys_pfn" list with a "pages" list, to
> > simplify callers. This also allows us to replace the vfio_iommu_type1
> > implementation with a more efficient one.
> 
> worth mentioning that vfio pin is only for struct page * hence the
> pfn_valid() check in gvt can be removed.

Will add that.

> >
> > For now, also update vfio_iommu_type1 to fit this new parameter too.
> >
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Thanks for the review!
