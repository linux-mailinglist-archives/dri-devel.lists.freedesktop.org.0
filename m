Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399B9CCEB83
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C75F10EE32;
	Fri, 19 Dec 2025 07:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iVmesgik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C05110EE2F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 07:08:21 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso5598315e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 23:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766128099; x=1766732899; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NAJFCYxG6tBk/5BjvMlMhhFWKmM1Im0nbCMAsTTFzMc=;
 b=iVmesgikdciw1HmWPbLuFfXhwvIdvonTltp0Mzv6Byf0zehc2qCodOgQNNJ8HPFejW
 FF/rNoOvG/T/ERuDpmtBTfI/RXznmfEes0nIwAYS9y7pc0fEHyqAfBZ3WAi/8GMlUOe0
 sj7VQMudo9KYmCZHyO0OqVNcGRw5rb7Wv2pw1jkZT+nAKTZzAt4dlYBcOUGWFhtmlIkW
 cOJoPSmAXG69jAebBlieOvtbrkXPBIv3ZrBZhYjItM9fC1ySYorMssVkyrewCBxFT2TA
 D4r86r8NM7FU5TLDSaIICnjI0gjjqlBLxj46e3ikoWFkYUlJ6tvUwXdIlRmWloyjwn4V
 QRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766128099; x=1766732899;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NAJFCYxG6tBk/5BjvMlMhhFWKmM1Im0nbCMAsTTFzMc=;
 b=onWAvSiKg+dUZTu4W9LCJ0m/yVsGhHY8gMgPugsxy0BtfmeHJZ3Z0AvmZCegW1erRr
 RMewwSHyFtdjdqOLnQqIiJ3UfKG6JB0ZWoQKuD+5tFkO9JOgXkqBykuNbPHciKZnIxn0
 r45pEZw/T0QxqywF39OLT+xtU1YAFFjFQXVuly5VEd7WTfpF6hfiyWZDqQON/5K3Hgxh
 loriodv5Lb2idB+N3mNTXdspZLXcpyMJjCZsT4E9ifqCnrbkizxagR4yiYbC+dlm1AMc
 bD5EcvBYQZ41Sw5KjLauHKEV35aXx6s7N4IG4m4c0Lu2ToMvWXvBuO7tLR5uR5PatqM6
 UiJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQhJUfehbiaB2me6pM/L7vp0UNz+/JmKeKAzdBCim959JrkvO1XLoI1PRFsgsUDe4HtzOIqJ55FFs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6y7oLTKC/3/fhegcB1GDpFAFqocIqc15FrzEoylGcFGdzuwG0
 ywlrUr7W9RPAsyw3SoFWpYsVP3W17sXPNVZ31hiXgPXmUKGrgYv3xLdcUzrscsAJ/cw=
X-Gm-Gg: AY/fxX51aGxeY+XcBi2qCKXbinIBFFOrripGcwLoH3yMogxnc2sZMVaPvnmkk0SiK+A
 vuA9WMpag0IFaaAjWV8QYYj7jiLEY0g+akqIx4ofXhWkEsGx1r6VZJu4FUKluC+9xVianLGQJPI
 ZEYotzRjvSGOFBoJLYVn13UL15+lShnycj6WI2b6Z3o4VCLs9VyEMWeTAR8bM+XupaFvBWALu8u
 7hhflgJRsG8S560Mr1qvBaYJafrvVZk3Zx3HRloDNAF1BXCLMWzEmBlRhIQNudTSyrmAGWjyyRo
 kyfs2aICyF2aYntgcGTxMNK/WQIpjgpf6+XuYJ/+iL0hh+SFZt8NJJBeVIEuPOrBREcaqqxAAi5
 fQiePseJyCsw3cYzG8Al6uUIoxcJraP4hSBeR0wtpsE60m3pE0yrPWKFHcvRQNzv6MSScOfatGq
 rmEyGn+PvjgMEew0rQ
X-Google-Smtp-Source: AGHT+IE7nLrq263HAsObO9ho2ijSSwzHrCJiIV0bJrGj7M+qZEd9hC4pZGfJYlq78GqHGGWD40y0tA==
X-Received: by 2002:a05:600c:5251:b0:477:8a29:582c with SMTP id
 5b1f17b1804b1-47d195a425bmr13555325e9.34.1766128099504; 
 Thu, 18 Dec 2025 23:08:19 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be27b749esm81591275e9.14.2025.12.18.23.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 23:08:19 -0800 (PST)
Date: Fri, 19 Dec 2025 10:08:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Vincent Mailhol <mailhol@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <aUT54I0fD0aqBVyw@stanley.mountain>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218202644.0bd24aa8@pumpkin>
 <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
 <20251218220651.5cdde06f@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218220651.5cdde06f@pumpkin>
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

On Thu, Dec 18, 2025 at 10:06:51PM +0000, David Laight wrote:
> On Fri, 19 Dec 2025 08:34:05 +1200
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > On Fri, 19 Dec 2025 at 08:26, David Laight <david.laight.linux@gmail.com> wrote:
> > >
> > > One possibility is to conditionally add _Pragma()  
> > 
> > No. That compiler warning is pure and utter garbage. I have pointed it
> > out fopr *years*, and compiler people don't get it.
> > 
> > So that warning just needs to die. It's shit. It's wrong.
> 
> True - especially for code like:
> 	if (x < 0 || x > limit)
> 		return ...
> where the code is correct even with 'accidental' conversion of a
> negative signed value to a large unsigned one.
> 
> clang seems to have a dozen similar warnings, all of which are a PITA
> for kernel code - like rejecting !(4 << 16).

In this example is 4 a literal or do we at least know that 4 is
non-zero?

I really thought I had a check for that in Smatch but I guess I
don't...

regards,
dan carpenter

