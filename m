Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1933768142
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E5710E214;
	Sat, 29 Jul 2023 19:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E95710E214
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690657955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lWSQBrU6mRCp0Fypx1PrcUwrNExP34WInNkCzbz01gk=;
 b=Pnr0vuzcad2C1rhI2EMXfsbjDKmrKsMCHsDfWc11ZkPuvbK7b5qKCnX32aU/AzBO4PbBBO
 I8RdqMvC8mzzDgCTbyTDt5oWH4B53FNn6zoQ1Lsn9xeP0j8FJBOIxvfhNn33Gr8kSi4F4a
 w1Ebml7sqdAAxlHBCCs5IOoE/0aj8JU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-Q0RhIHUEP72AJyXKkNLlJA-1; Sat, 29 Jul 2023 15:12:34 -0400
X-MC-Unique: Q0RhIHUEP72AJyXKkNLlJA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fe1521678fso6197675e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 12:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690657953; x=1691262753;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lWSQBrU6mRCp0Fypx1PrcUwrNExP34WInNkCzbz01gk=;
 b=XtQhA7QIu90SS5n1h9iMD+Ez0oIu70VdLempEABb2FX/nOTnvACbSDdYAB41oR5WEg
 a6slB6KpdatvLNhciDCTiVE3tF6yPKquIl9TVcGiE0w2UPdMnxZAQj4tFLDJvhac2cfP
 lKo5gV6D2Clum4fL3tu2JbnJ2PEaMx9NH+nG/Tg9kOxpPKx4BUS78xGmbTEO2ohw5YlL
 pDYaT1qc8J60/cjcRPl5PCE/yFQD5x9g1fO8xr16gd2OR9Yg61eqfehQL03UQoH3l2kL
 qiDbcFw9b5gs7nqHMEqB4A5smQWX0iiXShkffAopOV2Nj9GJmv6EAY8diXhzGaYYfqp4
 eXmQ==
X-Gm-Message-State: ABy/qLZJwjmDQwNbHRvHJFU1RoytqixGZJ0YtE9njsFubvY2Mqs82JBD
 JRAXGGzQ1u6RPuDK/n5uWL7QNyDInInj9V0HUQdqwMBjBK+4NzjNvn9LN9lHAFsEAJaY1QKJ7nL
 Wwd31BWJDTwwYl+bpel/DZrBqgJ4w
X-Received: by 2002:a7b:c38e:0:b0:3fb:b5c0:a079 with SMTP id
 s14-20020a7bc38e000000b003fbb5c0a079mr4505867wmj.21.1690657953033; 
 Sat, 29 Jul 2023 12:12:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF93XYAT4RY1qtSbPT2/uVvWEfThFDERd9HuH6O96rjBp2Y+gG2ACCyiQX3M81IP7BaftOdVA==
X-Received: by 2002:a7b:c38e:0:b0:3fb:b5c0:a079 with SMTP id
 s14-20020a7bc38e000000b003fbb5c0a079mr4505858wmj.21.1690657952725; 
 Sat, 29 Jul 2023 12:12:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k3-20020a05600c0b4300b003fc015ae1e1sm7129506wmr.3.2023.07.29.12.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 12:12:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3] drm: Spelling s/randevouz/rendez-vous/
In-Reply-To: <084bf178dd676a4f07933eb9fcd04d3e30a779ba.1689600209.git.geert+renesas@glider.be>
References: <084bf178dd676a4f07933eb9fcd04d3e30a779ba.1689600209.git.geert+renesas@glider.be>
Date: Sat, 29 Jul 2023 21:12:31 +0200
Message-ID: <874jlmy1k0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> Fix a misspelling of "rendez-vous".
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v3:
>   - Add Reviewed-by,
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

