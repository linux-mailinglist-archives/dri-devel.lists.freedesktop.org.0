Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC0DA76358
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A2810E3AE;
	Mon, 31 Mar 2025 09:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HB/WEwoj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6011F10E3AE
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743414126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H27D7lVslVyn2jYrcfneUipR0JtVHrtYMFE1BV6ICr4=;
 b=HB/WEwojk0MO60fKS5/m15KPxqp94XCbfOmyql4b1g4HK9VVKWtHytX4umNo5VGfLqr0QG
 Ww5k3tHCdBIidGjYazAkt4RXWjqEZdzRNP5aBmYUq6JAgjNdH95d3rWtkqR2Pwyc/EkJ9g
 5u4r+IPucwashaKAMjIZ9j9lx4LZhI8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-E9Od_JSgPMKBq8D5CNvXJw-1; Mon, 31 Mar 2025 05:42:05 -0400
X-MC-Unique: E9Od_JSgPMKBq8D5CNvXJw-1
X-Mimecast-MFC-AGG-ID: E9Od_JSgPMKBq8D5CNvXJw_1743414124
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d3b211d0eso25273275e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743414123; x=1744018923;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H27D7lVslVyn2jYrcfneUipR0JtVHrtYMFE1BV6ICr4=;
 b=T0LwIk88RgcwR1gew0QRpYqm/lXha8+iw6J3+3jJh6vwzfOlF513StgTNPdXZUS5yc
 xauy9pVXCh2Kpd6LNKGJIU23Vs1owQbN/pt5tQuvP/Sd3edVvMurbBqduKsvFuD48sOh
 vMMCImpx2XGDMGnac6eluFBZ6KbcKZaNkQTiUm4r1jSv9ZUae+X0bUb305sPyzQdD7rO
 4jmYlmSwRyQMgn3jED0E9WmdV1z/xSlPb7mOQtLIeXTIt33POHPGGkDBH8ba4Tr25KmY
 iuWuU1tbbemXzaYvd0UqMMUkMolU1hP5qIQZ7sTHgj7hLWbtgfgD4GYxFChIRPTYZvZU
 mikw==
X-Gm-Message-State: AOJu0YzPuuK/Yx97n4PvyMymF1Inha3eTIn/WWxQNqjqLZ7FqZ4PfU8i
 kU76gY/XWdEO7DfyHUzAvxeUNBpv93Dpc3aKWhXIYuGmtKAdRzKswtxa8upF7NdltOfDy73QC6r
 9fqhAB5NBClMgbRMhFZpetomwzRnqPV1AK6TBi7IAtyEu/nlNLNY3fSBc4R9fsD9PU+/evVwo6g
 ==
X-Gm-Gg: ASbGnct8Oda0hrXZOyLo2Og17EnM7savtYTwUuwydDtdz/lV59HaP3FcS3WbTaEOc+v
 QT8YKGhg3Z/GCrB5v6T5yDzMdBdz+Li5dpSeMZjEaj83WfvEvGpFdYfs7fMdbfLjsg6BY1CMS41
 UYMRnrApoHRoUYj4uJK6pLbZhehzI7s/RyyGKFOtKpnYeU0vo61SrWka6M9saNvURIfp0GgKrRM
 Aben1WFBp3sgUJSjKfVHPt55LE9XJj6gvZ9u+TJJd6geJ1JlCXdknwXLxySAeMbh+DKpiMyUt6W
 6BMmIfRh74fQFozJKPSsBbszWmOro6UCw0DORlwVWwOJ7A==
X-Received: by 2002:a5d:47c6:0:b0:39c:e0e:b7ea with SMTP id
 ffacd0b85a97d-39c11b9b858mr7278364f8f.20.1743414123330; 
 Mon, 31 Mar 2025 02:42:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDTMoXMi1u8PsjaIJW1H/O/citGIyM9bD2m97WcySzTORzPcThEsFOGyZr+1sJwT3jy64MFg==
X-Received: by 2002:a5d:47c6:0:b0:39c:e0e:b7ea with SMTP id
 ffacd0b85a97d-39c11b9b858mr7278341f8f.20.1743414122974; 
 Mon, 31 Mar 2025 02:42:02 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a433bsm10920463f8f.97.2025.03.31.02.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 02:42:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 16/18] drm/sysfb: Add vesadrm for VESA displays
In-Reply-To: <20250319083021.6472-17-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-17-tzimmermann@suse.de>
Date: Mon, 31 Mar 2025 11:42:01 +0200
Message-ID: <87wmc5fseu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: se_WaJ36801cUZ1mRMW4ksXLopfL-N_6KjShllXG_l0_1743414124
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add support for screen_info setups with VIDEO_TYPE_VLFB. Provide the
> minimum functionality of reading modes, updating and clearing the display.
>
> There is existing support for these displays provided by simpledrm with
> CONFIG_SYSFB_SIMPLEFB=y. Using vesadrm over simpledrm will allow for the
> use of additional functionality provided by VESA, such as EDID information,
> gamma correction and palette modes. This enhances the user experience and
> adds support for more display configuratons.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

