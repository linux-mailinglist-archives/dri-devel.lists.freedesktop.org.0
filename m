Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B847D76A639
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 03:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3720910E2E3;
	Tue,  1 Aug 2023 01:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE5810E2E3;
 Tue,  1 Aug 2023 01:21:52 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RFHLC667YztRhT;
 Tue,  1 Aug 2023 09:18:27 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 09:21:46 +0800
Message-ID: <ab080438-5281-d314-89a7-1ecb7b96186c@huawei.com>
Date: Tue, 1 Aug 2023 09:21:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] drm/amdgpu: Remove a lot of unnecessary ternary
 operators
To: Tom Rix <trix@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <evan.quan@amd.com>,
 <srinivasan.shanmugam@amd.com>, <wangxiongfeng2@huawei.com>,
 <Hawking.Zhang@amd.com>, <James.Zhu@amd.com>,
 <Veerabadhran.Gopalakrishnan@amd.com>, <saleemkhan.jamadar@amd.com>,
 <le.ma@amd.com>, <tao.zhou1@amd.com>, <Jane.Jian@amd.com>,
 <Hongkun.Zhang@amd.com>, <leo.liu@amd.com>, <lijo.lazar@amd.com>,
 <mario.limonciello@amd.com>, <Lang.Yu@amd.com>, <ruijing.dong@amd.com>,
 <Suresh.Guttula@amd.com>, <David.Wu3@amd.com>, <sonny.jiang@amd.com>,
 <wenjing.liu@amd.com>, <Jun.Lei@amd.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <drv@mailo.com>, <Shiwu.Zhang@amd.com>,
 <aleksei.kodanev@bell-sw.com>, <ye.xingchen@zte.com.cn>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230731132610.2675314-1-ruanjinjie@huawei.com>
 <a048aa87-5bac-2032-6d5e-929af5cbc8e1@redhat.com>
Content-Language: en-US
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <a048aa87-5bac-2032-6d5e-929af5cbc8e1@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/8/1 0:22, Tom Rix wrote:
> 
> On 7/31/23 6:26 AM, Ruan Jinjie wrote:
>> Ther are many ternary operators, the true or false judgement
>> of which is unnecessary in C language semantics.
>>
>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>> ---
> 
> snip
>>  	data->registry_data.avfs_support =
>> -		hwmgr->feature_mask & PP_AVFS_MASK ? true : false;
>> +		hwmgr->feature_mask & PP_AVFS_MASK;
>>  	data->registry_data.led_dpm_enabled = 1;
> 
> These are not equivalent, consider 0xffff & 0x1000 != 1
Sorry! these are actually not equivalent，I'll fix it in v2. But the many
others could be more simplified.
> 
> Tom
> 
> 
