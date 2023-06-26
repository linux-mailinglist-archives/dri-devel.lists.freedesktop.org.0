Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE873DF21
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A0210E0D0;
	Mon, 26 Jun 2023 12:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC1210E0D0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687782433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q7A4QtIPQ46OJKI9lflLzm3DTzPmnZrWIQG2/OeQ3hc=;
 b=ZOlgo35hKGBCoOJze6GQ03Sgcxnp+jGHJbd5I9qDAsLaqxfpy6bdNRK3pxW0NNQxywDccT
 l7flhFZsLdQunVs1C23F7OtKG05J/6S71Kbbw6TWw/pBDndhwWOCh/9m8G2Lca3ZY9G+0P
 EzuNUqUQyxQUU41/uc+0k0RvBmu8FCU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-WEIoI8s2Ni-5BlmEiq6XJw-1; Mon, 26 Jun 2023 08:27:12 -0400
X-MC-Unique: WEIoI8s2Ni-5BlmEiq6XJw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3112e243c68so2466806f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 05:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687782431; x=1690374431;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7A4QtIPQ46OJKI9lflLzm3DTzPmnZrWIQG2/OeQ3hc=;
 b=lq5IHJPa+ky4T4AVulo3wYlWYcz5CWF9741vBiHsX7HQG1T5rPbu+TfVtzuhOjBycx
 RiU1VUWxcxwmll1VMc9rnFPbtL2sgy29NRFNm693UPq71hKWo6WnJjyNPzHW61Gp6PHH
 T8VXnm9WlGlTLMRYnJqR5+vrn759ZwqQ+wdagftzbZxs0hMSOsAmK4dknpUjM34PwCrE
 rbt9l7aoYs+/JM8T184i1cEG4MZjZD25TlsLpjBH5q/XlZbJECor/eSQrolOI0IMV5Dp
 xSXONuUbRmTIF1bNq/BIgW2FRBJ49kPqPDYQWKIGmv3CL8BctQYMjH2c4R7GhX71EZw1
 /p4Q==
X-Gm-Message-State: AC+VfDzKcONAlTWGPVLTHFVxEFCGT1UCNAKyvOaEdg9RukNazUTr20h9
 KsESpolsYFysKRfsvRaus5p9hNcp88ABU/s0vGsuuACS/YsPVKuq+KPQQQudicq/wrctnJ2ODia
 NlGa5wI8+VrlUU/6TXsLsbFS4N0mwdmHvzlo/
X-Received: by 2002:adf:e98b:0:b0:30f:befc:d864 with SMTP id
 h11-20020adfe98b000000b0030fbefcd864mr25143874wrm.62.1687782431248; 
 Mon, 26 Jun 2023 05:27:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5s+xo+3GocfRAN2ddT936OL6TbSjlftKvOe/WQg4sXaYYvHxhA/vC/T+Q/4yNgIvb7WBFVgw==
X-Received: by 2002:adf:e98b:0:b0:30f:befc:d864 with SMTP id
 h11-20020adfe98b000000b0030fbefcd864mr25143851wrm.62.1687782430944; 
 Mon, 26 Jun 2023 05:27:10 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s11-20020a5d69cb000000b00313f07ccca4sm3108010wrw.117.2023.06.26.05.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 05:27:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: Re: [PATCH v3 27/38] fbdev/sh7760fb: Alloc DMA memory from hardware
 device
In-Reply-To: <20230613110953.24176-28-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
 <20230613110953.24176-28-tzimmermann@suse.de>
Date: Mon, 26 Jun 2023 14:27:09 +0200
Message-ID: <87sfaeh0iq.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Pass the hardware device to the DMA helpers dma_alloc_coherent() and
> dma_free_coherent(). The fbdev device that is currently being used is
> a software device and does not provide DMA memory. Also update the
> related dev_*() output statements similarly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

