Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D784AA08E0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 12:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C36510E419;
	Tue, 29 Apr 2025 10:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RraWYg5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFF310E419
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745923678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NsLZT5vmr7M9B4T7NP5QFw0cy5BNK9GWwQ9dsozISJk=;
 b=RraWYg5RUsd2aCh8SxDdBLo0ZAfkcmT/dxmMKOee1YG9F+oauaGjd2NrHC7VWVOFoeAx40
 fMVJ+JR3+QGBSgp5Bi9Tqp3OHGd1u1xGROZ1EIYKqkK0TBMhB4beBT80aklvCU0TUaaO2U
 NCrczGfERwaDwFZgOOKif45EyW47vgA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-SF3fpLrsOz6SXOziW0bggg-1; Tue, 29 Apr 2025 06:47:57 -0400
X-MC-Unique: SF3fpLrsOz6SXOziW0bggg-1
X-Mimecast-MFC-AGG-ID: SF3fpLrsOz6SXOziW0bggg_1745923676
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d4d15058dso40128635e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 03:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745923675; x=1746528475;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NsLZT5vmr7M9B4T7NP5QFw0cy5BNK9GWwQ9dsozISJk=;
 b=AeGus8daTEAQ3qRddJIBqlh0sq6Ax2mkPfswRhB6agn6nsj0LlsAOTxj25kHWIRgUn
 dN9sXX/PBgE7iJUBG71RtxVqvLfan2fHaYIA7zASJtIM7aLgQ+zxmt+j3AjWP6yVjP5z
 TPo5wYBp//EzxoMC/tzP2eh+P8iqz0asx8nIQmra7mLlW8tyoIJyVv/RfdA5Op+7aOdQ
 c9F7mCTmC5XsWUU0kygv2d+dED48kEirr3wsiGA/GiM7HumWJjlcSM8ENpiWW9/MyFie
 NeFTigaYncBukaGAZ/02okiO7ShjQGLhvtTehHPTyNdHUYateU3LnHl2bDAMWgeZdL0T
 f5fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxnmjY4NHcTFKNyeWcGvSFqddYNHEtjSnvjNXpwSnFHdxDbZuq9KcdVDWAeWJe7Ei0wIvUF8pGtUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuF8dqSTHA+Rxojm67FUcEEs+mS1Ma+tvUlbavZlMRLqtU++uk
 M2aWmBZW88Xo78JMAhYnXMEVZmejX/JhZvarulvrG7R4iflLXO+I/oMXALLYzKwIsCM6WTgYN6m
 P+gChgUMSg6o+959+S5z9KYJg9pemo/qgy49zBcBvhqCVXB8DUUY6RwRfSxoEvMoqEP/sfMBg7g
 ==
X-Gm-Gg: ASbGncvo99qNLDWAdypL0U+nahhBQ5/brJ58nqMbh4wkz9MRn1ES2h20/OkQXnOi+fW
 Te9QZwpZBZwaC7wb47jMTPkLCF16OlB7bALwVIZBEp3050fEYSloTVaYlhpgDhajp3qsLt5zfzB
 6odPNsLAwnUMDZ1JFjKFFKwiChhWN35FQkdeZqpFkpkb9S+wVc5pL8PMBD2xXuOSbpL/dlhXXTt
 chPFlGtH/ovH/iicXwTTgUx6ei1Fd/8eTgsjpWtqZs0/L8iqxGJeyKYH5jDHCfweprEc95gyvF+
 9a1YS4Dqueh6er2/nksUMNfZl5ZIlvDcNJsjUHEg1LOhtJ5sZfU+Jx+uyKJascYVOuV4Fg==
X-Received: by 2002:a05:600c:138c:b0:43c:e70d:450c with SMTP id
 5b1f17b1804b1-441ac88c2b3mr21249125e9.22.1745923675510; 
 Tue, 29 Apr 2025 03:47:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX3LV+lqAr3Np51xNhgUV+sdni9d8CppgPHRgjy//9TIqD5QOR00gETAMbQdQeyjYGTnvdiw==
X-Received: by 2002:a05:600c:138c:b0:43c:e70d:450c with SMTP id
 5b1f17b1804b1-441ac88c2b3mr21248925e9.22.1745923675140; 
 Tue, 29 Apr 2025 03:47:55 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d29ba96sm189329665e9.8.2025.04.29.03.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 03:47:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Robert Mader <robert.mader@collabora.com>, dri-devel@lists.freedesktop.org
Cc: Christopher Obbard <chris.obbard@collabora.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: drm_fourcc: add 10/12bit software decoder YCbCr
 formats
In-Reply-To: <dde3c5c3-4e23-4962-a165-38fa6b004ef1@collabora.com>
References: <20250407191314.500601-1-robert.mader@collabora.com>
 <dde3c5c3-4e23-4962-a165-38fa6b004ef1@collabora.com>
Date: Tue, 29 Apr 2025 12:47:52 +0200
Message-ID: <87plgvz1k7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bT5PmI7KksWajsbb4eRkTgbxJTJ64u4vhZlq68vXLUI_1745923676
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

Robert Mader <robert.mader@collabora.com> writes:

Hello Robert,

> Chris, Javier, Laurent - sorry for the noise, but given you reviewed 
> changes in the respective files before, maybe you can help me moving


I'm not familiar with these formats to do a proper review. Sorry about that...

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

