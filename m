Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E903E4FC088
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3D810E2A7;
	Mon, 11 Apr 2022 15:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D7A10E2A7;
 Mon, 11 Apr 2022 15:24:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gu5pUG23jU6hnUDZTWV38w1WvqcFYHZtwUpQLHS4t6HfMnEessHmaJj1SzdR8IaV2i/iEM5+7cL25cIdq1hVBTJEeBZc3BrR3V+vnQVcSJ6wXUYASqVyGxeekIBfUxemBs0g94kHcJwPqx+rSFUKxkBSzMRrnUhnPYPROZE2ElPNkJ9vkfaW+LCXveU9SXelZnadR/OG4HKFyMDLf8sue5wlDaLDc/z9GmODEV9FuUlHv03jK5o4CDE/ESxNpo7X3Fvh517PDxRV02AeLrQgrltJKxyat0/OraxRnR2CBF0DVZ2A5mLteE6LuMe6nT/K00xE9JE4L4s9Qd8+NazEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdVpx4dREo3Rz0Y1/m8t/M4WPMss8RtxDXBXuD33JyQ=;
 b=ZR1UH2OnYpUkrpH+vHvWx19BVHYQeV3xTFvW6GrsQfIdQt6NVG0fyCoGMacBH+AfcgrUCOzvBrLDdT44H2zl1fdA3RjLv/SxN03DsoG5NEGFV1+giLv7lUCOHGLeUA5d2y8up5aMcTy2ASCVRegltGEOcgW56HreXDhg1dDGADz1lmIDxYJJU8tSWvzJ6tMNeYnv0a14NYUWE7DYXG/SJTCkoOsSpoXLNuqG0PYm//PzQGLeQCAn7KtKtWXiMDaZHyqOSWfFsMW7q5jtOiYYjq+7ZMHeGW14aUm7vGLQ28q5NAbMKkdxU5wycPrF1kuhlQMulTF5fFxw3yKWcjD0XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdVpx4dREo3Rz0Y1/m8t/M4WPMss8RtxDXBXuD33JyQ=;
 b=sqU6s7GuybPR1l8A99S+IS8w5+ADFlT0MC+Q6GaV/aih6HuLmJfvzwRUDC1RPbvC/rmCHO3vQej8DnPcNZU0CO6uR6p/4sBRRo6dkoIgcRxPwvjR9jxvh2MjxO03t2HBt5EqDvc3DQZ0FRRba5Oa9gmQYrDk0KAFDvHGneCN3Pwx+AV73De622hEPO0iLJ3CcYNP87xCIgO8BEF85DyKFTsueHcSPqdC3RGvFBjGgZpvrYTtxUFhQPljOi+aNpARPIOYiF0Aeu4JmoZ0ty2gIB79TDK8BHsnZ6HFKnBrlPkskUDRtNhQ4ahRyaGPcv1+QSXiwTgmNjAiWkC4Oyk5eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 15:24:23 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 15:24:23 +0000
