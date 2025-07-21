Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC68B0C2C7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0868A10E13D;
	Mon, 21 Jul 2025 11:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="caf84TSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E6910E13D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753097064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S64oug4rzFMt9OTheEDJ2IKdCev+SwZ84xmyXjvBrdc=;
 b=caf84TScm/PlkCIizkjVs844qrr+xt2MvdBMUtZAUt+jDIbyKR/suaNjrXt5g+u0dgHpW/
 Gsu/JaXhICWSDzhnmW42+U2lt9Qjw34fuC/XJitchBuTssdj/Iy76kne63f55WnBlAapCM
 eAjxKAK4tMuK0N2HSsoWoJYHZ5sS4ho=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-c925Nv6WPGaPGfZTUJ5sWw-1; Mon, 21 Jul 2025 07:24:23 -0400
X-MC-Unique: c925Nv6WPGaPGfZTUJ5sWw-1
X-Mimecast-MFC-AGG-ID: c925Nv6WPGaPGfZTUJ5sWw_1753097062
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451d30992bcso32273205e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 04:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753097062; x=1753701862;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S64oug4rzFMt9OTheEDJ2IKdCev+SwZ84xmyXjvBrdc=;
 b=WMb/wOBzqTNj9JVdzY8o297T6KibmXitJql0qSEKjSpLz64fOD7Zc5mRQTO5tiaCjs
 uQuGJM8sb0/FHMzLzoY+4t0uCPsLYZHi5G+4w+OBQ4cNs27ZJtN54POZ17TtXKdJvAK9
 u7VhBJgZa/IfBLhMu4iK828v4wqv3d9xq5/+OrAT2b17x4xB+viRs4Se0CErkdl7wsZ7
 s+9CZIleUbIt+8M7bkBQsvyihdbgd1RgpDChZYe0hau9AkdWDUW5ZSaesX/TtDe6RcV7
 dTmnkeKdRsA6VjxidVIxO2RwausXk7SSO2t8kvdYnOWCE2UQ/zutdQP9ZeWNZfxbgr8l
 OQSw==
X-Gm-Message-State: AOJu0YyN8wLeh4BXlUXROe16DXJWEQKSUdwSwTloHlBHFoX184zXqFtB
 uN/g5ipBM8HQ4wSf00OIt6weN2x2oFMQ5ggT7iBfMA+hg4hxSBQyuryKj1XaDjdh/QWb7yZ+yAL
 ifz7L9zKGaznYsCJx/58QW3IM6VKcxRshBe+FyQkvD3Ur45fj79tQAgg2SmCpdfOmqlf6bg==
X-Gm-Gg: ASbGncvtYbhBxk12TmiSX/XZY9G8V7soECBt2C5cxlgIfB09jmQqz3Z6yLWvmg1Anf+
 ya8+CWJKAW2bqg4hzgivcuk226UIejD/TSBT3DNse/QEFaPNXG90XTax8+GnPAiMkB/HH/MY4G1
 p2OILW6QGCPaKDNvoZ42fsvHa9A6CFJrbKaiULmyocSxKthDmZ2512By5QcwmL5DowCruaPWn1e
 iG0d/FZqV4yVijGF0j2eO0zS4Nv2Xkb5FdfHWgtkpRH0iUX+IFe9bwIyHFVB+kbLhYkzSkIxWbN
 uMcdkpHf4qGWgPAcHoMur71vqHu9uNKQKpklH738E+OAYKDOuZJi6fZ5gMCZ3e3xYw==
X-Received: by 2002:a05:6000:2286:b0:3a4:ef70:e0e1 with SMTP id
 ffacd0b85a97d-3b60e53ef79mr14025127f8f.55.1753097061998; 
 Mon, 21 Jul 2025 04:24:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV5fGm/RSSf7ecoYFwTb4SzjfI9mHWgwy3o4Ms8iGa6PQPuLjyQSBdsTEN4qxIYWqzBJlVrQ==
X-Received: by 2002:a05:6000:2286:b0:3a4:ef70:e0e1 with SMTP id
 ffacd0b85a97d-3b60e53ef79mr14025105f8f.55.1753097061590; 
 Mon, 21 Jul 2025 04:24:21 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca24219sm9820770f8f.15.2025.07.21.04.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 04:24:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH v2 5/6] drm/format-helper: introduce
 drm_fb_xrgb8888_to_gray2()
In-Reply-To: <20250721-st7571-format-v2-5-159f4134098c@gmail.com>
References: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
 <20250721-st7571-format-v2-5-159f4134098c@gmail.com>
Date: Mon, 21 Jul 2025 13:24:19 +0200
Message-ID: <87y0sh947w.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0iSeCKbAxVV7OxSa6rOR5uuBmFi_y_A7SDatE8OVpGo_1753097062
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> Convert XRGB8888 to 2bit grayscale.
>
> It uses drm_fb_xrgb8888_to_gray8() to convert the pixels to gray8 as an
> intermediate step before converting to gray2.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

I would like Thomas to review it too, but for me the change looks good.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

