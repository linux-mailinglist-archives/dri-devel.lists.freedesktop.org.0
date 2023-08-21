Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17F0782409
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027DB10E1F6;
	Mon, 21 Aug 2023 06:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id D783310E1F5;
 Mon, 21 Aug 2023 06:52:38 +0000 (UTC)
Received: from [172.30.11.106] (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id E04366061F6CA; 
 Mon, 21 Aug 2023 14:52:34 +0800 (CST)
Message-ID: <e07b89c3-4a1b-67e6-c434-7c8aef62d68e@nfschina.com>
Date: Mon, 21 Aug 2023 14:52:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/amdgpu: Avoid possible buffer overflow
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <7ac675b6-a000-6ad7-36f3-a3ce186414b6@wanadoo.fr>
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
 amd-gfx@lists.freedesktop.org, le.ma@amd.com, dri-devel@lists.freedesktop.org,
 Yuliang.Shi@amd.com, candice.li@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/8/21 14:47, Christophe JAILLET wrote:
> Le 21/08/2023 à 08:19, Su Hui a écrit :
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
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> index 8e1cfc87122d..ba95526c3d45 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> @@ -1250,11 +1250,12 @@ static int 
>> amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
>>                    *     0b10 : encode is disabled
>>                    *     0b01 : decode is disabled
>>                    */
>> - adev->vcn.vcn_config[adev->vcn.num_vcn_inst] =
>> -                    ip->revision & 0xc0;
>> +
>>                   ip->revision &= ~0xc0;
>>                   if (adev->vcn.num_vcn_inst <
>>                       AMDGPU_MAX_VCN_INSTANCES) {
>> + adev->vcn.vcn_config[adev->vcn.num_vcn_inst] =
>> +                        ip->revision & 0xc0;
>
> Hi,
> I don't think that the patch is correct.
>
> Because of the "ip->revision &= ~0xc0" which is now above it, 
> "ip->revision & 0xc0" should now always be 0.
>
> Maybe both lines should be moved within the "if"?
>
> CJ

Hi,

Oh, really sorry for this, I just missed this line.
you are right, I will send v2 soon.
Thanks for your reminder!

Su Hui

>
>
>
>
>
>> adev->vcn.num_vcn_inst++;
>>                       adev->vcn.inst_mask |=
>>                           (1U << ip->instance_number);
>
