Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9DC9B3F9C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 02:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD1410E1CD;
	Tue, 29 Oct 2024 01:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340EF10E1CD;
 Tue, 29 Oct 2024 01:17:10 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Xcskw4JBbz1SDSl;
 Tue, 29 Oct 2024 09:15:36 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
 by mail.maildlp.com (Postfix) with ESMTPS id 7F7821402D0;
 Tue, 29 Oct 2024 09:17:07 +0800 (CST)
Received: from [10.67.110.237] (10.67.110.237) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Oct 2024 09:17:06 +0800
Subject: Re: [PATCH] drm/amdgpu: Fix possible NULL pointer dereference
To: "Lazar, Lijo" <lijo.lazar@amd.com>, <alexander.deucher@amd.com>
CC: <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <Hawking.Zhang@amd.com>, <yifan1.zhang@amd.com>,
 <Likun.Gao@amd.com>, <Tim.Huang@amd.com>, <pratap.nirujogi@amd.com>,
 <victorchengchi.lu@amd.com>, <Jun.Ma2@amd.com>, <le.ma@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241028215933.2599271-1-lihuafei1@huawei.com>
 <de0e660b-395f-4a26-8bbc-199df83a90b4@amd.com>
From: Li Huafei <lihuafei1@huawei.com>
Message-ID: <1d35a7d8-5fef-6e8d-b0c7-a3ad5e7fb469@huawei.com>
Date: Tue, 29 Oct 2024 09:17:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <de0e660b-395f-4a26-8bbc-199df83a90b4@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.237]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf500004.china.huawei.com (7.202.181.242)
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



On 2024/10/28 22:33, Lazar, Lijo wrote:
> 
> 
> On 10/29/2024 3:29 AM, Li Huafei wrote:
>> Fix the potential NULL pointer dereference on mem_ranges in
>> amdgpu_discovery_get_nps_info(). Additionally, assign the output
>> parameters nps_type and range_cnt after the kvzalloc() call to prevent
>> modifying the output parameters in case of an error return.
>>
>> Fixes: b194d21b9bcc ("drm/amdgpu: Use NPS ranges from discovery table")
>> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> index 4bd61c169ca8..1b1aedebb3c2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> @@ -1757,11 +1757,13 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_device *adev,
>>  
>>  	switch (le16_to_cpu(nps_info->v1.header.version_major)) {
>>  	case 1:
>> -		*nps_type = nps_info->v1.nps_type;
>> -		*range_cnt = nps_info->v1.count;
> 
> This one is used in the allocation call below. If you prefer to not
> assign any of the out params before memory allocation is successful,
> then use nps_info->v1.count in the alloc call.
> 

too bad! I missed it. I will send v2 to fix it.

Thanks,
Huafei

> Thanks for adding the alloc fail check.
> 
> Thanks,
> Lijo
>>  		mem_ranges = kvzalloc(
>>  			*range_cnt * sizeof(struct amdgpu_gmc_memrange),
>>  			GFP_KERNEL);
>> +		if (!mem_ranges)
>> +			return -ENOMEM;
>> +		*nps_type = nps_info->v1.nps_type;
>> +		*range_cnt = nps_info->v1.count;
>>  		for (i = 0; i < *range_cnt; i++) {
>>  			mem_ranges[i].base_address =
>>  				nps_info->v1.instance_info[i].base_address;
> .
> 
