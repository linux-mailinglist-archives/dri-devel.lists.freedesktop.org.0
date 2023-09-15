Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 935187A2060
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 16:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A4A10E634;
	Fri, 15 Sep 2023 14:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id B17F510E634;
 Fri, 15 Sep 2023 14:02:53 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Bx5fAKZARlQX4oAA--.12706S3;
 Fri, 15 Sep 2023 22:02:50 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxvdz9YwRl_WEHAA--.14359S3; 
 Fri, 15 Sep 2023 22:02:48 +0800 (CST)
Message-ID: <743e062e-17e8-dec0-30ba-c7682ea3109e@loongson.cn>
Date: Fri, 15 Sep 2023 22:02:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFT PATCH 2/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown time for misc drivers
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20230901234015.566018-1-dianders@chromium.org>
 <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
 <e7d855b6-327e-8c0c-5913-75bba9b6cfcd@loongson.cn>
 <CAD=FV=XF65otS2S+6sg6qga6Le3xb1f5GC6R6qpf27zx49DQ6w@mail.gmail.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <CAD=FV=XF65otS2S+6sg6qga6Le3xb1f5GC6R6qpf27zx49DQ6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxvdz9YwRl_WEHAA--.14359S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr4rGFWDKr43JrWxXr4DKFX_yoW5Kw4xpr
 W5Zas0krs8JrsrArn2qr17Wa4Syw4Sy34fXrsrKr1Uurs0gFW2qF4Fqr15Cas8W397Kr42
 yw42qwn8uFy5AacCm3ZEXasCq-sJn29KB7ZKAUJUUUUA529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
 6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUShiSDU
 UUU
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
Cc: alexandre.belloni@bootlin.com, xinliang.liu@linaro.org,
 tomi.valkeinen@ideasonboard.com, liviu.dudau@arm.com,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, wens@csie.org, jstultz@google.com,
 kraxel@redhat.com, sumit.semwal@linaro.org, yongqin.liu@linaro.org,
 samuel@sholland.org, sam@ravnborg.org, javierm@redhat.com,
 jernej.skrabec@gmail.com, drawat.floss@gmail.com,
 kong.kongxinwei@hisilicon.com, alain.volmat@foss.st.com,
 linux-sunxi@lists.linux.dev, tzimmermann@suse.de, alison.wang@nxp.com,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 paul.kocialkowski@bootlin.com, spice-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, tiantao6@hisilicon.com,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/9/15 21:44, Doug Anderson wrote:
> Hi,
>
> On Fri, Sep 15, 2023 at 2:11 AM suijingfeng <suijingfeng@loongson.cn> wrote:
>> Hi,
>>
>>
>> On 2023/9/2 07:39, Douglas Anderson wrote:
>>> Based on grepping through the source code these drivers appear to be
>>> missing a call to drm_atomic_helper_shutdown() at system shutdown
>>> time. Among other things, this means that if a panel is in use that it
>>> won't be cleanly powered off at system shutdown time.
>>>
>>> The fact that we should call drm_atomic_helper_shutdown() in the case
>>> of OS shutdown/restart comes straight out of the kernel doc "driver
>>> instance overview" in drm_drv.c.
>>>
>>> All of the drivers in this patch were fairly straightforward to fix
>>> since they already had a call to drm_atomic_helper_shutdown() at
>>> remove/unbind time but were just lacking one at system shutdown. The
>>> only hitch is that some of these drivers use the component model to
>>> register/unregister their DRM devices. The shutdown callback is part
>>> of the original device. The typical solution here, based on how other
>>> DRM drivers do this, is to keep track of whether the device is bound
>>> based on drvdata. In most cases the drvdata is the drm_device, so we
>>> can just make sure it is NULL when the device is not bound. In some
>>> drivers, this required minor code changes. To make things simpler,
>>> drm_atomic_helper_shutdown() has been modified to consider a NULL
>>> drm_device as a noop in the patch ("drm/atomic-helper:
>>> drm_atomic_helper_shutdown(NULL) should be a noop").
>>>
>>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>
>> I have just tested the whole series, thanks for the patch. For drm/loongson only:
>>
>>
>> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Thanks!
>
>
>> By the way, I add 'pr_info("lsdc_pci_shutdown\n");' into the lsdc_pci_shutdown() function,
>> And seeing that lsdc_pci_shutdown() will be called when reboot and shutdown the machine.
>> I did not witness something weird happen at present. As you have said, this is useful for
>> drm panels drivers. But for the rest(drm/hibmc, drm/ast, drm/mgag200 and drm/loongson etc)
>> drivers, you didn't mention what's the benefit for those drivers.
> I didn't mention it because I have no idea! I presume that for
> non-drm_panel use cases it's not a huge deal, otherwise it wouldn't
> have been missing from so many drivers. Thus, my "one sentence" reason
> for the non-drm_panel case is just "we should do this because the
> documentation of the API says we should", which is already in the
> commit message. ;-)
>

OK, this sound fine.

> If you have a specific other benefit you'd like me to list then I'm happy to.

You should think about the answer of this question yourself.
But I will not object if you can't find one. OK. :-)

>
>> Probably, you can
>> mention it with at least one sentence at the next version. I also prefer to alter the
>> lsdc_pci_shutdown() function as the following pattern:
>>
>>
>> static void lsdc_pci_shutdown(struct pci_dev *pdev)
>> {
>>
>>       struct drm_device *ddev = pci_get_drvdata(pdev);
>>
>>       drm_atomic_helper_shutdown(ddev);
>> }
> I was hoping to land this patch without spinning it unless there's a
> good reason. How strongly do you feel about needing to change the
> above?


Not very strong, this version looks just fine.
I will not object if you keep it as is.
But I will also hear what the others reviewers say.
Thanks for the patch.

>
> -Doug

