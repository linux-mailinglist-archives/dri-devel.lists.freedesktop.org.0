Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01890CA81
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6881410E657;
	Tue, 18 Jun 2024 11:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fjha0NDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B24D10E657
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:54:22 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-421b9068274so47977115e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718711661; x=1719316461; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QT0LJCKK8ZmuRtEf/e5DyLzGmwVU96dxmjGMHMBhQGY=;
 b=fjha0NDpx5kIQmPLwrrOTythwqHttlDR+GliuF7f6UKhbVNqqralZ400CTucf8Ozi/
 DnDY2k5jULGqc2yJQW85gW9EwWukfpX1c4p+IoJ8ShugU0K4pheI0A3Ax//oHBvfntSc
 839kpPRu+c/uZjol0hzhNoE4cu6q5XxCrp7lcgOJBEee1CYjyzBDhZuCudsmKoWKuqnK
 nhWBnRm8H2WvGpSHEaQsUD2pj0o37hJvY53vI3k17ZJhBwJNmhG2/l9DIMlCdNRIdkPm
 7bglzRJYv7Yk5UWLbcDkLytYGYh/LSIU5DEVYpyxVImrYMrlCXVRQK1tXLMLCyi6g0Gk
 75jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718711661; x=1719316461;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QT0LJCKK8ZmuRtEf/e5DyLzGmwVU96dxmjGMHMBhQGY=;
 b=kOGzTxF/cyvNksNMTgKV4VJIryHmB7OYbfomkfG+U7XYyrBPkxCnubIJ0XubbEFdPc
 i8z7nCNd8b6lx7FLdpHXT5muVNgU7yOmJrN/pVWMAbSBtgLcaT4k7kTpl6tWudggVw7B
 h2ZsoxCDgbh9Ws8JLjNocgMjPdMd1UPCezXJJ1rr+7MtqHLFgRCvR97TxIK9d6w4FSUx
 4/0BR+YWyCJZeE2EMdJ3OT7FsclrQ4rzlQkLHG3GXL3jSYN+xrh4RlIMHAMEEisvN9W8
 GFGuWSF4TpQNwxsAcx8PxKGhwR/wbfg0sjgCz3JpKpuEUMVQk1YzRRSy2oigOucoXzkx
 uS1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOHfk0Ht+GQsZZCP/4YVmBzaaFRKWPW0s4+7e1SaYrofDLe1M8QsW1gxWS1Zb1PovQv45anc1gPAO2yw0B0zazF6B3yg0d1DfwS05SdiaS
X-Gm-Message-State: AOJu0YynX63nmrszifWQcKDZD7kD3wGweROryZDlEgHCanUgN42XtWRR
 AatNUjoz6XvYdSUUQHBvTMfJr5ticItIC0k8fFh+LCS1S39wloym
X-Google-Smtp-Source: AGHT+IExl6Spt8ZEYzfZOVdhdG/OIMY9uR58n88wMu+PjSjgmwo1TdIZpjxjd0NKyBjFHGqsPwpang==
X-Received: by 2002:a7b:c44e:0:b0:41b:fc3a:f1ef with SMTP id
 5b1f17b1804b1-42304858447mr99461865e9.33.1718711660373; 
 Tue, 18 Jun 2024 04:54:20 -0700 (PDT)
Received: from [192.168.1.161] ([185.77.198.11])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602feb0sm183234765e9.20.2024.06.18.04.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:54:16 -0700 (PDT)
Message-ID: <715bd3c4-6793-4c43-80e1-3956e03de017@gmail.com>
Date: Tue, 18 Jun 2024 13:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vc4: remove all usages of of_node_put()
From: Amer Al Shanawany <amer.shanawany@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Julia Lawall <julia.lawall@inria.fr>, Shuah Khan <shuah@kernel.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
References: <20240427134044.38910-1-amer.shanawany@gmail.com>
 <df115f89-2979-42a5-b521-4bc4f8f4a335@gmail.com>
