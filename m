Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346653F4F88
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 19:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C452F89A94;
	Mon, 23 Aug 2021 17:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DEF89A94
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 17:33:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dc7tEkX4DH/Twj/eCTHt+5IqrX8KvBE/WRmb5jW7P0sJW6pxVHGMoIPqsDrychK8wskfRHlO65sayb0/Yad5oVnnL9YsbSA2ao8hr3v2AqeN+5UssNROHKstLuTGLxLnH/g+JZ/cE9kgnBuf4S2rpNHggUvBfVg1csLPSoZFy8U+RpZb3xJaCHQb+s12FdGvCaU+cVyzg4GMrfp7k9Ymv/fOdqufRmXvthBXJDxE9ZXVpIdjIDlM9IgCxVpI2TYEGs9Em2yZ0QG/igSVybUjfdQ221Qyxl4ZwJc3PZB9Y3/st4GMcIh7cNk3NwNECCqlPhwAgv4sm1dZswKAOwtGow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsuoXfBOG2mpXQuos4mOZk3bSqwk+X/ofUXUb5SGa6A=;
 b=f1xL+41iv85EuhbX+VtSR/BxX5rCjyp+axKQ9oNkjFtlxlvmY6d263eSnEoVZfghDzDso6pRNgdJ/7V2alcsTIrq9c/e2j2vXh/gLgAi6Ot3f7MiDLm8akZMhw8oH0Tg0iQIZhGonk1HVvFGRwebJyWKjEd8kD7GzaaUeNkbDB8wsLifGb3Pz0c/eo1oQ3pQeOoklxGbEL+9KM+XBbFTrdY0VNuJqUSMsv9xaK9l4CKzSD/3dqobwaz1gj5+9fJ0f1Rwo2IYNVU25C811VYlbA9EYV+hP20P8hIwmAPzV2Xe/fzCLn0r+widPx0v+a6s9lIYM2Bsf/xFMDfKT0s57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsuoXfBOG2mpXQuos4mOZk3bSqwk+X/ofUXUb5SGa6A=;
 b=WNIdbnSvwbsgh9Ip2IgpoAsgNkOKCHk7sDrgsdar73F30GHXmXragqzqliFh/MPMkRX8WIsXTJ+5wJ1Lg4oZcHj6v3i9Huowi0Z7mc9XgoPZqCh5hK+rtEJPrYtVcFZu4nVv/knNlNjgsVwSdkHe/J2K/dUr3taUz1Ro3xDuHtJ51M5r5S8O0XN8lyfH9TVL/WdC1itJIp/5N5grxYiIa0foP4WhpEMfR5O9VEbjohPQQIQrIpDO2UrU+vxJU/e9xw4O3BAXycoRn28veCpKEyAmPjPTrINNto13vv4GdikfWA152B5OJA8QrSwvnZyyvcZqVPWW/zx7+ehZVUxL1g==
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5335.namprd12.prod.outlook.com (2603:10b6:208:317::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 17:33:40 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 17:33:40 +0000
Date: Mon, 23 Aug 2021 14:33:38 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Leon Romanovsky <leonro@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hmm tree
Message-ID: <20210823173338.GR1721383@nvidia.com>
References: <20210823175027.3f3fabd7@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823175027.3f3fabd7@canb.auug.org.au>
X-ClientProxiedBy: MN2PR15CA0023.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::36) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR15CA0023.namprd15.prod.outlook.com (2603:10b6:208:1b4::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:33:39 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mIDpK-0049yb-NO; Mon, 23 Aug 2021 14:33:38 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53d08263-a76a-4689-3f2a-08d9665c255d
X-MS-TrafficTypeDiagnostic: BL1PR12MB5335:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB53353B6A399B8B77AD87C0F5C2C49@BL1PR12MB5335.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MDEgnDE85siJr9Afjcd/G24/7+d0RxQNf5D98qIS6VEIJFUqFFXBJlHv4EdHxZS/HHkh+b4tZNJen7gvEAACz4Aj0RBHM2yJ4ZofrjGC1EBZXzw428EvNKMCWVRg7JjllgB4u3fizLJZCW69kWnX8pKdwS+5+J/MQUIJ2DVsQYRZLrFrRcBkJZVK+pwWThUudzjlrH+INJrXkd0XPLK6/a/ptgqDonfqQnBKv4YvCgOlvVeBNBsFCBky68f84ENBhp5Zbr8BDiB/gSG0wVEch3imRy8tuRbsBMxWC17eOq62DFjO668NjxNhUv9+n7rW3HmS19WNiQ2XUU30HNMsGsNEqIagHWF1XTn060yxdDi4r9ef7JrL++qTsZZXBgpBKwkPVhabbYFoho7BrTPTu7xag4/dLkrVoKRTY0oDtbnKaXmA6kq39F+jiBx9xN8oPx/epGZ7bbxJWWlXvv6FdNTYeBTrt3N/7qqt586WH7ETRyQ/NHoe0bw1um797m1l+jBwaLUit4UTTxwxAnpE0vS73r5BGTIJVBbIyc1JdpZD5mg6dKaX8yvDU0wXy0+GQuI1O5IgekoZI9+o0Exa4Mx4X8XQi3+0IU3RT1sK6BAiE7zWlgjoPDqQjHsBJMdXn7pPFWocgkbnF9c0TXbXxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(8676002)(9786002)(6916009)(2616005)(316002)(8936002)(9746002)(2906002)(53546011)(4326008)(5660300002)(33656002)(26005)(186003)(66946007)(426003)(478600001)(66476007)(66556008)(38100700002)(83380400001)(1076003)(36756003)(54906003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lp3Z/OMfOrKZNtrjztluPLDwTP/oHNRRZ6Bgd6I4csxOKhHn4Kh60ttiDjA9?=
 =?us-ascii?Q?kDxhiLigBzt9Ju2oHZjJpp8YIEGVp1oI9DURVVCLJuFAnvafx94pPeeC4waq?=
 =?us-ascii?Q?+mSVR5z1aez0lLAx8/NMIhfUbgo8w6ooLUH0lTlLTcIY6hR14irJZHuW0hLG?=
 =?us-ascii?Q?iIE9QtdyQ/qvsnz6YxmiK+9kXqaGi/6KBEh0X2bFK/WeNoEGBuX4S4LN2Udc?=
 =?us-ascii?Q?YUSrByG3lv7AShpViwyCWFQ2W0doy4MMkuISJ2uZ6Lel55WOoX7g8jrmUXYg?=
 =?us-ascii?Q?yAflpE+fYMdDNKhlSOro6Yhc3AHUPh4B2I4NGMbYVZxYNXr1DeOR8Mn/cNIE?=
 =?us-ascii?Q?sFH1rxJ51EoBks6QEi/4gMXGkcBNslPMbGbbxsRci0lE1xdWmFut+mFx1fzg?=
 =?us-ascii?Q?/Z3U7FP2eoMyJ7yjSi8B5NKzfUxqeehU+62/VxSXVXP4cp/+fN1RwTVVxWe9?=
 =?us-ascii?Q?HzR7TC3u8fjKbL+ho5p0XAzg074AND9ygvhVfuGYH+njgcq1beRa5fXEKCLa?=
 =?us-ascii?Q?ZB4lvjr3dEJEPIMLPjSxGP/ou8D9ZWtl2pXE5/9w4eYXLSCpiFA6sKn48yhC?=
 =?us-ascii?Q?75Q3Gb5MBgfKMXvo4s4d/zA7TAV0OJvqXFcT8t161nAA6Zdg3YX51mkUMvW5?=
 =?us-ascii?Q?A14lub/6+bOgnIwWABmS8MPPbod+/T5sPjovbcZTEK6qPUjGWnQvttsRjPt3?=
 =?us-ascii?Q?WzzQxlgi2Qk1DGC5ur8tXy3dkVMV16qUFPugwJNSVle4i2m8gO+4+oDHPQn4?=
 =?us-ascii?Q?65h42fAlmXfi9ecRBNV+mRHUMFc/UMMwZXZxVc8L/Z+R/4DdWWxyV3l6N0RT?=
 =?us-ascii?Q?dLo2MplvTuYpj1OtCRN31gMRqwSQTiY82fcUvtM0nC/FPPWVIoqjXREN0jhD?=
 =?us-ascii?Q?9knJUjIqVMKKUmMrQ6I1XA/4XO3P7dkU7926TD1Rxv2SaNw47wcYEl3Lndph?=
 =?us-ascii?Q?wpkMWlkAGs51ZdlcmDNrKXsxAA1kQ9Fp6o3rt/7Dp4nuObuS7FYUpNTUrg55?=
 =?us-ascii?Q?BVV14Gm7SABIM/3/gR4G7r/rsnbo7Jn1ObU6mTwQpSnzfdG4sJDOkggSQ0VC?=
 =?us-ascii?Q?ua9X2FCGUEn4nbdZLXsuvucD1duwZh6GhnSUFR8lxkmDXCEDz+K3dBKIUkK0?=
 =?us-ascii?Q?SUxKHcNO3N8ucT7IbqeSeLemy41EU1gHnB71ftWrs/ZM6gC2mBzldQfMrsl8?=
 =?us-ascii?Q?c0WWjObviOol2wzSarisTh9yCn46iJ2YhQ/NoUarbyIZqVF52HGFmvhENNwr?=
 =?us-ascii?Q?3TwISpX8NBFymdjyJH+0Q6z9hTJ24YZWL6uonX5QskTDlLW8JERHBysOijAr?=
 =?us-ascii?Q?l3RC4B0i4hhM748sIxEnFQNm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d08263-a76a-4689-3f2a-08d9665c255d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:33:40.1469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ky5xhSPQgTP7CylUI89hz8srhgMsImxk4nvYc88c6ldviILDRmT7iJ7qg2Ro51hL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5335
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 23, 2021 at 05:50:27PM +1000, Stephen Rothwell wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 23 Aug 2021 17:46:27 +1000
> Subject: [PATCH] drm/i915/ttm: fix up for "lib/scatterlist: Provide a
>  dedicated function to support tableappend"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 771eb2963123..d3d95934a047 100644
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -382,7 +382,6 @@ i915_ttm_region(struct ttm_device *bdev, int ttm_mem_type)
>  static struct sg_table *i915_ttm_tt_get_st(struct ttm_tt *ttm)
>  {
>  	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
> -	struct scatterlist *sg;
>  	struct sg_table *st;
>  	int ret;
>  
> @@ -393,13 +392,13 @@ static struct sg_table *i915_ttm_tt_get_st(struct ttm_tt *ttm)
>  	if (!st)
>  		return ERR_PTR(-ENOMEM);
>  
> -	sg = __sg_alloc_table_from_pages
> +	ret = sg_alloc_table_from_pages_segment
>  		(st, ttm->pages, ttm->num_pages, 0,
>  		 (unsigned long)ttm->num_pages << PAGE_SHIFT,
> -		 i915_sg_segment_size(), NULL, 0, GFP_KERNEL);
> -	if (IS_ERR(sg)) {
> +		 i915_sg_segment_size(), GFP_KERNEL);
> +	if (ret) {
>  		kfree(st);
> -		return ERR_CAST(sg);
> +		return ERR_PTR(ret);
>  	}

Looks right, thanks

Jason
