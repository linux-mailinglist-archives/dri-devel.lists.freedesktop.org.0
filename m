Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CB5A271D2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 13:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385BE10E5FD;
	Tue,  4 Feb 2025 12:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="e/SLgLPo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423BB10E5FD;
 Tue,  4 Feb 2025 12:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1738672328; x=1739277128; i=friedrich.vock@gmx.de;
 bh=scxUiK1pLq2XxF7S36bqQRmonlgR7MyYhHKB4Vu4+IQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=e/SLgLPoyvjEDlqBD+CcYsHoVcohqXujS/A6FAXby3ynzLgoGFvFo9Of0dhy6AvV
 l1wLbuqwD5el8Gax6CzWgXD+re/NHy5TiVFvEqq+XJDWYhoQ0NlbKL0Rx4FEEWlDo
 t74H53v6qynvr7hNs3tht+Q3NKYOI0fw2hII840Vwcxg4odnOeTkrIvZE3xmHNPhr
 tJvAD2uDh22K1E+NUzzsgmmEJavE9O0RMijWfWms0SqvjLaGiUvvQ2cpzEzxVqLhq
 OVnG1prMCQldT/Hb1rsP64U/Y4aHNr7uD+aQsSHcbRrGKP3+3LTf6Xq5uSkeKvTAI
 hXw2L2YQ3Mhs4b2PTg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNNy-1ts3w21pmE-00Wo0Y; Tue, 04
 Feb 2025 13:32:08 +0100
Message-ID: <e6330f10-a736-4ccd-8a0e-95e1899648d6@gmx.de>
Date: Tue, 4 Feb 2025 13:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] drm/amdgpu: Explicit sync for GEM VA operations
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
References: <20240819072110.108715-1-friedrich.vock@gmx.de>
 <8488e172-4d50-4cd6-8d2b-fd86d6126425@amd.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <8488e172-4d50-4cd6-8d2b-fd86d6126425@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QHb7TezfKUdQXNWC1MEzLjlC28jV33INO673W5EY0RM8X0dHsCB
 lx3zloCn/fwp1K7/tKDPSECoXprm2m38Q5Zkc9Bype/OY6llGPRT0Ws0zts0z49ka9yenQn
 LtdkzMsZ372Ec+ZR1sKrueYjlubKIeeXmJpdLIRvuywT7KeBJwgxg5U7edPlcOu6pYPVAva
 M9XhmfxWPPPEmeFJTPDxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kpqZ/4QUTkQ=;jKSoKAC3ycIT6YNn/IlVeUsFxFr
 qUyKCprzRrSLp41WQSWaJMG3qtXJ7tZINY0qvkYLUG1vaufaJlPRr/Y35YbsTKI22cirkQ7A/
 jem8PPqbYT6qkByluKj+tl5FI6GUX3LcnVSppVH2str+svo3idGpm93lUWkVI69qiJ75cayjZ
 AM45e9d2+z5j4L3jp1UQLGt9+GP+IVYBZZIaeF3Jkrm/A0rbJleuRC3YLqHF7Tv8fQdP/3DRK
 xhRBMc6AHqzvip7e6IqvzSFYgGzmEG/nJ0zrMkvHhEda8pCTJu8FUsJsxVYX06FNg9c49k4hD
 rCkmFIYLbIJzYUHz96P42TnY8INbftecis+ugfRZBA7fQSlQLu5d/OtamgOGzCRmJ2BRGJmMo
 TpAoVEJhu1Fmek38ErBVnbSENcNBc/saDINWQVR8Yel2NUBmzXAP9k16/Rt4X33D+yG+aqYMI
 GqH1q7/xGrT/EFUQU8sLZKvfMIAGMZFviogsrmr1Qrpf+ypR5fQI9R02M/xUxwv5bdVHhVeLb
 iLVwABsgLeTQifjf1v4TseLELtX4Dy2E+z43kSspoaa6rOKGSuUVdiviJ7Cy2QffsHE6W5X53
 XrIuANv3YpG8IGBmS/eEWjElBNVMBs/BfwQrWGO39IJn/rWZcpyHiEWIMl1UDD1Y/YBXPiZ3o
 gRJvGmb3erLHu+gFjT6yeb5XlaBjd1Kib1gKzxhbrcYT4JZJHIViYN7y0DfjNYxaZs8oXXRWl
 ZbHJ0hJinBp+2/SKOzK5Te3HXgvvfUk6ds30vYjR+r88uWGq7BLBEFFSEPZMekmllNdF+bnXL
 XjWUQIGTN04e9/FGwdlRQKnaEC7pweHwqqRY0NS0WziPsQ0LhOCLUsjsGSACHR0Rya07JOHOK
 ArJvn3C4pImILAtZI9JVWcm1O/bRfcpdNgoA0pLGcS5c23/lOII4bz9EacVdEU9e6TsfpXHB3
 XWcGIINeD29U2urGD9MI2bAlAQz4dsUC5QWy9EKu1cwnaByK0fE98x+pAHbdsYZZrZgbdvG+p
 X+fTHtdVwWUr2WNs0cFhgALoKoVPV0U3iiBZ1pnTVlI5CixPmRIvAuhCYKMEZGGgbdlXb48xG
 zRlXCHbV6Rz9oupAD+meBvifwwypzHaAlTK7fxshCfSO8ninAk63WPz5GMrg9nUWHu6MuG4z4
 t+c0079VtjVl5gYVEj5rhFH1xr8t24Aiterzng1SEtcuhkFZBbEDi31zFlFxfrJnEtPqdFoWy
 gFgRY3eM8ifPrbH2X7G+zDBh8R115P2NcieeDOuVqT1GAErD1u2W6KGExgmsSgU8A4VHXqn69
 XOVhhOVYLgjdYAU0TFRwPy5TogFq5KsUJJ4lnU+FLNWC3Q=
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