Content-Language: en-US
In-Reply-To: <df115f89-2979-42a5-b521-4bc4f8f4a335@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/22/24 16:48, Amer Al Shanawany wrote:
> On 27/04/2024 15.40, Amer Al Shanawany wrote:
>> Use the scope-based cleanup feature to clean up 'struct device_node *'
>> when they go out of scope, and remove all instances of of_node_put()
>> within the same scope, to simplify function exit and avoid potential
>> memory leaks.
>>
>> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
>> Signed-off-by: Amer Al Shanawany <amer.shanawany@gmail.com>
>> ---
>>   drivers/gpu/drm/vc4/vc4_drv.c  | 14 ++++++--------
>>   drivers/gpu/drm/vc4/vc4_hdmi.c |  4 +---
>>   drivers/gpu/drm/vc4/vc4_hvs.c  |  4 +---
>>   3 files changed, 8 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
>> index c133e96b8aca..bb0bb052e595 100644
>> --- a/drivers/gpu/drm/vc4/vc4_drv.c
>> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
>> @@ -289,7 +289,6 @@ static int vc4_drm_bind(struct device *dev)
>>       struct rpi_firmware *firmware = NULL;
>>       struct drm_device *drm;
>>       struct vc4_dev *vc4;
>> -    struct device_node *node;
>>       struct drm_crtc *crtc;
>>       bool is_vc5;
>>       int ret = 0;
>> @@ -302,11 +301,10 @@ static int vc4_drm_bind(struct device *dev)
>>       else
>>           driver = &vc4_drm_driver;
>>   -    node = of_find_matching_node_and_match(NULL, vc4_dma_range_matches,
>> -                           NULL);
>> +    struct device_node *node __free(device_node) =
>> +        of_find_matching_node_and_match(NULL, vc4_dma_range_matches, NULL);
>>       if (node) {
>>           ret = of_dma_configure(dev, node, true);
>> -        of_node_put(node);
>>             if (ret)
>>               return ret;
>> @@ -341,10 +339,10 @@ static int vc4_drm_bind(struct device *dev)
>>               goto err;
>>       }
>>   -    node = of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
>> -    if (node) {
>> -        firmware = rpi_firmware_get(node);
>> -        of_node_put(node);
>> +    struct device_node *np __free(device_node) =
>> +        of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
>> +    if (np) {
>> +        firmware = rpi_firmware_get(np);
>>             if (!firmware) {
>>               ret = -EPROBE_DEFER;
>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> index d30f8e8e8967..915e8da3f41a 100644
>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> @@ -3661,7 +3661,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>>       struct drm_device *drm = dev_get_drvdata(master);
>>       struct vc4_hdmi *vc4_hdmi;
>>       struct drm_encoder *encoder;
>> -    struct device_node *ddc_node;
>>       int ret;
>>         vc4_hdmi = drmm_kzalloc(drm, sizeof(*vc4_hdmi), GFP_KERNEL);
>> @@ -3699,14 +3698,13 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>>       if (ret)
>>           return ret;
>>   -    ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
>> +    struct device_node *ddc_node __free(device_node) = of_parse_phandle(dev->of_node, "ddc", 0);
>>       if (!ddc_node) {
>>           DRM_ERROR("Failed to find ddc node in device tree\n");
>>           return -ENODEV;
>>       }
>>         vc4_hdmi->ddc = of_find_i2c_adapter_by_node(ddc_node);
>> -    of_node_put(ddc_node);
>>       if (!vc4_hdmi->ddc) {
>>           DRM_DEBUG("Failed to get ddc i2c adapter by node\n");
>>           return -EPROBE_DEFER;
>> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
>> index 04af672caacb..6e3613e06e09 100644
>> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
>> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
>> @@ -845,15 +845,13 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>>         if (vc4->is_vc5) {
>>           struct rpi_firmware *firmware;
>> -        struct device_node *node;
>> +        struct device_node *node __free(device_node) = rpi_firmware_find_node();
>>           unsigned int max_rate;
>>   -        node = rpi_firmware_find_node();
>>           if (!node)
>>               return -EINVAL;
>>             firmware = rpi_firmware_get(node);
>> -        of_node_put(node);
>>           if (!firmware)
>>               return -EPROBE_DEFER;
>>   
> Hi,
>
> This patch is marked as new/archived on patchwork[1], however it didn't receive any feedback, and a similar patch has been already merged [2].
>
>
> [1]: https://patchwork.kernel.org/project/dri-devel/patch/20240427134044.38910-1-amer.shanawany@gmail.com/
>
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d65bfb9546eb627e3c578336355c5b81797f2255
>
> Thank you
>
> Amer
>
Hello,

Could anyone kindly provide some feedback on this patch?

Thank you

Amer
