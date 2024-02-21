Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9071985DA0B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E4610E5FE;
	Wed, 21 Feb 2024 13:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RrHbDPN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D1B10E5FE;
 Wed, 21 Feb 2024 13:26:37 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-5dbf7b74402so5418351a12.0; 
 Wed, 21 Feb 2024 05:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708521997; x=1709126797; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=EePe0MTYXs7Z2oTEDss9GmtaBsc5eCkdw3mGJQ9X/gg=;
 b=RrHbDPN4Evl6YvS9hX5SASlD1DfUVx+5WfSSbkjDo2eFwwwwFNCKIn33srhioNBHEJ
 iBK/j+Ya4cbR86YtLrQEcHnGXsCrJgT7lVtNekGDPUBdd4Yz+T2jYvdpOpC520ZpUR60
 e15iRwJcVZ6KqZKsg5wyH0LD2kjgPj6l1xkreAtUxlPIvEDZfO6SPav4GmtUJgYygjID
 YwVGw83N9dl5hBcsdy5AahUpfpsfkitaggrvXUXgxfkkYqTRcgBG5Fm+WbsegGu7KYaO
 xRvBsnyQDn9WObaINdAmCuBb85hjTqHYRESSC6AtdH7acN6VWzr8sf18ZKBi6q3AYKnN
 PuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708521997; x=1709126797;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EePe0MTYXs7Z2oTEDss9GmtaBsc5eCkdw3mGJQ9X/gg=;
 b=ZHGt7EdyPo3ebFPF+sVQ0PkzHsKa2AXdFflK7e1exrLMlbZpioJycich8fUYbUlHvt
 Bd9JtbJYu2xufcdL484Q6tVy/OsUgDmou9VeraYgH+UJBonEbwdLe7/0CO/Zmjw7vU08
 0RqgpZtOfg/XwEKyHjG8za9y9EYgZQF7s4VCHKHXYBYFtO/OMXjotMWonT+lkZEzXVd1
 paH+zew+5VokNLfIrW/K1ndfmYbomPl1v5zpNKti9HU2kTf1E0jU/RUKRNP099mQ4Oc9
 LROf9tOp9nPNwq69tmm6g3PILmGtRkmJ3r7Wt8Xy6aWiH/VvEPpjYHKnvqe2HyNvxDvb
 /3/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0eNeXarFq373zQpCdZFkf7t1vce4hdWfqZZRnRN/NHGC3ZhI29C06TZN4Vb8yV99DExvagTgdozIvitOg+56GC53JE9RcX+dqO1L6qyRFUSNIn+7LfHYdnOQNnZ3O6QNVyf5rsCBvuo6KszUchnE=
X-Gm-Message-State: AOJu0YxxnDP2dxKbmX1F6Yuue3uSSm0R7JWYd8CxsMXvuFK6XLiRxWKJ
 0n7nIFMjDvo0feDl2dO0nSDPZOIbnfQJdHPsqGTunXHfvMX8ktym
X-Google-Smtp-Source: AGHT+IEWPD4ejqzNqPJw2zZJamfWDbGhl2UdLf9/ybf3Epci3Toaligu7BmzJbVDgqS9rDkt/1mWvw==
X-Received: by 2002:a17:90b:155:b0:299:4fba:7434 with SMTP id
 em21-20020a17090b015500b002994fba7434mr10656678pjb.0.1708521997284; 
 Wed, 21 Feb 2024 05:26:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 pf10-20020a17090b1d8a00b002992754487fsm9447776pjb.5.2024.02.21.05.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 05:26:36 -0800 (PST)
Date: Wed, 21 Feb 2024 05:26:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 8/9] drm/xe/tests: Fix printf format specifiers in
 xe_migrate test
Message-ID: <d92e819f-f2bb-4737-8e79-2c60f5740971@roeck-us.net>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-9-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-9-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:21PM +0800, David Gow wrote:
> KUNIT_FAIL() is used to fail the xe_migrate test when an error occurs.
> However, there's a mismatch in the format specifier: '%li' is used to
> log 'err', which is an 'int'.
> 
> Use '%i' instead of '%li', and for the case where we're printing an
> error pointer, just use '%pe', instead of extracting the error code
> manually with PTR_ERR(). (This also results in a nicer output when the
> error code is known.)
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: David Gow <davidgow@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index a6523df0f1d3..c347e2c29f81 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -114,21 +114,21 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>  						   region |
>  						   XE_BO_NEEDS_CPU_ACCESS);
>  	if (IS_ERR(remote)) {
> -		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %li\n",
> -			   str, PTR_ERR(remote));
> +		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %pe\n",
> +			   str, remote);
>  		return;
>  	}
>  
>  	err = xe_bo_validate(remote, NULL, false);
>  	if (err) {
> -		KUNIT_FAIL(test, "Failed to validate system bo for %s: %li\n",
> +		KUNIT_FAIL(test, "Failed to validate system bo for %s: %i\n",
>  			   str, err);
>  		goto out_unlock;
>  	}
>  
>  	err = xe_bo_vmap(remote);
>  	if (err) {
> -		KUNIT_FAIL(test, "Failed to vmap system bo for %s: %li\n",
> +		KUNIT_FAIL(test, "Failed to vmap system bo for %s: %i\n",
>  			   str, err);
>  		goto out_unlock;
>  	}
> -- 
> 2.44.0.rc0.258.g7320e95886-goog
> 
