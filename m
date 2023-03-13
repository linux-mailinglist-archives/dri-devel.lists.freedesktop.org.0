Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB89C6B7F7C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 18:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7B210E5E0;
	Mon, 13 Mar 2023 17:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB40610E5E9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 17:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678728486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0evT8Vtbk81R/TosIabCJgTCcIOpvJ7DhYFh1FtAtkk=;
 b=TCKg/ab99BjIiwH43yGKxB4srqPagU3cZtdoF++if9nBRNi9nrIlfSZRfClLECBVil+MIz
 BBRxH8ZtTbERwENVJB2Vx+6gJKtNXtmSe28vd5oH/QZsuhHi6v7V600g3vv89CAklRTHUt
 +JXusmnEVOBUwxkcFMyRfDUa4+KQWAs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-6r1yVwR3NJG-a4GrGzEg9w-1; Mon, 13 Mar 2023 13:28:04 -0400
X-MC-Unique: 6r1yVwR3NJG-a4GrGzEg9w-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so4430983wmb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 10:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678728483;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0evT8Vtbk81R/TosIabCJgTCcIOpvJ7DhYFh1FtAtkk=;
 b=phQThQ2LEuRdt06T+yX6/8ttU+VbQsEedlKUToAvwbE1/6PaGnCDcPmNsvUkZlUnwh
 r5FKupwQ7pAprr4Ayz8LxnYoCu6szxkMKpqFMkdTBr3pVDeU8l61PQbTzPGYPtadmPsr
 5AijzDPT4oVD6nt7VpjsPn5iuCSKsyryL8nrB989f7dFtT4zezWMZpBLYPN0rttIQanj
 aUphmLXxSHk+5ArwO7iqSqA+gl9rIX2JQaWPNv43ykXAubt2cZeKZOOYE0mTAE3xeYok
 olsJiJqIs6OENUIswkAmsoLp8+kM992k4ilnucrvZEWAek7tD6sRb6u/X5aTgY6OnFS5
 CqCg==
X-Gm-Message-State: AO0yUKV9dCSlY2MuodX68fMg3bnyTTN178Tb65d+ZXKQrWXeAhJJct3n
 chYPPgIY/+XUCtkPJ3RaNXXwn8cufnpkfknGQlmgR6EmWiJQD9LCvR6OoxlEk/n1IVFxfANYLqc
 czFL6H5R0m4krnyqLHM3By7L2KBAV
X-Received: by 2002:a5d:67c5:0:b0:2cf:a4a4:4990 with SMTP id
 n5-20020a5d67c5000000b002cfa4a44990mr2719452wrw.12.1678728483489; 
 Mon, 13 Mar 2023 10:28:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set/7GgtuVqfDGuMBUhrVNWrlcKe6Ov6XP2yqoEXeAWGzA4mJRnXO1p4TuJbvR1Qp74HfmtJO/Q==
X-Received: by 2002:a5d:67c5:0:b0:2cf:a4a4:4990 with SMTP id
 n5-20020a5d67c5000000b002cfa4a44990mr2719430wrw.12.1678728483226; 
 Mon, 13 Mar 2023 10:28:03 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a16-20020a5d4570000000b002c5539171d1sm35268wrc.41.2023.03.13.10.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 10:28:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/virtio: Enable fb damage clips property for the
 primary plane
In-Reply-To: <20230310125943.912514-1-javierm@redhat.com>
References: <20230310125943.912514-1-javierm@redhat.com>
Date: Mon, 13 Mar 2023 18:28:02 +0100
Message-ID: <87ilf4lfx9.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Albert Esteve <aesteve@redhat.com>,
 Enric Balletbo i Serra <eballetb@redhat.com>,
 Bilal Elmoussaoui <belmouss@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org,
 Christian Hergert <chergert@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Christian Hergert reports that the driver doesn't enable the property and
> that leads to always doing a full plane update, even when the driver does
> support damage clipping for the primary plane.
>
> Don't enable it for the cursor plane, because its .atomic_update callback
> doesn't handle damage clips.
>
> Reported-by: Christian Hergert <chergert@redhat.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

