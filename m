Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD46203ED
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 00:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B545010E08A;
	Mon,  7 Nov 2022 23:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0EF10E08A;
 Mon,  7 Nov 2022 23:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lY1YgtW0ATiDj1lldme6ZNlHC5njAhQ8OdNr/zbWFjmoEkRIpcKpWCUnmrKzu0STlMoAUPUdFaWMDctrRLhcdB/XhrS/9gbys4Q880WeKTZB0fEbFJtlMlRfwCWMuF61U1y0OWPvNm4PBsVOkrAUaxO08cWPn4fvNFqvyO4qYhHtJeDAkeoplx3YssvDWyhafQd+d8aUXhhOmeshk9uremCjxcygQRA9Ou1Zn1X+CT3BkjJ7ufWLV8LIWpljbtRAINy6jzuqGrlF5RLyMu1EkddRjwLrehURB+4Kr6FnYVW2dHzWGhZco12r7TsYIcjuqxDzPfLWh/hg9kSRpsU1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiaZYX3gHWEf7MSSHuq/Kc2LWU0eiwCCSed5eOu9Pj4=;
 b=HtYrvpIGzmoeZL+A1s3xfPQCRRhC6jmmzzbELSdHW6NXhBB+HR6FL0AUvoai1t92v/xPfu8yMwXTnvpW+X9Ea/UPKainJqGtZrH0CQigE/01ASDPf3sY5ZL4qOmzK2sGuGPFeFtGxlPIkIqnxnFbSakSUpe6HaZ/mc6wa8I7sS0rgByN8BzQr/OyebN77suWFYLW0ebpmgehxpnG5h8ExwhXTt44EV9Htwzgu9cqaa4ys5jaEbi5udBTbkEezSs4oEin0YBx31ny0EiSYrL6BN6FpeXqd9sGgw2si+Tar9i0+ZnjFigCQmmGmHi4cpw+D54OM1Yca89n90IfC2UG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiaZYX3gHWEf7MSSHuq/Kc2LWU0eiwCCSed5eOu9Pj4=;
 b=GeMExQ/ftThQo6SZIn7ZtWm33N1ci6wCtRFRyLXiUib/fWtuf+ObW0L8SDic1WuWNogDgnmSY8Zx0slIpKVmsUs0luagtNidLOShOSStkpDITyGjp/+1LKocpp6RzP0HzbJ47HV36yJzIxZLwNBxGLCybHh80nevK3lzZvFSjY99iT7FpgPZ5oV86SmpqxEFLiXDJ/t0BX2F+LiyKc7mqfrQadCsWdJ7zQmsbW6R9+oXSB2aq2y2tYN0FcDrnXwMri12rzw7ZrS34mr8NJ6FRCbUaIuu0cd+0xaFxP7DqWA+xIdc1dajQHRCadhqdw6isNTDi+T1znC8bZcvbfgWCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL3PR12MB6546.namprd12.prod.outlook.com (2603:10b6:208:38d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 23:45:48 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 23:45:48 +0000
Date: Mon, 7 Nov 2022 19:45:46 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH 06/10] vfio-iommufd: Allow iommufd to be used in place of
 a container fd
