Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AC73D24BD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 15:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C206E187;
	Thu, 22 Jul 2021 13:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DADA6E187;
 Thu, 22 Jul 2021 13:39:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKcp0dxbJHnuJKVQeX/n4NUQQ8WPwzqXU6cFv3s+J0G78ymA2dH94t7eiQpPxsv5fcCsxQSofQH4Ki3E8ffjPkeHxArnkbpNmGcB/hNoXPDSQ3QasyHxRJBOo+IQcJTF/1WVA646YilZptFLBAPBsYPxTMpbWItZ38oUMnPektbWH1uk30eE/2/AN0pY84brESpFX/iC7TOC6bR0rSzEkhGxsZt61RgWLurQ8DoW0uDDAffK5SLqj6b8a3YXxKZ9mh18WdZWVuhdz2qAdlzcup5jA2lNXcwa6zVyWIi5lVkQcw/PsNTMeafb03n9s3TxrV0V+PcaNPykdcRDRXQqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pkob1zYs+qM5GQ6feDd46mrUgsUbAPSJAnn10QfLZZk=;
 b=cg0OG7wBHfGBRm6GJMqz1gkBcRGNf0Pz5YQUouVtE7/KsdJAFlnaNVQkcC9GUHR0Il9K7XfSdh2JXdPjzLB3t10XX6MZcQ1NosOIncjR/U8dKqeaOliY2bivWd51cHY2v5MUV2bi5117GD35+T9GqwH0DHehYXtJPWnF/PZsXQpatR6fcpQdSutJesG2HN7c9bX4ZA1ORh3CLeqTP/HschLUPYGG2piot2/gL7JzWulr4task/Kvu+Q8a+/keipow2PtfesQ3HUiiZSap+nKu1PD2EQ4sMWMVfS2JXuPAHDJFkJFafXymwPu8Zd5yYiDZ7tJTxUzYynkkps6NQ3Ftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pkob1zYs+qM5GQ6feDd46mrUgsUbAPSJAnn10QfLZZk=;
 b=Zt9iJYX3wOh/4iYYGs0Nrd+bgX4DvSzFez/GRY9fcsv8cfkjO9faKmO1wJWKd04LgZCtIaza12pHeKFKqvyIsrVD6eqaJEZ6oesMnaMB77sHujo9eg/yLEDMdSoJLukQHJedRq/5FK/RRMLUh7Zp440yTOSCFt0Etb4Dn5Fn+RaylK0PFy+m9NPMAHBgLoSQsUo3B1KcA6uIh+rNl4Y+r50kInK5rg84D324EfKH+02Pl10Cboajw7IHXebe+Qi9tbZDdt+SUPzrQKhZ1JDxvrXeyj4TCX1qmwzZOA2vWLibH/Dbr/u4Dci6oYiXXgcTDcJEzlX0OPKTovaO4SaSuA==
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5240.namprd12.prod.outlook.com (2603:10b6:208:319::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Thu, 22 Jul
 2021 13:39:02 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%4]) with mapi id 15.20.4352.026; Thu, 22 Jul 2021
 13:39:02 +0000
Date: Thu, 22 Jul 2021 10:39:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH rdma-next v2 1/2] lib/scatterlist: Fix wrong update of
 orig_nents
Message-ID: <20210722133900.GJ1117491@nvidia.com>
References: <cover.1626605893.git.leonro@nvidia.com>
 <36d655a0ff45f4c86762358c7b6a7b58939313fb.1626605893.git.leonro@nvidia.com>
 <20210722130040.GH1117491@nvidia.com>
 <YPltp39n9URglTXT@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPltp39n9URglTXT@infradead.org>
