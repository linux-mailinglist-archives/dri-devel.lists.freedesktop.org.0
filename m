Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE51372D15
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 17:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DCF6EB22;
	Tue,  4 May 2021 15:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB8A6EB1C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620142555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjANuhmunmxl1tjd4moAyPGINXbx5GlWhcPk5Awa2JU=;
 b=aA7Q87LQHJivZpVxmtw4t/4z609E74BGQIQQwY/M90Rl91PrjcxequxmyzW4F0tvD+pG1D
 kvP1i7eIbjBRgdMNFlvChGF2pU5nfSsPLopNood1Z7JVA9ut110jXhjQjAmqrnAxr9ko4h
 0oANpUcj3Gu1VgQ/1o0lfjeLA+21YDc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-ifkGY8J1OnC0wLkJHQOhVw-1; Tue, 04 May 2021 11:35:53 -0400
X-MC-Unique: ifkGY8J1OnC0wLkJHQOhVw-1
Received: by mail-ed1-f69.google.com with SMTP id
 d13-20020a056402144db0290387e63c95d8so6611258edx.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 08:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FjANuhmunmxl1tjd4moAyPGINXbx5GlWhcPk5Awa2JU=;
 b=fJKV3LaVWBqW215PLr80Xf0cjQMeeS1nEmSDLOKSHOA5iYyzt6QyBKkGzA37W0pipC
 vmoN4btxB3GtPh0nlbwryj9WC09yCz1tSHDe5AvT+KBxpUdSbGJpjsFjtTTrU2AkHhnP
 8ckr26e0EphMlQslRafo21vuhPs0Tqa60EqzN4r7AH0rdaU6zyWxQcjVKsQpQqW8tyHt
 sWWKDebPCeucHUtcCn83uob2bxlgELk3gz8tqQvipG5buqbYH+k2bMTDiKUoW0vu3NKK
 KFtX7HNCWOJ27UzF0ml5i5BwyGWZb/GmE/tGRb02Fi54MKwkzT2VSGw1qieo7c4yr5qu
 1qPg==
X-Gm-Message-State: AOAM533SHTIi1uxHdokkhDiNlNo4fDr/W6k9NiYtKXyoYC6wQX3pLn3F
 mFxyNXCPvwBS5gglg0Ipw6ZpGIznWdW39TV3BTCsMP/zeaQ9hQPueb7oK5pnYOYFRXzx86Exav7
 LVU8jmyKCvxO1hqC3Vj3i0iyq6Qc9
X-Received: by 2002:a17:906:cd27:: with SMTP id
 oz39mr18874308ejb.129.1620142550774; 
 Tue, 04 May 2021 08:35:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmyw0dujywRY0BkQgCLf9VxiL7liqXtJ0bEMhZiU1xqc+xgw8QvX8u6muUU7TbNtZxdprzkg==
X-Received: by 2002:a17:906:cd27:: with SMTP id
 oz39mr18874288ejb.129.1620142550583; 
 Tue, 04 May 2021 08:35:50 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id d18sm1584825eja.71.2021.05.04.08.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 08:35:50 -0700 (PDT)
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification (v2)
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-5-hdegoede@redhat.com>
 <YJFj5Vk7xOcj+ISZ@kuha.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <326621fe-cc4e-ad77-c87e-922a655bfbc8@redhat.com>
Date: Tue, 4 May 2021 17:35:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJFj5Vk7xOcj+ISZ@kuha.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/4/21 5:10 PM, Heikki Krogerus wrote:
>> +/**
>> + * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>> + * @connector: connector to report the event on
>> + * @data: data related to the event
>> + *
>> + * On some hardware a hotplug event notification may come from outside the display
>> + * driver / device. An example of this is some USB Type-C setups where the hardware
>> + * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
>> + * status bit to the GPU's DP HPD pin.
>> + *
>> + * This function can be used to report these out-of-band events after obtaining
>> + * a drm_connector reference through calling drm_connector_find_by_fwnode().
>> + */
>> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>> +				     struct drm_connector_oob_hotplug_event_data *data)
>> +{
>> +	struct drm_connector *connector;
>> +
>> +	connector = drm_connector_find_by_fwnode(connector_fwnode);
>> +	if (IS_ERR(connector))
>> +		return;
>> +
>> +	if (connector->funcs->oob_hotplug_event)
>> +		connector->funcs->oob_hotplug_event(connector, data);
>> +
>> +	drm_connector_put(connector);
>> +}
>> +EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
> 
> So it does looks like the "data" parameter is not needed at all:

Well Imre did indicate that having the number of lanes is useful, so
for the next version I'll drop the orientation but I plan to keep
the number of lanes if that is ok with you.

Not having passing along this info was one of the reasons why my
previous attempt at this was nacked, so dropping it all together
feels wrong.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
