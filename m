Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D53D3AF2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 15:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA31D6EA6C;
	Fri, 23 Jul 2021 13:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5BC6EA6B;
 Fri, 23 Jul 2021 13:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ha1xDqS9GlYIdYIQqH/2+ht5UIj8osjYdu6GYxkVxkERKdNpGpwsEdo11knbmsowzpSNV7LYmdatuhoayD3m1cGphWCp/eq1RzFbavJYfFA10T9NKk/iAL8gFUcEJw5f6ZAh+pqRxpFDfZS7NyLQC99lvm7/ilT9gX4xkFi/WUeyMjKmo2EiOPg7AVudLdS7tWdMUrJcqVZ1WzhdC9Gv10PYn8s+EPHgx405rho1SRb2heUpSe9P+aSMTtpTxm1s2lhpAdn8L2elOAWXXNd5oZpcOAbPd3iOoou4joQZqlngZ8fpmHQ/wbRkk64X5nqd8QM3MMmWPYRBJGFQqRNcLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BblMBlHAEtcVRWzt+voSEyGM98O3boLUmNwIH1WewOg=;
 b=ZBF0Y/bIlQh4PlOK6WRetxzEE/ACU0sF4D1yCqwnEavyfxhgSCzxePGv/Rjp6FUA2fvFFYNrXFcByRjCN+SuLidf4MsMWKNTRwY8C4NDV3SSorKaj2A8NHE1x9F242Yj/pAL2FbH3iT9iEagUtztx+SHtZpExHQj59RfFktl/P1xgon8wreI1zpTIm/Ne92bI1phcqR+C4h+6BbQl1qhjP9soJX35xofyrIJ7ONW3qMMy4J0LgvJMadAGk6VwxDsqQ6bGwFNH9bz5kUYx7hzp6JtEw9k/1R5bpwXceDrAYrk2qj1cKMR9Tm2EhklG/h9/DnwRibPt/ca9iSLQhYw/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BblMBlHAEtcVRWzt+voSEyGM98O3boLUmNwIH1WewOg=;
 b=p5zSbqgTiAFDMFWjV0Ii4WumFvCci+N8aIbpmLNZGrp6tSpRcWPf9xkBKJzqiMLpiBF6xIVfe9zv077T3AAqMx/N+hETTJMzrS9wybrUIiG2TYslix0RnoA7otkm2fGkI0a26wzrELB0x1VUBA68cIjAqIdYZ7lz0n/klWTGRnr5OsXkL8sEKyiXyZp4zjgGTGdHc5kEAuAtGWB09RSUDthB127TlWtKUmkYoIpGlFFcvZCuKQ7fe+Zp5pdMI8tv+CEz9edvo7uu0uK1moeqinVovyNhnMiTu1x+YBysGYFaFr0AKict6msJ1mrLfhZ4jsp/D/83Guij5p/uCTZQDA==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5029.namprd12.prod.outlook.com (2603:10b6:208:310::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 13:11:32 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%4]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 13:11:32 +0000
Date: Fri, 23 Jul 2021 10:11:31 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 06/14] vfio/fsl: Move to the device set infrastructure
Message-ID: <20210723131131.GU1117491@nvidia.com>
References: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <6-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <20210723074435.GA2795@lst.de>
 <20210723122227.GR1117491@nvidia.com>
 <20210723122903.GA24436@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723122903.GA24436@lst.de>
