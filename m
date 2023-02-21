Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7162669DC88
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 10:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A9610E49F;
	Tue, 21 Feb 2023 09:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998BD10E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676970334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vLO7qlrl7G3WLC98Blc1ukzpXSL0cYKkTFHMqMI94uU=;
 b=Sosa4m83RdHJMH0kx3YH9GCV8Fanpu5L4aYJiYbp+VBAY18hNcaEiUc8UO/yWIMx+FVLwb
 5Y/dnYRjV/ysdb7L4qwwTw/lgqqDpwDQHLcFoYNq9W/Y0/JsxffN65A8eG3mbloZcRbiNh
 JkohbfHiDIQZn1MhEEs6G9xrTGhXaJ8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-hOltEkWKNJibqmIuH6IDng-1; Tue, 21 Feb 2023 04:05:33 -0500
X-MC-Unique: hOltEkWKNJibqmIuH6IDng-1
Received: by mail-wr1-f71.google.com with SMTP id
 bp30-20020a5d5a9e000000b002bde0366b11so771521wrb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 01:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vLO7qlrl7G3WLC98Blc1ukzpXSL0cYKkTFHMqMI94uU=;
 b=lrIG8ceoskf2gXBMF12HXeevR/fbntDpld1VgABVYMt65r09UiTIxZMI7Hf0bkwIwy
 D3Z3OoFYDEhEJgHfTvOm5XSw8BWR96xGU1Qd2OrDRvY+/643You1/LytGBnZlgkXIt5I
 p9KefcXWoAig1oyx3XY27sRmwzRvqxESLunPKkXt0st0n175wjTolr9DGXxMnkgTIhq+
 MBeD47bF1qm10ZWLedaKQiM9/5AczaToEzp0QarmUd47/WF1J69c9OWNEdXSud3oieRU
 OdmnbocCybzGISL81kVLxoWI9a6WdgNXiVNTCDV3mQq+rTx9L2aos+HcnXyh+Ei49MbU
 S2Jw==
X-Gm-Message-State: AO0yUKVTMx/uwa89Fqqz7oUpXFEPZZCW8YKdzXzQhXfU6fJT14yhNcOg
 lQLHgGPHwHO7uZhcmQx/AqHmYUVQtUvkgqUVP1Ku7Mc+RqupAdp1XugY6ktmSIH/8kSgaSc6LgZ
 rnK3tNOtskWTj4uzKFzAOwJvjy0Hv
X-Received: by 2002:a05:6000:18cc:b0:2c3:f00c:ebaa with SMTP id
 w12-20020a05600018cc00b002c3f00cebaamr3925389wrq.4.1676970332233; 
 Tue, 21 Feb 2023 01:05:32 -0800 (PST)
X-Google-Smtp-Source: AK7set86Z+A3pyDWa4XzYy3Zvj+S/7V7InMaIYq3KLbi/sHbQspfUsqPkmAK84ZJdPSx9ZmEhmFFyw==
X-Received: by 2002:a05:6000:18cc:b0:2c3:f00c:ebaa with SMTP id
 w12-20020a05600018cc00b002c3f00cebaamr3925373wrq.4.1676970331936; 
 Tue, 21 Feb 2023 01:05:31 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w6-20020adff9c6000000b002c5493a17efsm848137wrr.25.2023.02.21.01.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:05:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/6] drm/mgag200: Remove disable handling from
 atomic_update
In-Reply-To: <4c8f2bc5-df12-4baa-4b22-5d0275a7cac4@suse.de>
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-4-tzimmermann@suse.de>
 <87lekwifta.fsf@minerva.mail-host-address-is-not-set>
 <4c8f2bc5-df12-4baa-4b22-5d0275a7cac4@suse.de>
Date: Tue, 21 Feb 2023 10:05:30 +0100
Message-ID: <87a6175qxx.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> This mail never made it to dri-devel.
>

Oh, sorry about that. It seems that your response wasn't enough for
patchwork to pick the tag, so:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

