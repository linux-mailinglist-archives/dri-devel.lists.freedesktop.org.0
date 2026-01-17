Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D06BD38B51
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 02:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F27610E004;
	Sat, 17 Jan 2026 01:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bNd3OQDe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EDB10E004
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 01:38:35 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-50299648ae9so102831cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 17:38:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768613915; cv=none;
 d=google.com; s=arc-20240605;
 b=ChMWyIdavY0qfwIxC8d4xOxRIrnNgrU5s55TIH2wCT26JerlfrozpYBemkbZn5y/kn
 t9RdhfZicLAewnH1Y/XTFisyPmywZV8cp4C0ML8vMTi9rlEtBSaBEM1PNl7j5X8CUTdp
 GTT4zqvDOcDE5zSEtDFynhtfAKTiIj+oBsD1Z2scGf14pfQOwq7yKWiemGwpHRUz694s
 phIrow06H5HVLMnLKL2oz+Y/asjQW7UnfWKHj5HsoT2ytqrksjf7Qrq4gl+aQombM91w
 Q9QgtFBPnQD6xiTYkpbD45MMAF72JMHnJ3rcB0Hx0MZgS03MJrRVL9LcxgaPDkn00WKC
 PwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Q2H6+0pE8e3uoQpkc0zERECrSC6JdDUg6MWzO/WBO/A=;
 fh=FWlTZEeQgheQ68A3UlE+/Gb3szhkvRFikEamXOF7dwU=;
 b=kkjHOgE73qnQvG9h3NrB2e97uMYpoRD+Gw43P+Oow5jG4AXexz3jJSGyez0DMsXzQO
 kRYJiCOlO1V1rXpkg6O0NaF0Tvh7WMK9VTKxkwEwE5N8Nku6fgr5YEom1iHEmA8Tih9u
 C3SEFDpC9sFbdDIyaEAVq9Zwfh5w4vQFfJ5pL5jBqL49/gTlh0aXKLCHuH0tPN6zTdpi
 7wtQiSzUNVJYYoUToP0Y6MWLcyb6iM1QzlO7jpv2VDwH+G3ItI5IHtw4EKFH6zBMnTWx
 Hp5nuKMKq3m0Nle4S6n6NHWHP3SnyEbgWD0ORaMN9vnWrQ0QYLz5hPZ//lc6TtpdjA36
 daug==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1768613915; x=1769218715;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q2H6+0pE8e3uoQpkc0zERECrSC6JdDUg6MWzO/WBO/A=;
 b=bNd3OQDe2VK2wwZu5XLX3X8ESTCA3rNEg7dAyuaadYcuiwTyo4YIDUfkx1U5MkvYsv
 cwvhtmhq5R/nIurzSL9B/uwf3HTeXcbsUuXmVegKfpJcUK7K8yYb8VYO1CIKaRV/AYQ0
 Dw8twTfBCe2OIau0ThfB5nc/TjUEOuAruKu8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768613915; x=1769218715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2H6+0pE8e3uoQpkc0zERECrSC6JdDUg6MWzO/WBO/A=;
 b=twWFk/CQ0kHMVtkxEW7gSD/o6VHxVYeikzo5Bsr1K3lSzXd93qfNoy0AL0KtTRyLPO
 xatqWop2DBikcS4RJY6GLr2b+MLzhCkk+BzVCzO21NKBiSmUGnDvP2kti+E6ylDzTSsl
 NccCSzQu7JLpsabh6yL0jYY6NbuW163wsGMmUAN/s65y4j6d7ipj6Cb+kGi36kBrXDm1
 cES5SkyK7IDWZdHqubHPaMBSgrD8xEz6NOiGPLqDnx73UUwirOLZ1f4z1hln755BBZml
 MdG3jh9y16/mWYM81otP62fgklmadrY3eA0XqVTcdERMNiobE80gJemgHyiVi8Ufvv7Y
 carQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMRFkWPAHtc/oQoNX57QoNWQPjxX1tIS49v3sqkz+HNoi68yW4RpP2YvVdBMkRXidNzHddbaCwZbg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI7Pnanx3nyabikrapDNu7BLJbpAWXu83PI4QI2W9sC9c/rwv1
 bltzS6b+N3gFqgbNpyVuKYwkQ3zMz6P2tOued+RFEf2BkjPqZTYMDw6QRRwq25x/VMBm96kvFcH
 F+f5ywBK2QLOnRGMppytRJ46o0pdEdFYA2ok5Nc3O
