Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518AB501004
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 16:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF9B10E3A5;
	Thu, 14 Apr 2022 14:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D97B10E32F;
 Thu, 14 Apr 2022 14:39:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nq0ps0pG1XN4svM4/gmdCs/txlPlvw82QLoxTwnLtujghdNq62LMkkIgwVTt2SGUqjfxXpBJKQVuaqTWxrh7DC4yEJf31CfKFtO7IpPOQYJa1xoDlBBXit8pgXQRAOq/VfbHkobkeFxe0nKBQtKwjozDgkJKE86VKo55CMp2KvnqdVojncK7wY5uSy0juo4d3aY4+HeC2qMJBDRs2asd9EnCf0tQfQtX8gOd83drgdth2KgnsYzHrsB7EM0FaZS7IBSE9GzQ502HHcUq3gvKbq+JLDVCa/naPi8DOLPfM8DB14qsfUUs34gNTGKB2guI1G4RPMkeTERG7yNXSnHsVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/Bfz1PATDvC0oypikSeRFZrtlXcP1bU4HB7kfwj9Sc=;
 b=kF3FPSTwMyD2yCH0lQTE6BlgAlSQjxWIj4Xrn2XZL2ZuWqtHpGhk1GadjwDuzEO6knT0ERysxQTmMULupF9iYTd4DbETaXdgZPmHaAiEri3/a4lXImAz13gRqWTLh8vUPVpgbdmdsSxwDZNt0Zufdv5i6Kc0WHze78VQ30up2W7biduRRS1CDQaX0BBOzvXkNozHgIdnl/PIk9nI0sXgUVnn3i6YPAPJFcn0lKjzeJq2rOyj9FmYWPwptZTw8H3OGtVwDbq2q0xbBwBD3VvdmTh3Ya6qoya67NT2OK+Azjdtf8Myh9JWuHr6pQVVWZDNHl/A6bSDyaJHgKCSJllnWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/Bfz1PATDvC0oypikSeRFZrtlXcP1bU4HB7kfwj9Sc=;
 b=IVpLwYi17PdvXdvwoVwV0OpHKRO2/zXmLCNdmrp9rJZZYNtHrScZo9eRNmr8TEOg18LHeeZMLUr8etQpI0wwiaRRoRaozhQMu6H8FBVLlPv7QZ08jHw/t3WLe5hIDh78GMf5dVdOgu4IKdcE7+N+XBvr/EJGSqwNS800b0ak0CtgklWcyW12HsYFfnfwrlDMlSiA1eSUR7SiHi1w/YAIR4JdBgo4QuRmhFxea28e5R354tNe7AnMlOzv+zmjb3Q72obzw/b5puiuDR6j3/FurIsQyY8qk+gV3K+ms20oOneufhO4Gicxxd2QyCzL5ecmt+shMFoPORARj7Y63aOUGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SN6PR12MB4719.namprd12.prod.outlook.com (2603:10b6:805:e9::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 14:39:01 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 14:39:01 +0000
Date: Thu, 14 Apr 2022 11:38:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
Message-ID: <20220414143859.GE368031@nvidia.com>
References: <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
 <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
 <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
 <20220413232053.GA2120790@nvidia.com>
 <1c3aaab9-3bd4-95d4-9f9f-4be9e10e6516@intel.com>
 <20220414133427.GB2120790@nvidia.com> <87ilrbeqbo.fsf@intel.com>
 <20220414134321.GD2120790@nvidia.com>
 <abc0a953-8527-ba25-9987-d2f1284a7430@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abc0a953-8527-ba25-9987-d2f1284a7430@intel.com>
X-ClientProxiedBy: BLAPR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:208:32e::16) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bb56b66-d021-4fd6-9b24-08da1e248450
X-MS-TrafficTypeDiagnostic: SN6PR12MB4719:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB4719D04B56C68210F4E2628BC2EF9@SN6PR12MB4719.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SSGmmUFcJ2RQuZGXFswa7oSIOvY0LUSSv0CuVe6KFh9rfIRN47aed/B/da8LIatR6xhIY2MbjbkYsl9aiayxFhVFmgjZEDvvc4rTD424O51NWU0D1F5VVmEt4RqMPhEwK+8HuUMz0qS+dMtddozrY6q6Y7UjZKlHJelbRrBdktMdCcS/3ry0IIpfec7386L3bVxu7mXUxczczWRi8/3CA57p/B6HS2ZfMUe/FSf9+Mwu279CoPyUp8kXWeQr8UxpqpWMpYQhwrm66Eys0t/qyCNJwpV60Pu71DPYCo3gZBWbLW/EZILGyTZlCKDKgq1D5HKyzPNC0kadyrjOYXwtuMAXT24UdJGNX3ytXmmjT9lDthntqiGV3WsGVLBOt4jceybdkKkF7ZOF2KFu28Veeo+qyFmyw205Honl8n9V1lQaWpbtW8QRmQuUL/ruhdo3+QLEl11hVmPC1DdztO3ig/p1ZmvxF68RSl5jQljfK7FHqLSoAjlwHvCwy8d0fbpnHaF9xxDonh863lDa5F0DooDAtmWviXio/TTyHZSItZFiQnpxEJuZC1BbdaBc5kpyAVRhYtDJWJvDYzAZD4JX6OYkLTg7U6eVwREg5mfOM9upGhMdZRPRm0DbY1Z3+n70od05PCl5YERl2b5vu9f/SDzfp9IiPy20mZQ8sfVrIGXFZZsLOzbtIrqkOSPLUxqkMpHfuUAj1vpq6qBCXmMhMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(5660300002)(8936002)(26005)(6512007)(33656002)(38100700002)(4326008)(86362001)(316002)(66476007)(66556008)(54906003)(8676002)(66946007)(6916009)(6506007)(6486002)(508600001)(2906002)(7416002)(36756003)(1076003)(186003)(83380400001)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m3ExuVKoUKybjs389f97/JJ1nbF168b1Uu+Y36OhTFxlMcZHG4D5PFCl0/jB?=
 =?us-ascii?Q?ZC9JjcIkQ6ePZiA+SX5GrMOUGD1vdGsEM9tjGmbLqW4qcFxyFqWJALOEBBIU?=
 =?us-ascii?Q?C5r4E+sgcmR2aQvZTh7FlEjItRBM+z19dkpTEohsco6Ii4F/adBnx4dghJOh?=
 =?us-ascii?Q?M4m/nZsXT/2OWHs2sO3FjPxKPsvLUz0YU2dDv4Bp9Ffo697w3/CGNGVnL8ig?=
 =?us-ascii?Q?rQg9G04mYPyi/5jyEaIb745hgZFv7IOu8KJi6SdwEOuhqXsYogzgLU3LM4PF?=
 =?us-ascii?Q?fbCsfw7/uZUDopdptzrAMvMZfjwA+XgugdADp5lysq75gidQ+FLjVYXIqb94?=
 =?us-ascii?Q?w5VdidKcYuOtScCCMEOINyhaK4ryG270AsYfAzeryHsYMBEW9IW0MKU5VhrX?=
 =?us-ascii?Q?MIPQnCJb0cAnGAPz4roLZMJsksSvIX9ytLXl3VUtJCjB8OVCoQoqyagG8FX6?=
 =?us-ascii?Q?M52k5ZrEua7dPL6F+us26KYx0CAawbQcZDm3LE2s29AFxe32VFvwwY43Mls1?=
 =?us-ascii?Q?Ub2A1OFfowNqBjyvSpLrWyVY5RNJ6sMeem6PoBxuCTLtNrBZfL/ha0Ef+Xiq?=
 =?us-ascii?Q?6RsxFU/1plTs8pHMpjw0YaeTTEBvim4HvX1Hj8/tOaEqoKGcRhTKfpv6uUsO?=
 =?us-ascii?Q?jQ0r1QxaDXOu7wostkLHJBWV3tVUVvOXh1+r3wP2ecIjtlPeeWHQNDondBeM?=
 =?us-ascii?Q?YforjTrAqJpO3ycTLvq5b33IGkzejOmAtQJp0WXJyNbpIFPOnuP/oljASiWz?=
 =?us-ascii?Q?T3kPnp//1aD94QGJ0meTRBcpCaba/W+TIluKK90MECgb9piQS6fpK9IgTsej?=
 =?us-ascii?Q?kLnJyFf9EpNzgDItZrm+80LGUUx6AUDkVE/qs0h8v4YldZ73U2P3EmuF3LQH?=
 =?us-ascii?Q?Z9pa7WaSGPmIMPwIhZp3O8MZ3wLDBaIPkdAYLqIxRcbVL1g7YpWUb4owTHQG?=
 =?us-ascii?Q?ypwX9SrUE9rJiiTiozDBcjxLPk6pfMTZCkR2rzSahgKsG1Kbh6h9E8+jvYaO?=
 =?us-ascii?Q?7C+OBY6PQnzGKDNRPhHM57y5HBDmx/FyBmN0bizkJK0ht2jpM5nP8iotiz+r?=
 =?us-ascii?Q?2JeM+oxn3C7NgYF2DHAgo5Kb7E4ymJkBRhCWRw+lMbtGanJfdseNM8GBB5om?=
 =?us-ascii?Q?PguvilcAK1RtQ4krvtj0Hx8LjdxBSajV5WDEMAov3VM8iGS7E0795h7W9UnP?=
 =?us-ascii?Q?uYN+zMBBcnhjLP5EcOgiUicviOdeLndy1zsm2wWkRzU8ck79ZGl1/VoGtBbW?=
 =?us-ascii?Q?Yo2YuwyoJsLPPrgohMKaIbzt5DgNjcRlVAs3pDPZU2+ApUHGP4v+B1yvEfaA?=
 =?us-ascii?Q?GvfpOIE01qEwr3cXHhivIMmE4P2X8LfuwyWtrPxa+wUulczzwMPcTFVaWrTw?=
 =?us-ascii?Q?7Brj+s0XcEETKjg8HaAk0HYK3eZIxQhNb/yc2sIEzIRMI9ix4MWGgoPAbtw8?=
 =?us-ascii?Q?+O27gW29DmXZhrXOaAwnuZ+aS6MKUaT8KBz2t78vIXfEahVT8dQNIOKC2Acx?=
 =?us-ascii?Q?oGKrli/6e5RuctpqMRThW0g1aE5OG8CLVmGQUYi9n4QUd1V093J931LnTYr4?=
 =?us-ascii?Q?k8v8Gi0OM2J1lkxZGco0T9mSZtMSYU9nc9Wxz/AfY/0GtvlG+0IOATLh9gxI?=
 =?us-ascii?Q?3PJdgCVa7c3vGxmsMM/Q1akkzN8ZTpzuCG+duH0L7unoNPQAI3N5ywtQo55r?=
 =?us-ascii?Q?B/ySYKIzKWMERruj/lgdVQbPElHhPjDZrR383HgQmfXXklW9rRr/Uv8z04cs?=
 =?us-ascii?Q?vajujAETzg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb56b66-d021-4fd6-9b24-08da1e248450
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 14:39:01.5752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjISa0hfnwjnGt+3NzPHJ9CAjDSBMDurdl0Hs57LT5xxhM0kfaLr6Y2ctcpCwhqw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4719
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 02:25:36PM +0000, Wang, Zhi A wrote:

> > So drop the '[DONT PULL]' commit and send a PR to the next DRM tree -
> > when that is confirmed send the same PR to vfio,
> 
> I updated the branch again, but I am confused. What is the purpose of sending
> the PR to next DRM tree? I suppose all the patches will go through VFIO? If
> I understand correctly?

pull requests can flow through more than one tree concurrently. The
purpose of the topic branch is to allow all the commits to be in all
the trees they need to be in at once.

So you should send this branch as a PR to the next logical upstream
tree gvt patches normally go through, in the usual way that you send
PRs. Especially in this case where there is a small merge conflict
internal to DRM to resolve. I'm assuming this is the drm-intel-next
tree?

Once DRM is internally happy then VFIO can merge it as well. You can
view VFIO as the secondary path to Linus, DRM as primary. Alex will
mention in his pull request that VFIO has a 'shared branch with DRM
for gvt'.

Jason
