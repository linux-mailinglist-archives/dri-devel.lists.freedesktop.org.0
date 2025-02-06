Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E8A2AEF2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 18:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365DF10E241;
	Thu,  6 Feb 2025 17:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="pT89hIzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBAF10E241;
 Thu,  6 Feb 2025 17:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1738863209; x=1739468009; i=friedrich.vock@gmx.de;
 bh=u/bNsz5R2cgYyN9wZmFg7tcwGxv8yzbarSuRUl+YgsQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pT89hIzBY+if2O1nAg7D1ur3Q24GT157B27oh6bpWe9I/r56711xzKBD+HWxAZn/
 KogEsuwpoHIWY837Y8p7kUCTrHBpYnG3vFUkrQf9xsYxhH4OFbDx7Ou1sWPI5k/Cs
 ArmAYOfKyIwTCDiz1iWk/lKEoTk2/NVhlknQRmTFzfrNT0OPDNHhbtk0eLBamOMWZ
 0DeJZZkmXIsCUTcwaZd++hHV36i9PaOSSpoc5+BsRns2CATkE6xzSeyrA3jCYBcQX
 mrb5jqjo5iINvut1fhEW26t9xyacGzfk0ir1uPUCncUPjHog/SV7W8KCRmFaHPNke
 Z70hVxROyf+h2Qgupw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjjCF-1t0xIh3pKV-00dIk5; Thu, 06
 Feb 2025 18:33:28 +0100
Message-ID: <49914965-e9ca-44ae-8bdf-6ea61a6b0b28@gmx.de>
Date: Thu, 6 Feb 2025 18:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] drm/amdgpu: Explicit sync for GEM VA operations
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
References: <20240819072110.108715-1-friedrich.vock@gmx.de>
 <8488e172-4d50-4cd6-8d2b-fd86d6126425@amd.com>
 <e6330f10-a736-4ccd-8a0e-95e1899648d6@gmx.de>
 <2217a9b5-894a-4f1c-95f8-dbd6f18fc8b4@amd.com>
 <CADnq5_NC1ZxjCS8-cHsLTB_2DAeiMr_+LeRXwMtUQQ7MrrX_bg@mail.gmail.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <CADnq5_NC1ZxjCS8-cHsLTB_2DAeiMr_+LeRXwMtUQQ7MrrX_bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mNOENt/Ql69pzyh+0BAYyU0vqH9c0rpe1bA/9Pl2BjVVohLvKaD
 L53mG7DcyJqlsZrbTrP97dU1zgexK8udYmnllu837FtgHhHHzaKq/8qM8zw8hNce1mr2iok
 Dv1u7/0XrDIcIkpHU5hMe1KmrL1Y6TtGYz2Rfha862UiRyw7JLj4fm0+1NvcSt1pQRQEiUk
 nHNqK2cgUI1wP7bNgpdkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JJINb/Qi1yY=;g/s7SfIeFoKapS6S/PhhMm7F5SF
 +mEn8s4DfdCB+poJcq3ToT5c7POP5YZUlkC9lNPMcCmQb4R3f5O6ImRcV28HaNp1FIntWUBR+
 dyOyYd3ZtZS4vfTEBhWInDczv0XHpsHpWToodtWoefuU/LQq7dZNn+PUXqWEciqP1dRuzEGQ3
 NvQXrBNLHziSZx25UfYJszI915JjZASd1eQ0xj+zDMjSvDHfWEWt0liaxucfGN+yqja8mvurf
 cRalPA5PC5YRiDPn+BPBmHmszw4+krNP3d8ZEk0jk69kYZuP99uTrtC4d4ow+34ZV2sh/JJPk
 xEyD7wi3GYYIXA7ABDBmOMsaaLkU3KdwfZgGYi7WV5U/nzpp9crJJ3ubiLu8DrpoXx3npCszG
 m7+fgJG6Fk9V3ZUEYdUsOTYRCYL983vox/v1PmkVifZSInDQfs4lrwiuraRiJG15MYEEAFTjd
 xs7IdlyaFFn1OgfArMnNsVy/lRC2qXa/3fCx+w41dCgiOfEheXfJda8JR/LVziuQ10cJCvibV
 DRk9/aV/e5VAAKaoVmrAVu39T8akGe7FlLvHihJJ+wvRwpox/qSyJdK3EyNeAN7vL/mZUUi+d
 vz4v6cnEIXt/JgzWZO+bKGdJBRnib+l4Klq2/kjDCYEXthAlbwLTYCgtLhbPgLKxpIzwucEQv
 KLLZqL+ElmwjH0yl/dhWX6LFVFXbcGclFDocUgDN8TZ+YpNnVBmhYRhh6SwXzepcIpuv2LGa9
 jzMK8F0A5uSwn+HC4RPg2itoByyfbgM6Za0HPSkiBBn/Gvs+XU/bkW1+frqgSWj0VqkslH7qP
 S3VIRsKA0AL3gxVMCv1oLPnCMqKsF3sTWfhcNeaTpNe1IDjoqhN9F+4c2Nvd+UFM70J6pw+f6
 JP11HdhXUE2hbm8YHb8ZPkY+3MGHI+vgzqj71eU0sX+Juyc11MvI/q0xFjLrSK9wIV5+2S1CN
 awfDHjvWJyikH0K7dN1abx6nVmJw44Cf91DtaXh/0vAb5j7pLXsqdj945N7xE5D+M2JA5mcfV
 YB2CspgHw/698Hpl0G5/9wjPioZfxuaJ5iU1j9rPzFONBtnbE80b6+iUScnvUB9eIrrMe7Q2O
 B2UBWnmhFw+1OAEptzXb2umqXrSTfvvqX6DbJKit7XF4n8y1M33EN0A0MUON8GMAJHR49P1ue
 bAHd0569N6vyTkx+WQfyu0jzjjtuX+79aH6V6IAIzH0r+55ranFie8DYy+qKw65bsjTh7wpPP
 0PXAEf7JjKvfq3m9JyqZmCtJvl3UAfn/hmle1zwv7f+OhHLLAKippWpziYqJvjKa/DplaPw7C
 WnV8DZ+bxyisstzmLx57aNIrhxEvgFbIXpJKdspAnOslGjAUqRmGlIBOBU6CSV2lmqhEkT5hC
 GIKZCuSLoAyiP6vZRCdFF6OekQBjHBrC85eaghuftO7sIFdYnlSicsFo/a
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

