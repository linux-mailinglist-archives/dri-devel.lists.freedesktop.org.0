Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E00739680
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 06:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E353710E3DE;
	Thu, 22 Jun 2023 04:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id F2BEB10E07E;
 Thu, 22 Jun 2023 04:46:50 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxHMc30pNkblYAAA--.569S3;
 Thu, 22 Jun 2023 12:46:47 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxrM420pNkV5wBAA--.8972S3; 
 Thu, 22 Jun 2023 12:46:46 +0800 (CST)
Message-ID: <c4d33797-2183-26d4-02d7-3662df6e97f6@loongson.cn>
Date: Thu, 22 Jun 2023 12:46:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 0/8] PCI/VGA: introduce is_boot_device function
 callback to vga_client_register
To: Lyude Paul <lyude@redhat.com>, Sui Jingfeng <15330273260@189.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Li Yi <liyi@loongson.cn>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
References: <20230612192550.197053-1-15330273260@189.cn>
 <0afadc69f99a36bc9d03ecf54ff25859dbc10e28.camel@redhat.com>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <0afadc69f99a36bc9d03ecf54ff25859dbc10e28.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxrM420pNkV5wBAA--.8972S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJF4DZFW5CFyfCw47JryrAFc_yoW5Jw48pF
 WYkFyFkFZ5Jr4ak342v3WxZFy5Aan7JayfKr1DC34a9w15CryxGFWqyFWrK34DXrWxAa1S
 qFy3KryxKF1vv3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
 6r1DMcIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_
 Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07URq2
 _UUUUU=
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
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 2023/6/22 06:11, Lyude Paul wrote:
> For the nouveau bits:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
Thanks a lot
> On Tue, 2023-06-13 at 03:25 +0800, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> The vga_is_firmware_default() function is arch-dependent, it's probably
>> wrong if we simply remove the arch guard. As the VRAM BAR which contains
>> firmware framebuffer may move, while the lfb_base and lfb_size members of
>> the screen_info does not change accordingly. In short, it should take the
>> re-allocation of the PCI BAR into consideration.
>>
>> With the observation that device drivers or video aperture helpers may
>> have better knowledge about which PCI bar contains the firmware fb,
>> which could avoid the need to iterate all of the PCI BARs. But as a PCI
>> function at pci/vgaarb.c, vga_is_firmware_default() is not suitable to
>> make such an optimization since it is loaded too early.
>>
>> There are PCI display controllers that don't have a dedicated VRAM bar,
>> this function will lose its effectiveness in such a case. Luckily, the
>> device driver can provide an accurate workaround.
>>
>> Therefore, this patch introduces a callback that allows the device driver
>> to tell the VGAARB if the device is the default boot device. Also honor
>> the comment: "Clients have two callback mechanisms they can use"
>>
>> Sui Jingfeng (8):
>>    PCI/VGA: Use unsigned type for the io_state variable
>>    PCI/VGA: Deal only with VGA class devices
>>    PCI/VGA: Tidy up the code and comment format
>>    PCI/VGA: Replace full MIT license text with SPDX identifier
>>    video/aperture: Add a helper to detect if an aperture contains
>>      firmware FB
>>    PCI/VGA: Introduce is_boot_device function callback to
>>      vga_client_register
>>    drm/amdgpu: Implement the is_boot_device callback function
>>    drm/radeon: Implement the is_boot_device callback function
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  12 +-
>>   drivers/gpu/drm/drm_aperture.c             |  16 +++
>>   drivers/gpu/drm/i915/display/intel_vga.c   |   3 +-
>>   drivers/gpu/drm/nouveau/nouveau_vga.c      |   2 +-
>>   drivers/gpu/drm/radeon/radeon_device.c     |  12 +-
>>   drivers/pci/vgaarb.c                       | 153 +++++++++++++--------
>>   drivers/vfio/pci/vfio_pci_core.c           |   2 +-
>>   drivers/video/aperture.c                   |  29 ++++
>>   include/drm/drm_aperture.h                 |   2 +
>>   include/linux/aperture.h                   |   7 +
>>   include/linux/vgaarb.h                     |  35 ++---
>>   11 files changed, 184 insertions(+), 89 deletions(-)
>>
-- 
Jingfeng

