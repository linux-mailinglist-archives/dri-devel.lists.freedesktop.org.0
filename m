Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA08A7E038
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DE910E478;
	Mon,  7 Apr 2025 13:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QFNapmWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE2710E478
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744034363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SBQ5p+H6gH6K9oTgr8Qarv/Jc/69g+8F7QtSbIEx/HQ=;
 b=QFNapmWSIj7nqPUp/vETFuYCz99hgjR+zNSHAyQnOeCLCYgEuNMFwrJSPIWxP/Ils3fiqW
 wWVU2HMuBE4GbpuGhB7aw90N6kpT/JzwpEVLZE1GreomZtvuD5CwWckMpRFCtPXrPEoIkh
 DuM+gVEJUgbz22Bd5iMknRy0uhbELVk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-eNDk7gwZPB6BFAQKmyVAAg-1; Mon, 07 Apr 2025 09:59:12 -0400
X-MC-Unique: eNDk7gwZPB6BFAQKmyVAAg-1
X-Mimecast-MFC-AGG-ID: eNDk7gwZPB6BFAQKmyVAAg_1744034351
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ced8c2eb7so34115025e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 06:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744034351; x=1744639151;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SBQ5p+H6gH6K9oTgr8Qarv/Jc/69g+8F7QtSbIEx/HQ=;
 b=aLdCB0Uz7FttBMfxTAsGurAbs/x7twFBQLAnnx/vz1MVRuf5X3Sy45tRsbWZ0WnScf
 lCouAVtzEkgCX4MM26X7r8qNMTh72heIqba8i6/wYcWXeUMtTwPebBXLUTNRacRkIyY0
 Pk8OLDiqNJV2RrF2N7+vFMr14i+AYNh4uayssNsof+HliZV0vg7S2klpYf1Hg7daeRKc
 osj4mK2NWzHwIw0wrsxB25Ax/wL5dk5QtBXGUi98Lwhks/98oEfToySugxIFNwkg8e87
 jExPjBwv262Sj0p+/CIkBdorIh7+b8gBDbpT+wheX3Ca9FFpQWHTuEFTlSGbHvDG1Ww1
 vjcw==
X-Gm-Message-State: AOJu0Yy2Q9by0SWXT+FQ/tXnrH8POtAeXISebFNY8GCa70P0U6P3Sy6x
 WBfcvJX5wFdQdVLKXEeEeUpgLO5oP1TB7GZOti+a/xTZgByfJYJZkBc2+sMBtChWjy9UzeZqrEV
 5gbkeg3wtxEv939fmmpk/+8xgMGP3/Z0EGBGF8UFMXZjLYNJPydC/PBRx4Kcfy/9gO1OQZOMMBA
 ==
X-Gm-Gg: ASbGncvi3ldx25lwvLIIlnKPYPn/5nIXjezp21Q1VvN0r3931bS2u1elztqrC90PSbd
 puB1DybUHMKs1JpbG1fZNSpCU1VXP+kJOiaffAREwTAkUw+4AAl5ZC6V2+MGQczRtLXbWWRApxS
 Gm1GxCTVngqwPafKPML3AS6YyJWf5lul1B2MMjGsNoQlJ0aAVAs2rHdu4fsx4lvCEFloVVRVO0d
 vBlw2J926cr9ofTwKR7Ka84dln2Jp0VXYD9loPamdvMY20V2+bUPscZPgP2PDD4SOs595H2XjEp
 JPlvZx53Q8qHTlC4excVB2eO9QNehVIrSKBhVrYTvoduJQnSiE6XilVyazrUmpZpHBmIype9+Q=
 =
X-Received: by 2002:a05:6000:2288:b0:39c:12f2:2f86 with SMTP id
 ffacd0b85a97d-39d07ad55a6mr9356949f8f.8.1744034351004; 
 Mon, 07 Apr 2025 06:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSyeol/J3aqPzXHT+RMs0s6f79pCGajAjdnEDm1LBPwgH/yneFYb7f16pIaFVjk5nG7ur7qw==
X-Received: by 2002:a05:6000:2288:b0:39c:12f2:2f86 with SMTP id
 ffacd0b85a97d-39d07ad55a6mr9356931f8f.8.1744034350678; 
 Mon, 07 Apr 2025 06:59:10 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d6b1sm12320615f8f.62.2025.04.07.06.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 06:59:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/sysfb: simpledrm: Remove unused helper
 simpledrm_device_of_dev()
In-Reply-To: <20250407134753.985925-3-tzimmermann@suse.de>
References: <20250407134753.985925-1-tzimmermann@suse.de>
 <20250407134753.985925-3-tzimmermann@suse.de>
Date: Mon, 07 Apr 2025 15:59:08 +0200
Message-ID: <87v7rgoyxf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZbsYSy5Xl1TX5xCcUo5asL6H4I9TRjwAAEkhhg7eNs4_1744034351
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

> After moving most of the mode-setting pipeline into drm_sysfb_helper.c,
> simpledrm_device_of_dev() is no longer being used. Remove it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Jocelyn Falempe <jfalempe@redhat.com>
> Closes: https://lore.kernel.org/dri-devel/20250407131344.139878-1-jfalempe@redhat.com/
> Fixes: 177dfbdb7e67 ("drm/sysfb: Merge primary-plane functions")
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

