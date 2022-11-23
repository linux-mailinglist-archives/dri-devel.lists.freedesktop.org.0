Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 668B6635314
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01F110E525;
	Wed, 23 Nov 2022 08:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7CA10E51E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669193202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iuEqiMn0txVaI9t4rRcgcJsEb9C922UPhKwFiz94Kn4=;
 b=R9bS9iFZwg6V3SS4UojV1Jgem5kT/liBrLPD6UZvbIfgOilXXs3paNjf0NfRdDWugz2Izf
 JPGvSDdCbYskYoP4MtL3avVLEAXFoEhhi1ijyQv489ZN9eqgxiU+fjiYs1JtKd7suxCYLw
 SklacAgW0R86TskZZ1xOlVGsU5NRe38=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-7Vv-p62DNPqRHsr2qjUBjQ-1; Wed, 23 Nov 2022 03:46:40 -0500
X-MC-Unique: 7Vv-p62DNPqRHsr2qjUBjQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so757523wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 00:46:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iuEqiMn0txVaI9t4rRcgcJsEb9C922UPhKwFiz94Kn4=;
 b=hhJOlXY6slaA1WhjMRpNAJzkurpLNZkaLU/vw4cyTEmCTZS+IEaBzfPKyzLjvb9jF0
 g6dr+uqthVhLJ9FwuCSKIDz4BSDTa4S5uWxX/mlK78rxp5ZN6V6a/0C0DJde5auhZy3Z
 hXi5cuyEAlO1jDN61I+JDhUH0MwNOoJ9xFzD5vymzdEjeMEbn9F1SmPTyFN/L5VUqClw
 w05ay8WeXlchQ9P9HerP1/suad5J+Wp25ARO91ypEEIcUEI+/77aMNPCOTFr/T24t2Kg
 jR6Pnl12w77Rj8NJ+hqtayJHubvZX/0WG5KP21b2NrmKeDNMB4pbc6wvWZ6IIep4DsXJ
 LKkg==
X-Gm-Message-State: ANoB5pnN0YJJ/rvl8zgzeYMgVo+rK/v/yBvdypUF1WJUQ/SwvkOBu3x4
 uQRU2VkxSnRbyxyrYorZwZXhVeCbebBDLFp6h9JqyktKu73YMYF7TxzPMduu3XgXYDzjO5Ec8gq
 o53VAug4aS/kHibVyelh5Q0h7pWVw
X-Received: by 2002:a5d:5957:0:b0:22e:3e9:ba15 with SMTP id
 e23-20020a5d5957000000b0022e03e9ba15mr15881156wri.180.1669193199774; 
 Wed, 23 Nov 2022 00:46:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7JhyihVQ6qMQp4dGjhYv55/oWneFyqK7J4Ggjlz0bQ8xhmeEkjUqbIFNA7MUDJroKLjRpabw==
X-Received: by 2002:a5d:5957:0:b0:22e:3e9:ba15 with SMTP id
 e23-20020a5d5957000000b0022e03e9ba15mr15881134wri.180.1669193199557; 
 Wed, 23 Nov 2022 00:46:39 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6291000000b0022e66749437sm16062340wru.93.2022.11.23.00.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 00:46:39 -0800 (PST)
Message-ID: <0d77cdbe-c8a1-95ae-653d-475c4012166c@redhat.com>
Date: Wed, 23 Nov 2022 09:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 5/6] drm/gud: Prepare buffer for CPU access in
 gud_flush_work()
To: noralf@tronnes.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-5-9de3afa3383e@tronnes.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221122-gud-shadow-plane-v1-5-9de3afa3383e@tronnes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/22/22 21:58, Noralf Trønnes via B4 Submission Endpoint wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> In preparation for moving to the shadow plane helper prepare the
> framebuffer for CPU access as early as possible.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

