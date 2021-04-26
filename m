Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C736B8E0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 20:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1187589E5A;
	Mon, 26 Apr 2021 18:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB26989E5A;
 Mon, 26 Apr 2021 18:26:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dgp+Fa5c8M1zniNpNntvRkBoHl2YPovZkYZUTzbmP1oT9+NOKHC1jgH/+QOI24X/2jmPKov1LN99/vDgrM8nrfCmNSa8tA9SUgNWz/vXEllRJY+i2ogUYOF7wHRqKs/U3C+aaDWpt8rRJYBkzDBQAGhtSERvq3y+XFuNSy30gwa4k6eEXOYgFXf/TxQdO+fbEZhssIQemcbzq19yOpOxdp/URiNRKp1a6Ihr6sszWfmgVEiXK8w17CprwQScHblqUU389YZg276k/ScU0nZF4RFY0BzO7Ka3bAca6PNVv9+5cczBu01uyou4w2dS9AMh09D7eWXflL/1EE3l2/bJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwBACwtQf8D0tSrEHDM/10Oh3TlQXJ5AFZ2rAahhq6g=;
 b=GWdcAi1qO9w23I0aVjtwY6Mvm7keNPoBxZeBR9hG/g/D5hdGZMhdV2BzkTo0Ly12wcA13zePVTylNIjd2gJPYG78Qi59yaNxnf0hRAlETS5AL1Ml29CzS2NUQCUtGNkvPFnVvwAv2+8+4vNurqCd1++gn3Hq1OcrJ6DMqVk2yOSPNiZ3qWUJRqxOt9M1peSD1uGUMgUGEuNgPu5P2+pRSMrfoImTFO6Wz0KFY74YHActS0WrNEGXeFtLKTUjkZjnl7pfQeo/OcI1Q3yOq+mdbOxyTjQHcKDYLtAXZKyj+wNLu7L+LMZ6+YGNu8wb1IgytES6XjmgR5qXAd24G7b0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwBACwtQf8D0tSrEHDM/10Oh3TlQXJ5AFZ2rAahhq6g=;
 b=fGQp72EuNWK6nsWK2PUvuT6Hux0GeHaClIw8uVev44qJfflMGKdc1XsI5LODCucmuR2tKRQgfusaZq0MRuEXHxnuzlasmQ64xmPOMvrfuHjL2OJYhebWYi4zhHSZYyIw4APMlh79zcTEhCEldYCZt4fLaQIAeJSLgjgc4vYDoHuU8EVwvRiJ3k0kVzf/aAUg50euQrYORWzCgZLEC6yYFUxWl6p6pI55cKCgY2qsvxQdi+5Kz2x3bNwVYgdfDdQmUDXj4CU2lkCn2GguERCxgxG5vKoVKH0s/LXXXWFi5krD3Da8kK4bWm4OkG9cw5nUGg1Wzq91Au5RDzFapCZzAg==
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3404.namprd12.prod.outlook.com (2603:10b6:5:3a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 18:26:27 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.4065.026; Mon, 26 Apr 2021
 18:26:27 +0000
Date: Mon, 26 Apr 2021 15:26:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 01/12] vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
Message-ID: <20210426182625.GY1370958@nvidia.com>
References: <1-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
 <d058f9ad-7ce1-c1b3-19cd-5f625ef4c670@infradead.org>
