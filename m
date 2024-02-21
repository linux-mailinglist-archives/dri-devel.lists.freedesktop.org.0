Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D9E85E984
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 22:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C17610E809;
	Wed, 21 Feb 2024 21:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0fzx84EN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05B010E809
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 21:07:03 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-36517cfd690so3085275ab.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 13:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708549623; x=1709154423;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AAAZa1jDC6WKP3dR2NzQXLtAyykABKSP5MJcfQiYXKs=;
 b=0fzx84EN1wI7bYOeCYpWkyhupj5YfOuRG8Kr4t0JSJRyaBTYEH+KITJ22ANgVqomGi
 9JAAOUFs66rFBvqxLpYurMG8M1DE+v/nk58EZpuzXW6XEmfCfksfO0k7tNuu8IbhNaFx
 fiBGaxsDIAW9HNDLMoPrWv0DOOHILrvRC0xtu3QoclPiB/tcC36M275z0cu3Ou4oWPE8
 W2saZOf9vDFEYTFw7aO4tkNXtB5ezpLrW0MGtAjbAc66mlv/zPQxyMJks02HhXsutHJD
 isLEQI90ZR0Ak8x5eEu6DH0fG01s1Y5TqhHAK8rtkq2cpa4oyC2IRK51OISRii2GCsCZ
 fOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708549623; x=1709154423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAAZa1jDC6WKP3dR2NzQXLtAyykABKSP5MJcfQiYXKs=;
 b=Dcov2PD/3KHG07KgYwcNPa4G+U2+ZmXkCeVQgJiyThpymxSG53NPUjireVBbgXqbC8
 gONS3PH50V7fkDoYLkkcO92mPXdjDTEBYceRy/tjtoa0XLThhJ331MCFbyvnMXG0Dp8O
 hh4rkANFwSuybkrxC2GE2HpzpvORd2p4nTo+urTvKM8hVJpOfer9HMBH/0dIkkbHxMH7
 jEjbtq71zMl+ndBB5m/1n34tsyNnuc/VDoYCXET7oKUgezemMQ9QUI+4TtrgiOHWy6Nf
 m2z3Y8gHXIYimldU2V+x1GjiHUEWl69sgJYW7ixi7M81zoxI4mF+1t77hBZ8OapIMC10
 hZQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW07GnlOgJ82PVR69lalLS3NtkX8aKZynsldCvkPtetnyqSXpvpVVVkhlnz6QN1wCKkMZVpPQNfDt4HW+KuwfnSMt8PzrwBpNHVhIlyk/53
X-Gm-Message-State: AOJu0YwTlEYWAfhukdRMIjFaqF9erAexlJzzE+662Y8+X8LMChkhNebL
 oWGt0tMSmedkdoHDI+R1eaXtJAO5vAPW18jWwiEF7+vuPpPUIf97D24H55dGOw==
X-Google-Smtp-Source: AGHT+IGat+ZOlE3TaiF7TUr34C9oDGm5EHv4BN9HXA/+oFvVMsLjUVwjzy0AX0VUmgXwUPrLBRg1OQ==
X-Received: by 2002:a92:d790:0:b0:365:4aa1:8bd5 with SMTP id
 d16-20020a92d790000000b003654aa18bd5mr5504674iln.5.1708549622918; 
 Wed, 21 Feb 2024 13:07:02 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com.
 [34.123.74.161]) by smtp.gmail.com with ESMTPSA id
 bd6-20020a056e02300600b00363807d5c4esm2799990ilb.13.2024.02.21.13.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 13:07:02 -0800 (PST)
Date: Wed, 21 Feb 2024 21:06:59 +0000
From: Justin Stitt <justinstitt@google.com>
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
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
Subject: Re: [PATCH 5/9] rtc: test: Fix invalid format specifier.
Message-ID: <20240221210659.4p6cq4lhmoz3eaqj@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-6-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-6-davidgow@google.com>
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

Hi,

On Wed, Feb 21, 2024 at 05:27:18PM +0800, David Gow wrote:
> 'days' is a s64 (from div_s64), and so should use a %lld specifier.
>
> This was found by extending KUnit's assertion macros to use gcc's
> __printf attribute.
>
> Fixes: 1d1bb12a8b18 ("rtc: Improve performance of rtc_time64_to_tm(). Add tests.")
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/rtc/lib_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
> index d5caf36c56cd..225c859d6da5 100644
> --- a/drivers/rtc/lib_test.c
> +++ b/drivers/rtc/lib_test.c
> @@ -54,7 +54,7 @@ static void rtc_time64_to_tm_test_date_range(struct kunit *test)
>
>  		days = div_s64(secs, 86400);
>
> -		#define FAIL_MSG "%d/%02d/%02d (%2d) : %ld", \
> +		#define FAIL_MSG "%d/%02d/%02d (%2d) : %lld", \
>  			year, month, mday, yday, days
>
>  		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin
