Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5819184ED
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F325A10E900;
	Wed, 26 Jun 2024 14:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y1HVVBad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDEE10E8FE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719413645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/ZNn5yWtbUQ7xxPt2ILvYmVBMyK/NlRkJHOBkDnNyA=;
 b=Y1HVVBad1gV9htBv0YQ8MyrYuo505nvcPViZOyJzn6AMHsdnHoK/wVs5Kb1gv/wWnP0it8
 Tv213B/hBIrIlad9HpNOWslh8DSwcDiWjoI7WgVdv8XCVRyEU4ZMWoH5bndME6uJZF8XNZ
 LDCel5dXfEEuwDRw0a1hIsc4PU3B1DA=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-4L0bEZRTP8C5O0-tamQOTA-1; Wed, 26 Jun 2024 10:54:03 -0400
X-MC-Unique: 4L0bEZRTP8C5O0-tamQOTA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ec59184e87so32323061fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719413641; x=1720018441;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C/ZNn5yWtbUQ7xxPt2ILvYmVBMyK/NlRkJHOBkDnNyA=;
 b=hEEYPa87h7ylVsYkgMoW97rTwaTAYTCFvZs3gzvO4+ivGpAiEqe6f2n7YS1id0xonx
 zQwA3LJvpzNdIQDUylEZe+PSls77pO3cBOw4/UmwwTsI5NId+OowRQyiSXOmZjMgNuew
 R0Wr177Tb6fi7oVpY2XsBEuiVtwG5waydJLDHoFpXL41W4chQk2/Z+msVqxESMqO+NCe
 Md0a/A8DsO5HMnPykSrCpojli/xm+a1NAG5FrLHVmC07yVnv/+ayCcm5VriheNkG1sOL
 KQaR7RBrkX/hCc3334J65rXpijoSOLfIlqC2jJ4RI9p+qKHGvFapa0i6Y59t+S/U6lAm
 utNg==
X-Gm-Message-State: AOJu0YzfOY84LL6cOxs2l9RIPspUaiBa/KIpHeYd0zNC15x2rPl9E0yh
 d010ETRvYNPxEMTBqP87qILWSykogIcjrr+GWMV17O4vb0QZ1nEtumQs1zjsUC2VbsX7RaHIW9j
 z6YBVQwaMGzK4xPEL8dZrP5HF+7TVXbOyjJnfu3ikbDlJ1eCKYaUhOTu3A9ATZ24q9Q==
X-Received: by 2002:a05:651c:2119:b0:2ec:681b:5b50 with SMTP id
 38308e7fff4ca-2ec681b5f72mr56159591fa.11.1719413641715; 
 Wed, 26 Jun 2024 07:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwj4p2whlwOd1A2Ym7AthhJqROwdpeA7StJlDLOTOhCEfD6pTFqmDk3RIfx3XbeFg0xm84ow==
X-Received: by 2002:a05:651c:2119:b0:2ec:681b:5b50 with SMTP id
 38308e7fff4ca-2ec681b5f72mr56159341fa.11.1719413641324; 
 Wed, 26 Jun 2024 07:54:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c82519bdsm29460335e9.13.2024.06.26.07.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 07:54:00 -0700 (PDT)
Message-ID: <0119ce0b-d0e1-48fb-a2e2-2643472bf434@redhat.com>
Date: Wed, 26 Jun 2024 16:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: fix null pointer dereference in
 nouveau_connector_get_modes
To: Ma Ke <make24@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 lyude@redhat.com, linux-kernel@vger.kernel.org, daniel@ffwll.ch,
 airlied@gmail.com, kherbst@redhat.com,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20240626013013.2765395-1-make24@iscas.ac.cn>
 <875xtwdone.fsf@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <875xtwdone.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/26/24 11:44, Jani Nikula wrote:
> On Wed, 26 Jun 2024, Ma Ke <make24@iscas.ac.cn> wrote:
>> In nouveau_connector_get_modes(), the return value of drm_mode_duplicate()
>> is assigned to mode, which will lead to a possible NULL pointer
>> dereference on failure of drm_mode_duplicate(). Add a check to avoid npd.
>>

Please add a "Fixes" tag (also for your previous commits) and CC stable.

>> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_connector.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
>> index 856b3ef5edb8..010eed56b14d 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
>> @@ -1001,6 +1001,8 @@ nouveau_connector_get_modes(struct drm_connector *connector)
>>   		struct drm_display_mode *mode;
>>   
>>   		mode = drm_mode_duplicate(dev, nv_connector->native_mode);
>> +		if (!mode)
>> +			return -ENOMEM;
> 
> Do not return negative values from .get_modes().

+1

https://elixir.bootlin.com/linux/latest/source/include/drm/drm_modeset_helper_vtables.h#L899

> 
> BR,
> Jani.
> 
>>   		drm_mode_probed_add(connector, mode);
>>   		ret = 1;
>>   	}
> 

