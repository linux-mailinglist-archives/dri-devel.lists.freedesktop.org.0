Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E9EB3E4B4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 15:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19B010E460;
	Mon,  1 Sep 2025 13:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ck8Zgk4W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6328710E460
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756732992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cxq7T2V7lpPnrYC2+PR+qicjY5gpUXVxT7pGCrLEVTk=;
 b=Ck8Zgk4W0reXu5h8jmqDBDmBCF3aZYwEEsH6Gh+bg1AS5gE3fRfNjYAEhDfktirtMOaBhl
 K6ly/TjS2EZrM3nbWSzTFo6B04kLq13EyZrh61TiignzXbXhx3hr1D5VgLX00+9wjaZu5S
 Co5qFbio8mdn4Skx/OeBUcrz1BIGUMY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-kVyJz366PqWgoEQpmzX-Fg-1; Mon, 01 Sep 2025 09:23:11 -0400
X-MC-Unique: kVyJz366PqWgoEQpmzX-Fg-1
X-Mimecast-MFC-AGG-ID: kVyJz366PqWgoEQpmzX-Fg_1756732990
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45b71eef08eso21850635e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 06:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756732990; x=1757337790;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cxq7T2V7lpPnrYC2+PR+qicjY5gpUXVxT7pGCrLEVTk=;
 b=RJCFNNkO4dLi/CxwX/eFIaX23yREubrkj5mOCbUYzd6TwN9egpOdW7LWH5aPED14Jc
 0qeLcyWP7DBYKoJgXL+37Q9E0sP7TGsAmURlqYlSwfjN1dHLwwiArAUhH8T/8id8GQrD
 fs3e5NXTy7uhXfCi6BhJ/xj3z4+SULXjBvjmNuZe1ubpwyOwOAqPb5U7VXvweuiN/A9c
 +lylkJ2y6VWCGM7hWbywaKVV2bzWk98V6+v1qWLPY/2VpXI8oqwZy2zBcZv8sDZVc9RC
 emzLi1S6jv3kI+MK2A826tukzqJJhqShQccgeHU3MPaF28hsY6NrX7aSQjCwbvdy8M4y
 TbTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlIGoU8MOj3t16Ecp8D2t/n3F+WRkj1QwXrBdN7Pk81XyooSXyETBWhTJ8KSrJSilge1G3UR4d7w8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOhduga2Oq5Il1GI7fLXnBIPHQP+x2J3hgZXJSMv/+1oh8rJ9h
 p7JwMKv7wMYWP1zYGuKVIMDThpnZCOSbOq742iZKxuAQV/ZH7hPjkeH0YLP9r+f5Pt+kx4cB+5O
 nHUBOPxkEAQjwC6g/hf+0xcqvZi+H54ygvSbwMWoXB1TqCqaap1eSA9R2NfUUfKAZhJHiLA==
X-Gm-Gg: ASbGncvmmBbIbLXQqIA+yOZICCBRYyxWXPEEzMDxzNxw8W1zer7ooFepmGVYGQtaw9u
 bxN23U+oPsSU4iAzv4kgFEnXgo9IrZDwEqWGhtEOa3wNh/yv9+fIP/e6sNoYWadaHvnPBuNJGjj
 WpBPLt1YYx9VcfmCUnttIxle6ptTFmzISrLVywSHbaGeda5AjZ1Zh0WKu5Bbx+fWXqYSNoM57XH
 PR+SSwwx5HIQbGxDvRhc5mf0t/O4ndWzv1boCQps1kz1ODzoFjrFC4I7UFMMvGxwn2OENWSLRIH
 9xC2JnFlsnsQrwMM64ZsMQHsdqkkjfpRtoS+TUH4W9u0a67bc0ZVuoy7qlnTd1Ht8A==
X-Received: by 2002:a05:600c:8b42:b0:45b:7e86:7378 with SMTP id
 5b1f17b1804b1-45b8558be6emr57927795e9.34.1756732990192; 
 Mon, 01 Sep 2025 06:23:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn+xR292CYaY9FGMba3rZUFGRMyeIqFOQQHajodDM19zB/eMHw015CBudwcpdCSUn47hWdZg==
X-Received: by 2002:a05:600c:8b42:b0:45b:7e86:7378 with SMTP id
 5b1f17b1804b1-45b8558be6emr57927525e9.34.1756732989773; 
 Mon, 01 Sep 2025 06:23:09 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm209197995e9.17.2025.09.01.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 06:23:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] drm/format-helper: introduce
 drm_fb_xrgb8888_to_gray2()
In-Reply-To: <2b0eee63-2b7d-4ca5-b673-4f3761d2e386@suse.de>
References: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
 <20250721-st7571-format-v2-5-159f4134098c@gmail.com>
 <87y0sh947w.fsf@minerva.mail-host-address-is-not-set>
 <aJnc36ojqSb3-Ti2@gmail.com>
 <2b0eee63-2b7d-4ca5-b673-4f3761d2e386@suse.de>
Date: Mon, 01 Sep 2025 15:23:07 +0200
Message-ID: <87v7m2fgsk.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C0AiIJLqWluFhM01R0Ocwbifs8dYzzUlyLf9USf_5uk_1756732990
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi
>
> Am 11.08.25 um 14:06 schrieb Marcus Folkesson:
>> On Mon, Jul 21, 2025 at 01:24:19PM +0200, Javier Martinez Canillas wrote:
>>> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>>>
>>>> Convert XRGB8888 to 2bit grayscale.
>>>>
>>>> It uses drm_fb_xrgb8888_to_gray8() to convert the pixels to gray8 as an
>>>> intermediate step before converting to gray2.
>>>>
>>>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>>>> ---
>>> I would like Thomas to review it too, but for me the change looks good.
>> A friendly ping to Thomas.
>
> Apologies for the late review.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>

No worries and thanks a lot for your review.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

