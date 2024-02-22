Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD185FB17
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 15:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811DE10E954;
	Thu, 22 Feb 2024 14:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NUDrKeKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8E610E957
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 14:23:25 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7bf3283c18dso128575739f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 06:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1708611804; x=1709216604;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VHaXxIxgBTJmgtue73WVl6b/Cy0dVFZjoWVjGUpCh3I=;
 b=NUDrKeKwDTb6fsLfB/In7waE71cvUdiK4V+ebUxa3voHio6s6+T85cxmo2g5yC0Pj7
 XyYzB3Q/YvndieKszi+ab7+X8kP4L20tWSzd/FoKRMbIt0SIhS1VaX5sKyqT8msZihMr
 dkUfNcvELHMmkTG8ydRyRuzIEtjPkaR/IJ2SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708611804; x=1709216604;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VHaXxIxgBTJmgtue73WVl6b/Cy0dVFZjoWVjGUpCh3I=;
 b=QwcK/d8KsglIui8Cambwt63Of/fBiBWFSx3gzlRCeMDRwHMTN6F5XqaaonoUNR0jGH
 SKYEt+yJCsB3ebxdMfhBIh7A4bzEFdGydJXU4YhplXK6uNkjh4qXiyKtutOhgSGXIAKi
 /5RbmDUKEEVpAqWCUf73WW+dNU18JYJDzeUV2+NG03G2KqqgF726xrCK7QbV7/rhOreM
 n4jRKwQlZJ04XEVK7SRtx7qFggXckynB1YOz613eCbdTEU9TijNlJp1w0TKpgCxdTVqf
 5G74DrwLVAuaMz2bSlXkc8gQhgWKPyugtOOnBR/M7pHtzVLGojf9I0q4ebyfRhHoY4NX
 /A7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGo4vSnvRDUNFcwO3K9F6XPzVgJc5/jR3fMiyJxN1MnZAlt0tHqqC4pQxOrB27hdOWIBuzYSN5P4jqf4brVe7Y7QbDEnFoG5+tU6NmEPbW
X-Gm-Message-State: AOJu0Yzk87wKcnVWH+jcGIPfLljA1XW6R9lCvhiA0CI+MB5bmbP492pv
 mvMp65uYt7a8HGEMON8F73nEYE8BWmxt0hIOUIUKjyK0dzte1KduaYWuZ9ICy1s=
X-Google-Smtp-Source: AGHT+IFae9GfHftZi8zK41FezlChjHIL0jhjWV8Bs/s6McEy9uQqRVDUnPsC8m/z1HG2Wc+9hRWIVA==
X-Received: by 2002:a5e:970a:0:b0:7c4:9ed9:8e7c with SMTP id
 w10-20020a5e970a000000b007c49ed98e7cmr17459202ioj.0.1708611804205; 
 Thu, 22 Feb 2024 06:23:24 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a5ed60e000000b007c75a3c0184sm1834078iom.9.2024.02.22.06.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 06:23:23 -0800 (PST)
Message-ID: <d0c81ab8-b404-4710-9b27-71aede157b3b@linuxfoundation.org>
Date: Thu, 22 Feb 2024 07:23:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] kunit: Fix printf format specifier issues in KUnit
 assertions
To: David Gow <davidgow@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240221092728.1281499-1-davidgow@google.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2/21/24 02:27, David Gow wrote:
> KUnit has several macros which accept a log message, which can contain
> printf format specifiers. Some of these (the explicit log macros)
> already use the __printf() gcc attribute to ensure the format specifiers
> are valid, but those which could fail the test, and hence used
> __kunit_do_failed_assertion() behind the scenes, did not.
> 
> These include:
> - KUNIT_EXPECT_*_MSG()
> - KUNIT_ASSERT_*_MSG()
> - KUNIT_FAIL()
> 
> This series adds the __printf() attribute, and fixes all of the issues
> uncovered. (Or, at least, all of those I could find with an x86_64
> allyesconfig, and the default KUnit config on a number of other
> architectures. Please test!)
> 
> The issues in question basically take the following forms:
> - int / long / long long confusion: typically a type being updated, but
>    the format string not.
> - Use of integer format specifiers (%d/%u/%li/etc) for types like size_t
>    or pointer differences (technically ptrdiff_t), which would only work
>    on some architectures.
> - Use of integer format specifiers in combination with PTR_ERR(), where
>    %pe would make more sense.
> - Use of empty messages which, whilst technically not incorrect, are not
>    useful and trigger a gcc warning.
> 
> We'd like to get these (or equivalent) in for 6.9 if possible, so please
> do take a look if possible.
> 
> Thanks,
> -- David
> 
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/linux-kselftest/CAHk-=wgJMOquDO5f8ShH1f4rzZwzApNVCw643m5-Yj+BfsFstA@mail.gmail.com/
> 
>

Thank you for a quick response David. I will apply the series to
kunit next for Linux 6.9 as soon as the reviews are complete.

thanks,
-- Shuah

