Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C95EF6E0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DD210EA91;
	Thu, 29 Sep 2022 13:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC38310EA91
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664459277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SP1+ECE0AV89nmfaEvLO6hLnVcXFCAyRq5PpNy0Zq8=;
 b=D0pP3SNXvnLwwROR3FriqLl6qO+ZUd65C/u2PaeufzqW+5NqcsuyW+ktIlP5CZuAc5HEEX
 qmQyMSHlkNZueff4I+/oAuA0ofg+g2qIc8rl1LQshvMCy0kb6/HzU8XF9ABFdR07azrn9T
 Uz7uKy0+vK5E0rgGfmF6iWac0hdHFmA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-bGGQgkPaM1yMGvrr78vCwA-1; Thu, 29 Sep 2022 09:47:56 -0400
X-MC-Unique: bGGQgkPaM1yMGvrr78vCwA-1
Received: by mail-wr1-f72.google.com with SMTP id
 e28-20020adfa45c000000b0022cc7d071b4so558701wra.23
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3SP1+ECE0AV89nmfaEvLO6hLnVcXFCAyRq5PpNy0Zq8=;
 b=Zkj+fxgctalYA98Df8a33W4jgotwgVDdbK1Yjew3JKW/DNQ3EHcsKa6oOaU3MwrcF1
 gUPStAChiL51EDmudFeIQrMdQbyXm8qrrqKgIUAVwbQi5nQXIrjLF6rvO2luNlCx4fQ8
 AuFLcz+/H40yTWTpkojK4g/QfPdLs4RwTBoFdaofR5A8mwmh/JkePgvruoXmy9gpLs1O
 wL9jO8EECunZXXPhsrQBMlQ9OTQrpEyFVYAN8VGKMn6l1ej5xmmbYL7PhBh78sbGtNyG
 9bmUwPo8sbrjxpPSZBTDMXvUY6I7okPPBcAzRbw+IjxpQEiJfeBkpPsgtWd1FB3Jswip
 osmg==
X-Gm-Message-State: ACrzQf16Yo+w8ORTIHIdVd3ofkbycMmrj0lv6iyRJ4jKE2sUACRMkjw0
 cyIeHWk8wV8sbawiV6RcZPUGfu54/B4KwJl88DETHdIzN2wktbO6Lh0bYOjCbxB1F3cW0podClq
 rApqnqi06sRBcKwX+GUcg/i1rktTu
X-Received: by 2002:a05:600c:1f15:b0:3b4:8600:fd7e with SMTP id
 bd21-20020a05600c1f1500b003b48600fd7emr11181085wmb.40.1664459274145; 
 Thu, 29 Sep 2022 06:47:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55jlSwXs7AF1AJshg5zhZYXWuXiQ6VmdmfVOY5tXaw+NtN8b5CrF3RVBEZU5K+GOr+O+exLQ==
X-Received: by 2002:a05:600c:1f15:b0:3b4:8600:fd7e with SMTP id
 bd21-20020a05600c1f1500b003b48600fd7emr11181082wmb.40.1664459273996; 
 Thu, 29 Sep 2022 06:47:53 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c19ce00b003b2878b9e0dsm4737932wmq.20.2022.09.29.06.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 06:47:53 -0700 (PDT)
Message-ID: <13e4fd15-0955-9394-f4fb-2c403cec1bb2@redhat.com>
Date: Thu, 29 Sep 2022 15:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 05/16] drm/udl: Move connector to modesetting code
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-6-tzimmermann@suse.de>
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

On 9/19/22 15:03, Thomas Zimmermann wrote:
> Move the connector next to the rest of the modesetting code. No
> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Indeed. I wondered why the connector could was special to require a
separate source code file.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

