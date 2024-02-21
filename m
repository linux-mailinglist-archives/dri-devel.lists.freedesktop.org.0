Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB185E97B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 22:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2185C10E437;
	Wed, 21 Feb 2024 21:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MKVGtHkS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B68110E437
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 21:06:32 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7bb5fda069bso372692439f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 13:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708549591; x=1709154391;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XxARLNt21W5VmobeBOcLL0WanHWe98+J1gabaOyO2/o=;
 b=MKVGtHkSXBwcxnKFeZvnpGeVGfC0j8165+i6dg1XnyU6ziORV6m3dPyLzo/LbVds8z
 e5SPGYL+hyiXrm9DbS6JXdvl3n7xKqExz1MRv4T95IaDWHaE8wfphdieumvVVAxWMvvb
 RKXTqT0lcVsvaHw29LSPy+QSXoE1NJ5rP3k6i1ceYUn6QE2PPYTD8JiXfnuIENa4kmoW
 RBeYr37SkWIW42i7m0pKq3c5RedcBNVHNIyvosM8saSkbYzSoYkfdCviIyGke4KsTkqg
 5b/TMrcncsYAdxNgJpreTrbP/sG3Xkg3Y6HcfeyBZkQHziHPEwZEC6d8HYqiUyzWX4wR
 WfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708549591; x=1709154391;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxARLNt21W5VmobeBOcLL0WanHWe98+J1gabaOyO2/o=;
 b=hzCPP8fouICZwDItA5lz04SspKbuknaBFxBAuwkqUAzOXMNmYzK8QTgYITBU/Ax6oZ
 MTNa9BT0caeedktmZqhRYCNjEJWsJExirLf+jTnqIzrATJiAs9DywSQP/4I1H8BSe93u
 NYE+qhD+q3159ixtC7E3D5R82B8DQsEtyUzX1oH0mgI1VinM1bvs4Sv6MIlWO9mes6kn
 XizHcYPfo9MCXzLTFWu5C2Va+dHPh+h29Oluzba/hHLe3+Mfn804hapKZdgMiDsMzCSc
 1iDOeXlKJHyxMuv44R4mK71fWK2D7QcBjV29ZQsHPjwaRfVOcbswEFHAlTzniUakGen4
 hfHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTw9ZHf2VV6CV7zY5x/E3JW/QcOZMqML0NOp9eZY/Sl1LBQHZO0gzfjeQxWAsiVvCihGXSqFJoTZjTislaiSvAOA46mStmu+8p3kloFkx7
X-Gm-Message-State: AOJu0YyhTcv6dPfv4jLPk1Els5P55CSEPdQbI5tjvQGNTiHcIoI9CPgx
 LscXmFzNtQyy84l+tUGQX0JujzsBr2t5FPeq/oI4DNIgLuCXjtLCzUASNdPT5w==
X-Google-Smtp-Source: AGHT+IHqbTAIdmbfdrW7leotGJWoTRmx3P/Ksrvh7bnDyBM1dx8JyMMMiikIoom0nj0o+fE8Ko+j0A==
X-Received: by 2002:a5d:894e:0:b0:7c3:f542:66d8 with SMTP id
 b14-20020a5d894e000000b007c3f54266d8mr21472703iot.1.1708549591657; 
 Wed, 21 Feb 2024 13:06:31 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com.
 [34.123.74.161]) by smtp.gmail.com with ESMTPSA id
 fv5-20020a05663866c500b004741f7683ebsm2272779jab.154.2024.02.21.13.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 13:06:30 -0800 (PST)
Date: Wed, 21 Feb 2024 21:06:28 +0000
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
Subject: Re: [PATCH 4/9] time: test: Fix incorrect format specifier
Message-ID: <20240221210628.vshmqtyeecemin4k@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-5-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-5-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:17PM +0800, David Gow wrote:
> 'days' is a s64 (from div_s64), and so should use a %lld specifier.
>
> This was found by extending KUnit's assertion macros to use gcc's
> __printf attribute.
>
> Fixes: 276010551664 ("time: Improve performance of time64_to_tm()")
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  kernel/time/time_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
> index ca058c8af6ba..3e5d422dd15c 100644
> --- a/kernel/time/time_test.c
> +++ b/kernel/time/time_test.c
> @@ -73,7 +73,7 @@ static void time64_to_tm_test_date_range(struct kunit *test)
>
>  		days = div_s64(secs, 86400);
>
> -		#define FAIL_MSG "%05ld/%02d/%02d (%2d) : %ld", \
> +		#define FAIL_MSG "%05ld/%02d/%02d (%2d) : %lld", \
>  			year, month, mdday, yday, days
>
>  		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin
