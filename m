Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CA46A56CE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850A110E685;
	Tue, 28 Feb 2023 10:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBB110E682
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677580373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PSHzNwNyBTU5voEDPxDoW6Iigh14EaPDcD4ZL6T6530=;
 b=UJ9lrUQXkTBWCSAuVG+4slT5IhAghzTMkseSFPCrcXiTE4yPP8ExNxxDCoKELAqXi8ANb7
 x2+qNmQz0p/pUjxJ23ybC3QapEQWQCe33U/7kQyY0MXeEoVAtEV8oDRgqHQ7LgcZxrSTcc
 4JOtLABNWMWWI1AlkOVsxG4+fmGHKDM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-395-LuJ6cOAbMQGVDi6-h4EvNw-1; Tue, 28 Feb 2023 05:32:51 -0500
X-MC-Unique: LuJ6cOAbMQGVDi6-h4EvNw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l5-20020a5d6745000000b002c91cb49949so1398295wrw.14
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 02:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677580370;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PSHzNwNyBTU5voEDPxDoW6Iigh14EaPDcD4ZL6T6530=;
 b=CNNKU5nqiko1ZHhWYeCetPEArFfzuR32eUkDe5eFfP+vetRFW0R03zzO1cpIB783AJ
 p051+UCz8CVegX6ScLuLcky953l9qxUXwl/SSN/PAKDzIJsCMMQWRKhAp0C9sQIPw6K2
 WyzeTV4Ae/gBuCJRBoWPVrBhGHI67mWWhd/zuTnd2luxfC6OFQjTTeyoNGSKT6F35ejm
 UWiDSEZzfQPnwVVNkQFqoLdREFv/EqoVPUS0yiIo2EkpC2cosbi9wQSRx32yF5FAHpT4
 tXUraGStyCe+78MyqzIXHf3ScSj2kFkWKgJmGA5q2PU1NLDh2sVLWcqiiGUn9ACx9RSf
 gyKg==
X-Gm-Message-State: AO0yUKXSx0VgbkYFkqS8N3mQpkJHm4S4V/PtpDrKPqens3VguKxxmQs/
 YHNHGFe9MioVGtVC/H3jjFOVl/mWAZ9xmBAg/nHO470zYafrVQOGMrjt8T3ZmctmrO0zuNr2vTc
 nEEQ7aHha0BoJmONNCRpYISfbyQLSMGUsEw==
X-Received: by 2002:a05:600c:3507:b0:3dc:4fd7:31e9 with SMTP id
 h7-20020a05600c350700b003dc4fd731e9mr1988684wmq.7.1677580369829; 
 Tue, 28 Feb 2023 02:32:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/oi1+QqfKFMsamJqIB6d/279ZxrQvwvGIVLjhhPLPrvNlPTJOerT36Ksm27owBpFB6YB1Nvw==
X-Received: by 2002:a05:600c:3507:b0:3dc:4fd7:31e9 with SMTP id
 h7-20020a05600c350700b003dc4fd731e9mr1988667wmq.7.1677580369537; 
 Tue, 28 Feb 2023 02:32:49 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b003e0238d9101sm13448441wmb.31.2023.02.28.02.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:32:49 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 3/4] drm/ast: Rename struct ast_private to struct
 ast_device
In-Reply-To: <20230221155745.27484-4-tzimmermann@suse.de>
References: <20230221155745.27484-1-tzimmermann@suse.de>
 <20230221155745.27484-4-tzimmermann@suse.de>
Date: Tue, 28 Feb 2023 11:32:48 +0100
Message-ID: <87v8jmxepb.fsf@minerva.mail-host-address-is-not-set>
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

> The data structure struct ast_private represents an AST device. Its
> name comes from the time when it was allocated and stored separately
> in struct drm_device.dev_private. The DRM device is now embedded, so
> rename struct ast_private to struct ast_device.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_dp.c    | 10 ++--
>  drivers/gpu/drm/ast/ast_dp501.c | 40 +++++++-------
>  drivers/gpu/drm/ast/ast_drv.c   |  2 +-
>  drivers/gpu/drm/ast/ast_drv.h   | 40 +++++++-------
>  drivers/gpu/drm/ast/ast_i2c.c   |  8 +--
>  drivers/gpu/drm/ast/ast_main.c  | 24 ++++-----
>  drivers/gpu/drm/ast/ast_mm.c    |  4 +-
>  drivers/gpu/drm/ast/ast_mode.c  | 78 +++++++++++++--------------
>  drivers/gpu/drm/ast/ast_post.c  | 94 ++++++++++++++++-----------------
>  9 files changed, 150 insertions(+), 150 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 56483860306b..9e34297d836d 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -9,7 +9,7 @@
>  
>  int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>  {
> -	struct ast_private *ast = to_ast_private(dev);
> +	struct ast_device *ast = to_ast_private(dev);

I would just squash patches #3 and #4 and rename the macro as well. There
is no need to have it as two separate patches IMO.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

