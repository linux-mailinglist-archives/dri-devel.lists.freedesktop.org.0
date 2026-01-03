Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B219BCF030B
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 18:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF6F10E2F4;
	Sat,  3 Jan 2026 17:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cZ5JJ8xj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4349110E2F4
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 17:01:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so8591142f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jan 2026 09:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767459709; x=1768064509; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yHSQMnJBQHG3fEabcx1jHr7yPb3RERixhfZ5sKkWzqY=;
 b=cZ5JJ8xjbxHxA4zrjzUsYyzri/p+YDUSwlmYInU4zcBRc4IFIrLHCNctyatvLnFzs0
 15FIdCmiX9IcGmcG9P7FmZ30oQErISPgu4toDed3oFRMH5PrnyPFcTCAQRVTVcgs+O0+
 RrpLpXjErV3S7+eKc0Rd+kTKFxsND7rT8FygJPVj3glyTjlWDcaECP2qtsjnw9hMlHi1
 LK5TaW6B2UP4LB7N4TZRvhZfd96dIcLpkVws0Sjn+W/551ah4HWnP/9OEQxoSTWF/7y8
 JDnJsjqQidF5kMHfMeRKFSpD9nsKU24rxP9ZwpioWv9KfHYB1vhrzrgM8Ih82ZFJmIxZ
 6bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767459709; x=1768064509;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yHSQMnJBQHG3fEabcx1jHr7yPb3RERixhfZ5sKkWzqY=;
 b=elGzwxHJSI9xTcIskpuWM07Q9pwSKQqmt5vksWFHfwr+2HFL1v0keK4lWP/v//5qb2
 cEilpiTpMrYhp0shOHzWizS1+4r975YwuG1NAL7iowI7vpoaS8WSgYd7ysHOaaxU1aOv
 x9iOrztwj8SmD1AWq0XnTrAiGRJBlnYvJlwkGv4Ma6aLfBPLMtvpFrTCaITVCJSpg51Y
 t29n2OdNHjysq3w3wEhtW0GxyRvTLTtFfpkI7Ef2zq6eO6HYs+b3WhmkbDAtTWG/txRi
 0T3bP0IFIJnbITZxbb6HpXrutQzLZSEGJbsk+N/KTE0NXuIS/u8I0z6D6HHF9Ugf2NnV
 u+Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ+jGhZHl3hiYXrlnIFMrlaAwUBeet//VqvAfXE50/Y2fpKHcFvSZ50dW30/bB49KMjfwc2FdNMdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5068kbvOw/qRLug3ICxdDYioNOz63iH8cjuQGEKi83mRcpZXz
 aiSFD+Qy/Zvf04/QGqbpXu8u/03wys9snVYDwYV0/ohibhPNoROtoqhSwxTP9CnEjjw=
X-Gm-Gg: AY/fxX40gyJ4p1tDHPQP48UTNHyH8rq/KQfg9ExMlx/lk00OpQma+zKuO72omuPnpVl
 Cor2Zi2m+7tvVCVGWajSCPdI9TZgP3jR8ZRZKpmmmoCo5auYzCpLrj6/KOh7Qs9SC6V1GH82qyv
 IGhHZQjdGoGGV7AfXTMUVc3KZTZ6LWdHvHV9SmArqXzPy3QT4GSMkRMwVyaXKN/Y2/QtzWrEDdZ
 wyJmEKHifFVDJKr2LdNH+AnUCZ9IPVRvunNun/NFSp1i2YrBruX1zCN2P5ZF0LnZp/KO+GcTHpc
 Dtml8LZu6uR8p3AYhhBnnttP33e+UsxOe9mS3xEftEm04hJ8MCcOFnO0JT7m7sJ5htpKN+CJdaD
 ZxJ7MEL0TUTnyzRc/F6dZUoD6Ja0f2PxCGHJpOsMoUaySreQ+0H0V7GxU1bByn4d/6OVnlMbhdv
 U3lggtWV4qtL+n356q
X-Google-Smtp-Source: AGHT+IH76r9upX5LgpHZ/fOST6gsEDX5p5oGk436/qE1kT4SAaRLVvV1SuOGoIs6C86iZ8FylfCo5w==
X-Received: by 2002:a05:6000:2c0f:b0:431:54c:6f0 with SMTP id
 ffacd0b85a97d-4324e4c739emr61327273f8f.4.1767459708384; 
 Sat, 03 Jan 2026 09:01:48 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4325b6bfe88sm82459187f8f.19.2026.01.03.08.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 09:01:47 -0800 (PST)
Date: Sat, 3 Jan 2026 19:56:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] overflow: Update is_non_negative() and is_negative()
 comment
Message-ID: <aVlKTculhgJzuZJy@stanley.mountain>
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org>
 <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
 <CANiq72=jRT+6+2PBgshsK-TpxPiRK70H-+3D6sYaN-fdfC83qw@mail.gmail.com>
 <b549e430-5623-4c60-acb1-4b5e095ae870@kernel.org>
 <b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org>
 <903ba91b-f052-4b1c-827d-6292965026c5@moroto.mountain>
 <c84557e6-aa92-42e9-8768-e246676ec1e9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c84557e6-aa92-42e9-8768-e246676ec1e9@kernel.org>
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

On Sat, Jan 03, 2026 at 12:10:45PM +0100, Vincent Mailhol wrote:
> On 03/01/2026 at 11:02, Dan Carpenter wrote:
> > Thanks Randy, for sending this to me.  I'm on the sparse list, but
> > I've been on vacation and haven't caught up with my email. 
> 
> Welcome back, hope you enjoyed your holidays!
> 
> >I can easily silence this in Smatch.
> 
> Thanks. I ran this locally, I can confirm that this silences the
> warning. So:
> 
> Tested-by: Vincent Mailhol <mailhol@kernel.org>
> 
> > diff --git a/check_unsigned_lt_zero.c b/check_unsigned_lt_zero.c
> > index bfeb3261f91d..ac3e650704ce 100644
> > --- a/check_unsigned_lt_zero.c
> > +++ b/check_unsigned_lt_zero.c
> > @@ -105,7 +105,8 @@ static bool is_allowed_zero(struct expression *expr)
> >  	    strcmp(macro, "STRTO_H") == 0 ||
> >  	    strcmp(macro, "SUB_EXTEND_USTAT") == 0 ||
> >  	    strcmp(macro, "TEST_CASTABLE_TO_TYPE_VAR") == 0 ||
> > -	    strcmp(macro, "TEST_ONE_SHIFT") == 0)
> > +	    strcmp(macro, "TEST_ONE_SHIFT") == 0 ||
> > +	    strcmp(macro, "check_shl_overflow") == 0)
> 
> But, for the long term, wouldn't it better to just ignore all the code
> coming from macro extensions instead of maintaining this allow-list?
> 

Of course, that idea occured to me, but so far the allow list is not
very burdensome to maintain.  I maybe should disable it for all
macros unless the --spammy option is used...

regards,
dan carpenter

