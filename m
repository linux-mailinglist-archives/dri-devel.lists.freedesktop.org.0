Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20B76BD9CA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 21:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7791810E2E2;
	Thu, 16 Mar 2023 20:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A4910E2E2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 20:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678997088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s8z2laupPqxYciFDj9wxlNqw4CF4OBC7fGl50oF5C0c=;
 b=UgxBL8q0BodgRwob54TyUdo1Mwsav//yU8KkhoINCW94LXTU/3AcSYF+s//SrY7gV2CdNl
 bQZWZbPn6x1AOW0QjJfuFelnikXvZufs9vShe26WY0QbI9m9WquUqM8aujqon1Jt5syFYm
 KUWDcb50SdWsNXV16lQzfsFkF1zircs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-K1YzFuN4MzSjXhXV-09aEw-1; Thu, 16 Mar 2023 16:04:46 -0400
X-MC-Unique: K1YzFuN4MzSjXhXV-09aEw-1
Received: by mail-wr1-f70.google.com with SMTP id
 g6-20020adfa486000000b002c55ef1ec94so491817wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 13:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678997085;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s8z2laupPqxYciFDj9wxlNqw4CF4OBC7fGl50oF5C0c=;
 b=mXeeIQ6JElO3mqKJvkksiIVWoegQD2Lhx8fv1B3IkU43OTHfMXJ3mKU6pali/byZIi
 pl9W5BtsSovIcxlTMaBxGT/LJEBZJ86R98yKGDPxtgCiZzPPhV6EnaWrsuAUhDKalUs6
 xVoXdRB+tVGEATxJr8wFcwfW0sl0q/MReV5YkuAgTiZafZOfm1/Viz2ERM8D9t7b/FTI
 ckYV0xdYCSox2TP7THhZo/4Nh0Z4/O9slTvjiGm4W29D9p90UAval9zojKqVyUZiyKts
 nEYBDwLc0nn52Gl9W5Y5WLBYf9e42rYSZxVnH15q++gGkEkcAaXH/QxFTCsYI9KnIst2
 sWmA==
X-Gm-Message-State: AO0yUKWr41TWsDlu4RCilvwKh4ithhZ80nn356lbbJNhZd03SknIcle2
 ccrjy41X79gENGD6tBkE5NY9tLke0BU10z/qVC2+W4P/tnC0PoDgwjhiUOQ/BWbPyM1L/uagR/z
 lLj9l4nzMOq0Vgq6xGFrWRGLrexuP
X-Received: by 2002:a5d:40c3:0:b0:2ce:a252:e2e8 with SMTP id
 b3-20020a5d40c3000000b002cea252e2e8mr5272224wrq.57.1678997085490; 
 Thu, 16 Mar 2023 13:04:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set/ugK6swa2wGlNY3b9CEqIGZnX4VxgCgZAWB0wJZMrjd3FT9TaLp9kAc5otVo+NHQti4VlthQ==
X-Received: by 2002:a5d:40c3:0:b0:2ce:a252:e2e8 with SMTP id
 b3-20020a5d40c3000000b002cea252e2e8mr5272205wrq.57.1678997085154; 
 Thu, 16 Mar 2023 13:04:45 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c10-20020adffb0a000000b002c70c99db74sm226292wrr.86.2023.03.16.13.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 13:04:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] drm/format-helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()
In-Reply-To: <23609fe6-3413-e034-6900-5ad3be082ca4@riseup.net>
References: <20230311125141.564801-1-arthurgrillo@riseup.net>
 <20230311125141.564801-2-arthurgrillo@riseup.net>
 <87cz5b40cu.fsf@minerva.mail-host-address-is-not-set>
 <23609fe6-3413-e034-6900-5ad3be082ca4@riseup.net>
Date: Thu, 16 Mar 2023 21:04:43 +0100
Message-ID: <87cz58qx7o.fsf@minerva.mail-host-address-is-not-set>
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, mairacanal@riseup.net,
 tzimmermann@suse.de, jose.exposito89@gmail.com, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net> writes:

> Hello Javier,
>
> On 14/03/23 16:08, Javier Martinez Canillas wrote:
>> Arthur Grillo <arthurgrillo@riseup.net> writes:
>> 
>> Hello Arthur,
>> 
>>> Extend the existing test cases to test the conversion from XRGB8888 to
>>> monochromatic.
>>>
>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>>> ---
>> 
>> Patch looks good to me:
>> 
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>> Please let me know if you need someone to push this to the drm-misc tree.
>> 
>
> It would be nice if you did, as I don't have commit rights on this tree.
>

Sure, pushed patch #1 and #2 to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

