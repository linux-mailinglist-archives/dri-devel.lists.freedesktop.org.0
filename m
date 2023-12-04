Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC42802EF0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765A610E231;
	Mon,  4 Dec 2023 09:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B634F10E03B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701682925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VaGns7gznEtfoHG5/ry6CysbEWdXBIzB19dd6KHGP/0=;
 b=haiWJzfH9lYDPxiwl3WlCBLs23LPQ3wdncQ3Vqgmlr0Y/1iIwoZG7ocWU5BIrZvPUsj9yI
 vUNeTKZNWMMKATt2Sx95jAyM7HA8EMfVOFEv3GLjZCCOe+5aWc4xhHAkYsUQud7xN0vVpT
 bV0kKuKDpwbmsEyBKtp/I+q8Wiydyxw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-WdjRtJKqMtKiis9XZ52yRQ-1; Mon, 04 Dec 2023 04:42:03 -0500
X-MC-Unique: WdjRtJKqMtKiis9XZ52yRQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40b357e2a01so31319005e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 01:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701682922; x=1702287722;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VaGns7gznEtfoHG5/ry6CysbEWdXBIzB19dd6KHGP/0=;
 b=tvYMsanWom/BjsDi98Ppi6uYRyV5rS3dEYGAq/VopeA0bvYr36CUvWS2VdTOiiYo8D
 0gq9tlQdLdjDPpFc6b2Xnoqy9mv6YZUt1QZpWAyuLRM7DuP2b3VVnHy8LwAcoxR+41zL
 HdgyXPUSiCAFhxwm7jRsL1xMSracyAq+nORrAcy/BvoFCeUwM68bI2ppTtRRx5Frjm9E
 V/oOrEG7ByhXveijCXUgy7Tyxs9EM86SIlzIOSCt93vxtX+/DgpW6nQnFFT24P8KiVSq
 oCRNoXvuMyHEF6su1Ry+raJcjbtWT7DPx2rRfg//3miniYt1pXLE6L89Vna2TCEE/0lf
 6ylA==
X-Gm-Message-State: AOJu0YxvfUrU33i6zwTyich4/c1NThdO6QDzAxyDWXMJL08iJpjVqqrU
 fsALDkdc5tqLU+jSvJWKdTaaydY6cEj37cPeMGgRhS09pCYYIVKP32SHAJjU1E24Lu+w8V5U+3x
 LFg3fIzT4xjBKmU7cK0Pmyomn4qVy
X-Received: by 2002:a05:600c:230c:b0:40b:5e21:bde1 with SMTP id
 12-20020a05600c230c00b0040b5e21bde1mr1992491wmo.112.1701682922722; 
 Mon, 04 Dec 2023 01:42:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKbDMlcSZRmYxfwIMqNYsq1c9B1PO0Imfj1CH1zWIpq+H+b1PJuusoLSRaiunDJaNEcQNA8g==
X-Received: by 2002:a05:600c:230c:b0:40b:5e21:bde1 with SMTP id
 12-20020a05600c230c00b0040b5e21bde1mr1992482wmo.112.1701682922357; 
 Mon, 04 Dec 2023 01:42:02 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p23-20020a05600c1d9700b0040b3645a7c2sm18214724wms.40.2023.12.04.01.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:42:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 suijingfeng@loongson.cn
Subject: Re: [PATCH v2 7/8] drm/simpledrm: Do not include
 <drm/drm_plane_helper.h>
In-Reply-To: <20231204090852.1650-8-tzimmermann@suse.de>
References: <20231204090852.1650-1-tzimmermann@suse.de>
 <20231204090852.1650-8-tzimmermann@suse.de>
Date: Mon, 04 Dec 2023 10:42:01 +0100
Message-ID: <877cluxq1i.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

