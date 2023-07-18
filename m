Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CD775839C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 19:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7166710E3AF;
	Tue, 18 Jul 2023 17:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1FF6510E3AF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 17:37:12 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxCPLHzbZk2OAGAA--.17724S3;
 Wed, 19 Jul 2023 01:37:11 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxX8+5zbZkMY0zAA--.10465S3; 
 Wed, 19 Jul 2023 01:37:10 +0800 (CST)
Message-ID: <19d4b8a1-bbfe-c887-2edf-7fa57f4370a1@loongson.cn>
Date: Wed, 19 Jul 2023 01:36:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, conduct@kernel.org
References: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
 <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
 <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
 <90d22f14-c912-42f0-bf33-eb4297fe9fa8@kadam.mountain>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <90d22f14-c912-42f0-bf33-eb4297fe9fa8@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxX8+5zbZkMY0zAA--.10465S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uF1fGr4fGw13Gw45Kw48uFX_yoW8XrWfpF
 s3Gay5tFZ8Jw40vr1DtrW2yFWSqw4DAFWjgF1xKw1ruF4qqryvqF4Sgw4ruFy7urs3uw1j
 qrWrua4Iv3WvyagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
 wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
 CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
 WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcVc_
 UUUUU
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


I still remember you are helps to review the drm/lsdc patch one years 
ago, see [1].

  drm/lsdc is the former version of drm/loongson,  originally drm/lsdc 
are embedded SoCs of Loongson.

[1] https://patchwork.freedesktop.org/patch/471997/?series=99512&rev=5

I haven't forget about you.


On 2023/7/18 21:59, Dan Carpenter wrote:
>>> Even if the fail happened, your patch is not fixing the root problem.
> What is the correct fix then?


lsdc_bo_create_kernel_pinned() is intend to be used when you do the self 
test (cat benchmark)

which is using to testing the hardware bandwidth via debugfs.

Another potential usage is to implement built in fbdev emulation.


I admit the error handling is necessary, but it's a kind of costuming.

To be honest, I have also post similar patches to other DRM drivers.:-)

So, that is okay.


But let's back to the technique, when the kzalloc() fails, who will 
survives?

If the the kzalloc() fail, then I think the implement of kzalloc() 
should be blamed first.

while developing this driver nearly about two years, it rare happens.


For my drivers, kzalloc() fails is one sort of error,

lsdc_bo_create() could fail when no enough VRAM is another.

The  dumb_buffer test if IGT would helps to probe such failures.

But this is a kind of limitation of the hardware itself.

Its a resource limitation, even the drm/radeon could probably fail.

So, How does your patch could resolve the root problems that caused by 
no enough resource available?

