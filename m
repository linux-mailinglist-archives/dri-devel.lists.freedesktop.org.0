Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB65751BFB4
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 14:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8930A10E205;
	Thu,  5 May 2022 12:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.129.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FAD10E1D5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651754731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cuDyUYDu6BZPnXeqmhM9u+aCmDXHwJi7/poygMUZqow=;
 b=encd2TFFSCo9V5bvQJDmraqy1guH08gRFvHxwhWD7w+GFUSxZPKjnYkla6n1AEwGH+rLV6
 4oSFB36AXZ7IsBKOuGXs1wDKnvjMHFQGRP8ts6lQM2lbt3w1JM9iKAANovrWHTNc7Pbuk3
 kvKnI8l2c/pPt0MVxdBsv7D/eaILTfY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-F-5vz4yzO9y09GEbuTK62A-1; Thu, 05 May 2022 08:45:30 -0400
X-MC-Unique: F-5vz4yzO9y09GEbuTK62A-1
Received: by mail-wr1-f71.google.com with SMTP id
 v29-20020adfa1dd000000b0020ad932b7c0so1415160wrv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 05:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cuDyUYDu6BZPnXeqmhM9u+aCmDXHwJi7/poygMUZqow=;
 b=ykkucHnjcBxipyp1zYgLaPxaO9BpBHr+qv0TmxSz+RpLx8HryT8W4SpvST/L4KowDw
 7w4IVChtinF/OMtN33Jcn8/clRnItd9YTCaqiLgTPNjVxEdnJkQfEuvDn/RwAgBJQz0Y
 EFySbQS7jc4jszt1xLYeUR25dygqptpwsoeorieDrnxGRjjsdSvSXqaQUPpvWlAnCxJa
 uZ3nBydZS/mThEuwhuBLd+eoY+EWKQ9ptvmDc8JrBhfn9HO+JihoEmdHpl0d++L0rqFn
 2sLcBP4TZWbUsAHzDDyh43K142ODGgqfkm8w71QxGIcJE7dFI7nBjn1tHO/ZX4PWRm5f
 oWHQ==
X-Gm-Message-State: AOAM530udTm7/VoZz8R1GIyRvoZjn4Pq8ROngNN/3j5TaUQdQMdiNF+0
 vYlhqnM67t5qvuVmn1vvR/YB0PdNaJf8XUZrcWZbl1sN3YTztbogKoz53JXBVEaEorBiWjKVA4O
 up1jvUT3VY5lbjBxg8dRLR3ugXn/V
X-Received: by 2002:a05:6000:1a88:b0:20c:6811:3176 with SMTP id
 f8-20020a0560001a8800b0020c68113176mr13613471wry.85.1651754729529; 
 Thu, 05 May 2022 05:45:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyvRu5J1/J+IjfMUf7y1AXH1mXJgSjbJfnuViykTVSo8bNb5YhQEJEs4GMNdg8VZpzTMvG9w==
X-Received: by 2002:a05:6000:1a88:b0:20c:6811:3176 with SMTP id
 f8-20020a0560001a8800b0020c68113176mr13613450wry.85.1651754729239; 
 Thu, 05 May 2022 05:45:29 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g6-20020a056000118600b0020c5253d8d6sm1163859wrx.34.2022.05.05.05.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 05:45:28 -0700 (PDT)
Message-ID: <47d3a7f6-24f9-7d54-48bf-09ab9e40e2de@redhat.com>
Date: Thu, 5 May 2022 14:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
To: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220503071540.471667-1-javierm@redhat.com>
 <20220503071540.471667-4-javierm@redhat.com>
 <YnJcaaDcIsJKhSwQ@phenom.ffwll.local>
 <bfb03d40-a023-12a9-9554-1b6e6c474134@redhat.com>
 <YnO+8hZ0ozPaZUEj@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnO+8hZ0ozPaZUEj@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 5/5/22 14:11, Daniel Vetter wrote:

[snip]

>>
>> And while I agree with you that these midlayer flags are horrible, that is
>> what any other fbdev that makes use of a firmware-provided framebuffer set,
>> so simpledrm emulated fbdev shouldn't be the exception IMO.
> 
> So we discussed this a pile more on irc, and at least my take is that
> people who run simpledrm but want to combine that with fbdev drivers and
> expect it to all work nicely we can probably ignore. At least until all
> this sysfb stuff is nicely unified, and at that point we shouldn't need
> special flags anymore.

I'm OK with this take and happy to just drop this patch-set then. My worry
was just that someone could complain that we broke their uncommon setup [0].

[0]: https://xkcd.com/1172/.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

