Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718CDB0C2A9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF2210E516;
	Mon, 21 Jul 2025 11:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fdHzzUM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42B010E516
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753096764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TFoz2WZRMZK4qulVAmwYVCtTJ8qaORO4AKebBTnJutI=;
 b=fdHzzUM8Ew3QfvZfnR7qpjMTKwWvC3V01YIbZIOsBFuAILBsFrSymAjhIIpzpivzy3O1V7
 ZGo0ESIommhMq0u6pfMgMFKUyVl4WldsnSnx0YQJjyQcVFsDe1KVW9CkKB8ENQBlnoOXXP
 X7EX+XxPfKCtnlJ7kJaK8N6lyQWm/UA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-Xk1GgW27NBKO2au7QnPpew-1; Mon, 21 Jul 2025 07:19:23 -0400
X-MC-Unique: Xk1GgW27NBKO2au7QnPpew-1
X-Mimecast-MFC-AGG-ID: Xk1GgW27NBKO2au7QnPpew_1753096762
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f7f1b932so2880724f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 04:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753096762; x=1753701562;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TFoz2WZRMZK4qulVAmwYVCtTJ8qaORO4AKebBTnJutI=;
 b=DWYhmrBQVcYgqjqgPufkCWjPoxaWyIG6z+B+bBISAy1VhVLlwDNtYFmANLSgTdzeaC
 iPQfw+Yv1ITqIDQZ7EqHehmPdKRtcp9YWUh6F6TQpwRj2pPtpzbNI2Sj6OoNZOxplf4c
 Hrd8JOSX7rHOF3yJ7hAhkk/syFa8ZlY0iOW0EOeob6XxoP63aRf6FEmAIY6RA/vSirVe
 MVVsKwISxYh248HMT1a3jlWcerRlyQS4fr+Ak2C/9JZG0zE7C4Xk8lKlw3HjBAmD0Osb
 hhSYdt+yh2P/V66gvzwc2M9Swk2wPBSSd7WX0r9VjagdGS8jTpnKG5i7H4cCvqCEmllM
 lvew==
X-Gm-Message-State: AOJu0Ywv07d3VX8oW48VfcZ99w5KhKoRiHBKLce5J3Us5law2WfSmARF
 Pgeg9TXTQ+qrXIbnenYXb+9V3CWgj7espK+SnwCD4yZh97Ea+YyXwNkZfP5GK9jNFguly1sDeNu
 6uoXgeOT0k8Fs8vbTlLYSQrO+aV+IS+yhBXa/BIIVW9+M4xFdhy7XLUDCmvLgmutwT/Tjbg==
X-Gm-Gg: ASbGncsa7ZOLwNOFGPPvWBIXus8VtE0vJ/ISJQSY7rb4nTPAErvNyA75VR6b20iEmfG
 w2HSrGp8BmyxvAIg9dOHu00HXHfOaAsjRsSAYDger1Gl7ZNaTu0ZNbiNPn7CPS6AQ5PKhzls+tH
 LWNrUf33q+BbaWcfpdbHwAr1ZAgZa9oNbmFfB5vBRk5x8/VZYQfH+fNwZK3AA1Lfo87BpGRR2eB
 BNE/Xywxn4iXRS/KhLaLZLJPnY5KEz9PCaf+uW4uAtvDfsd+DzA6w3/9V7gHIaif5ryvfGVG5YJ
 Ljy45Sy9z1DNnsPV4sAGKsvDCKfXpviWTSWlNiiwFsmakGIyFAdslbPsoX81QYJ4FQ==
X-Received: by 2002:a05:6000:2902:b0:3a4:f038:af74 with SMTP id
 ffacd0b85a97d-3b60e518418mr15912927f8f.51.1753096761758; 
 Mon, 21 Jul 2025 04:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBgZ8j7cvCchuIks11flM8QmUtWUgbRezl2Kmbq73XrYO5/Elgn5PE0sAseXfZtCEO2HQMwQ==
X-Received: by 2002:a05:6000:2902:b0:3a4:f038:af74 with SMTP id
 ffacd0b85a97d-3b60e518418mr15912898f8f.51.1753096761314; 
 Mon, 21 Jul 2025 04:19:21 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca2bf4bsm10047278f8f.31.2025.07.21.04.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 04:19:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: sitronix,st7567: add
 optional inverted property
In-Reply-To: <20250721-st7571-format-v2-3-159f4134098c@gmail.com>
References: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
 <20250721-st7571-format-v2-3-159f4134098c@gmail.com>
Date: Mon, 21 Jul 2025 13:19:19 +0200
Message-ID: <871pq9aj0o.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: De9zMtf2JHg3d2F3slg3T0g7Li8BDYIanW4eqbn_nR4_1753096762
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

Hello Marcus,

> Depending on which display that is connected to the controller, an "1"
> means either a black or a white pixel.
>
> The supported format (R1) expects the pixels to map against:
>     0 => Black
>     1 => White
>
> If this is not what the display map against, the controller has support
> to invert these values.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

