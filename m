Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7667F341FEC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 15:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30E56EA2F;
	Fri, 19 Mar 2021 14:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0A56EA33
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 14:44:45 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id m3so3818520pga.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 07:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iGtWWRPtYaesVII9xVuarQ74BpkCKYVsirQYS4eH+kw=;
 b=VQopFqQ7Oi/j1u/8XxsX/Ys7cEFxGEox7f1bx6NoTv7BEvoz2YuGPDmss5cNrpjOzy
 VAEKj4MFXAwl6WPpkX+M+hI1Hu7VonNAkypLrCqWQSz2YlE6bFVZrX+y7MYzhM61hIBF
 hMAVmp/+eBnAWvLEUGT385c0lLIE3zNjKg3yEbrxcspNhbT85xP1rQObj/i7c8C1DsTJ
 RuyzGHHLesk4ojCDSC8eApoQe9iKz0uFKGjxbFcDZGqjP1i/Qc/4i9fpNqpKjlA8WYdG
 V7Lj9zoGrF4wQEB5h/JkCwP+fOh8CXDTsErgXHi2Lk46AUjB3sux/6XHCsHuo2j0YsyK
 KJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGtWWRPtYaesVII9xVuarQ74BpkCKYVsirQYS4eH+kw=;
 b=cjzWWJC7XX59dPMwXN7BMnkLH1TvnhBJLf2kt2lPbnNkt3lglohIGAuiJ63N3vEkY6
 JVibEdQ4dQbKSShjTNFBhhfOwch2t1t6KC0p9tGuX32jBDZ6EXeMPYJDQyMLr8NPY6iM
 R53L7Vu4QM9jITZyqEORJv1l/4rAKr9TG2ZijB5bWiakmdOQLUh4Hf0Da210TJBf3ewX
 bqiXFfB9igcXjf1NxLTVYmdZQ2z87z1zuYXASBy6BF0pitzE+19nCASFFmtrEfD9E2lH
 Wf7rx5xXLJGuh9ChLnEmJQOcYlRDmq4rvlaBWErAaoFtMbtZdqqsHIuZvw2sUz3hFG3i
 rDcQ==
X-Gm-Message-State: AOAM531wap3L7BhAR252sMc1uyTcjQXHQ8HhtFreMHR199MIMd3fVW5u
 /w4UGi8SQyHNklDDFJQWoCiVbUg98GZTMIXc3y5f+w==
X-Google-Smtp-Source: ABdhPJzrBJishtLlW1vLHQuX3g9moCjtqg8gvKyfKMXQAVynNrWk794TQB88/EgV8doHLowCXDYIwqS+scDaYBD2Ma4=
X-Received: by 2002:a63:ee4b:: with SMTP id n11mr11862551pgk.265.1616165084661; 
 Fri, 19 Mar 2021 07:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-13-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-13-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Mar 2021 15:44:33 +0100
Message-ID: <CAG3jFysehSDHFFXAAc5VexAjyVhCq6hUyD8yWFsE6V3hv_9iPA@mail.gmail.com>
Subject: Re: [PATCH 12/30] drm/bridge/analogix/anx6345: Cleanup on errors in
 anx6345_bridge_attach()
To: Lyude Paul <lyude@redhat.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Torsten Duwe <duwe@lst.de>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joe Perches <joe@perches.com>, Icenowy Zheng <icenowy@aosc.io>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Lyude,

Thanks for the patch, it looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 19 Feb 2021 at 22:58, Lyude Paul <lyude@redhat.com> wrote:
>
> Another drive-by fix I found when fixing DP AUX adapter across the kernel
> tree - make sure we don't leak resources (and by proxy-AUX adapters) on
> failures in anx6345_bridge_attach() by unrolling on errors.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index 6258f16da0e8..aa6cda458eb9 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -550,7 +550,7 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
>                                  DRM_MODE_CONNECTOR_eDP);
>         if (err) {
>                 DRM_ERROR("Failed to initialize connector: %d\n", err);
> -               return err;
> +               goto aux_unregister;
>         }
>
>         drm_connector_helper_add(&anx6345->connector,
> @@ -562,16 +562,21 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
>                                            bridge->encoder);
>         if (err) {
>                 DRM_ERROR("Failed to link up connector to encoder: %d\n", err);
> -               return err;
> +               goto connector_cleanup;
>         }
>
>         err = drm_connector_register(&anx6345->connector);
>         if (err) {
>                 DRM_ERROR("Failed to register connector: %d\n", err);
> -               return err;
> +               goto connector_cleanup;
>         }
>
>         return 0;
> +connector_cleanup:
> +       drm_connector_cleanup(&anx6345->connector);
> +aux_unregister:
> +       drm_dp_aux_unregister(&anx6345->aux);
> +       return err;
>  }
>
>  static void anx6345_bridge_detach(struct drm_bridge *bridge)
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