X-Gm-Gg: AY/fxX4rq02rhVGC/F1R9hL1hDC5ZH9UZLvVBSiNyoo1XB2p5XwwkThgMPXP7O3g2UL
 fxHMnNCKAC2gvtJHvtjXkG84oElUMXPFc+ORVjHGV0nQU7BI8t2FekaVwgpS6+E5CIlAIt8jcom
 gLvqWWIcjtvxUOpj84yrrzGzLyXPS4O093Y6O1/JGcWNIG/VC6DT1q/jlG09bgBUEyPjXM31T2H
 4+AHCB7KtA1QrIGwWB7SUbvzLh8Dp0GEW0+uD60pNOL/KmnSJAomRHyidZ2TExUW3hb
X-Received: by 2002:a05:622a:1814:b0:4ed:70d6:6618 with SMTP id
 d75a77b69052e-502afa0309emr3897331cf.10.1768613914449; Fri, 16 Jan 2026
 17:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-6-tzimmermann@suse.de>
 <CAODwPW_n=LfW+az4v8XecrzAksFmP+0U-9ELb_TrVtLL4EGk9w@mail.gmail.com>
 <fcc432e7-308b-4d8f-8c26-355409f1bd94@suse.de>
In-Reply-To: <fcc432e7-308b-4d8f-8c26-355409f1bd94@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 16 Jan 2026 17:38:21 -0800
X-Gm-Features: AZwV_QhDDCK-DGc4x628xsP0tH7-ZhZPoyw46AeE0cQf_kwRGLLjJJb8oiibhxw
Message-ID: <CAODwPW-8MP2Ps8J6DV7K3CeTMGC_HFyb32P3Tj6__nZ5w3nxCQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] firmware: google: framebuffer: Fix dependencies
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Julius Werner <jwerner@chromium.org>, tzungbi@kernel.org,
 briannorris@chromium.org, 
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

> Corebootdrm already depends on the CONFIG_GOOGLE_FRAMEBUFFER, which is
> standard behavior for all kernel drivers (i.e., drivers depending on
> architectural options). Having dependencies in the other direction
> creates a circular dependency, which Kconfig doesn't handle.

Yes, okay, I think that makes sense. I thought `DRM_SIMPLEDRM` was
some sort of more general option that the DRM subsystem is enabled,
but I guess it was just the driver that you now replaced with
DRM_COREBOOTDRM, and I understand that you can't have a circular
dependency there.

> But
> generally speaking, what's the point of having that framebuffer backend
> code then? I tried to remove it, but it is supposed to remain. But it
> would not serve a purpose other than creating the platform device for
> the actual driver. I'm confused about the reason for this design.

I thought the point was just to have a place to put that `if
(sysfs_handles_screen_info()) return -ENODEV;`? (That and that PCI
parent device thing you're doing where I don't really understand the
code enough to know what it's for.)

If you can put that line directly in corebootdrm_probe() instead (and
bind it directly to the coreboot bus device), then that's perfectly
fine by me too, and then you can get rid of framebuffer-coreboot.c. I
just assumed that there was some reason I don't have the expertise to
understand for why you couldn't do that.

My earlier concern here was just about not putting that line into
coreboot_table_populate(), because then you would be preventing the
creation of the sysfs node for that coreboot table entry, while all
other entries that don't have associated drivers are still there (and
that seems inconsistent).
