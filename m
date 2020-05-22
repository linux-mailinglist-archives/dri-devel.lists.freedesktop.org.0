Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE311DE087
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 09:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393D16E986;
	Fri, 22 May 2020 07:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690064.outbound.protection.outlook.com [40.107.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93B46E040;
 Fri, 22 May 2020 07:00:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyNcH2HPgbv/YwmboDBrRjMWgJ3TCCOB6blbxaODW7dJa2M5h2ZAmsluG0S2Cmi9Uutr/NPWvR7uiPy7IelQUKio0wdR8w2Z0bxQbLhnDalabKwuc9sET7bSk6Y3kGk5fLhJoAdPCKe2Fn2pXmHSzbxqftGDaLFZSnBSNd4VJkBlDa6FtEZrQ40L/+UyWKtF2M4EI42+AKrpHveV1CHCp721IAFIqZQR5147YNsos2wUslI4tYVFzCe+RebTlnd45G6g1rzs4inqY8XKck8vj+By61IN3G58ild5+2X3zi7IDSxenNV02mfKVi4RuPOj65MMuw/5UTO+oSkd6WW9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WY7kKAIRxZ4uBFSi5YVnCtvERdF4rl1OUr2az84vs4=;
 b=c1T/89Vqa8ghPm9eB0VoSsL6FZMNLkbGMqoAb6HdMYaD8ibk94H/pwdGO7dG+HqaLbbgfz+4naSGEsHNgoXDWNvl+STt/A/XVpowsSZ1rW3Ryzoz+pkHvEWxrK4FKRRv82TzqPvQisBKMu8jeLOIhTYw54we7dGkhsagCgevFkRV/kRGY62FAKSVDXMD+pn9ZYF7b+D+GbBg+a3/1wHWvEe7HWhGL8nk89VXejr78tbIyTf8NXn4LfQVBlwuPLPDENS7BXYDHuNtuHnrPGgfTivsTN+kIkJcBXXm9Lpj4bBsnXEw5WdOWLFMWveY63mlGhso+CxTFpNYoyCe7tTETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WY7kKAIRxZ4uBFSi5YVnCtvERdF4rl1OUr2az84vs4=;
 b=xtzAyZHXDe8FlZAYZqABWrUtYQToBrpOZ1t6p7QrsFciEoOJRXeefgXAxchviXwyJXUZpShItELQ7tkp1foVQluJBPVUno5ppROlIAkrLauoYXjVVQYBJ5ztcaSpPj8f/OXiClG0aM9STIGkpTVNxuyX3Y9izM8ldI6pDLf8A20=
Authentication-Results: embeddedor.com; dkim=none (message not signed)
 header.d=none;embeddedor.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3018.namprd12.prod.outlook.com (2603:10b6:5:118::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 07:00:17 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3021.026; Fri, 22 May 2020
 07:00:16 +0000
Subject: Re: [PATCH] drm/radeon/dpm: Replace one-element array and use
 struct_size() helper
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200522012547.GA6783@embeddedor>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <753faa45-247c-536c-d85a-5c1385ed0049@amd.com>
Date: Fri, 22 May 2020 09:00:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200522012547.GA6783@embeddedor>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:208:1::41) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:208:1::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 07:00:15 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e2398c8-9037-4d51-9ebb-08d7fe1dc83a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3018:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3018316F918F3123E2C9446883B40@DM6PR12MB3018.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QxTHWGULV7kL1Feb5ViRjI+lrbhTXlPPDerJ/3o3OMyhVhx7NHTiXbIi/agE28LFaSFZKpMUg1H92ar4XLJJ/JcdU7D6ApNSHtAoaUbRS6S1KuIGkHGZRFvzYP7fVxduA0vU8bTB5mj/YUPE4zZ4gLSCfZf3sfTMeDhlgr/ZFC9RMVcDVmyYjqWFh6rIcwTRxNxdzkaxwEFeBqY6zT8WjJuKYq6K7ASpVobLBMV4CcWVDxFs7zDqu7M+im+zcnRq4KxCf/IMdiGShRyWHScpkUTUmqKWa6/4y68ZP4jmMutKrc8UQmpIWLIYAcETFWjTJcLLwm4vIWWI5y+VqAVC/YTkJYZCrtQuwL0LbZ48zRqTP2ZQeC9fBlO7PKxdYtIRHmCPnC84WUONrpLz1t8nQiXYUcGjD1InLCz2Zsr8OoC2cZjbNULuI5VTgnmv3hwBvKVMucf19yrv7xqmPqNTLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(8936002)(52116002)(4326008)(66946007)(31686004)(186003)(478600001)(45080400002)(6486002)(966005)(5660300002)(110136005)(6666004)(316002)(66556008)(36756003)(2616005)(86362001)(66476007)(8676002)(16526019)(2906002)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: aRieqpZkmH7awNiz5I91NP5emv5KuugQnA2Ppupt/bV483dZomvBH9x5pdSGx7nBPcuPldkJQtq0H3VK3q9MV1aJW2y2xDP4BvN0KLGuTjr6rndqnKzLGrPV3lvZnVb8bQO0pgZ/bwO9VS2KTlHYufVwEsXBDoApT02OPm6yi3HdEdw7saAJUwn+T4mnvmHTsrPneApECe86CZa6Nv1BbGtsNX+YvFIcFMKMP7zdrNXKBDEw4ARfNlvqZfJC/nztZ9DpnW76AwTHjTIpP3tyyMFmSeORixTzcuObIuIkk8FlieBs3hhvP4CeI/eRFC47Cqtk9CfwhvwgDHaqfoydak3tMSPyjf882cXiPWo/aKmUNvx269kaUA2MH7+K7fhp/6z+efukOJGr6qBMwU3BD86kUDPsoPxv/fHsDtnYOA00CS6Jzr75o9uT7Me/c2iwkxzeBYDoxXbm1j0Mum7fCp7QmatT39jmD4jokCDv2wqoIGwlkvLzTHlSRm826Mx5VX3T6TGmr6+k58gsGvIJozBG4LplM3VLH+8oZkVDNAGvfmCHbNPe2jEHwOhkPHfA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2398c8-9037-4d51-9ebb-08d7fe1dc83a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 07:00:16.8402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76GUGOH56uL7sM2ZaNKWk7/hDa7Mv2vON+oK2LyNn7xBrBBTwWG1rb5ybopm2h5n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3018
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.05.20 um 03:25 schrieb Gustavo A. R. Silva:
> The current codebase makes use of one-element arrays in the following
> form:
>
> struct something {
>      int length;
>      u8 data[1];
> };
>
> struct something *instance;
>
> instance = kmalloc(sizeof(*instance) + size, GFP_KERNEL);
> instance->length = size;
> memcpy(instance->data, source, size);
>
> but the preferred mechanism to declare variable-length types such as
> these ones is a flexible array member[1][2], introduced in C99:
>
> struct foo {
>          int stuff;
>          struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on. So, replace
> the one-element array with a flexible-array member.
>
> Also, make use of the new struct_size() helper to properly calculate the
> size of struct NISLANDS_SMC_SWSTATE.
>
> This issue was found with the help of Coccinelle and, audited and fixed
> _manually_.
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgcc.gnu.org%2Fonlinedocs%2Fgcc%2FZero-Length.html&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C7dd54e944eff4d17178008d7fdee62d7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637257072615411745&amp;sdata=fQHnbXZpsgiMjHOr%2By0Uq12jpCYEYbdX5K26iNkwyeM%3D&amp;reserved=0
> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FKSPP%2Flinux%2Fissues%2F21&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C7dd54e944eff4d17178008d7fdee62d7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637257072615411745&amp;sdata=gg20YupmqsaW%2Bg3VyJL%2BkjE3kFwnWF1RD1D2QP04OLk%3D&amp;reserved=0
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/si_dpm.h | 2 +-
>   drivers/gpu/drm/radeon/ni_dpm.c     | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dpm.h b/drivers/gpu/drm/amd/amdgpu/si_dpm.h
> index 6b7d292b919f3..bc0be6818e218 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dpm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dpm.h
> @@ -781,7 +781,7 @@ struct NISLANDS_SMC_SWSTATE
>       uint8_t                             levelCount;
>       uint8_t                             padding2;
>       uint8_t                             padding3;
> -    NISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[1];
> +    NISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[];
>   };
>   
>   typedef struct NISLANDS_SMC_SWSTATE NISLANDS_SMC_SWSTATE;
> diff --git a/drivers/gpu/drm/radeon/ni_dpm.c b/drivers/gpu/drm/radeon/ni_dpm.c
> index b57c37ddd164c..7d81dde509dc9 100644
> --- a/drivers/gpu/drm/radeon/ni_dpm.c
> +++ b/drivers/gpu/drm/radeon/ni_dpm.c
> @@ -2685,11 +2685,12 @@ static int ni_upload_sw_state(struct radeon_device *rdev,
>   	struct rv7xx_power_info *pi = rv770_get_pi(rdev);
>   	u16 address = pi->state_table_start +
>   		offsetof(NISLANDS_SMC_STATETABLE, driverState);
> -	u16 state_size = sizeof(NISLANDS_SMC_SWSTATE) +
> -		((NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE - 1) * sizeof(NISLANDS_SMC_HW_PERFORMANCE_LEVEL));
> +	NISLANDS_SMC_SWSTATE *smc_state;
> +	u16 state_size = struct_size(smc_state, levels,
> +			NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE);

Probably better to use size_t instead of u16 here. With that fixed feel 
free to stick my rb on the patch.

Regards,
Christian.

>   	int ret;
> -	NISLANDS_SMC_SWSTATE *smc_state = kzalloc(state_size, GFP_KERNEL);
>   
> +	smc_state = kzalloc(state_size, GFP_KERNEL);
>   	if (smc_state == NULL)
>   		return -ENOMEM;
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
