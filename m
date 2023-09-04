Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F717917E0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 15:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D2010E353;
	Mon,  4 Sep 2023 13:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7569710E353
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 13:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693833490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rBLzSQTLv+8pipDzuuK9IQr80p06o9JPiTCzfewmJxw=;
 b=JSaCtwUapIaYsR7l6FcK6XEyuFHlAlzDnqiO4Eek9d4+nHsEvbWuDhAWkA/iuV3ED49Zpv
 +4Zyi1mp9cFMyBoDFHPfGUByd0ZA9lNlRafBtPhCgxUYviZv5A/7FXQyKJh/DmbXX1uOim
 ecO3+3TaxDJiwLl+2kpBg0nQbbzMgT4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-w-65sy0DN36MOn6epaFAVw-1; Mon, 04 Sep 2023 09:18:09 -0400
X-MC-Unique: w-65sy0DN36MOn6epaFAVw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-401dba99384so9362195e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 06:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693833488; x=1694438288;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rBLzSQTLv+8pipDzuuK9IQr80p06o9JPiTCzfewmJxw=;
 b=WW8F4oCFSuNxaRybLMC2s+BjBc9rxQCrZKd2SdweGdHmqbZfsrhWucHk8mZVEvmDNd
 7CBpkmSPDk3Qy0jezSTrH853DGPL90k+KDSF4ob247st9bi+srUgFOEqsXHBoOm9wVVH
 wVeSItOp9gI5zucB/0NDkkAMnpgKq6gjnpMCIi+t2afnFcgkeQ1Alus3OlWrpUOEEmBg
 PrwTMg3ty+V3KnAMSdFfVAtXj16pb0YrRqhXTkjAN6vXvDKMYR8zolrXMxX8K0A72pv/
 YcrJShAdyHiw0AlDUu7iKKQT7iWDhFEMy5GXNmx3q3qg2Id5+xQp7wjOKv4mQd0YYQqj
 aPUQ==
X-Gm-Message-State: AOJu0YxZ+NczZq5ewCtehVnHH/3OAd3kSXRWACTQ2i/sZ2LnAUpLcsKg
 0NcsbDGIUORVIbjzSegDRxGVsTw0RnQ2h9bswAuxu9S9uYdqct2Wq4D+sxZYJnDN8OSZDoMRRrI
 GO6mKD4dr6IyfYCIAa7LkJYOR+1RP
X-Received: by 2002:a05:6000:82:b0:31d:cd2f:4a4b with SMTP id
 m2-20020a056000008200b0031dcd2f4a4bmr6453155wrx.50.1693833488026; 
 Mon, 04 Sep 2023 06:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMneOVTl+tO7EjPHxWk7aAIbA+6YIUPO8GkkaydyT763T9pc7YLR5Hmg/1C6iUl0u80TgQ3Q==
X-Received: by 2002:a05:6000:82:b0:31d:cd2f:4a4b with SMTP id
 m2-20020a056000008200b0031dcd2f4a4bmr6453136wrx.50.1693833487752; 
 Mon, 04 Sep 2023 06:18:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f3-20020a5d6643000000b00318147fd2d3sm14498682wrw.41.2023.09.04.06.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 06:18:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Subject: Re: [PATCH 4/8] fbdev/hyperv_fb: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-5-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-5-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:18:06 +0200
Message-ID: <87fs3ucc1d.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 linux-staging@lists.linux.dev, Dexuan Cui <decui@microsoft.com>,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wei Liu <wei.liu@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(). Initialize struct fb_ops to
> the generated functions with fbdev initializer macros.
>
> The hyperv_fb driver is incomplete in its handling of deferred I/O
> and damage framebuffers. Write operations do no trigger damage handling.
> Fixing this is beyond the scope of this patch.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

