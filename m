Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD76645F93
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 18:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B323310E423;
	Wed,  7 Dec 2022 17:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0020610E406
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 17:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670432574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wAbctrVEGwMaXaVosdApBDoZ5YdMEhFL3UlqwYm8ntk=;
 b=InEeeAtnvddEWgs2PnHdfc4j8y3N/l/ZlezJxiLjV6GVI+jqSPo3rWPoeOfnpiqwqwKZsW
 Md1x+h7+ULNDgehC3Q0JPxvf0ah3cBzbmHmn7O8SWy6w4buxSs9rIedROpKicV1c2ysoD5
 TjtfoDSUMMEe1jrlMZLQlyQN/knlCWw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-78-kzSboo3LOI-Xv-WKv7fVWw-1; Wed, 07 Dec 2022 12:02:52 -0500
X-MC-Unique: kzSboo3LOI-Xv-WKv7fVWw-1
Received: by mail-ej1-f69.google.com with SMTP id
 hs18-20020a1709073e9200b007c0f9ac75f9so3711489ejc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 09:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wAbctrVEGwMaXaVosdApBDoZ5YdMEhFL3UlqwYm8ntk=;
 b=ErymHic6PyP+vqH0Op6mAZWz/+SHJKhbqGQVHPoOsrYHoui3IoGZstuGpEAwfovtIc
 l9MYqcrjktKTQXvZOd7mc0RbUrJiYFiY7dR7X9j7lVKjc+sawPDwEqyHsCCBkqURtBtC
 6ky9KSmvHFI89rOjPB4JF6dRtqZ0IkfRVVEx1wyLGWMlCxmRxvXFhLfOfqV2zMLTCiYo
 8NUaWSY2BZgItiEvXtA61FKNqCiKoZ0gMMmxe9E3MFKm8YQfsdA+V9VNLhtCNDvWZE58
 UILIWLeguOsEFbAU60yPAzkLrAcbz7fCzH7F9IFbZxsjDHMopwXls6O/KnGBZ5fCIcqa
 YWgA==
X-Gm-Message-State: ANoB5pl+uMdR1UpYAjUWT2d6CHJRKx1FQqnom9A8faEcW3y7gcczCFcl
 txGg98Vy2jhDYYQlMVB1keLi/00lxV1bAclgb2gX5cEYHjtu+Src/PsGsHKWSNYgv1O0gt88L0s
 c0kaY7lt8MtpzZ8Nd9zzaTed73xjM
X-Received: by 2002:a05:6402:4014:b0:46d:53d7:d1f6 with SMTP id
 d20-20020a056402401400b0046d53d7d1f6mr3847561eda.211.1670432571450; 
 Wed, 07 Dec 2022 09:02:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7er2RI4LIn+foJ+IpgflNg7is5cHawQtLcV9Waw0GoVdby/e3EXVjcfbWzZBm9Zq7ytCQWjg==
X-Received: by 2002:a05:6402:4014:b0:46d:53d7:d1f6 with SMTP id
 d20-20020a056402401400b0046d53d7d1f6mr3847548eda.211.1670432571311; 
 Wed, 07 Dec 2022 09:02:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 s26-20020a056402015a00b00461bacee867sm2437935edu.25.2022.12.07.09.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 09:02:50 -0800 (PST)
Message-ID: <dd7c8b6b-651d-4779-2680-40bba3216cab@redhat.com>
Date: Wed, 7 Dec 2022 18:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Lenovo Yoga
 Tab 3 X90F
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20221127181539.104223-1-hdegoede@redhat.com>
 <caf6d4c9-5936-ec50-3f38-90177910c103@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <caf6d4c9-5936-ec50-3f38-90177910c103@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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

Hi,

On 11/30/22 08:43, Javier Martinez Canillas wrote:
> Hello Hans,
> 
> On 11/27/22 19:15, Hans de Goede wrote:
>> The Lenovo Yoga Tab 3 X90F has a portrait 1600x2560 LCD used in
>> landscape mode, add a quirk for this.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
> 
> Looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thank you, I've pushed this to drm-misc-next now.
Regards,

Hans


