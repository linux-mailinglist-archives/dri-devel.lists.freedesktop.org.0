Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E115261A16A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 20:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4388010E10F;
	Fri,  4 Nov 2022 19:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C212B10E10F;
 Fri,  4 Nov 2022 19:45:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wt3FPkGX9Vhc2zfRec9vT1bSaFTLrDKiqgJWjeTymsfKt6DFNPDMwf0NBwQbQt2bhUV7aLF1JsWPn7Yf7iryQsRgq/z5/t/roGb/dH/+mhdv9S5chNoWVkX4ME8YqeZqsn7EOa9wnpqFQE2phv75rynufq7bI2U/0iLJMw/MznZkdVvslg4wu9f7NxTOwsPQdK05G43XrPgH07QJB/xOQtNnuxArxa1U3HCurFPfu9ypsGkVO0N5sxbdnyK9XqkJ4HwKrbesUkTullRKbPhN68XKAHh3GNy3b78PUGQ8GVro+KihOOoyQxL6c4wiDqBcWhzW4Ueb8j6u0+jZD+nvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMsgtloaSivQXkQieds3UF2nyUsE+Se6+LRuOwqxZJg=;
 b=BJU55+sw3YSwaNxlr711NHS0c2aOFTx6kpHzUUEK7nu6MowNMTRV6TzQ8BtklVfi+piMUPK2a2qhL7AwqCxgPtF3tNK0xp80SBdf821+W2QlfuwAC84sr1UUuSbr64Rq+K6aqePeN6d1FG6WvFP3inro2CFjyqhSLGnobFAAEkHP2232xm6iNHq/LQbrt68boqJOZkLofQQX5So0H0Kwg1TQYW+nDKHEKytru3NSEE4SXWFtA3tHGEiFqlxpYg8iXNnn8zzLhi3R/KbEGOuJx17dE/kmIx8UK1TErZhJw/1XJkE0/AvC2qDULSLTGVaPkGk9iYlXlgtFNAjkG2vAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMsgtloaSivQXkQieds3UF2nyUsE+Se6+LRuOwqxZJg=;
 b=JupPbwpntvpC/P+lIjGXyjukLGKyHZyDDQYotdTqxw/yN3whBOYMzfp8HWZ6TzCY/ojLp3keoZCJekkAsgHuIl+r2CDaK4wSTAD2Pz9IKjkS62bGYlFD7C4FX/GzSUxyO7Gg6n8Pdhl3jSTj3lGUAOXmkeJ5+YJxv5YAZeDyqlVdgx8tMddiitcaQ/NUslx5cM3roDNep8RothKTDCnWjZbpuXqlGx3RzlIQD7421ycEAVVUZlhFbyLSfX+VUgs9oIkESfRBA8RHTQV0Klls89yS1HKBKyxM+/3GNEiP2TITSKAVR3i0maCqV4o4RK115IBhTSQEpSb3TOpn6Oyslg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB5832.namprd12.prod.outlook.com (2603:10b6:510:1d7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Fri, 4 Nov
 2022 19:45:40 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Fri, 4 Nov 2022
 19:45:40 +0000
Date: Fri, 4 Nov 2022 16:45:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 05/10] vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
 vfio_file_enforced_coherent()
