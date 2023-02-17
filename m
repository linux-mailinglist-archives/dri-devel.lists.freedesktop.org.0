Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E8669A7BF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 10:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A4810E172;
	Fri, 17 Feb 2023 09:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A21910E172
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 09:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676624615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BhPN5mXNi0FwgA6Dw1wLPbnc9UnJcdK55RqJoCtSbCM=;
 b=KzdQ1giy8S9nwHE5Csndl5Z1HY2OmJUtEbmK9ZR2FAevwkVGdQOlhdnYoCquXwzujELigL
 klfBrmqpWGJ7Og2XVN/+W6UbtjdMHJbM+cpUJP1TigAX9MCP+Da/JXnMq55daoFv+WqXYs
 ZcqbCa7AFwCa7qecPp+viw5isQzcMMQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-2BX_OQamMYW7tBCxoeewYA-1; Fri, 17 Feb 2023 04:03:34 -0500
X-MC-Unique: 2BX_OQamMYW7tBCxoeewYA-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e1e7d3db06so357089wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 01:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BhPN5mXNi0FwgA6Dw1wLPbnc9UnJcdK55RqJoCtSbCM=;
 b=0huUMxJ1/txz8+sLIUeGpnTYtzku1JPwI9o8YlVGtZxtV7uhcWQPt3d+g2HdSwmh1R
 YU+96zqnrs9LBElT2INdwTPzlpd7y/pYRmvDaLCaHC1pE3S/E0sqDmlT1Ta82EhRIIgN
 NKMSP/mzaVbJG6J/c83p0DiJMO0AwVT4W3VtLg+hs6MgAyiuzE8gNzbDtp2ynKXTxJBz
 JjKx8tg+DN7e+D8lOAvg69GsAXX1XKCVrcwNH8gUy7YRNWmmG4CeqKae4Gmst8xPs/E8
 3hROyNBipBWHzcZUrx16feD8YaKxfLdUPGKQmeMZWUmHh/n/GDUJhGkjjbT0E/cKbbZk
 MkUw==
X-Gm-Message-State: AO0yUKXo9T5a5yB1I1O6mAi9VFVzwQ2RNcaALZsQmy70lxLppZwT8k/P
 ZpGSo9Qn6YFwxxSyihjShH00mi69bmYCZJbvOzoQ1H+iwGKN8iXPBTdaaRChpXlmVO8+HOxP+hV
 l2hQx5KWwwhCdYdRweQ8pcYNWKc8+
X-Received: by 2002:a05:600c:43d5:b0:3e2:1d1e:78d0 with SMTP id
 f21-20020a05600c43d500b003e21d1e78d0mr2417362wmn.22.1676624612972; 
 Fri, 17 Feb 2023 01:03:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9DaCWKnN1w1UtSO4QwVrREcTxPmS1GlzqesHtTH8itx7pHTxCmH391IDvaQDCHi/hMWPC/XA==
X-Received: by 2002:a05:600c:43d5:b0:3e2:1d1e:78d0 with SMTP id
 f21-20020a05600c43d500b003e21d1e78d0mr2417345wmn.22.1676624612696; 
 Fri, 17 Feb 2023 01:03:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bi23-20020a05600c3d9700b003e200d3b2d1sm4400599wmb.38.2023.02.17.01.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 01:03:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 10/11] drm: Include <video/cmdline.h> for mode parsing
In-Reply-To: <20230209135509.7786-11-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-11-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 10:03:31 +0100
Message-ID: <87k00gwtng.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Include <video/cmdline.h> in drm_connector.c to get video_get_options()
> and avoid the dependency on <linux/fb.h>. The replaced function
> fb_get_options() is just a tiny wrapper around video_get_opions(). No
> functional changes.
>
> Include <linux/property.h> to get fwnode_handle_put(), which had been
> provided via <linux/fb.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

