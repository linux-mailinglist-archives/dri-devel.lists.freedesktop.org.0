Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972175BC163
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 04:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22D110E4E3;
	Mon, 19 Sep 2022 02:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E466D10E4E3;
 Mon, 19 Sep 2022 02:31:14 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MW7qJ303mzlVwP;
 Mon, 19 Sep 2022 10:27:08 +0800 (CST)
Received: from [10.174.178.165] (10.174.178.165) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 10:31:11 +0800
Subject: Re: [PATCH] gpu: color: eliminate implicit conversion about enum type
To: Zeng Heng <zengheng4@huawei.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Pavle.Kotarac@amd.com>, <HaoPing.Liu@amd.com>, <Krunoslav.Kovac@amd.com>,
 <Yao.Wang1@amd.com>
References: <20220919014457.3297857-1-zengheng4@huawei.com>
From: Wei Yongjun <weiyongjun1@huawei.com>
Message-ID: <7d80c71d-855e-ceff-a1bb-104fa210b7dc@huawei.com>
Date: Mon, 19 Sep 2022 10:31:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20220919014457.3297857-1-zengheng4@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.165]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
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
Cc: liwei391@huawei.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gpu: color: fix enum-conversion compile warning

标题我记得不跟你所过让你改的


On 2022/9/19 9:44, Zeng Heng wrote:
> Fix below compile warning when open enum-conversion
> option check:
> 
> drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c:
> In function ‘apply_degamma_for_user_regamma’:
> drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c:1695:29:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum dc_transfer_func_predefined’ [-Werror=enum-conversion]
>  1695 |  build_coefficients(&coeff, true);
>       |                             ^~~~
> 
> As 'build_coefficients' definition, it needs enum
> 'dc_transfer_func_predefined' type acts as the
> second argument, instead of bool-type one.
> 
> The numerical values of TRANSFER_FUNCTION_BT709 & true
> happen to be the same, so there is no change in
> behavior.
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/modules/color/color_gamma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> index 04f7656906ca..2f807d787c77 100644
> --- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> +++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> @@ -1692,7 +1692,7 @@ static void apply_degamma_for_user_regamma(struct pwl_float_data_ex *rgb_regamma
>  	struct pwl_float_data_ex *rgb = rgb_regamma;
>  	const struct hw_x_point *coord_x = coordinates_x;
>  
> -	build_coefficients(&coeff, true);
> +	build_coefficients(&coeff, TRANSFER_FUNCTION_BT709);
>  
>  	i = 0;
>  	while (i != hw_points_num + 1) {
> 
