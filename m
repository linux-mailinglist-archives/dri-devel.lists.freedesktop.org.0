Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183AA509FFF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 14:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C322410E4A4;
	Thu, 21 Apr 2022 12:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7198C10E4A4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650545409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ux2v84sRXgBoifWigIZ5YriL5/DGJikqCKwlI1JdvRM=;
 b=SWuSXAKA5M3Y76OjHH5vp631HHtmXYIVmafVCykHGeXfq7hYQVb52Bs2E9Re8f7ft3ODJ0
 bxNAR3XNzgeT6NV0ilIbS1yyxLLrl4kYbPry6J1HVujeATlOmSSGOpIsUxKRVopdxAfm0+
 O4H8tFfqX2yCZ8C53GQ9NckPVE7K0Yk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-kx4x42lCOj2CdP-PcfRAEA-1; Thu, 21 Apr 2022 08:50:08 -0400
X-MC-Unique: kx4x42lCOj2CdP-PcfRAEA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so2397528wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 05:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ux2v84sRXgBoifWigIZ5YriL5/DGJikqCKwlI1JdvRM=;
 b=w3UsMUnVoTWXVPBLk/PE/ZLKq+8zGEU16TTvexZPx2I9HYOBHURIlDeRs/fVVC5Uyo
 1LkhwIJRueWteWE5UD58B1i0nDN/y/sl9E1Y8vdbPx61HdowRzkCdeSsg/wfR3cDi3IN
 v4p86aiLMYqj9ruy5PXtv5HC0CZzFNgY57Xrn4oRbZLd0Ilj6rkc/aSSlLUIba2r+ZHq
 m7hOisb/l+h/GTpFIO/Cvm5qEzHCFY5IvG/5e12gKW3I6rToyZsyo6t0BOxi/IivL81S
 pP7gJgGJOo6TiIMBVLhDmES9CikiuphVoCMohlqpXTfCwb9H7bPpHspWmEjX9nR4hZou
 bihQ==
X-Gm-Message-State: AOAM531CJIp7qTFfR9XPNSBbsGh+J8lEhNTWeZNPzuFRnjTGVyCKAGkm
 y5oUDNmgo7AbxCroggN/EW7QbLqrmWoN1bdOxLj5JGb8Uh801ZgKpc4vEPPdwbICXgiefShOZf4
 jhUEfdVwv/x+8wRpbv+0cF+bFyFCA
X-Received: by 2002:a05:600c:3ac6:b0:38e:d79e:d9a with SMTP id
 d6-20020a05600c3ac600b0038ed79e0d9amr8383307wms.200.1650545407222; 
 Thu, 21 Apr 2022 05:50:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhW1wsNUBV4Y2HHNOAgb7vDbgItIU9eBq8kIrjOcLA/nxdVhNk24WkfYUim773d0uFmJUebA==
X-Received: by 2002:a05:600c:3ac6:b0:38e:d79e:d9a with SMTP id
 d6-20020a05600c3ac600b0038ed79e0d9amr8383284wms.200.1650545406948; 
 Thu, 21 Apr 2022 05:50:06 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600002cb00b0020a88c4ecb5sm2839961wry.3.2022.04.21.05.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 05:50:06 -0700 (PDT)
Message-ID: <01bf102a-a572-8a14-c424-89daa4802a8d@redhat.com>
Date: Thu, 21 Apr 2022 14:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 7/8] drm/display: Move HDMI helpers into display-helper
 module
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220421073108.19226-1-tzimmermann@suse.de>
 <20220421073108.19226-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220421073108.19226-8-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 4/21/22 09:31, Thomas Zimmermann wrote:
> Move DRM's HMDI helpers into the display/ subdirectoy and add it
> to DRM's display helpers. Update all affected drivers. No functional
> changes.
> 
> The HDMI helpers were implemented in the EDID and connector code, but
> are actually unrelated. With the move to the display-helper library, we
> can remove the dependency on drm_edid.{c,h} in some driver's HDMI source
> files.
> 
> Several of the HDMI helpers remain in EDID code because both share parts
> of their implementation internally. With better refractoring of the EDID
> code, those HDMI helpers could be moved into the display-helper library
> as well.
> 
> v3:
> 	* fix Kconfig dependencies (Javier)
> v2:
> 	* reduce HDMI helpers to avoid exporting functions (Jani)
> 	* fix include statements (Jani, Javier)
> 	* update Kconfig symbols
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Thanks for re-spinning this. The patch looks good to me now.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

