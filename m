Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF5607F8A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 22:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A05510E667;
	Fri, 21 Oct 2022 20:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3B310E67B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 20:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666383134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JX/59qgotHOb21DdrG8ALpYMBcH+ITiCC7HbahzreUk=;
 b=DfJ5hegPXvNNdh5FMOeBW7hKZAsejaGQFkM2+mW2irFrzekvz7rZxTHl4ihxGB8uaFSS7p
 dMUx6nvyEudg1SCXu2l9ghMQZ/rMzUSU+Y/nJ7UmlT2gH2drbSZV2DX4oi4zBu+b5z+ymq
 2LZt/zIwzQmeo7EZxtenTZbaDfmHPws=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-56-xB77VSm9NyOwD92UYMqwqg-1; Fri, 21 Oct 2022 16:12:10 -0400
X-MC-Unique: xB77VSm9NyOwD92UYMqwqg-1
Received: by mail-qt1-f197.google.com with SMTP id
 d25-20020ac847d9000000b0039d0dd90182so3249659qtr.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 13:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JX/59qgotHOb21DdrG8ALpYMBcH+ITiCC7HbahzreUk=;
 b=AmSATGO+XDAqcZzIHNFlIq31FZfIQM8a/PETzv6C/xF1yB2rtg72AAXnZVX05kkBm0
 cdCwuXldrT9KaxS5G3dErRFR6GUvYk6KuqaUKyG/OAu+RuCw/rZXpmOhSy+yBF/gT6hf
 FqKtnpKBoz4tQiM0MAJc0l/ISTIoaeRes8PzHe7CN9nCIitb84xceV+Xv2kXIJ/ywfY4
 6qeWl2HGekdv5RWYhW1/bGil8qdJLimjjHZShPwI9MforSyIoG15zIxie8KUhHxDMwaD
 7hIHp1n8F6nON+eGBFVchaKjyH1ArikOi3DwDp9CADz1mGQF7i5/PPvQROdHWdgsDCTh
 eHwA==
X-Gm-Message-State: ACrzQf2QbYtVB2jwsnaZK2K8vtbBZ3L8HyzjEdbhpeaozQnfSD/BlN3B
 /ETU6pkn6ekPveO4BgQ3iXoahKdETE8/SjvJST0pd5lc8ArMm/wfmm+JHI1iyuw4QEEjcPAxJL6
 GR88TAKqNFwgZsyn0LXxh1U7SH4D6
X-Received: by 2002:a05:620a:1112:b0:6ee:94f6:e5eb with SMTP id
 o18-20020a05620a111200b006ee94f6e5ebmr14293236qkk.720.1666383129109; 
 Fri, 21 Oct 2022 13:12:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6C1ormDUi1zdnhNjodcWDR9Z43uhN1St5p4w9kOXgVqPC1EaCPUEndFlOGtL55RojMxEFGEw==
X-Received: by 2002:a05:620a:1112:b0:6ee:94f6:e5eb with SMTP id
 o18-20020a05620a111200b006ee94f6e5ebmr14293226qkk.720.1666383128909; 
 Fri, 21 Oct 2022 13:12:08 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c68:4300::feb? ([2600:4040:5c68:4300::feb])
 by smtp.gmail.com with ESMTPSA id
 bq12-20020a05620a468c00b006ee957439f2sm9992460qkb.133.2022.10.21.13.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 13:12:08 -0700 (PDT)
Message-ID: <75ecce4d9c83595aae7589f9065118b401adc92e.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Remove unused variable
From: Lyude Paul <lyude@redhat.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Date: Fri, 21 Oct 2022 16:12:07 -0400
In-Reply-To: <20221021010703.536318-1-zack@kde.org>
References: <20221021010703.536318-1-zack@kde.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Karol Herbst <kherbst@redhat.com>,
 Thomas Zimmermann <tzimemrmann@suse.de>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next as well

On Thu, 2022-10-20 at 21:07 -0400, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> Trivial removal of an unused variable. Not sure how it snuck by me and
> build bots in the 7c99616e3fe7.
> 
> Fixes: 7c99616e3fe7 ("drm: Remove drm_mode_config::fb_base")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thomas Zimmermann <tzimemrmann@suse.de>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 928fdfa8e8e5..2e97186090c8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -659,7 +659,6 @@ int
>  nouveau_display_create(struct drm_device *dev)
>  {
>  	struct nouveau_drm *drm = nouveau_drm(dev);
> -	struct nvkm_device *device = nvxx_device(&drm->client.device);
>  	struct nouveau_display *disp;
>  	int ret;
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