X-ClientProxiedBy: BL1PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:208:257::17) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0042.namprd13.prod.outlook.com (2603:10b6:208:257::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.9 via Frontend
 Transport; Thu, 22 Jul 2021 13:39:01 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m6Yui-006FHU-Ta; Thu, 22 Jul 2021 10:39:00 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e8957a7-3355-497a-2129-08d94d1610f9
X-MS-TrafficTypeDiagnostic: BL1PR12MB5240:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB524070397825E28FFBC2C782C2E49@BL1PR12MB5240.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUIRgGSGFxWN8qghYZvWrwEv1uCyxPI0pxq6/FXO23KiTnouBfAsSdR7tsb1ep8PVOE3X0d7wathjr14Tw146++cjmuor0waYl5n11S39plF+67BzwKOOJfBaQnm9+IiEFPT1Tp+MDyL2DgRse1qc8IaaleT+m9KEK2g+iG3Jw9IiBME7VzDp1xmv6mrpGFkYJwXsazBM8+J7GLeBHQ1Owb9iFWQ+gzhhZwHhjiyd/WoWSRQntPTeUlSkyNrOX8G0idxnPDeq4WRdvPk/G5+wvfIAh6BZwWHJJNr8WQE2wwX+SKdwTjFRjuAFLl0fAiguCq7Q/xZTU93Mz89MkxAn7s4DgomqYo0dPMytm4HXYpSpfaHRq0xwBsaNaqEosvY2AzmZMhsl/tXcWLtxPZfp6Ej8+y1sUFS35EDysVR57vky84AL40qiFH6DaQhx500xjNR1UwPptj1iJNBB1F+Z1tCCs/hllMT1IqLTMyfLwZI0t/DgBYBcRKq1K0B+YRU8I6+TA2TFvx78sulhxZzLua268cpvBiOn+58mXTLsTwkWwlFpvHv6wbCJdtLK8dYKBXGb2LpSZeaD7BZ3hG8TmoUJ+MbIyEgWB8t2rSTH1MR9C2qqvpGgc9fMxsKelKbK4kDxys1ASxUVkIO02c7bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(66946007)(110136005)(9786002)(5660300002)(26005)(186003)(38100700002)(316002)(4326008)(478600001)(36756003)(2616005)(33656002)(1076003)(6636002)(426003)(8676002)(7416002)(2906002)(8936002)(9746002)(54906003)(86362001)(66476007)(66556008)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SnmMHp4dcd/Wcd0yi+Y3sa67hYNYP402tgI5GLtRMNPff7oG08mRH2g/pKCM?=
 =?us-ascii?Q?KjBbryO1+7f5FW7ho5BzM+/ThXPtrJNK1Z9D9nAcY47US0EM9A4up81iaQ8Z?=
 =?us-ascii?Q?WEivswhHcBkjQxpjVydn9F2/JXkaY8P2H7dSNNZLQ+fz1R3wOpQQsQtiWVi1?=
 =?us-ascii?Q?493b0oUjvO+PD07xT2YJMhN1CZ0LbOIsssvOUltG0ZEm52rlA9AJpTjS2ooX?=
 =?us-ascii?Q?sLWiQ7CXvjLKNobhgQrK3IlzE9h3afJBWm6kOLXItgfHwwHyxcRl/bYiUr22?=
 =?us-ascii?Q?poEJ7+F+K/BT7TMKy9wi6eKHUL3sR+jFN4nonz0QDA+zKjKpHICeADPl4aRm?=
 =?us-ascii?Q?abuRMVZM9O3xLw3sfTAoVTwUc/ONUjAnPewHbspCbB5zDtvYGnhR0joYs7l8?=
 =?us-ascii?Q?M+z2LA2t1NYxs3UqksgLvbZ2Onsq8qkMxegn9UJz9j0vPvNBvdJzOMrUh5+g?=
 =?us-ascii?Q?nxuxoj9ExvxMd7XWpcjlcq/DV3hUKEhJbn5qdfHSZmTOyDAx2X/Xqdl+scn7?=
 =?us-ascii?Q?YIcogVxD5RTZv5R9dPT74j2qoqyNYTkoJHqAlFesOyM23L9ThsVujPyRohJ8?=
 =?us-ascii?Q?5zV4WLayUUHYQEaU7mf1/m2K3PoLmZVWf3fTwOlDUDrGHLU95G8fmNaGDxX/?=
 =?us-ascii?Q?e334Di6WAbMtSU3tILGdCsZVaxR1ru+kELbxK6Ta1AP4mzt3zG2wCBrqUJww?=
 =?us-ascii?Q?6J+YBsOku9SH6AgGpKdkSJlSk5rvVBTjBJWLgdYn5fO27tblO2ZD9RBBzWfG?=
 =?us-ascii?Q?Fhctf2yOfzjc+krfgvInh/tL7HkzrfsptWgzcRO2EQCkRlTNTzZxhBB11FpW?=
 =?us-ascii?Q?iYq2QJim2KHJZ1gyeD4SSPQDm33zMWuazIBnhvtSjepmKfu9/Tz3eaE49zYd?=
 =?us-ascii?Q?dzNj/nVpd++LRIJnoSd30Vn43L6hbsC1BULb5LT5YAxvGDiTBnYc157w4lZK?=
 =?us-ascii?Q?wiZP4OS4j2WGylT8wR779+gG76WOVhHLR4WoeqikZiIjJslxqbS36GOTMw0g?=
 =?us-ascii?Q?AgsH0uT+NLDXET5xsuQoirhXTs8zs2upafLVH5cMMQOwEn3YEXKF6I5u86Bd?=
 =?us-ascii?Q?9nFdgsFNGbREROqD0uBpK34ejc3dpwolYv+Px1VTfQY7LHbl5XrsCGreMZ6L?=
 =?us-ascii?Q?gErskOs9jsdMt91OPLN3bEsV2lzZ4Dht0dKgBnszLsqsBgbnueyvJZeuMcoH?=
 =?us-ascii?Q?/pVbnlotkO/eutmxVezEza6CA/R6eApgIdFcPe+wtkAahzMeI430oGeSah2g?=
 =?us-ascii?Q?G3Ef7yMMACA15NTothkXlWp+8N7K81R2AGTXij+9uhHVWMKs4K6F1UkZn8nA?=
 =?us-ascii?Q?YIumO13Y9Rqxn0S2MQWay7LC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8957a7-3355-497a-2129-08d94d1610f9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 13:39:02.1327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4HBQV96cz73L6m248UgIQycOX+W2a4BvPrrnGSn0qn+GoqpK17QLT84eCyV77gK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5240
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
Cc: Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Leon Romanovsky <leon@kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 Doug Ledford <dledford@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhu Yanjun <zyjzyj2000@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 02:07:51PM +0100, Christoph Hellwig wrote:
> On Thu, Jul 22, 2021 at 10:00:40AM -0300, Jason Gunthorpe wrote:
> > this is better:
> > 
> >    struct sg_append_table state;
> > 
> >    sg_append_init(&state, sgt, gfp_mask);
> > 
> >    while (..)
> >      ret = sg_append_pages(&state, pages, n_pages, ..)
> >      if (ret)
> > 	 sg_append_abort(&state); // Frees the sgt and puts it to NULL
> >    sg_append_complete(&state)
> > 
> > Which allows sg_alloc_table_from_pages() to be written as
> > 
> >    struct sg_append_table state;
> >    sg_append_init(&state, sgt, gfp_mask);
> >    ret = sg_append_pages(&state,pages, n_pages, offset, size, UINT_MAX)
> >    if (ret) {
> >       sg_append_abort(&state);
> >       return ret;
> >    }
> >    sg_append_complete(&state);
> >    return 0;
> > 
> > And then the API can manage all of this in some sane and
> > understandable way.
> 
> That would be a lot easier to use for sure.  Not sure how invasive the
> changes would be, though.

Looks pretty good, Maor can you try it?

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 1739d10a2c556e..6c8e761ab389e8 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -806,27 +806,27 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 				       struct page **pages, unsigned int nr_pages)
 {
-	struct sg_table *sg;
-	struct scatterlist *sge;
+	struct sg_table *sgt;
 	size_t max_segment = 0;
+	int ret;
 
-	sg = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
-	if (!sg)
+	sgt = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
+	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
 	if (dev)
 		max_segment = dma_max_mapping_size(dev->dev);
 	if (max_segment == 0)
 		max_segment = UINT_MAX;
-	sge = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
-					  nr_pages << PAGE_SHIFT,
-					  max_segment,
-					  NULL, 0, GFP_KERNEL, NULL);
-	if (IS_ERR(sge)) {
-		kfree(sg);
-		sg = ERR_CAST(sge);
+
+	ret = sg_alloc_table_from_pages_segment(sgt, pages, nr_pages, 0,
+						nr_pages << PAGE_SHIFT,
+						max_segment, GFP_KERNEL);
+	if (ret) {
+		kfree(sgt);
+		return ERR_PTR(ret);
 	}
-	return sg;
+	return sgt;
 }
 EXPORT_SYMBOL(drm_prime_pages_to_sg);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index c341d3e3386ccb..a2c5e1b30f425f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -131,6 +131,7 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	const unsigned long num_pages = obj->base.size >> PAGE_SHIFT;
 	unsigned int max_segment = i915_sg_segment_size();
