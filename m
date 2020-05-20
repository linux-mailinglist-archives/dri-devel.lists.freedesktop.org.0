Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972EA1DAB36
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7888855B;
	Wed, 20 May 2020 07:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750074.outbound.protection.outlook.com [40.107.75.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D757E6E0FD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 07:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3w/V7a4iOC+D3znxiJilk6Y9Y4lUY99rUuIOMyLiTkH61JWPzyIwuYs0JRAZIiRsJv1ijygQLzhHJwX/ygwC68lRKCjKqapR0WnCHqKg6+fN2uEbqBTCB7+Ub+zYLYUL1lKFtUny8eCCjRZGKPzIZJ5pjsVujz3oqKyAzz3wDqmj7B0FHLvOtQ2dz/7/Y56LeAe6a6ysImOd0B2rAYCfFg1WpCYLCVwu8bzXVTW8K7/04NdfhLf+C8EVFMp0kcGYCl2C0GrUYlQN2pgAC+tbxsb0JJEjzUVlf4+v6qrGwTkLPsRvtihA7WsbqEoKS7OJIwv4CklsxlKZJcniZ5AwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn9x8rygtrS/ozsMcXpsUwV9W5m1l0L5i8UZcPmsPHg=;
 b=Cw0kByUpgRxxXTY/WViGx+1ujDrmb6yvgJoPGYq07EAYfMX6ths7DNFLquchmFHrN7LJHats3ZimXMyEGlyti+gai+C4R8MVfQEYF1JcgUVUwY83eMyqsf5XLBuKt/Qh0qN78HmG59H1C+e8313O7sNArvdRq5qaUL2JmnMTSDnS2mqlGeN70jJk1ynMRSvB3ZSFG7+GY7kz4psygSbnVGr5xoeYJJT99hqN0Bvm+yO2QDU0WdWXtyXlOKOEF+XBDZ09WlBzfgPTnkPXpcVBzwwcl9IUGhAZtIQ8/jpxqTQIdcmEgl5h3gLTDnRccfb5sfFvQo5eHUVwft5EfqUfBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn9x8rygtrS/ozsMcXpsUwV9W5m1l0L5i8UZcPmsPHg=;
 b=KF26zi9HiyZ+D82cxd+nIwZUl3+EOku/UpgrX/CX9nvD0KCs1eWnOmWRhilOc6rUp7uEXsNWSOwO9dtd1MThspXBFSrLsKeOgjBEaRXM/rQY3y0c0m1chzGvZ8yy6rNRUB7J3HCfgtG9NJuTv+VqW7GD7JkeP5P8tGAXsVq4zmk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 07:00:25 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3021.020; Wed, 20 May 2020
 07:00:25 +0000
Subject: Re: [PATCH 1/2] drm/mm: expand rb_hole_addr augmented callbacks
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200519084436.91718-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d9ef6266-2fb7-c84a-24bf-cda3d14da065@amd.com>
Date: Wed, 20 May 2020 09:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200519084436.91718-1-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0095.eurprd05.prod.outlook.com
 (2603:10a6:208:136::35) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0095.eurprd05.prod.outlook.com (2603:10a6:208:136::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Wed, 20 May 2020 07:00:24 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d4fdbf09-87ab-4028-e5d2-08d7fc8b78aa
X-MS-TrafficTypeDiagnostic: DM6PR12MB4404:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4404794B3693673A4D27C08A83B60@DM6PR12MB4404.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xVA/1iR8tOGvtuh9jjdhU+bqhq4GEw0mEvG/Et8XzKvxygBhsAfqMlarf/q/vpAjZYCJC0EnRULJC2c3PWmjw2zSB3iLhTYO2QAzPXg2R+2fdCLWcrNbVyY3dr85mHqH46GdMeMDjCuLGS/xCWnQOmPQrU8NLnH32LkqUUGDM/94YWHSFcIqtHuqpDXNuBDcZc+LZpFI4kAa8KSYG4ie4+D4DLqHgWdOX/Yg0XjMDqGO9GoyB5sNDmB1mKL5kQMyWKjWVIMFI4MP9RoDQzN2S9IRRNTok42l0rrF7PPpx/i5YHDsb6eDk2mMFO5YQrVDo8T96sLHqnnMvo7hREZ0VyLxuXuEfdcTVxn0Ui7z35KLX0xRSBsHy8suZ4hhuuuW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(16526019)(6486002)(2906002)(186003)(52116002)(8676002)(316002)(8936002)(478600001)(31696002)(86362001)(4326008)(36756003)(5660300002)(31686004)(2616005)(6666004)(66556008)(66946007)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: CJUMAcsD88bd0wtJ3GpSWSIQsICdLd9rly0ZbWS2vj0cuygXr9qKlCJom90QKca/5qwR2magKa6RiXX7KDeXfw4652sbmAe34LBRQ0ZpJNgr2l8KGZXvSM9wPVd94x71uBj20xxoxUolNS+lOKxWVyXMqWlSTkSuJIva45EgCl3G7nJDV3EDi1JFX+W1a5BNOI9XfkUFv2TEFK35w+5egVKab3Y1myKIJcHjlp8Km0LSYlCfDW5zd9frEWWpq64v/aeAmmRaDDGk7Q2LqASuUPA/k8iqnEseusBrKNiOr+Dt1rYXz8/0ZkP5m9NkEpLIUVtwbVibWvjkPS0fiB3BHMy63wNRED18xaXzuDv6xDSB+AZqoyy7cAM17gUiRqM9D1uZIdLrb6Bfxt98CQF6VIXzEpgj2e57EiQ0FdCOm86nH9UzmRUdyVoO+stysSU4PK+RcGr6NGbGXkHYU1Ign29q59kQl5jBV93xuGTo/5kVfzcI4ZdURba1fY3W2bQBbCip38QxZWfc8/llJ9kjmDyzekAOPsWN16eAggLCcAgkyVkcBmnte0do0x3w0pJs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4fdbf09-87ab-4028-e5d2-08d7fc8b78aa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 07:00:25.2708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VOESxV/K2SDYCXov/CKK0H+PUTXyRyKXxPRvL18N04aNq78tjPU28NLHwDrnCmi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, chris@chris-wilson.co.uk
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.20 um 10:44 schrieb Nirmoy Das:
> Expand RB_DECLARE_CALLBACKS_MAX so that it is possible to store
> extra value(max hole alignment) in the rb_hole_addr augmented rbtree.

This looks to complicated to me, why not just extend the HOLE_SIZE 
definition to come up with a combined size/alignment value?

Christian.

>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/drm_mm.c | 72 ++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 69 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index f4ca1ff80af9..91e90c635e05 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -241,9 +241,74 @@ static void insert_hole_size(struct rb_root_cached *root,
>   	rb_insert_color_cached(&node->rb_hole_size, root, first);
>   }
>
> -RB_DECLARE_CALLBACKS_MAX(static, augment_callbacks,
> -			 struct drm_mm_node, rb_hole_addr,
> -			 u64, subtree_max_hole, HOLE_SIZE)
> +static inline bool
> +augment_callbacks_compute_max_hole(struct drm_mm_node *node, bool exit)
> +{
> +	struct drm_mm_node *child;
> +	u64 max = HOLE_SIZE(node);
> +
> +	if (node->rb_hole_addr.rb_left) {
> +		child = rb_entry(node->rb_hole_addr.rb_left, struct drm_mm_node,
> +				 rb_hole_addr);
> +		if (child->subtree_max_hole > max)
> +			max = child->subtree_max_hole;
> +	}
> +
> +	if (node->rb_hole_addr.rb_right) {
> +		child = rb_entry(node->rb_hole_addr.rb_right,
> +				 struct drm_mm_node, rb_hole_addr);
> +		if (child->subtree_max_hole > max)
> +			max = child->subtree_max_hole;
> +	}
> +
> +	if (exit && node->subtree_max_hole == max)
> +		return true;
> +
> +	node->subtree_max_hole = max;
> +	return false;
> +}
> +
> +static inline void
> +augment_callbacks_propagate(struct rb_node *rb, struct rb_node *stop)
> +{
> +	while (rb != stop) {
> +		struct drm_mm_node *node = rb_entry(rb,  struct drm_mm_node,
> +						    rb_hole_addr);
> +		if (augment_callbacks_compute_max_hole(node, true))
> +			break;
> +
> +		rb = rb_parent(&node->rb_hole_addr);
> +	}
> +}
> +
> +static inline void
> +augment_callbacks_copy(struct rb_node *rb_old, struct rb_node *rb_new)
> +{
> +	struct drm_mm_node *old = rb_entry(rb_old, struct drm_mm_node,
> +					   rb_hole_addr);
> +	struct drm_mm_node *new = rb_entry(rb_new, struct drm_mm_node,
> +					   rb_hole_addr);
> +
> +	new->subtree_max_hole = old->subtree_max_hole;
> +}
> +
> +static void
> +augment_callbacks_rotate(struct rb_node *rb_old, struct rb_node *rb_new)
> +{
> +	struct drm_mm_node *old = rb_entry(rb_old, struct drm_mm_node,
> +					   rb_hole_addr);
> +	struct drm_mm_node *new = rb_entry(rb_new, struct drm_mm_node,
> +					   rb_hole_addr);
> +
> +	new->subtree_max_hole = old->subtree_max_hole;
> +	augment_callbacks_compute_max_hole(old, false);
> +}
> +
> +static const struct rb_augment_callbacks augment_callbacks = {
> +	.propagate = augment_callbacks_propagate,
> +	.copy = augment_callbacks_copy,
> +	.rotate = augment_callbacks_rotate
> +};
>
>   static void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
>   {
> @@ -256,6 +321,7 @@ static void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
>   		parent = rb_entry(rb_parent, struct drm_mm_node, rb_hole_addr);
>   		if (parent->subtree_max_hole < subtree_max_hole)
>   			parent->subtree_max_hole = subtree_max_hole;
> +
>   		if (start < HOLE_ADDR(parent))
>   			link = &parent->rb_hole_addr.rb_left;
>   		else
> --
> 2.26.2
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
