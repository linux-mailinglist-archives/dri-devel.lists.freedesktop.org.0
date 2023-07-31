Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AE1768FAC
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 10:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1893C10E0F7;
	Mon, 31 Jul 2023 08:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524F610E0F7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 08:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690791028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wsHzc5Afx1z/5KjDEZBNQHniASDdnavGgK/qk3C3lP0=;
 b=OaJMxhGl4Fc7Da6/zL4h+x20rnzf1n8IGSTnxAAtqdnp5LL0DDs5EWcIhqxqWn8ogmrq26
 YdED5ecVHSJ/0Xd+tjuXX4WxX7Rb8CvHFpMqbrr7c4zF5nCgku0yXnng0JDTpVT8GF5WF9
 YiP3BXHG0GuIovXk/i6IpMdDr6Aa408=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-5shry_RePBSxnYLLmjH3nA-1; Mon, 31 Jul 2023 04:10:26 -0400
X-MC-Unique: 5shry_RePBSxnYLLmjH3nA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fc07d4c63eso26517475e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 01:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690791025; x=1691395825;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsHzc5Afx1z/5KjDEZBNQHniASDdnavGgK/qk3C3lP0=;
 b=YFcOjsAmVlpesMeBfTdWyE/T27HQl74vv+N02Sm+OJCXrhJ2SIrZUog9Gbwuy5qpSL
 8S6iIcp891Gdqx39tbWCGHOu7Z/jGrcbxX7Ptv/ANOVrGhIp0eYtDsogVllKy2acep3e
 r5jpG4h74dqaK2++S0ARCQvAGb7tBcawXlSBOd6mp6o6Z2QJ3ULXs9A9CIxovLQ3qiFH
 Zn8o/nyRWXoPcQTNTyT893eLG/AMeNB52vYOn4q3nuUyq+DkDNrfhG4cWB8b5xMoYleA
 pMw+5lHcqL044FuaaMyks4/vqUCAh3PKG7YnKFoQpnBtyq1RVTVj8lBXMY3PifgDzchW
 mA9g==
X-Gm-Message-State: ABy/qLZVufdXfhCCnK91z/iXy+o8bAISOIuoQWwVmo4n5vojmT2e3dxg
 cXMHFzjpyjSUrMtUWahTtp+MJ+0OSFUv/nIV1FcXM7YmtmxsyUeoJO4W7uYJIR/el9ke7oGUoUG
 mbRCl576mtp/0HR37X4j9dQSt+zZGtmYipteH
X-Received: by 2002:a05:600c:21c1:b0:3fe:1b5e:82 with SMTP id
 x1-20020a05600c21c100b003fe1b5e0082mr2780345wmj.20.1690791025232; 
 Mon, 31 Jul 2023 01:10:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH6WxCPiuCjMbvYCs3Muyf80T7yG1isIk70DQ2GXEQ5HFv4E9qlsTMMGH0Y/lz+Uk1eIK+VGw==
X-Received: by 2002:a05:600c:21c1:b0:3fe:1b5e:82 with SMTP id
 x1-20020a05600c21c100b003fe1b5e0082mr2780332wmj.20.1690791024920; 
 Mon, 31 Jul 2023 01:10:24 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c378c00b003fc0062f0f8sm10824433wmr.9.2023.07.31.01.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 01:10:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/ssd130x: clean up some inconsistent indenting
In-Reply-To: <20230731074927.22755-1-jiapeng.chong@linux.alibaba.com>
References: <20230731074927.22755-1-jiapeng.chong@linux.alibaba.com>
Date: Mon, 31 Jul 2023 10:10:23 +0200
Message-ID: <87pm48wlg0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-pwm@vger.kernel.org, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jiapeng Chong <jiapeng.chong@linux.alibaba.com> writes:

Hello Jiapeng,

Thanks for your patch.

> No functional modification involved.
>
> drivers/gpu/drm/solomon/ssd130x.c:715 ssd130x_primary_plane_duplicate_state() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>

Interesting that checkpatch didn't catch this, even when running with --strict.

Do you know which tool this bot is using to catch these inconsistencies?

> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6034
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