X-ClientProxiedBy: BL1PR13CA0438.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::23) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0438.namprd13.prod.outlook.com (2603:10b6:208:2c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Fri, 23 Jul 2021 13:11:32 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m6uxf-007069-4n; Fri, 23 Jul 2021 10:11:31 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e4e63b2-9c82-42cf-50c4-08d94ddb6403
X-MS-TrafficTypeDiagnostic: BL1PR12MB5029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5029E1EE5BED239C960E3EECC2E59@BL1PR12MB5029.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UFS4cwvKN+5L+G6RTNbxIz45tV76yatYqPG2ZPAbpBB0wdi6FAT14DyC9WBTA6ba6H2iEhMXS1mKQ41JX41LGx+D2rmL8iTl40fHljEMdb+AikS/uba9XdwK9PekG8ZBZSwZk2sQISPIWD4Y/OITpt4ZDtJe+qGEs0129FVRtrLmo/7DjDBvAfSom3zL3gJZbk1TXuLr9kjQKZRfPdtMogwk9mncXdB2dnQ/agv5eB47DgLzlg8j9BInXNVbZ2M8ctqpp/Bz3iXMHAAXqx9iyIDjSUcsdKHuwVG1OTaIeYaIuF9g2Aqlpg36SF36OmrAIf08E5NG9kQf28BQQbw+hQBPaJgPRdceYtpS247kXRlIAKUI511HbaH/QzTOPPiufJ95KY+d5O+rKNDdMCdZwnHlAs+Q4a2oVFO9RYnBhDIQB7k1izyiXZZ245xhbOKZ6cRb7Q6T5hd/bFbaFJYtlS4YNXXwvnw6zkHQbANMVyfWNPT00o0kq+OUL9AdPMo1lnEYSBVm3NnaVlG3oscw8vSqyWlyWFkXI3gjZwfGSpbUHGHvndOrda83Mj7VDgLZ4D6/3tMytD0znLR15BJjtVJ9lS28wqw38wab7x45RG2/M3mg4xJRIYYn2QI7RJQJezejyobIaTUWk5u7e+hoCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(54906003)(66556008)(66946007)(66476007)(508600001)(426003)(26005)(316002)(186003)(2616005)(33656002)(2906002)(86362001)(38100700002)(8676002)(1076003)(5660300002)(7416002)(7406005)(9746002)(9786002)(83380400001)(4326008)(8936002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nzmES2H4Ob3kyNlzE9vbPrvDcoSs6YaYiAp5JYLp7c2JofJ9FLZT0ppgAZba?=
 =?us-ascii?Q?/hkbH6C7KPtsWposNHUp3aqyB+loAqICf6Eo7lm2vRlNSb4JjISo/jl13dTN?=
 =?us-ascii?Q?6dTOEU6B1MVKkRwUjRcoN34QjpapC801HCVAhIXP/02hZBusNCljiRwUR1/8?=
 =?us-ascii?Q?I75y5HRwfy1pwwSW6r8KyRfIf29hiPpEgT6fsGg6Mi3GUFI0TLjSPug7BqHT?=
 =?us-ascii?Q?+FmSOiWMajy5aPlmCL6bGqeZV89juG88N2rYK4U4kQ+Gc+1t65Uu+Op8GWDW?=
 =?us-ascii?Q?0NLcSDdBT179Dt02sY8hpz7HGPh/IzeLu2BWIZTFS0U2NnSXsaM++2JWSTXO?=
 =?us-ascii?Q?wC171IKhy2F0R9tpx06mszLyGmMHVH+mCwv8hW678ENpSr71fKuLzYxEEwCC?=
 =?us-ascii?Q?wRa391yZz6VdCU7YU1FxRcH0lia0us1r1s4o6IOftwBI9DYZh+baHGDC7qh6?=
 =?us-ascii?Q?qJPWZmnM42qSx0K0Mr1iyrrwa/0zRhTjmhQUECyCbDp4A/tSdW2h9KztxSSs?=
 =?us-ascii?Q?0XL2skqFlbBRchJvs9yrR5A3uEASmdrFB/i9xqPD2/DWR5sqfZ1LplpoddE1?=
 =?us-ascii?Q?qzaM04o0/5ye+Mfj2bEwAkz2j2sEnujTJH96x3OtAV0ZqRxD1Z1ZRAud9mQZ?=
 =?us-ascii?Q?+sOEzdGE/z2bjOA1wTVtUhcPQP9A2hSDcInbjRzVqo0hBih0ssjkSG/TzrqM?=
 =?us-ascii?Q?P7GZVxGMACig7KIe4QQxnu77wSF54vxXuYmZEQH1A7urWUheiNUiMDibwnm3?=
 =?us-ascii?Q?4uCRculMIFEuecPFPm9ezZnhBw9EginPr5YMX7mBUcclFgK7/bQ+lqKIhjtn?=
 =?us-ascii?Q?op0NLSuqs/Poj2jY3rDgV4JqPWiBKEZ1bSMkR1LKIm9tLkqmg1AZZStxBJqm?=
 =?us-ascii?Q?Dw75wd5CklRuhSn9EFmhcONoyqcFl4Km7LI/k923HiCyaN7+ck/MMagjRMHG?=
 =?us-ascii?Q?TTDc2c05cISjXi2wzWmmFYF9rXFhBqLfB9wjSr35BXySfRsvLxuKRif4H3Aw?=
 =?us-ascii?Q?72BBEXWt5ZCTXm1wSApSsw3toBGK2xUfn5OlIXEG+Kau3VC946cBNawJG10X?=
 =?us-ascii?Q?GYyCedJ4/n+2kaAvzm+AKOMM4TF+ve3BHRTU99KwrC/Nu6XbRD92HKbao89u?=
 =?us-ascii?Q?JIo016+yRZAJK5DNo3hAykrgXih68boymfDo8m9RslHIziSf+3I7T5ib2juf?=
 =?us-ascii?Q?F+uYdffK8lqKEX2Apt4QBsNEo9hwRbTuIwMySbU9POv7whwSokU7kxED9brp?=
 =?us-ascii?Q?M8C23PH5oCEzzEaeCk/Vp8YkVh4pg2nXdb9XRu14B3v1mDb3x3GI3BJ1TaEM?=
 =?us-ascii?Q?+G12hQyszLB3tEiTcjz5I10p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4e63b2-9c82-42cf-50c4-08d94ddb6403
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 13:11:32.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwQfCh6DXWpnLtj3OkGtLzJvydnZm/PhXUWkBrWfdVqBwc2FM4b+UGz41JAD/8yY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5029
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Leon Romanovsky <leonro@nvidia.com>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 "Raj, Ashok" <ashok.raj@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 02:29:03PM +0200, Christoph Hellwig wrote:
> On Fri, Jul 23, 2021 at 09:22:27AM -0300, Jason Gunthorpe wrote:
> > > But do we even need the else part?  Assingning &mc_dev->dev is
> > > equivalent to the default per-device set anyway, isn't it?
> > 
> > Not quite, the default is this:
> > 
> >         if (!device->dev_set)
> >                 vfio_assign_device_set(device, device);
> > 
> > Where 'device' is the vfio_device itself, the above is connecting to
> > the struct fsl_mc_device.
> 
> Isn't there a 1:1 relation?

Yes, but one is a struct device * and the other is a struct
vfio_device *. They don't have the same pointer value.

The above default code has the goal of creating a singleton dev_set
because no other driver can reasonably obtain the 'struct vfio_device
*'.

FSL is using a 'struct device *' as the key and the interesting case
is when two drivers are loaded such that:
    mc_dev->dev.parent == &mc_dev->dev

Then they will have the same dev_set and the locking works out. The
vfio_device * can never be == &mc_dev->dev because it is a different
allocation.

Jason
