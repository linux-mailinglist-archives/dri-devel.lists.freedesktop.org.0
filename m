Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708439773C1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 23:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4972A10E99F;
	Thu, 12 Sep 2024 21:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MfLT6cLC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1F010E99F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726177499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LdWPfLJMdgjvfegYvi5NNo76eeOdhcq5LsVGADnslwU=;
 b=MfLT6cLC0AGx7KqCMwJVylhtFWxSGtRW/pfP4QGZCjrY5yO5xY2OxVZ8wy9DdQA8B0s/tH
 mtYgT2hurborTV2xBtFYN/L9+2w7uagSPS5D+EBbn1E76x2NrB8sRTYs4JqHCr3ihvJB2W
 /TafUcctu2B6obUk6PfcCK5H0LSvjic=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-MEs0AzaZNDWn0Kik4uq6Dg-1; Thu, 12 Sep 2024 17:44:58 -0400
X-MC-Unique: MEs0AzaZNDWn0Kik4uq6Dg-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6c518ae847dso26209696d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726177498; x=1726782298;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LdWPfLJMdgjvfegYvi5NNo76eeOdhcq5LsVGADnslwU=;
 b=G/L6AakN8sgCMkPUORAHVcZsUpTsnDM5STbv4MyNdmkjHvI9HkndzrUo7/BNLWrR6D
 wu1+sVXyKZBWM/wD5+NNqkmZAt2bUyiPN24XO3xtZutfvzxG4uHr2csPeeLBs80DCRBN
 +HimiDxBfBcuLBQgLgszNfRqMN+ZOgbSyfWXi8Ocy1S+G+6fTlRNKAMqtph16o6fAcHr
 7M4HTokbyPE3TFt98jW7V+QYv8aP+pncqkYJFGp3XvEjblDeNEHvHFB7AGCHvwUA3mmd
 XcPIvH06Wg1wBwZpOcMyWMz/e9B9tvYT8x5qpkb+MOguqLVyOTJabbtAis9gZWYQ0xks
 KQPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvxXuA6KFePdFfD/qvKO4WBBYQufinQR+45a36MHgIXXyDnDxEjgJUhaw+RQpcfanZSf+W0P31ijw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEWGKHWtmUVRfFPZ8dL7Tk/Sy0LxkeL4BuJbDUgKsPisRbPxbP
 cZD397W+z0YPmaO4cfUeTU/KVntdovYYyhNimdtVYevOSHnJEU8nPm4sUFNXnQLmuUrlhIdbohW
 68irmLmY2NFWhn4Npyw3gcOztBihl1NPRgioXjJtUNrh6DUPz0A8E1vhoHvsjkK/b5Q==
X-Received: by 2002:a05:6214:3c8f:b0:6bf:79e5:b129 with SMTP id
 6a1803df08f44-6c57358f603mr67686986d6.49.1726177497685; 
 Thu, 12 Sep 2024 14:44:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE/NWkPqwUt7Wnb8G+NCwIzrvRbMj/H8FdfBBi21HmBardcXcnuVFiEXhPR/VFHQFmrZ602Q==
X-Received: by 2002:a05:6214:3c8f:b0:6bf:79e5:b129 with SMTP id
 6a1803df08f44-6c57358f603mr67686556d6.49.1726177497294; 
 Thu, 12 Sep 2024 14:44:57 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c5343296a4sm58893506d6.18.2024.09.12.14.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 14:44:56 -0700 (PDT)
Date: Thu, 12 Sep 2024 16:44:54 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, airlied@gmail.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, r-ravikumar@ti.com, 
 j-choudhary@ti.com, grandmaster@al2klimov.de, caihuoqing@baidu.com, 
 cai.huoqing@linux.dev, colin.i.king@gmail.com, javierm@redhat.com, 
 dmitry.baryshkov@linaro.org, geert+renesas@glider.be,
 laurent.pinchart@ideasonboard.com, 
 dakr@redhat.com, u.kleine-koenig@pengutronix.de, robh@kernel.org, 
 sam@ravnborg.org, simona.vetter@ffwll.ch, ville.syrjala@linux.intel.com, 
 wangxiaojun11@huawei.com, yuanjilin@cdjrlc.com, yuehaibing@huawei.com
Subject: Re: [PATCH] drm/tidss: Add MIT license along with GPL-2.0
Message-ID: <mdpjvdik4eu7eruaslidf35hhybswwbyd5gusx2dgxkzcaoel2@z57f3eyppfac>
References: <20240912171142.3241719-1-devarsht@ti.com>
MIME-Version: 1.0
In-Reply-To: <20240912171142.3241719-1-devarsht@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Thu, Sep 12, 2024 at 10:41:42PM GMT, Devarsh Thakkar wrote:
> Modify license to include dual licensing as GPL-2.0-only OR MIT license for
> tidss display driver. This allows other operating system ecosystems such as
> Zephyr and also the commercial firmwares to refer and derive code from this
> display driver in a more permissive manner.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>

Acked-by: Andrew Halaney <ahalaney@redhat.com>