Message-ID: <Y2mYql90K/Oi6BIO@nvidia.com>
References: <6-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <58917b42-bfdd-c352-4b20-68ff135f968e@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58917b42-bfdd-c352-4b20-68ff135f968e@intel.com>
X-ClientProxiedBy: BL0PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:91::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL3PR12MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 04398a0a-3466-45d3-04f7-08dac11a31d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a96fq5yuUwXrAo+E0kpDxlHDm54AWEnVTpyP7ExI5JFlIOsIjE3osvwjrBbAg0CQKkqNGoJ8Ps9Y+H8ykcH4ionDmZFBlG3uaFJth4xxoNyCN8COnWrKdyT8vq28PQ/y7ZYEbQ3fBDQGEr3NgzNKZAKuKv3jXRC4I/C/OVjhXbmEqoCrD2XesGWznJXU1xVDXNHxCQym/ue5pdHZWF/HzDH0XQrnmptRCpeMjYhzA6gs6rLMwdxTywnL6WcVx8wBBS1RxmO/eEnF8LvC83koh3Dbh3Tnqnz4W10ttzl1/zkDfCiG35qCG/SPQlGliZKYfII6QmQG5ZnbI/meGX8WrVnTR1J+EhEeUk+C1cbRut/cDcdmO4CiyzO0oO+XA2kM14St2Re/B7DTcmzW7nG/H7LSFHB/gbiRbWgtzCz1vMibmTXvSzXDiKbpnomRQ0fC8gnT2Me77TUOKQFxRhILIwGQ+vi+vtzG36iSScqLnCxR9f6TFbtsB6uYYyXrNa7BV6YX90GxRadN1/it290ZpYXSSXiCAIxe3WjUcgWsWlRgEHPtoKqJFTYwF2tl+VX52qyvuNymtgzmKv4ZkZ4Uhe5dTdYBx+bdUyaLx2XmRxt8+ooS1B+qlqJpYSvaEBgtZesLgdroEp+xxvzW9fTvuSbak1hrRIUAkqmHUF9WMJDZoGcmxQzLRewF+g/6uGbNyJm7hiboHrqPOjSTaXr2aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199015)(53546011)(6506007)(186003)(2616005)(6512007)(26005)(107886003)(5660300002)(38100700002)(36756003)(2906002)(41300700001)(8936002)(7416002)(8676002)(86362001)(6486002)(6916009)(316002)(66476007)(54906003)(66556008)(66946007)(7406005)(4744005)(4326008)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rBLnO6XxDwmeKmg7+mcw12qC8Bk6/GI0M6U6zSGfyIZM4o8M7kXepUCoNDjT?=
 =?us-ascii?Q?kqODNMzkupSQ2liO3loRQ2vsqk8XH5L4vPofvdafCGb5q8lT+5bRmj/uISfY?=
 =?us-ascii?Q?3CNecZ108Xk+8uToJCKOzFSs1LvnyYN8AawLcybtzDRs2nfn043cgiID14/c?=
 =?us-ascii?Q?byubRTsqVSuXjxEW/o10WQlPNepvR/7bx6HiPhaCPDp6rZjydFG5U2l+txQ/?=
 =?us-ascii?Q?+fagR7qQkwMpFQ6SOUmiCJdAK9xIUjnyJ88cM0fxasQm0fbE19snlAMTUI/y?=
 =?us-ascii?Q?j8kRRmoZH7G3JG9veX2PqwiWcm8ydGawpaZk/VJxKCNFA4Eaye0csNkFAa9L?=
 =?us-ascii?Q?a7ws/5/K04qNFafn+hoZRVOa/gUrkqMdcmBdaeNJKw8UjPJ05+R0ionxm4Kg?=
 =?us-ascii?Q?COvZh0TzSPzN1+Xeq7eN0LwEJDojMjc3oEBCsA7SwVBgaRhepQl01Q5xMeE1?=
 =?us-ascii?Q?AP/0EJqTm724vcvvf80fhkXFk+F6q1BAD6/kcUEMzc4sn3SFieY01soUf2J0?=
 =?us-ascii?Q?sdMsvqqFHo/ghAIrbZwp5DKjt30zKAYHiTjWqOGbHcWTW1qIozkBnsLogr08?=
 =?us-ascii?Q?GQxhUt5V9PMo9qPhqbFbOzQ3yMrUNtXGYZlH4xDM6gNxZC5WHVH7y6cnUmvx?=
 =?us-ascii?Q?ENxBR3blXXk73tHcCTT6QFgzYreZCqo4RJ45k8CsBLCI2LOtMBI6CiItyZHQ?=
 =?us-ascii?Q?I7aFWcX01qJchNuiEoThF9RWB7/Qd/QxsrleSoSy/tTaclG39EUHkyUrFHSd?=
 =?us-ascii?Q?1J7P+YCmlD7FDLMsNSGQJINKKP+wXPqW/leEzpNBcx6Jy0p9ozq6mf8IunGg?=
 =?us-ascii?Q?ta4Kd/zMrWNEPF0t1lIMnPWm8CCQUCaYiO2JVs0n2Knil0PdGy9ZOkjRL+c7?=
 =?us-ascii?Q?RD8lpvKyMqnD+NjqeV3QzKCnOsDCZ+06zKXbQpZt3dz4jza+5rvqvFsFdCM8?=
 =?us-ascii?Q?ykgZusJuFkb0fgW0Am47GC4SgEfPmywysn+rSP+uJihqU5AMPsnpMP3J8G0G?=
 =?us-ascii?Q?jSwt1ajx0almgU3SI3V/j8Oj3Ei+FyESc2lxIfz+MRXP5GKRXo84ayzXzaSt?=
 =?us-ascii?Q?kyIljCacLYDAIefZfclNLIwQMNJ9/LTNdFzILZQ+FKtU9tJVZ+FmuBpyR5RE?=
 =?us-ascii?Q?XwGjPRDyfhWhfi3Po+q1s+twaCUBNP726GqkVcoJZEifhQpJxE24YAN+WFUp?=
 =?us-ascii?Q?ovc1386JINOO3e83rrwrdU78/tYtJaM7OUMkk/oRNw5patKj8oTEw8sq064r?=
 =?us-ascii?Q?g8oU6P+lb07cBQqRC/ukeLu1VEUD1kiPvuAzHaZyho/vljOpTA9+c55I4j5J?=
 =?us-ascii?Q?itmm/OqeFChpMM6kfY16D/H6xtcDCNENvtjUBCAhbV2p9p+cZ+vSyaZZNTam?=
 =?us-ascii?Q?bd4RFIjJyCZTjl8hq+ewTtTxWJUAwsZvnvVBMHVWpsvbofT8GxGjmt+HWlco?=
 =?us-ascii?Q?yoKCtuW+8w6MR2mvifkrxhvaatD9QCApoF0Pmn4u9b8kk/qCyRp8Mb2cExSp?=
 =?us-ascii?Q?l7/Jfn1WbqahtHKQoHQGtGfW/5zeQPdARJ6Dss4qEsn8N4Atq1KRjYNEil4e?=
 =?us-ascii?Q?CVvAfx0AWreWm1RGDGo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04398a0a-3466-45d3-04f7-08dac11a31d7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 23:45:47.8331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTRPO2ldXTp0iP9x7vE5HspCEikCBAiToECGgIcLu6xM3OSSS9kfqRRKRlzPr+eI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6546
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
Cc: kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 03:28:20PM +0800, Yi Liu wrote:
> On 2022/10/26 02:50, Jason Gunthorpe wrote:
> > This makes VFIO_GROUP_SET_CONTAINER accept both a vfio container FD and an
> > iommufd.
> > 
> > In iommufd mode an IOAS will exist after the SET_CONTAINER, but it will
> > not be attached to any groups.
> 
> is there any special reason that we cannot attach the IOAS in the SET
> container phase or SET_IOMMU phase?

It is because iommufd has been deliberately made to work only on
struct device * not iommu_groups, and when we go to do the
SET_CONTAINER we have no idea what the device will be.

So defering the operation is the cleanest approach.

> >  From a VFIO perspective this means that the VFIO_GROUP_GET_STATUS and
> > VFIO_GROUP_FLAGS_VIABLE works subtly differently. With the container FD
> > the iommu_group_claim_dma_owner() is done during SET_CONTAINER but for
> > IOMMFD this is done during VFIO_GROUP_GET_DEVICE_FD. Meaning that
> 
> s/IOMMFD/IOMMUFD

Done

Jason
