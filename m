Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE75F72232D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 12:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4CA10E277;
	Mon,  5 Jun 2023 10:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E086610E277
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685960136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w//PXxvTZrP/Pd4OMnUnywaLbQPL0Fl6oKrPT/BNYWY=;
 b=PTtp4cXnSFRJwog1CvSKqlGWiR4L3lyCkku6G8bo+p5SGFWA8F79jOXEIoDSHdLMwpvcKI
 nXtKYQAnCNTBiO60hv4h7LuSQbUg6gWGSI37TIguqDJygZJ4gaCvC5abjwtnBt/AAGiZc2
 Wmz+jfHkhU5tcZ/GWZaXBPxR7z1dve4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-7qB-thZ2P2OYfDCOTnniEg-1; Mon, 05 Jun 2023 06:15:35 -0400
X-MC-Unique: 7qB-thZ2P2OYfDCOTnniEg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f60911a417so21930605e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 03:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685960134; x=1688552134;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w//PXxvTZrP/Pd4OMnUnywaLbQPL0Fl6oKrPT/BNYWY=;
 b=XDvufGmKnVfixfgdohRjPcsu+M8/lQ+0m1fY2sqfdMH/GDUu2j02QG8jjqnjFO+MsK
 EY0mRrZlHK7x1Gby0iZHW1C7e1eR5IlFphM2h8J8wXXHjnh7BoONUp6Nq/YOkEC0fVpR
 SHfhqdxYlgKQSYEmGd2M4xb0GUhDjMZ2AbQ8F8Ak3e4nHPek02SRyML3XqNYPFOoOq0L
 DIOTUATniibU16ALu8oB9Uv8Jvsvp7vLSmOw7S7zeXiw+mF/cgPPN+Qm9RpTJrvq64Fg
 r7GCQ8gmUg36KVNY0l0/D+R6VmsvjVMTDDJOHtK3PVp5h+b+b4IUXHqGlM8t9mSqpojA
 1eCA==
X-Gm-Message-State: AC+VfDwKCzoJHk5801M5OkanuD/K74opxW246nV/PeMcb0pJRtdXA/Jf
 MUK42uCf3mxzmFM3H9YPqWLoZnfkaltTNLByfpr8zyUAwGOMrRQPpS3Z+Q75HWcCK1jt3WiFX25
 Cb9a/P+xrpqSDVUj1cy/OvuOIdSVz
X-Received: by 2002:a7b:ce0a:0:b0:3f4:fc5e:fbf2 with SMTP id
 m10-20020a7bce0a000000b003f4fc5efbf2mr6422026wmc.8.1685960133991; 
 Mon, 05 Jun 2023 03:15:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ774aF+F8xAb+CL5DwQDB+hwugLWEVdNbOkjDsp7YxMoQiVfuXw+ifNZEj/0nkXNmGxevlGLQ==
X-Received: by 2002:a7b:ce0a:0:b0:3f4:fc5e:fbf2 with SMTP id
 m10-20020a7bce0a000000b003f4fc5efbf2mr6422013wmc.8.1685960133687; 
 Mon, 05 Jun 2023 03:15:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m25-20020a7bca59000000b003f7e62d38d4sm1353196wml.25.2023.06.05.03.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 03:15:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: display: ssd1307fb: Remove default
 width and height values
In-Reply-To: <3bluztz3pcyoyjk4ett673ksnvtkl4xrjqjt43mhmd76dugg7t@kkp7rkx3vjjs>
References: <20230605074753.562332-1-javierm@redhat.com>
 <20230605074753.562332-3-javierm@redhat.com>
 <3bluztz3pcyoyjk4ett673ksnvtkl4xrjqjt43mhmd76dugg7t@kkp7rkx3vjjs>
Date: Mon, 05 Jun 2023 12:15:32 +0200
Message-ID: <87v8g2gqpn.fsf@minerva.mail-host-address-is-not-set>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

Thanks for your feedback.

> Hi,
>
> On Mon, Jun 05, 2023 at 09:47:50AM +0200, Javier Martinez Canillas wrote:

[...]

>>    solomon,width:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> -    default: 96
>>      description:
>> -      Width in pixel of the screen driven by the controller
>> +      Width in pixel of the screen driven by the controller.
>> +      The default value is controller-dependent.
>
> I think we should document it still, either in the comment itself, or
> through a conditional and different default values based on the
> compatible.
>

Makes sense. I'll add that in v2.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

