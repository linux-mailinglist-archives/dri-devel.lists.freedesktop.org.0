Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7896F5BC18A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 04:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0145A10E4E8;
	Mon, 19 Sep 2022 02:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1201 seconds by postgrey-1.36 at gabe;
 Mon, 19 Sep 2022 02:49:38 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A698210E4E8;
 Mon, 19 Sep 2022 02:49:38 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MW7qf2xGzzHnrw;
 Mon, 19 Sep 2022 10:27:26 +0800 (CST)
Received: from [10.174.178.165] (10.174.178.165) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 10:29:32 +0800
Subject: Re: [PATCH] gpu: dc: fix enum conversion in display_mode_vba
To: Zeng Heng <zengheng4@huawei.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Nevenko.Stupar@amd.com>, <Pavle.Kotarac@amd.com>, <aric.cyr@amd.com>
References: <20220919014125.3295213-1-zengheng4@huawei.com>
From: Wei Yongjun <weiyongjun1@huawei.com>
Message-ID: <43f17686-538d-030b-1121-2770f12cf04d@huawei.com>
Date: Mon, 19 Sep 2022 10:29:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20220919014125.3295213-1-zengheng4@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.165]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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



On 2022/9/19 9:41, Zeng Heng wrote:
> Fix below compile warning when open enum-conversion
> option check (compiled with -Wenum-conversion):
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:
> In function ‘dml20_ModeSupportAndSystemConfigurationFull’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3900:44:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>  3900 |     locals->ODMCombineEnablePerState[i][k] = false;
>       |                                            ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3904:46:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>  3904 |       locals->ODMCombineEnablePerState[i][k] = true;
>       |                                              ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3907:46:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>  3907 |       locals->ODMCombineEnablePerState[i][k] = true;
>       |                                              ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3960:45:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>  3960 |      locals->ODMCombineEnablePerState[i][k] = false;
> 
> Use the proper value from the right enumerated type,
> dm_odm_combine_mode_disabled & dm_odm_combine_mode_2to1,
> so there is no more implicit conversion.
> 
> The numerical values of dm_odm_combine_mode_disabled
> & false and dm_odm_combine_mode_2to1 & true
> happen to be the same, so there is no change in
> behavior.
> 

LGTM

