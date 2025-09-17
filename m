Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D58B7DC56
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FB310E44B;
	Wed, 17 Sep 2025 09:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YTABLNqK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4E710E44B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758101370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wUCQQh9tAI7veHkmZZwIWhc25ylIY77meKu24AmxPCE=;
 b=YTABLNqKSOnvKnX8Dryqm/ujYMBV1z3Ym/N+vgQuQ2HrpNCBm8DjJwoVCNqT76L0DyyW7K
 qPcoPwmr2IFSTGVlLS8WDHCFvxz7QkRzxMwYrlckGI3gFQqT5bHC8axInMit7sKtBRHL4Q
 G14OawGQUoOdFitjqcad+07hPJ2FRwM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-7_l6m35YO2KKVlLc5Toixw-1; Wed, 17 Sep 2025 05:29:28 -0400
X-MC-Unique: 7_l6m35YO2KKVlLc5Toixw-1
X-Mimecast-MFC-AGG-ID: 7_l6m35YO2KKVlLc5Toixw_1758101367
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3ec06900004so1557410f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 02:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758101367; x=1758706167;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wUCQQh9tAI7veHkmZZwIWhc25ylIY77meKu24AmxPCE=;
 b=eA1zMQ9A8ZO6HeuNcw5tUtijOZktP6cb2SFEEE4onZOgoZw9dVaS2jlb6qLwH+4y9E
 N+Vf2KDgv+bpUrHj7IFZtmOAt37644l2Qhq0hURXeIgkBNiL27E0z0V8PwkBBhMhynU+
 BSX8TGTa6xeK9uPiionylEaWQWHEQ66cV56nvasBzJiqGcZfSSnPzf/by1iJeqvFkBmW
 t3e7uW9of0+Gy0iwExD4OF7xROjwo3m35OMahAzsev43CT++Uq0L4bfyekSNfPBx9Qiy
 6jGYtnPfxP3h5bF7F01k3pSndeA99ccsCwRGwcnEzEp+52AwprdjnhclcJsWHX+eoJF+
 JVSQ==
X-Gm-Message-State: AOJu0YwcIFIBsaVlNSyTyt5AAR/6KMFgmNKGPbsd8N1xnQyKqce07L6F
 lbndgihF7nPw87F2Upx55gMeqF0WL+HzRGKN36WnlbNJz1LunxZFtD7AHS/wJekjh+LHheGq/GC
 J/j+fC+5BrKxg5uJLEgDiA6bsYRH8k9QWuEiQDIHP9b8IwStPE6yIA2QLQfJGDNzlyJxOeg==
X-Gm-Gg: ASbGncuOB8yyqINlb1/4hXqfQjf9cBObTIfQg28xDiHEUHDv3BIb49PILGwCgrZPDpL
 vAI9d0qyUY3I5WsuugBacCXecyUmTTPdMdBSK0D3902MJJevA/l27LeySnq1urnQhf1N1dxh32x
 UJCle9izBFQhTmSB1+xewbqfdYUcBvZmOKkXBwyO2ojBEYOH153QGNi0x7KqSbJqeWepwtD4k04
 vWjVdpnNqm2cQAfSOi+HkfVS2Po0kEpCUnGiMzdewdCchYyyXCKnUjZJiIpIN0nIF8Isic7bitP
 Vx3MCoyOqkm0oYyi7JQYhLPA1V1X2a7RBEVblNcQbpG/woiJVyh16GJZtYJjlV36wFP8DCkZA00
 dKmrNs2aJpQC44cS/XGlDhw==
X-Received: by 2002:a05:6000:430d:b0:3ea:a694:ae0a with SMTP id
 ffacd0b85a97d-3ecdfa35690mr1305455f8f.48.1758101367545; 
 Wed, 17 Sep 2025 02:29:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4KsQawv6C8tByCVB5Qu4XPEJMv4xk5AwyBCj983j8rLta7/SmmmJaKO4O6wv4Xsl0zvN2vg==
X-Received: by 2002:a05:6000:430d:b0:3ea:a694:ae0a with SMTP id
 ffacd0b85a97d-3ecdfa35690mr1305431f8f.48.1758101367144; 
 Wed, 17 Sep 2025 02:29:27 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e9cf04db65sm13958784f8f.3.2025.09.17.02.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 02:29:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Iker
 Pedrosa <ikerpedrosam@gmail.com>
Subject: Re: [PATCH 5/5] drm/solomon: Enforce one assignment per line
In-Reply-To: <20250912-improve-ssd130x-v1-5-bc9389ed299e@gmail.com>
References: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
 <20250912-improve-ssd130x-v1-5-bc9389ed299e@gmail.com>
Date: Wed, 17 Sep 2025 11:29:25 +0200
Message-ID: <87qzw5o2a2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5huGiTyUjEGxsnk4InGECW9uyf84ALvFSReUwvJs2mg_1758101367
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

Iker Pedrosa <ikerpedrosam@gmail.com> writes:

> The code contains several instances of chained assignments. The Linux
> kernel coding style generally favors clarity and simplicity over terse
> syntax. Refactor the code to use a separate line for each assignment.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

