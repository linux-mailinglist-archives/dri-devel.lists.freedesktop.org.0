Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73F54FC442
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 20:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79CD10E1FD;
	Mon, 11 Apr 2022 18:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2080.outbound.protection.outlook.com [40.107.100.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB6D10E1FD;
 Mon, 11 Apr 2022 18:42:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsoP6wvbSi7V4yv9Fl1SNmtSE7QkBqkKrFy0V2TEBE3QUtxe+vDwdUqzHjG/baLvi+NbG6B7RXRksSCjXzMXnwOuTlGA2yjHRMcTjYWN+EksAiBUaharCnFS8UPWrBrllkFHIvEYhYsU7X75r3xdGG6lNH1MQXA9LPGzEoztgKP8XU7PML0rxko/nPmW+A6zXIf2Zsbm1D+TanqgHuR5i8W6VBDmFd/AoRHKCwH0dGpXVQxC4Hoj3QUKZ2jxQ3D4HWhWhNoPuQyP/Orm0mTDQyCxfhpwf8KvEhlXNuHz1TrYsH/HlV7dfKF3E0YWsWwkMag3SFuSfbONqQco7AfPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Umg9liS9nnMtkSxWH/+WtTslkk5g6P/EUAQl/2v+HBU=;
 b=LREx2WFBAMfFYyhbq44UGvD6YbTBPloIAGCtNDuTlWDqHlmBe/hEkbp0lsm5pIvXavQc7V/88n/Ap79SEzKpcSb3u/sewux5Rq3cLb19otLcuNa1JHMq/bzZJDvvFeRBCh8iKi+FchPoDzsHxfm04Rv2nYIvRBfBvqFg1XFauYfzxjjtsGcRxCpR2qAM3NeX7uT84qv8QK4DmToRrTMr65kP2TSHcrmoRE8g+HlvvYXCBPFUbllJkEDIX+78HyxFjhfsKUaM1a9ZvMUKSXgjpSLnzy8PM+Ud5FwG8EEqnlDCmHVuQTdHEohA7ec9bPHQx/U4DVX9vwcP5fw21aOC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Umg9liS9nnMtkSxWH/+WtTslkk5g6P/EUAQl/2v+HBU=;
 b=s0cPcIKUkltsOci/LQZmTXeV0bw5nmvc+CVzCwafjxPWjmk0ahhcD8OF/PmyYszdKhLYIubtGpZdGGuW3MEZhMesd+B/wSevNhfm2NAIndhgi4QlAbypYYjBz8PcuoY5x5woH+qtT7+Yk2zLc/K9ZsODjUo+YVcBUA73ZS4Ps/MbZ43MFi10sX/0tQtowI+QU1siWMyaOpFQNxOEk3Dy16nFNjuu9S/ACioLmezIkrYY2imw031VHPKel2QsMeUHw7/Ym/LKFGXWYBv48YZUK6T6Vek3UlbuES7bW/7Hod2NXdyV+LRdXhMrBeKNyBPxiHb4BckL0kG172rYJeqRLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB3913.namprd12.prod.outlook.com (2603:10b6:5:1cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 18:42:18 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 18:42:18 +0000
Date: Mon, 11 Apr 2022 15:42:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 29/34] drm/i915/gvt: merge gvt.c into kvmgvt.c
Message-ID: <20220411184217.GE2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-30-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-30-hch@lst.de>
X-ClientProxiedBy: BL0PR0102CA0016.prod.exchangelabs.com
 (2603:10b6:207:18::29) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82ecd8c2-fa3d-43c6-14f5-08da1beb01be
X-MS-TrafficTypeDiagnostic: DM6PR12MB3913:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3913BAE2AEB7FBA8CE027D3CC2EA9@DM6PR12MB3913.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ncYXo3kwOJ91NgGq7n9lurwDv7vOY9U+3oImQgPHcMWz6bxN2it2L8Wc8/RNG77Qbw36EbAXxJGZmb0vvmgcw1b4QNAVbx7j5qVm5LTinbAemBhoT8AnSRvBJWwssrQj++Yp8BT4pcE3g2WynGsfZcRwzFv6Uok3W2fb0kAedVZDPT6RyFlNmCp6dRDog6EqiG9ibQsERn33gohVGEAmtLjdR9PG8HCq+pnwP+dBojC3yjPt6aBfVBaO8JGxrcEBoZLdJEPWyxhfVFo956W73O6fy5iRrgdqKNwyTLDVKpfw9CFd1H+VFUOBi28Xavatl+7MATwrf/3zYxWW4bWS0n0i91uTMmV+xUht6gqCpmrKtZuXc8jfOnOnnO471deDxKYy2RVFiZo8JmSbnK8DaL8ZpU0roppGNi74vGuTDliF2OB6e2HiEE17BlX5A7tL23UHnvfoQDNsD2hx/3fI/yFZONk0OLt+aSsnVp0TX77WhzKd52FoHsjOnx76i6CvYTfIUS6DxKUrFmJkLQngHTb2sqj1IKEFJzZS5M2fI+812Iivfh4NGNJqrULWzFFBkIjbbgk7z4YS+ceihut5R7qoLfmXmXoa+ttwmYX7SgZoQbH+JZy8BBtLGhGG3H5UP9zfXG3eIbJT1wnDtu51Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(6486002)(7416002)(33656002)(54906003)(6916009)(66556008)(508600001)(8676002)(66946007)(4326008)(4744005)(38100700002)(66476007)(316002)(2906002)(2616005)(83380400001)(186003)(26005)(86362001)(1076003)(6512007)(6506007)(36756003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jg8JuQ/IiwEBBG1Q1F5b+ZC2zcNciuVJ8HU/ivfLf3mSAH02rygbt4NFSE0u?=
 =?us-ascii?Q?2HJtoNtmde37peNp2G3kzMyaf9wM8cxMMAMd1J4FRdShPzWuSlhQIrog1Tsq?=
 =?us-ascii?Q?5em/lDy4rvSOIvsXzxw0zda7eymgHeMeNeNSfNtcpc+nQiSDQ/Cau0uDX3+w?=
 =?us-ascii?Q?AQ1/fDC0tbr92w1fcQMpmi1Xq3+IqOel9PhMmOixvkwmCZyVE+ZIjEfhf4nT?=
 =?us-ascii?Q?HwrycnbTBpIW5rCviSzAZaAneh8fJWMcDidNSF7VaPCPilKC1OyP1G0+yLXK?=
 =?us-ascii?Q?wnGNiLfJkt2/K1iwqT35drKuVqtRuCELN66Nf0jASlRSr1lcTRUccprya6pt?=
 =?us-ascii?Q?ZoLxUUDwJIrfeETCmC2EIzrsgt8QRaLuTHQX94fPLtWVrNfmJ2HZJwVTA4e/?=
 =?us-ascii?Q?+2N+ybGcmT0SR6NzKScqJvyBfcFvFrPYg83yzIFagDp8ryxfbNtOaNZ3GTgn?=
 =?us-ascii?Q?njPwC9+cKprkzVaOxa+Pu0ZDtLOiFx/DMtxmuC2PYKJVvtJsdVfhuFI5z6ou?=
 =?us-ascii?Q?stTD97+OPOu0sGaMsK/Iab3Blit7vcSuQzU7vm5OuA/gXMmHrF4hcsrWfepF?=
 =?us-ascii?Q?Zl2ni3DpIX4aIm3/Jt0HFQadLikY9Fu1ml59JU4D+LiQGms4O10Z5CElj6FZ?=
 =?us-ascii?Q?FJoxXe4Eks6CBX6y5/gsKsoaRvrhg1O2Ny6ImmDm/9oEdNF9UhzBiJf7O3hj?=
 =?us-ascii?Q?BdDiEUBA+nT5LIrFrk6dWxtCmR2iHj2xbagu1khYSBiwbzjj+/pyi7BP8fTH?=
 =?us-ascii?Q?ELL4On4xO1u+aGd+K88+olGKBLTXDq3Ih0hISO1BapKAz67xdUhwHSVTcHb5?=
 =?us-ascii?Q?twiilnGmgRfaNMQSCh5cz39HGWFu0KMhrCCYHR3r9l83hvyWldL9Qaj6F8Au?=
 =?us-ascii?Q?CcqoA4k/0wvIWMIZ31ZKlxzm+bPfftoDrV9vU9zEt5WpLYIEo6EPpEC7YNbl?=
 =?us-ascii?Q?FqOJcVilab/fGxGLiTOyuH6S7/BbcfE4saVmyzxgLYGa8O+3Q5Db8+Kkt3T9?=
 =?us-ascii?Q?7+mHRVpDSMn8+cDbAZ7qvgh3ao6v3klbgB/zZp4mWI8HoypfBEWpQQ06t1Ed?=
 =?us-ascii?Q?empY8H5y6bRShiM9scSxfTh4WgAaw+qp4JXUUAe47ri4CuSaX/W558t3/LzQ?=
 =?us-ascii?Q?rAYY0elifPna/MobUgt3QDcntmcHbNG3pme27APh78u3vezbNjo2n8OIKVCP?=
 =?us-ascii?Q?lXC0M+fucOpabAj0OQQTznypXCcIw0uLHc9m8RIAXTK+wsGF+0gk6p2pphry?=
 =?us-ascii?Q?0lTscMCvohfAeK8+xwDVk8POdrh2Fh8aDojCQ7rX6cvCyJhpKUcMqjXeIB4d?=
 =?us-ascii?Q?5lP5+pR35mdFmaZh4+W+g1ZJoWGZbVtbIaaPaBuxjM3ZFaEnA/hmyckzVrdJ?=
 =?us-ascii?Q?dFu/L/7aynTJlidCPDkkWzcrKy0dsPuizvATHLftu0pNIFMQIXa0XLQy+iDm?=
 =?us-ascii?Q?AIzZcDjlIxzz8XsPUoLWCEpnpkiuzErr19neni3QDyUGmrRVPVJ7BSLtIODk?=
 =?us-ascii?Q?Iw+6GJHz2S05vrTjj7G6juicevAwqJQZe23j06YMShgW3cQW6JZHgyxlSkx3?=
 =?us-ascii?Q?g0GbOh0z23Tx7u9YImnf7Oog6z1JYVUCeyam/ugU/KIDL65KrkFGO18OAb8J?=
 =?us-ascii?Q?gCATAmYkp3KSJeYmAamfvJpG5BJd1JjYXxJLjyYCPF3wq03YbTNkPOHIBseO?=
 =?us-ascii?Q?jAdfE3TZEE8ipFlSSfNQ73oSkx3prXd6NMP0ekSeOLgP/fIkabfP7ERMsOU8?=
 =?us-ascii?Q?w3njJd4Afw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ecd8c2-fa3d-43c6-14f5-08da1beb01be
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 18:42:18.8251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAPYWkX/loTKMucR6gCAUDq5MU9+vLMzQGWWHbUP1/u5vApeW1eyB8rXgs2z1+Zd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3913
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

On Mon, Apr 11, 2022 at 04:13:58PM +0200, Christoph Hellwig wrote:
> The code in both files is deeply interconnected, so merge it and
> keep a bunch of structures and functions static.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/Makefile |   1 -
>  drivers/gpu/drm/i915/gvt/gvt.c    | 291 ------------------------------
>  drivers/gpu/drm/i915/gvt/gvt.h    |   6 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c  | 264 ++++++++++++++++++++++++++-
>  4 files changed, 260 insertions(+), 302 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gvt/gvt.c

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
