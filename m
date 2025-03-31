Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D776A760DF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 10:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EDE10E397;
	Mon, 31 Mar 2025 08:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AYXLLYi/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5D610E397
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 08:06:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso26222215e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 01:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743408377; x=1744013177; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dem/AHZR7qF3cH79b+8VdRbhMuCiw79+oYYuDn1nDoI=;
 b=AYXLLYi/LYVU4ua3TAEsa75k+h3+SHn/zYqG7VmNH5JWoTqfcJJAwC6XPXOXNFXiJf
 g3YXU3Hg5eIHm09qlyZ5gZ3bRw2YF80BZqjJA8904F2s+coOJ3WW/HaXydzB1ND8BvR3
 SkmMPTfQ1KTp4tV6ubf9GFXhsg6OslYnVfncb8b1Sqw9D0ASiyYEJ3h5bEEv44hfE1r/
 c6xhQLHVuQKzDDinrDskRdlK6fuzsgH5D4jBmvxJ6X/6j5gJb1hii9sT56qtOorcWflL
 KCzTO95OjYqNF+i22jIvZNqjdp5g5oL56c4pV9/ZgKpSwjAEOrZQAJo+WG0wIpGNuKXN
 LzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743408377; x=1744013177;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dem/AHZR7qF3cH79b+8VdRbhMuCiw79+oYYuDn1nDoI=;
 b=aLf2LGfcaJyvQKXSmzYUmskEKElzVmeb4sEqhMRuhtVUr1ccK5jnjjCyvo3frXUEr9
 sIcDSIVIkXxGUEPgCJzZhqE/I4eiPbWr+GmEuXIRbBc2a5RIacEKeJexC3UUHcm3BFwa
 ij/uhpwa6RyzlQIYIY2PP4UlIWdnz1IMtJ68f5ri2z6vaVP1MUG9FrttHh/1w1E/XGaz
 wQj1Mo78AcO524v867n5EpraIydqrO2YL3NU+3IFZzCvYKihvU72ntCbz7U4SXEmSoB+
 WcMYdtgZaDC1k/WcU4pjODJNjqCEht2P4+rdT3yCPS1HE45P3skrsRkRXkVRL5KvGR5d
 ropw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv6ZLEJVBDjsIPfGO6CT7egNxoz/g5NXLzH8P7hZeQr9FSQ6yv/fFwjEzXDRp0sdVAV+9f9LZ1Y0E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJv25otR6/MOddvFpPwaKpXkNHSIj/XWVtTz//4FJuwxDhYcIF
 QdMtaWOg0AkIxBeZIC6g69z92Zw5kYMI2zONX/YlacSfHXRRTZJr2C2Jm4niHwU=
X-Gm-Gg: ASbGncv0NO20sUEq8Ad3pELZ1vFAXyKOa/5bgi8Qq8CXMLLXYBU2ZShGCRmPR+qkHjH
 RnPIuJBIckepNQJskfmG6CVbxOzsVQ9WumNUOnBhbwBo11QHypiX8MxtD4bg+4qXjjeJmMd+0lQ
 sk1UyXs/hMceUXbITngPQk4n3E1KtegAwmmnbhGBiHnSUMrw9O8W3LXWG0AOUS7I+HWufBKdgAH
 D9bK7md+ds2XVFfhVWw+PhfaHAwytxl9gMOMCJldKKsJJZOSgQZ08jvnABEPmRrCq1T/W0w8Pia
 lYa8ty6CoLD1FP+HN+5CtWfBzU/Lf7/ZI/awX3t6NqoEWEVuYA==
X-Google-Smtp-Source: AGHT+IH4vJ/KqgunlkK1ej1cXacAghtjETA+BJXj8kGxSrm8d1nKUfuPzSv/zW4Kld1su7UgbTv4Jw==
X-Received: by 2002:a05:600c:4f0d:b0:43c:f597:d589 with SMTP id
 5b1f17b1804b1-43db62b5b62mr61296165e9.27.1743408376550; 
 Mon, 31 Mar 2025 01:06:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43d8fba3ef1sm117879915e9.2.2025.03.31.01.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 01:06:16 -0700 (PDT)
Date: Mon, 31 Mar 2025 11:06:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Gow <davidgow@google.com>
Cc: Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Daniel Diaz <daniel.diaz@linaro.org>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [PATCH] kunit: fixes backtrace suppression test module description
Message-ID: <8e4dcf64-898c-4334-8124-598964089f4a@stanley.mountain>
References: <20250329150529.331215-1-acarmina@redhat.com>
 <CABVgOS=s-NgS1tPOOPDstuVfTmsW9H0kP8nEQmtfFiubQeyvWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOS=s-NgS1tPOOPDstuVfTmsW9H0kP8nEQmtfFiubQeyvWw@mail.gmail.com>
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

On Sun, Mar 30, 2025 at 01:11:59PM +0800, David Gow wrote:
> On Sat, 29 Mar 2025 at 23:06, Alessandro Carminati <acarmina@redhat.com> wrote:
> >
> > Adds module description to the backtrace suppression test
> >
> > Fixes:  ("19f3496") kunit: add test cases for backtrace warning suppression
> >
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > ---
> 
> The "Fixes" tag here should be immediately before the Signed-off-by
> line, without a newline. Also, ideally the format should be something
> like:
> Fixes: d03d078df162 ("kunit: add test cases for backtrace warning suppression")
> 

Yeah.  Everyone should configure the default hash length to 12.

git config set --global core.abbrev 12

I generate my fixes tags like so:

#!/bin/bash

git log -1 --format='Fixes: %h ("%s")' $*

regards,
dan carpenter

