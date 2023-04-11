Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B5C6DD7C7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 12:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B31E10E26D;
	Tue, 11 Apr 2023 10:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E21B10E175
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 10:21:42 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:55572.1747296415
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id F1B78100208;
 Tue, 11 Apr 2023 18:21:37 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 8ce6a0aaf01b4ef78285af8e79f77ddf for emil.l.velikov@gmail.com; 
 Tue, 11 Apr 2023 18:21:39 CST
X-Transaction-ID: 8ce6a0aaf01b4ef78285af8e79f77ddf
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <860cb3b3-5247-c6ad-c13a-619cde221208@189.cn>
Date: Tue, 11 Apr 2023 18:21:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 2/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20230403171304.2157326-1-suijingfeng@loongson.cn>
 <20230403171304.2157326-3-suijingfeng@loongson.cn>
 <CACvgo53h+X26wngVmxpn3oVb9kbJezTHx61p3rZDR7sw1AQrWQ@mail.gmail.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <CACvgo53h+X26wngVmxpn3oVb9kbJezTHx61p3rZDR7sw1AQrWQ@mail.gmail.com>
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
Cc: nathan@kernel.org, loongson-kernel@lists.loongnix.cn,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/4/4 22:10, Emil Velikov wrote:
>> +static enum drm_mode_status
>> +lsdc_mode_config_mode_valid(struct drm_device *ddev,
>> +                           const struct drm_display_mode *mode)
>> +{
>> +       struct lsdc_device *ldev = to_lsdc(ddev);
>> +       const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB8888);
> Short-term hard coding a format is fine, but there should be a comment
> describing why.
Because our driver only support DRM_FORMAT_XRGB8888 frame buffer currently.

After carry out the IGT test, I found this function may not sufficient  
anymore.

>> +       u64 min_pitch = drm_format_info_min_pitch(info, 0, mode->hdisplay);
>> +       u64 fb_size = min_pitch * mode->vdisplay;
>> +
>> +       if (fb_size * 3 > ldev->vram_size) {
> Why are we using 3 here? Please add an inline comment.
>
Originally lsdc_mode_config_mode_valid() is copy from drm_gem_vram_helper.c

with the observation that there no need for the compute of the number of 
pages in

the terms of PAGE_SIZE.


The '3' here is  a experience number, it intend to restrict single 
allocation overlarge.

In my opinion, it stand for one frame buffer plus another two dumb 
buffer allocation

when running  the running pageflip test(from the libdrm modetest).


Therefore, the kernel space drm driver should guarantee at least 3 times 
frame buffer

allocation to the user-space. Otherwise, the pageflip test can not even 
being able to run.


While when testing this driver with IGT, I found the  dumb_buffer test 
of IGT will try to

create a very large dumb buffer,  as large as 256MB in my case.

Currently our driver could not satisfy such a large allocation,

I test it with drm/radeon driver on LoongArch and X86-64, redeon can not 
even passing it.


The restriction put in here is not effective anymore, because it is too 
late.

I'm think we should put the restriction in the lsdc_dumb_create() function.

We will revise our driver at next version.


Great thanks for your valuable reviews.

