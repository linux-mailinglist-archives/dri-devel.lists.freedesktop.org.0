Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C74B445317
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 13:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAFA6EE80;
	Thu,  4 Nov 2021 12:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA02A6EE74;
 Thu,  4 Nov 2021 12:32:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKuU+RqeOjqVILwWnVWsgkR13xzhqhJV15M5KyLBFHw0vCTBCekK5CsseLLFaQULTm3ZoKn3xZNjjKEJbSRbc7dGRtuzt+YvsRkIdDcn6zzoxyvQDMf4uWroccRNkynI+N1ecqTl0liE6f8dH9SuCg/NCOqKSeGu9PjHMm91rN0B8dB0N8XVL4uVOkJXDMbIF964HHWL9D+pT/YXUTX3AbbLX+OJ4wFSQqwN0edynEeJ9CsaD51dhF5e9eBzpfyClxxCb5YBtxLOS0+liiHXbkUw1GLRpJAwgxQgJf5u8cHlG2bRdJehZzDzB2DHOX4MYvVtW87qmOQqBE3BfjW4IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NsdUwqg/ebwpIoq4nYzmmA8cOJ5d422iQxYBnPZ0ig=;
 b=oM9nMrqbKRJdevFAE+SMXtTm6byN5hEaKfTpp/6QYZADYhd/m42c3XtZbS37FHK63ZQhoD8xcAS9QUIEAP+gfrLoenEW97xpYv6RrEkOwHjmv7CSIXHz0qB8btLvNf/SfeQUZpThQMgwPtgTTFKn7fpou5KVRhXkoYEJTcPQwyEjC4ASkmB3lqYwsUCS7ml/fNxeEsRbtBA4ZVYq2aihI61dBc+48AIhTbHpTbm1gJZlto7pz4ROGj9YiPq/nAYtNu8oNf7TWcfeIGY2jdFetb08FF6clBbIuCE+2KuWxm1hWUSLmNc3I1fpQ2s2aZtEho7DwX1r0m4XFv9D+X6bxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NsdUwqg/ebwpIoq4nYzmmA8cOJ5d422iQxYBnPZ0ig=;
 b=TPXbdcG/hHN6yhEM9tzrwkRI/hiWAFjJIJXp+Owr4X5wuVP9P2m7wdeMh35F/48N9MFnUkYFb2VRmsSAn2iPHTBYdfZPd+oFqDbwq0CnkbqLlnAaaf/SkvIqJQooYMzshbvbfS/DVYPfJ0wTJWo+Qb9bdmzZZXgpUHi46GFKCNkCZ5qWRJVx24APrn8Pq006ql/mo76E5iGLPFZ5x4HLd4pRY0uk0AHxHjglCNS4itFLjslsiaCQir46Pgipqc8VyLF1r7rx4EQut8pLa3QtLpF9bthX/vr3tAqqHXM7uBcW/WFhPy+KJu0SucoGspod8gKiMFLjiSODGiS5T/IhZg==
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=nvidia.com; 
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5255.namprd12.prod.outlook.com (2603:10b6:208:315::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 4 Nov
 2021 12:32:26 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::5897:83b2:a704:7909]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::5897:83b2:a704:7909%7]) with mapi id 15.20.4669.013; Thu, 4 Nov 2021
 12:32:26 +0000
Date: Thu, 4 Nov 2021 09:32:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 02/29] drm/i915/gvt: integrate into the main Makefile
Message-ID: <20211104123225.GV2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-3-hch@lst.de>
 <163602902009.4807.3745093259631583283@jlahtine-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163602902009.4807.3745093259631583283@jlahtine-mobl.ger.corp.intel.com>
