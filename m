Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6133A5A0D9C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 12:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DAC10FE47;
	Thu, 25 Aug 2022 10:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AE210F141
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661422386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Iz5hZYykHc8fiPWbr2FurkIYzVNEHVdT24iSBVPjAY=;
 b=SlpYUytu1evR0aUOYTNiF7/CThliHFvtCvKfBt2tstupwlqwsssnev2dYHc95Krz2CRD98
 l8J+CVdHsMF/5xHswDV185DbqV2Xd0VB8PGjQQ1ddSz79h91L8/dzyMdUqdLEwF04WF3Yl
 CjCYmKS7yk5ODkNWOv7VrGDwcW9+tZ0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-oAMU1iWVNyaY9PUSNhnANg-1; Wed, 24 Aug 2022 14:11:33 -0400
X-MC-Unique: oAMU1iWVNyaY9PUSNhnANg-1
Received: by mail-qt1-f198.google.com with SMTP id
 cm10-20020a05622a250a00b003437b745ccdso13408673qtb.18
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 11:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=7Iz5hZYykHc8fiPWbr2FurkIYzVNEHVdT24iSBVPjAY=;
 b=gzBt9Dx9jC3j+p+gV4AaufcSO++7PDxMczGGPhYkxhMKiUUWBuCvxeFth9rBJfPIlu
 A+7OCbhiR5xcqFewi2LybnVvpphtzzH2ytJ1HsJrzJeE64/T1FIIH8OpcpYiJOPl3ym4
 jE6J/aDvLYEDBZanlUrejLfeuhHcr219hAIaSQFRuIzUL+iynmv7o+G3QBoTpUhVFqMR
 CqVzhR6kAUHSCYXcL3OO0z1IQKsKwg3UReu82FbwhXMA9OTyqlpfdEWCGssWsJxrwMxw
 A7+eMJQb65VY1TuZbU9A45uiE8XbjBetUqoxpvVVCpSSfqPxTNFoCXYtkbyiGK/UTpEV
 oQtw==
X-Gm-Message-State: ACgBeo2qFVnghzGWVJFB8fbTsOC7eIXBzVtdxdzOLPuZBo3cKqJu8uh+
 z3MDGcjc6jjSiLTtuToyw+T36syyk674jDpwrerZIERNF0pWyiXJEDAVmUOKwRRvIv2arFeceN9
 rO6XWttnhDg7M5hqhvCnxZ3XzhpJC
X-Received: by 2002:a0c:e34d:0:b0:496:d21e:da0f with SMTP id
 a13-20020a0ce34d000000b00496d21eda0fmr356246qvm.104.1661364692970; 
 Wed, 24 Aug 2022 11:11:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5yZfLMMwova0GLIKlzkippPXyfVI1iypDQik96PZEELSzHNsWUSq6kjGN73O12uk25lSgHzw==
X-Received: by 2002:a0c:e34d:0:b0:496:d21e:da0f with SMTP id
 a13-20020a0ce34d000000b00496d21eda0fmr356221qvm.104.1661364692747; 
 Wed, 24 Aug 2022 11:11:32 -0700 (PDT)
Received: from [192.168.8.139] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 p11-20020ac8740b000000b00342fcdc2d46sm12833255qtq.56.2022.08.24.11.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 11:11:31 -0700 (PDT)
Message-ID: <ad03096816395dbfd8113fca51b4ff374f36255f.camel@redhat.com>
Subject: Re: [PATCH v4 12/31] drm/nouveau: Register ACPI video backlight
 when nv_backlight registration fails (v2)
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, Daniel Dadap <ddadap@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, Mark
 Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Wed, 24 Aug 2022 14:11:30 -0400
In-Reply-To: <20220824121523.1291269-13-hdegoede@redhat.com>
References: <20220824121523.1291269-1-hdegoede@redhat.com>
 <20220824121523.1291269-13-hdegoede@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2022-08-24 at 14:15 +0200, Hans de Goede wrote:
> Typically the acpi_video driver will initialize before nouveau, which
> used to cause /sys/class/backlight/acpi_video0 to get registered and then
> nouveau would register its own nv_backlight device later. After which
> the drivers/acpi/video_detect.c code unregistered the acpi_video0 device
> to avoid there being 2 backlight devices.
> 
> This means that userspace used to briefly see 2 devices and the
> disappearing of acpi_video0 after a brief time confuses the systemd
> backlight level save/restore code, see e.g.:
> https://bbs.archlinux.org/viewtopic.php?id=269920
> 
> To fix this the ACPI video code has been modified to make backlight class
> device registration a separate step, relying on the drm/kms driver to
> ask for the acpi_video backlight registration after it is done setting up
> its native backlight device.
> 
> Add a call to the new acpi_video_register_backlight() when native backlight
> device registration has failed / was skipped to ensure that there is a
> backlight device available before the drm_device gets registered with
> userspace.
> 
> Changes in v2:
> - Add nouveau_acpi_video_register_backlight() wrapper to avoid unresolved
>   symbol errors on non X86
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_acpi.c      | 5 +++++
>  drivers/gpu/drm/nouveau/nouveau_acpi.h      | 2 ++
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 +++++++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> index 1592c9cd7750..8cf096f841a9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -391,3 +391,8 @@ bool nouveau_acpi_video_backlight_use_native(void)
>  {
>  	return acpi_video_backlight_use_native();
>  }
> +
> +void nouveau_acpi_video_register_backlight(void)
> +{
> +	acpi_video_register_backlight();
> +}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.h b/drivers/gpu/drm/nouveau/nouveau_acpi.h
> index 3c666c30dfca..e39dd8b94b8b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.h
> @@ -12,6 +12,7 @@ void nouveau_unregister_dsm_handler(void);
>  void nouveau_switcheroo_optimus_dsm(void);
>  void *nouveau_acpi_edid(struct drm_device *, struct drm_connector *);
>  bool nouveau_acpi_video_backlight_use_native(void);
> +void nouveau_acpi_video_register_backlight(void);
>  #else
>  static inline bool nouveau_is_optimus(void) { return false; };
>  static inline bool nouveau_is_v1_dsm(void) { return false; };
> @@ -20,6 +21,7 @@ static inline void nouveau_unregister_dsm_handler(void) {}
>  static inline void nouveau_switcheroo_optimus_dsm(void) {}
>  static inline void *nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector) { return NULL; }
>  static inline bool nouveau_acpi_video_backlight_use_native(void) { return true; }
> +static inline void nouveau_acpi_video_register_backlight(void) {}
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index d2b8f8c13db4..a614582779ca 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -436,6 +436,13 @@ nouveau_backlight_init(struct drm_connector *connector)
>  
>  fail_alloc:
>  	kfree(bl);
> +	/*
> +	 * If we get here we have an internal panel, but no nv_backlight,
> +	 * try registering an ACPI video backlight device instead.
> +	 */
> +	if (ret == 0)
> +		nouveau_acpi_video_register_backlight();
> +
>  	return ret;
>  }
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

