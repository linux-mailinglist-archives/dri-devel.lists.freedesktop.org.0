Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4983576697E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8753510E6D1;
	Fri, 28 Jul 2023 09:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E26E10E6D1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690538186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U0nQmkIx0uMFTk7seYDZJ5H4WZLfPJM6Ejko8L/+g2U=;
 b=AOwnnPRxuVnAwGSLdQUdQJtrXT/PzFPgBlvBVbV0c5CYkWSHD09fixVHcS+bCs5adw1GKp
 /Dczy0IC+V9zX4u6aQIekd3TIpgS+FT6ZGnPTBrplavWza9JLIbzJiOIFa3qppSTg/Yem2
 0LQZkcDjmU4AZDuRs61AysCOFrVMcww=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-LnB6_sTMP0m8ab-1Idkt1Q-1; Fri, 28 Jul 2023 05:56:25 -0400
X-MC-Unique: LnB6_sTMP0m8ab-1Idkt1Q-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b6f97c9d54so18858331fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 02:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690538184; x=1691142984;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U0nQmkIx0uMFTk7seYDZJ5H4WZLfPJM6Ejko8L/+g2U=;
 b=h0y6IGipPvsntnl39UZ6fiBgj8m+m+JmTMGO2IxSjR+u60ZMhGIOXcnIRueGUZb0Ww
 w6+uoyJ/gdyqVZ0S5q6ZiAuGw/GwQJKn7s+MxlDO3DEX5ufK3x1CIM9hzsWUftU88+qg
 5MgYyovhSaeWwurX1yqiTVb7bhUWreRWK7QOKbvYKh7rEw7xdBoHB8nT5pFMs1DzwhWs
 vKvFfEjkx3vgwUaflguB+2/dLMROP+HIndXLYgRShD8d3Ks+JUpcVgpcluB83lvHUtce
 35dDrJDxG6TnwQfW3MFSqM9kwjVm8vw+AydBuVQjfb97xzqcybXIBVykyAHvqatXSCsJ
 rvzw==
X-Gm-Message-State: ABy/qLYZEQ9ja5+lN+jbWUiWcCLl4u2glV6apGx11I/u9Z5wb6s87Yto
 d2TaUPVYHhOqNLt/T76xz0E3IEk6XEduHq68vyrlKUATmKI0wvHhPa6kPuGxSOTm+Ue8CZNfcG6
 B3wn0NctCbu4GrsiJuHOLdVzseHya
X-Received: by 2002:a2e:8348:0:b0:2b6:ddab:506a with SMTP id
 l8-20020a2e8348000000b002b6ddab506amr1383759ljh.34.1690538183852; 
 Fri, 28 Jul 2023 02:56:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGwahOxbYJkEWBd03saQPCa6kZbAUxNDbMT+3FiXqFtgqQ72w3vwPLNd17NXDdmeysAzUDaWQ==
X-Received: by 2002:a2e:8348:0:b0:2b6:ddab:506a with SMTP id
 l8-20020a2e8348000000b002b6ddab506amr1383744ljh.34.1690538183543; 
 Fri, 28 Jul 2023 02:56:23 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f14-20020a7bcd0e000000b003fba94c9e18sm3822745wmj.4.2023.07.28.02.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 02:56:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/panel: simple: Simplify matching using
 of_device_get_match_data()
In-Reply-To: <64ded5b7e809e4c6e915b2c4d8b82e02319cd206.1690535800.git.geert+renesas@glider.be>
References: <64ded5b7e809e4c6e915b2c4d8b82e02319cd206.1690535800.git.geert+renesas@glider.be>
Date: Fri, 28 Jul 2023 11:56:22 +0200
Message-ID: <87jzuktl4p.fsf@minerva.mail-host-address-is-not-set>
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
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> Both the patform_driver and mipi_dsi_driver structures contain pointers
> to the match table used, so the custom code to obtain match and match
> data can be replaced by calls to of_device_get_match_data().
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

