Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A048519C4A
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B450B10E650;
	Wed,  4 May 2022 09:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D509910E650
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:49:32 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id gh6so1877514ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 02:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=EudcOykdh5aF3kNmm/3lXVh2DihzLVkHLlOi3J/9ZD4=;
 b=UYqTEsH9NrVsDIxj7cqtPQKsKoAFsKesTKV8JGP5cfNWi9H9IWF7GiaMTJivacY/E/
 DZw50ypWFZO19EHJdqPJkem1R1XqPfRD3lWpdKXC07Cyupfde5jGkog9CLi2kdUpeNwI
 vVDflmlAQxBz8ijf9tR6yMCK3L3lHKuhx1yBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=EudcOykdh5aF3kNmm/3lXVh2DihzLVkHLlOi3J/9ZD4=;
 b=pu2/jpRiKB3Gi9CNOQjyPOtoYwId1W2MfaQPDjQDd+LbocRvw7OKkGwGyHvIGQgk38
 XGXuj+EmpJyKCCODEVDvCUuvz9j8sPVYz0CEhVV/gAQ/hgw4gaBbgB/gg00u3OKskl0S
 0Kc0aOKmTZMAujtiQyNG1BbSnox6QIJ+HbwveNKdVkJb+geTPEC+tpXj6NYf60cCkIaC
 TRnfMwT1IRDLaYKrx7wj0CzHOBZ7lpXV/BN/z8VLWlX4XDoFpwzoMBy7Z1KE/Rgam87z
 Mac2/gwTv0GydoQTxgAXQyP2RdplePk1Vp05nfQ+5e1Ir4J7k3kUNC+YOhLu/hKaYM4n
 v35g==
X-Gm-Message-State: AOAM5322xsRm2ZhORZuLF2dk4hckNn/GD3ZFRW2zmxM3XSzIvaJZHQiW
 HZO1cqqQG1l0SgTZkQdsmjkBow==
X-Google-Smtp-Source: ABdhPJzKNOoRcoRzmHgoEyAJlwUz+TObcoN0hAPgpnytYQRMA7fjPO2bgwrXwWAH7i0yOokzYttWVQ==
X-Received: by 2002:a17:907:7fa2:b0:6f4:408a:5216 with SMTP id
 qk34-20020a1709077fa200b006f4408a5216mr14248720ejc.564.1651657771422; 
 Wed, 04 May 2022 02:49:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709070b1400b006f3ef214db8sm5431393ejl.30.2022.05.04.02.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 02:49:30 -0700 (PDT)
Date: Wed, 4 May 2022 11:49:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2] fbdev: Make fb_release() return -ENODEV if fbdev was
 unregistered
Message-ID: <YnJMKcz+C32x0sOv@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Zack Rusin <zackr@vmware.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Zheyu Ma <zheyuma97@gmail.com>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20220502135014.377945-1-javierm@redhat.com>
 <e3ce080c-8ef8-f838-d4a8-b10cd5d5c172@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3ce080c-8ef8-f838-d4a8-b10cd5d5c172@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Junxiao Chang <junxiao.chang@intel.com>,
 Helge Deller <deller@gmx.de>, Zheyu Ma <zheyuma97@gmail.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 03, 2022 at 05:28:09PM +0200, Javier Martinez Canillas wrote:
> On 5/2/22 15:50, Javier Martinez Canillas wrote:
> > A reference to the framebuffer device struct fb_info is stored in the file
> > private data, but this reference could no longer be valid and must not be
> > accessed directly. Instead, the file_fb_info() accessor function must be
> > used since it does sanity checking to make sure that the fb_info is valid.
> > 
> > This can happen for example if the registered framebuffer device is for a
> > driver that just uses a framebuffer provided by the system firmware. In
> > that case, the fbdev core would unregister the framebuffer device when a
> > real video driver is probed and ask to remove conflicting framebuffers.
> > 
> > The bug has been present for a long time but commit 27599aacbaef ("fbdev:
> > Hot-unplug firmware fb devices on forced removal") unmasked it since the
> > fbdev core started unregistering the framebuffers' devices associated.
> > 
> > Fixes: 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal")
> > Reported-by: Maxime Ripard <maxime@cerno.tech>
> > Reported-by: Junxiao Chang <junxiao.chang@intel.com>
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> Applied to drm-misc (drm-misc-fixes).

See my other reply, but how does this not result in leaks?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
