Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF82863ABA6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B24810E1EB;
	Mon, 28 Nov 2022 14:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn2104.outbound.protection.outlook.com [40.92.98.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3336D10E1EB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 14:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjWpoVrX3DnNVVyzN6uMDbL86uOYci5zcMud+sREkjDvb8XdFTvlWfmYj3C4BojXxFHg9kfFcnwgBhFNLou6sIKa2f2cNB2zXs/LOHcvKkiAFS3+GEQEvT9Q62TCQjrCm8hkNccmdyFQaQoByh77L6hdoZJ4ef3VZ4UXkAps4sqCdiBHrreNmEZvorBFdKGYwe4RVF7Vb2yzZ9yDnoB7r50ZKZRy9XsnipuTsQRz5HpgW9sNN0UWkYiYMGWnkIYQoB7YWEqrzkGF9PHt3JBYCks03D4jN4cKhdzpu9nTxUF25fGH6wrbHgwdY4ZPZtF2Lfgg3wOHATuOkz8DfZha7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahRblvc7GEmuWQI1TkTP5Tz6QhUpzcRXLIA70dCHvec=;
 b=ntsoyCQYB+OhY5nhURZtkEFlh1TwsLDCNcqB+yvjPSQJoBB/CLYklQixdrIEn2OpNn8e1SFuKhToWFT34e8VC5h/CXOtlW8c5OoXdmRsH5dhsHktMqcknsMRyyeJskf9Ma20GyB/Y6ZUO5Wmkd7WwLM8MmngP/dqB6b1Tx3C4J6i9CUqYmVxFUeXWOk38BgKJhuh8e8OLzcMy3R/NoGWeyh8NIw6Lq/53cQADoVoDjBgk3kSuRpOuodflqWcM2gXIYBSXGd+PfajOBvys6MsYX8zJHr6eqji/mxHKKRVPyr6qssQWv9oiegQN45cFsgCjfkdr0DvdzQn69wlOdlY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahRblvc7GEmuWQI1TkTP5Tz6QhUpzcRXLIA70dCHvec=;
 b=lP7sy66erfAOPOyYawvRk91eK/5etQi27NWgHhWt7okR7OoapibG7E/H3ioAqbDZnliA5u2m16jOEN7LMAwZq1bfT0nqGpCFLzeAdLvI1ThvlsCLpN/YYM5KprjHfkfvFZvlBcC2Z9URV3zjDh+aMdUmvjIg9+jSP2VKAETu3adj9jsgwWlGfVLefzp+EzV59jJ+3nJ9W+kK2ZQHwokmf1uHysgcl5X5BX1OY9pPJsTjkB8alBQIOI+MbArZufZuun4qXEhbMXNUm148fafy8IZ1yYZxa6G+C+YnysTeyOQdO1oZkcQyV5KgJhDvnoVpEtCBkh4uc2mUaEvJEoRrmQ==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYCP286MB2534.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Mon, 28 Nov
 2022 14:56:05 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%4]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 14:56:05 +0000
