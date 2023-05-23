Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CED3F70D72D
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BE010E03F;
	Tue, 23 May 2023 08:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DD710E411
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684830051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DndqY8qaw8M96mn1iEYa/a1K7y8wRhCJTZ8hiaPo6U8=;
 b=WfIEfRYtGXAFzTuO/pG9Et4JjLMPUC/21M0a9bQixGBXs+b7c3Ot9B9zccrM8fXwA0b1yY
 Y0B62yS9qKDWFdiKq/ZeeSOke8rfsZOdQmfjOh0qeYsoxBAxIfH6v40jdo7u8LPbI+iyvV
 3KWUYjVYQAuM8KaWmSk9/wy1yH0r2AQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-jgJXRRmOPsWLGEIOmt46rQ-1; Tue, 23 May 2023 04:20:49 -0400
X-MC-Unique: jgJXRRmOPsWLGEIOmt46rQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-96fe603151eso251285566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 01:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684830049; x=1687422049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DndqY8qaw8M96mn1iEYa/a1K7y8wRhCJTZ8hiaPo6U8=;
 b=QxKATz8LlJxNab1WouaLRbR+CPlhhwl8Uuk9s264hJXyqyOf5SfkkfeLG2lZeDIG0t
 gSmlJZEFozDWf1HcxxW5PNQYuFwMV6k/iEnq+GuaPIx4BWTooAmL5AfuAyAtRgovUuYh
 qm+cGsac3xJsBxQjHRCk2Jw0uHGw1UC0sn3eALlPgDOjMs3iXfD5QxFcHyjZ/Ly0hLHR
 zzmo0xT1+dXaJIxEqB/kv4oWtGTogm1OvNprZnsmLMOVE6mZUoPJoEE2L/qlDLWns3Y9
 azw+yCenwbpVLJfYmAQBFDusGzbhugpDrLJAUQzN13Qz3ak4Z5V8eLMyUiWSCLFTkeEX
 Hf2A==
X-Gm-Message-State: AC+VfDwCIdpNEdvjPqaPTtufPWmLuJKIMR+VxLR8oNfXOPmvouBeg9CA
 4vUV8+d0Gz3kjM+hDQp1+jab2ygtB6Jtw0Y0mIHPnuNaSHqsWII4hZzeaxCPGlrvfHiIuF9jC96
 Symo+ucZ/4O8w269e0fRyiY5+b5muMzecyXix829mo8yc
X-Received: by 2002:a17:907:3f02:b0:966:4d99:b0aa with SMTP id
 hq2-20020a1709073f0200b009664d99b0aamr12167260ejc.59.1684830048887; 
 Tue, 23 May 2023 01:20:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vDJ2caLgBzpJg2BUoYLuue6tySLcgqmgfjT+iH7/Q0IOlMoDmJKkj3IlzO+ADI9Tech44ouiizk9C2natgqM=
X-Received: by 2002:a17:907:3f02:b0:966:4d99:b0aa with SMTP id
 hq2-20020a1709073f0200b009664d99b0aamr12167237ejc.59.1684830048553; Tue, 23
 May 2023 01:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230522191701.13406-1-tzimmermann@suse.de>
In-Reply-To: <20230522191701.13406-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Tue, 23 May 2023 10:20:37 +0200
Message-ID: <CAFOAJEdxxMUpc53m0YkkO+FzqYr+JFcGkH3T6HTnodV5bKm=Fw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Use struct fb_info.screen_buffer
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On Mon, May 22, 2023 at 9:17=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The fbdev framebuffer is in system memory. Store the address in
> the field 'screen_buffer'. Fixes the following sparse warning.
>
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26: warning: incorrect type in ass=
ignment (different address spaces)
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    expected char [noderef] __i=
omem *screen_base
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    got void *
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

