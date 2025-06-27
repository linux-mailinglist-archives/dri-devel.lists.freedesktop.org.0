Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15B3AEB097
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2417210E970;
	Fri, 27 Jun 2025 07:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dzbt/qIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B576F10E970
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751010740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wP3Am+ANc8SurwHR78cTMLjrIEmhW8vePBXR1xmw9wg=;
 b=dzbt/qIZhtnDd4haCauvOn/KPsCVyec6aSq+WEd6iF+gQJS3S30Wg43Khuv+CLVT8Ed7Iu
 BNjqtGLeuDpPR9ydvqmDDgFx/tzcPwSyrzT42D+cguR6tm+jxM1Xqt9a2yps24sqMeekN7
 3FIO9L0IieovEUD986COr+rkrPz84IY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-5TpmTfqBPzWRpoCRoYU0kw-1; Fri, 27 Jun 2025 03:52:18 -0400
X-MC-Unique: 5TpmTfqBPzWRpoCRoYU0kw-1
X-Mimecast-MFC-AGG-ID: 5TpmTfqBPzWRpoCRoYU0kw_1751010738
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4f6ff23ccso1188158f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 00:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751010737; x=1751615537;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wP3Am+ANc8SurwHR78cTMLjrIEmhW8vePBXR1xmw9wg=;
 b=SLe8Ddy11JOSazAoFKipey/CA+jUS/7/9rzMxyjCOuijmzHshfCuKJ/UVHnMSxqWtg
 wzTyo9fIIZ78tCN3z6C+s2tuL6JxIcJxsIk1+u7XMevvM5uMEJ8n4gavxf+d5ODUKaNL
 B9NiV2MH8MuZ3EUmpn4GiH5rMU1fCvoeerDtAxTGMo84eIPLSe4zl1SfTXc1Yc9gc2T0
 5uH9oO9o3mYmCZyDrBk4VGaOmplvWj7FfwIdZXiD0KSWqlYF2kuVCITOTDROEx1AU8yp
 Qduh1gABLH3qGLmdbXBOFNHxHlaJtaPkF+J1iHx+oB4WjufjGoeyugD/PaddlHvEnapw
 0t4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp5RGrb3Gg69YUuUvp++rf2EatQzPtsOkXY7JOurwDZF5htu4Ykn/qFHpoq2Gwi78oZfzTfizIpJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyJE6rdEgCPAmBnw4eeIwu3ewTmOuJhBVl3neehsL6U7mRBJ4T
 MobgEWZsSzp0B5fmnns8IMf/+AVxqxZxN1p1ZayODeS0fYrEMYwqDfqD8LrGhETC9/DoYQJVCMl
 jW/8iQgacRPohq3p7RCAUJAvRQ1doOXD6L/tG3pqDkq/wvFIgQGMoTJFicCKE2EPHjmZQ5w==
X-Gm-Gg: ASbGncumWstKmvY3H37RtIK17h4Vubw1KH49K3xHxzZVK7vFi6WStMK/X6ZbES9xk4K
 gIIbe1ay4QlAZxLSGdZrlHuxo877tx+uR8kFLO0olJ3wtHQ3eFk06/36qWTW0Faa9s78wRQOqGJ
 r84XdtJ3f9tbWFGXz1n35UHuQ5IqtkVqSCGhxnSZDdt0U/NUgqGhcnK8ERBAYGmXpneT25i42R1
 35XB2WKDfScP772/mDLgMye0myrW0RDUYaat3zP3u2kTjySqH+/xxTf+JOXfyWsiXHvK12kjywh
 rv1hXpLXwIkvi5zHcitzfIEJ6EDYfFxsuM6sF9aHgNbxhVVCg60F9VepbN0zS8MlPQS3RHuBOOz
 +NiZ8
X-Received: by 2002:a5d:5189:0:b0:3a4:ffec:ee8e with SMTP id
 ffacd0b85a97d-3a917603a8amr1417645f8f.36.1751010737558; 
 Fri, 27 Jun 2025 00:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7ntZFEdWDDOOUlWvZHIMomkMQZ1SFGsR8HVEbSnA9rjXNcpfTHf2xPjxO564UD5YkGxL3rA==
X-Received: by 2002:a5d:5189:0:b0:3a4:ffec:ee8e with SMTP id
 ffacd0b85a97d-3a917603a8amr1417618f8f.36.1751010737151; 
 Fri, 27 Jun 2025 00:52:17 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fadf3sm2001410f8f.34.2025.06.27.00.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 00:52:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge
 Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Weiss
 <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2 4/5] fbdev/simplefb: Sort headers correctly
In-Reply-To: <20250623-simple-drm-fb-icc-v2-4-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-4-f69b86cd3d7d@fairphone.com>
Date: Fri, 27 Jun 2025 09:52:15 +0200
Message-ID: <87o6u9d3kg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RvL5wh2yFfhk9JX2VI-9HUMdOuRY3-mUrS523RtJZnU_1751010738
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

Luca Weiss <luca.weiss@fairphone.com> writes:

> Make sure the headers are sorted alphabetically to ensure consistent
> code.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