Date: Mon, 28 Nov 2022 22:56:01 +0800
From: Dawei Li <set_pte_at@outlook.com>
To: zackr@vmware.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH v3] drm/vmwgfx: Fix race issue calling pin_user_pages
Message-ID: <TYCP286MB23230F5BA9B42D637F302B2DCA139@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: <TYWP286MB23193621CB443E1E1959A00BCA3E9@TYWP286MB2319.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYWP286MB23193621CB443E1E1959A00BCA3E9@TYWP286MB2319.JPNP286.PROD.OUTLOOK.COM>
X-TMN: [6NipouSTAdqL1MVRuUY/oYlV5SRNLi+e]
X-ClientProxiedBy: TYWP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::20) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20221128145601.GA6622@wendao-VirtualBox>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYCP286MB2534:EE_
X-MS-Office365-Filtering-Correlation-Id: f9de5b28-5b40-4c3d-8f38-08dad150ab9f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NsaIVuNBpaO5JFwj6fmFWhPhakLp9q48GHjoAz8X6/+hltsDJgxR1g6+qeLmwDFUTSTgqKVhPnV1XorJtk4HCsZJ4cx6UB645dVKLSVyxbnjPO7ZXDNeFWwZJ+M98cR6oveoAvMvXxiMB0PItF/MPOdbY+1J4VKUNs3KakQZvpKzkeg+MX7S+ELdqHqbRVIGqvsF16Q+PU0pHrLO3oZOicqJm085dRDbXtXZ4JvpZnaWYS9rN1eckkE7i2DpnAA83WmB9JSiTBCajYzmcnKDHITaDsZQ+IkmoT68KBuB3D1VlemOkcP6iKCABdSqF6MXNIwP3Uka5mE888JTDulb6QUWKTrpnwK39gKfohlbH+cvQVM0bp0KuBsBPzbHOnz+drhukQVIfpDEUBhMW4In6CUzRM92gJiNHadTnL0x1NBcP4OAEERe8v/MgC5c9EkamiFJazFeUAgloZcip1qmkHHdm8GSCCtNGZgnlDRcWG4orxLyhy8j6GW1U5uFeieXZx64TvDYEEjDCRQlqBlmBn8CgTtUl16dz9ekuv0+uhgKFkSTPBtbwL4OfFqe5/V3Myyo87PlURl37vKte13xbr6QydWFP42FD4ezvCECdrNY+QihELCGhsflTbdNMQupxJwJHpUBz5gfD5cgFBpOkw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HsM1fX5KzdtECerHg10UJc/jotGfnGr41OeeN1qgkWc0jxRyAnykeZQkaSts?=
 =?us-ascii?Q?Sbwi6een5sSFItW1n2i75jUlvToQmcnIiSfFkd+Ht76v7WIIRi7FPG/tAqVx?=
 =?us-ascii?Q?+oc/cdH5etQrS5jY9utJQdlFewfj73IcgVm645U3smL9LEFqGiit31v4wA5C?=
 =?us-ascii?Q?k2A2ZvzDGTcJJuqX8Owyr4DMBU0tT3hfCtVhvLpKvv/c4hEhCqcyU6kvyWFm?=
 =?us-ascii?Q?XaZHU1i4Ax4FknOBC9pc5CANS2fBCgUrKWOaz2q9LPeGUSc7NDxntp2OFnx2?=
 =?us-ascii?Q?qUTAZ4IwScGAXUVVFaKw3Cxv4ECTIgLjWeb2LQU2fD+HEDbZuRBSECFTfU6P?=
 =?us-ascii?Q?ivetWpt4m534DC0zK+HXvQip3RPg3vyWvbRKpND2gEKJHS6bZkWaCweRLTql?=
 =?us-ascii?Q?F8GalQtuXR8opOpDJPUkme5GafQzSCyaiTb0+83JePLk1VaHliz12DQym90w?=
 =?us-ascii?Q?zzfhg4TlgAkUB2aGFCG+AXoMJ4NnPzrMwdcfXiiJ8jnLnsA4qKm0cStEI7As?=
 =?us-ascii?Q?vdDw7hSn/r3dAnmH6H60WhHZdioZx/J9i7jlA1iQNyGhfgb6aomg1h1R8HP+?=
 =?us-ascii?Q?El4xNx0GcvrW7PUqWNZgIw2ZXJhKLAEN3eSOxAc5qblhUWJW/RX/ORL6AMPS?=
 =?us-ascii?Q?ZkcVsnwEu7sddGBtjuwgi02KfU1Mv2dtegvp9indOS/lTuumoueozp7Mg6+L?=
 =?us-ascii?Q?HSuv5EEI+RyhcMoVF1bLRumHnnJNPWb+pRYZgWLBCEK6Z8hlvlIWEiEBLQr3?=
 =?us-ascii?Q?4x0TWF9a+x2jVYpLAGmt8OimAQOqTovJPybRL82KJ3hCcjPIZRWXp2uIdLR/?=
 =?us-ascii?Q?uUB1QQ0uITkqTKhHexjI1lsmzcSMWOilvKI1V/RVPibq7P/BvTqPJ54GEs7H?=
 =?us-ascii?Q?kfh+U/AdoMT+knkQqXJ98CTFU23o/P4IhfeRlA38jCTeIjlVzmDfVV6GbPO8?=
 =?us-ascii?Q?zAe+lh3NeC6XNNS03QFf9w+DgPAlLVRbQqR5/Y2yJkNRdXeWzWrVPLdsYjBa?=
 =?us-ascii?Q?LkubZ0wlVfkOwb20iG/mF6znpbuhATfGT5UCvMRvIkbdk8mpXuhISRPUt4fE?=
 =?us-ascii?Q?ZkvdZia8An4gwBmMrjJFOQXWXNsLhdi1Qpo8HHTSacKiQVFRu4YjSU2tS+EC?=
 =?us-ascii?Q?fsJKyffM6ZZ/I+ikp6nLj0miZrJZF6tzyyK+z8Q1CAxq7f9Zi3dQhNjyMYtZ?=
 =?us-ascii?Q?1D8ywr/pup7EK60xY8lOmuNml/HqnVx2stp+BoTujSPQQLj8ZaXUdRZ+5OBO?=
 =?us-ascii?Q?/DCJ/IsRIR0DG+ZNE4/mkZdGKw4AtyiMOz7uNEZWrA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9de5b28-5b40-4c3d-8f38-08dad150ab9f
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 14:56:05.4867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2534
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
Cc: krastevm@vmware.com, linux-graphics-maintainer@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 11:37:34PM +0800, Dawei Li wrote:
> pin_user_pages() is unsafe without protection of mmap_lock,
> fix it by calling pin_user_pages_fast().
> 
> Fixes: 7a7a933edd6c ("drm/vmwgfx: Introduce VMware mks-guest-stats")
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
> v1:
> https://lore.kernel.org/all/TYCP286MB23235C9A9FCF85C045F95EA7CA4F9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
> 
> v1->v2:
> Rebased to latest vmwgfx/drm-misc-fixes.
> 
> v2->v3
> Replace pin_user_pages() with pin_user_pages_fast().

