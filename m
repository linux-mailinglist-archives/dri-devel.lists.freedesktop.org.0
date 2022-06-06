Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A34A753EF62
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 22:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4846210E6AA;
	Mon,  6 Jun 2022 20:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC4E10E6DE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 20:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654546588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=soh7nshOOI4K9myM3ozv4aem+NBtc61+4Mxmv3KYpHg=;
 b=WxkcbxcjWZNY5O6i2Kl1YbO1UTKvtqyVyTCgS38azyw80PpxCX3IMzyCMqETicq8y+5M17
 6riNyeHidoa3mIAmOceT1k0XNfx1f32rqp0zGgHhIqBMvktA7d1StXUOJWGR99wQa1uSbi
 ELtaJjBVPgL6FhLMdk1IF6B3L/o4KVA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-1WCo7s-CPZ-CnO85SPSLiA-1; Mon, 06 Jun 2022 16:15:32 -0400
X-MC-Unique: 1WCo7s-CPZ-CnO85SPSLiA-1
Received: by mail-ej1-f69.google.com with SMTP id
 mh24-20020a170906eb9800b0070947edf692so5846602ejb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 13:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=soh7nshOOI4K9myM3ozv4aem+NBtc61+4Mxmv3KYpHg=;
 b=vcXbI3Zkf5wOM9j1KOmz+1va9c+RB3ahntR9USihkLgsrgYvUcEYr7HQ6Z5RAoK29F
 yL4z3hcLMIEQoIMDeIfaG0spGv5kB7VjSLbEsE0HznQDUgx3rlXeQ9bfir0AzqP1Xl2A
 mdwTW4cdK9EWAaKY8zOhIrvK7lFsQ4uFNobKjiDPMl52SWMRbCnZFRAvKIljagHylURd
 w4ZMxW35AUAN4BUjNqX4CnDKzYeJIajhDT88K9JnYIhl1XzUnxnzzA9l7gKlLqBBw/Wd
 UN2sf1f5bZuz0XKE3UJitq6sM/LgJjdOKB78HcAa4jaT1gR9JYYdganwaDU31CAfOE1v
 p0og==
X-Gm-Message-State: AOAM532uU+4Tq9D9cCDz0FxrHbr/bZL/+b3TwqMwBczl1qnfGbG+ut3s
 Xbx0mH2ldW/rs/tWdHdqQfKLSiWjO2xmUKA5CCLVlHdmEurCMEMADsgmIn/gbwZ6XcvtV7VzLGC
 CKaus+XJmX56Dc0IeTQJVQ55hQEOH
X-Received: by 2002:a17:906:ce36:b0:711:d032:e99 with SMTP id
 sd22-20020a170906ce3600b00711d0320e99mr6336288ejb.242.1654546531193; 
 Mon, 06 Jun 2022 13:15:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+R5Eu8yIp0AZcVOEeq1aIzb0Cegxw60TVcu2tMOPSlvbkiSDO4mWQNQcrPYsa2c7zj6yzdQ==
X-Received: by 2002:a17:906:ce36:b0:711:d032:e99 with SMTP id
 sd22-20020a170906ce3600b00711d0320e99mr6336261ejb.242.1654546530939; 
 Mon, 06 Jun 2022 13:15:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm6615148ejc.73.2022.06.06.13.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 13:15:30 -0700 (PDT)
Message-ID: <1c6e4d09-cf7a-2812-fd0d-09a21a275201@redhat.com>
Date: Mon, 6 Jun 2022 22:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
To: Sam Ravnborg <sam@ravnborg.org>, Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-2-hsinyi@chromium.org>
 <Yp5Ti3ov/fnw0xeQ@ravnborg.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yp5Ti3ov/fnw0xeQ@ravnborg.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/6/22 21:20, Sam Ravnborg wrote:
> Hi Hsin-Yi,
> On Mon, Jun 06, 2022 at 11:24:24PM +0800, Hsin-Yi Wang wrote:
>> Panels usually call drm_connector_set_panel_orientation(), which is
>> later than drm/kms driver calling drm_dev_register(). This leads to a
>> WARN().
>>
>> The orientation property is known earlier. For example, some panels
>> parse the property through device tree during probe.
>>
>> Add an API to return the property from panel to drm/kms driver, so the
>> drivers are able to call drm_connector_set_panel_orientation() before
>> drm_dev_register().
>>
>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> ---
>> v3->v4: Add a blank line.
>> ---
>>  drivers/gpu/drm/drm_panel.c |  9 +++++++++
>>  include/drm/drm_panel.h     | 10 ++++++++++
>>  2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
>> index f634371c717a..e12056cfeca8 100644
>> --- a/drivers/gpu/drm/drm_panel.c
>> +++ b/drivers/gpu/drm/drm_panel.c
>> @@ -223,6 +223,15 @@ int drm_panel_get_modes(struct drm_panel *panel,
>>  }
>>  EXPORT_SYMBOL(drm_panel_get_modes);
>>  
>> +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
> const as mentioned by Stephen.
> 
>> +{
>> +	if (panel && panel->funcs && panel->funcs->get_orientation)
>> +		return panel->funcs->get_orientation(panel);
>> +
>> +	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
>> +}
>> +EXPORT_SYMBOL(drm_panel_get_orientation);
>> +
>>  #ifdef CONFIG_OF
>>  /**
>>   * of_drm_find_panel - look up a panel using a device tree node
>> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
>> index d279ee455f01..5dadbf3b0370 100644
>> --- a/include/drm/drm_panel.h
>> +++ b/include/drm/drm_panel.h
>> @@ -133,6 +133,15 @@ struct drm_panel_funcs {
>>  	 * Allows panels to create panels-specific debugfs files.
>>  	 */
>>  	void (*debugfs_init)(struct drm_panel *panel, struct dentry *root);
>> +
>> +	/**
>> +	 * @get_orientation:
>> +	 *
>> +	 * Return the panel orientation set by device tree or EDID.
>> +	 *
>> +	 * This function is optional.
>> +	 */
>> +	enum drm_panel_orientation (*get_orientation)(struct drm_panel *panel);
> 
> Please move this up so it is together with the other get_* methods, in
> alphabetic order. That is, right after get_modes(), and then this also
> matches the order in the .c file with is extra bonus.

The downside of moving this up is that it will break drivers which don't
use c99 style named-struct-field initializers for there drm_panel_funcs.

I admit that no drivers should be using the old style struct init, but
are we sure that that is the case?

Regards,

Hans



> 
> With the two fixes:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
>>  };
>>  
>>  /**
>> @@ -202,6 +211,7 @@ int drm_panel_enable(struct drm_panel *panel);
>>  int drm_panel_disable(struct drm_panel *panel);
>>  
>>  int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
>> +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel);
>>  
>>  #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
>>  struct drm_panel *of_drm_find_panel(const struct device_node *np);
>> -- 
>> 2.36.1.255.ge46751e96f-goog
> 

