Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057FA553B23
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 22:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346F61121E2;
	Tue, 21 Jun 2022 20:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477221121E2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 20:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655842106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmXNSrWNq48zXd1EQ3l1n2Chs8rdLQeClhksCt61t+0=;
 b=EP1M4HFfI1nIME+s+sKRoSIpKd2x0FEggh/41PkEebK0Qlv+PkZc8b4yhyVTwvqz+Lnym3
 QUchFBF22vg6nJ50qv2UbpnMwUQnU2FRcJXNCA5IobfeTN+0xb4adJV80lotMwye9fs2NI
 BRVbSc00BlGgDl7jDN3fu7KGulUHF9U=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-fubawTQ4PP2p0PHyBro-4A-1; Tue, 21 Jun 2022 16:08:25 -0400
X-MC-Unique: fubawTQ4PP2p0PHyBro-4A-1
Received: by mail-qk1-f199.google.com with SMTP id
 m15-20020a05620a290f00b006a74cf760b2so17549698qkp.20
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=RmXNSrWNq48zXd1EQ3l1n2Chs8rdLQeClhksCt61t+0=;
 b=TmAP0HaGyz/M5BcR2pvkCVT/hOMZO3sxOcDUv2EwyliqtTmu0luaWKg6RN704nrumF
 M+Vr/DKzPofo8H4kPIiqRJUHqF0Fb9EpUeLVgnFnO0myggBW15M8xSho4RE3X4xbJXHK
 C34hCdIF2t0IwxjuxQey6BwPZmFL228odcoaxRtK0joXSvME6tQ+xQglVvCFgY64dNPG
 1MD8gOsUdQyG4T6Fpb/tVrs85zu5DBRMGI4MStEFpCDg7Hdv8OY4+4GAgYwvXvtgL8Gx
 oBlOQqK4Pks32bAqoU6Yt2+nTsNdtqTQSPWTfyKQek2Qhru/5EJalZpZqii4HrsWBw/S
 xFmw==
X-Gm-Message-State: AJIora+MYgY3RMIuIzOXLonmM8j2+bA7jDwIO2YS7RTMnJJXUIoeDCY+
 Xyb4AB7yIB9PZC2tqkhEQ3OqU9hHmgzzPFQkoPCTH47X/gc9XqMF/kaYOBA0KYFh38SHLTauOYk
 pDcYX20L5lpnhn6PrwZ67poC14i0Q
X-Received: by 2002:a0c:fa03:0:b0:470:3e83:4300 with SMTP id
 q3-20020a0cfa03000000b004703e834300mr11742011qvn.55.1655842104524; 
 Tue, 21 Jun 2022 13:08:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t6OBIQbAgLyiI6McC42p6i5g7xpjiCMJyH10ALqOFoCzbeFE2xp865KOfy+OQhYDbb8Qi0Og==
X-Received: by 2002:a0c:fa03:0:b0:470:3e83:4300 with SMTP id
 q3-20020a0cfa03000000b004703e834300mr11741983qvn.55.1655842104191; 
 Tue, 21 Jun 2022 13:08:24 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a05620a404e00b006a69d7f390csm16072005qko.103.2022.06.21.13.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:08:23 -0700 (PDT)
Message-ID: <58bc64d81295092de0a9cab9c16dfae5600fc821.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/Kconfig: Drop duplicate "select ACPI_VIDEO"
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>
Date: Tue, 21 Jun 2022 16:08:22 -0400
In-Reply-To: <20220620094627.9730-1-hdegoede@redhat.com>
References: <20220620094627.9730-1-hdegoede@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Also, you have my permission to push this to drm-misc-next.

On Mon, 2022-06-20 at 11:46 +0200, Hans de Goede wrote:
> Before this change nouveau's Kconfig section had 2 "select ACPI_VIDEO"
> statements:
> 
> select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
> select ACPI_VIDEO if ACPI && X86
> 
> Drop the one with the extra conditions, if the conditions for that
> one are true then the second statement will always select ACPI_VIDEO
> already.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/Kconfig
> b/drivers/gpu/drm/nouveau/Kconfig
> index 34760164c271..03d12caf9e26 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -11,7 +11,6 @@ config DRM_NOUVEAU
>         select DRM_TTM
>         select DRM_TTM_HELPER
>         select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> -       select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
>         select X86_PLATFORM_DEVICES if ACPI && X86
>         select ACPI_WMI if ACPI && X86
>         select MXM_WMI if ACPI && X86

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