Message-ID: <Y2Vr47n3cqEWSxEA@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <5-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB52766FB4EFCFB2197ACDC1F98C369@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y2EQb6mSTKOvASlp@nvidia.com>
 <BN9PR11MB5276BC7EA64C4D4441DE9CB08C389@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276BC7EA64C4D4441DE9CB08C389@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 4980ff9f-49b5-496d-e308-08dabe9d272d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5csXMhjlxUCn6QO/CfNc84+VP9Uovhv4TuaYz0feTf4NIzccmOA3ETZJkBx40Aazo+0gMaEl5aKDenNA1sy+brwnrIqs5QgKkhpOnONPU+jYon10d9JAwm8HvAIOJhoL5On5PhaY0zWj1koQ6hh2cU2ErhTmOL0pu4ZNXbXY8WGPaFBCxc2FuG/JXiebzloAt1KEotqCoC/08V4l0ptmHY3fIehmK0TKdvZDwbh/El6oMOCkENu9s8tUFqXC+VVF8ipDz+m5/Mx15S78pIA+a/+94F4n68SplVQXBAnSLyyBJvKSZapLAtJehRtnufkUZiTJj3nsAgBTT2Z7cR1xznaEO1g/yd74MxW2Crg5TzjCAKYN2t7K1bBwHoH8wSwEbSDIRjk0mjZNJ6vnhaks13h6GwxfUzspEZZ6d6IXX3li/raD71vlnALTpN7gD1y8aYmLrbEt2EUNeImE1MyFAhCgdC20/o7pG7rrT0GCsU8CrH9QKkHOujpqmPcMiN+69RZIApIvwxSXM1Su3ija4DVmlV7GuoJCkZr3HRjY5IN8GCkoMvjIcpxBGvh77LLtmOAZvKv93TNfG6Y8QhZNlLMxUtBcKCmZf0L5zE7I/ENg8naCdDccSCpILh0x9EvxSOaiJsSixswpllN2WESgpA7EcZgj177o5k4IJOsAjhB9aiqJlMLEmuPDzYjDdjQ9r3bucqxwI5n2XCrZsbnKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(6486002)(54906003)(66476007)(6916009)(26005)(186003)(5660300002)(8676002)(86362001)(316002)(36756003)(7416002)(7406005)(6512007)(66556008)(6506007)(478600001)(2616005)(8936002)(41300700001)(38100700002)(4326008)(4744005)(2906002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hirQfcX7RNHv4TVjZHMhh94iGL8keU7Db+2UUPhy5hBSZzJk6dDdWSy+G0Gz?=
 =?us-ascii?Q?4FPiWxDOnGASrzDjPcHYiA4Dn2XsWZYmLc7zm5FQ6OjPJh5JD0TXMqcs9tU7?=
 =?us-ascii?Q?wFbE3HvPlz1rW2ddFt9Fef6aFlT29txAqoLlmxnC9m1gaUlNeDHEreR+BB/Y?=
 =?us-ascii?Q?kBVrvC+2AfnJBMvlg27YoktKPRpRNRpHtFNor2V65RGws1/Y5gmS9nFGMdMf?=
 =?us-ascii?Q?VbJ1HLELzvB3A/T1VL6KrZ270l5CdLfzwlX8eFmZ/bDipBbZMhd0rA9/+W4a?=
 =?us-ascii?Q?oDVV2bx803rVEF7aNQyU661vvsG29SyGzDEFHEhtZ1eHJcaqpFCuW1NmFD/4?=
 =?us-ascii?Q?QYjBCOcWrxcV8Q1boEkTVEN4as8Vx9g7fsO2iOZ9HcW/yDmqHApLByK+NzmL?=
 =?us-ascii?Q?slvNN5KUC6jFha4RLDFmjhlbQdTFf7JxoGhl71S6p0q07z3yWRaS6FzMusap?=
 =?us-ascii?Q?Ru7yGhU3eoyTjNeGh4vaN5PmzdzTHqDJqyZyGzC2m6hmPLSWTgxGuU1phz13?=
 =?us-ascii?Q?jVsLRNJox8A18vTzE+G0kyMkVGp5hKFC3hsGj6avwCc48Zqy4NxwbgoY4v/q?=
 =?us-ascii?Q?Lz+hW/ZIDSOCcscqEpe+EgHPI313pIuV3Hrz8vYg20wONVW3C4OuuhqySYSd?=
 =?us-ascii?Q?62tFY8tmlqTe2CjtjcJ7NWHgVxrdzGFDJzYGFIj/A6doqMI32yfy+TeSohLW?=
 =?us-ascii?Q?dOCv1uRdpVASi3j5+/YW/PTXIzKL4QUafdKqRscFSgs3N9qYstawsgeFohq5?=
 =?us-ascii?Q?7GphEpBieFfYe1hdZ6cjMDWaj8+m0r3DakzKOK8rJ2DPK+eeQ7/JucSlnzZP?=
 =?us-ascii?Q?sdD1N0XJLGISXlyeoP4jENke6vcvp3Os5jaBoZK0yK3KONmhVmXLHeOJi3Re?=
 =?us-ascii?Q?j8Lg77QY9+wvRQFCHXyqnfSqV6B1NenzLJw57QUqLToFwXq/FsgUKnd4MdZb?=
 =?us-ascii?Q?zunG//psprkFn5pXv0RQZE2aVipaXXg/qEo4nHo24Irj3lYqFUT0lBgq8LPM?=
 =?us-ascii?Q?95UyagzYDUJUugAYDG+pV6yf8ox9cdkdh5Oh7Quimucex2Y+YnUI4S4Z20g1?=
 =?us-ascii?Q?YyM6QPE90HDiYI8Ult9ms0BX6lNLsGlQmDQyNUXgTjMP25i0gE11x7Svyi/E?=
 =?us-ascii?Q?t6Zt8qkMFsxFilxkJGNdgGKBBrjdfObOaUN1kY9beTRvaoGa5myNeuJtkDtO?=
 =?us-ascii?Q?bPZInN4XeFo15kwKXdJwj3cK45VoR8VjYqmRjJDLOsJFjfxW3fL0x/jU0aRO?=
 =?us-ascii?Q?Rg7NB101QsaNl6FzgpSrwlxIbp/z1Ntr9Vg7aGQKoQkGrtibtAR/jKS6Hh8e?=
 =?us-ascii?Q?kBpi3Z6dsBJAPfTFX80c4jbjlM+3U0Or1c94uSls6nRi8nf9aKdmScHs5WNZ?=
 =?us-ascii?Q?m0ND1p8wq6/+J9Toe8s6Ez0nOLiCkARDlrpXJzvS/7IHobfICyMgGZT8o/06?=
 =?us-ascii?Q?dH80N0IwhxHJHdARSLNW63K0tAnyI3nV8G+LBN4aTt+FZhoDZxGx6ZnYqtPh?=
 =?us-ascii?Q?J1QmnZcq9iujfef9Ns0OosDIyNoRl6m9b/eEV5rc+0x+1K0K/vWy3+DfmAKy?=
 =?us-ascii?Q?Zpsg6+49Q/iBVJ0xkU0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4980ff9f-49b5-496d-e308-08dabe9d272d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 19:45:40.6088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACZyvLH0jN5oWLX5EfmH4mPPFqeoyRC0nWF+oxOCFJ9SBdv/K7FFwZ3O4XYzGp1B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5832
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 03, 2022 at 04:38:16AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Tuesday, November 1, 2022 8:26 PM
> > And this:
> > 
> > 	/*
> > 	 * If the device does not have
> > IOMMU_CAP_ENFORCE_CACHE_COHERENCY then
> > 	 * any domain later attached to it will also not support it. If the cap
> > 	 * is set then the iommu_domain eventually attached to the
> > device/group
> > 	 * must must use a domain with enforce_cache_coherency().
> > 	 */
> 
> duplicated 'must'

Done

Jason