On 04.02.25 14:58, Alex Deucher wrote:
> On Tue, Feb 4, 2025 at 8:37=E2=80=AFAM Christian K=C3=B6nig <christian.k=
oenig@amd.com> wrote:
>>
>> Hi Friedrich,
>>
>> adding Alex.
>>
>> Am 04.02.25 um 13:32 schrieb Friedrich Vock:
>>> Hi,
>>>

<snip>

>>>
>>> Bumping this again - it's been quite a while, what became of that KFD
>>> bugfix and the userqueue stuff? It'd be nice to finally make progress
>>> here, whether it's using the user queue interface you worked on or a
>>> re-spin of this. Maybe it's possible to split this off from the rest o=
f
>>> the userqueue stuff and merge it beforehand if you're reasonably certa=
in
>>> about how the uapi should look? Let me know.
>>
>> That is merged into amd-staging-drm-next for quite a while now, but we
>> only defined the interface and dropped all optimizations to initially
>> get it upstream.
>>
>> @Alex IIRC we pushed the KFD part upstream already, but the userqueue
>> part is still waiting for the final firmware release, right?
>
> Correct.

Right. Any rough timeline for when we can expect that firmware to release?

Thanks,
Friedrich

>
> Alex
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>> Friedrich
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Userspace changes for this new version can be found at [1][2], and a
>>>>> kernel
>>>>> branch containing these patches can be found at [3].
>>>>>
>>>>> [1] https://gitlab.freedesktop.org/pixelcluster/drm/-/commits/vm-
>>>>> explicit-sync
>>>>> [2] https://gitlab.freedesktop.org/pixelcluster/mesa/-/commits/vm-
>>>>> explicit-sync
>>>>> [3] https://gitlab.freedesktop.org/pixelcluster/linux/-/commits/
>>>>> amdgpu-vm-explicit-sync
>>>>>
>>>>> v3 changes:
>>>>> - Rebased onto current amd-staging-drm-next
>>>>> - Added option to wait for drm_syncobjs instead of executing
>>>>> immediately
>>>>>
>>>>> Tatsuyuki Ishi (3):
>>>>>     drm/amdgpu: Don't implicit sync PRT maps.
>>>>>     drm/amdgpu: Add optional explicit sync fences for GEM operations=
.
>>>>>     drm/amdgpu: Bump amdgpu driver version.
>>>>>
>>>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 76
>>>>> ++++++++++++++++---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    | 23 +++++-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  2 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 68 +++++++++++---=
---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 30 ++++----
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 12 ++-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |  2 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  9 +++
>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 ++---
>>>>>    include/uapi/drm/amdgpu_drm.h                 |  7 ++
>>>>>    14 files changed, 194 insertions(+), 66 deletions(-)
>>>>>
>>>>> --
>>>>> 2.46.0
>>>>>
>>>
>>

