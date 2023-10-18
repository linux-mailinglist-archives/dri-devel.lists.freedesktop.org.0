Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A37CD62A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 10:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1484D10E3B3;
	Wed, 18 Oct 2023 08:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F35910E3B3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 08:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697616967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jmZc6Q4WePRTx40QodA4tT/WlA97DXcd06bFoFktVdU=;
 b=OABB7TV/AMr8RnI7w5pl4uTp+uj24A2yPPM/2No7qNV0cq6iOKTrlNZ9Lnjaq0K8QYCSm3
 T0JjMRijatbaxfz6mh7yTCXSpEtl7rbEZWUkIJ3ihKcY1duAPRP4DLtCEcp55ianQNMYdt
 PRXmsuuOUE+x/VimA7VR8Qcfb7KhtOc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-42qgIu4lMEaKw_tsS-V0CQ-1; Wed, 18 Oct 2023 04:16:05 -0400
X-MC-Unique: 42qgIu4lMEaKw_tsS-V0CQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-507bd5f4b2dso1598641e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 01:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697616964; x=1698221764;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jmZc6Q4WePRTx40QodA4tT/WlA97DXcd06bFoFktVdU=;
 b=RRz69Rx/aAnmtCVcD72SgvY5dk5aEZCSsdj33jpM8ci+yFq6u5PwvTK8KYRRZp952z
 RtjOlJPk05GnCwtuYsN92AI7GyR9MvquTvzUlkzvPtKbdmUOiD7nAFL34zT9h1sDYmwo
 ILJU38n45MZwBSA9zrGK0LgnGzyN+yJ326ckSSthr7klLISar/PiKavjzHOSAufVtyTx
 pbV3cRMvylpJpKFt/PBQL5Ak8qsvHJRZqSSVo2I8a8hPANCsz6t5TR2yHPUZcezw0DsU
 ibqrFBDCgASDyFDnybFLSMdOgh4qFxaK2BkEdwd/vCjyjJC760wzCenBUmLeefF2RwKg
 YP5Q==
X-Gm-Message-State: AOJu0YwVbHDuNX91MA9ncyqi4js8uFxj6Q4rwVUcfYeit1XQ9VABbA5I
 VtLGXu886L3qV4ZXTUeQgWtu8OOn6WnjOmBsUXptg3aYQBmt+dlmdP9+h5XS9vpK482b/Regvga
 DPV2jqnNh+CikCcBYee8Y5VJ21BWuOd+U0jJN
X-Received: by 2002:a05:6512:1589:b0:503:28cb:c087 with SMTP id
 bp9-20020a056512158900b0050328cbc087mr4387856lfb.29.1697616964195; 
 Wed, 18 Oct 2023 01:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYatw1+GQZsrovTtK4AIM0GHdCZTQtrZMNluODtTEfilpBoqjDMDouescfpJJZYj44ekzDvA==
X-Received: by 2002:a05:6512:1589:b0:503:28cb:c087 with SMTP id
 bp9-20020a056512158900b0050328cbc087mr4387842lfb.29.1697616963899; 
 Wed, 18 Oct 2023 01:16:03 -0700 (PDT)
Received: from localhost (210.red-80-36-22.staticip.rima-tde.net.
 [80.36.22.210]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b0040813e14b49sm988670wmo.30.2023.10.18.01.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 01:16:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 sam@ravnborg.org, arnd@arndb.de, daniel@ffwll.ch
Subject: Re: [PATCH 01/46] fbdev: Provide I/O-memory helpers as module
In-Reply-To: <20230927074722.6197-2-tzimmermann@suse.de>
References: <20230927074722.6197-1-tzimmermann@suse.de>
 <20230927074722.6197-2-tzimmermann@suse.de>
Date: Wed, 18 Oct 2023 10:16:02 +0200
Message-ID: <87a5sgqrb1.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hello Thomas,

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Provide helpers for accessing I/O memory in a helper module. The fbdev
> core uses these helpers, so select the module unconditionally for fbdev.
> Drivers will later be able to select the module individually and the
> helpers will become optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

