Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D34D2B9002
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 11:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0F56E57A;
	Thu, 19 Nov 2020 10:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C5C6E59B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 10:23:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdDU2wgxZ2ZP4yrX0fry6vVETaCRo0Sg4E2Au/48O12BwBIBoS12/e4LXbD347t4H18a8x+ekqrPPn1BoTQQreSKU+qKcTyeNhhTkkKiDCFk1y69aZdPz+L/8G1SUWy1tUR/C1PdkoLitdMncnws7ltXGcoXfaMZc1n5VgRyyVaqI/fyUjI47wDDcqeLR+y/f19UkRRVjEccTdIJi713UtKjvRvdVt2wV+ty8lFVMaj0zzfF629wZ2I0IL0NdxIkKCRXx5tF9vTXx/EpKtP9ALniDZFcMLhO5XPdg9AIs+7ugNC+bMlQQIuior++dN5Haslicp+WIkCFlhMpz+LKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u16ohsnLEA/SFBVNFebFVkt4RulM+AcFgbeMvH5kRlk=;
 b=MJ+k7DhKpr8VEg1MBwO1/2G6vZqIGHid17OqbcCYVfoskaNv+aOEVdZ51JteHKeBu0PZqvLADLSMf59i1p7PBliR2aW79aqvCAlMLDFeJh5ITCTiTEKtbJVpaMOCv6gc12054KRPAA2PgxW8Ij0jqVZheH/0klCngoNV6TuY9KsvJts5pNThmkvGUcpd5Ffgl4CGFR/4j9YZh42Y+scmNGDJwLXVvLTiODCzub/Jzkx2mseXz/gLYrV+1WeW3rsVudO4aJPbOEZPSwzjWCvSSGpEs/DJgUmA7D0yFrqKpbeRrQErRJv7mGgDak046ILKNoKsOTorQLgDIuheTcRSvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u16ohsnLEA/SFBVNFebFVkt4RulM+AcFgbeMvH5kRlk=;
 b=gKsJWJ3op9zUWYLr9H9wmwDYSd7+ja+BGpAeJr1qYLtNlQ+BMKPgXyZjrCx3sMGo0C7ITZtgWvwtuQNc3iOkgIFIMqIu8r4lNhMuoeh0Y0XpHcHGPqwriUDsjFDjY4kvEwLxryeTX1Pn9PyQUYuqKOXl5u5YdKOUR7x/jtYX1+8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MW3PR12MB4426.namprd12.prod.outlook.com (2603:10b6:303:58::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Thu, 19 Nov
 2020 10:23:04 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::4590:261a:f3b1:a1a2]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::4590:261a:f3b1:a1a2%9]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 10:23:04 +0000
Date: Thu, 19 Nov 2020 18:22:54 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: fix DMA32 handling in the global page pool
Message-ID: <20201119102254.GA2562865@hr-amd>
References: <20201117155334.7855-1-christian.koenig@amd.com>
 <cd99b824-f08b-f06c-bb0b-e25e6875f89a@gmail.com>
