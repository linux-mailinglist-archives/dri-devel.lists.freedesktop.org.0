Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E41FA5FF3F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 19:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C975210E90A;
	Thu, 13 Mar 2025 18:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GcizDllr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5A010E2DC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 18:31:14 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22438c356c8so26680345ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 11:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741890674; x=1742495474; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=Jt5WSssG+OEvsuPkFz6BZY4vYElG8JeyaALVDa3jMX0=;
 b=GcizDllrZBDy020OOxpP+bsx0zi9u1tBW4pONKcIOq3BvUgkA57BVHY3J0A8dCA47b
 xT6QVwoXrtLLhpyB5W8vA1mRMIpcgRdm7s/BqVdb2fGZIVPyk0/wEkUnrDCUaLhQsQzy
 iNa1uKzUPjfmWmHjOsIe5OKcXT5sHyb5G0R4vfomdK9DAxYeFueypbdrSn0f+RSarnqi
 9pkmbMCcVjNad6hzIHj+4aBd9VvxJJLc2JOnKeAQb0OjFhivGfEEAJnmgQf/4qwKXWEU
 O8ZGEvbNz8NqB7hnqqz/7fVS7UBRywA2yCrqErDkbwwzyCufmNhj1+nHjo7hhMSpu9wx
 P/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741890674; x=1742495474;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jt5WSssG+OEvsuPkFz6BZY4vYElG8JeyaALVDa3jMX0=;
 b=w89I9sO6klC2l3XRSom80ESv3XlXeic6DbQgL5wkvMnn67/VQFEISJMsBUwChpvKBr
 XfSxqLArJsMxAl4YaC3eoko05CG4de01euTEohE02/i0r68j0lbDw5nD4ZrUHaAZnZSl
 Oe3/cONBXVnmR+NioPRCy/3GVEmPhQl+IzjUDUmtFWmfu92KC5uYrLMwYKELON6tW2/f
 8KHX7nDrNWpjWiPidqBfMU53y2WBvZlEQ4MVWgJEaKFdgN4jH4Wts6n0pg1xBF81Ky2W
 q36YqvDyoQRolyJNAZS0hmS+b9j02tryv27iLmW1t5H3JR2c6FQ70P4T6ZeVqDP3aPRn
 CYEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR9XwOaxNP8QGwQf71wncBtGVaOxNgBurkQq6l3+M1KMUVHpWJ9DoKgYcCyLZAmX4jDp3L/xPH2pU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYZDZ6JHAdzhFWqvLNhsdY79QTQ4EdCflk4I4IFRC8XqAaPEaz
 zKxXVEIvGkJzrOtD3SDdIOFw4H8ML+tK/yT1KZGlW+4uP1v0lnFh
X-Gm-Gg: ASbGncumdvf0v/Uq5rxqt6vc0wmiR6jvYgMBN8Ui2oVeKkj+rtcDk+D+uuni42pRQv9
 TwfZP6i1WRe9mxIu8lzYOHs2f0LyNx61BkLO/Sk2l7YJ9N/Tu/nLBDSFV9hqQpfCa/CYWFosCT5
 cowA/ZGCmsMoFYNGiBEUpKL+dkSvzJ98gPgNsTg48irdafduYhiHuw5lULkvHTkLXdUaZeUJmk+
 sZCIzDa7C6fWGcagaIR+A+0+iujNZexFx78+3xWwsAMv2TXf1OZoWd/ALNfqbX0qCxMSXYOuGIO
 rTp5KA3ku5aIioK9WmFj+lOzJb3Xy57xV3Kj+e4D3Z3ocRa5YmlZnoOQEQ==
X-Google-Smtp-Source: AGHT+IHUyL3JZBiKaHL1hLSTeQrgywlLwwEUN5of1N0Gy8TC0X3IRTq509SX5+fcaAZt7Xsc6jRvwQ==
X-Received: by 2002:a17:902:d48f:b0:220:fb23:48df with SMTP id
 d9443c01a7336-225dd8ed442mr5472005ad.36.1741890673680; 
 Thu, 13 Mar 2025 11:31:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3011926599csm4185647a91.35.2025.03.13.11.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 11:31:13 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:31:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Maxime Ripard <mripard@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-ID: <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-abiding-vivid-robin-159dfa@houat>
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

On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
> > 
> > Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
> > very noisy tests much easier to deal with.
> 
> And for the record, we're also affected by this in DRM and would very
> much like to get it merged in one shape or another.
> 

I was unable to get maintainers of major architectures interested enough
to provide feedback, and did not see a path forward. Maybe Alessandro
has more success than me.

Guenter
