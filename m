Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F444325E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CD8730FE;
	Tue,  2 Nov 2021 16:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8E5730FB;
 Tue,  2 Nov 2021 16:08:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYnlEf8XFb9HKiHq8KJbJkyugN/I/lLv7D8sQKWWzefI2WC1iozQpsZRqqpGfI8Q8hieCD1DCdxcnH0LnDax66bCXaYCvTMAfRflYx8Se/OL7CbT4sHCtefgSd9YtuUB+35syBcD8CRkAXssogacdajwEFm9DkiFSCcVrsxQIBe7+X6IlMrAnPkYjiZXJ1El5gliZI9nlVu70XjYLCYfHQmkjhOwT5+Z0yrzARPQOI2lCL3i/tULIYtz6W4pcAqK0v4AIDNHCwdol0QOZAA003PqcbK/KGxvm7bvxEIEnjhpPCk81aSaEsDn/Z6bhPg+pL9imhe23YFHwCZYZ6I9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoWeM16+516lxd+LAxTttR0Xe+ocEVnF3kCp6KwulLY=;
 b=L3Zo7Z0s9Me374YfrZzFEkGqnRKj1v5xYBcHi9YHc9FpS5UEirE3haEc767OBSxlO0uViLo6yZO3GZJlsOChtn7cJj7sXEhKSVpCd2vDV9shP6+QVYrwH8E3DmZpl5FXujWP2+xG9mAWd9S2g0Hh11YkQmC7y3/wy66pzm5PllUWes2rUvdzKPz1ShZeugxhVYvONiV0NE4TMS8Dv4s8NGQK+wMIB+GFQLNsrKFrfreCJeIixgMIXOtLzJlOmFIzWlTLuusLbjUClx7+a+lRamUm35Afjtmcz3e9zlzJ1abrjn33VgQ8Mvf8qw0S/ZID7sXXOnFG3GqSUYU48tCwow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoWeM16+516lxd+LAxTttR0Xe+ocEVnF3kCp6KwulLY=;
 b=JL9VRzRO8236cTlwPm1HK+hbZPCC048WPTqMa7iap80jzL6pmxtcHYxdkJ98KuYpqBePlG5andX6dXdEJ98iLnG+MuoVZt1oSm32CKniWYiQqryiDNDIa8A81hScRL6IkKd2LLdNhAD2vUZnSRQWwoSVw9yTmk2vkxgvdMBaVHT3EdnoV4PvpYB86iYYn3Cag7IAWIPQy2KqWytPEDB3DIvPKy2bOvXHnRL7VMbDbvStPAVXS7Xp7TCI6wxpg0HgxMJGvyASTfEXEJR04F+PoSYXimotrQyztytvGdJLWVDJyG8dPdNrUsOsqOy19sHNYio9vmQkGWcgo0rZAVPwTw==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5554.namprd12.prod.outlook.com (2603:10b6:208:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 16:08:19 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:08:19 +0000
Date: Tue, 2 Nov 2021 13:08:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/29] drm/i915/gvt: devirtualize ->{read,write}_gpa
Message-ID: <20211102160817.GS2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-14-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-14-hch@lst.de>
X-ClientProxiedBy: MN2PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:208:23d::19) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR06CA0014.namprd06.prod.outlook.com (2603:10b6:208:23d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Tue, 2 Nov 2021 16:08:19 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwKf-005AMf-C4; Tue, 02 Nov 2021 13:08:17 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41815909-cb14-40d0-5f3d-08d99e1afc99
X-MS-TrafficTypeDiagnostic: BL0PR12MB5554:
X-Microsoft-Antispam-PRVS: <BL0PR12MB5554876FA5E0E17B4FFF6556C28B9@BL0PR12MB5554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwFUQt5ygKED4k4XHb+RpalVDNopnrjzzwmKoT40LZZQtnw9lCQoaR51DoriaTSadBufTOSjdA9LTfSnunh3+UDeH2bFtWMfpR0l0ZJm1IoOgVEU8JbNPneJxpVNRaEkM36HbXcgJ5U29+J+dO1mUGe+CZEZd7lwnGHD8AUvX2lhQGwi8imAVLlaFydQJqGakSA39s8KqMekofV8x04sXDVZudhbJVZooCKvPka+XvURU2SCWxoat5MUrxDxVlvHsh5T2V2yOswurfpLjGk8rYBCXriFh/+J8bpu7mPDsTvSbuoMfh1OMz2E55jAz/RdiFIaPTcSkAf90CxyLFhgfMCtgsjZhpUJGr2uIO957GFgaom0+ANEj8nYqS09Lp5a3pQjGIhpwBvjDt+fk8gAO6XgqpZxcK5/KJPDGJSZqQ6Z80Q6lx9WGu643dFpQwH8tDAzODOgvnmGLnJkEiFQv5FiTspFm6GjJU9cPvqVoyvGA3frh4hEBosF2RvHfeOGcr+CmZl1ZOfNruG5Jg/1XpzQp4tWBzXZZQ57VkLyXkyg1g4N3k1o4m2fMS+hpAZ6PluD2JhUnaTACEot3nkQVUs9Fe/zRmmU3cVrgYdOWYk52auvSSzyv/hFqD3MVvhGuFXeKDKGSoymhYAacPx6Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(33656002)(426003)(8676002)(8936002)(86362001)(66556008)(9786002)(66476007)(508600001)(2616005)(38100700002)(26005)(54906003)(83380400001)(2906002)(1076003)(9746002)(6916009)(4326008)(4744005)(7416002)(316002)(186003)(5660300002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ytTQz6QySX/kXYfiDGJV6MgJmMy3ZoESF5GgzWogPYcNaUPNBY4NvSLx71sJ?=
 =?us-ascii?Q?bKQ0mb/fL22Hgu7iGm0zy1IFJUB3+w6AkRD73ZFsNNtzIcOf6p62ZQj8vC5W?=
 =?us-ascii?Q?lpYcvv7fn5mse3fdwB3OaEa30B6dMEQ+dQC/2cXHsLyykB03VM+AmdWX46rN?=
 =?us-ascii?Q?OQJIpTEZP5kQeajHxoqFwwJ8Z2nscz6MlHmmPmQPH3h+UELgTQdUESAIC8v6?=
 =?us-ascii?Q?SwOMBsuqv51uyNo7ez9TWfLYe2o1xn/gv5EgNbVR4atLTtcUSIihU6BjMA7b?=
 =?us-ascii?Q?71oGjasAIb78s2cA9SB11iOqiGvA8KHm/uyDLZFPbcioGK3koCzIowPtps2G?=
 =?us-ascii?Q?/n8p4AHdNYGFLSoPIEr8VmbziYxwpMk3f/NfD1mfp32ixkHkPmL6A2q/Vefy?=
 =?us-ascii?Q?qQD4/Awy29nMmx8EBqFjeC/vDpgxXO6B+GB6Zr/hKGZZ5zAbuysqXEPFDDCX?=
 =?us-ascii?Q?5PgE/1TNTboHK9UAC9UDYl3cilrdK/eijLLF5GFwIPjKjXVTj7i3ky+gIKKG?=
 =?us-ascii?Q?qOlIFV6TK8qXV82Bf8QOEA86ALNemjQSb4Shu3L6ZLUtZXTV1DGhm3GEYEh4?=
 =?us-ascii?Q?tcv6SDqthu8AF6OUE8RS8SD6uPPSf7rIB945UaiQpG/qwPoGOncAPpj25f2Y?=
 =?us-ascii?Q?ialjwfVy8moDk4WwCiyCD4I3NeJ7hwdvLCUS1wMB04zpcsnR5L5O82Ms1Eto?=
 =?us-ascii?Q?FJUQnsu6Ddg2aW5ZLf0MqS6IhdpZYp3d4C7MC0lQzDWFwW/mbcXTaQeVS6ki?=
 =?us-ascii?Q?ujSMNZgkqBRAiS1eQqbsqjeePOVnBcFOmwQ/0M/6eoZb4GdB6tyEdr6jL2iQ?=
 =?us-ascii?Q?S80jZ48xLrArDXMrEPvhmm7c8txIQIahvRbDPXpOKdiWi93p4AiMdd2O+QTX?=
 =?us-ascii?Q?SJ/QhxF/cMtEOnDa49qwCB0Aqp7YrjvNrNXX/JI2iwy96OTwagW4aewLlVN9?=
 =?us-ascii?Q?4LnjfvSPZgj67wUqlCV9qzElot0N/3548mmiJiGzginEPgrrgkkjSHGVdzLD?=
 =?us-ascii?Q?q67a0PlKK546z/3ZQUbusNo+/jiAa+riThRSivu9mxhET85xsfTmsk193KfF?=
 =?us-ascii?Q?JP7Vc0psDdjSWTfBvgGAxmtYbC8YmjH2ZERXDNN8ECot8GYyM/GGzOwJeVWA?=
 =?us-ascii?Q?OScszqAU9APTl3ucQANHbob+bWBssqRkw8pY/zVnHH+UCOR6sbHcRduWfm7q?=
 =?us-ascii?Q?bMMHdaZDChGT1+ln7U71VNKXJebs99tRihUTrBS42Y7aXsCeNZ4FVScjoTPt?=
 =?us-ascii?Q?pcXYlFZXE2PiV1iTfzU80ago0SG7whnM7p60CVbJrkgQrmRtMNJelHOVa9Mv?=
 =?us-ascii?Q?FN7Dw/U+gxMYIGxS9weYKNxW0Q7e//tLsDV6Ph3v8o92o2vGZuccM+YaOwL2?=
 =?us-ascii?Q?1CAXSwoR2psvhlvA1+lKADcn0zwnx22T3xxj3FziYmX7wO8f4iXQ2hmqDOOQ?=
 =?us-ascii?Q?zSJkXjWgWnZ8aWfRrQNhoMpLMyMyCYnS3oi0hAQl9DYXjYNfgEi3AZkHXimz?=
 =?us-ascii?Q?GVChQWL6jX6mJQ8HTqj0tN1IhXwWG9jly0N7IMCaQdyMvJiiHa6lsiAjxBGN?=
 =?us-ascii?Q?wbg9gL+V7r0PqAu2tp4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41815909-cb14-40d0-5f3d-08d99e1afc99
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:08:19.6651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oik2MGlQVFjSpZQ5+9Rqm3RiTvbmsayNbwrrF7K1iWUo0pi2u/81gsnXEKFzOacZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5554
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

On Tue, Nov 02, 2021 at 08:05:45AM +0100, Christoph Hellwig wrote:
> Just call the VFIO functions directly instead of through the method
> table.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c |  4 +--
>  drivers/gpu/drm/i915/gvt/execlist.c   | 12 ++++-----
>  drivers/gpu/drm/i915/gvt/gtt.c        |  6 ++---
>  drivers/gpu/drm/i915/gvt/gvt.h        | 37 +++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/hypercall.h  |  4 ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c      | 23 -----------------
>  drivers/gpu/drm/i915/gvt/mmio.c       |  4 +--
>  drivers/gpu/drm/i915/gvt/mpt.h        | 32 -----------------------
>  drivers/gpu/drm/i915/gvt/opregion.c   | 10 +++-----
>  drivers/gpu/drm/i915/gvt/scheduler.c  | 37 +++++++++++++--------------
>  10 files changed, 72 insertions(+), 97 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
