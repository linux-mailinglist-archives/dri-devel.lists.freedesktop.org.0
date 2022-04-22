Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA9E50B73E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 14:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CED510F71F;
	Fri, 22 Apr 2022 12:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9C710F71F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 12:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650630481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CNDvWU5RlZ4z8JjHIJ5SOMcU5Ktuaai0wTiR+sfp/mE=;
 b=A3AZaSFBcmHImmMGx78vfY93ukKog+IEa3KDodqnlg+umVlLPtHoqeflSIpbdIz0I2Y4Q3
 BzhoRjoB1/Ag4mPUl1tqn4VXwERQenY2gBV16pJpeHtxUZ8SEQHJap+coEI8FIHyxgWtjq
 PPHiTGegKl3YzaZD1POv58G/LmR4cK0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-mxPNjcypPqqWnun2f0rS1w-1; Fri, 22 Apr 2022 08:27:52 -0400
X-MC-Unique: mxPNjcypPqqWnun2f0rS1w-1
Received: by mail-wr1-f71.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so566962wra.15
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 05:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CNDvWU5RlZ4z8JjHIJ5SOMcU5Ktuaai0wTiR+sfp/mE=;
 b=kbBPXMC5PPVm2P/ikLdLBgG0+byEJNBxvOvHrS51WMZtZGSylMuPZGjMiZt4Ca3rqW
 wpiZDlPsTToyalKhV04o7sQr7NIhkI8sz8HHTIK3/6zO7n+kRTN8y9AMEBPH1rBH+ery
 fFMOcD8Xc/cYqUgb33LLrkTjlm16lQI6HLagXcREzlkUqFRoFGkJw7oHRne+XrE0L7qp
 GqsXolHBasl7Q5Ywf9+JDkLCEOCQSZZlQH5YzPM3IlYtip3tOMblGa1ESBwL61dAYL86
 ZDPbAQP+G2hQfeeWYiXzROIVDVF8HpkMSuFnt4ydadY/pSoN5Z2+rfYzGp1b1ma9AXyC
 Cing==
X-Gm-Message-State: AOAM533CfrYsyTnuMOG6pkBkahBj4k+TMtVLMopD3Ujlrr4XJN1D+hIf
 9Tzy+HTzxscFqmHDgW1xlNetEwJ4LTqS2QpSjjsrSqyRRVEv4q3AHpzHsGSg5h9rwg8AZkulNWE
 ktX9B1BbTb7DG4vS/8g/yfyWkM5mZ
X-Received: by 2002:adf:8b10:0:b0:20a:b1af:5597 with SMTP id
 n16-20020adf8b10000000b0020ab1af5597mr3670115wra.677.1650630471447; 
 Fri, 22 Apr 2022 05:27:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNPakpeVxRpaZ+D8Lnc+KVm1aJ5cSvrIWhGAwhArvzsKWpq/dk4LwpaIXhb2LIW3Or4qQnDQ==
X-Received: by 2002:adf:8b10:0:b0:20a:b1af:5597 with SMTP id
 n16-20020adf8b10000000b0020ab1af5597mr3670095wra.677.1650630471244; 
 Fri, 22 Apr 2022 05:27:51 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b003928adfe47dsm4612772wmq.3.2022.04.22.05.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:27:50 -0700 (PDT)
Message-ID: <0e6e6c92-d126-454e-d9f6-a594cb42f0e3@redhat.com>
Date: Fri, 22 Apr 2022 14:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/3] drm/format-helper: Add RGB565-to-XRGB8888 conversion
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tiwai@suse.com, tamara.schmitz@suse.com
References: <20220421181722.13936-1-tzimmermann@suse.de>
 <20220421181722.13936-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220421181722.13936-4-tzimmermann@suse.de>
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

On 4/21/22 20:17, Thomas Zimmermann wrote:
> Add a format helper that converts RGB565 to XRGB8888. Use this
> function in drm_fb_blit_toio(). Fixes simpledrm output for this
> combination of formats.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 46 +++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)

Same comments than for patch 2/3.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

