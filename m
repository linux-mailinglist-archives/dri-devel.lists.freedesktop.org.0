Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C3473D7F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 08:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53CA10EABE;
	Tue, 14 Dec 2021 07:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDAD10EA61;
 Tue, 14 Dec 2021 07:17:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u17so30808149wrt.3;
 Mon, 13 Dec 2021 23:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=SxGgEKWaacutyDseHK2Zk06l+7ntRzxPrOLFtMNQTm8=;
 b=KBR1OIlzFK4+1Wu6SUrNHQ3ZMbN+5Z0ppz7qGHRBtuPKpjNxCvhHaTxMUn92N8kvzb
 9QwpvdOpfAT/XUfzCzhKD05XF4WabfUa4LHf4A7ryKT08xgJEN6Vo1JijUZX93hadBVO
 2L+aGSQH0QeHxqopcaDCE1xohURFxyHB058acNKCHUBRNiqjQ+EfqIx9MqzroZ6FgU2w
 q9kE1a/sUPc3xVfe7gQnxvL6Z6Z3dVxS2OC25l4RUg3Gv/1pKnPvrB7HpO80IboXPZa2
 pHubsLeFTfvPeVgUms9688USf9nuhjHcBziwDbX2J/DrfZf+Gpr0QO+CMsmtv1axupts
 i3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SxGgEKWaacutyDseHK2Zk06l+7ntRzxPrOLFtMNQTm8=;
 b=13MEANBUvur6ctLe2no1s245o5/AhmJVoA6gS2M4I9UgVkeUATRjnLeMmpfM+4FLHt
 uYrvGlDnepU1xn8ZBNcJnHndQPXY/UctB47ICcef3ZS5yUUZwYUQWSPy/5xytlOLRrRV
 BZ7cxFOnb8YXHGe12HxIE2BheFNLUQnnz7LCh5/oQsl/YeRwbRxeDoBgBH3KFbn9yv7k
 +ZvTw+l/fy3lqzGbRB/NVeNdBFHpiK1EmEDJRY9DzG7SiRwOKnnxtlY1kk1VF2A36Uyo
 DILyf2b2Cb2nnIHUdbatHhz9jza7CV44BlcZb1+Nh3a6NJOTPvoLm+oEuQlk6a39rxFx
 93Cw==
X-Gm-Message-State: AOAM531qy1MgtEvpGH655gsGXK7c6TbYqEOLHDTC6EZl6JwzKmmnNW9P
 KyCc+q+02rW8i9jPBLM8a8s=
X-Google-Smtp-Source: ABdhPJzDaCs/0EzH2TALZ4HzjMdRGA1/bZx5rqmeN3RjBR+7SJT7aifOXYOwfS9YJK+dUPSO+zwcRQ==
X-Received: by 2002:a05:6000:188d:: with SMTP id
 a13mr1793582wri.461.1639466258012; 
 Mon, 13 Dec 2021 23:17:38 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id j40sm1258926wms.19.2021.12.13.23.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 23:17:37 -0800 (PST)
Subject: Re: [Patch v2] drm/amdgpu: Don't inherit GEM object VMAs in child
 process
To: Felix Kuehling <felix.kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211210214802.12620-1-rajneesh.bhardwaj@amd.com>
 <a1a865f5-ad2c-29c8-cbe4-2635d53eceb6@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <66740f3b-00c6-5b0c-92fa-a04f97f5d120@gmail.com>
Date: Tue, 14 Dec 2021 08:17:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a1a865f5-ad2c-29c8-cbe4-2635d53eceb6@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: alexander.deucher@amd.com, airlied@redhat.com,
 David Yat Sin <david.yatsin@amd.com>, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.12.21 um 01:55 schrieb Felix Kuehling:
> On 2021-12-10 4:48 p.m., Rajneesh Bhardwaj wrote:
>> When an application having open file access to a node forks, its shared
>> mappings also get reflected in the address space of child process even
>> though it cannot access them with the object permissions applied. 
>> With the
>> existing permission checks on the gem objects, it might be reasonable to
>> also create the VMAs with VM_DONTCOPY flag so a user space application
>> doesn't need to explicitly call the madvise(addr, len, MADV_DONTFORK)
>> system call to prevent the pages in the mapped range to appear in the
>> address space of the child process. It also prevents the memory leaks
>> due to additional reference counts on the mapped BOs in the child
>> process that prevented freeing the memory in the parent for which we had
>> worked around earlier in the user space inside the thunk library.
>>
>> Additionally, we faced this issue when using CRIU to checkpoint restore
>> an application that had such inherited mappings in the child which
>> confuse CRIU when it mmaps on restore. Having this flag set for the
>> render node VMAs helps. VMAs mapped via KFD already take care of this so
>> this is needed only for the render nodes.
>>
>> To limit the impact of the change to user space consumers such as OpenGL
>> etc, limit it to KFD BOs only.
>>
>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>
>> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>

At some point we probably want to extend that to all AMDGPU BOs, but for 
now the patch is Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks,
Christian.

>
>
>> ---
>>
>> Changes in v2:
>>   * Addressed Christian's concerns for user space impact
>>   * Further reduced the scope to KFD BOs only
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index a224b5295edd..64a7931eda8c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -263,6 +263,9 @@ static int amdgpu_gem_object_mmap(struct 
>> drm_gem_object *obj, struct vm_area_str
>>           !(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC)))
>>           vma->vm_flags &= ~VM_MAYWRITE;
>>   +    if (bo->kfd_bo)
>> +        vma->vm_flags |= VM_DONTCOPY;
>> +
>>       return drm_gem_ttm_mmap(obj, vma);
>>   }

