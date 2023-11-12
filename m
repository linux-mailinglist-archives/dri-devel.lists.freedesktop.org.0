Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0247E9357
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 00:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F7D10E027;
	Sun, 12 Nov 2023 23:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E58510E027
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 23:12:36 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-692c02adeefso3302484b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 15:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699830756; x=1700435556;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kINOohyUI5UBn47vUF3tJOP4oDKGMiC1TLYt+h+N9h8=;
 b=sKPi93xNmqNGNORuDbvgpnL5xDC7NZ9yi0IJZCw+m9TCAT3xU0Sbf7DFunCk08ZOhc
 MN0TG4+U9BVnhkEOVts98nfPakpfwD9jnNr3Dn4BuBEXMlka6+95YiqYyS7T5MRUjFlS
 EbvRlnlB/S9Gq0agXD7fl73L+/1ZiokYmAJq1CN6Te8pfsC5NwHLqOl2UnPQEY4BfiHN
 i+V0vS2RwdZJo7nrfGtFuB1sMsOUWTpB1knEw9fbTjfrs3lkzB2guXr36qxo/uX62V6a
 RM+p/cCCA/1UGUAYJtzqQU9QiEvfun3xUTu7xptuHL9RMk+x5UEUUpYRgNLfY+u4ywNC
 xg2Q==
X-Gm-Message-State: AOJu0Yz4PKZLM79aWmveCDs4FT+VtPoYHS1H/LSFnbhzUp/1NmDgLUbu
 3Xo+LI1SBHBYpaAnIR3S2Vs=
X-Google-Smtp-Source: AGHT+IHM1xHv6Bya3xnKdXlAB4GGDEjoopo7t48S2k9vh/N7JJhUB7QT9lDd1A0TcBVCTEHnRb9f5w==
X-Received: by 2002:a05:6a00:13a8:b0:6be:2bfa:6290 with SMTP id
 t40-20020a056a0013a800b006be2bfa6290mr3248217pfg.8.1699830755833; 
 Sun, 12 Nov 2023 15:12:35 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a6546c3000000b005b8f3293bf2sm2554422pgr.88.2023.11.12.15.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 15:12:35 -0800 (PST)
Date: Sun, 12 Nov 2023 23:12:33 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nischala Yelchuri <niyelchu@linux.microsoft.com>
Subject: Re: [PATCH] Replace ioremap_cache() with memremap()
Message-ID: <ZVFb4f8IRJeCFmYD@liuwe-devbox-debian-v2>
References: <1698854508-23036-1-git-send-email-niyelchu@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1698854508-23036-1-git-send-email-niyelchu@linux.microsoft.com>
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
Cc: linux-hyperv@vger.kernel.org, dave.hansen@linux.intel.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, hpa@zytor.com,
 kys@microsoft.com, wei.liu@kernel.org, deller@gmx.de, x86@kernel.org,
 decui@microsoft.com, mhkelley@outlook.com, drawat.floss@gmail.com,
 mingo@redhat.com, haiyangz@microsoft.com, mripard@kernel.org,
 singhabhinav9051571833@gmail.com, bp@alien8.de, tglx@linutronix.de,
 mhklinux@outlook.com, niyelchu@microsoft.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 01, 2023 at 09:01:48AM -0700, Nischala Yelchuri wrote:
> Current Hyper-V code for CoCo VMs uses ioremap_cache() to map normal memory as decrypted.
> ioremap_cache() is ideally used to map I/O device memory when it has the characteristics
> of normal memory. It should not be used to map normal memory as the returned pointer
> has the __iomem attribute.

Do you find any real world issues with the current code? How do you
discover these issues?

Thanks,
Wei.
