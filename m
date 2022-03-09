Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3024D2F8B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 13:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C1E10E5B6;
	Wed,  9 Mar 2022 12:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB4B10E5B6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 12:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646830683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkHeos7H6tsu7tvMZnCFYXnCg8oFI8g7rvfuV0EJ3JA=;
 b=X8/Jri6eTuZ4p8PhUQmgsNFuj5slbm+Z8sKzHEAarUi2ZAdv7s2wGIoIOKwX5CJeWZDm0v
 CfVkBqySMndJ/8o8iAPJorQEHIQLQ5yX7M21Ux9WuKxAPXguuIkZSzWBzszejH9Dd3+0aY
 aXWgL4qGozxCjU0//j5pVM5hfmjuE3o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-wkyjNQlhOlWMLTCx98kfGg-1; Wed, 09 Mar 2022 07:58:02 -0500
X-MC-Unique: wkyjNQlhOlWMLTCx98kfGg-1
Received: by mail-wr1-f72.google.com with SMTP id
 t8-20020adfa2c8000000b001e8f6889404so739071wra.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 04:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dkHeos7H6tsu7tvMZnCFYXnCg8oFI8g7rvfuV0EJ3JA=;
 b=aMy8t5Gfk5Ol7arjFIx8GuXAg9gzQtSbIxHmPVGAOxr7jRiLwHqz+iiZd3h4EJuJvO
 MKZtpRg2+Lhb6EaZtu5Wy3ONBeFRw+8GV2ecBPwoqrgbi+WPiYRL1U7BpTHfnWEOnUDg
 nuDCOBKQ8f2HVnukgG3Joe0vyZdqfWS6pQeg1EhnT2UEbhMPkTja0TsvWyKqUceP3O9d
 BY80Rrrof76fNYl9liXysEJVBm35Ps4zZ7emiPzNCZm15P7xV9twGByM+d7zh8I+x4qD
 iN1Nw6r40H+fCinET8be8Cu93L6EoVX3/pCzINawxHCNSw4E7KWAbtH2XFCRPDk0wDNC
 DCaQ==
X-Gm-Message-State: AOAM533bMHHAgEs9gcvnpOFNOYCKoKioAu//oMH78vt/6ZSRu0Njm75q
 t+KmJ4CJtSJG7y/qOWGwrKRCw7TOCINgtq+tIaI8+5ppOC8yYB2HACtyigwoPuSVUl6tFGp7+dz
 kfLE3HzjVOwtkr/dC2n7Ho+GbBFK+
X-Received: by 2002:a05:6000:186c:b0:1fa:a8d:28f4 with SMTP id
 d12-20020a056000186c00b001fa0a8d28f4mr9173039wri.518.1646830680808; 
 Wed, 09 Mar 2022 04:58:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQnlg34BxAEh7TU1fkV4DgVunPqC5uWpf/4h/80ydvuzxxGu4LUiZbBIWm+zCntOJ+szdncg==
X-Received: by 2002:a05:6000:186c:b0:1fa:a8d:28f4 with SMTP id
 d12-20020a056000186c00b001fa0a8d28f4mr9173018wri.518.1646830680553; 
 Wed, 09 Mar 2022 04:58:00 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 u10-20020adfa18a000000b001f04c24afe7sm1641218wru.41.2022.03.09.04.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 04:58:00 -0800 (PST)
Message-ID: <1de701d9-4de6-4652-d33d-95d82860bed9@redhat.com>
Date: Wed, 9 Mar 2022 13:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/10] drm/fourcc: Add DRM_FORMAT_C[124]
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
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
> Introduce fourcc codes for color-indexed frame buffer formats with two,
> four, and sixteen colors, and provide a mapping from bit per pixel and
> depth to fourcc codes.
> 
> As the number of bits per pixel is less than eight, these rely on proper
> block handling for the calculation of bits per pixel and pitch.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

