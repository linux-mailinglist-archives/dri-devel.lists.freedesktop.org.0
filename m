Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5093172B41B
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jun 2023 23:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9220310E043;
	Sun, 11 Jun 2023 21:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002E010E043
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 21:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686518236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=scqbEDyst3H6qyGOBqKvZAmBDC7H+ji2fYf2qArG2rk=;
 b=OsPASaM92QOTpDxxjXeGoVzoZgNqoWSk/QWydad/Kr+BHXuxkm4YSLZgNvzD0Y51ckSasz
 eZJ9eLgP6iEcjUwUoWpBko5ZrqRhS1yR9SjEyEN+3hLtJVTgqVmhLQpkJCZ+kr0LBLTVgj
 lY470nBL3c7BmHAxd/estxFYP9FOnp0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-HAoxLPgBNP2Fb24LrERa0g-1; Sun, 11 Jun 2023 17:17:15 -0400
X-MC-Unique: HAoxLPgBNP2Fb24LrERa0g-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30fc3469c9bso90374f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 14:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686518234; x=1689110234;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=scqbEDyst3H6qyGOBqKvZAmBDC7H+ji2fYf2qArG2rk=;
 b=QWsKEYWFslUtNL5j+fNW/Bjk7y7XBvPa4/0M1E/i8o1hEGpGO2eXWmGfmLIJhcfQ7z
 AOqsuT7NU6UIrGx+IikiI69LcmLUvkwwp+tEvOnXmLyCFgzyVi7d62xboSJeLxNIMgu5
 oQnbFQuTq1lB/2vSe5ndRP1YOTA/Tqed235G5MavXCN05SL01Y1BNa0eeKTMHhk/8oKb
 BTl8a3i08zFfH9ZEbEDcSp/MABBHUP8UesUdwa//uFCL4Sqg7RS6VQbvyaZVTNjUZDuo
 LxBA77k5H2dMNMEvMIqcIDrqyKkCEsBYHkKxvMRamJNg8y8G0D7qit76rTR0qrAe5IJR
 +hKA==
X-Gm-Message-State: AC+VfDxYEdK8GyhzI7Y5uj6n/Gr1r8SKInn3OHKeaBQaB1YZlwSfc4zn
 Bbu95GBF4faSCyTKp7VfZ+jMLkn4ahHHJGSw0DeX1ZmW9jeFawsvlI7dAhwzJGPFGr8gI8tI8wg
 t1+LsaWOreh/zKCxAM7AeNXOrnTvo
X-Received: by 2002:adf:f107:0:b0:306:2d32:8ec with SMTP id
 r7-20020adff107000000b003062d3208ecmr3807160wro.6.1686518234307; 
 Sun, 11 Jun 2023 14:17:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4N+d92dYRcxc4bhJNAzD/GW0AKTxdU6tZn11dc22gml38QoqQU+qgjonNV1d2EdoFYv23enw==
X-Received: by 2002:adf:f107:0:b0:306:2d32:8ec with SMTP id
 r7-20020adff107000000b003062d3208ecmr3807153wro.6.1686518233981; 
 Sun, 11 Jun 2023 14:17:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm10544931wru.97.2023.06.11.14.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 14:17:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i2c: Switch i2c drivers back to use .probe()
In-Reply-To: <20230611202740.826120-1-u.kleine-koenig@pengutronix.de>
References: <20230611202740.826120-1-u.kleine-koenig@pengutronix.de>
Date: Sun, 11 Jun 2023 23:17:12 +0200
Message-ID: <87h6rd1yxz.fsf@minerva.mail-host-address-is-not-set>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

Hello Uwe,

> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> commit 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