Hi,

On 19.08.24 13:21, Christian K=C3=B6nig wrote:
> Am 19.08.24 um 09:21 schrieb Friedrich Vock:
>> In Vulkan, it is the application's responsibility to perform adequate
>> synchronization before a sparse unmap, replace or BO destroy operation.
>> This adds an option to AMDGPU_VA_OPs to disable redundant implicit sync
>> that happens on sparse unmap or replace operations.
>>
>> This has seen a significant improvement in stutter in Forza Horizon 5
>> and Forza Horizon 4. (As games that had significant issues in sparse
>> binding related stutter).
>
> Looks pretty good, I have Shashank and his team working on the similar
> patches ever since Bas initially came up with it since we need it for
> user queues as well.
>
> Shashank can you take a look at the UAPI? Of hand looks pretty similar
> to what we have done as well, doesn't it?
>
> For the internal implementation in the VM I'm currently working on a bug
> fix for the KFD team, so this is subject to change anyway. Going to keep
> this requirement here in mind while doing that, whatever implementation
> we end up with we probably need to re-base it anyway.

Bumping this again - it's been quite a while, what became of that KFD
bugfix and the userqueue stuff? It'd be nice to finally make progress
here, whether it's using the user queue interface you worked on or a
re-spin of this. Maybe it's possible to split this off from the rest of
the userqueue stuff and merge it beforehand if you're reasonably certain
about how the uapi should look? Let me know.

Thanks,
Friedrich

>
> Regards,
> Christian.
>
>>
>> Userspace changes for this new version can be found at [1][2], and a
>> kernel
>> branch containing these patches can be found at [3].
>>
>> [1] https://gitlab.freedesktop.org/pixelcluster/drm/-/commits/vm-
>> explicit-sync
>> [2] https://gitlab.freedesktop.org/pixelcluster/mesa/-/commits/vm-
>> explicit-sync
>> [3] https://gitlab.freedesktop.org/pixelcluster/linux/-/commits/
>> amdgpu-vm-explicit-sync
>>
>> v3 changes:
>> - Rebased onto current amd-staging-drm-next
>> - Added option to wait for drm_syncobjs instead of executing immediatel=
y
>>
>> Tatsuyuki Ishi (3):
>> =C2=A0=C2=A0 drm/amdgpu: Don't implicit sync PRT maps.
>> =C2=A0=C2=A0 drm/amdgpu: Add optional explicit sync fences for GEM oper=
ations.
>> =C2=A0=C2=A0 drm/amdgpu: Bump amdgpu driver version.
>>
>> =C2=A0 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c=C2=A0 |=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 3 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 76 ++++++++++++++++---
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h=C2=A0=C2=A0=C2=A0 | 2=
3 +++++-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 6 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c=C2=A0 |=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 68 +++++++++++------
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 30 ++++----
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c=C2=A0=C2=A0=C2=A0 | 1=
2 ++-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c=C2=A0=C2=A0 |=C2=A0 =
9 +++
>> =C2=A0 drivers/gpu/drm/amd/amdkfd/kfd_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 ++---
>> =C2=A0 include/uapi/drm/amdgpu_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 =
++
>> =C2=A0 14 files changed, 194 insertions(+), 66 deletions(-)
>>
>> --
>> 2.46.0
>>