Content-Disposition: inline
In-Reply-To: <cd99b824-f08b-f06c-bb0b-e25e6875f89a@gmail.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK2PR03CA0055.apcprd03.prod.outlook.com
 (2603:1096:202:17::25) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2PR03CA0055.apcprd03.prod.outlook.com (2603:1096:202:17::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.11 via Frontend Transport; Thu, 19 Nov 2020 10:23:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eb8bf63c-38c9-4982-6ba2-08d88c751996
X-MS-TrafficTypeDiagnostic: MW3PR12MB4426:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB44264E5CE38DE770E0F4F43EECE00@MW3PR12MB4426.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /cel3pKOQWzvOOGuBg15PfUcoVOnShxqbrRXz7NzWr6GAyTJxWkd3y3JMUsDhYuaZ/dbcAmwgO5HIXnOZrNN6p0hk2kZDs3rCEbd8ISvUFSEeU059lSX/vFpOonOD/acbb1kuPiaWxSdTclVMOZLzPL59hdG/0kAbg2Z7aXyOi+6A2YKbqaQHapl94HzXJEXUSs+a4UAhKB/PGEnfL3F3Oabncols7Up0Y7vOjXLn/CZd4A4i9ouu5gCFbVBW9UOyUHcTKLw4FpANRq/+sqnMTCg1HUwxsyVEEkVT/37pUy1MjJtPW5RfLU2iqEaE2zJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(478600001)(8676002)(66574015)(6666004)(52116002)(4326008)(83380400001)(9686003)(1076003)(55016002)(86362001)(2906002)(6916009)(5660300002)(33716001)(66946007)(66556008)(66476007)(26005)(6496006)(8936002)(33656002)(316002)(186003)(956004)(16526019)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: pZILj7/C3QJFY0yEwtQCLuTY/jE8iHd7EcCFXcpmSPNkRmPaiCBH2GoEKNlzyXVHD69pCda5+j64VjqdicpXo2goOpWr4LeSy2CWmvbLSMM4Mh0h6xW9rK6F6ugbLyMtwVQViNfhnXq3IAfHeQQoMANrXdg2/uQ7tOs2PId8tu++8yg6TUoGKZjDZazilFAarPaIC/C4snH0p2WzXM0kSxCs7s28CgyPx+7bIeWys0dfsh+tyDqJrDDGwNajyFN+L1NwgRMn4uXkDQI+vqDdxcdlmBpAVLSaHq0nf9TublPCvEqRDK2UFjhfuGKplCDOCuWgzQodijcIbiURjef5CmSvTDobQsxfqcL+1v/IHjuNzZU7e4vxMtij1kRn5lYL9BBckEph9nkuVuZofTbSxCuRCiGXhjXPuhS0xD5968JmEm951RCEl1heKEgOntdm4w21hhg+BcjPpkFFxE8qyvCJwHgpGeLi1p8LUSYN6I2ROHwrIeIe4kiVglMZ2LjQoUNDeapKp3f4ixejco3D6DGyZ/qYshhKZcq5Wg9JbOj7OuBJTHycZFGOdtdhYqglBLxPW97gPGg0xbQq8+458MAqS3/CF1V3/87pES5HleoqYjyj80i/5eKkC0fsR2E1/U+7qtxOII1SaNB4vSG0uBKK+u+XyJ64tPuK6HPsjGbaUWJNHQgz7SW45xm79n8yaMAzah+VuoouEMotrc9Q9gIOgNQ06CZCeqUeyYPJR89+XTolSRbAdVxVvYuzejF5OCAmYrVxhpu6hLnuNHpGIeYrbKwb8TmLuW0LXXp4S2QYTKtZdk9r0BD3EUu3XjLoZL/3tcBc1xcIwQghuFMTr3WGhyuLgZk/S8V4MXpiJy3TWYhZX/TfY1HhuhfjpAgy8STeRXUOJt1CbIp9vxpkzA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8bf63c-38c9-4982-6ba2-08d88c751996
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 10:23:04.3574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSUOaYfPxPAqAd0hFMv8qvFQqLo+z7ZrH4E3Ipjll1tRRHiEABvtQDLV/ujMhaL3YI+bmAm+GQh7YGGv5aIg6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4426
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 05:21:51PM +0800, Christian K=F6nig wrote:
> Ping, can I get an rb or at least Acked-by for this?
> =

> Thanks in advance,
> Christian.
> =

> Am 17.11.20 um 16:53 schrieb Christian K=F6nig:
> > When we have mixed DMA32 and non DMA32 device in one system
> > it could otherwise happen that the DMA32 device gets pages
> > it can't work with.
> >
> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Looks good for me.

Reviewed-by: Huang Rui <ray.huang@amd.com>

> > ---
> >   drivers/gpu/drm/ttm/ttm_pool.c | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_p=
ool.c
> > index 1b96780b4989..5455b2044759 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -63,6 +63,9 @@ static atomic_long_t allocated_pages;
> >   static struct ttm_pool_type global_write_combined[MAX_ORDER];
> >   static struct ttm_pool_type global_uncached[MAX_ORDER];
> >   =

> > +static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
> > +static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> > +
> >   static spinlock_t shrinker_lock;
> >   static struct list_head shrinker_list;
> >   static struct shrinker mm_shrinker;
> > @@ -290,8 +293,14 @@ static struct ttm_pool_type *ttm_pool_select_type(=
struct ttm_pool *pool,
> >   #ifdef CONFIG_X86
> >   	switch (caching) {
> >   	case ttm_write_combined:
> > +		if (pool->use_dma32)
> > +			return &global_dma32_write_combined[order];
> > +
> >   		return &global_write_combined[order];
> >   	case ttm_uncached:
> > +		if (pool->use_dma32)
> > +			return &global_dma32_uncached[order];
> > +
> >   		return &global_uncached[order];
> >   	default:
> >   		break;
> > @@ -570,6 +579,11 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct=
 seq_file *m)
> >   	seq_puts(m, "uc\t:");
> >   	ttm_pool_debugfs_orders(global_uncached, m);
> >   =

> > +	seq_puts(m, "wc 32\t:");
> > +	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
> > +	seq_puts(m, "uc 32\t:");
> > +	ttm_pool_debugfs_orders(global_dma32_uncached, m);
> > +
> >   	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> >   		seq_puts(m, "DMA ");
> >   		switch (i) {
> > @@ -640,6 +654,11 @@ int ttm_pool_mgr_init(unsigned long num_pages)
> >   		ttm_pool_type_init(&global_write_combined[i], NULL,
> >   				   ttm_write_combined, i);
> >   		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
> > +
> > +		ttm_pool_type_init(&global_dma32_write_combined[i], NULL,
> > +				   ttm_write_combined, i);
> > +		ttm_pool_type_init(&global_dma32_uncached[i], NULL,
> > +				   ttm_uncached, i);
> >   	}
> >   =

> >   	mm_shrinker.count_objects =3D ttm_pool_shrinker_count;
> > @@ -660,6 +679,9 @@ void ttm_pool_mgr_fini(void)
> >   	for (i =3D 0; i < MAX_ORDER; ++i) {
> >   		ttm_pool_type_fini(&global_write_combined[i]);
> >   		ttm_pool_type_fini(&global_uncached[i]);
> > +
> > +		ttm_pool_type_fini(&global_dma32_write_combined[i]);
> > +		ttm_pool_type_fini(&global_dma32_uncached[i]);
> >   	}
> >   =

> >   	unregister_shrinker(&mm_shrinker);
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
