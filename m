Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B888F6BE8C2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D0010EE20;
	Fri, 17 Mar 2023 12:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E28D10EE20
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679054658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V8ovvffLrypbU/Nxh/i/+v5qxyl0UvEOHbG3UDPV2Io=;
 b=PCUJMIoUwlszWIMH+PVPaJNvzOYCT6i3tifm/c9IdLSzBE/geU0z6Hp0hBnO0F+o+oWcfA
 Nyeah6wUimbFD3fGgoOXjaN2W9VRMrHvkf7Fm5vSFbqWLVO4rbnsCj7+dDyJR3Ks9aGpf/
 bLdvAMyGwIdjGLVWh7Jb2KdXVcrrxFw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-122EwY2GOF62O0Bk9e028Q-1; Fri, 17 Mar 2023 08:04:15 -0400
X-MC-Unique: 122EwY2GOF62O0Bk9e028Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 d18-20020adfa412000000b002d43970bb80so9125wra.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 05:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679054654;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V8ovvffLrypbU/Nxh/i/+v5qxyl0UvEOHbG3UDPV2Io=;
 b=oid9sApE/pKlyswQm9wYMlVj7h1Bt73f9pye+QoaaEAeToWfbt9wv4BYyGDM4sa9td
 ivWoPaixTo+v7Q6WKs2EaOtbd2SjuXyQGTsBYVkIussQkbNx646M5NZahzn78ijSeUpK
 3u9tdm9EEwvH+vxZZmsE7c2+M4H4JAztlsIqxMiC6rGiWbLGrsg2oYNPOl8ydSk9mkGZ
 82VdfdZVW/6safj4vFDKiZSa1MF6/OG5lHaC9LakjoYhIIXxLFImS6Z9SvtjAYybtirN
 cyruv/ocULEcPyVILUGVeddWDA1jVIH5lZkQj7oeGmPT3ozPAP4bdzTJ9sKr797abJoM
 is1g==
X-Gm-Message-State: AO0yUKU310LId8NR2Vz8kMKbeB5AGqb4oJml4CQEGkSgTxYU6CdwG75U
 QQHx8S6OKwag5hr0O2S/doet2fNDrWuvy+wzi2ZHc0xd90HZ5Tw0qjdJZDENzU9zS5UZEaLTL2p
 KdrOgm4jf4UGQJeNF5IJj32hgUTQM
X-Received: by 2002:a05:600c:5104:b0:3ed:1f9c:af12 with SMTP id
 o4-20020a05600c510400b003ed1f9caf12mr19769221wms.22.1679054653862; 
 Fri, 17 Mar 2023 05:04:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set+QIWduHaB64qWKJLOnltxQJ996chR+t6zj9XdACw8D5NdD+SvEX9Wyu8HFmpfmQl1yk50B2w==
X-Received: by 2002:a05:600c:5104:b0:3ed:1f9c:af12 with SMTP id
 o4-20020a05600c510400b003ed1f9caf12mr19769190wms.22.1679054653536; 
 Fri, 17 Mar 2023 05:04:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003dc42d48defsm2127289wml.6.2023.03.17.05.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 05:04:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: Re: [PATCH 2/6] drm/fbdev-generic: Remove unused
 prefer_shadow_fbdev flag
In-Reply-To: <20230315161442.27318-3-tzimmermann@suse.de>
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-3-tzimmermann@suse.de>
Date: Fri, 17 Mar 2023 13:04:12 +0100
Message-ID: <87y1nvposj.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Remove the flag prefer_shadow_fbdev from struct drm_mode_config.
> Drivers set this flag to enable shadow buffering in the generic
> fbdev emulation. Such shadow buffering is now mandatory, so the
> flag is unused.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Surprised that there are only two drivers setting the flag. I guess isn't
a common case to have prefer_shadow == 0 and prefer_shadow_fbdev == 1.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

