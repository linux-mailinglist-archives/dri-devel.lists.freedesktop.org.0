Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320A77EDE6F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDA810E5B1;
	Thu, 16 Nov 2023 10:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AF310E5B1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700130478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FlHlGuIFKBdR7Fli1C8w7UyO4Sn2DZFiv8/q8c7YdBo=;
 b=eltw52C/nKSvHd2YF7ahsP0gIE8pla7jukyEk6456nUaTLYMZFujTSka5Bn12DYlXNXSsU
 dGYAmyWL/QrW6hJxF4zcorCYn/RCkPPLkHj0C1BPVkIRuNQjp/rJy95N8zMCfqBDUeDDTf
 G+cqrcOqJQsJU2e/zNKiMfA3mcm1BX8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-BwNAYltmP9yd5iLIZvWSsA-1; Thu, 16 Nov 2023 05:27:57 -0500
X-MC-Unique: BwNAYltmP9yd5iLIZvWSsA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32d9751ca2cso304163f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130476; x=1700735276;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FlHlGuIFKBdR7Fli1C8w7UyO4Sn2DZFiv8/q8c7YdBo=;
 b=u2G3W/Gtmc0ZhkVNfnSX1n5s5o24AedV6mATy4xHYpYCQk8I6drnoyXmKfB5WuZpM2
 4ZB+EW9DVdmapewr+81YjwStCGyY58Go0B2+RacicQ24WrbrUQwUEnU8+OnIgj9gqHzV
 Hf3bx1poAQRu73UBrXtNee5SeFwCU6GZRVM3bYnm8k7kY8ojxWv3Ljadh1/Cjx4VCz2d
 P3u3wDWFf5o1Q9oAC+8+bc5N0rTpsRGqyMsy7Dml4NYRXSUk6axavF8lozrk8dAm07PZ
 qP0Zb9NJRfC91gmqH0iL4DP1HXIsTWVJUuf6QDQ0079xjYuF0Uzv5rq54vOePtJMehD0
 eN0Q==
X-Gm-Message-State: AOJu0YzHsI3yjdlTB6N4TNC7GVD+XM6oNiN1A3A+TAmPcRNZUmff9ST5
 nMv0MHkKz0LkQPYL6iPt4oX7ebfl1UtP/1Otx4fmE8G7MYm7DBQGcJq+h1qWXcghZo+jA+UXgs6
 GCeffu/AWrvvXS/ulMUiKzPkgnrku
X-Received: by 2002:a05:6000:2c1:b0:32f:7f65:8f3e with SMTP id
 o1-20020a05600002c100b0032f7f658f3emr11490925wry.7.1700130476319; 
 Thu, 16 Nov 2023 02:27:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVowa78+7DuIt1O2CluTlGpgTtzZ/Y0J9eR+J6IQbq1Imn9LSMs1Gu9C++CQRfYKUKXpQNgg==
X-Received: by 2002:a05:6000:2c1:b0:32f:7f65:8f3e with SMTP id
 o1-20020a05600002c100b0032f7f658f3emr11490908wry.7.1700130475998; 
 Thu, 16 Nov 2023 02:27:55 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m3-20020adffe43000000b0032d8354fb43sm13119242wrs.76.2023.11.16.02.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:27:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 11/32] hid/picolcd_fb: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-12-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-12-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:27:55 +0100
Message-ID: <87o7fu3sd0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bruno =?utf-8?Q?Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The picolcd_fb driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test
> for the presence of this flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: linux-input@vger.kernel.org
> ---
>  drivers/hid/hid-picolcd_fb.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

