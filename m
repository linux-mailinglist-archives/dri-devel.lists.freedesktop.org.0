Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F64FC424
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 20:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794C089EA3;
	Mon, 11 Apr 2022 18:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3255E89DE5;
 Mon, 11 Apr 2022 18:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCbqnKpKFsiNktjry6rc7Zkg+8n6tzW4XBcFPxBt05lYWxhGxBZ/D2obUANR5i0+iZgQiMaA30XtizMrXBehuY1+7vCUpSoTEbjPUREerti8PvacX59kOTLYWVZZl/j0zl4szaQnfbnSQ80ofm2olSuikqI1Q4bvfIuHDXQygvHvpdbfsrrS1Tau2ylvv1CpPPEawxcXkObtX3ELSRR8jwnkPXNMxP6sKhHbU4PQvra0N6jxLW9lJFM9ezjJVxQWjkorQsi7iIS4sa4a8Dz/yIPA2Uc/xKpvx1B73f2r+xYCwbFTgCYtXVDOgswhGhP5HvW+CS+S+2CBvWFPvuHuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdS/qw6gPYHWUH42rK5Or9ldGZUi/byFj1GsqkXCjIE=;
 b=h1+Z2GJt8pwKjG+kZ21g8F+8DeDX8l0aZrmOEY4hgvq7VODSLDtPjmpMVxQV1HDOxD2kXj0+t9hHBRyT9JsPWYjzpMNkq7z2d3byfia9hKt1A45+nDqjxhbFVXWBDThvUfpj6Bww9rYyI7Y7Ua4H0LAiBKmZddqm1GgWqn4l1Lua+kUnTJpaPesO93cQr2MZ74pWxXummtxkqHPd43qDodYVZd+w9pVB1I6iKLjHnVqstvS4Yp56n/EU0C5FHGu+InqeQqZFvFt7n4+dlLaWzL0gA1IabDAt/e7rgMjqwPNLK2A7/9jymiEIM3taq87q2zsQ9f95ZeklnoCtgqsFgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdS/qw6gPYHWUH42rK5Or9ldGZUi/byFj1GsqkXCjIE=;
 b=KiB52EfBXuC11q9YJjle72fkLk77CsrexMQH7ckTEmW1cjd0Bl780PfodoOLO9YU0rRKImrgkrcAuBUykaNC36Cdma6EdllJWsspGskMaHVe8w1+tBZEM7TaGvtuYbTkeXUN1VctJisBK1KtUtAACjXgbjeUAg2bNTk6tXdDDJzcYmiZI3sFMJdLPqyhPwxIIuCbYuYMxR0F0zVuXQTNl9qbAiQPL4FPHUhFZIJZ1qsjKH1tWihH0px+0rwDKQeZ4YbW1g6nPugBoUykNdyrib6DOFSQkLhud+/r11jUMNR/yDAT9ab+52hXRqYwZzKnHcZa1cu8TKVDcZxgK+JYVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Mon, 11 Apr 2022 18:33:23 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 18:33:23 +0000
Date: Mon, 11 Apr 2022 15:33:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 24/34] drm/i915/gvt: remove the extra vfio_device
 refcounting for dmabufs
