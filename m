Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2430DAD8A75
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 13:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CDC10E996;
	Fri, 13 Jun 2025 11:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P7MCgGbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA0F10E996
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 11:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749814195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RnUdGH8Rbgs9Tvuj/gcrtZICv7bUmLG7jILZ6CgTVtw=;
 b=P7MCgGbCAs0Inu7JZlo2oPUG0j7Q3FBusjEjqSFGXQctI3GL/Soh5nOEFtl2aYReMbZ+8V
 ssfyQ80ny5A8mFDBCGmR7Qx178E48yG1OU5w8sYPD6F7LDREkX85BXF3ElH0HWzoNwXQJQ
 prJUohpn9WJVcf6rvlEr8JiJN9Fr6SA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-ZryzhpkmMViRrplzc9VtXA-1; Fri, 13 Jun 2025 07:29:54 -0400
X-MC-Unique: ZryzhpkmMViRrplzc9VtXA-1
X-Mimecast-MFC-AGG-ID: ZryzhpkmMViRrplzc9VtXA_1749814193
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4eb9c80deso1011538f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 04:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749814193; x=1750418993;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RnUdGH8Rbgs9Tvuj/gcrtZICv7bUmLG7jILZ6CgTVtw=;
 b=DmpKyE3bVMu6LGF/5fg5vjd2pzhwg2huAcbL9tlfDeXLK6NctD0lrWpcKJUdnrOoE3
 bZ+/KLBqAJ0aaP0AOI7sWCaPrCfLoSHtjvhknb+FGEGiYjgZeeQWe9owMeLU/9m0hwQJ
 T2cgfT5yRAC1TH47l9i82w3addyUwRGPRDQLxpepoh2UfybT41/OvolXwZB3BO0ME7Tu
 Ha+kMJ0iF7Qx9mLWq+/bZ28KHF+NYZ7hZi49WoLXPtram00K2kBHs4ROVFPURcrxk155
 hBtnoXQTB0HLnTwwIaoquRLQ0xvBqUdMrNYW7rNLifDq9C6GNMaUAfSgCKeSiWc36XmA
 hscQ==
X-Gm-Message-State: AOJu0Yy5Li5JjgqqOigCvCWmy1rUfy2WpEP+W3WTUdThS/AkArfgCi6F
 qRDhnnrLn2bePNDo6AUMuBRnbxYrhMceGCAG55wbw4Xih1kOGsEyJst5wk31waniccmPbwfjp0o
 jtes2NIjJsSk4SJ7JXtULPEx8GfONNW0Wk2lNM647KhAUfy3nwUSF6yozcag2ErZhLKEuvA==
X-Gm-Gg: ASbGncuMeBLDYyoZz+R0uBeFYVNnbY3MFpx4JSfef01Zf3BkZmoHXuCF285lZQG/R86
 QBDuWEcw1iBWbaqqZTkdRk15W8p/aHWn0w2JkGAud40CcDaIOvCMOBEwa0ofF8UqSVLr1pkIG73
 ePWi4wpgUlKqRlbl6rQyrNrAj/5wfQXxuOqE/3sa4Mzb28JfPMt/So5WtVDHKx2cAlpYKrcvv33
 EAMtL3jJixOyZhNeggOjAF27QvepqIpbKVdNiHtOUm5GKr0f90qgaVB1d7R10GpbA6JltID4EXF
 S/FRuBzZq8VJGyxsntfYvjp7NHpZhIfW6F9Qkf4qd244UZEoBeY3of8UgMgyfzdTct08+d5Gsfk
 JR9+k
X-Received: by 2002:a05:6000:2dc2:b0:3a4:f7af:b41 with SMTP id
 ffacd0b85a97d-3a56866f6dcmr2585221f8f.15.1749814193282; 
 Fri, 13 Jun 2025 04:29:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8KsPrX12ZiQWHcpDZONr6fjOeqCgGV00fvOEINzfBWFFtJOfoJ6264f6PzzLcUTKmJd7HxA==
X-Received: by 2002:a05:6000:2dc2:b0:3a4:f7af:b41 with SMTP id
 ffacd0b85a97d-3a56866f6dcmr2585197f8f.15.1749814192902; 
 Fri, 13 Jun 2025 04:29:52 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45320580af6sm88431105e9.1.2025.06.13.04.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 04:29:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/format-helper: Update tests after BT601 changes
In-Reply-To: <20250613111711.136993-1-tzimmermann@suse.de>
References: <20250613111711.136993-1-tzimmermann@suse.de>
Date: Fri, 13 Jun 2025 13:29:51 +0200
Message-ID: <87ldpvvpzk.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E-9DH1PblPhz78U5cwQ1jZdGAFexydjTjwFE3B5lDtM_1749814193
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

> Commit a979a54165c2 ("drm/format-helper: Normalize BT.601 factors
> to 256") improved rounding precicion of the BT601 calculation, which
> impacts the results of soem of the format-helper tests. Adapt the test
> to the new results.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: a979a54165c2 ("drm/format-helper: Normalize BT.601 factors to 256")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_format_helper_test.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

