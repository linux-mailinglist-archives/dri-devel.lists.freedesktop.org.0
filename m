Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A9513B31
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 20:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF9010E98D;
	Thu, 28 Apr 2022 18:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A740210E964
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 18:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651169264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aaf7WBYGAbKgX81lK/A05oMnfGiwORC9xKHh6Fh+DEk=;
 b=VtUQXwgL4wsNX3RuyuQvZ/Es0IcwpWF7w2aklBvkel2IYAK+X2/NhcNYj8y43rWrPdYu+m
 uJKJWSNXp3I7PIey6M+NUmixq/lWJGsWtcO8X9+oUkKbfEX82iIDIr1qpt5QqVx8XZlLR1
 TgWCEHo1ipANctsBGPtlPDKI+8uyd/Q=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-Wqhn8qc8Nd66OVBMpYiHlw-1; Thu, 28 Apr 2022 14:07:42 -0400
X-MC-Unique: Wqhn8qc8Nd66OVBMpYiHlw-1
Received: by mail-qt1-f200.google.com with SMTP id
 e8-20020a05622a110800b002f380dd879eso3912285qty.11
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 11:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=aaf7WBYGAbKgX81lK/A05oMnfGiwORC9xKHh6Fh+DEk=;
 b=uoL2eM2wRuBoKqW5tCGFrbdc38UJBUedV/jmJxuR/JhmYecQnfH1XgOloLt+9u/TMw
 VsbmdqmOTH4VFnUkNDuMNxXViv6X5WsNpoojjgV5ZYsIFVZcR5TbJlUBe1t+ag0hsTVv
 rDhj0q86R/R+/OIFr5vGGGJYiEzsSRru08zsxZBX3ccRqcR2xbcYK+cnXk6WV+YtF/lo
 ymKG/QPQ4EXxd+UnuvDgPCFsWhxAPtR9FoNGTsbUDb590F3MyS1pQBq3VMcp8LyLg7Wg
 T/1z3oUWaqFzF8DvJ87ssKlORLBxDZbs7VSKrMsBuGOAI7Uu1lX4QFUJ7iAOLfZjIoMj
 DQ3g==
X-Gm-Message-State: AOAM5303UZ7BM62GNytdQ6+aAvI3ksnUbNfANlC8NpuBb/WanuBw5YX8
 7kZE5+jgjZV+U+cACT8xT07WTLR27KeNilZziAgmi4D9rE82mBaIPJ7dma1YPP7itJIE0bzc39P
 9ZPphqkcozL4k4+HjNjpW1F7FbjpX
X-Received: by 2002:ad4:5aec:0:b0:456:3b6a:4d13 with SMTP id
 c12-20020ad45aec000000b004563b6a4d13mr14718673qvh.121.1651169261830; 
 Thu, 28 Apr 2022 11:07:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGN0zPBo8qHvPga7fAot8Gqh+w2RDDSsW4sme420ladbYlp8Y/mUvBggD4ybaelFe3cBhRjw==
X-Received: by 2002:ad4:5aec:0:b0:456:3b6a:4d13 with SMTP id
 c12-20020ad45aec000000b004563b6a4d13mr14718641qvh.121.1651169261490; 
 Thu, 28 Apr 2022 11:07:41 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 r2-20020a05620a298200b0069fb54c2b4dsm103240qkp.31.2022.04.28.11.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 11:07:40 -0700 (PDT)
Message-ID: <03b38035c582d3c2616010a87a365e1eb62a81de.camel@redhat.com>
Subject: Re: [PATCH v3] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
From: Lyude Paul <lyude@redhat.com>
To: Javier Martinez Canillas <javierm@redhat.com>, 
 linux-kernel@vger.kernel.org
