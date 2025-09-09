Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EE0B5044B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 19:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B978210E2B0;
	Tue,  9 Sep 2025 17:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="iweV4KM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD82F10E329
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 17:18:33 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-7240eb21ccaso51464536d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 10:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1757438313; x=1758043113; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jj/bcWBxZVXsXKGTYOIPhiO8Lo/tl7Dho+q4t8Y0/8A=;
 b=iweV4KM9xxyU8XwFQY00ZX57PHHMhpJ7+p73dq4XM5xDPBC0FWJdHkReYDq//O3xme
 u3wnWK3x897ipJIz1ZfSEBbXn26nnyzw9hH0pcjJcdaul+bZUMmzBJlXoy70LOhQnQcJ
 86eUW7xU98VydlFHqRZFBqZPvOHUVwNVOkNRBe4KB0SYjCiHClMUXwJ3qJEi5FezymgW
 okxvf+WnBboEnyLXB8MlsklwRw5dBRBr0MNc+P5m4O5T3/Dozp2a/OAggxevuQRJT6te
 bKIcakKCyQD61fvgZyFVnKVZLojZXZH/EvQxkcl1D2g21ARfTnAWcTCWgK528uv1cjCr
 MKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757438313; x=1758043113;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jj/bcWBxZVXsXKGTYOIPhiO8Lo/tl7Dho+q4t8Y0/8A=;
 b=k8FLOjc3P084uFgofB5yln4ST5lEOaDGy2jjVOvxvgTCTmVHdq+Al7ySEYKRRQvFMC
 oyPH6peGrd+I3dxCr0DnUt9Q8dZCbHdWlnTMC/FBcDBj9ayxVrZIDlRcmzPjzu/AKPKO
 yQcJJiN5vZrxJrVcE8NyTY9WOqHORmsX/EbMwSV55AEoajxqUfamz/fOIQrg62sQ7F3N
 11H6J7MKJ53ThUzJw3IV12Q7D9BhukGoGcPzpXMWklnP/XxRXaoWFF4x57Khdy1YBEpo
 wBEstT8LqyaW9CyQezYv+nmeMXwoKlVqX1q6DpR0yd9ssYtB5gKCZfFEnhySNUyHqoky
 H3xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk+1z8VlrvaMMenchINTqKUxpcMWE2pEL+VSvgpmkxQd+aM0jT5QTLN5yI02QW93KGkToJNceCwy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOsGgVs333Fyo0Vh/WRfvDYGmZxQt1ec1w0dRCsRK+tiFYUAjj
 lUPYvj74kIiSmtwpkUtpblWh0jYnGzxN/OQoHgOI7AmENuiCOFGrJBSPpcMuDG5Bo+g=
X-Gm-Gg: ASbGncvglq9pw9aENQISAid5rVQwKuWYJ+QlTyh3iQP9CJBQp8Ei961+hWCmyzt60SJ
 syDbgT9IKrFvf3R2GSU+/aW+3CrzYuld8KEOArD/izmeyhWhbuKVdmoMrLdzBPsKmW/Bri0krYi
 qfPUGZJHz1tfpygpsg7lWOborXGfWDaoInsQOpmveJyfqXot96ZH2cduDZwvZbdsYYzTYLJXBlF
 8fQWEBqDZ6IYFEbkfplcORfRZhdP50lB9LMoeM5nYMG31fAUdMCP1+k3CPACWNlETpLfSEVgQaR
 Jt/8MQqbaTp3Zv5SB021BwlaLaC/SDhWizNs5+V2SW578Bk29l4yu0pVZe8a89Xi73WnIU0nLPr
 e1uyaPZ95nyFAXQ3grRZJoFwYHHH+sWq3UyYFWlgaKcbDalRHmwBGEoOre5Exaoc8NyrM0Ou+Eq
 4BJi8=
X-Google-Smtp-Source: AGHT+IHZ7ehKhGwoOV2AVu3CuGxNBX69anZHCiUiB8Z3pbd8TMRLoLOZKTs2avizfffj+d8ABXY0HQ==
X-Received: by 2002:ad4:5ec6:0:b0:728:fe3b:756f with SMTP id
 6a1803df08f44-73a1bd67b1dmr120979546d6.5.1757438312609; 
 Tue, 09 Sep 2025 10:18:32 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-750486ce544sm28863796d6.71.2025.09.09.10.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 10:18:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uw1zD-00000003j9A-1xOT;
 Tue, 09 Sep 2025 14:18:31 -0300
Date: Tue, 9 Sep 2025 14:18:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/6] mm/mmu_notifier: Allow two-pass struct
 mmu_interval_notifiers
Message-ID: <20250909171831.GC882933@ziepe.ca>
References: <20250821114626.89818-1-thomas.hellstrom@linux.intel.com>
 <20250821114626.89818-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821114626.89818-2-thomas.hellstrom@linux.intel.com>
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

On Thu, Aug 21, 2025 at 01:46:21PM +0200, Thomas Hellström wrote:
> +struct mmu_interval_notifier_finish {
> +	struct list_head link;
> +	/**
> +	 * @finish: Driver callback for the finish pass.
> +	 * @final: Pointer to the mmu_interval_notifier_finish structure.
> +	 * @range: The mmu_notifier_range.
> +	 * @cur_seq: The current sequence set by the first pass.
> +	 *
> +	 * Note that there is no error reporting for additional passes.
> +	 */
> +	void (*finish)(struct mmu_interval_notifier_finish *final,
> +		       const struct mmu_notifier_range *range,
> +		       unsigned long cur_seq);

I would rather this be in mmu_interval_notifier_ops, though I guess I
see why it was done like this, I don't think it is a great idea for
DRM to wrapper the notifier library with yet another library :\

Regardless

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
