Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14DE5BAC54
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 13:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59A210EBE9;
	Fri, 16 Sep 2022 11:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB0C10EC69
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663327501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWT1aNW0ZX4uFyjwmsjPL1bKB9oSfjQTT8f6OZuNFHg=;
 b=dSxU7r7329dN0FoTAdkyh3qUZOU6nG/bqQIxlm5GOkHSGwae/K+/pRdzfuDdqyWbxeJDeF
 k+fV/mIiTJUxgrHwtYqR260lW/izgftwANPTChAyjeqkQL24yc3JUvncaoAPHLJ9t9bAb1
 121T7sBpq4bjW7iI8OcqtWrqsJjPO6k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-296--wf66tE9MdGdsWO1NLdZiQ-1; Fri, 16 Sep 2022 07:25:00 -0400
X-MC-Unique: -wf66tE9MdGdsWO1NLdZiQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 r23-20020adfb1d7000000b002286358a916so5338250wra.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 04:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FWT1aNW0ZX4uFyjwmsjPL1bKB9oSfjQTT8f6OZuNFHg=;
 b=kgEFOxF64rOhbN9xs7b9fedO5dgKuz1uZkXsjURXrwV1GrdYpeo1+n5jXNaJofSDiz
 AwXej6lgcUeABoTH9QYdg73dBoDeWDmjdV4N1cKFqsBTB1jOLWzzEmUox4/5W3DCs5eE
 ZYj4g5nFPZZUB+zypyjNGxzT5iPcqSXaNUmg3tBzOys03Shuv6XJqUa62NrwbU3lXuOf
 LqI9+s4CvwjM+aUxAYWJOGz/lW/E7uUp/pbwB1Nz1FtrwWX04DFgltkJyxZbkYgkUL8V
 2mhrXxYstl8byLjlko7FUcvqBMMvBipMjGFMm5aVF58Ixlym0uKucujrrLCBKUaqjVND
 HELQ==
X-Gm-Message-State: ACrzQf2OsFeF1almkZcrlpS3IzGJQeVXmFQwLY0IYSxMDjG2j6QxXPar
 sgiwBjzM8TNz9MIFCpxbIQI1TlKsc0WgKT4rCCz/Vbln3UChuRJcFeFqhrHNb8ty42smzKUfToY
 mFPv6+lUSUH3ZgaBU2mtx/wQSc67h
X-Received: by 2002:a1c:4b03:0:b0:3b4:74d3:b4c5 with SMTP id
 y3-20020a1c4b03000000b003b474d3b4c5mr2953803wma.96.1663327499416; 
 Fri, 16 Sep 2022 04:24:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6n/5/jPTh15owYiIdxqtDHEqMzxYlB4BIVX5SyvX66tGS3HAdFaQlivz6iDfYJgd4mjkRCCQ==
X-Received: by 2002:a1c:4b03:0:b0:3b4:74d3:b4c5 with SMTP id
 y3-20020a1c4b03000000b003b474d3b4c5mr2953782wma.96.1663327499183; 
 Fri, 16 Sep 2022 04:24:59 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k2-20020a7bc402000000b003a5c999cd1asm2275331wmi.14.2022.09.16.04.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 04:24:58 -0700 (PDT)
Message-ID: <4d492346-36fc-a230-4112-e182caa158af@redhat.com>
Date: Fri, 16 Sep 2022 13:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 4/4] drm/plane-helper: Provide DRM_PLANE_NON_ATOMIC_FUNCS
 initializer macro
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220909105947.6487-5-tzimmermann@suse.de>
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/9/22 12:59, Thomas Zimmermann wrote:
> Provide DRM_PLANE_NON_ATOMIC_FUNCS, which initializes plane functions
> of non-atomic drivers to default values. The macro is not supposed to
> be used in new code, but helps with documenting and finding existing
> users.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

