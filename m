Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C93FCC9B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 19:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502C189890;
	Tue, 31 Aug 2021 17:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E2489890
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 17:52:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id n27so562848eja.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 10:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ze2Aqq27Af2fdeKR1i1zDXmwW93VCnlnbimVWDec3Bk=;
 b=tsSSUC5OcHXYQ8cJ4PJU/vnhXr4i82TGMPCQfv04vaeGnyoRU1jUplRNQEuouJx6DE
 u4kOckyysKNqxISDGjQ1KMzqYZLlby6WchdkE15Irg+m0On1VPMuamVg65W6EaWrrG1w
 oC3/2CvkehvN6YfJZvAEqfH12DgpMBZUTfJiuhocUDsfIrMLt1v8Qbf1xcXDbRn+PGIf
 1RKrneYfx83nTnC/JtxnwYTJkerXxolNSVjjC0T31C9gHOsCtXcjcY1RxunFX30vV3Nl
 GR9IsZrt2UuFjEbivtYPA7ml5aFwZQYvlEQoMj9ctDmk9VG8HrwuD0jUO1ZjKhO3xaBv
 TJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ze2Aqq27Af2fdeKR1i1zDXmwW93VCnlnbimVWDec3Bk=;
 b=EAJLXAkJX/MOgD2+lZP216ASfIpg9gXzoYB8BqW/7j+f7PelKE722NgGqv0LLmbjNA
 lUYLytxJviLgm3Mx9i3QKnPqJetRod1/gFBKpNvTydYI9sE0SbLHeiqju9uFoAclfdpM
 4pl47Q0soyL62vLufA++hBF80yljoeOuSJUwOh2zv/nLWWirkFyipZe6dJu6QLxRQIKB
 sOkFbu8sAMvH99nEhYOc88quzpAaapCM6pJ+NBeityzJQCp9DLV1WDJ45VPiZw+iluwy
 RkbEwOTapz9BxRxFSQkVBxUqGANBYSnoinoteQCrCNr3JeAjS3nxZqXbVL6Rh8eT2G76
 f6jQ==
X-Gm-Message-State: AOAM533xXohIGrBwKg7+q89CuWzc2Bt8OkWyNPIrAD491SB/04XKBeO0
 GSaqeYcvjXvTNENWS2FSsMHA2JFB2SV7NiQw0/rblNq7su0=
X-Google-Smtp-Source: ABdhPJxYT20tQB02iDN9/k3Plact2Ft0ubhn8cVXSwFM8bwVHKSEStY4OftEVGC73GRzPySKVTnhWcDniO1zhUfREXI=
X-Received: by 2002:a17:907:92c:: with SMTP id
 au12mr32605562ejc.523.1630432362026; 
 Tue, 31 Aug 2021 10:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210717000345.2345429-1-willmcvicker@google.com>
In-Reply-To: <20210717000345.2345429-1-willmcvicker@google.com>
From: Will McVicker <willmcvicker@google.com>
Date: Tue, 31 Aug 2021 10:52:26 -0700
Message-ID: <CABYd82aOKn0wsCWS6K2kPZ9zho1nkRPKq941g6Z-V4fKZD+jiQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi: set fwnode when a mipi_dsi_device is registered
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Saravana Kannan <saravanak@google.com>, 
 "Cc: Android Kernel" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi All,

I'd like to send a reminder for a review on this patch.

Thanks,
Will


On Fri, Jul 16, 2021 at 5:03 PM Will McVicker <willmcvicker@google.com> wrote:
>
> This allows the fw_devlink feature to work across mipi_dsi bus devices too.
> This feature avoids unnecessary probe deferrals of mipi_dsi devices, defers
> consumers of mipi_dsi devices till the mipi_dsi devices probe, and allows
> mipi_dsi drivers to implement sync_state() callbacks.
>
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> Reviewed-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> v2:
>  Thanks Saravana for the comments! I updated the commit message and added your
>  reviewed-by.
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 5dd475e82995..469d56cf2a50 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -222,6 +222,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
>         }
>
>         dsi->dev.of_node = info->node;
> +       dsi->dev.fwnode = of_fwnode_handle(info->node);
>         dsi->channel = info->channel;
>         strlcpy(dsi->name, info->type, sizeof(dsi->name));
>
> --
> 2.32.0.402.g57bb445576-goog
>