+	struct sg_append_table state;
 	struct sg_table *st;
 	unsigned int sg_page_sizes;
 	struct scatterlist *sg;
@@ -153,13 +154,11 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 	spin_unlock(&i915->mm.notifier_lock);
 
 alloc_table:
-	sg = __sg_alloc_table_from_pages(st, pvec, num_pages, 0,
-					 num_pages << PAGE_SHIFT, max_segment,
-					 NULL, 0, GFP_KERNEL, NULL);
-	if (IS_ERR(sg)) {
-		ret = PTR_ERR(sg);
+	ret = sg_alloc_table_from_pages_segment(st, pvec, num_pages, 0,
+						num_pages << PAGE_SHIFT,
+						max_segment, GFP_KERNEL);
+	if (ret)
 		goto err;
-	}
 
 	ret = i915_gem_gtt_prepare_pages(obj, st);
 	if (ret) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 2ad889272b0a15..56214bcc6c5280 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -386,15 +386,12 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 		if (unlikely(ret != 0))
 			return ret;
 
-		sg = __sg_alloc_table_from_pages(&vmw_tt->sgt, vsgt->pages,
-				vsgt->num_pages, 0,
-				(unsigned long) vsgt->num_pages << PAGE_SHIFT,
-				dma_get_max_seg_size(dev_priv->drm.dev),
-				NULL, 0, GFP_KERNEL, NULL);
-		if (IS_ERR(sg)) {
-			ret = PTR_ERR(sg);
+		ret = sg_alloc_table_from_pages_segment(
+			vmw_tt->sgt, vsgt->pages, vsgt->num_pages, 0,
+			(unsigned long)vsgt->num_pages << PAGE_SHIFT,
+			dma_get_max_seg_size(dev_priv->drm.dev), GFP_KERNEL);
+		if (ret)
 			goto out_sg_alloc_fail;
-		}
 
 		if (vsgt->num_pages > vmw_tt->sgt.orig_nents) {
 			uint64_t over_alloc =
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 5cc41ae962ec1d..53de1ec77326be 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -556,6 +556,25 @@ struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
 }
 EXPORT_SYMBOL(__sg_alloc_table_from_pages);
 
