Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EA185D9F7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DCC10E731;
	Wed, 21 Feb 2024 13:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kH88Vjjf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B1B10E738;
 Wed, 21 Feb 2024 13:25:40 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1d934c8f8f7so62134785ad.2; 
 Wed, 21 Feb 2024 05:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708521939; x=1709126739; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=yZxuMWu2/GCsqoFcXfd08+HFIieM/pOcLCTfMALNvWA=;
 b=kH88Vjjff/long6OPlfL8vC0vGlDE62WHpKEalt3qn+yLN/JMomCMff9x4VAz1EGx0
 ud8dZ/ryLOf6UbU/+OXNNS/nUfDGE0nXUsoObG0J4uAR2WQytBJv8HsFWZChslh0J8Ri
 PbCLr0Q2ELqovLcBuKFKGJr6ljTQc45lIIVAN/EBleC04vD1DYxdR5FjVuM6Q7i36eky
 79LaXgNXpfWBIVxZnPRlOuXTW7faMpswDA++7/3XUmDpFU70IavTXwi44293R/9kMgGk
 2SPJa3r9gG/Dy6Ypub5pNXQMSOIJyJZUgGVsztWVt/tKDcxjEmj6cKzJjV5NuiWxiYWH
 UL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708521939; x=1709126739;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZxuMWu2/GCsqoFcXfd08+HFIieM/pOcLCTfMALNvWA=;
 b=HikcJTfhyLqc6tvggNJxD5Ijho1zCb4NYX9TMFWfsKUfKuJpUlizWP12JYE0YgyQll
 7OyYXO0p5Pj72skviKuwRc/W+D929ygKcv7krBjswefKGqDxmTMEp+/nHAUzl96th2xz
 mzImUrnWLw6R9GKASY2fBdHzE+zcacPJ9AMKwFkI/sRliHDGVB9cJLHillgnfApDpUo/
 W7bY5LmK67Mx7F/+z+v6YANnhrD5ZyFMAwpmKqM2RH94o9K0VpCpp8sa1bS5D2Bgkw0U
 Mdki91Bd3GMSgY+sDjO71yomz4LrxTS0VkvvBY6Z8n0ocn9mbfKY+3C4f97gBl+4zY82
 5RBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt75Usunh/+tWcxEL7AXv32Sbmdqr3c57Hp4cKRAoCLopz+KGMau4IEe24BfsKgJm/atectGAMkCCuQyJZn1UkJGCrqlU2aN2DH/Vd7juNfAigzKW6CJELh683uqXyXCih3iX+m+7VJU26Sn3sUt8=
X-Gm-Message-State: AOJu0YxeuJyBSbv21Ik1S91inD8bgykHN98iJpJr30X9wKIySLCbO5mp
 xhKk2vNplTjqXZBfIwOuAanRoiG3uinkKAIRZRwJmE4AyaJOoDmV
X-Google-Smtp-Source: AGHT+IHE8MqzS815nj3h4xuequzwAdutHfnuMXuo6Qtl+GLoGzFlWgjvix1ObOiIVpalQCVk74nh2w==
X-Received: by 2002:a17:903:40cd:b0:1dc:24f8:61b7 with SMTP id
 t13-20020a17090340cd00b001dc24f861b7mr4170590pld.67.1708521939524; 
 Wed, 21 Feb 2024 05:25:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 iw11-20020a170903044b00b001db5e807cd2sm8020061plb.82.2024.02.21.05.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 05:25:39 -0800 (PST)
Date: Wed, 21 Feb 2024 05:25:38 -0800
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
Subject: Re: [PATCH 2/9] lib/cmdline: Fix an invalid format specifier in an
 assertion msg
Message-ID: <293a2156-6e0e-4e80-b31e-5d553e63b707@roeck-us.net>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-3-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-3-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:15PM +0800, David Gow wrote:
> The correct format specifier for p - n (both p and n are pointers) is
> %td, as the type should be ptrdiff_t.
> 
> This was discovered by annotating KUnit assertion macros with gcc's
> printf specifier, but note that gcc incorrectly suggested a %d or %ld
> specifier (depending on the pointer size of the architecture being
> built).
> 
> Fixes: 0ea09083116d ("lib/cmdline: Allow get_options() to take 0 to validate the input")
> Signed-off-by: David Gow <davidgow@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  lib/cmdline_kunit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/cmdline_kunit.c b/lib/cmdline_kunit.c
> index d4572dbc9145..705b82736be0 100644
> --- a/lib/cmdline_kunit.c
> +++ b/lib/cmdline_kunit.c
> @@ -124,7 +124,7 @@ static void cmdline_do_one_range_test(struct kunit *test, const char *in,
>  			    n, e[0], r[0]);
>  
>  	p = memchr_inv(&r[1], 0, sizeof(r) - sizeof(r[0]));
> -	KUNIT_EXPECT_PTR_EQ_MSG(test, p, NULL, "in test %u at %u out of bound", n, p - r);
> +	KUNIT_EXPECT_PTR_EQ_MSG(test, p, NULL, "in test %u at %td out of bound", n, p - r);
>  }
>  
>  static void cmdline_test_range(struct kunit *test)
> -- 
> 2.44.0.rc0.258.g7320e95886-goog
> 
