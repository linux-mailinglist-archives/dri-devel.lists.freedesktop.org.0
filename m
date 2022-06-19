Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CBC550B47
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 16:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809BE10E3A1;
	Sun, 19 Jun 2022 14:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500E410E3A0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655650659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHot+2uLVoFYLq/OdJvXds01VXlhrLpmZp7IRLndQvc=;
 b=YudZK1PMg4GUlOy7CaDHhqJMSQcu+0LfM3phzejY1IBsZOkckYQBc55w2zsgMo7FhGeF/I
 lOQmx+Zr4R1oHfONzrjWFs1JGD0bLEqUtU4oWxKBocdoyeLae1Utg6OxgCy8xZ8OFIr+KZ
 kz39cRsd9qR0lBqv0lbFh5vf7Q0nOyA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-OCfP49vhOkyIBIvUfsDgQw-1; Sun, 19 Jun 2022 10:57:38 -0400
X-MC-Unique: OCfP49vhOkyIBIvUfsDgQw-1
Received: by mail-ed1-f69.google.com with SMTP id
 x15-20020a05640226cf00b004318eab9feaso6780696edd.12
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 07:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sHot+2uLVoFYLq/OdJvXds01VXlhrLpmZp7IRLndQvc=;
 b=1J+Uh2R5EusiaRPp+HQheoiqceD5qAV+Q8Vl7KhVlIu1dbcBJUsLYfXLAoavQDveOl
 rCPBTufR4/gMngG+9wKryLhKy3uwtEry+up6zn04HWtLsAbFNnMWcbWrmF4s0OPV151O
 jRJPLJGi5tm+N0Jsp9e00KgQduOUQMGrxpd7TDZsm6zundV8vQoW69MHR1RjrsI4dY0U
 e+Xr2xCK+yQ1YoFA3h/vKBQ+KCIpnQVUtj8SbWChPyBGvn1wa0InMHZ0Z/ioJfgK3vPy
 6iAdBRB/SJvip6Q+b58/WUjEI4ZwYGw6swZupdxFfeSby0DdJASgerIROyVUeVl4SbWX
 6jdA==
X-Gm-Message-State: AJIora9jl+t9WvpsL7ukr+pd7dRzuCfuk9NqqN6MYCAzDAmYixqNAPT9
 tXebOY0UhfEnqR4fEMDs1FyYMUDttc/PITb03W8htQvt5BdnYgwfdWPAZNLcuOej+daAwtLN7z9
 jyOHBkBZm0FZ/faj/n47c0rt93L4T
X-Received: by 2002:a17:907:3e04:b0:6f5:1132:59de with SMTP id
 hp4-20020a1709073e0400b006f5113259demr17955717ejc.755.1655650656875; 
 Sun, 19 Jun 2022 07:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uyrRgJobN9yAkr1LNcjNx+4hHwL0KxM6mJL4iGhGXvgXAW5Y+tbRiU8ZcO8/DRY0Kpr74Qzg==
X-Received: by 2002:a17:907:3e04:b0:6f5:1132:59de with SMTP id
 hp4-20020a1709073e0400b006f5113259demr17955705ejc.755.1655650656705; 
 Sun, 19 Jun 2022 07:57:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 lb21-20020a170907785500b007219c20dcd8sm1925024ejc.196.2022.06.19.07.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 07:57:36 -0700 (PDT)
Message-ID: <9c6cbae0-b890-96a9-1652-529d3b3be91c@redhat.com>
Date: Sun, 19 Jun 2022 16:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm: panel-orientation-quirks: Add quirk for Aya Neo
 Next
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maccraft123 <maccraft123mc@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220619111952.8487-1-maccraft123mc@gmail.com>
 <cea478bf-ac29-dbdc-e156-5291da4f0318@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cea478bf-ac29-dbdc-e156-5291da4f0318@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/19/22 13:46, Javier Martinez Canillas wrote:
> Hello Maya,
> 
> On 6/19/22 13:19, Maccraft123 wrote:
>> From: Maya Matuszczyk <maccraft123mc@gmail.com>
>>
>> The device is identified by "NEXT" in board name, however there are
>> different versions of it, "Next Advance" and "Next Pro", that have
>> different DMI board names.
>> Due to a production error a batch or two have their board names prefixed
>> by "AYANEO", this makes it 6 different DMI board names. To save some
>> space in final kernel image DMI_MATCH is used instead of
>> DMI_EXACT_MATCH.
>>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>
> 
> Patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

New version looks good to me too:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I've some upcoming travel, so it would be good if someone
else can push this to drm-misc-fixes.

Regards,

Hans

