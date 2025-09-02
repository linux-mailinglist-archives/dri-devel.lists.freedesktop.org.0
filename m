Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC146B3F865
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F109C10E2A5;
	Tue,  2 Sep 2025 08:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VyuYdJf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB0210E2A5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756801852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wBDSSqe7FlRUs9+SC96WEURGCZ4RIAlgXMeG6XQaDTc=;
 b=VyuYdJf3zuSpTCdlfAlfJmuosNHlfjAklAO4KzhwFDML8bhjESsD+fHyG0NvL4XYj8MIAA
 iZzwYi/i+FTDwf8a19HbpzExQQqbjze3MKCRSkBYvzpuZI7QcMPFH9/xN0e0YFAcAWd2Qj
 De4hAo5KTvw26geL+iPtxXXX9JhlSyk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-4ZTU7DVVPdihwfwU3xF8bg-1; Tue, 02 Sep 2025 04:30:51 -0400
X-MC-Unique: 4ZTU7DVVPdihwfwU3xF8bg-1
X-Mimecast-MFC-AGG-ID: 4ZTU7DVVPdihwfwU3xF8bg_1756801850
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b9c1b74e1so741315e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 01:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756801850; x=1757406650;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wBDSSqe7FlRUs9+SC96WEURGCZ4RIAlgXMeG6XQaDTc=;
 b=HXhv0uj42zqUjsTq1exc8+5BUfjcDHXkYiwCeUQlsGN5crITn/EQFqPGuCaTrbRQ64
 aiboQTESpkOJwy4Kw3Bw9oaVO/4k6cMQd2AZgOdzyf73crLGX2aiBfQfDRmmcUS1gKog
 59+qyKg72ijYgBT/TXKVmflxaYQXPt51Hdm3kyE/0eUkFHeox3AzuFonrTk9fLychv8J
 SWY5eMVkn6DEoSGzAxEEL82vUJhCuKUBi4gvxklJV+dfb5WeK2mp0E4sig1Dh1Ho9Jns
 SP0RpXpBDAngQla+m5X42Cgfnws1D78xldZgS6ipd5mGK6qPmJrqDeKKWnww7YS5nsAz
 MFlA==
X-Gm-Message-State: AOJu0YxggDkn2lrCJhlrlzs57ZdYA58szdMIgu5yTohgwOeuKA+I2Qc/
 c7BEU25ZmLASK/3ljihQepQjeOE3Lf67MVnorAjhSsj59C9IpwrqKgrzg3bUrhleKp+qK2KhQKY
 nsvkTdYeOmOS/gpKaW7emDZPHSPg1g/mN3olaOge1BKUW8eB5ui3L7DC+0WadAgpQvldzwg==
X-Gm-Gg: ASbGncsWrK4iphxia3bs9nuMSJVG5k+TeP5yL3LTt1hHy84lG56n0iqVkj12ws27INL
 STNWiwgq2YvmG8y4ehTGK7kxiP7mZ8NWlU4Qsq2bElT18n+Jq+PCH9103GvK9txgMiZV2wnotUl
 34eXQ2MKjaW/Q1A1EQutB9fVuwrGFZOuPRTV8GhrRd69t7+rAmh35okw5sCf3D8+H3st83ADRwR
 pJt6NNe34HOu7FEOpEoydZJvkBzneQeZBnEReQEKbk2smm4heou0If4QcQ7oyixECAr3GXThPof
 04ZqiXwDsgmXrDA6LvtewSwjcCANhWeAvT2/cCE5sVSZv/kV6M7wrwZ4ZbcrRMzz8g==
X-Received: by 2002:a05:600c:3546:b0:459:dc99:51bf with SMTP id
 5b1f17b1804b1-45b8557b680mr79202005e9.25.1756801850441; 
 Tue, 02 Sep 2025 01:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWmHoeM9KLNr4xLRGpC+I67NSwblsrUmvfFZ3jbasJi4/F9OPw9jkHBjQ2+LXy77Bbp1fslA==
X-Received: by 2002:a05:600c:3546:b0:459:dc99:51bf with SMTP id
 5b1f17b1804b1-45b8557b680mr79201735e9.25.1756801850013; 
 Tue, 02 Sep 2025 01:30:50 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e68c83asm200349405e9.20.2025.09.02.01.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 01:30:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, louis.chauvet@bootlin.com,
 drawat.floss@gmail.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 mhklinux@outlook.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/4] drm/hypervdrm: Use vblank timer
In-Reply-To: <20250901111241.233875-5-tzimmermann@suse.de>
References: <20250901111241.233875-1-tzimmermann@suse.de>
 <20250901111241.233875-5-tzimmermann@suse.de>
Date: Tue, 02 Sep 2025 10:30:48 +0200
Message-ID: <87a53dfe87.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h9LNo9MDS7TeGh9WDzLZNsczNBZhC_BiwAnCOhuFFAc_1756801850
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> HyperV's virtual hardware does not provide vblank interrupts. Use a
> vblank timer to simulate the interrupt. Rate-limits the display's
> update frequency to the display-mode settings. Avoids excessive CPU
> overhead with compositors that do not rate-limit their output.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

>  
> @@ -111,11 +113,15 @@ static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>  				crtc_state->mode.hdisplay,
>  				crtc_state->mode.vdisplay,
>  				plane_state->fb->pitches[0]);
> +
> +	drm_crtc_vblank_on(crtc);
>  }
>  
>  static const struct drm_crtc_helper_funcs hyperv_crtc_helper_funcs = {
>  	.atomic_check = drm_crtc_helper_atomic_check,
> +	.atomic_flush = drm_crtc_vblank_atomic_flush,
>  	.atomic_enable = hyperv_crtc_helper_atomic_enable,
> +	.atomic_disable = drm_crtc_vblank_atomic_disable,
>  };
>  

I think your patch is correct due the driver not having an .atomic_disable
callback. But looking at the driver, I see that its .atomic_enable does:

static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
                                             struct drm_atomic_state *state)
{
...
        hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,
                                crtc_state->mode.hdisplay,
                                crtc_state->mode.vdisplay,
                                plane_state->fb->pitches[0]);
}

and this function in turn does:

int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
                            u32 w, u32 h, u32 pitch)
{
...
        msg.situ.video_output[0].active = active;
...
}

So I wonder if it should instead have a custom .atomic_disable that calls:

        hyperv_update_situation(hv->hdev, 0,  hv->screen_depth,
                                crtc_state->mode.hdisplay,
                                crtc_state->mode.vdisplay,
                                plane_state->fb->pitches[0]);

I'm not familiar with hyperv to know whether is a problem or not for the
host to not be notified that the guest display is disabled. But I thought
that should raise this question for the folks familiar with it.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

