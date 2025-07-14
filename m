Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D308B03C78
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28D010E457;
	Mon, 14 Jul 2025 10:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HAlaw2CD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF1A10E457
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752490277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KMqUL6cwfYJFRkeghLWqOuGBrAb7IcRck5tD36Dsorc=;
 b=HAlaw2CDR1xtaAn+naWDeKX06BJ9lW+xR1LwxZq+ta3hpUvHBzYzAVPzV200eW7QXShykA
 +AywavafqgzMH6YmwT9pdtC6SwJpSuH9yuAnECi67hahOt//MjVEyxhx4RFeLsX6hHOYzl
 +ZES7L9+p/ENNoV0KDbMQ3LpCl55U00=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-1r0yQJYyOQqv_fOgYqkVZg-1; Mon, 14 Jul 2025 06:51:15 -0400
X-MC-Unique: 1r0yQJYyOQqv_fOgYqkVZg-1
X-Mimecast-MFC-AGG-ID: 1r0yQJYyOQqv_fOgYqkVZg_1752490275
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3b5fe97af5fso413661f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752490275; x=1753095075;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KMqUL6cwfYJFRkeghLWqOuGBrAb7IcRck5tD36Dsorc=;
 b=G2vEdOHpBw34tZYeFAyLClVdL7cC6bJ4+l6mpGS9ylNGpeCf1VkNjCEYeHBR5aUMnz
 6x5lgSFGefPQBm7/nui/Al02WVkBfljFyzYZI45yqCgLTCeoW9rpWJoLP5DQOz+J8Pb6
 MvByGHrehyIojF5U8QmWgZxYHVJEdhhaJN0quMEjuGmtZeo3vcBTEO6twepEMESq5ZOf
 IxWJFsCt1TKbRd/EetKAMnct84sj3/oBJc7Pu5zviwXoByzwNfq6MdE8wSfVb1vqWCUP
 tWtGxq1KbCOJsIFs53wOXUHqcI+pOpKbvEXLG3SsvhI6JKhl4T1klEjD/H8i6u8jCoDy
 3uoA==
X-Gm-Message-State: AOJu0YzAJQuqNMg4tiUrA4tyX2MqMEFawpaonZWwxt6ugLS4EZUvkk5J
 Zp9d5g+OyYw9TKde++k23zYt7Y26h9ZjjStTBcmqM0xi+8jmj17A847c6TVCiGYZwOcCcrz7UoK
 apBfoW40O3Fq/hA0lwHnegCasUtKw9F1dfndnaimDgBw6qZb27n8/gax45AR5ezKCouMT1g==
X-Gm-Gg: ASbGncsxkY2OKoY3H/UBfpEwtvG76JpNBoi52pZLTJIWv5JxjnBTIW8pr6g7YxbfOPk
 QjA9iqL3Y988A5h1ghhim8x3GDxvYKdULi36bXRl3nes387PKBOyP/tURK+2sPPk7OMuJBBnflm
 mqM2WkkdT4okrkJeV7LdfGxbTpMu2o+eO3yfg6xhwTzSLT+Y8Fc4oKNI+Yh89kvXlarPENTjOUq
 cSeEwR4nDv6XFu98YEHi+dGIAFj83mbivroe8BHkoHYclEb3ndM3qtI7x2yZxPNwivYzzM4cJHc
 CXhyquxwpAYgjqm16EZWvs7ALj+Q3vddElBBjEnaejHavkB/GFeE7KVxewCJI4SbNw==
X-Received: by 2002:a5d:5c02:0:b0:3a5:2182:bce2 with SMTP id
 ffacd0b85a97d-3b5f188e909mr12274025f8f.17.1752490274641; 
 Mon, 14 Jul 2025 03:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFr2MLp2GtBbRb7dAnQ3PHoYy+krsW1/SDOnEpDEWml/U0H6r4RESt/RNwqNrkILiCRq/Q6Q==
X-Received: by 2002:a5d:5c02:0:b0:3a5:2182:bce2 with SMTP id
 ffacd0b85a97d-3b5f188e909mr12273989f8f.17.1752490274183; 
 Mon, 14 Jul 2025 03:51:14 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd537c6fsm130546685e9.21.2025.07.14.03.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:51:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: display: sitronix,st7571: add optional
 inverted property
In-Reply-To: <20250714-st7571-format-v1-2-a27e5112baff@gmail.com>
References: <20250714-st7571-format-v1-0-a27e5112baff@gmail.com>
 <20250714-st7571-format-v1-2-a27e5112baff@gmail.com>
Date: Mon, 14 Jul 2025 12:51:12 +0200
Message-ID: <87o6tnkpun.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J8-hLe3wHLZZSrMUkytaNiw5Khn3ye_UqbCQksdQ0kA_1752490275
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> Depending on which display that is connected to the controller, an "1"
> means either a black or a white pixel.
>
> The supported formats (R1/R2/XRGB8888) expects the pixels
> to map against (4bit):
> 00 => Black
> 01 => Dark Gray
> 10 => Light Gray
> 11 => White
>
> If this is not what the display map against, the controller has support
> to invert these values.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Could you please rebase on top of my series that adds the ST7567? Because
I see that this controller also have a "Inverse Display" command, so this
property will also apply.

Or do you prefer for this to land before and then I could post a v3 on top?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

