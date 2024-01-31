Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702338443E3
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 17:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D884C10FB4A;
	Wed, 31 Jan 2024 16:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8325E10FB4D
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706717775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iHcKoZZt6H46W2k8i6AGs04g2L7Mx1lw7y6w6nwM2h8=;
 b=F+Fb9TRkeM2I+5MBMcVNHyETGxWliGsq2vCHAsRZUqy5qiz2lyTFJDIMGWAAS3y8digScw
 qkHwOTZXz/BafFed5nmhRA/74kq+vFgqPVtjxOUe1abC+NaOm+IoYEHctLzvwUrYtD246l
 ZCxd23g3IDZdaRLajAUN+9pR9WMRqGM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-SMY4FsBUM7-dudT7-lce4g-1; Wed, 31 Jan 2024 11:16:13 -0500
X-MC-Unique: SMY4FsBUM7-dudT7-lce4g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40eb06001c2so9045e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 08:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706717771; x=1707322571;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iHcKoZZt6H46W2k8i6AGs04g2L7Mx1lw7y6w6nwM2h8=;
 b=aSgdcN4wjTkFVqB4we+hHzX6twKZBOrl3H99UkZcjO1kCM+ntNGZ/IhH2euc4FjYiH
 XJdB11HiSon+Mfi0BCPj9X/aaupN3yhbwgPy9BJId3n6s+cg4Lv2QfFJ/IKFEtEsoKEW
 cmhKrtEiwHWY89HU4n2zYykGPqnxvGj5jKvhbtDNOILKQy+Zt9JzzDjr5ymcB9WugGMO
 S4WSSl4m0ffXZtJlnBlJ+1hrOnxjDAcRB9klpk3B++a7/QVlx3NPH+53auadeY8BnbOV
 aJ3l8EkL/yxJwjDwxwZXKUxuaWuMyuPUt+7jFJpFqNTisWxkQfGXLZdh+OGnYRYjjLNy
 Mt7g==
X-Gm-Message-State: AOJu0Ywt8/cTGQJq629TF4FOsJrUGOMNYkF5j4xD/0S+F0jUT0fGp+DZ
 S9uCD9cet7Y2jedT2Zoh0NO8tHLYlBm1PhP+3eMGl6DaUpvqSys/PWUVkmaD2nJMPJgzV+Hrpb3
 DDcxGgOk3nciCKFPamBXCQgrHlvENiH+OD0wXQ77R9Yh2GN3jTpV0vD3rTTH6fbLKXg==
X-Received: by 2002:a05:600c:470d:b0:40e:f656:39f with SMTP id
 v13-20020a05600c470d00b0040ef656039fmr1666490wmo.6.1706717771198; 
 Wed, 31 Jan 2024 08:16:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPXw3WDi2GZ1H+C0qsa/dAVaPD3o3y3lXbF7MCxjdMESWq9m8J99FGcFCWR0modxgMLsxfUA==
X-Received: by 2002:a05:600c:470d:b0:40e:f656:39f with SMTP id
 v13-20020a05600c470d00b0040ef656039fmr1666465wmo.6.1706717770812; 
 Wed, 31 Jan 2024 08:16:10 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUoDac0RvNodMCJs3PaWqqtOE+9dEzyxDlMMZNkLN+9Z6E/nFbEkkxrIHwfc+hSWJaNnVK7xR3Ed0cbCzcSkOg4wsj64PDZBzGJ55TAIfdOQUqkLN7RXdt8LS5U2xv19hTM73ntChGiMk6enpZZ1799Gz8DaC8PIbxx5EGjzmWMMj3MWkjDnr4A5WCVoTdePcahln+DYWmWWFW6nyhu9pxhcWV/Frc73YIhpQ==
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05600c044600b0040faf410320sm1939660wmb.20.2024.01.31.08.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 08:16:10 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: Restrict FB_SH_MOBILE_LCDC to SuperH
In-Reply-To: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
References: <c4a090bd3f4737774351b136db72b15297cd0239.1706717146.git.geert+renesas@glider.be>
Date: Wed, 31 Jan 2024 17:16:09 +0100
Message-ID: <87r0hxtr5i.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> Since commit f402f7a02af6956d ("staging: board: Remove Armadillo-800-EVA
> board staging code"), there are no more users of the legacy SuperH
> Mobile LCDC framebuffer driver on Renesas ARM platforms.  All former
> users on these platforms have been converted to the SH-Mobile DRM
> driver, using DT.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Commit f402f7a02af6956d is in staging-next (next-20240129 and later).
> ---

Makes senes to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

