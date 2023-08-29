Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA578C0B4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 10:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DF710E1B3;
	Tue, 29 Aug 2023 08:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A58810E1B3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693298694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m7vrRIgvkMc8vEJcRG5fVY17VaUCcvlpWh8mJG998ig=;
 b=Ya75VUcjp6mydPPYtDYYd7IdVSpe1L38G3jNdHAc018K/nY0F7i5Ks51UpXBc0fyB3Q8/6
 KIliJcIztc3Fzh08hcMPimCRB1wXAHVS3WoWa58Hmv3orH9DEkYfEFfU8SqnLsy7gy8P3Z
 axqGSEhRv1YjZu0xE+MPgbXbXRYu/FA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-ub0hlZ_BOMCkAoOjHj7Nhw-1; Tue, 29 Aug 2023 04:44:53 -0400
X-MC-Unique: ub0hlZ_BOMCkAoOjHj7Nhw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31aef4011cfso2887458f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 01:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693298692; x=1693903492;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m7vrRIgvkMc8vEJcRG5fVY17VaUCcvlpWh8mJG998ig=;
 b=lwLuucgN8gpqdmSwHiFGdlXfUeN8BmQXa/TXYp3ZJhkjdaOagQyCwXhqqZ4ud97Md6
 k+f6RmANALJMH0GGyRj10XEy2wdvt95BA8LhV8sMhZOThwYPZDRDyMZPSMuaLDWYPsnt
 2To3k573FklLr3xJC0W7L3k/TB/f66+HEPCkSUKn/n6uxvgIDBcaqxaOUAN08BuNT/Un
 X4daplD6m3a6ih2w7fotuw7KukhekYPPCvNfCvrIUdXbYSTXPzB+VupZO+IhEvaFnrYd
 rSbF9rAXX8del/oPg1g/jND1+FZVvRDolZv98jKPzQ/UgCDrsmyDyaVVQvXTvTsaMUGu
 QX1w==
X-Gm-Message-State: AOJu0Yzk57ze7W2M+dZGzuDDxqzQF4C4nQaT0+KIjVeuIWG20QYhQN7h
 0xPVHsYLNRMcqT3+P+MZje9QtL0A5AiOdt9ZcIJ5S/qcEfCR5SgcP1OQoHhB/bcXBkmvhM3Oe9E
 hY7HQ9B4RDxfxvKVuXKSD/o9NULeh
X-Received: by 2002:adf:f64c:0:b0:319:77dd:61f9 with SMTP id
 x12-20020adff64c000000b0031977dd61f9mr20720986wrp.35.1693298692524; 
 Tue, 29 Aug 2023 01:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkyz0H/59QiwmMaoPHBd8l/zOcbWepANl0xbLpo+CSCqgbruJh8dSYCGWoP+ygCUhdbU+SlA==
X-Received: by 2002:adf:f64c:0:b0:319:77dd:61f9 with SMTP id
 x12-20020adff64c000000b0031977dd61f9mr20720976wrp.35.1693298692219; 
 Tue, 29 Aug 2023 01:44:52 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d15-20020a5d538f000000b0031ae8d86af4sm12995610wrv.103.2023.08.29.01.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 01:44:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 3/8] drm/ssd130x: Use bool for ssd130x_deviceinfo flags
In-Reply-To: <285005ff361969eff001386c5f97990f0e703838.1692888745.git.geert@linux-m68k.org>
References: <cover.1692888745.git.geert@linux-m68k.org>
 <285005ff361969eff001386c5f97990f0e703838.1692888745.git.geert@linux-m68k.org>
Date: Tue, 29 Aug 2023 10:44:51 +0200
Message-ID: <87wmxeteyk.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> The .need_pwm and .need_chargepump fields in struct ssd130x_deviceinfo
> are flags that can have only two possible values: 0 and 1.
> Reduce kernel size by changing their types from int to bool.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

