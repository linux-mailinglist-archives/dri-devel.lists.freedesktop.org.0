Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24361555C2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 11:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809556FC23;
	Fri,  7 Feb 2020 10:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7A76FC22
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581071622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yl0rQbbe9aSm6WvN8MMtP7pc3kCYUxsvpG+aMvEgApI=;
 b=ZI8lDJwDMw0ZGt61rs8kjX0EB9/zd84I9Byz16lp4ZCBM4arDfkYMI6BnqOU7fMKRTH1xK
 OAdih4FhRYWLHAGn34JQcrkjFlOHtswCPdNfzPYfs+F+yw0o1eZ8qeALHLBvCsz72BK1YF
 CIIHnPWh3sMm84drRjBcdamMWBCY//8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-YKGTqmbqNx67jbKFI2bxwg-1; Fri, 07 Feb 2020 05:33:38 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92356100551A;
 Fri,  7 Feb 2020 10:33:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C622386;
 Fri,  7 Feb 2020 10:33:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6D783A1E0; Fri,  7 Feb 2020 11:33:33 +0100 (CET)
Date: Fri, 7 Feb 2020 11:33:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
Message-ID: <20200207103333.rxebukm4hukavlq5@sirius.home.kraxel.org>
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200207084135.4524-3-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: YKGTqmbqNx67jbKFI2bxwg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: airlied@linux.ie, virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 spice-devel@lists.freedesktop.org, sam@ravnborg.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +/**
> + * drm_simple_encoder_init - Init a preallocated encoder
> + * @dev: drm device
> + * @funcs: callbacks for this encoder
> + * @encoder_type: user visible type of the encoder
> + * @name: printf style format string for the encoder name, or NULL
> + *        for default name
> + *
> + * Initialises a preallocated encoder that has no further functionality. The
> + * encoder will be released automatically.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_simple_encoder_init(struct drm_device *dev,
> +			    struct drm_encoder *encoder,
> +			    int encoder_type, const char *name, ...)

How about using

#define drm_simple_encoder_init(dev, type, name, ...) \
        drm_encoder_init(dev, drm_simple_encoder_funcs_cleanup, type, name, __VA_ARGS__)

instead ?

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
