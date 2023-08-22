Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA45783787
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 03:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF9110E122;
	Tue, 22 Aug 2023 01:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id 80C8C10E122;
 Tue, 22 Aug 2023 01:39:27 +0000 (UTC)
Received: from [172.30.11.106] (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 863BD607583BC; 
 Tue, 22 Aug 2023 09:39:23 +0800 (CST)
Message-ID: <c589a9b0-fc6b-d699-f08f-2e18c3e034a4@nfschina.com>
Date: Tue, 22 Aug 2023 09:39:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm/amdgpu: Avoid possible buffer overflow
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <2a4448cb-ac01-71fc-9335-68acdded0a78@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: yifan1.zhang@amd.com, guchun.chen@amd.com, lijo.lazar@amd.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, le.ma@amd.com, christophe.jaillet@wanadoo.fr,
 dri-devel@lists.freedesktop.org, Yuliang.Shi@amd.com, candice.li@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/8/21 17:31, Christian König wrote:
> Am 21.08.23 um 09:37 schrieb Su Hui:
>> smatch error:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1257 
>> amdgpu_discovery_reg_base_init() error:
>> testing array offset 'adev->vcn.num_vcn_inst' after use.
>>
>> change the assignment order to avoid buffer overflow.
>>
>> Fixes: c40bdfb2ffa4 ("drm/amdgpu: fix incorrect VCN revision in SRIOV")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>> changes in v2:
>>   - fix the error about ip->revision (thanks to Christophe JAILLET).
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> index 8e1cfc87122d..b07bfd106a9b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> @@ -1250,11 +1250,10 @@ static int 
>> amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
>>                    *     0b10 : encode is disabled
>>                    *     0b01 : decode is disabled
>>                    */
>> - adev->vcn.vcn_config[adev->vcn.num_vcn_inst] =
>> -                    ip->revision & 0xc0;
>> -                ip->revision &= ~0xc0;
>>                   if (adev->vcn.num_vcn_inst <
>>                       AMDGPU_MAX_VCN_INSTANCES) {
>> + adev->vcn.vcn_config[adev->vcn.num_vcn_inst] =
>> +                        ip->revision & 0xc0;
>>                       adev->vcn.num_vcn_inst++;
>>                       adev->vcn.inst_mask |=
>>                           (1U << ip->instance_number);
>> @@ -1265,6 +1264,7 @@ static int 
>> amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
>>                           adev->vcn.num_vcn_inst + 1,
>>                           AMDGPU_MAX_VCN_INSTANCES);
>>                   }
>> +                ip->revision &= ~0xc0;
>
> That doesn't looks correct either. The assignment is intentionally 
> outside of the "if".
>
> See "adev->vcn.vcn_config[adev->vcn.num_vcn_inst] = ip->revision & 
> 0xc0;" is always valid.

Hi,

if "adev->vcn.vcn_config[adev->vcn.num_vcn_inst] = ip->revision & 0xc0;" 
is always valid, then

"adev->vcn.num_vcn_inst< AMDGPU_MAX_VCN_INSTANCES " is always true. So 
the below judgement has

no sense.

                   if (adev->vcn.num_vcn_inst <
                       AMDGPU_MAX_VCN_INSTANCES) {

On the contrary, if we need this judgement, then 
"adev->vcn.vcn_config[adev->vcn.num_vcn_inst] = ip->revision & 0xc0;"is not

always valid, because "adev->vcn.num_vcn_inst >= 
AMDGPU_MAX_VCN_INSTANCES" can be true, which cause buffer overflow.

So I think this patch has some sense if I don't make some mistakes.

Su Hui

>
> We just avoid incrementing num_vcn_inst when we already have to many.
>
> Regards,
> Christian.
>
>
>>               }
>>               if (le16_to_cpu(ip->hw_id) == SDMA0_HWID ||
>>                   le16_to_cpu(ip->hw_id) == SDMA1_HWID ||
>