Message-ID: <20220411183322.GZ2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-25-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-25-hch@lst.de>
X-ClientProxiedBy: MN2PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:208:23e::26) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f120345b-de1c-4b2f-472d-08da1be9c2c5
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_
X-Microsoft-Antispam-PRVS: <DM8PR12MB5431DB881F4267A98F762A16C2EA9@DM8PR12MB5431.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHojHHW5H7GEyeHS+AYbe/pYuL8b/gQl0zb8rfNaH/MHzgWJJWR3xbDU56u4nm8DxbxddEuajpX3wMp6DclzB/nZ+EhhRPfs0EjwwriUCVrOjWhbbwPPYAr1lR4aGll3JV2LU+0m6iy/h3557V40xl107pLYAPvpLmH5kzvT85P4fB8AJeE45W93qjpk07GkQjXE3EiaQFYiqgyztfOGDEes3U1eC0yiQnll8bYFtld6x70IzvMQz0U9sh/krqlW5Fu4XQWAqO6q4aUBkJCPZCJ8UT6Vvwa6Uu4ADDZWm6ehELUVDBxSF6yI31QSo2xn7HgDxoWos8N8eP2uw5uh68XquoNyg1KdvS5BX61wQSjQ9CizB9SZvvKT1Te9T4XdGM6gUXtikoQEb7ag/ITK3itSsVpkKUoEdNu8g++dc2V+0L18wbQvQQUVfQ89t73T2rO5+XDzLME4aypWgKsgrC5B1gF5j6qJ0vbLU9xPKm8NVpdvBqzaobIbUpVy2yvnZj41n1Ew8STcTxByh+l28VrjWMzxjf2rLNFPCpoo1ZDuM6voGGs3gdxdyC9Mra/hZvYdFGTSCIfAI3g3P5YZwC3umXjTmVwU5/as6FJ3MXKC6A5yNAXkUOzaAQzOIRE7jub58pwYf9HqvWXh8VGsmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(7416002)(38100700002)(2616005)(66476007)(66946007)(66556008)(6512007)(1076003)(6506007)(186003)(26005)(33656002)(6486002)(508600001)(83380400001)(36756003)(2906002)(54906003)(86362001)(8676002)(4326008)(6916009)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AF4+NpPw8IjvmN31hN9uZPPag+qMSKKTEuXDUWIJeOvDpj2lTIx0c+rjrA5i?=
 =?us-ascii?Q?bf9wrjRZ5v4DBsu77m041TgvUNtFt2jwLJAP/oJrFFs90AkdATChjxRA4bnA?=
 =?us-ascii?Q?9F5SJlTsPgqqjON2H/MZ0JyNNQS0sU7j8CzfGDRECReK/jG29e/5dyc5SrV1?=
 =?us-ascii?Q?xnMoDHnwoT6KlK/2AVkxZIvdmNshobYcqAtw28psZFDfVp0c1a0KOoxBpvr6?=
 =?us-ascii?Q?cNZrKwfyBDtNQ+FVHLD04PDZp5Ldf++iAvMe454+ib3HE1BLiFkmoGTqM+WW?=
 =?us-ascii?Q?+E+ETAZ66W9LbCuZatDssvwwtZARvJa/0inX8GQzyehkJ7xkLfq0Utd7ARvW?=
 =?us-ascii?Q?TDjnnmHuOw/9tS9FPx0gPVAWkKbquzyz06lkw8VF9JFC2f//Si/0n8w1rfEh?=
 =?us-ascii?Q?n9oA2+Aqb+8vH1t9sURUARj/hTIv64crN1vUwJJMUTkZUAnfnCYGgofF2gAs?=
 =?us-ascii?Q?e0drZazgmhVVbzqabVtk87D3EnVEvEkoBjNLEeyV2B88hGYWJO6lv04MM3IA?=
 =?us-ascii?Q?WWZhA3iCGxYXCe0dNqkVrK1cmJAessZb+XyGaWy7f7BrbppyxdbjQj2H8L39?=
 =?us-ascii?Q?FarEkHWjptTIJh3ddJa/Jdxd/OUg+684gmSGLgoG3FDebCXKp3Uaq6yDOB8q?=
 =?us-ascii?Q?+g2XkEMmNRw9aR37esud1DZ3zFTcs4F3PT448UDjy2uTw3HRxSB8OKnipZHU?=
 =?us-ascii?Q?GBLOYxKTkCw53f7xdoa7VxUVHO6k2sRkuPTTtp3Jei7+ScCSen+xI++TKg5R?=
 =?us-ascii?Q?WHzd1MVRCQmf03GTnSyVT0xajrJKnYFYLCftRUTYnrghz2/Oqpl9EMHJ9XvA?=
 =?us-ascii?Q?8Huzw8IhUauzV8OeLwCylU1Yvef45MUvJzLlRaxYYJgibom38BOJY+3yl+wN?=
 =?us-ascii?Q?rGXCwXpQAjMbWhqasvEujRWcU1D0Gx2ID3x7X1QmVbtK8FHY3WMbhttggt3K?=
 =?us-ascii?Q?7rfqT4iudfk6KEuus7cLOtNd3/7XYFxfLO59eh3lQ4+MtUtHHx8qkCzhvgZ5?=
 =?us-ascii?Q?vK7/goFwVr/85egLNpc8l165ftPwuQ2P/r6Is0Hih517UN5pZusa2KZZIu95?=
 =?us-ascii?Q?BEvOgPmTA6NDO8AEcoAmWC/U5sb9HeWOF0BLSEBCRpeJBJ9lqMq7Mb+cpX6a?=
 =?us-ascii?Q?Q/gwPpl788IyNhd8M4EfOUhhniWvsbvpko6OvOQ9oNCQSiXOMFECcDXG3zDc?=
 =?us-ascii?Q?fULtM3fW9b8K8RT2U2ndqYRHc8etAyz9/kAptIMVxW7UGtVhT6it32Linkti?=
 =?us-ascii?Q?WTXpFShtHxVwAOgx7pPTotf+/SA/vY7aMHa3TDbEm8NY4hIHbxaojup/kwU0?=
 =?us-ascii?Q?CA4uSxwxe5Tmwu35ikDtkq1D8lumNz4hnlXcweRcPa56WlUXqpNhCZ+Z6LzU?=
 =?us-ascii?Q?R75icblhMNBobDoS43Z/F8Knuuk82ZFoDxDpWU1Uh/RpAqOpp8GpcFdTgg27?=
 =?us-ascii?Q?u+6bjNB1b7ACgrlrw9SWlIb9sELEAgNjAqFIA9hSiRS6ng1KlflQFwwv39ox?=
 =?us-ascii?Q?J+m7gAZ4dgHkKw7PhznWsk50LJ3PirRjmUS9+ZZ/AkXvAdQiNU9dcYVOZ+Lw?=
 =?us-ascii?Q?K6sIPzPW/EJc7QHJIjbCfq9C/pzSVBYDUAXOfxFrx47rAMTYRr8mFUa3yRS0?=
 =?us-ascii?Q?37FNivAFK1uEds1vI/5xo3Bm2ZlMPuD9r17Ioi+JKJFxM31KHc/5O9dH6OPF?=
 =?us-ascii?Q?vBNM+VaVYv/IXwo/iy2Y+acfPGXxFTeFiT8o954/lMCQvGMzKti/4K5VfsoZ?=
 =?us-ascii?Q?n3vwLUmccQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f120345b-de1c-4b2f-472d-08da1be9c2c5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 18:33:23.6791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0S5fh8NLPgomI01/o2m5FJSEknjqrWgOtI9G5P6BV9Qs2XH/4Ch7ZyYig44anGJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5431
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

