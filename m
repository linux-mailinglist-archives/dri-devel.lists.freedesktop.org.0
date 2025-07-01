Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3C4AEFC07
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 16:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A91E10E5B9;
	Tue,  1 Jul 2025 14:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FaJNqUxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4959510E5B9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 14:22:33 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-611e67c3df2so473694eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751379752; x=1751984552; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k8x0R9yhBqb5Y1VdS7ojeB/NMJonErKKyGe0msuTxWs=;
 b=FaJNqUxxMNkCq5Te1iFATr4dnTXEqUCL1OSm3mZeHn7oa3h9S26XSriPgj+Bb+F2kL
 P2hT8hEOAIEzYM/Jh+0FAGQQ8DSvFXPLKJdSc6yxowg9XKS6GsyQ0tBEW02MGIyD+nvX
 u+SN5l6N1DPtmZa8grOcBbVuDUNuhWYtHbTLHk9sFkm+6FicLyX4EuojCAKizDlMim1P
 GZnzWD7IT6Fh3yghO1N5ltOMO0URoSdo27L0NL7W5HFwLXWfk69JlU4rx5OBIGv3YsG+
 J4fvXLb5spP1EoUsasTAxAT18TCPkyV5QUpObPxSZrwWKwZ/ZP1j8wCpaH6KXDPhorHF
 enHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751379752; x=1751984552;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k8x0R9yhBqb5Y1VdS7ojeB/NMJonErKKyGe0msuTxWs=;
 b=tjJFrgjW2wj79q4vIHg5I+etlMW96qzAREBUh35l+79LT4W8A2QePrVfbWeQQoQSmU
 1lEkopIBkfMg/SNSbkCG2fqzo6zERtkctHeQcsQ3tGYs0ThX5c2OhVTDg+5Dl2FfAHSf
 eA9DM/lFNx7YkyJJDqOILDIsOLZTNqURiA9fhh2Vzyu1T2q3SKpGeRd7JsJ/F0EkxlTS
 VqQjMQUeHcH/5NhGYc0wHsQgnPw3e5pr+iBFG6hh/x7uABYmjyAaTaBG8A6E44yFfTaj
 8sPhQTq6bfz0yb1pKaHVXxGF+tow8ZM3CIHNVcmBa/5ad+IYV8G2cshRjxXBuUlEw5oz
 iE0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9d6e2ze9HDSrqagHl1PBcG6HZVDX+Cz0tssWYFyebKnm3oiUHUdhq+Y8EwvIJ5i1+OwCSl2TREss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJPkWlc6Xvh2wrZc45xaLwYJhsoWZyvljMtv8wQAC/NpejNwKu
 nWEKwTIibuYZLoajOefVuEdc9qFksxx/gs5L+f4ipTUmY7uurT7kJ572bFbmXks8Y+I=
X-Gm-Gg: ASbGncvb05Art+IKZURt/qtyvcnIMut39CHkEMb3+JAvtRNVr8ukBvGJi4us9DXnmfH
 8ld0wnJpRaMpM9adWpEQDtRxXUFSXIhBZErZzuwUV86n0SPLOhAUSGd5FzO9WKQ+Q8lYCnST7nF
 akHSz7PWxOodBvmgtVrzc1AVNrSVDl1HDmBMJ7LRXR7Ina/e0A/ItiH6XCkMtuGsVsmQ7npLnMt
 ke9VLAoeAC6vjP331DBwJNqOi1b+xcHwoqcqsx6MUDgUH3LIZdHlmYveAf+KkndKEAlWHuBWDNq
 gdahojtrwM0OXOV4H2lYgNXuVWSOSEqPYAXkEHTAUalZAP4iZVPndsWrJwzSfOvXZ7M4Lg==
X-Google-Smtp-Source: AGHT+IEpvP/IKG4XnE3h2afzTDYxxLm0xCTQLhlMLnl5t9v8LU08VB6RFSQVJksDddfCJibRGqTUbQ==
X-Received: by 2002:a05:6820:189a:b0:60d:63fe:2472 with SMTP id
 006d021491bc7-611b901bd7bmr12009783eaf.1.1751379752307; 
 Tue, 01 Jul 2025 07:22:32 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-611b8474de3sm1394279eaf.3.2025.07.01.07.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 07:22:31 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:22:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org,
 lorenzo.stoakes@oracle.com, tzimmermann@suse.de,
 riyandhiman14@gmail.com, willy@infradead.org, notro@tronnes.org,
 thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Message-ID: <89390196-a23d-4410-a8ff-b068f1795653@suswa.mountain>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
 <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
 <2025063022-chump-pointless-6580@gregkh>
 <ezkfonpaubsmw6gr4tutgnjmbhvsuwkhaiya7xozl2szfqi4f3@zmde3sfybyzi>
 <2025070128-amplifier-hyphen-cb09@gregkh>
 <CAHp75Vev8r7KZ79=CoUtt0wbx0x3O0ZckesWtQrxs-MBpiBz_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vev8r7KZ79=CoUtt0wbx0x3O0ZckesWtQrxs-MBpiBz_Q@mail.gmail.com>
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

On Tue, Jul 01, 2025 at 10:03:50AM +0300, Andy Shevchenko wrote:
> On Tue, Jul 1, 2025 at 8:14 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Tue, Jul 01, 2025 at 12:47:22AM +0530, Abdun Nihaal wrote:
> > > On Mon, Jun 30, 2025 at 07:16:38PM +0200, Greg KH wrote:
> > > > This patch does not apply to my tree, can you rebase and resend?
> > >
> > > I think you have added both the V1 patch and this current V3 patchset to
> > > your tree, that's why this patch does not apply.
> > >
> > > Commit eb2cb7dab60f ("staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()")
> > > on staging-testing is an older version of this patchset, and so it has to be dropped.
> >
> > I can't "drop" patches as my tree can not be rebased.  Can you send a
> > fix-up patch instead, OR a revert?
> 
> I think the cleaner solution will be revert and v3 patches together as
> v4. Abdun, can you do that?
> 

I'm reading my email in the wrong order today.  I thought Abdun came
up with the revert idea on his own instead of you and Greg suggesting
it...

This isn't a case where we revert.  The patch we applied was acceptable
quality and it worked fine.  Just do the additional cleanup on the top.

regards,
dan carpenter

