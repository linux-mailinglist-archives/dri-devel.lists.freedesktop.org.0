Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B57BD7EDE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816E310E00F;
	Tue, 14 Oct 2025 07:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LAhSY8m2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1CA10E00F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760427137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gTEvqfVMwIkz4DW8+ZLEnZjvY2H6k8QKs9GKfPXMt8s=;
 b=LAhSY8m2ukMvZO5uqLG7eYhIB3xaFp5b5yv8Z0ihyV0YwDloSQid2VPWsJZOvOvL4udeac
 9xfbPz5PEjh1sjOOG5+1nOKTC5D8rMk8kS9Vp7ZDhYim690XGODrWdxD7vV76m0jSIQZBr
 NAyKGPU8S7ROtTSpZQiCAIfN9zybd9c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-iNeX-5m1N0CFjw866cAJoA-1; Tue, 14 Oct 2025 03:32:16 -0400
X-MC-Unique: iNeX-5m1N0CFjw866cAJoA-1
X-Mimecast-MFC-AGG-ID: iNeX-5m1N0CFjw866cAJoA_1760427135
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3ed9557f976so5251284f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 00:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760427135; x=1761031935;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gTEvqfVMwIkz4DW8+ZLEnZjvY2H6k8QKs9GKfPXMt8s=;
 b=M88QmKDzzNALNiFPf8S0D51aA+elh2ez1PtPoi8NEYyfGDMobd/S2w4kiqewgEVgdt
 4f8FV9zWm+qoRR+Ppq2xXiG1beeSj3WRHz3AMArdOfocxlEqYcxJQla7/fmMlfvGu+s3
 crMgrqrhqC0+cdXlv9gdRdmMShdyALWS52p45pHp6Tn6Xtux1HPZVBnEnK+wzoV8KwZm
 uft6qgmFbTtgoudzBr5akwEjbB1zRRXRtEaScYvJI0ZX7mN0q+wpCE00kf823uyt3giM
 Wdq6KwNidZErO3fDiLE1r7nr14nQXyc61hjh3jhvK77qxrKuZOGDzJLLFj0iCWmxDKqg
 NQ4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvqWOAjmGM+9mZYQ5rU4Nx8jclxT7tzD5XTPGR2H8yelbv1Ff6fzJgJ6AqZ865AWOVeuzaPyot7mc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo6TjgKvb/k89jLsxlNvztGKw1R89bMbQ0YJFj8F+lnUzyY5Bt
 adaBaJdDcpwjhvZkyEQeYj2y/fK7W0c1oSrPZSO8mzmowBE9bdbXM/PvbwlGASUEg/PTIc1v6P4
 eUPl5tR96E8qYZojbzW6uufNFvA6q3Ctq0NZniA6vlVqS1D04FmUvzP3YjUTQbccPkm762Q==
X-Gm-Gg: ASbGnctyeQkJlRsceVnMPL0PuVyzrUB83Is+aJhR+eqjqZKtE0Q/xqdDEwX5AZOzoH9
 McqB3UZ6MzKHrAN6ZYUSXqoQ/33Tq72CG5yN+zNroTdElV+8ij1lqlZrCi0IJGfse60xEnl059U
 t0fGJrTjREfbb7Y+vnqu0xqrfDnYI86Axl8Yg5/wjCXisrTLaVFMmrQuKnISK2M6fTuzkqi3SVF
 6iQEEZ6ZMmpHGwxhehKFIjxHc8o/xih6HYfWG5DxX8oG2W/y3FaM4YuANi0HDpYJ9E8TmavuN2P
 b2yL+Fqeeu1qbpmiFSHSTVO2k/hoCLQjDBVnOmlGOAcSXeHgY2jGxc/SljE3PFvouDSTVfpJybN
 iOfVi/tO/LTo9WZBMIScpu40=
X-Received: by 2002:a05:6000:1a87:b0:425:742e:7823 with SMTP id
 ffacd0b85a97d-42666ac432bmr14939915f8f.12.1760427134868; 
 Tue, 14 Oct 2025 00:32:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi0EuQ//2MOCgb87kcf43mwyCqeAgLwogfvvpgOqhiAT4wu5KaE/+LX7onRuci9KVtSJ0glQ==
X-Received: by 2002:a05:6000:1a87:b0:425:742e:7823 with SMTP id
 ffacd0b85a97d-42666ac432bmr14939897f8f.12.1760427134470; 
 Tue, 14 Oct 2025 00:32:14 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426f2f72e18sm717892f8f.0.2025.10.14.00.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 00:32:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH 1/6] drm/panic: Fix drawing the logo on a small narrow
 screen
In-Reply-To: <20251009122955.562888-2-jfalempe@redhat.com>
References: <20251009122955.562888-1-jfalempe@redhat.com>
 <20251009122955.562888-2-jfalempe@redhat.com>
Date: Tue, 14 Oct 2025 09:32:12 +0200
Message-ID: <87ikgiq6pv.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XaX82pHjA0BbHMj__iM-8_xKPmOkxmIN09Yl2ED_qtw_1760427135
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> If the logo width is bigger than the framebuffer width, and the
> height is big enough to hold the logo and the message, it will draw
> at x coordinate that are higher than the width, and ends up in a
> corrupted image.
>
> Fixes: 4b570ac2eb54 ("drm/rect: Add drm_rect_overlap()")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

