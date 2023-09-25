Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128717AE184
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 00:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073EE10E333;
	Mon, 25 Sep 2023 22:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1400210E332
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 22:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695679575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tY5bcSFTLxhrJq0wnGX1DBWHzjbAl0iR3STf9o5hxaQ=;
 b=ZE1b55LulespSvhJGEkHbwCJDWVW7u1c2gRfpHdAnVjHBUe/22vv7nDeZOCh16S1IVR16C
 b1TBt5dbw38JykrnGT13sNpD/xpONNxy/Wi8Vvi3lrUDeVaOLMNe0fGAUlijPN5cTanuPG
 Wfo0iGco6fP45fWS1c3Rok5CGUxtHYk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-rPNNLDJsPyGEDShnet2fmg-1; Mon, 25 Sep 2023 18:06:11 -0400
X-MC-Unique: rPNNLDJsPyGEDShnet2fmg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32320b3ee93so2838086f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 15:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695679570; x=1696284370;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tY5bcSFTLxhrJq0wnGX1DBWHzjbAl0iR3STf9o5hxaQ=;
 b=sXuJjqLaaas3OyVBqIVEO2bV4hLT36O4AQbgCSAb+k6JLav5MsZJX7mwm+JpiLlSLE
 LmyFm2mT6zo7Y069KuC02SrEGfOt//VfeIf0SeV7VKDBRSc7TrOybBbfAPZwkprGu2jC
 COMrmtiLTtxNiqLKTBI5krTl3sSr1EL+5Ht7Ly5nE22iVGOIcfsQxVmCHL4SXCvVUN0V
 ySXgUoyj5+58jBAObpxXH3a50kgQS7uYeEv7WcULkWJA3ehr7T1ct2qNkBrI5B9fV5nc
 w1cRYqD8QW0pFhD+PfVnBSZXjjxpVSrLOwpfNop/irCGefz5j2W1iy1I0zGp0QMf8D6r
 euQw==
X-Gm-Message-State: AOJu0YzoQOl/R4kb29e82c4cS66tV3vT1f3HDbLuIlngH43NfW5361zJ
 PFbLGSmsbzFKR05hj0xOtXKy0w37QUKpmRBVi6vrmhrQeYwp7rEiGtyZzCzcLBkD/4HcuZu1YQf
 8c96kJqbPBCehCHJsFyq9wmsUc4fL
X-Received: by 2002:a5d:6382:0:b0:319:8c35:378 with SMTP id
 p2-20020a5d6382000000b003198c350378mr6912293wru.44.1695679570586; 
 Mon, 25 Sep 2023 15:06:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmeSIEMwFLWmZGGbq/ZzwRhXqWOvyeod0GnC31lUWRsM0brD8Xc2qSB7EvUpkx5KUb+zHPbw==
X-Received: by 2002:a5d:6382:0:b0:319:8c35:378 with SMTP id
 p2-20020a5d6382000000b003198c350378mr6912272wru.44.1695679570272; 
 Mon, 25 Sep 2023 15:06:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d634c000000b0031773a8e5c4sm12875356wrw.37.2023.09.25.15.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 15:06:09 -0700 (PDT)
Message-ID: <e2072b46-11a4-a146-e984-70be30514fe1@redhat.com>
Date: Tue, 26 Sep 2023 00:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50: hide unused variables
To: Arnd Bergmann <arnd@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230925155930.677620-1-arnd@kernel.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230925155930.677620-1-arnd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <me@dakr.org>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/25/23 17:59, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After a recent change, two variables are only used in an #ifdef:
> 
> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1569:13: error: unused variable 'ret' [-Werror=unused-variable]
>   1569 |         int ret;
>        |             ^~~
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1568:28: error: unused variable 'aux' [-Werror=unused-variable]
>   1568 |         struct drm_dp_aux *aux = &nv_connector->aux;
>        |                            ^~~
> 
> Move them into the same conditional block, along with the nv_connector variable
> that becomes unused during that fix.
> 
> Fixes: 757033808c95b ("drm/nouveau/kms/nv50-: fixup sink D3 before tearing down link")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 52f1569ee37c1..a0ac8c258d9ff 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1560,15 +1560,13 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
>   {
>   	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>   	struct nv50_head *head = nv50_head(nv_encoder->crtc);
> -	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
>   #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
> +	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
>   	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>   	struct nouveau_backlight *backlight = nv_connector->backlight;
> -#endif
>   	struct drm_dp_aux *aux = &nv_connector->aux;
>   	int ret;
>   
> -#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
>   	if (backlight && backlight->uses_dpcd) {
>   		ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
>   		if (ret < 0)

