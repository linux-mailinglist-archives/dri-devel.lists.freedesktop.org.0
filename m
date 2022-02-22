Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5571C4BF3D0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4183810E3E3;
	Tue, 22 Feb 2022 08:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A73F10E3E3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645519145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d3693kv1/ZZxaK75gn4lQUgIDTiNlthARJ48UTFbBgs=;
 b=eeSPToTvU//7Km8MLlkg3/WcOMF8ML8VR/QBMR/Pho4HiNniS7tU8ZDf0hSjwHFIQCeg2Y
 FjKkMH7qiDoSMlbpwSqLpfo3uUrn9jyIh4QITBnxYao3rpkabft2EtgZ1XUpI+IBehLOYC
 u8RNIK4icY183RIoAxDcR4yRJDKdkOA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-XB5YlLRBPK2qdysdab076g-1; Tue, 22 Feb 2022 03:39:04 -0500
X-MC-Unique: XB5YlLRBPK2qdysdab076g-1
Received: by mail-wm1-f70.google.com with SMTP id
 i20-20020a05600c051400b00380d5eb51a7so239440wmc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 00:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d3693kv1/ZZxaK75gn4lQUgIDTiNlthARJ48UTFbBgs=;
 b=aDcutgwIPUUUjalJetu3CJfiPl0otA5i8wlkIN5llHROM2YEbEB/xWlPR4Y1SOsLod
 zGay/MDU120F+M07lqDFVOd2JykVOLPsffhCUPJlWxZJRox2bH93GBVNkS/WmRwOp7iE
 +QGgsnb7NhCzjvFeQ7Dpe17IsB+cuiQEGIU7KBJrnLKG7OBINLDPwTEmQZTGEfXJ48GU
 yBFR1QUt+MqwnakpbkDvPUVOcUF26yyvBxybQR4ZPhXe0fN/3R+JnIhlUe1Y4rYtwSAK
 m8xgAKqoyoux6uEp+rCO9XKF16fsmEUShkMsRC38WCKrq2pUh1u6vOHFQXOUs5aip8L+
 Hk+A==
X-Gm-Message-State: AOAM5317m2ssdiZZnbCK0vNZIECVef/K3+WiNNQ17VU8SLU4INNKniIa
 +jHHhvN4f1+nX/DoVVsEsh1+Q0bUtWoAOyeriFfytTq4cHU/qz+MLYueAcmx1AhDoG/Rl2Bt1bi
 rg1nKEmnjz9ZFBiLlidw0VR6BOlEM
X-Received: by 2002:a1c:c910:0:b0:353:2ceb:7a6f with SMTP id
 f16-20020a1cc910000000b003532ceb7a6fmr2339624wmb.7.1645519143229; 
 Tue, 22 Feb 2022 00:39:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw81XT2E0ncIyZxWQaEX+lXFOPYmh7fhE8hKxqpMYUa4jL31tkjOUrUuqQC2s+Hh7rBRx5okQ==
X-Received: by 2002:a1c:c910:0:b0:353:2ceb:7a6f with SMTP id
 f16-20020a1cc910000000b003532ceb7a6fmr2339607wmb.7.1645519143021; 
 Tue, 22 Feb 2022 00:39:03 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id t16sm2548139wrg.99.2022.02.22.00.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 00:39:02 -0800 (PST)
Message-ID: <dc8e4634-20be-409e-27a6-6497c9076605@redhat.com>
Date: Tue, 22 Feb 2022 09:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/simpledrm: Add "panel orientation" property on
 non-upright mounted LCD panels
To: Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220221220045.11958-1-hdegoede@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220221220045.11958-1-hdegoede@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hans,

On 2/21/22 23:00, Hans de Goede wrote:
> Some devices use e.g. a portrait panel in a standard laptop casing made
> for landscape panels. efifb calls drm_get_panel_orientation_quirk() and
> sets fb_info.fbcon_rotate_hint to make fbcon rotate the console so that
> it shows up-right instead of on its side.
> 
> When switching to simpledrm to fbcon renders on its side. Call the

This sentence sounds a little off to me. Did you mean:

"the fbcon renders on its side." ?

Maybe you can say something like the following:

 When switching to simpledrm, fbcon attachs to the fbdev emulated by
 the DRM core instead. And the fb_info.fbcon_rotate_hint field is set
 by the emulation layer, if panel orientation was set for a connector.

> drm_connector_set_panel_orientation_with_quirk() helper to add
> a "panel orientation" property on devices listed in the quirk table,
> to make the fbcon (and aware userspace apps) rotate the image to
> display properly.
> 
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

The patch looks good to me. Thanks a lot for fixing this

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

