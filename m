Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C27581478
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 15:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2417392CAB;
	Tue, 26 Jul 2022 13:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFBB92C8B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 13:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658843365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yx+6GZt1MNJVcGz7GTKwesVhWHXoxflnw9Q7t0FYoHA=;
 b=RIJKrKbOcPKEmzHrB0+llonv03A9LXiZvbdBJNS60d0m190iuYHH5zjIq8xjRD9/fylott
 2uMgrQviMT5wqVLN+YaOQoqa2jCJTVubvhd9Y1qKe2n/oSu2aboAN0NLxqtThhZodeq7WX
 ax/DrGJzPOD85c/wrjaf2REKsnSfkA8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-BnS8QyFIPq2k-gHcF6H-2A-1; Tue, 26 Jul 2022 09:49:24 -0400
X-MC-Unique: BnS8QyFIPq2k-gHcF6H-2A-1
Received: by mail-wm1-f69.google.com with SMTP id
 c62-20020a1c3541000000b003a30d86cb2dso10282571wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 06:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yx+6GZt1MNJVcGz7GTKwesVhWHXoxflnw9Q7t0FYoHA=;
 b=aGevJF3sDIJ3OVdAwD2FMg9O15cQPW0VXm6/a1r4gMPQ3jsvMCT4U4wj4FYxkH/HZc
 Wcn+/aOXGBqVdj7s1I0+RpuQiPY0LA7epXFs1QDdl5W9KuWXb4WsNHAj5gdBS6D5uan3
 nfGJxup1SYahSJ3mzo2ly2SOLPbp2Uz24W2xXDhJiOacctvjvO9wLmo+68z6c/11dvTx
 UnRuAUeuApFcS5X1+8NxdUCiHNb09LdYnhoBLxGMewfV5A/uh5LzaneWWTxmNhlsooYB
 nZSBWWvMB7Y+j4epf6Xp1+wzxnm2bBI1f+HiWPIEQok+4SGYf0gTQ+tvWKrlmsxFkjW3
 CvXw==
X-Gm-Message-State: AJIora+/FTi8PorJeManwyHPvlUzzICVllwGgXhf5ICFVvdxd/6nc9ly
 2S+NDAISionjtgOrUhUn1gY2tjkDqoC9r76qPCY6jPcF9Kray0FSoCMIO7wwGKAU44VGvVmd97H
 XYZd2DKYElzQo5HtvphrVB43kZtfh
X-Received: by 2002:adf:e19b:0:b0:21e:4bb9:9a14 with SMTP id
 az27-20020adfe19b000000b0021e4bb99a14mr11108334wrb.354.1658843363204; 
 Tue, 26 Jul 2022 06:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t08UKa6vLvAxqYUWQY3Aj3EC9x4jPF2Jb9qsrCmz2vWnABUqOa3+dDEQyXjEVoWWkYL7yAlA==
X-Received: by 2002:adf:e19b:0:b0:21e:4bb9:9a14 with SMTP id
 az27-20020adfe19b000000b0021e4bb99a14mr11108315wrb.354.1658843362891; 
 Tue, 26 Jul 2022 06:49:22 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c00d000b003a31c4f6f74sm25502543wmm.32.2022.07.26.06.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 06:49:22 -0700 (PDT)
Message-ID: <abe3fa95-942b-6d2f-7167-83d0cea59444@redhat.com>
Date: Tue, 26 Jul 2022 15:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-11-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Support the CRTC's color-management property and implement each model's
> palette support.
> 
> The OF hardware has different methods of setting the palette. The
> respective code has been taken from fbdev's offb and refactored into
> per-model device functions. The device functions integrate this
> functionality into the overall modesetting.
> 
> As palette handling is a CRTC property that depends on the primary
> plane's color format, the plane's atomic_check helper now updates the
> format field in ofdrm's custom CRTC state. The CRTC's atomic_flush
> helper updates the palette for the format as needed.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

> +static void __iomem *ofdrm_mach64_cmap_ioremap(struct ofdrm_device *odev,
> +					       struct device_node *of_node,
> +					       u64 fb_base)
> +{
> +	struct drm_device *dev = &odev->dev;
> +	u64 address;
> +	void __iomem *cmap_base;
> +
> +	address = fb_base & 0xff000000ul;
> +	address += 0x7ff000;
> +

It would be good to know where these addresses are coming from. Maybe some
constant macros or a comment ? Same for the other places where addresses
and offsets are used.

[...]

>  static struct ofdrm_crtc_state *to_ofdrm_crtc_state(struct drm_crtc_state *base)
> @@ -376,10 +735,12 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
>  						   struct drm_atomic_state *new_state)
>  {
>  	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
> +	struct drm_framebuffer *new_fb = new_plane_state->fb;
>  	struct drm_crtc_state *new_crtc_state;
> +	struct ofdrm_crtc_state *new_ofdrm_crtc_state;
>  	int ret;
>  
> -	if (!new_plane_state->fb)
> +	if (!new_fb)
>  		return 0;
>  
>  	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
> @@ -391,6 +752,14 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
>  	if (ret)
>  		return ret;
>  
> +	if (!new_plane_state->visible)
> +		return 0;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
> +
> +	new_ofdrm_crtc_state = to_ofdrm_crtc_state(new_crtc_state);
> +	new_ofdrm_crtc_state->format = new_fb->format;
> +

Ah, I understand now why you didn't factor out the .atomic_check callbacks
for the two drivers in a fwfb helper. Maybe you can also add a comment to
mention that this updates the format so the CRTC palette can be applied in
the .atomic_flush callback ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

