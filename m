Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B8C2A434
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489E310E15E;
	Mon,  3 Nov 2025 07:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YL2YI5Pt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E2F10E15E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 07:17:58 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-27d67abd215so381685ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 23:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762154278; x=1762759078;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fkl25q/g8s7OS88Wbysk4mwVIyDLafMsvz/s+Uj9Ki4=;
 b=YL2YI5PtWs40P0oXipqq+vz2+JsTFcz4n38h4O25OVMjPu4DapvJII2q5F0m6DLxrh
 zRkPu4yX8mkEIa1AhETlC36DcCTgamyIaVkg9DC5PIazrmWIqDdgzrjdsKcGLwroGzqc
 LZQC/dEhvbr/6DrUSBfQm87+OeFDslEKha+tyOMNRSpWtLflFVD+/om3W3vglkUU5EDU
 Djz9ygtwFqnaNZpy7wHWuVL1711grgDftY71MJAzLCoODQz9Dst1DYiNAF8fxQSvBHdP
 EdVgnfKlNYtP4oachVmgx9rTVeSmaJ3LNra3h900Vzbmf3aZ4GoGC+V8KF72TuRKuo0H
 ZN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762154278; x=1762759078;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fkl25q/g8s7OS88Wbysk4mwVIyDLafMsvz/s+Uj9Ki4=;
 b=aQ/R+CtlmtKL0SfL0WPv5dlLVyhTd8RXaM+XocaBOA+yFDCC7uAxXzfYEiMD+YKKKI
 OyOSaKz0qYUWb0NKiXvqHnAWS1CGXvAmHgyK1qxDnkPJqm5xlVWbccgOaXCCvFZRjIlR
 cs5/CUzG4kvlsKQ6UOp80ae5nQZKwwLAm1j76JixAfvIH51YTS3ZbOrr5An5FtsnYIQB
 j3K/uuKWcSwbdNncKW1iAYl+aHZhcNbomVKPAuPKpgxL9mcHg5iZ6YlQdWWMCAQuu6gK
 uucDtMq8rioFGMratOQj2/BU+V5VVonfViGiE13UnH3uhpHMTe5r07Dy6lwk/lmxhjMi
 ELDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0UBaHFYSXHCRNv+mBPZ8Aow9zsofVnHpBDLuBkz7FTjMvMxy/2brJDkq3r/0d9z8F6b53no+7P9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9NBU59R5gZBE5c3vfIJl2biJB/OxuNELvpamgVoOCQcY5rZTo
 X2CY9xDmdPCotI1Oy6TzXp1zwlBpK87V48406Jt8/8dzn+LpZyJ7+MbHTKCPpiMEkQ==
X-Gm-Gg: ASbGncsBDVyWF09UWTOj4WLeJS7+bd/xCKcXo17TNiuJVQrcEhMMSDKi/kva4zv03q7
 uJaodc/UVi2YfJ2IR5ElEAS7H4N7Dp0yCrlw+evsZLK4kYZgaG8rT1mEUwxsldkbIS/m38kIkFe
 /RAu7NDHgNZTqS6i6O/TuBMiyOO6kwXl/CefO5B9WLLZEh5rQB6MQelVAZV6sGf+jHo19dYAU/+
 L/AVfopWTn35CI8nW9ksvbBt3SjqozvsCULaZJom36UF28TJewXtNpX+2Wb24YHAUB8afwQKNIK
 kvnB2z5RnqsujdkMNHlw+aFIgOA8vkS9/JV1H8UtI3nwqr3Ams/O0KYi/SmKkWsKdA6XWw+WY3X
 0bYjDQGK1+tvMEgCBI88l47FMEj3Mlank/SdN66ek9z3GfaehdohOtqHLe3SfzmbAJyREfSgckg
 cu3ZJurXWinj6dOZWBZFmAi0qfn4b6SyIlFZq1n7G0QICRYufo
X-Google-Smtp-Source: AGHT+IHfDR3pQIMSIQjN/GyrpnHhW694vgQCyWpAq5GaAMMYhNpX5IKRikqyk5tXJtqoi708RLXBcA==
X-Received: by 2002:a17:902:e88c:b0:290:d4dd:b042 with SMTP id
 d9443c01a7336-29554bc5206mr6800415ad.16.1762154277664; 
 Sun, 02 Nov 2025 23:17:57 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b93b7e19ea0sm9634160a12.5.2025.11.02.23.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 23:17:57 -0800 (PST)
Date: Mon, 3 Nov 2025 07:17:47 +0000
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
Subject: Re: [PATCH 06/22] vfio/mtty: Provide a get_region_info op
Message-ID: <aQhXGwlxZrZl5GMN@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <6-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:20PM -0300, Jason Gunthorpe wrote:
> Move it out of mtty_ioctl() and re-indent it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  samples/vfio-mdev/mtty.c | 53 ++++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 24 deletions(-)
> 

Acked-by: Pranjal Shrivastava <praan@google.com>

-Praan
