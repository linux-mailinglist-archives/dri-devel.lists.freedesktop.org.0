Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FE4A5025C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAD1896C7;
	Wed,  5 Mar 2025 14:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IzZMGzKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7CC89453;
 Wed,  5 Mar 2025 14:38:36 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fe98d173daso11083236a91.1; 
 Wed, 05 Mar 2025 06:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741185515; x=1741790315; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bHAZgZUTDFwSbGDNSh6zOBEYSG38f9voYXlfP6pI9Oc=;
 b=IzZMGzKK4cBGDQoN7sqz1Z6iPUEbDIdA0ZtBGsxNIdCConh/7ZR43Pej1rWTaf4rpE
 f2BRlBHxhfDSJQpeUSJiBvZFUYC5X6gIwGTL4Ou0s1+MivjOD8M9nJo4y4ONCpxUxCqk
 zt8IqJdvxdW1tTjZRbdpOOMQ0T7E45Oztcvc6MloeTXgMRigXJS0pBTEQheGqJLFDuBe
 pXMItGO9pN4Msz0UvZZWBWRfR61x6uVJiRFTf0i2R3zZg1sAb7vo5o8j0AyW1RKeVCJ9
 OVf0CH0brzxQpQM2fsASvCgyNJC8v0mpp270ZJGI4ezgYFRVkP/dao7ecnWY/4dF8QaT
 NLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741185515; x=1741790315;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bHAZgZUTDFwSbGDNSh6zOBEYSG38f9voYXlfP6pI9Oc=;
 b=X/L06wfw6NKzwG8KW79rhkktNC4iqLnd2Kg+U1PQA9aRa9572w4OpV/9fEoDbv/66a
 cRMQB/qM4f56yhPuMYR7KwjEkrxeCpHs1jVlxLRBrCHQvaL/9D5ReoHNI9re1Z/TsDKn
 umlfGQcHMPm5ba0eaXi48dPe4md+8nscoETjrbnxOOjgYUfl0CcfqANWQNRr9EpYOxMz
 t3wK5RSSD35S6XZm9iONbJBjnquBbGu1h9Xl90GRZsZy8s8qgmzCsTpO9q4RDJl8SYaP
 lH3zKcV8xLKdYksFFNqBGxpwqOnyVj3uqWJHrcCjGjFQI8sZuPjnZwx6K9yzHv1FYSDS
 8v4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9B19ncAYqBCQ3WkIYCvKpu4kx3aT/dKDTx70U81YApBuoG0T4xqb5RfmyIjHWkqL+bpdZdCD9Q+Qy@lists.freedesktop.org,
 AJvYcCVOe2WlrM6axClC2RyT+eS/d5BOgowXqPHwkPFaF4yleO3LTbDmxcy7f+iGTCbQEdDHn28kymS6sWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5CDRPg6KsuSLx/0xK0B3QAE6Qr3ySazDibio1hdJeQiqIUis3
 I6lNFqYBYMElbFY0OJYvM1scV4v0Pkgez7lnGQ5IXby2scUnpCQF
X-Gm-Gg: ASbGnctsff8Za3hlVIQ9JsJKvLXVr7QDvK5mbU35IXQqgNsLyvWWDgWvboS7NR9VAn8
 iSDzr1/6++qge6DaaWuZgaT9+hLC5ltnPfYFhpxgFp7t80L29wT4nzEXV/uvzAcl8AmqCOuqO0w
 ivT3pmf5qofzEx3uEuWTdBaiiLuhYlAXUCYJyt3y2XSnlrryNZBsuyKw5wR4sstP52Abokf9FWH
 2QusTpKpK6+aPA2l+QshJDQSK3qLIZDEpzZbNerCpcAkU1WDAOHKPrm/okr2fgPmHkD29/6jEi3
 7UE+0BYdFJN6urk8619Jokit3itE6uZOazRCjywnqgSR
X-Google-Smtp-Source: AGHT+IFsZODIVTdy4Yu9YdJ48Ff3wL9QVGH26zYvwfX2f1Hy2D8uL4un//uW6Hr678bpVZApdOSPXw==
X-Received: by 2002:a05:6a21:329f:b0:1f3:3e91:fac0 with SMTP id
 adf61e73a8af0-1f3494b6b33mr5017332637.11.1741185515467; 
 Wed, 05 Mar 2025 06:38:35 -0800 (PST)
Received: from localhost ([216.228.125.131]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-aee7dec49f1sm12031704a12.58.2025.03.05.06.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 06:38:34 -0800 (PST)
Date: Wed, 5 Mar 2025 09:38:32 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: mailhol.vincent@wanadoo.fr, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 1/8] bits: fix typo 'unsigned __init128' -> 'unsigned
 __int128'
Message-ID: <Z8hh6BZgD3lmyBKp@thinkpad>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-1-1873dcdf6723@wanadoo.fr>
 <Z8hf_MNL3MeoXW5O@thinkpad> <Z8hhXHporoJ6Y39X@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8hhXHporoJ6Y39X@smile.fi.intel.com>
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

On Wed, Mar 05, 2025 at 04:36:12PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 05, 2025 at 09:30:20AM -0500, Yury Norov wrote:
> > On Wed, Mar 05, 2025 at 10:00:13PM +0900, Vincent Mailhol via B4 Relay wrote:
> > > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > > 
> > > "int" was misspelled as "init" in GENMASK_U128() comments. Fix the typo.
> > 
> > Thanks for respinning the series. I'll take this fix in bitmap-for-next, so
> > if you need v2, you'll not have to bear this thing too.
> 
> Before doing that, please read my comment first.

Already did. Yes, you're right.

Vincent, can you send the fix separately, so I'll move it in the
upcoming merge window?
