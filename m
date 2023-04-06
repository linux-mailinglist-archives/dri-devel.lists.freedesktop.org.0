Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7FE6D9627
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9C5891BA;
	Thu,  6 Apr 2023 11:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6362B891BA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680781514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73fvDKXKJiwqfPloJX+LFAnqnwpAkmZ6k8UwLhKl54I=;
 b=eAyn5RgG+0jYRU1IR6luIETRKlSLHOMUpTRQ0bI+PVlEHN6V79swd3UnCtdR8ySG7EamNd
 xkUpfv/qiNEh92XznBwslemSolX03IA1lSPII5+aM9XSHDM7xrOnt3+ISyNmlRr4RUsh6R
 MBPhH+t0cBh2FOp2/BEMMg0/EVYyHik=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-iNHr9fA6Ofq29IhlLQQ6HQ-1; Thu, 06 Apr 2023 07:45:13 -0400
X-MC-Unique: iNHr9fA6Ofq29IhlLQQ6HQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m5-20020a05600c4f4500b003ee8db23ef9so20057874wmq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 04:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680781512;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=73fvDKXKJiwqfPloJX+LFAnqnwpAkmZ6k8UwLhKl54I=;
 b=trJjgJ5Ya13uRZREgbDzVLND2mVaSitU+NpnzW/HaQ8uoagb0ndXwxpMVMLX644DZv
 q5s48QRmdJrSmVjr6gpmzBuIBFYUHz7IqeR2tdMJgIjLcBq9NBsXuOsCfHukEWQoCLzI
 mlz/TwLUyjS48DWGDAQdxT6e76FBGfNfnh9ePZH6qzX2+ba2ISMTbNuWw8XnxST3uUXx
 BSp3ySxBA4mWbM7/0HHvxEg6t8Tyz+WKXAQovehRdjUl++xdWnFLmElCE9C/zKBdkbUS
 PGGUyoglvBbMXNk4KoV/1A8EGSgXX0aJlbcm+Oo5seUGVHyFxAms/xu8QMHsKO55vzrQ
 dP4A==
X-Gm-Message-State: AAQBX9dAIOiBstL4HCSwVLKLkI3m86qbn6NaTr6AO7Z5zfMWg1E2oN52
 C3wjakfEETpcesYcOe3/Bp5B7+anvxr2sw0Bvt071q9SoJDj+bBrDMj8d5qUJoPty7uM3cATObb
 nK7ucKtTtVx2/0q29fUS1/rd8S3EP
X-Received: by 2002:a5d:4143:0:b0:2ce:9f0d:df51 with SMTP id
 c3-20020a5d4143000000b002ce9f0ddf51mr7219572wrq.69.1680781512276; 
 Thu, 06 Apr 2023 04:45:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350bBXZvWBsv2iUOjKDFuIx096QDwRVXdj5Wnr7qncvtEADI0rR1JbrEgGisCQmfGxq6p2RIwvQ==
X-Received: by 2002:a5d:4143:0:b0:2ce:9f0d:df51 with SMTP id
 c3-20020a5d4143000000b002ce9f0ddf51mr7219558wrq.69.1680781512002; 
 Thu, 06 Apr 2023 04:45:12 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l13-20020a5d668d000000b002e61e002943sm1518324wru.116.2023.04.06.04.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 04:45:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 2/2] drm/vkms: Use drmm_mode_config_init()
In-Reply-To: <20230116205800.1266227-2-mcanal@igalia.com>
References: <20230116205800.1266227-1-mcanal@igalia.com>
 <20230116205800.1266227-2-mcanal@igalia.com>
Date: Thu, 06 Apr 2023 13:45:11 +0200
Message-ID: <87bkk18cag.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ma=C3=ADra Canal <mcanal@igalia.com> writes:

> Use drmm_mode_config_init() instead of drm_mode_config_init(), as it allo=
ws
> us to assure that the resource will be properly cleaned.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