On Mon, Apr 11, 2022 at 04:13:53PM +0200, Christoph Hellwig wrote:
> All the dmabufs are torn down when th VGPU is released, so there is
> no need for extra refcounting here.

'th' -> 'the'

I think the specific argument is that intel_vgpu_query_plane() is only
called from intel_vgpu_ioctl() which has to happen while the device is
open so intel_vgpu_query_plane() has no issue.

dmabuf_gem_object_free() is OK because:
 intel_vgpu_close_device
  __intel_vgpu_release
   intel_gvt_release_vgpu
    intel_vgpu_dmabuf_cleanup

Menaing dmabuf->vgpu was already NULL once close_device is passed, and
the vfio_device reference is held automatically from open_device->close_device

And similarly intel_vgpu_dmabuf_cleanup() is OK because it is called
by the above.

The other places that call intel_vgpu_dmabuf_cleanup() are redundant
with the close_device path.

Though the 'release_work' callpath is buggy, for many reasons, but not
for this series.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
> index 90443306a9ad4..01e54b45c5c1b 100644
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -139,7 +139,6 @@ static void dmabuf_gem_object_free(struct kref *kref)
>  			dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
>  			if (dmabuf_obj == obj) {

Not for this series but it seems like there is something off about
the locking here:

	if (vgpu && vgpu->active && !list_empty(&vgpu->dmabuf_obj_list_head)) {

This is called under the dmabuf lock but active is protected by the
vgpu_lock.. It seems strange that vgpu->active could be false but the
device is still open, so maybe it is not possible.

Jason