Content-Disposition: inline
In-Reply-To: <d058f9ad-7ce1-c1b3-19cd-5f625ef4c670@infradead.org>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BLAPR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:208:329::8) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BLAPR03CA0063.namprd03.prod.outlook.com (2603:10b6:208:329::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Mon, 26 Apr 2021 18:26:26 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lb5w9-00DA1r-Kc; Mon, 26 Apr 2021 15:26:25 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2b818ef-6c19-4296-b9cc-08d908e0cdc3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3404:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3404EE40553CA26F0D763FB1C2429@DM6PR12MB3404.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0kHxFwycYxiOikzBw4WDroBcm3swntun7NgclzNi4ZhPeGW2v6JLJrJphJ/dY7QgMIpYqhhvI/tnIpu7cwzqvolSeKsjLfo9VWtykDJl9zbJWMNCY41ptko3Mb/5OJu8tO0F5eDzb1a/m3poyRlOaei9ZyYVR+WtZQh4ki1x0BeRuYCE35eKEkrouipQf9i7iA/pLPl1ISDpgY2+zxGqKvVz5aY9qa3hwvvzL+faSIcXwvq3kh6JfDoLjGHHQy5IIA/iWwF/mcqE0sntTZGr139rXocJ47aEfphgLnwQOQZ5fs56dB2EMyukcHYQY6kVvvGbEj1M7o9hsSeEIAJ9IYD29lAEX5XnNZ+80qBPWtdIoTtxvn+CWcMI5d7Tk638GlEZmR6POJq5d11171ccEzIU9Ipuijs928k+C+yy1O96WJMCRBwPtt8BHvw6ksj23gpwlVdhHr5ab4XhEMxV89SV9CxPbID8i1JAYn2mJ5JnZa+a/wrhCpT6C9/o+dqb0abzuIE2CVI6AOiTgdJjlEBM0jAnphpaVdBFdYpbFa7z2Vy8ADfP2FSYXtJ9RzXh9SWh+OfB/Cen/tGjxgEJcMkkGKGSfWW612PR/JctGhY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(5660300002)(66556008)(316002)(8676002)(8936002)(7416002)(4326008)(107886003)(66476007)(54906003)(478600001)(38100700002)(36756003)(6916009)(186003)(2616005)(426003)(2906002)(4744005)(33656002)(1076003)(53546011)(66946007)(9746002)(9786002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XU5yW7jfbdS8/TE7Vye9XZQ1woncEWANZU6lt1tRtw5MSryhqbsx7a6iHeex?=
 =?us-ascii?Q?e/+I/57lApWvRtK0gLAMA/UoKgxXkUOqzMCMbB3J6zfFDIGxKGasniOvmSfH?=
 =?us-ascii?Q?yqL8Hgplgb5c1L+QI8uabCg+Ha/2dtF1UidKEZMnpQPkIczj4mpHa0ADMhAs?=
 =?us-ascii?Q?PaxA1LKWuapZDm/V732zGgzrM3v+oZoqvBhbikUtZVEMXvx/oPu2txuzU9SJ?=
 =?us-ascii?Q?2iogxPtprC3XfIoP/zD0rvbPVSoBMuuchthBw14xOXSuYkYXSgZWjfPTdCJT?=
 =?us-ascii?Q?lKJBZhHsMHD8s/6oQZhuEdwlN3sJ9LNCF0b5w2GRWYYriWENeQNwegvP5IOW?=
 =?us-ascii?Q?MSsyU4phwcDPUt4ilyH/5rDltUY5d+jNjJqQ6LTd9hmW3U2JTOFVKtQ4zx3s?=
 =?us-ascii?Q?KrGfaeG2MoWWcUesU2rQX1fn90k1VXJSy4pgBeM5C31BqfcufwOjy08r43Hm?=
 =?us-ascii?Q?B06Azsrl6GnUYRu3AJ8js87QXuYkt9ZoTVc9BL+Q4+2U0fKe5n+I9PVpn/v5?=
 =?us-ascii?Q?nUc5nmoEOQPYUdk3axExih/A/8Z4BzeEeaof8N9ObQh+k1BRv4/jaM6McWhs?=
 =?us-ascii?Q?eHi66QktT/iPaxsmmD6UEPOX7Joka02lWJh8BK1pubuli+UnWxp7+ULEKvOh?=
 =?us-ascii?Q?1wlOpFLlJrdxeTRzAMnS/G3SBZu46cpGBW16kbB5KugwcNC/HLpk2FfBVEyE?=
 =?us-ascii?Q?9SHMGjwtP1cRK1YNZXCUV79T2lJ8tdt3RTnPx0hCANZqWHChgRCAqvxWRSZC?=
 =?us-ascii?Q?9qTPKxoLvaSiaS1lavIL0YGfgbVOlQfC5prIQfh3iy+QJqGK6CopSLHXaHm0?=
 =?us-ascii?Q?ncliDxTZW4YuJFtNAoIwKF9GYGj/qxubGjYQ5SIpw9sDWLsSazs/yCYBYYh3?=
 =?us-ascii?Q?lC/zfIE77UpqXMLzWgIn60fI6TU0P2ERTjwqoLCKoLP5YpAnD+OOaFtxA8Js?=
 =?us-ascii?Q?PX4uceNdIxJl0MAWRct/awwUNoU7I7G3ntGmawgsjix4xni1NITWDtytPG+9?=
 =?us-ascii?Q?hmcVYJJwZCywfmPVoUrPNOX4bvLR1ckA4X+ChStYTZZ9kiXK4EMVhvftPOFZ?=
 =?us-ascii?Q?wPamoqG8pwt/myGLTX1B1JREq8JA7dVSRhOCsgDhiAGCbb7c/4Gtajgv5wGf?=
 =?us-ascii?Q?RSp1WUap+togqFgwaMELtl7wykSTbQ3i4oi8NTkkOEGSbiLVfQN5mRwGJqkW?=
 =?us-ascii?Q?pP8UvLrO+u7YCdcarLr89VGVRmnugrpj4d9oWWUVHYXDYBUfbuT69T0mSC4z?=
 =?us-ascii?Q?a9cs0qQcAVUF7tiXlWvnrI3KPi4/ILzdhi1myCnBAgW9pdIZF/wrKMyA6ip6?=
 =?us-ascii?Q?3Q2SGZhKmkwetxYzuu3XypyX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b818ef-6c19-4296-b9cc-08d908e0cdc3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 18:26:27.0756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDkbfD/OpUGzYzc4ewhhSrlwqv/fAoPt0eNjNCmTkyahG6DklvIyin7E3y1Vrg5W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3404
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
 Kirti Wankhede <kwankhede@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Max Gurtovoy <mgurtovoy@nvidia.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 05:08:10PM -0700, Randy Dunlap wrote:
> On 4/23/21 4:02 PM, Jason Gunthorpe wrote:
> > @@ -171,7 +171,7 @@ config SAMPLE_VFIO_MDEV_MDPY_FB
> >  
> >  config SAMPLE_VFIO_MDEV_MBOCHS
> >  	tristate "Build VFIO mdpy example mediated device sample code -- loadable modules only"
> 
> You can drop the ending of the prompt string.

Hum, I see this whole sample kconfig file is filled with this '&& m'
pattern, I wonder if there is a reason?

I think I will put the '&& m' back, I thought it was some kconfig
misunderstanding as it is very strange to see a naked '&& M'.

Thanks
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
