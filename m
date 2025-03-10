Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C13AA59A0C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 16:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9AA10E41B;
	Mon, 10 Mar 2025 15:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zcpv6Fd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B5A10E41B;
 Mon, 10 Mar 2025 15:34:37 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so25577315e9.0; 
 Mon, 10 Mar 2025 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741620876; x=1742225676; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z2UW3DGFaIT/OlHaafnnTm7ntqZnQZLSZf8OhxhOmO4=;
 b=Zcpv6Fd8aqy3QhaXRH4tb5UvuyVTSQ8dG/5aeRYuAdvA9t9DGxBcMAyJgggmWbixEz
 3bVJPYR/Hn3gcIKR3/vjdBd+s9qbDcSzi9/ek+qifIB5Io5pt8y1o/M9ukM6h5ANbTVn
 jZ2ZEfz9Q20yD+UXN1pw2e2Qp6vvE47j7oZqbDm8UVZxixnyPlK0NhNHABzNXp6wTkGA
 F5HC4wD3T2AEq9sS9kzaEVdmU5YFqzp7/UprbJt9iytxYax6w+5VQR/+tf+n6s67g1hc
 BaRtFbg9/ULL53jQoQ/5gN/SXe/z/aZQCgP6P6gSsXZOIxzH9BPrvE87xz1pAg1WSpE9
 0Itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741620876; x=1742225676;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2UW3DGFaIT/OlHaafnnTm7ntqZnQZLSZf8OhxhOmO4=;
 b=hlLiEn5z/Y8uZYHFNmZBOhC+v9VgEqkFjlhm9l8eddjKav9NGbnPhDOBnoaJyWZvyp
 oXrzfAnAR0P8/Lf74lkKR1ZljHeN4A+pHz9XFH6SCUvapUVA1J96I+hn30MLPYwkANpq
 Q5LvnoVJp3h8fJ/0N0j/thwkmA23YE0wvpnbFBwW+akpyqKBd4VDUqXd1Z+GSqVaMwUH
 wp4AUTbHlqW8CaRklBaSiGM2r1qY12Sb6wFeYAhOAf4o/ey4wCRgL1mAfOUkOVxtjrut
 ApuniDV1+L0zbWdw1QV5LnS60pU+sCDzspuWMoPzatOtuoZur9z8gVJyS3HFhgseT6xT
 Q1qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+v/hWQtB4JSG8tpblipY518cKp9px9bjZXz8O6Na1EfhAWnx1RkA8OtwaaSWuVAh7GB0mECIW@lists.freedesktop.org,
 AJvYcCVoNiSHBfWekYAMmcV2aAN1UysBHmlirFB8nyZcIKIEQPGaYvbAlFkU1tGqk0vo0Elg9AB0YS5B4Ow3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRwPEiO3E4oq0GyX41dF4bLmysf1N7qQIT3GXWgPPnZF63rYNR
 TEWfHv3I8NDOLyBpX0XExCkL/tq2xyaA0wAs95o3E3ljo29oPxLF
X-Gm-Gg: ASbGncsbgn3r4VjuBwimfY9Y4U59pDHj2QxlsGjBcqkK/ePgt04RIBGkDnehIgMLZCl
 mtKl77tY5lDKjoYqUI4Dzh/+G5nZeD9Lr3OfRv1tR8l0kjc+p8QWGWs3DDxt30bz/H4htmq3WGW
 NeBKGToSr0ww/0+Xk+RKKt9CSzZvckTp9WqNNabgA7Gv/1vHhxtvIo+jPmQJSW/r2AUPVQceH2B
 pdqXJJSovS0/xBvQwonCNMaJCJZnvSK2POUZN4djKwZDTOOLg7P3/l4YGxeeDvd7L+CdDtgaFq8
 3kYexOnGi/L+7gWC5ZyGiS/frY6Ka1jPUTw=
X-Google-Smtp-Source: AGHT+IFPB9H89htTJ8gi+6j6UdIu7tu/68Ca/noH/NXJTp/f9gbF0i/RpmkDIJCF+VEYSdvTCn1u9w==
X-Received: by 2002:a05:600c:3148:b0:43b:cd0d:9457 with SMTP id
 5b1f17b1804b1-43c601d901dmr103550815e9.10.1741620875543; 
 Mon, 10 Mar 2025 08:34:35 -0700 (PDT)
Received: from pc ([196.235.255.34]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce715731csm88286025e9.2.2025.03.10.08.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 08:34:34 -0700 (PDT)
Date: Mon, 10 Mar 2025 16:19:09 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: amdkfd: Replace (un)register_chrdev() by
 (unregister/alloc)_chrdev_region()
Message-ID: <Z88C7ZzM88skw+qr@pc>
References: <20250305210809.218138-1-salah.triki@gmail.com>
 <a5b1d94e-30ee-411c-88f5-1e340068220c@amd.com>
 <Z8tEti/ZRbx5pt5M@pc>
 <b2068f4f-c832-4cd5-b9bb-e175217d7647@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2068f4f-c832-4cd5-b9bb-e175217d7647@amd.com>
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

> > register_chrdev() registers 256 minor numbers, calling it will result in
> > calling kmalloc_array(256, sizeof(struct probe), GFP_KERNEL) whereas
> > calling alloc_chrdev_region() with count parameter equals to 1, which is
> > the number of minor numbers requested, will result in calling
> > kmalloc_array(1, sizeof(stuct probe), GFP_KERNEL). 
> >

Is it worth replacing register_chrdev() by alloc_chrdev_region() for
this ? If so I will change the patch description.

Best Regards,
Salah Triki
