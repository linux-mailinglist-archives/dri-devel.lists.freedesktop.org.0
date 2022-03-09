Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E514D2F76
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 13:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D831610E90B;
	Wed,  9 Mar 2022 12:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6560710E90B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646830321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MVrNBje8P4Tjl99yqsqfstxvyHvyJTjfoJ0XzHjnkFs=;
 b=D/h0QdLTqCltFn4tCI/Y0v+vGfga3W6t8+RXLH/+YO77eUfTJJx9LSGUPhXcsk5oR1d2QY
 OVeU6TpaMczzKdKksH+PHSoLk0YAuBlja0JdOLx6RG2xQZMvflMBM80n8LVCSi9h4taCxH
 2T3jw6h+WQirZ2d6m4nSUirkOO7fjFg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-kKl1iuJdM0G0XlHLPnGUvA-1; Wed, 09 Mar 2022 07:52:00 -0500
X-MC-Unique: kKl1iuJdM0G0XlHLPnGUvA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k41-20020a05600c1ca900b00389a2b983efso758368wms.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 04:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MVrNBje8P4Tjl99yqsqfstxvyHvyJTjfoJ0XzHjnkFs=;
 b=garMuVLmC0PaKdiAk05/FTi+Hq3MGM5+jdO1PILVZ8lfbMzghxh0x37taivxfTCfmG
 PyBCasGDwAwQgPNkiNnlQvCnEgGYDhwkmq1ldUlibIGIenQ4QYqc8n1VvgwCxs51w0WH
 i9y/yeNReDEWNx7EkaOfO6vcUlMmk4nei7hRNhpg2H0cxWVs4+BF4i1+8QrNZj1aLzLl
 R0Joo4CkoP8A4n4p13tK5lBpvKEI80dVPlvDnPTrEYsgqua8NLb/cAomO3V3s1LhOmAU
 ajL3LELspif0mfiCHH3emOpnlnOHE2+psv5c7am0RUwuABdO6aLeYLnKpDTdUz1ZYu3d
 4ZHg==
X-Gm-Message-State: AOAM533+zugCKfpbxHP4eJohiSiFnl1cjFrNFUIv028TqwavEqEg8iGc
 YtwQVg8Y2TrZLtAiylO9rEvG30Gi2hcHaVMGGEJ6G2cg8RXGiwRQtzqj1WJ5tp1/k5SQdtk6m2X
 cMgxgwJaemY+RYg89OL465WVqlh2Q
X-Received: by 2002:adf:8b9e:0:b0:1f0:25ca:6d81 with SMTP id
 o30-20020adf8b9e000000b001f025ca6d81mr15523232wra.247.1646830319032; 
 Wed, 09 Mar 2022 04:51:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznCED2hDWfMPlEh09LTikM9n8nFo++5o/PkgFE4Sete3s/9brY/cGIrZsveiDmJHMiONU+4Q==
X-Received: by 2002:adf:8b9e:0:b0:1f0:25ca:6d81 with SMTP id
 o30-20020adf8b9e000000b001f025ca6d81mr15523208wra.247.1646830318754; 
 Wed, 09 Mar 2022 04:51:58 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056000170200b001f1e16f3c53sm1643997wrc.51.2022.03.09.04.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 04:51:58 -0800 (PST)
Message-ID: <d7a8d183-fe2b-99b1-9730-eddb040f6d1e@redhat.com>
Date: Wed, 9 Mar 2022 13:51:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 03/10] drm/client: Use actual bpp when allocating frame
 buffers
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <8f29a983d42d9d68bd8cae2f9481d3c139f8750a.1646683502.git.geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8f29a983d42d9d68bd8cae2f9481d3c139f8750a.1646683502.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> When allocating a frame buffer, the number of bits per pixel needed is
> derived from the deprecated drm_format_info.cpp[] field.  While this
> works for formats using less than 8 bits per pixel, it does lead to a
> large overallocation.
> 
> Reduce memory consumption by using the actual number of bits per pixel
> instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

