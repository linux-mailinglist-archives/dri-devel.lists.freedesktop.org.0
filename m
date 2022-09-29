Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E18A5EF5B8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 14:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815E010E5F8;
	Thu, 29 Sep 2022 12:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344F010E299
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 12:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664455871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KouUCILkI9jFd0vyuAxaoxmo9Gwcr90oMq3oQp5pXck=;
 b=X16NZ4m7ql/quawF1xdCk1h20ULqef1EjGurhYPRxs6ujI5VGFn6dXc8nAZ8QNos6fboHD
 1C/YUL6d16sdMC0zxmV0I6+T/WJ5bcBnM7LVzR0NOFPVkpyhZM9+apapGcoT5vu4BQoK57
 QptJklLTXICqvihb3KCziuKkOSVC/XQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-JFghCZXfMReUtieBkGVJdQ-1; Thu, 29 Sep 2022 08:51:04 -0400
X-MC-Unique: JFghCZXfMReUtieBkGVJdQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 84-20020a1c0257000000b003b4be28d7e3so2942167wmc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 05:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=KouUCILkI9jFd0vyuAxaoxmo9Gwcr90oMq3oQp5pXck=;
 b=oV3zKB4PSh35u8TuJ++P3I8zdH+ZKZS7LF1XDe4lfMcKwmovepAhvZ7tH9omkbU8EQ
 6dexUFnfDuQ5aysUTSjkSV2K9AfGsQedZrSTfEcREgZ6a32Rr1EC3zRbzzKmHO6E2d6I
 lYh3r/90zIIhF/Nv2+4xon2fJwiILSMDskNM3X8WbA3KAZUSsAGd/T5C3nXXswYvZ4QP
 Ycfc3G+wThgAAoXIhEwMnZw4bP9xQ7opp9dnI/CEtREfVyHkfXBO4QT5Ox+ToznflSHW
 0nBOxUIwd4+H2Ws9oMbhlG3puw66cvVyzMxG23tlTRpX7rgDxOtgXECt0FEsA0bcAlo7
 oX5A==
X-Gm-Message-State: ACrzQf1OYagHdb8ccZTUUQxhD1vZXQXwu9w04Z/LW+0vFny2nsYkANLg
 mdt41f3o+V1onPExtjS0EiKwkLNTIufSYP54tJbGpii+XmxgmUFSQfWP2bJodal2OMdK2gmDP19
 Anuj9VKkZx5GhMd05o4Qh1XXKUD2d
X-Received: by 2002:a05:6000:1f8e:b0:22b:113b:536 with SMTP id
 bw14-20020a0560001f8e00b0022b113b0536mr2326464wrb.619.1664455863274; 
 Thu, 29 Sep 2022 05:51:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rp6RI4jcodrP2DgvaJNGney1wUw9Ceb6lpNNGPpLYsiO5qL8Mvx7WlHvHMhK9p2lb41C0XA==
X-Received: by 2002:a05:6000:1f8e:b0:22b:113b:536 with SMTP id
 bw14-20020a0560001f8e00b0022b113b0536mr2326446wrb.619.1664455863032; 
 Thu, 29 Sep 2022 05:51:03 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c1d8d00b003b332a7bf15sm4465130wms.7.2022.09.29.05.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 05:51:02 -0700 (PDT)
Message-ID: <a4e37b99-bd18-850a-2485-6239870de3f9@redhat.com>
Date: Thu, 29 Sep 2022 14:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 01/16] drm/udl: Rename struct udl_drm_connector to struct
 udl_connector
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-2-tzimmermann@suse.de>
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

Hello Thomas,

On 9/19/22 15:03, Thomas Zimmermann wrote:
> Remove the _drm_ infix from struct udl_drm_connector and introduce a
> macro for upcasting from struct drm_connector. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