Date: Thu, 28 Apr 2022 14:07:39 -0400
In-Reply-To: <20220428082244.390859-1-javierm@redhat.com>
References: <20220428082244.390859-1-javierm@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2022-04-28 at 10:22 +0200, Javier Martinez Canillas wrote:
> The DRM_DP_AUX_CHARDEV and DRM_DP_CEC Kconfig symbols enable code that use
> DP helper functions, that are only present if CONFIG_DRM_DISPLAY_DP_HELPER
> is also enabled.
> 
> But these don't select the DRM_DISPLAY_DP_HELPER symbol, meaning that it
> is possible to enable any of them without CONFIG_DRM_DISPLAY_DP_HELPER.
> 
> That will lead to the following linking errors with the mentioned config:
> 
>   LD      vmlinux.o
>   MODPOST vmlinux.symvers
>   MODINFO modules.builtin.modinfo
>   GEN     modules.builtin
>   LD      .tmp_vmlinux.kallsyms1
>   KSYMS   .tmp_vmlinux.kallsyms1.S
>   AS      .tmp_vmlinux.kallsyms1.S
>   LD      .tmp_vmlinux.kallsyms2
>   KSYMS   .tmp_vmlinux.kallsyms2.S
>   AS      .tmp_vmlinux.kallsyms2.S
>   LD      vmlinux
>   SYSMAP  System.map
>   SORTTAB vmlinux
>   OBJCOPY arch/arm64/boot/Image
>   MODPOST modules-only.symvers
> ERROR: modpost: "drm_dp_dpcd_write"
> [drivers/gpu/drm/display/drm_display_helper.ko] undefined!
> ERROR: modpost: "drm_dp_read_desc"
> [drivers/gpu/drm/display/drm_display_helper.ko] undefined!
> ERROR: modpost: "drm_dp_dpcd_read"
> [drivers/gpu/drm/display/drm_display_helper.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:134: modules-only.symvers] Error 1
> make[1]: *** Deleting file 'modules-only.symvers'
> make: *** [Makefile:1749: modules] Error 2
> 
> Besides making these symbols to select CONFIG_DRM_DISPLAY_DP_HELPER, make
> them to depend on DRM_DISPLAY_HELPER, since can't be enabled without it.
> 
> Note: It seems this has been an issue for a long time but was made easier
> to reproduce after the commit 1e0f66420b13 ("drm/display: Introduce a DRM
> display-helper module"). Adding a Fixes: tag just to make sure that this
> fix will be picked for stable once the mentioned change also lands there.
> 
> Fixes: 1e0f66420b13 ("drm/display: Introduce a DRM display-helper module")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> Changes in v3:
> - Also make DRM_DP_AUX_CHARDEV and DRM_DP_CEC depend on DRM_DISPLAY_HELPER
>   (Thomas Zimmermann).
> 
> Changes in v2:
> - Explain better the issue in the change description.
> - Only select DRM_DISPLAY_DP_HELPER and not DRM_DISPLAY_HELPER.
> 
>  drivers/gpu/drm/display/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/Kconfig
> b/drivers/gpu/drm/display/Kconfig
> index f84f1b0cd23f..1b6e6af37546 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -31,7 +31,8 @@ config DRM_DISPLAY_HDMI_HELPER
>  
>  config DRM_DP_AUX_CHARDEV
>         bool "DRM DP AUX Interface"
> -       depends on DRM
> +       depends on DRM && DRM_DISPLAY_HELPER
> +       select DRM_DISPLAY_DP_HELPER
>         help
>           Choose this option to enable a /dev/drm_dp_auxN node that allows
> to
>           read and write values to arbitrary DPCD registers on the DP aux
> @@ -39,7 +40,8 @@ config DRM_DP_AUX_CHARDEV
>  
>  config DRM_DP_CEC
>         bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
> -       depends on DRM
> +       depends on DRM && DRM_DISPLAY_HELPER
> +       select DRM_DISPLAY_DP_HELPER
>         select CEC_CORE
>         help
>           Choose this option if you want to enable HDMI CEC support for

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

