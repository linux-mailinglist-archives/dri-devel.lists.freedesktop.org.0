Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7681AB00132
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E348010E00F;
	Thu, 10 Jul 2025 12:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ShapEr33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D0C10E00F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 12:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752149384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=776OH7AlRSbS9pGEFhLPmFroGGCK4asEjWH5Zyyyebo=;
 b=ShapEr334Z04U01F9tWF/dOnyOO90PLycedQj1ZHZFhAnC9GZilRzMxTt4P/Qks6gOUK8k
 xPa/gsFVO8Aj7TvPzjUmCVMdHDuGQKSkEpCV47Eltix2HEtc+5SUrIk7j+FoR1qJJIuJ//
 26SFrl/58cc5WdVptnGTrXP2427aILU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-_sG2Mb1XOuC6OAsMKM45wQ-1; Thu, 10 Jul 2025 08:09:37 -0400
X-MC-Unique: _sG2Mb1XOuC6OAsMKM45wQ-1
X-Mimecast-MFC-AGG-ID: _sG2Mb1XOuC6OAsMKM45wQ_1752149377
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a6d90929d6so429266f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752149376; x=1752754176;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=776OH7AlRSbS9pGEFhLPmFroGGCK4asEjWH5Zyyyebo=;
 b=hPbPeFFx8sOf4pC4CweTDvzVuAwGa11GWnznWF7tnQYNwCb58Sc4/pI0jCsGkYOXrf
 ESqRJlAjt3l35hNqsoNU66YAwBq+iN99HoziHbM3fmmLhmPY78e9tU9AHLLF2C/79eCY
 vnvVbV4FudSBcpB0d9SqTu9M44g1PD7VvKFPEEREZa4TBq9l4TPwF6GY6PCRfJ3SoXi9
 knfRZ1PGdQWFC0oUqWysFPvS5zoL3BzHdfcPp+bDw7/ICBQgFunU0/gcvGbpg5q+XYxo
 lsVJG1+V1N/WWtfbx2RIBQZ6dUHeq4ey/alca52F69PJguMy0FpSrepYDkL5UnORFglA
 SDpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3SXOpYIdzxHFBMLnmpHPAjq+hKLCsMV6WD3ho7sAfvITvCZPNwGHL7yNQogFvog709K0YSkEV+7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEH42K7jSVS7zHEv3XnkCDnCf5C71TMDqSOsd9t6VbMqFcj2+h
 BWAb926KGhOGTlTckunmVJ2401uMK+gXuSHSQTUlJqCOBvagTH0qk+IRbmmFa6WMqDebVqj4Cr1
 fRV+Zm255Qyb1/iDkUgaT1V+FIvT1gfmmikocUBvDtLTQqvC5zrpzC+IcK8l0/E45JRqt/g==
X-Gm-Gg: ASbGnctqyH8XRDvCj5HMeHYuhmj/iyjenp483CIMZiXiPdqRLxEihz7/rdmC5TfPU4y
 XMi4xe8HN4lQ+Htg5cetM2dg40Nz0BDhbzQTMo7Lmo10WpJXyPcNG6Mri1miKMOc0zA9yrDcYo6
 5hm0YMWQQqhErgmukiHRdF7Qsg4MNyieHHR7hjZY7FtNZMM7Sf6dOXmskV7Ad0vd24Ymr9heKjm
 C92DRVwZgl6dio2UKKBDQm1awuPFOI0cFzdNp1mGzDdORtNLmUiz5X/Kdn8MMWqmlbM5KkSR/KC
 pjHZkkiWP/bNgPC+3DnAZzA1S2JL2tC7cn/2sAxnMQGnDQMOHrWxX7885fA5y4h+uKyXx2Z4g4N
 3yzpp
X-Received: by 2002:a05:6000:18ad:b0:3a4:d02e:84af with SMTP id
 ffacd0b85a97d-3b5e86f9bc7mr2341564f8f.58.1752149376517; 
 Thu, 10 Jul 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF76z7BNeJ29v7X6gjW0ekrWaz+jcptpXrPzJhYJ74eyADqdGhZuiflBfDPZ0UnxHxgWV76cw==
X-Received: by 2002:a05:6000:18ad:b0:3a4:d02e:84af with SMTP id
 ffacd0b85a97d-3b5e86f9bc7mr2341521f8f.58.1752149376022; 
 Thu, 10 Jul 2025 05:09:36 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e2703csm1704479f8f.97.2025.07.10.05.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 05:09:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/3] drm/tests: edid: Fix monitor range limits
In-Reply-To: <20250625-drm-update-edid-v1-1-2d963743ab9e@kernel.org>
References: <20250625-drm-update-edid-v1-0-2d963743ab9e@kernel.org>
 <20250625-drm-update-edid-v1-1-2d963743ab9e@kernel.org>
Date: Thu, 10 Jul 2025 14:09:34 +0200
Message-ID: <87ecuofds1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kROEQScQD4GSRwJNlImLVLfqGrbbUKZeBSrg2azULoI_1752149377
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

> For some reason, some EDIDs used by kunit had Monitor Range Limits
> making no sense, and not matching the edid-decode output in the comment.
>
> While they were in the comments as:
>     Display Range Limits:
>       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150 MHz
>
> They were actually:
>     Display Range Limits:
>       Monitor ranges (GTF): 50-70 Hz V, 0-0 kHz H, max dotclock 1960 MHz
>
> Fix that section of the EDIDs to match the expected edid-decode output.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

