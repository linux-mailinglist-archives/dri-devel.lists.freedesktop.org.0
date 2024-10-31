Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DEE9B7BEE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 14:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA8310E891;
	Thu, 31 Oct 2024 13:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UmK4rpsK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05A110E893
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 13:43:26 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-20ca1b6a80aso8943495ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730382206; x=1730987006;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XgqLVJtUS6V/VxSplDk69LNhyYJQoAiM+I9RcwTlMEQ=;
 b=UmK4rpsKoEu0JsyTixpUBvrbjLvwD1SNfVbrGwjh34Qf0LFzNPFIQSGDo+pUB0CVHO
 t474/qJSCzesHdbUDZNhMoVT1isk/VAIxbP+acQpzKj/2eQq0Ft8QnT8vGoHS8JenKNc
 S+z8nneZuJ3NPzSepXuXiaU6ZcN5NdAt+GTPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730382206; x=1730987006;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XgqLVJtUS6V/VxSplDk69LNhyYJQoAiM+I9RcwTlMEQ=;
 b=ihaCl0snJO8FohKUpfXtXVhqvQwV4ZObNuJQmkNsXUrZ7bySRXswSUJVkJBatBYSog
 DO+RDE8xTrrImM6GQ0julnb9Usv6xi+cIgh3PM8Nxu6mbKm/Cxw5GAXweifJX64EUWrU
 I2d9hWseDID3QZKKOjCLsqWEJQocSYmcZWinTca2a6vKhoR3SPJTQcJR7J7/0swl1d6Q
 7FhTe+2RqQgC2U35BIF/xzbW9P1kvhC7wzuetcdgkyHdH7XjaLhngNJ4M/3NNOH5Z3G3
 7mIuUJp6KRkLsNSMzte5tTwMP29dUwwY+hLdbm6hOiSx8KQxPKvi/WbDNzhsN0W8avo+
 9gfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7uNPJQOCGbeded/oDyOpHI88wtTNETSkWFGwGiCZ/hDTznrexm68q1t1Ck8k5GtHVyuVxcQUBblo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9cPhbmpN2bI1rlIXMNDu8wq89wT1T8DRQSb0NSRwS6bcyclu1
 +UQfjcJMw9ybruWfyHqqAggWoGu+gEMtf3iFiNuZOiTSTW8KhCuGIbbwHdC9HF6qn68v8Oug37Y
 =
X-Google-Smtp-Source: AGHT+IHG9QcftBtYNodIEgxQElxzpG4w1S/ex0D6O3laQzIHMUa8PmFjj80z7pXz8hO02AkecLyFPQ==
X-Received: by 2002:a17:902:e74c:b0:20b:7ece:322c with SMTP id
 d9443c01a7336-210c6c16965mr264141835ad.29.1730382206203; 
 Thu, 31 Oct 2024 06:43:26 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:4470:8fa8:957a:6c05])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21105707e43sm9009905ad.97.2024.10.31.06.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 06:43:25 -0700 (PDT)
Date: Thu, 31 Oct 2024 22:43:21 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] drm: i915: do not NULL deref hdmi attached_connector
Message-ID: <20241031134321.GW1279924@google.com>
References: <20241031105145.2140590-1-senozhatsky@chromium.org>
 <87y124jyl8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y124jyl8.fsf@intel.com>
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

On (24/10/31 13:33), Jani Nikula wrote:
> > intel_ddi_init() may skip connector initialization, for instance,
> > both intel_ddi_init_dp_connector() and intel_ddi_init_hdmi_connector()
> > are optional.  This leads to situation that ->attached_connector may
> > be NULL for some connectors.  For instance, on my setup 'DDI A/PHY A'
> > and 'DDI TC1/PHY TC1' are not initialized.
> >
> > However, functions like intel_dp_dual_mode_set_tmds_output() and
> > friends don't take this into consideration.  This leads to NULL
> > ptr-derefs:
> >
> > KASAN: null-ptr-deref in range [0x0000000000000848-0x000000000000084f]
> > RIP: 0010:intel_hdmi_encoder_shutdown+0x105/0x230
> > Call Trace:
> > <TASK>
> > i915_driver_shutdown+0x2d8/0x490
> > pci_device_shutdown+0x83/0x150
> > device_shutdown+0x4ad/0x660
> > __se_sys_reboot+0x29c/0x4d0
> > do_syscall_64+0x60/0x90
> >
> > Add a new helper to avoid NULL ->attached_connector derefs and
> > switch some intel_hdmi function to it.  I'm not sure if we need
> > to switch all or just intel_dp_dual_mode_set_tmds_output() (I
> > have only seen this one doing NULL derefs so far).
> 
> I think the question is, what are we doing running this code if the
> connector initialization was skipped?

I'm not in position to answer that question, I guess it wasn't even
asked to me.  But...

For instance, intel_ddi_init_hdmi_connector()->intel_hdmi_init_connector()
can "error out" and leave ->attached_connector NULL; I can count 3
conditional returns before `->attached_connector = intel_connector`
assignment, yet none of the upper functions would even know, because
intel_hdmi_init_connector() returns void.  And this is not the only case.
So there are several ways to have ->attached_connector == NULL.
