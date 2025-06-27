Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BFAAEB260
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA0910E994;
	Fri, 27 Jun 2025 09:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MHNxj9hq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E4A10E994
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751015642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WHEPPQypc7TyMROzb6/6mBy5qbiegeyIWkWEFfEU5dw=;
 b=MHNxj9hq+mx50peQwnnFJkFnVYGUq4bj2QHzNmOHNpvujKNMREGdtjT8w9kmzLc2/t6FZz
 5fPG5EO7pZC9I/8iqB1CZqG7p52YfYtnyFphnrcFtxmiZZOzJJV6DR0qYxcgbJBTznWZGc
 kEsjW27ZY10adkv7usMOS7yKyPsyYrQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-m3ca3jSiNoiRuKTKGSuhtQ-1; Fri, 27 Jun 2025 05:14:00 -0400
X-MC-Unique: m3ca3jSiNoiRuKTKGSuhtQ-1
X-Mimecast-MFC-AGG-ID: m3ca3jSiNoiRuKTKGSuhtQ_1751015639
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-450eaae2934so14126445e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 02:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751015639; x=1751620439;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WHEPPQypc7TyMROzb6/6mBy5qbiegeyIWkWEFfEU5dw=;
 b=ae4InciXf+w8IuBNBpcfcMtu92eWbbkkB/z75vJCSMqEMn4reIWuuH65kc95nMRXUf
 UZ2Gb0grAQ8IBY0bw/UaeP69kxiAM0kVQGL6BcnoipYYQ7AE+jbcJw/BHX5oBqQdmzS/
 BVZz389U7pX4ph834ccgCRmGBdJklUiDJOhJpRT+X1D4qDKB1YwYK0+43L7RF2/aIByg
 qtOAX/PssmmNiDgw266LnlTsyHiAZcD+1M2VXIMqY+ys6zHHLlviu72sz8lKTzu9B47k
 KXX7mq7kyu3jp1sXRncjRwlEPXSR5wpB6GYQ9qnPTGGeKcZLh1kzNuDwf+7th8gKzKKW
 K5CA==
X-Gm-Message-State: AOJu0Yxuhs1ExiK3EkwVGgkNN87EQKUN411AaIUJ4wQs0s5qVy7GNmqT
 BQZA9mkce3N9QdC68Xxm84ivjgNwa+dOPAVyJnU35dAfsuy/yRj+wEJNWGAZGWEutKcMkE6KKwI
 v2UlNADP8iuqwD7+9SlhhAuv5duyDlhLE2n0sFm0GfsVWmXm1jr26Er5rvMTu1q0k+/WpOA==
X-Gm-Gg: ASbGnctOIaTi10w3wVn7og1TQyrMPrRekEuvwrrzKdH4+r64BJNHtzch6uWdmxxMgMM
 0xcSLhx3/gHhmL3jdtqMGmW6fzfm20qYHzPtEdDnnOU3BKGspOQi7Zc5mQrfn94vtOzia2Bw5jx
 dq1NQ4b7Fo8s8AWp1mAJNSeTVbxx9W50u7KG32gsdxMudcsfdgOFpeBpTwcO5E462BC4Py94CXU
 OwGEt87ZnJgkRec8QD/m6EYBsNzIoeTpmw5XyhMaIyemzbR04t+9Zpi3MnFRO4SNK2mPL0Dpl6g
 VXSl+gJCihT4A1BJF/vwGpGLE/wTUyyqCXIX7c8813CMA7/cDD2DuqfyO5+8A//0dLDb62fHVtu
 28VGz
X-Received: by 2002:a05:600c:a009:b0:453:dbe:7574 with SMTP id
 5b1f17b1804b1-453902d3100mr14621045e9.12.1751015639263; 
 Fri, 27 Jun 2025 02:13:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB0tCkdXhhhl/gt6aOIt9w77OJs1cM1dc5CK6KjZ2iCBIKXV50/rEpY9ZALrkejqxwGPFrZA==
X-Received: by 2002:a05:600c:a009:b0:453:dbe:7574 with SMTP id
 5b1f17b1804b1-453902d3100mr14620745e9.12.1751015638873; 
 Fri, 27 Jun 2025 02:13:58 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538234b6b3sm76386695e9.13.2025.06.27.02.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 02:13:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 5/5] drm/panel: panel-simple: get rid of panel_dpi hack
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-5-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-5-5afcaa608bdc@kernel.org>
Date: Fri, 27 Jun 2025 11:13:57 +0200
Message-ID: <87zfdtbl7u.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TdyHBg_otCWLC8Q3tksRjwit0EaGp1uEHSM3HB44P7I_1751015639
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

Maxime Ripard <mripard@kernel.org> writes:

> The empty panel_dpi struct was only ever used as a discriminant, but
> it's kind of a hack, and with the reworks done in the previous patches,
> we shouldn't need it anymore.
>
> Let's get rid of it.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

