Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FA25246A1
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 09:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4101D10F226;
	Thu, 12 May 2022 07:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C24D10F226
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 07:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652339710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Os04AKI7pniwvPXaxAjmLV14z3XcLMBWUq2vLLvAtOQ=;
 b=KiIG8pqut5j4H81SbmCo0b6IeyDBsIURKZhmSIjoIpFfo1zMhkAgDXPOrGXBRN6xjgRXcC
 bmg9dRB6jwEx+y+zRMu7b2hk5W1KipxLyYmUhOnMTl8Li4iRSOb7NWFc/lepAxO6+RWMj9
 8Gcrc8PFfEDg5aHD8SoocEhSNB/NN9M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-a6QSn2gXP4GnvxVFTpbuLA-1; Thu, 12 May 2022 03:15:09 -0400
X-MC-Unique: a6QSn2gXP4GnvxVFTpbuLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 u3-20020a05600c210300b0039430c7665eso1325701wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 00:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Os04AKI7pniwvPXaxAjmLV14z3XcLMBWUq2vLLvAtOQ=;
 b=AR6g7EArFEX9U1SjIE9JDhNWOvIqLDvW9s0QWPsKblX+9414uhPC6dn+FqHwXsUYRZ
 yf5ot7uXrvAGLsGeAHzjVDNmeL66utFxE8TdI9UKw01aAIJnkeY78lIa1mGEISjNATjj
 1nqJXbB6uoUBVAsiLOgyxGTD2xTZcI9lEOYNrpwxsYCvF7BBZXKfKGgsv/xbs/YQTI6m
 aw9CnHLefFwFc/kujbVHY0yJ4EJ33BIQaWI59HZ7K/HgZuw2/XWtcdWjuhoAB+0Hq4oR
 jexQvc/Qg6bXtdVg8fwRsiuzzAeF8Fkpupgv8CwuydgdJKmSImbn+qwJfYdhLXceTsb+
 H86Q==
X-Gm-Message-State: AOAM531DoQLzAJ4lD26rtayMhdVt6PYsvcnWIE2nkyzlb1AEeT1sI5fh
 U03vhuDiikJqTZTfFA9fjYmWAeuz8ly1OYkASyejh8XnGVOg74HutxyG+bouILQcBKZfwCVD3rz
 V3cWN+kMh8CFMw8UdmUYfYxwh36Y1
X-Received: by 2002:adf:ed03:0:b0:20c:4c8b:8e07 with SMTP id
 a3-20020adfed03000000b0020c4c8b8e07mr25970979wro.423.1652339707994; 
 Thu, 12 May 2022 00:15:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKIew09BxNWv4GuSsROduWqaZ2N1tCeUrggRT6eW+5ZbaMklr/LYMX98+uTUMs2LAIA2+BUw==
X-Received: by 2002:adf:ed03:0:b0:20c:4c8b:8e07 with SMTP id
 a3-20020adfed03000000b0020c4c8b8e07mr25970960wro.423.1652339707783; 
 Thu, 12 May 2022 00:15:07 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z12-20020a5d4d0c000000b0020c5253d8f0sm3379950wrt.60.2022.05.12.00.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 00:15:07 -0700 (PDT)
Message-ID: <5f2f3f36-1a3e-0d7d-0983-868103058264@redhat.com>
Date: Thu, 12 May 2022 09:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] drm/client: Look for command-line modes first
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20220511183125.14294-1-tzimmermann@suse.de>
 <20220511183125.14294-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220511183125.14294-3-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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

On 5/11/22 20:31, Thomas Zimmermann wrote:
> When picking a mode, first look for modes that have been specified
> by the user on the kernel's command line. Only if that fails, use
> the existing heuristic of picking a nearby mode from it's various
> parameters.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

