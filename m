Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC2CAA8F88
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 11:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1663810E002;
	Mon,  5 May 2025 09:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Frp+qXYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA3B10E002
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 09:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746437253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l0RexrooVEAiTnjYfMDdv53LIbR51/bbTVhj6k4gjWQ=;
 b=Frp+qXYMjknrttcMjfhOLOxEjmyf1hu5DRGSnWP1ro4WXfiaQSZ3a/6uTg7BSmmQSq5KNz
 Y+lA5p1ttJDqYzJXKEAVbIie/o3MBNPV9zGFMy/Xu/7SOQH3U8ohmWbu5GHx1IWiZlSZMW
 FyhowumZejAEV7lm/wnQ6janTmyRDMk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-RniOFlT9MY607rZu8lUvHA-1; Mon, 05 May 2025 05:27:29 -0400
X-MC-Unique: RniOFlT9MY607rZu8lUvHA-1
X-Mimecast-MFC-AGG-ID: RniOFlT9MY607rZu8lUvHA_1746437249
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4767e6b4596so75236801cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 02:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746437249; x=1747042049;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l0RexrooVEAiTnjYfMDdv53LIbR51/bbTVhj6k4gjWQ=;
 b=SECpYUgJDWXCwjdAUj2BBLd/bP2n1Iy6SV5dVmGnNCOiNSB58G8uZB1rfpnSsfr5t4
 wcTmlQ4GezdIhbuapZEd472o0TgizYdNjARBWevk8zhbugCHzIDuHnNmmHHZ6Dm846r8
 +5l017PfkU/3PHgcCqSFLmHgBQkYzFpgRIOVR8NNwcqRIaOBxuw/SA7uFwyY94koNx9y
 G2142y830nhwWOecVMTIHsrg3NElICeOJKZg4lWBvdDuBuazXgQCJ0uoXzAwMZxWzzCE
 9o9C2w2BpeKkq1YMrP99nv2FJJrSyT76K1IsMC2KvdKD7njOonm3Li1quMMaeF+pwuib
 R4nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4apOr57R5nwi9DoDuCrNBt8egyIpswd9qx/rgQ9Am/cKETFCXagkVIfxkPNqNFTZCTwNE3NQuSfs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVXjBwuXkBPFiuzTgXk43DJMqwXPPqZ7D64TwEY2hteRkJErRG
 /uWhJUVMcUUz+wIB8qpELrMAWBLQR6YIk3bqtr1T0apzILDs9rhtKdGbW+thYXIQ0F45LClDlc8
 lTDwOFs/AI9dmMxuPZv9lZyvGqMkwEGCyLq07JjrTumevvYhJnHfbCmFjONKbYCb8hg==
X-Gm-Gg: ASbGncsv6gpoem6C4YNiuYqmUpdYITzCnQzqhY1wFOSgY0XUrFecwfqQv4pDGe+Kv44
 ZFeE057N5CKCltuXFgDxDInVh4phc9n1EPrHZfnJCWyIwVR73hN01CA4GxoC7KcqLFWcCJWK1SU
 R8WRDRYsSrxJkG7obTBIj75xYn0qIbJGJkLRtIXZBQzsQwQ+d5fv+sRIGLdC59vUCnJHHDa9nKN
 OwszFcQty3wLPPaoUBZt+IedL4VMWZgpUKcHRuepm5dVx/mdaQPAH1cEuvCfKjNPWAIJpH77HVB
 A6FeORSN9hOHRgo42e7Yr9VP2TTFGu+p30D7Nueqag==
X-Received: by 2002:a05:622a:11c9:b0:476:b7e2:385c with SMTP id
 d75a77b69052e-48dff3e0e3dmr100492641cf.2.1746437248836; 
 Mon, 05 May 2025 02:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/m1KDaJj1j7Rb7thoAV6E+uqq6uO9rXBEssgmcDxA3L86RFMfhiWPFXAgyoIIP0edVrBL1w==
X-Received: by 2002:a05:622a:11c9:b0:476:b7e2:385c with SMTP id
 d75a77b69052e-48dff3e0e3dmr100492471cf.2.1746437248557; 
 Mon, 05 May 2025 02:27:28 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-48b98d0fc7esm55680821cf.73.2025.05.05.02.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:27:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, David
 Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sitronix: move tiny Sitronix drivers to their
 own subdir
In-Reply-To: <27a5f519-de87-4fab-b465-bb89ae5b988b@suse.de>
References: <20250503-sitronix-v2-1-5efbed896be2@gmail.com>
 <27a5f519-de87-4fab-b465-bb89ae5b988b@suse.de>
Date: Mon, 05 May 2025 11:27:25 +0200
Message-ID: <87r013wgoy.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RSTZsvpKdZOanOydGICTwa7OpHnr5UVF16ulHLU6jCo_1746437249
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

Hello Thomas,

> Hi,
>
> there's one major issue here. You must not change the Kconfig symbols or 
> you'll break kernel updates for a lot of people. So those TINYDRM_* must 
> remain as is.
>

I disagree. The https://docs.kernel.org/admin-guide/abi.html document
explictly states that Kconfig symbols are not an ABI, and userspace
should not rely on these not changing over time.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

