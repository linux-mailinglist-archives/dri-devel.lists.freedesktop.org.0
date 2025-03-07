Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0043EA571A4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 20:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0B510E1B1;
	Fri,  7 Mar 2025 19:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ldjoocTg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F9E10E1B1;
 Fri,  7 Mar 2025 19:26:12 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43948021a45so18898855e9.1; 
 Fri, 07 Mar 2025 11:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741375570; x=1741980370; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XJ8UaQWqIa3vda379287qYK3S3G2j1GfNXMaEtrdj64=;
 b=ldjoocTgCBbTqtE7MvsJjing2au8S57JTqj7LH85bwI+geMpVfCv2h+1+0Trl0f05V
 mBnaUO/7gFrYX3TnxSieBuimh0D0IKBVkcvdMCiUki+Tbv0JYUuqXhSWrWyDN05WFwhY
 2szLb/uGMuudxd1VKpsCKwDMuGSuykjBNojD18zzFOvnCSbGP+kV5bb3VtIaXw6hkfIC
 EIEBINTY+t7WZh9xWTukZMQk7Hh58jhY3c9ltG9E03wAzc3hzezZOL1SNhfDB0TpMOuj
 141cJxldtPmPQamG9chz78dMJcUfwxh2jokg/ZZ4s9yWnQQi9SIr+xKE2HPmeyGutgR6
 N1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741375570; x=1741980370;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJ8UaQWqIa3vda379287qYK3S3G2j1GfNXMaEtrdj64=;
 b=O1sLeQiqNurBi34TJwvdWA+MueOczoEVYH6eZEWFu9qFof2DuBcAo0GapjkePNjvpS
 A/laC4JLgPMzmP2AQjVvAfttg7hS/iePUL5gkBiamXMSvJmDp/18m9/KKzRDlGIrY8XW
 kXys53nrJBTodBmlR9a+odWlAAqreb9ckfcOKPqGdDCiJ1jpdwzufpiaZ3O5byxYXdep
 WeXIUD061jO0OtpFBGo4M3HEkGxGnVraLVUzh0Ei6X4dIljlb1m1rM03N57btOxqYQQF
 cmT2MeVnnefmEZXkNL+38y6HF7JGhtRObhPzuJSbN1Ris0LYF44sKZ2sj8a8ywrqlIh1
 yl7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkeEZd2Kg0SZ1VigNUjBZJfYYbbtpdW9LBjNeR/xineIF2ZQFQT8oL4RdsiIa6ooy7bKGQe2FWucEk@lists.freedesktop.org,
 AJvYcCXAMIWxiYSBFKaO2HS5y4PNXl0VEJA1DtmEBbFEsZdk2fJpNiZMIA8x/jYFV8tC8WmwlxaceWt3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVksx60LA9g9dzKeBasWmAf80JmG4FIdb3GvqR5SR1tpQ4IWNJ
 BErrYJW1LO36DpM9n6EDV02voBlbnMcwlUpmkWooQVkPZEj+OVzL
X-Gm-Gg: ASbGncti/F/a9sfZ4mMrTJ7DVehC/DtT7ndxOpRopACwI6huqfLEyrWywNKWcXq8dP0
 CZhJ5gIDJLtNhCY0nFYCKQmrOm53p8r/0eWIO1vu/NcxpT9iLc+pgVaKc2qQ6m701XBuTk+7vgK
 /ztsRsSMDEUwFDvx/yP+JuRWv/cMDPutlG/XBY0lc1DYC+2eCUXeodAbsZ0tNyFw5zAiQ9H/AOF
 CzWa20CfGB5aPL0Vcq0KNlO3672kw3CIUGOE9elJmELCYik561HxPch4a77xu5cEpUYJZwdxvj+
 JSzvkVvBIeGfHMVLmTVlPExtQYCEyOUkdQ==
X-Google-Smtp-Source: AGHT+IGwL2b8gc/gS7dCHf+RS4DYjwJuU8VHvq/jA1tVjXmfJEK90HGc3P8fz0r/SDEeDhURxhKXJQ==
X-Received: by 2002:a05:600c:4f82:b0:43b:ca31:fcfd with SMTP id
 5b1f17b1804b1-43c601e18e1mr35674915e9.18.1741375570167; 
 Fri, 07 Mar 2025 11:26:10 -0800 (PST)
Received: from pc ([165.51.44.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd9493a2sm59174315e9.39.2025.03.07.11.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 11:26:09 -0800 (PST)
Date: Fri, 7 Mar 2025 20:10:46 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: amdkfd: Replace (un)register_chrdev() by
 (unregister/alloc)_chrdev_region()
Message-ID: <Z8tEti/ZRbx5pt5M@pc>
References: <20250305210809.218138-1-salah.triki@gmail.com>
 <a5b1d94e-30ee-411c-88f5-1e340068220c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b1d94e-30ee-411c-88f5-1e340068220c@amd.com>
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

On Wed, Mar 05, 2025 at 07:18:33PM -0500, Felix Kuehling wrote:
> 
> On 2025-03-05 16:08, Salah Triki wrote:
> > Replace (un)register_chrdev() by (unregister/alloc)_chrdev_region() as
> > they are deprecated since kernel 2.6.
> 
> Where is that information coming from? I see __register_chrdev documented in
> the current kernel documentation. I see no indication that it's deprecated:
> https://docs.kernel.org/core-api/kernel-api.html#c.__register_chrdev
> 
In the book "Linux Device Drivers" 3ed of J. Corbet and al. (2005), it
is indicated that using register_chrdev() is the old way to register
char drivers, the new code should not use this interface, it should
instead use the cdev interface. 
> 
> >   alloc_chrdev_region() generates a
> > dev_t value, so replace the kfd_char_dev_major int variable by the
> > kfd_char_dev_id dev_t variable and drop the MKDEV() call. Initialize a
> > cdev structure and add it to the device driver model as register_chrdev()
> > used to do and since alloc_chrdev_region() does not do it. Drop the
> > iminor() call since alloc_chrdev_region() allocates only one minor number.
> > On error and in the module exit function, remove the cdev structure from
> > the device driver model as unregister_chrdev() used to do.
> 
> Sounds complicated. Your patch seems to open-code a bunch of details that
> are neatly hidden inside register_chrdev. Why would I want all that detail
> in my driver? I don't see an obvious advantage.
> 
register_chrdev() registers 256 minor numbers, calling it will result in
calling kmalloc_array(256, sizeof(struct probe), GFP_KERNEL) whereas
calling alloc_chrdev_region() with count parameter equals to 1, which is
the number of minor numbers requested, will result in calling
kmalloc_array(1, sizeof(stuct probe), GFP_KERNEL). 

Best Regards,
Salah Triki 
