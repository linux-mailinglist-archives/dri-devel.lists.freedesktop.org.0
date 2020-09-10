Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30DD2640C0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 10:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00186E87F;
	Thu, 10 Sep 2020 08:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616296E87F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 08:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJlo2kUJDPlzOsXSA1pk0pRcOHEYHOpiDgFoyfeHPHZYHTXLnhJc9LeANBAP8jbCo/07247/ojpFePP7/pdjTnlL2eOQlroIAvZy/16Kc9SpUgjSiGipLbwIkesHLYN0umEq9ciVBvMeH/TGIJIt03HWKIbmtupvlx6TTQhqbMK9fBZbLMj5outmu8odVXrdbhtqK6cnuVUvjlcY1dmhB0xfjYBbScDdoEswMkiaDUsi9R48hijQ/ne82Kj09IU5waF1yxZbzyNjDTyAPjdGSOAkZRERhBC9GOfnBjCNw7BRitf097HHtdVIqEIU3/nQKCGCQk6KiVIoAvU/nRM/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW4+qfcQLNPWhArgkNch29pKkZBLs8RnjSOq48xgozQ=;
 b=iauW6/6booB5YzLkFIpv2uw9Tt8ZbGpRSOm/RZ+Af4OM//su2rck08PszPvpxP5rvuEHjVa3qdTDz6FIn4FSyDiL8myQ2R569AFRW0/Wcze3+3Q9FO6ukadLdlZVvWXa11AAv7zliwR62k5J8BWpYQyfYNPMB/mXq6eU10WCffJhliNq0/C3ciLuXN3S4MAmksMoiwVNYa8xDrqlj5zwzOnK0HyzQsBtP41b6JfQeOmZORi/jRE4pIv7XXxF9HM4G+LqqIUBlY69c1F61gHxdjy/2IKAYL/mGvu88MEiX6L6lUlW/YiJVDDSR7MxTamnZofwUTX/stVjDvUsjdt/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW4+qfcQLNPWhArgkNch29pKkZBLs8RnjSOq48xgozQ=;
 b=ngTV6DesFiK06YqDcVy9B4Qo71Vya4miPHdY/Fbf9BDIRHuBquwGE6dyIN/xoyWjPBVWveVulQFTQHsWQRs4jRkWFpYl+wNnCRQqfqErbSPc5XaIfXk/CIig/QtqFqS/cvBnCuvlG6BEBIwZyy5pej52F3X6LiuoOukP8/tYF5E=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 08:58:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 08:58:27 +0000
Subject: Re: [PATCH] drm/mm: prevent a potential null-pointer dereference
To: Jing Xiangfeng <jingxiangfeng@huawei.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, nirmoy.das@amd.com
References: <20200910023858.43759-1-jingxiangfeng@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f6c93d83-b47d-a004-8da9-92305024c4b7@amd.com>
Date: Thu, 10 Sep 2020 10:58:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200910023858.43759-1-jingxiangfeng@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 08:58:25 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7653d191-cd8c-417f-1769-08d85567ae91
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125A7B50FDC2A84E1DD12F583270@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mfKL9ZOhbnVeWRH9OwgUSulU5dG3XiejaXY/ObrZWWtkx5TfJ685H2DUp9viAJqK4ZtALin9+NCwJUNn3HBbrzs5ch/CdxKS6CrdqRZlfXKiwofCKcbNsRUhD/yhWm2bB6/kQJKWj+RvQnz50ZhyY9rk63483uqv87jNNMhpTYuDJazpGQkSBzmeRk+XjFbLXso1ajb/D9YF3T96UBHjk5fyjXe11QuYEBEIHdtBLU5Tng+RCDFeIgwjmpGGNLSHws1HgLrgDhQttxpM7yVODrc1rwad2n5qG3ybNvPnd2Q5unan4AKyvQha6ND4IkCpUSN3KsGSjL1x3mZ6hZEUEC17VxSk2gX53QjZqWpS1pJyk0JqCSDYsK2UohLsj6xC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(6636002)(5660300002)(16526019)(2616005)(4326008)(31696002)(36756003)(8676002)(8936002)(52116002)(66946007)(66556008)(66476007)(86362001)(478600001)(316002)(6666004)(186003)(2906002)(31686004)(6486002)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: P2En7LclLCWjFYX9JX9IqEGyDui7PCi/aePqyXFcJg4rl7dWX0GMCoeYArpvsdGHFwPmbyCbOhZO8lUjvoM32g1EDIORz8bvFySxBiV32JTjFuObUc9xZKx59peFFnr3xthZmym25VNqvAA33ZKFMvXyp3aIfnSjWl6rtsuWL8UvpOX+HZPlAVOBbBklGZRIOow7iwpupJQykiFuT+vt2imMlUOEfD5ErDuJuCmeidPOKUPdXjq/DTvGlXBS5IPpkZgr6zO1Xid7xpSFx656z4mK7HtiT9mQNIcsf7SuTuZZULA+1FK3TvZxUVlg1EMxaM0s/+NGUZkG3vussH8ksgbf/9WzvcO8vKKPf50lRNQ7BLAAsBBqt6ayb84TVBvJ5H9wB+ZAwnse+1NhSVDp2BAa/e/VjrSA10u/iasDGu461Zg+uW/SqodY88uQVuNjzdr4gWAPXYCysMqnixeDvedjuts2IMAe+dKUhVapsmAdoLRsg6KeCjnGeVIuxXd08VmFpPRlz6KP+mu3Aid7547Z2XCS9lIWfNMeJEPu0GlzVFusryEfC67x7ml1RH6toxEKbAqvJSs/sexVUbtuylISmoYNOrZ+Fio4VQxeYihq7NyyVrmJLdouUQUcER3/CvnYlQT8Ybm/l0kcJ/+w/K6oQOrINhVv+Kjab5mEQ/wUupKbhdpiIsr4J+LrMsT1VcpUS7EqucpO3NfQWDyRkQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7653d191-cd8c-417f-1769-08d85567ae91
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 08:58:27.4510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5u58wATuqdeheLkf2QQnTcwcMxjTdXmXRrtEG8jCjUD7Mu7juk3aDTet1tQRag+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.09.20 um 04:38 schrieb Jing Xiangfeng:
> The macro 'DECLARE_NEXT_HOLE_ADDR' may hit a potential null-pointer
> dereference. So use 'entry' after checking it.

I don't see a potential null-pointer dereference here.

Where should that be?

Christian.

>
> Fixes: 5fad79fd66ff ("drm/mm: cleanup and improve next_hole_*_addr()")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> ---
>   drivers/gpu/drm/drm_mm.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index a4a04d246135..6fcf70f71962 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -392,11 +392,14 @@ first_hole(struct drm_mm *mm,
>   #define DECLARE_NEXT_HOLE_ADDR(name, first, last)			\
>   static struct drm_mm_node *name(struct drm_mm_node *entry, u64 size)	\
>   {									\
> -	struct rb_node *parent, *node = &entry->rb_hole_addr;		\
> +	struct rb_node *parent, *node;					\
>   									\
> -	if (!entry || RB_EMPTY_NODE(node))				\
> +	if (!entry)							\
>   		return NULL;						\
>   									\
> +	node = &entry->rb_hole_addr;					\
> +	if (RB_EMPTY_NODE(node))					\
> +		return NULL;						\
>   	if (usable_hole_addr(node->first, size)) {			\
>   		node = node->first;					\
>   		while (usable_hole_addr(node->last, size))		\

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
