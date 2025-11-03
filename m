Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9DC2A452
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8EF10E365;
	Mon,  3 Nov 2025 07:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tmv2JVIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE1310E366
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 07:18:41 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-294f3105435so339095ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 23:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762154321; x=1762759121;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y22k5ngiq32o4MbKE/s0CLErP3q9IoFtmfwfCLBHatI=;
 b=tmv2JVIW7MaseLzMVRvMfN/OoB4WwKjDLSDjw+3holZuK9V+11cAlg9dJWD+5gLnnc
 knNXBbXzQS9/8aUI5hb6izxchAcC2FVYKgg0gVLCIn8q3IpgESL+W6oESV0cGhgRFKGs
 wd9X+6INkXzudBpCMkdaZiVbc7P65O9mqQBYZob6bjU7Fi0+XgJ6m1Y3MxGuzaI39Vbp
 NFeCf5B+U2846crrArFEAS6fcg3ZtxOHjDTKajgHIFuVAi9/ocqWlA7UMh2ukeci6+kj
 d4cJnGVZvw7IvcMYjXw20LMpuUPX6GhE+q3j+yjALatSe/phVO8jsvKxC/AzH3q+DrHN
 P2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762154321; x=1762759121;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y22k5ngiq32o4MbKE/s0CLErP3q9IoFtmfwfCLBHatI=;
 b=T+C+607A426K4AuC1l+LtOu6RqgM6QYiS1MMlpC8bkOOO2elsAoeWKnLvo7gmqbi4q
 mi35GabYqxFU6evyIbdJ6BEHbCxcjjXCefO+hHd+kh6gxd8+DRMebXDNz2N6Yg2EVAOn
 FbKoZ2MUMRu98le7vdz6H5afnW5aGjzpzO1SfjbEbD8ZCzwkqjVqTa72LjH5SJdYtyvv
 ujBocA3NKvPzZd4IB0BY0FPVdnGgLtSVqxHE+pZDUVDHPDt1qQOF52GP6fAuCfD/giK8
 sStZYuwX5zL/2wsNGfHFHyNW0v6WwZgKlAhTC6ecJLhdQ8LkoR+zuaTgfdIuG/D/rQaM
 UizA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrwv0Bl7SVk/fHZ6/tHGuEQOUrL6YXkQo7zN8gxaNR1LxGsX2t+hzTTXuWIn1ue3PLU9RB5WWitcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHXhXf7hvZi82mqxzB0JMlSYcp0y2ELPZ/10FZ85PBl30MIkby
 sfUS7fPtyaUs/GBaV610GHiWgXl11tPrFCqfzQV52qfLivEhxI0doUeppdSAjoZZ0g==
X-Gm-Gg: ASbGncs0/Uv+Gol5P+XSJxyqWkJURYqxcsAUQacId03vFlpdlcyaxVTPJYQK9iUcmXY
 3sixPboeR2vjhyIAy0av/dfi1YbY47g30+5hCE5Gua/G+OkmEtqU+Cmonvaw92hc/Bpv1MAAXBI
 TDZCHZeYksL3m+pn1AZZn0e9GCNG37UI/Ox2oIHG2hWHXrUSgJRmyF8zfdo7w1pdQWzriFYEbXo
 rnjkQYXw7rfqz67U+zbN3keOc+4YN8mVCmd6CQEIyLJ9sCkR8RXqcJsjOxdhBd38BH/124JRc6g
 f8tqT8fef+iUtjhiOoEumdWQoK77X2mr24ssrYiGWHXARnzIE25zWHMwOmhX7+L+QBLNHK/tKvi
 yp+pHjHGL+CMLsxgYH8sRVJrI2MWuxIqo/P5hRXeKm97LxcdJQlpUBSAQ10KW7QfWxgg7+LiPV5
 TKJ2TPJlnwWjYn8qiwBc3L+7qbnypMFiGsOHQvqQ==
X-Google-Smtp-Source: AGHT+IHz7vQ0cm4SGWCD8qu7hNB41Aed4i8aC1NkscOeFOjchnLwW8gMwvqn5xaYYumt7DzVtDnmgQ==
X-Received: by 2002:a17:902:d2d0:b0:295:30bc:458e with SMTP id
 d9443c01a7336-29556477728mr5855785ad.3.1762154320729; 
 Sun, 02 Nov 2025 23:18:40 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7db197340sm10108242b3a.44.2025.11.02.23.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 23:18:40 -0800 (PST)
Date: Mon, 3 Nov 2025 07:18:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 07/22] vfio/mdpy: Provide a get_region_info op
Message-ID: <aQhXR2M6riHmufl7@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <7-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:21PM -0300, Jason Gunthorpe wrote:
> Move it out of mdpy_ioctl() and re-indent it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  samples/vfio-mdev/mdpy.c | 53 ++++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 24 deletions(-)
> 

Acked-by: Pranjal Shrivastava <praan@google.com>

- Praan

