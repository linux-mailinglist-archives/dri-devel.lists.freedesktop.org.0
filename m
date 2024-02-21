Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED0A85E8A7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 21:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DAF10E7D0;
	Wed, 21 Feb 2024 20:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="rHwkiBOm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2850D10E7D0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 20:02:12 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7c7674446c0so45193039f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 12:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708545731; x=1709150531;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hW/eD+217SwbFSrd+7OlcqgqqQaX2xcDsJgsLrnW3ms=;
 b=rHwkiBOm9IqPFna+mTfLShXLJ1T1b/BoVvF2N+5Z6vglGkrwugmv+oIQbwPNv587YT
 qI1DiNdeZgsFZbcro3ciC710R8kAMmwY/VWEwy5o3mjuSQI3R4tZg7pm6Ojb7mnzGMX5
 ztwTUepI5rLP2DvfyThVzgsBR7CWgIfkgztBJI+2g+DJVb39BNlee5XdWjLsEcHztSf9
 fn8NxiTq5Oi9+Z2xhmiKDD3yphfwHL22MEB+opH1CpQYddFZO73MDK3yhBdsE1cUd5b8
 4LSrl5k5EMmVp8iXvHxCzhm//O4J6F+SI2LPjkbcyZyEeRlqSM8c+trrX9R6gbxJBCMh
 h4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708545731; x=1709150531;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hW/eD+217SwbFSrd+7OlcqgqqQaX2xcDsJgsLrnW3ms=;
 b=tVSHCpUnqTF9lPK/6wk9jR0X7ZvjgW/Fqkxj3XqZUxsBdfRRYeQcEjXJ58EG2NraYY
 sfKaX7AdSIonB0/FoPxtzltlPNCL5HXiLzjq8SBT5EFoFVASNkaviNwVf2HIjvR4BXAQ
 JIAUpX9ZFS0h4TjQAjK9SdPrq/bCxRm1oT8kJh/cQ91Z20LmMqPxHby5DQumW1V5tffp
 lVfl/QEHYGErnA+LR8oZq4P2EQegATCrdzaV2SSQc39x0Hf9RSDQXDhMsFQHwdCTJnr/
 g5OYvFIZrvWg7JgPvB4SYb4aoz3nFJBnOdhTl5j83/um5JFoIUNGDCUnQFRgvVS0zUPu
 Ev0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBdG8x8pRBI+IvCXZPhpRj7UUZl0jYoeIATr1YSXLffAQzIfUFrmPV7kvoxAhfyJEJdqSENYJ59s5nSJIaGWuh9H0OHxktCbW6d8EL23T/
X-Gm-Message-State: AOJu0YzEYm5DfFzRW2gy8bTaeOsFCKyqV54LPEzxV7nhr9F1iArZjg1T
 94DsjyVps61CwQ3FetdmRNa8v6ORmggaVQ37EMAoSp1AaFaTjnh3dWeVk5TtvQ==
X-Google-Smtp-Source: AGHT+IG39BbcKPU1il8vkTs2a8eXqdOP0Ld0XjhZHI7TKaGTsFOA7fu8B9CXr669y5rm4dsiJ0Wmbg==
X-Received: by 2002:a5d:929a:0:b0:7c7:4d7e:de87 with SMTP id
 s26-20020a5d929a000000b007c74d7ede87mr10763875iom.1.1708545731187; 
 Wed, 21 Feb 2024 12:02:11 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com.
 [34.123.74.161]) by smtp.gmail.com with ESMTPSA id
 fv5-20020a05663866c500b004741f7683ebsm2243287jab.154.2024.02.21.12.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 12:02:10 -0800 (PST)
Date: Wed, 21 Feb 2024 20:02:04 +0000
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
Subject: Re: [PATCH 9/9] kunit: Annotate _MSG assertion variants with gnu
 printf specifiers
Message-ID: <20240221200204.frzov7n5bxb4cekd@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-10-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-10-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:22PM +0800, David Gow wrote:
> KUnit's assertion macros have variants which accept a printf format
> string, to allow tests to specify a more detailed message on failure.
> These (and the related KUNIT_FAIL() macro) ultimately wrap the
> __kunit_do_failed_assertion() function, which accepted a printf format
> specifier, but did not have the __printf attribute, so gcc couldn't warn
> on incorrect agruments.
>
> It turns out there were quite a few tests with such incorrect arguments.
>
> Add the __printf() specifier now that we've fixed these errors, to
> prevent them from recurring.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  include/kunit/test.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index fcb4a4940ace..61637ef32302 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -579,12 +579,12 @@ void __printf(2, 3) kunit_log_append(struct string_stream *log, const char *fmt,
>
>  void __noreturn __kunit_abort(struct kunit *test);
>
> -void __kunit_do_failed_assertion(struct kunit *test,
> -			       const struct kunit_loc *loc,
> -			       enum kunit_assert_type type,
> -			       const struct kunit_assert *assert,
> -			       assert_format_t assert_format,
> -			       const char *fmt, ...);
> +void __printf(6, 7) __kunit_do_failed_assertion(struct kunit *test,
> +						const struct kunit_loc *loc,
> +						enum kunit_assert_type type,
> +						const struct kunit_assert *assert,
> +						assert_format_t assert_format,
> +						const char *fmt, ...);
>
>  #define _KUNIT_FAILED(test, assert_type, assert_class, assert_format, INITIALIZER, fmt, ...) do { \
>  	static const struct kunit_loc __loc = KUNIT_CURRENT_LOC;	       \
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin
