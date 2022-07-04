Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B01565BD1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AC110E8EC;
	Mon,  4 Jul 2022 16:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B531810E07B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 12:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Q2W9IhoLr9hA8yfbyW7WYSxnxRt8vpH+vp3WlOn7Yo=;
 b=G0Jf09+1MZh1/FOIgJnKLfZE0ONoFQ8ve778Z4rcbQsT/m/JnDTWvJlRpREI5EK/xUpNPl
 VNvsKozUAWEm7fohyXifc3Ye3CB2o+Ct5X/j5goNRyASXElUsnVH6FQvc1PmhdUAgPlEQA
 nY+4r1fmpjdqzVxZzbIB5oNhL2XzkiI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-SLcrJtc2MyKvLrAMlLNWHA-1; Mon, 04 Jul 2022 08:55:56 -0400
X-MC-Unique: SLcrJtc2MyKvLrAMlLNWHA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j16-20020adfa550000000b0021d63d200a8so761486wrb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 05:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=0Q2W9IhoLr9hA8yfbyW7WYSxnxRt8vpH+vp3WlOn7Yo=;
 b=0eulYzctp08/nBvoomFiNMK/V+LcE7Hhbs94u/Qbgjyw9JKsT/6bz7MjccLeJ46apC
 wY/qzjQ+wHeA5r2E1wstJxVAhdhDUSRff91xb2secHZ/R0HBLEsg62hL0zGuo66KNrpU
 aujyZ9EBMV36gEtCMjZDd6XE644JBlZU3UuO+rZkJrM9OFNuxl7Of1HTSQeQ22O2c93i
 yW4GCfglIpoEioTyxWViOepa8rfDX+iQve4AhCG0vkm4XlsVej7BC+ypznctUZ6Z85cl
 17b4f1c3DACHKcpzgCeAmSnJ23UWq6aM1htUs0hT9goPyBIaEK/WnvqeqaDvvb+EnhLV
 rIsA==
X-Gm-Message-State: AJIora+i6z7Uj8jjmCrwqKI3UjtuK3eInc0YXg8vhVwdDEM+7TK5k9xr
 9HZGdWLDrFl1WxagiAHuEnmYskbcP0+CyvUCr/C8gxDRVh9OL/9D279N7xbH8Cj4deCHmbQJ1aD
 wAikLtX8aM0VjkJKKz20Y/LaD2ygr
X-Received: by 2002:a5d:5747:0:b0:21d:65e9:be07 with SMTP id
 q7-20020a5d5747000000b0021d65e9be07mr7784957wrw.215.1656939355384; 
 Mon, 04 Jul 2022 05:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t/qb1+a8BQ8V/JawOxW6gJmON61Dt6yYdpZnDA/WObkCU3CFPzyZovOG91Wp1Ays5SJ10Fuw==
X-Received: by 2002:a5d:5747:0:b0:21d:65e9:be07 with SMTP id
 q7-20020a5d5747000000b0021d65e9be07mr7784929wrw.215.1656939355116; 
 Mon, 04 Jul 2022 05:55:55 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q13-20020adff50d000000b0021d64a11727sm5235633wro.49.2022.07.04.05.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 05:55:54 -0700 (PDT)
Message-ID: <83fa378f-b331-0cb7-5878-d4d23a543b18@redhat.com>
Date: Mon, 4 Jul 2022 14:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] drm: Prevent drm_copy_field() to attempt copying a
 NULL pointer
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220701120755.2135100-1-javierm@redhat.com>
 <20220701120755.2135100-3-javierm@redhat.com>
 <b90d5ae5-8629-8be8-6390-f22f97ec4f5e@suse.de>
 <8e783b8c-e7b9-3d8e-e80d-2f2608421293@redhat.com>
In-Reply-To: <8e783b8c-e7b9-3d8e-e80d-2f2608421293@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/4/22 14:36, Javier Martinez Canillas wrote:
> Hello Thomas,
> 
> Thanks for your feedback.
> 

[snip]

>>> +	/* don't attempt to copy a NULL pointer */
>>> +	if (WARN_ONCE(!value, "BUG: the value to copy was not set!"))
>>> +		return -EINVAL;
>>> +
>>
>> We usually assume that the caller passes the correct arguments. This is 
>> different for no reasons. I'd rather not take this patch unless there's 
>> a security implication to the ioctl interface (e.g., leaking information 
>> because of this NULL ptr).
>>
> 
> This can lead from an oops (soft panic) to a kernel crash for a buggy driver.
> 
> I see from where you are coming from but then I think we should sanitize the
> filled struct drm_driver fields in drm_dev_register() and make it fail early.
> 
> Would you agree with such a patch? But what I think that we shouldn't allow
> is to attempt copying a NULL pointer, if we can easily prevent it.
>

I mean something like the following patch (didn't add a commit message
for brevity):

From 4c13400c54e0e29918a8eb248013f54cd2660f4f Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Mon, 4 Jul 2022 14:53:48 +0200
Subject: [PATCH] drm: Check in drm_dev_register() that required DRM driver
 fields were set

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_drv.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..d4eebaf37e23 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -842,6 +842,12 @@ static void remove_compat_control_link(struct drm_device *dev)
 	kfree(name);
 }
 
+static inline bool check_drm_driver_fields(const struct drm_driver *driver)
+{
+	/* required since are copied to user-space by DRM_IOCTL_VERSION */
+	return driver->name && driver->date && driver->desc;
+}
+
 /**
  * drm_dev_register - Register DRM device
  * @dev: Device to register
@@ -865,7 +871,11 @@ static void remove_compat_control_link(struct drm_device *dev)
 int drm_dev_register(struct drm_device *dev, unsigned long flags)
 {
 	const struct drm_driver *driver = dev->driver;
-	int ret;
+	int ret = -EINVAL;
+
+	if (drm_WARN(dev, !check_drm_driver_fields(driver),
+		     "Required DRM drivers fields not set.\n"))
+			goto out_err;
 
 	if (!driver->load)
 		drm_mode_config_validate(dev);
@@ -913,6 +923,7 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 out_unlock:
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_unlock(&drm_global_mutex);
+out_err:
 	return ret;
 }
 EXPORT_SYMBOL(drm_dev_register);
-- 
2.36.1

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