X-ClientProxiedBy: BL1PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:208:2be::33) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0208.namprd13.prod.outlook.com (2603:10b6:208:2be::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Thu, 4 Nov 2021 12:32:26 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mibur-005yoS-Ai; Thu, 04 Nov 2021 09:32:25 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bca73a9-c3c5-4528-f349-08d99f8f28b7
X-MS-TrafficTypeDiagnostic: BL1PR12MB5255:
X-Microsoft-Antispam-PRVS: <BL1PR12MB52554D4B8E48573DAB8B23B9C28D9@BL1PR12MB5255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +301lU9tTSOmLngfzxZu2ylMTOr44Y1XOW8aGxjMgZU5qVMDWMQQcHTcBGQsnxo+iUAVR0siSW6p8x95WJiRaMBl9++bfe9RmtpaV+ljia4Oc296w21zDxf2o8Jvke7nGghlgkRM9Uo3gaMAe6884iqcKLom05VguKjGp1Ue8XQRacYeCuTlk5xdMkumpoer24qtuFm9cAq/RtaUnFK94HYJvrWWbE7chSb6o2Ho6xy1LDl11YkltzeA22rFZy34B7uziWw9QqlNwjhuzLFwDEe+t/GrL2d2Hq8GLofto1jRHnbXpx1p0p1YHkpnmex16BxdHSbX+3IdJ/CzWdiV2HvlbPG09DVBAUj0fcu4XYMhNiausMYwWzO9RaUL/vWr2+/eb3NJcMQJRwk2WZTfntmLLSKyVTtOkIQ96p3Q1LUtv1msXPneNrPPrJQ938akPtT2R+BAvfKdMy2YdRs+LosRNSaePtEXZHz6XNkyL7olZgTc2Etpj91OQ9aqjVNf7h8fg6zROduG5BmLDFnlor7h9YUlQ8eZg7aGBrVnqeWA2uc0L0HcevErtqgA9qaaWsmtoe01QTBLlGQvzJdDlBvsLbamFz7y9fFXgNH4uSDevXWVKYcqlnXWdBVwFSe8XirFKPnq5IDKkTskmKqlng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(9786002)(38100700002)(33656002)(86362001)(2906002)(26005)(66946007)(316002)(4744005)(66556008)(66476007)(4326008)(5660300002)(186003)(83380400001)(8676002)(426003)(1076003)(54906003)(8936002)(508600001)(6916009)(2616005)(7416002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X+dZPpvkky70dP9en7T6hiSrmCxSGUAmgjcMkUKUJY0wOJgcDqTF5pxC8OsN?=
 =?us-ascii?Q?w6Q8yVDHHnikPVG90Jwo4PwXorAIHgdBkZl6Wcggw88wTSnBia5BDKkFa2+9?=
 =?us-ascii?Q?m7jtDKoTZgDJzgDLFOp3sXFwpSoYPg3AXRrGYQdDsuB3kZaBQSSN9dKQJn+s?=
 =?us-ascii?Q?Alt/CdgYWbMHm6hroOZr488EBIfoZyXbXwngHVt3xNzf/uLTTHlQ9gOrje8z?=
 =?us-ascii?Q?UmVsh2jGnNW76VkyBFWlIva/31LF/b4eveHxLkxMCKpGh1mV6TLfbu9F8hsf?=
 =?us-ascii?Q?dQCxmvWWjB3KT11obvJp+7tPIBIyFQ/mrebNazg/xfd7//QjjXcVri8aWJzz?=
 =?us-ascii?Q?8rVZSkINix8X2tZ29p0m26tyAe91rCt+YJ8acmG2ZEjvPTSiXtf1GZkkNeGd?=
 =?us-ascii?Q?n+qDmhbRro4MpzEZqzTLG0kB8h0ffEndGqvFOU0slyj0XZUetIWkpr/Ghj4x?=
 =?us-ascii?Q?fHeNqNoFSbBySEoo6zDvYpZ9m31GEkHLIDmQkYyTnP2Dn47/5HRfkCACM3BV?=
 =?us-ascii?Q?mNu0hZB7rQZaxL69raONp3ua+ziAXb1Yf7uABGkmQ2MbQ78iN5w+avKe5y6a?=
 =?us-ascii?Q?4H7CCa1lvOEYVJM2HoNjTxcI3bLJufhEZffWFCmC6iM1d/M+AIWqp5M8pS5p?=
 =?us-ascii?Q?n7EpeCJHg5JeyMVIirGomHsyCOf3tT+lyTBIcv2kRl09XZQzeKXLjRai1/Dq?=
 =?us-ascii?Q?uym40tNibeGEykV/DmU91eFVu0e4eWz0bBdBU2OumY4y00YxaEfkePPvEyfe?=
 =?us-ascii?Q?TcAZAFPQHFhP4tC4jU8779bWFaNuB7df50ZNH6RURNVTLLeQw+ag4CF/jW80?=
 =?us-ascii?Q?QXeamU4qYQTei3y6XtKPEGguy8bcQYfS/4w0Iw+p+kMzRv0wK4mbcJiMJdAN?=
 =?us-ascii?Q?S/u8NKiULLTrAiTZW7mcg4SIx94SvG3cepK7pQLj3ysi31KL8n3yB1zBO1Nj?=
 =?us-ascii?Q?heM7mRYOJbAcqPuPKQHxdF7PngF5v2UDIho1F7ft29lovMXSUo31gKoHvqlA?=
 =?us-ascii?Q?KVNP8aeUwDruczEK6hP95Iz2kqK54Z4VrvwVoa3R2pFgwS8g/uPx2icuRwaj?=
 =?us-ascii?Q?xui8c+nHRO7BspuArNCogFrVx6JuNaOL41G1Fe+ZiXX7v4LD+WuFwtuUjTdn?=
 =?us-ascii?Q?3GDs3wY8DoinDf3GczIxM926OZvxFTfpyn8M4YHi+HPUpT51B2sz7CH9EXrV?=
 =?us-ascii?Q?+NLLhB+I4fcRSs3bC4DenaHoEm/oKDRZAD8XZLuM8DX1S5PwsDL8xUxaKjIg?=
 =?us-ascii?Q?eorrZeMw/J8ITIoKonABDTs7zeuKcjO1XKzwY+LU50kzSXJIQYFqnRJv83yX?=
 =?us-ascii?Q?uj0/Kj3lS8Rbanx7g3/Xxj2jPfZA1dmKyZIB8sV84ky8QYa9SG8v5Z7do4Qc?=
 =?us-ascii?Q?JqoHI5X44HAAJRr/Zj2P3Draic1mE8X6oYUjpkrpYBKxVi86MGiGVU7JuK51?=
 =?us-ascii?Q?KJHvgcqY0t5cRull0r08BU59HWxnrixdPoYilWw3Yzgs3YUmhJP2M/2ejjlB?=
 =?us-ascii?Q?vY/4mHhaOgO2/ehzHF0ztGqQQqMUpwgAafdt6gJRpLC8bNnT4vpVjmTLlPa9?=
 =?us-ascii?Q?i7Px/cPGmJzG8BQ+Lzo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bca73a9-c3c5-4528-f349-08d99f8f28b7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 12:32:26.3034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQnr3NBzVvG37JnxjxwNNedRfDouNFv++urAz/3fiT6AleC3RYrF29Pyz278G8Jd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5255
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
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 02:30:20PM +0200, Joonas Lahtinen wrote:
> Quoting Christoph Hellwig (2021-11-02 09:05:34)
> > Remove the separately included Makefile and just use the relative
> > reference from the main i915 Makefile as for source files in other
> > subdirectories.
> 
> The thinking behind the split is to avoid any merge conflicts as the
> gvt/ subdirectory is handled through separate pull request flow and
> are note part of drm-tip.

Oh? In that case can we eventually move the VFIO mdev driver to
drivers/vfio/mdev/intel_gvt/ please?

Jason
