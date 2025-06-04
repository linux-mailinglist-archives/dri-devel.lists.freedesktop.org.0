Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E5ACDCAB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 13:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14A810E0B6;
	Wed,  4 Jun 2025 11:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G6fdLWAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2384310E0B6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749036940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a4SrfMIm9jFVTdR/mkZH4AtBbhuKX900QP9yhvs/m5M=;
 b=G6fdLWAYSrCAAQ2jKcq0xryONeVF926ecfNfwOIlyFNQbmrG6ftd352HTCQ3ZkkrEzezLe
 SONhQ4J8cPmCA+PEmqCiAQ0A2MqKn4mlcWfK/yzAMquL8rJiy08Bh6bXJVUjdqh/YaeQZp
 42Nbn8EUWOrVnd8kvRuNwGU3OLXb69g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-qp1EqN24MiimQdh326rvCA-1; Wed, 04 Jun 2025 07:35:39 -0400
X-MC-Unique: qp1EqN24MiimQdh326rvCA-1
X-Mimecast-MFC-AGG-ID: qp1EqN24MiimQdh326rvCA_1749036938
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-450d9f96f61so41020085e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 04:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749036937; x=1749641737;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a4SrfMIm9jFVTdR/mkZH4AtBbhuKX900QP9yhvs/m5M=;
 b=QGwGsY3rNB+Gp6J7oxltkdQirtpq/aIUBrnRY++iZLVMysnJsLtqiNWLErhVhFLtG6
 /FktD15wqGCPITTP8SUrbeWj+dw60qSJj/nTdKyuV2mYhhE38s9ioh3VYlvcxsySRwbd
 jcVm1j+evEfIemAgbI6CIR88TFmMixS/dV87fDiiUHi6wYk7PUfjqtyuuhLJ4EmTjrXh
 emQwqiDIjSUF4W3+r0Dg3fLeM7jYq9O3TuJdUTJrdovB5aGg+WO86BDOPrE6/bByV54F
 /wKWkBI8K5mmDRA15J7Sv6j8md8O+ZuLWhvrSv/vHrZRlfS2DiwsQ3gxewhxlPy6n8Vm
 yjfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxtBWzVm78jGbVY8cGBUOIyZlQeB1NvwI3LEq4ttM7zmYxKdsysxCOiVLC+fa2McUs9cHZuZ2RbWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytQjTu8hEMBnJHyg7cRbV+HZMok1WIRnj8NKX0WQcO5hRNFC8H
 7DU8UtMRG+xWkDTL80pDh0tFHtoUMFQ2/Y88APEotqIQfOQRFYMWeXYOPnW03ve1MusUnZ2vrXG
 5G1KcLPVNnbuf+56MCD/KC/7H7MlDN5udEBVkeVDehZPNw609hG7kV0PV0q+ypNDdN3LS2w==
X-Gm-Gg: ASbGncs2LzYx32aiV43B4uyp72/E9k8X+Rw49qseMY+xSYAZa6A6OV2KP7zo+kuTOSS
 zDfVEawoj1Pjm+3IdEzvA4vvjXBTbDh+fLtT+iTYEajfr3ZIcRmhNHSSniH2thoX3B3CJMml+cF
 SXFdXFfdFyxp7qQf2oRvt2JE8smSluA1Ilcb6XUa3Ux1DWTz46tfVfBLLmoOwKlp6czacLYR4Tt
 RDZxb3luFLeTKHBJREKtVQVyB+9gPYqNbsYDUCA/EbLRv9W/1ViADGCLmx/ljsJdA3yYKBaPDuy
 NG1KsIAxnm4Vfsi26N4kGISI2uf7km9C+ADvKDyzOSVUPuGTm/UmdYtgv0lC16max88boA==
X-Received: by 2002:a05:600c:1c1c:b0:440:6852:5b31 with SMTP id
 5b1f17b1804b1-451f0a76c9cmr26306565e9.10.1749036937670; 
 Wed, 04 Jun 2025 04:35:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2JCqAr3AXCZtfAAEbxsPG/hvMjfjjFgOZI2FeVSDsnVIYOAlE1+oc4JeCPXVE9Jp927Nn8Q==
X-Received: by 2002:a05:600c:1c1c:b0:440:6852:5b31 with SMTP id
 5b1f17b1804b1-451f0a76c9cmr26306175e9.10.1749036937284; 
 Wed, 04 Jun 2025 04:35:37 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe5b7a5sm21683535f8f.15.2025.06.04.04.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 04:35:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 sebastian.reichel@collabora.com, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org,
 megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: display: himax-hx8394: Add Huiling
 hl055fhav028c
In-Reply-To: <20250603193930.323607-3-macroalpha82@gmail.com>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
 <20250603193930.323607-3-macroalpha82@gmail.com>
Date: Wed, 04 Jun 2025 13:35:35 +0200
Message-ID: <87bjr3age0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bl3VNFQoZypNuRr-BvJ7pDnXVmMBZv-dLtFww7Ivd4w_1749036938
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chris Morgan <macroalpha82@gmail.com> writes:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add compatible string for the Huiling hl055fhav028c. This panel is
> based on the Himax HX8399C display controller which is extremely
> similar to the existing HX8394. Add a new constant for
> himax,hx8399c for this new display controller as well.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