Gentle ping

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> index 089046fa21be..50fa3df0bc0c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> @@ -1085,21 +1085,21 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
>  	reset_ppn_array(pdesc->strsPPNs, ARRAY_SIZE(pdesc->strsPPNs));
>  
>  	/* Pin mksGuestStat user pages and store those in the instance descriptor */
> -	nr_pinned_stat = pin_user_pages(arg->stat, num_pages_stat, FOLL_LONGTERM, pages_stat, NULL);
> +	nr_pinned_stat = pin_user_pages_fast(arg->stat, num_pages_stat, FOLL_LONGTERM, pages_stat);
>  	if (num_pages_stat != nr_pinned_stat)
>  		goto err_pin_stat;
>  
>  	for (i = 0; i < num_pages_stat; ++i)
>  		pdesc->statPPNs[i] = page_to_pfn(pages_stat[i]);
>  
> -	nr_pinned_info = pin_user_pages(arg->info, num_pages_info, FOLL_LONGTERM, pages_info, NULL);
> +	nr_pinned_info = pin_user_pages_fast(arg->info, num_pages_info, FOLL_LONGTERM, pages_info);
>  	if (num_pages_info != nr_pinned_info)
>  		goto err_pin_info;
>  
>  	for (i = 0; i < num_pages_info; ++i)
>  		pdesc->infoPPNs[i] = page_to_pfn(pages_info[i]);
>  
> -	nr_pinned_strs = pin_user_pages(arg->strs, num_pages_strs, FOLL_LONGTERM, pages_strs, NULL);
> +	nr_pinned_strs = pin_user_pages_fast(arg->strs, num_pages_strs, FOLL_LONGTERM, pages_strs);
>  	if (num_pages_strs != nr_pinned_strs)
>  		goto err_pin_strs;
>  
> -- 
> 2.25.1
> 
