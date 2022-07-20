Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4480257B2AB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFA611AEA9;
	Wed, 20 Jul 2022 08:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA6D11AE39
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658305050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gST01fHXaGxoraxRgsLmVGiY1FQL1pfbHNUK3nEarcs=;
 b=RVoN3GXGVyoOQNW/y+8DGeDoM81K/5qRxLWiiuxaXYOhwnJYzGzbCTIiegE8SJgaX1zMDs
 pRqY7dMAYRJEpFNantGmgbZ+KtGbTR1ztxqXP6SdCBbEmRD26un04a68fUvqVajM55+/kO
 /3v0bWPUye8Q92v1Q4Xd5pbo6C8mH/M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-5WaJYSg8MaOw-3F8g8mJ8g-1; Wed, 20 Jul 2022 04:17:26 -0400
X-MC-Unique: 5WaJYSg8MaOw-3F8g8mJ8g-1
Received: by mail-wr1-f71.google.com with SMTP id
 q9-20020adfb189000000b0021e3e7d3242so757061wra.19
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 01:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gST01fHXaGxoraxRgsLmVGiY1FQL1pfbHNUK3nEarcs=;
 b=ORBWA1pJeTvd/t8/3MPBnItq36M21hU84S5o1nviZWnlKLpJ4ixYAJuH+Zaqeipp7Y
 dKhWQgffA+tzi9uEG/BVToCNmSS3BJYpZ+IwCUNXe9UwKVh7E+kFxFCrUKvXlh/sQO1H
 sheVdI08InIz/V6UaRh98xIFpkjPypOVNrfU+xq1M8/UFO6MOLNOz8Tm/ugDYZHYsPK3
 cnLEsNOWUMAd0mi+fGTmY7cxeP4ox+X5D5NsSPnMd8lYlpa894DKayERJu5kaDw1IFPL
 pELBssh1JhNzuc+ROUlrSwZjzIQ2FXnhZ/GvL50I15yEE5FL3EIFRClpuB1AO99xU93f
 USNA==
X-Gm-Message-State: AJIora/aRF3vMDqm8kK4TiYW5hmxiIFLoR8kAmLmJDRRgct3utuKGH63
 wqDSjX44hwDiZRgUotZAW1rMtvKNu/XkyQEt3qD/Nx5QyrmOGcZxlnjIfh2nYqtFjXSuSQt0bQk
 8jEujFP8zgIc1ly5StnIKZ31Nf/Gd
X-Received: by 2002:a05:6000:156e:b0:21d:c50a:7cdb with SMTP id
 14-20020a056000156e00b0021dc50a7cdbmr24517984wrz.16.1658305045401; 
 Wed, 20 Jul 2022 01:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1slDXWpc44VXI0CFQyQ8zKfya2Pg6IB9/4n+2TfxxIYFZNiwC+IsYgNC2PQfpuubAs3bCfK+A==
X-Received: by 2002:a05:6000:156e:b0:21d:c50a:7cdb with SMTP id
 14-20020a056000156e00b0021dc50a7cdbmr24517970wrz.16.1658305045147; 
 Wed, 20 Jul 2022 01:17:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:a93:d5b7:8c91:f8dd?
 ([2a01:e0a:d5:a000:a93:d5b7:8c91:f8dd])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adfcd83000000b0021e437fabd8sm2683243wrj.69.2022.07.20.01.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 01:17:24 -0700 (PDT)
Message-ID: <ff31024f-72c7-633a-feec-d8c74d99557e@redhat.com>
Date: Wed, 20 Jul 2022 10:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 08/14] drm/mgag200: Set SCROFF in primary-plane code
To: Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org,
 airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220718092753.9598-1-tzimmermann@suse.de>
 <20220718092753.9598-9-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20220718092753.9598-9-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2022 11:27, Thomas Zimmermann wrote:
> The SCROFF bit controls reading the primary plane's scanout buffer
> from video memory. Set it from primary-plane code, instead of CRTC
> code.

I'm a bit concerned about the performance impact of this patch.

Previously, the SCROFF bit and msleep(20) was done only when 
enabling/disabling display.
With this patch, it will be done for each frame, which will negatively 
impact performances.

--

Jocelyn
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 33 ++++++++++++++------------
>   1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 39509dd84b23..789e02b8615f 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -550,7 +550,7 @@ static void mgag200_g200ev_set_hiprilvl(struct mga_device *mdev)
>   
>   static void mgag200_enable_display(struct mga_device *mdev)
>   {
> -	u8 seq0, seq1, crtcext1;
> +	u8 seq0, crtcext1;
>   
>   	RREG_SEQ(0x00, seq0);
>   	seq0 |= MGAREG_SEQ0_SYNCRST |
> @@ -564,12 +564,6 @@ static void mgag200_enable_display(struct mga_device *mdev)
>   	mga_wait_vsync(mdev);
>   	mga_wait_busy(mdev);
>   
> -	RREG_SEQ(0x01, seq1);
> -	seq1 &= ~MGAREG_SEQ1_SCROFF;
> -	WREG_SEQ(0x01, seq1);
> -
> -	msleep(20);
> -
>   	RREG_ECRT(0x01, crtcext1);
>   	crtcext1 &= ~MGAREG_CRTCEXT1_VSYNCOFF;
>   	crtcext1 &= ~MGAREG_CRTCEXT1_HSYNCOFF;
> @@ -578,7 +572,7 @@ static void mgag200_enable_display(struct mga_device *mdev)
>   
>   static void mgag200_disable_display(struct mga_device *mdev)
>   {
> -	u8 seq0, seq1, crtcext1;
> +	u8 seq0, crtcext1;
>   
>   	RREG_SEQ(0x00, seq0);
>   	seq0 &= ~MGAREG_SEQ0_SYNCRST;
> @@ -591,12 +585,6 @@ static void mgag200_disable_display(struct mga_device *mdev)
>   	mga_wait_vsync(mdev);
>   	mga_wait_busy(mdev);
>   
> -	RREG_SEQ(0x01, seq1);
> -	seq1 |= MGAREG_SEQ1_SCROFF;
> -	WREG_SEQ(0x01, seq1);
> -
> -	msleep(20);
> -
>   	RREG_ECRT(0x01, crtcext1);
>   	crtcext1 |= MGAREG_CRTCEXT1_VSYNCOFF |
>   		    MGAREG_CRTCEXT1_HSYNCOFF;
> @@ -676,6 +664,7 @@ static void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	struct drm_framebuffer *fb = plane_state->fb;
>   	struct drm_atomic_helper_damage_iter iter;
>   	struct drm_rect damage;
> +	u8 seq1;
>   
>   	if (!fb)
>   		return;
> @@ -688,11 +677,25 @@ static void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	/* Always scanout image at VRAM offset 0 */
>   	mgag200_set_startadd(mdev, (u32)0);
>   	mgag200_set_offset(mdev, fb);
> +
> +	RREG_SEQ(0x01, seq1);
> +	seq1 &= ~MGAREG_SEQ1_SCROFF;
> +	WREG_SEQ(0x01, seq1);
> +	msleep(20);
>   }
>   
>   static void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
>   							struct drm_atomic_state *old_state)
> -{ }
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct mga_device *mdev = to_mga_device(dev);
> +	u8 seq1;
> +
> +	RREG_SEQ(0x01, seq1);
> +	seq1 |= MGAREG_SEQ1_SCROFF;
> +	WREG_SEQ(0x01, seq1);
> +	msleep(20);
> +}
>   
>   static const struct drm_plane_helper_funcs mgag200_primary_plane_helper_funcs = {
>   	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,

