Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21173C0FBF5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A2110E535;
	Mon, 27 Oct 2025 17:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NECCMqgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010014.outbound.protection.outlook.com [52.101.56.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B07110E50C;
 Mon, 27 Oct 2025 17:47:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRdKXe7F4QJG8UlmzD4kdjTILiXA6hXEmciWHLGjFDOlbmopGigdVZRj/Ulx59f2dAzhnkFJMrUHiFBBYk1wDlRlQvTqNDA+3DEbjUvZtRhy6crtVofxp0f4ao1+vc19ptPWnAbjwHvTvt+xOeO3UkqleAIY4mATGFeboER8X60KDExmP/i+/2yaZPj0BZX7fG1jV6HVi/Trd2MqLi2fNEbfVjrB4EIYDY+Z5TC+SzF+4RucIB4WrPfK2GlPia2ilY9qj5ZNdOXkIKGyDnbbzJ+IphoGnEAi7LbxTKSwDOAh+uMSWMsV6eki4ZB/BzrLgZZqG/7VZoIaWVdfDoQwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4krFBzPsFpV6pLov/ll7JYDmQskZIAPmeddOjUQ0VLU=;
 b=bGSKLDQCtUJaR/Px1ZjdqQihleaXhtwNmA0AzneFPyjFq6O+zZMtz781+nS5Dvjb3JoRfXMFr04huJOvciGoyTFjmKlrpsXrogLjvb0wRB4Uux5B1BCAFx12fL5l6QZxE5l1D8Th6hrHvECQFrQRM5SL/7gzfS0lbrljUbi1wGgZnbVktENuR58dCOG9is0OMXdERAgyQffYD9Q2arZP1nv1HZ0yyRzmvGHSG/hkgYW6QltzPKcvMNYwWiM1xm0G+/VHxicM1Rutn8Ij6Ia8BER8Izd9VwkNhrsNklbUIUMOsbby8grAXxtDtcekc+O/mubG4WEu0gGp3x5W+jpFbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4krFBzPsFpV6pLov/ll7JYDmQskZIAPmeddOjUQ0VLU=;
 b=NECCMqgVrQFpw8SSMIF0xSleoQst36F6Kws3DpWDGY1bHQkCsznm4MhnT4vPMfz+8fFTqGEciEKB3/Drog206qNLkLN3IjJD0n4628i6XQqIB8pKEImBidBi8BSqWJxiwv3sApWed7MD0oEca+b0OKuhVBi6Vm930GP3SdPUL73M56qGWzMYlpdpUE1zVTWX1b+LnY+ZzmyzGfzRdbJY7C38VFXEt1sAL06NnVBj0MiLIArkciVexHGZTZ2lw5FbjM0ZSYbNb67zeq72fd7SmQ2Qx4XNGezCN9oCi4v7+ExFMNQTC+rObomNkDCFZ2hL+zsHF/YhcN5DsBwTLBibMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MN0PR12MB5931.namprd12.prod.outlook.com (2603:10b6:208:37e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 17:47:25 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:47:24 +0000
Date: Mon, 27 Oct 2025 14:47:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [RFC v2 1/8] dma-buf: Add support for map/unmap APIs for
 interconnects
Message-ID: <20251027174723.GB1018328@nvidia.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251027044712.1676175-2-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027044712.1676175-2-vivek.kasireddy@intel.com>
X-ClientProxiedBy: MN0P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::33) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MN0PR12MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: 06206041-0d64-4064-5d7f-08de1580e2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xyil4kC3SXf/ACaJWD/zlMjG7ukNRVLTWUA0FYPYKcf+QU9/xJuQcFFrO0Bo?=
 =?us-ascii?Q?8vJ42GwKjjhobEYpkPxdL9b2cmJq19yFH3qa2tlommuznAPo/cD2NdTicKMu?=
 =?us-ascii?Q?hiKuw/eHyt5HRlaz5OJ7Kek+BJlGSisrK+VvtIAuRYFuCxKyYPEwNylIxlKW?=
 =?us-ascii?Q?y2JzVcjVxgEQ5yEkasVBxapAjRxtnQ8MkJjt+2Z6ATiMVKzvoRvbDvd6qKSW?=
 =?us-ascii?Q?FiilRevcif6SZJgOlb3s7zHWkQyZ1RjvxMTBgO7whthxs/FEs+o7GDzhybYH?=
 =?us-ascii?Q?K5Auvu/JLSAMXAkweQloR+lU9OKrlnuddh29ScRvz5B9sinGgyP8XDpwMryc?=
 =?us-ascii?Q?hDMqGsIfqlkx06VJKpHLFQie3PxWqL5/WEBoX/0IL4BYXqlUtjQOAEtAmCRm?=
 =?us-ascii?Q?kziTgqsfyBxWEBKxxTQ6XnybQlN0+orjIUNLL/mYsTaUvK2+ok9iIsQdaAJC?=
 =?us-ascii?Q?MvBWqL/ZhNQpkMdY1zKhKh8qK4w3psCVYZo9DRI+8/aDq4P1AHBcTt5rS4Tm?=
 =?us-ascii?Q?pP3StvMkvTP7A1uh3+ePoJTfeaVyBUAJeEap0CVMApsOgrsBdoLHB5BdXZP5?=
 =?us-ascii?Q?Tx2HTDfbP30m3/ChjAh4f4ApKyQkAGD4CM0BbhH9M+PtHtzCb3KdZj01YWlv?=
 =?us-ascii?Q?D988OqGuzQnhM7kEvYrM1tgJsYgsX3x42VhnJg+TLF3Y25JFF1yzrT5Zqc4p?=
 =?us-ascii?Q?cMgnDaw000InOHoVr+wIod3k55bW/zfH5CW65ZlqVqPxirP5K3KO99Db93eN?=
 =?us-ascii?Q?vRvkZGvg1ZBeDMvSOM1qeEi5D2yuK1T2AB+qN3xsgCo+hIUtservFdYOKX5J?=
 =?us-ascii?Q?QBke9Uo6mYKSTjz5nFu9Dmx/YnAAvdV3Danimh/ier1gLMsN3sa1bBBhFinZ?=
 =?us-ascii?Q?crBPUDR2h2znKbZsG5V6KeMZ72G3RgMNkRA633g1yN6dqg8dGSfWGXQhyBb3?=
 =?us-ascii?Q?1CMQceUNHLtXBnWHqp+NFmCMu2LNxOeQpoghN7DIBxySknNTXKH83ZU9oQAJ?=
 =?us-ascii?Q?GxDZCruc58V5KdhBANI0sdaZijFrl8g83JChq9lI4Iug28t+q65g6q740o5U?=
 =?us-ascii?Q?XG7ZvGSEa5KF7ZnlIPX6Lsdo9H7+a26m/ZPaLY+1dk/D8xtpiXKjfpCnemAa?=
 =?us-ascii?Q?YdhRLtGQspMQ7SBq6x/X5U2D2efvUTsgZrKMU3R3UxoNs9B4tOrXzokuzm/y?=
 =?us-ascii?Q?x6vVzly/bo8zJ042udWRdyg5E8Nc2dTbmN3SnD931ojMa5DfaW6QtuF8SEt7?=
 =?us-ascii?Q?tlmyMpZLszaMcdkOX/BoVLU3nABftEXQJ7oiJ8Lad2H5GWS1wymRRdxxN9C5?=
 =?us-ascii?Q?n7XvXzjfxS/X/WyoDlxLifZ0hQL9bcF9FmngpGy4zRHOKiMGqhcYcfApmnYE?=
 =?us-ascii?Q?YdTxugy9uVWgKLB42l+vNgvAa6HH6QmtCbampoLf8Xbi1Mb3pDU1RkU4eNhZ?=
 =?us-ascii?Q?qA8oS5drP5ecCxN9fRmu/VOOSRk3xo40?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PQI2U8IghAKVHdIkHxpUIBWXURnpNrNy91n5eg6MTYNomUvypE0QOe0JkrhR?=
 =?us-ascii?Q?8HD7FxWLp05rl87K9TgeqI+E12nsqIllAH00hzNCdAFvGOMKSsj69QTePQ8q?=
 =?us-ascii?Q?mdV9os++y1ponWAuRE/R06FCMjGCAsy7ShptVY1slXonjEqthqAeUreL5Uc0?=
 =?us-ascii?Q?Y1Xy5zgGqq/lErfDmB9K1IoitifkWqWgJ3TamwifZLGKj5m1HnYOwPOYnPdn?=
 =?us-ascii?Q?YMgZmjYXqLrimYScc18Os36VRnRn6WNZr0nyK7WMYxMkfbtsk5Bxg0mBM3YC?=
 =?us-ascii?Q?in8AtOG1qwWdfUkVveVgVBJl+FqW1pp+540hxqyM2KcKv2LFLk6D6aUJZTyx?=
 =?us-ascii?Q?VI9xEw7fHed735punDDcifGpr/a2uEXVvMMl9tMPaxh+W7NeJFlTdjZojgL4?=
 =?us-ascii?Q?tPomj5y1NjKRjNyUW1z7vI5OeZWILEZudB5aC64stsOzxJ9RkO8P7DuQ0lP4?=
 =?us-ascii?Q?WAp63Y1G2VhqJHP2AemW/C57+eXVwFpN27LmOy1pumSuzSKZliri4JmE+WQV?=
 =?us-ascii?Q?MBX7YXX/1Mh7SUSxttmLf7xauz2hlGeA9J0OlMaUKjTMiDH617KGDn39TxCq?=
 =?us-ascii?Q?Q3AvcZNmGaG0qCmV7OCeEigekE/bweGUMKsbW8Jlsn21QXKOuj+LOyKWtdLY?=
 =?us-ascii?Q?EcTMOA0ffiIh0SxhDyfk3gqTP6I2u6vfrVW4UxicRl+SP42c+G0dcDhnR4eX?=
 =?us-ascii?Q?TSpoD7eyMUheqrJxZil8+0An5lthilXeH1y11W8ujzqjqQak8nCmPfevUC85?=
 =?us-ascii?Q?R/7akOsAJ3+VJGT2Vj5BOvxXHX+iYWujE8KOW1Ax5HvHYQW5pkZOk868CPuz?=
 =?us-ascii?Q?AzxnwCUbSbQkfTQmiOAhJVXxcEQQnqEIPIgEHpWZgjVA25/l2qdf7sJSW7ey?=
 =?us-ascii?Q?7c6z9u91qUFY3nqNiiPibyXo8vbuM/ADV8saIymlb+G6/3XyZRrVVg74LlSH?=
 =?us-ascii?Q?fHpvpMcIk8ks2eAD52p0cKhHp7O7zfNp5dJd+Ynrcc9OV3HJcNnB6G/9VE5t?=
 =?us-ascii?Q?Tt448E7du10N/ho1AMoaAhSZX/1TwUi5DQD6HEdzaMVKy8HgUtzmmho+oEkK?=
 =?us-ascii?Q?6OhjIXQjQt2ZU3Ow6VaUYT5eyN6oc4DeO5H/Z0VqxnSrnKZEL1ivBrYe2pYU?=
 =?us-ascii?Q?2aUsFSXlPQ+Gx1f5yJqR5I2yt/W1YIHurtwSe+M6Ia3jfp4Gell4btqsCpMV?=
 =?us-ascii?Q?a+PPqg9irtWIW9M+ogYS1aRDLr9kdUlqkJ3HGCfZDhBflqm26STuk/ISlK4Y?=
 =?us-ascii?Q?l3kkJWIVjbw/rC0shLeEiKob30FXYCdESLf9SWqiFFP2iQ0D5U26475ZViEA?=
 =?us-ascii?Q?h/vHuUihldwOUpinE+myc+cCdo2Iqcw8H/kay9HPoqirIpGPOKgXvroHviP6?=
 =?us-ascii?Q?X21o0OQPFuh3HkFKpVuZ0dyf153oitrhsWnB++hYA/c0gjSLSKjKq69tHEBD?=
 =?us-ascii?Q?Aq26UOqGSYcF1saGEyxVC3/dduHmBh8uVOSt3maP1g4TUgPr/y+I42CvVk0q?=
 =?us-ascii?Q?jf7WCMEkWQc1BWOBF1I5yzHDcvjkEZCGY6uXPjlCZ4uuzGcp/TChr7kRv3pU?=
 =?us-ascii?Q?gZl9Fol4d0QG+0Oi6F4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06206041-0d64-4064-5d7f-08de1580e2eb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:47:24.3230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJ8WN9pBjBSwLLni8oSawo5SZddhxf2cvKcqzdPCQGpzlXQJu9ADtPxgZ2c/yM6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5931
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

On Sun, Oct 26, 2025 at 09:44:13PM -0700, Vivek Kasireddy wrote:
> For the map operation, the dma-buf core will create an xarray but
> the exporter needs to populate it with the interconnect specific
> addresses. And, similarly for unmap, the exporter is expected to
> cleanup the individual entries of the xarray.

I don't think we should limit this to xarrays, nor do I think it is a
great datastructure for what is usually needed here..

I just posted the patches showing what iommufd needs, and it wants
something like

struct mapping {
   struct p2p_provider *provider;
   size_t nelms;
   struct phys_vec *phys;
};

Which is not something that make sense as an xarray.

I think the interconnect should have its own functions for map/unmap,
ie instead of trying to have them as a commmon
dma_buf_interconnect_ops do something like

struct dma_buf_interconnect_ops {
        const char *name;
        bool (*supports_interconnects)(struct dma_buf_attachment *attach,
                                      const struct dma_buf_interconnect_match *,
                                      unsigned int num_ics);
};

struct dma_buf_iov_interconnect_ops {
     struct dma_buf_interconnect_ops ic_ops;
     struct xx *(*map)(struct dma_buf_attachment *attach,
     	 		   unsigned int *bar_number,
			   size_t *nelms);
     // No unmap for iov
};

static inline struct xx *dma_buf_iov_map(struct dma_buf_attachment *attach,
     	 		   unsigned int *bar_number,
			   size_t *nelms)
{
     return container_of(attach->ic_ops, struct dma_buf_iov_interconnect_ops, ic_ops)->map(
                 attach, bar_number, nelms));
}

> +/**
> + * dma_buf_attachment_is_dynamic - check if the importer can handle move_notify.
> + * @attach: the attachment to check
> + *
> + * Returns true if a DMA-buf importer has indicated that it can handle dmabuf
> + * location changes through the move_notify callback.
> + */
> +static inline bool
> +dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
> +{
> +	return !!attach->importer_ops;
> +}

Why is this in this patch?

I also think this patch should be second in the series, it makes more
sense to figure out how to attach with an interconnect then show how
to map/unmap with that interconnect

Like I'm not sure why this introduces allow_ic?

Jason
