Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC02D651DA5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA0D10E365;
	Tue, 20 Dec 2022 09:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0484E10E365
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671529260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LveyBWJYAPbiyv73TUAfukc6OJNlBtbiuo6YSIh6FLQ=;
 b=aEDKtyS+M8N2U9M9q5HBtxOiypTIoQCppxvr2+W6y4S0U2424W/QwNiVeg67YgRIprkZjr
 GxoKKU40yc6KdDBZPoQKOgnlz4N3WhhV7bMwfFLi3GcYmaYKynBSj3baWxkWxC/Kr73rHG
 kr05ccTK+0ojKeQ5eBu+oB1xO8/mKyE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-VaeA-cbFMvCSz1sgfVo9Nw-1; Tue, 20 Dec 2022 04:40:59 -0500
X-MC-Unique: VaeA-cbFMvCSz1sgfVo9Nw-1
Received: by mail-wm1-f72.google.com with SMTP id
 125-20020a1c0283000000b003d1d8d7f266so6300363wmc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LveyBWJYAPbiyv73TUAfukc6OJNlBtbiuo6YSIh6FLQ=;
 b=dHRnSSSUBtCFkhhz4QcUTSv667RpC9jE3ywaKZo5BCrm4PK5fmyjKHh63HEAUOi3g5
 5phjFciPg6jUiqcd/3bywMEIOsRyHlquvmfvRkgilHAHDZPT1xxNEYtaPdIKm4vPQpmt
 8c1opJroQNW72JRztf78RZIoXoiGKo+yQa0Y/lGdyj8hO2oWhmuqY32RU7advMeK+OIw
 hNIMH8jB4xApWpziWiCD1YkMODW6AqJ0E9WCKbGTEz0/yX7nJq3VCsTZXSFEZpv7lNdg
 yyk7M+18TCyzpAmy84P7sdR8qsDzDzakxHandYgC+MSTABcs4CVw+JLxWacKHrQFkBFi
 CmuA==
X-Gm-Message-State: ANoB5pk6ombnfQ3vdMcbIDdosQtSh09PDZ4vGe2cUPHMxbxZsnouR+2q
 oiEZu5QCUpxXKdwZD74DZLZkszYU6Ioc3Qd2NCsyIX9xFNsHA0xqNSjwJS77BWTN5fDNGWe2y+g
 tiO1rIS2O0ZFNUOLa+5GoCpE0w+K+
X-Received: by 2002:a05:600c:1c23:b0:3d2:3376:6f2e with SMTP id
 j35-20020a05600c1c2300b003d233766f2emr22381403wms.9.1671529257842; 
 Tue, 20 Dec 2022 01:40:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7eSfSzTvRvhDpxH502Pk0KEhQEu8qDdlhID/m63O9KppBhxg3tASNRV4SrXUiQOLpYrNpaag==
X-Received: by 2002:a05:600c:1c23:b0:3d2:3376:6f2e with SMTP id
 j35-20020a05600c1c2300b003d233766f2emr22381388wms.9.1671529257649; 
 Tue, 20 Dec 2022 01:40:57 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 by3-20020a056000098300b002366c3eefccsm12187201wrb.109.2022.12.20.01.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:40:57 -0800 (PST)
Message-ID: <6b3825fc-e149-9096-0438-0fb2c717f3d6@redhat.com>
Date: Tue, 20 Dec 2022 10:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 15/18] fbdev/vesafb: Remove trailing whitespaces
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-16-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-16-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 17:05, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