+int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
+				      unsigned int n_pages, unsigned int offset,
+				      unsigned long size,
+				      unsigned int max_segment, gfp_t gfp_mask)
+{
+	struct sg_append_table state;
+	int ret;
+
+	sg_append_init(&state, sgt, max_segment, gfp_mask);
+	ret = sg_append_pages(&state, pages, n_pages, offset, size);
+	if (ret) {
+		sg_append_abort(&state);
+		return ret;
+	}
+	sg_append_complete(&state);
+	return 0;
+}
+EXPORT_SYMBOL(sg_alloc_table_from_pages_segment);
+
 /**
  * sg_alloc_table_from_pages - Allocate and initialize an sg table from
  *			       an array of pages
@@ -580,8 +599,8 @@ int sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 			      unsigned int n_pages, unsigned int offset,
 			      unsigned long size, gfp_t gfp_mask)
 {
-	return PTR_ERR_OR_ZERO(__sg_alloc_table_from_pages(sgt, pages, n_pages,
-			offset, size, UINT_MAX, NULL, 0, gfp_mask, NULL));
+	return sg_alloc_table_from_pages_segment(sgt, pages, n_pages, offset,
+						 size, UINT_MAX, gfp_mask);
 }
 EXPORT_SYMBOL(sg_alloc_table_from_pages);
 
