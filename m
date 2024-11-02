Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559869BA296
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 22:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C279610E235;
	Sat,  2 Nov 2024 21:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JiiPgUm8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2ED310E235
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 21:46:36 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so461332366b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Nov 2024 14:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730583995; x=1731188795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=A+g2rUtrq4K4ttP0uYoloAGy4GhsQtwQ8IziC3FEUvE=;
 b=JiiPgUm8l5LjHeD+f3pVdL8e79PX1wm2KVe6sK1KTRjxGPfvhNZsXpNwNJSVg6e4H4
 jBsTWBJmLBG9KS494pNEt1nsMYO2E1qnhAmw+aDndFERiGdiVVNOiAFUkiStY9nvA7MR
 K1SRLM1xIiHU6tGGFHLPVL1viH9Ro6LF9mjdCokn0W732qIIMfgqhoRD80d1247w9Wr7
 PcwHaYJ5lQrRYUra3sly1Xt2/VWDSVBr98BQzmXoMHs5pSo9FQ1wPPAMd/6o5y1N01H5
 VuOeRros9nWR9f4rvBSQIJeEaIJSRSJMc3qsH65NAL/bEsO4Yqt4d76lixTGZt9iX39y
 cmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730583995; x=1731188795;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A+g2rUtrq4K4ttP0uYoloAGy4GhsQtwQ8IziC3FEUvE=;
 b=dNPJCWU+b7OAlDItHux8cKJynkY147w3YCscMTJVyLG2UOslEcQshAHDpzC8PxZKfY
 zAmYWTlb9sibW91tUIE6wTwVij8TArx4gKASD+xu1eV7kCQTrjCtxfyRVyKT2Egw4omz
 fn0vWL0rjg0L3MozcbUkSOkx7hos4ae0WLgcO6gwf6645gj8YX3qA+fxkQATXoPvhAOD
 XdG26a/33L9Bw2iP0/PU8NaSKWwgbPWBSX2FF5V8oOsRG1B7py/cw3JtthTiFvxe/8pk
 gp1KYiUUDsfVXH+ZyDzb/52FcEVQQ8mU174Uq2BaEKP3lm/aHIi6w1TIrpzOSWIu5zg3
 7E0w==
X-Gm-Message-State: AOJu0Yx7G9TXsMEymGhWt43qwgXGA5c1ju0lb1/bRNewTpRm9kWq7F5S
 piRlfI/ZSUrjdXKNWpp0+hXB2VGYgW8ErwdlX9PmOO9M+krumLH/
X-Google-Smtp-Source: AGHT+IHT1GPb4eb1Gm6Pd/aRec2QHGpROBbVgLwcCddjBRZYRovKVHUfATeuTnPcQDsVHhCmtPXiLQ==
X-Received: by 2002:a17:907:724d:b0:a9a:80f9:d4e0 with SMTP id
 a640c23a62f3a-a9e5097277emr723932366b.34.1730583994769; 
 Sat, 02 Nov 2024 14:46:34 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a029:9600:b581:b80a:431b:19ed?
 (dynamic-2a02-3100-a029-9600-b581-b80a-431b-19ed.310.pool.telefonica.de.
 [2a02:3100:a029:9600:b581:b80a:431b:19ed])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a9e5668497csm348193366b.220.2024.11.02.14.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Nov 2024 14:46:33 -0700 (PDT)
Message-ID: <5090bc78-f765-4d2b-af83-c64f894df156@gmail.com>
Date: Sat, 2 Nov 2024 22:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/3] drm/sysfs: Drop unused drm_class_device_(un)register
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
References: <a6c85d91-9809-430e-99e6-00ec894ac517@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
In-Reply-To: <a6c85d91-9809-430e-99e6-00ec894ac517@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only user of these functions was TTM code which dropped sysfs interfaces
in commit ed89fff97382 ("drm/ttm: drop sysfs directory"). So remove
these now unused functions.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpu/drm/drm_sysfs.c | 32 --------------------------------
 include/drm/drm_sysfs.h     |  3 ---
 2 files changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index fb3bbb6ad..3bc90fe5c 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -548,35 +548,3 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 	put_device(kdev);
 	return ERR_PTR(r);
 }
-
-/**
- * drm_class_device_register - register new device with the DRM sysfs class
- * @dev: device to register
- *
- * Registers a new &struct device within the DRM sysfs class. Essentially only
- * used by ttm to have a place for its global settings. Drivers should never use
- * this.
- */
-int drm_class_device_register(struct device *dev)
-{
-	if (!drm_class || IS_ERR(drm_class))
-		return -ENOENT;
-
-	dev->class = drm_class;
-	return device_register(dev);
-}
-EXPORT_SYMBOL_GPL(drm_class_device_register);
-
-/**
- * drm_class_device_unregister - unregister device with the DRM sysfs class
- * @dev: device to unregister
- *
- * Unregisters a &struct device from the DRM sysfs class. Essentially only used
- * by ttm to have a place for its global settings. Drivers should never use
- * this.
- */
-void drm_class_device_unregister(struct device *dev)
-{
-	return device_unregister(dev);
-}
-EXPORT_SYMBOL_GPL(drm_class_device_unregister);
diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
index 96a5d8584..929d957e4 100644
--- a/include/drm/drm_sysfs.h
+++ b/include/drm/drm_sysfs.h
@@ -7,9 +7,6 @@ struct device;
 struct drm_connector;
 struct drm_property;
 
-int drm_class_device_register(struct device *dev);
-void drm_class_device_unregister(struct device *dev);
-
 void drm_sysfs_hotplug_event(struct drm_device *dev);
 void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
 void drm_sysfs_connector_property_event(struct drm_connector *connector,
-- 
2.47.0