Date: Mon, 11 Apr 2022 12:24:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/34] drm/i915/gvt: don't override the include path
Message-ID: <20220411152422.GG2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-5-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-5-hch@lst.de>
X-ClientProxiedBy: MN2PR15CA0028.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::41) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e542fa22-8b37-4970-0f4c-08da1bcf5b7a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4105:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB410520172E4AB4C8B10DF0DCC2EA9@DM6PR12MB4105.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cfWkzzfAfsT8E3pXsFvzjBnk5g5Ht6BKjwn4YbsxbGHBok6F7FthZDjJ7GC7ge6qXu7mpcrh6lJEGAroxsqRbDVWWFWsJYeMlie3lYxoihS1ssWU0kg2s6MJaYOlOwtEDUhdxzWpenYZjpQQHefyaoLfeEgH4hhhB+ofo8aYPtrTFMH2C1UrtbBTxBge3vEsuI3qQH4jyEKXek9t33fic2t4UIkieHkNPAQ13d+I2H/suAKZqG1VwB8FVSDsjZTDFfOptc1NhHQExxIPAdkzzz+6ZeXf5T9FL2ww4LJRuo8ZUih8w96+fIV3jfITZucQre7h4vvIMBuR4q1cVGgBdKWCMgO4+Z7Wp3Le/IV274sqns68bCIw5alBSkgR7cogJJ5nDxxTwAtZj9AUTPPY/9ZP0YJtOe/QUn4wg+ZmpmDXhSrYUSz2Ufwov/R4jqfnBmkwEe2s3CiPglG7wkzaqbBht+GN/lzasl+VVRvhQzQmbBAyNgmVXOp4J+RpLaTDAedLwVTfEHPej+ouhNChfyBUT313VtQJxmqtRLnv5q/I0AcHNDs+Z4GCsPKah3/duBIT9zmVNTdoIkpmK7E0puP7Fkg5dNKwJ4Us88WYRIMSoa4sNDytvYsqBkAmRAKry92b18ZCr56EbYF0YhZ/Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(186003)(26005)(66946007)(6486002)(83380400001)(86362001)(8676002)(66476007)(36756003)(66556008)(1076003)(2616005)(38100700002)(508600001)(316002)(6916009)(7416002)(5660300002)(8936002)(54906003)(6506007)(6512007)(4744005)(33656002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hsg5fbsvX4bKlvlpmjFGzpwuh4BWJXBZ9kbsBJBDMa77BStGo45oniD5m5vZ?=
 =?us-ascii?Q?5ZBp/DlHlhX0a3L47mo2ApWlkw/HGAPxPewoTKijOEx/pAaoxp/KNzu71ZRL?=
 =?us-ascii?Q?Fr/3fOFRdaFloSU4CPc0v1qkpwNy3+TcVEzWrqgPI26YQfXQhAT6MgZ6LVkI?=
 =?us-ascii?Q?xOJDTopbay9ar6zidCDrkyN2bqQ/sDa7JNiF1TgqHqmSy7J1IOhepU6Ol/6p?=
 =?us-ascii?Q?Og5GEcuzg2kcJgpZ9sOOoA/a4avP+7ylTHCQZFRquzYbH8N0Nh9Yd8GzizEf?=
 =?us-ascii?Q?WA7GCLXcSqmx4n6xFCZkhUj7RhO/MIfTC/cXdZ9yFpIEtFOHxcQz4jCFJbms?=
 =?us-ascii?Q?HCZmZXbytH9Zx6fh+jd/DqvnJmOK4S6gidRueXgmTBurdUxpUUacad1brPBT?=
 =?us-ascii?Q?EEx+xZEJx2I59v0SMp4sHpY3xaZqjA8PwghSL5rsku3xaZ5FCJocxW+30Frr?=
 =?us-ascii?Q?6GdbU7nhs4GtSa8TQSMd/iTDq/oVhv++pxo/oLpVe9P55UIPWoiTLJ1FkYwr?=
 =?us-ascii?Q?iX4QtigmNvHHC9GFEi0dhOWPZuUDcI9z4DAVsOJXAgohbM2KJ79QVezX23fi?=
 =?us-ascii?Q?SdviVejuMh3kYkOlUlzJEndpPql7Nl7Dcic7p0/sX1CiLqgnPX3mmvsTIQtH?=
 =?us-ascii?Q?o5iWx4iDFVfCloz2sFn0P8L6To4joK2SM8RUE3l+uIuUt8AxqEXTMSOT8XBb?=
 =?us-ascii?Q?HwCNzRsSeAaE/dZKAElx9TyLRNUkT4GCyYOe5aqoeFMt4enFNSsfwpcoXAUG?=
 =?us-ascii?Q?ptezgUhQKlx7VOuzYdRlz+gkvJOUEOdAzVnMe2/GP+VUjSQWDLG4JkrWAaQ/?=
 =?us-ascii?Q?QDoQpyKtKtZDh84lC16+eSWOJpjhaEH71UQe1kfqH6ye0GVJ74PsR1RwkP6P?=
 =?us-ascii?Q?axhUo5nG6RZvoYGRk48qbBtUjAsRJbQZBBZGsz0mKGbWiV7sB3jroJY7KMAu?=
 =?us-ascii?Q?kidzGmcKefVvrcXBAB3qmqZVfrvbFVDu4CWSZDaJSw6JDmpJxE4tADDg7REQ?=
 =?us-ascii?Q?1fCesHpDhUCo/hP4VBYPLkLuK9Iv4MbrfY4onJLAzxF5oPvsDecT1Pc5cDg0?=
 =?us-ascii?Q?6gwR7eLpWnQZw9iLY2PyjUnsUvYCTIOX+3qhXfZxid9bv0vbFkoMIFWDTD6a?=
 =?us-ascii?Q?Olsz/QBqyz7OHHcAVHImv1W5lkB9Dc0EiNMMnMzAF0j44bFO29wYu6OVqG+t?=
 =?us-ascii?Q?nPEIFtGRwiS/mdxBK8KbxRtwXQQydJndhc/X8cyaPlMWMWA75dawsRMabAMb?=
 =?us-ascii?Q?853Mn8f2HuGy1gK7ws2PV9LhKyBgs7IXV+aqupdFL7hSEswGDS+pbLATUAOw?=
 =?us-ascii?Q?ipkbVdqWSmbvzg3YNENTYpoLzTGQyQgSRUGh8haWyX0BfMuZBVFpmGH6mlwd?=
 =?us-ascii?Q?rTWxdr7XS5YywbX1wjZXePXTMmDGmxmq7mCDZytC92kvRtRMXZDi+Sm+q/1G?=
 =?us-ascii?Q?GA+Af6HCT92PJxRe9nsnBwbbjaC86iOCr+EmnS8yqGEWs1sFxoFqAE53O89l?=
 =?us-ascii?Q?XKRN/AsnpJ52T5t36SOrjKYmvMxxYc6mLVwLEs1szGI0FRtgjyn3pTunGZ4K?=
 =?us-ascii?Q?liWfgS5yUl03LrjrJrx6yyI+9jGJNs6gSBiF6AB91MpFE9voVnQ3+W5tma0j?=
 =?us-ascii?Q?eEm9I974lDYtjZlTHcSdLPhZYyYr7KxClqswP45Zaoc4khgLTQQUcR7bYG3B?=
 =?us-ascii?Q?FCAXmF/yA9UU77VoaJE9Wxy9MgyFcNOqEqxBRrHI8bF0BtszqjspeH/EbnX0?=
 =?us-ascii?Q?89p1trP/fA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e542fa22-8b37-4970-0f4c-08da1bcf5b7a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 15:24:23.4049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9XFUfwPy24zaBVNG+uZvrf6Fr0ipfqaI1PhYbiahMJE4PvQ9D6cte1+lm8Dt+AE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105
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

On Mon, Apr 11, 2022 at 04:13:33PM +0200, Christoph Hellwig wrote:
> drivers/gpu/drm/i915/gvt/Makefile is included
> from drivers/gpu/drm/i915/Makefile and thus inherits the normal include
> path relative to drivers/gpu/drm/i915/.  Fix up the gvt-specific trace
> header and just do away with the include path manipulation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/Makefile | 1 -
>  drivers/gpu/drm/i915/gvt/trace.h  | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
