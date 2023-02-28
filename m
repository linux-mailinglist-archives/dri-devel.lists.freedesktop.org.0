Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456106A566F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6022D10E4A3;
	Tue, 28 Feb 2023 10:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA7610E4A3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677579314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K51OczYP7SeMetE9KkWlV6QdX9xBOn+hRMMC25uTTDU=;
 b=PRr7MnuQRsQnjr9B6GZmndvRjg8pFhc6ozD6AG4l4yNZa2O+UjbYulOcp7wztgHoTKkXMv
 10+xCjajqqkGtJHDQxWoaFQ7LpoR9aCN7PjEPhv2zC0vk/dd4Uh/38pKK1BsCQB0cxKCSB
 G4M/td78WhzVaVcrh8sFllIBD7hwuM4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-482-Wuyji1aWPwGKWssnoVwBQQ-1; Tue, 28 Feb 2023 05:15:13 -0500
X-MC-Unique: Wuyji1aWPwGKWssnoVwBQQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso3439919wmb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 02:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677579312;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K51OczYP7SeMetE9KkWlV6QdX9xBOn+hRMMC25uTTDU=;
 b=oRzLYSavkNsHQYNETruETceuhkuvW2or5tKDmnm3aWccGP6vQMS4G7Yw3lUUE98D7W
 5cU7mXZRnM9/WJWTb2mVTgwWcv9nGAvGJa/BD1STRiW+hJ0jtmUu2oa7KBJlRuSMT6j8
 TCk5MdQsMwKINkCTbZms8N2WPbdZdRamuxWj+haCgXJh9KzO100VzVdUzeQSznOaRtgW
 i2LL1lqRFmUJVEkmkzN1/pnltCPlrQ3O9jjCRwLgEwW1WkkKnDISL0ILy2egM986Zduw
 A9IQjLq12EzxsMHzBYMl+zvjbURnM8vXexOy24rssQkPYpM8ZQXVKlsbmCAjkcGwfzAu
 zjVA==
X-Gm-Message-State: AO0yUKUmcYTJ1AZPtTIx+t9t0zBPmtWfgwMWL8wh51vYScIac9oxLrXO
 16x/orc7YPIboUIKg5eVJGwfdnnSR+/XsEVqLX5Zbgg3k7t6rVlCwzR8ZUNTre7WF5BexG5yP0R
 bbzdM0IJDR+OGCMUF5PWcvZVOvx8U
X-Received: by 2002:adf:e409:0:b0:2bf:cfb4:2e1 with SMTP id
 g9-20020adfe409000000b002bfcfb402e1mr1569888wrm.45.1677579312037; 
 Tue, 28 Feb 2023 02:15:12 -0800 (PST)
X-Google-Smtp-Source: AK7set/K7eqQd4TmbRvEuFHPKXLEkhvpS5ntjCp/gDi8c5/G5TJbC201Ads6nFZvI8g/OGBuyEE+TQ==
X-Received: by 2002:adf:e409:0:b0:2bf:cfb4:2e1 with SMTP id
 g9-20020adfe409000000b002bfcfb402e1mr1569875wrm.45.1677579311779; 
 Tue, 28 Feb 2023 02:15:11 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j24-20020a05600c1c1800b003e22508a343sm12847542wms.12.2023.02.28.02.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:15:11 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 1/4] drm/ast: Remove little-endianism from I/O helpers
In-Reply-To: <20230221155745.27484-2-tzimmermann@suse.de>
References: <20230221155745.27484-1-tzimmermann@suse.de>
 <20230221155745.27484-2-tzimmermann@suse.de>
Date: Tue, 28 Feb 2023 11:15:10 +0100
Message-ID: <871qmayu35.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Replace one call to ast_io_write16() with two calls to ast_io_write8()
> in ast_set_index_reg(). The combined 16-bit-wide write of an index
> register and the corresponding data register only works on little-
> endian systems. Write both registers independent from each other.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

