Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7717B791A9F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 17:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CACE10E0BE;
	Mon,  4 Sep 2023 15:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61C810E0BE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693841301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zrkFFETteuVae/tXCmZrIh7LT8QUm9zk2gxUS8x5iBg=;
 b=UICgtTqvZWNqoGBIr7FLH8tx8OS7yA2+MJnHaQTDqeACToX+0ynU/1ImdzB6bUudjTU6GW
 RVgbDLoC3FsXWkb3V1HgXobPmbktdqP31DlxqsTQUWxKR0JA5DXuh8Mcxlycmegwr4kJ4A
 +wAZRdGmjeOebEOygjbbk7ybejbCoas=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-I627DzHJN1m9LvbfSexm_A-1; Mon, 04 Sep 2023 11:28:20 -0400
X-MC-Unique: I627DzHJN1m9LvbfSexm_A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-401e521122fso11086465e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 08:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693841300; x=1694446100;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zrkFFETteuVae/tXCmZrIh7LT8QUm9zk2gxUS8x5iBg=;
 b=B9i87lJir1d4qCD18XydtOMwFphrsciz0pWLJXmDrHLNJyMFx+UJkliTcEgGsmJ7f/
 WQFR8jNnIfYuXiztL+1wk12Dsnf/8rbyt7PNmKPg7OW34hsl5y2Ju9q430w7fmuM75YQ
 aK9HUl9lz8CJMrv2d5VWd7jGlHkEdDLkeV6+1A7w1nhp48nWd4DMefYTDDKeCvPbXRs0
 kPPy6DHAD6zD+2tcM2OQ0AGPHpsaiqI75oPE9q5aSzCO1bCmh0iw1Q4bDcAogSWsri8P
 s6w0ubff+RnZnjFMfGCqsTLWmmUF/BcrmyV/Dy2LnIAuEEqKqZUJG8nKfhlln3pAi6O1
 rxKg==
X-Gm-Message-State: AOJu0YysZrQDb+s2Smu7SaRc6KSLEv5/RbRypaD3E0ZAWB6Gwmx2UWNK
 GKWU4FSmEBqiGpKAp4yNOSnrcKw8yBs/PT3zX0kkBUnaNeaegvz1sfwe0rFjRI4+qA+0YOZgR+x
 dcXopmvRkFSAPrevsYebvhjccOrVX
X-Received: by 2002:a05:6000:151:b0:317:5d60:2fea with SMTP id
 r17-20020a056000015100b003175d602feamr8786750wrx.52.1693841299901; 
 Mon, 04 Sep 2023 08:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqr9n5OuCxsaX4v3hREg3LRHhHWX1kh5NPq1tl5TVMsK10UjE7B2EYUhMfWqJeDR4jr+Z45A==
X-Received: by 2002:a05:6000:151:b0:317:5d60:2fea with SMTP id
 r17-20020a056000015100b003175d602feamr8786735wrx.52.1693841299613; 
 Mon, 04 Sep 2023 08:28:19 -0700 (PDT)
Received: from localhost (156.pool92-189-221.dynamic.orange.es.
 [92.189.221.156]) by smtp.gmail.com with ESMTPSA id
 e12-20020adf9bcc000000b0031759e6b43fsm11564376wrc.39.2023.09.04.08.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 08:28:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Subject: Re: [PATCH 2/8] fbdev/udlfb: Use fb_ops helpers for deferred I/O
In-Reply-To: <37906737-5ca3-7f46-af30-85a117875eea@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-3-tzimmermann@suse.de>
 <874jka6qd7.fsf@minerva.mail-host-address-is-not-set>
 <37906737-5ca3-7f46-af30-85a117875eea@suse.de>
Date: Mon, 04 Sep 2023 17:28:18 +0200
Message-ID: <87y1hm5565.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bernie Thompson <bernie@plugable.com>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Am 04.09.23 um 15:05 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>>> Generate callback functions for struct fb_ops with the fbdev macro
>>> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
>>> the generated functions with fbdev initializer macros.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Bernie Thompson <bernie@plugable.com>
>>> ---
>> 
>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>> [...]
>> 
>>> +static void dlfb_ops_damage_range(struct fb_info *info, off_t off, size_t len)
>>> +{
>>> +	struct dlfb_data *dlfb = info->par;
>>> +	int start = max((int)(off / info->fix.line_length), 0);
>>> +	int lines = min((u32)((len / info->fix.line_length) + 1), (u32)info->var.yres);
>>> +
>>> +	dlfb_handle_damage(dlfb, 0, start, info->var.xres, lines);
>>> +}
>>> +
>>> +static void dlfb_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
>>> +{
>>> +	struct dlfb_data *dlfb = info->par;
>>> +
>>> +	dlfb_offload_damage(dlfb, x, y, width, height);
>>> +}
>>> +
>> 
>> These two are very similar to the helpers you added for the smscufx driver
>> in patch #1. I guess there's room for further consolidation as follow-up ?
>
> Maybe. I had patches that take the rectangle computation from [1] and 
> turn it into a helper for these USB drivers. But it's an unrelated 
> change, so I dropped them from this patchset.
>

Great and yes, I meant as separate patch-set, not as a part of this one.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

