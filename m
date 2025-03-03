Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D85A4BBB1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 11:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E08810E2D9;
	Mon,  3 Mar 2025 10:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QhzpY4kP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA05210E2D9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 10:08:36 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5e4d50ed90aso4380568a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 02:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740996514; x=1741601314; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GjBFcA67rMS7ZHAwLBuRWTDfKIm2qOaBa66RMYQiiBE=;
 b=QhzpY4kPZJ0yFbCy02l00B7FmGeQUI9j8d1pMKIf63zYbQJyo3z6H3ojiSKQ+y7Zsy
 fmN3uNtLnLVr5RB53G+rq3jBrvY0ud3Hg5y0fQZuFK9eMnx6KBRN9NRRdr4GwYVZ5WPl
 acCCKDIqP5MYRGUZz2bZ+uDtx0aIAfRcNpXZU4W3Zm9ApdGdGoi/FV1kjl7veeUyQjYZ
 /JKQtWuvlm9aXcsnSf25nkmC+WxW5f2oxxk5KH/jl2I9zBI+7m83yx5P4dUjXuqt2l1B
 gno6SJcYbziJ9U9aPF8QwTi0eRlDxja293z7WIDeLCa50JP62YbIljB8fX08SkA5FhV6
 pfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740996514; x=1741601314;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GjBFcA67rMS7ZHAwLBuRWTDfKIm2qOaBa66RMYQiiBE=;
 b=tKJnBdpJJWDZwoSFGqIyFGQnJQX0ARXtKE6CWByeZB9sx6TxTIR6YVkoc8HfC3eLqt
 xrO9HjJBCBdQolELan3r/xYWMrfHglsSHFUUWW4erInrzH+joWtarOC6PNthVkOgJlrt
 +Je9AkOINSKC0bGOpbEsrQw051uBabhOQK9WMJLC+956pqrA+p4I1pvTwMZ14wyVmqaI
 gMyfAEztQqtDxYXDNoUAzDkb/VMWcR6wgCBBL3EVyUmOMR9yWrCNJ05OzkTAf2FuTafa
 EuGHPPTf6u6YcNBDL3nNc3qf394wF8Srl5CSeM0+iTHFzNbjWvzxM+gByHa/Mf2FspeA
 Gpmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeYoolVt8RaCoDetgq4VRyJnv51acZrtcmeKCj8+Jwdw4tuANsgqbHnWVDLtKJvwxu/yohNrc1rjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGDIHx7emFFD3z7qzp9BflR6ronVSHoSlte5LJ/aGSg7GNzeOv
 9G6ovgXiHiI49EwD+Zv7yJoOGtm4/soeC+JCw2+1X2fVMZ3Hff01b5u4odh0iCU=
X-Gm-Gg: ASbGncuF0jhbIVIu72ajN22Qw66/uGmo/7OxHZO4qrprCNjfiNykJSlW3T4VAs2Bt34
 YVOcQbSERvttwkvk+MgmBOPaAw/yRwpPOGhwmjrWu/DtLXe3UBipycIxcgaAY+2bDd0R9tGWguV
 Fv163SSWmDygA/uXQY/jnoLsF26n2lfjK2xXRnMnGZlPw2hYHYTXb9cN5tLDvvMPYItW2NrQgxg
 9THokADlkd4pLH9KOGg0n78omJslwFxLIwBj9kk+GEUgSPU8edXKHvOC7XLRsJCrg8v8y3jImYD
 MrGFF+ikxuKxK8Ma62FwIyCohqLpGy8sGW9zaLmpkOyyJetJhQ==
X-Google-Smtp-Source: AGHT+IEPxlHoiKz/rey+mSNj9p6SHZuD3oFGIyaUPKEFRRWxafVAlE/vcmhJEnz4DfJOlevycDZ6wA==
X-Received: by 2002:a05:6402:274a:b0:5e4:c235:de10 with SMTP id
 4fb4d7f45d1cf-5e4d6b7b21fmr11376850a12.32.1740996514382; 
 Mon, 03 Mar 2025 02:08:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e4c3b6cfd0sm6648394a12.28.2025.03.03.02.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 02:08:34 -0800 (PST)
Date: Mon, 3 Mar 2025 13:08:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Antonino Daplas <adaplas@pol.net>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yihao Han <hanyihao@vivo.com>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] video: au1100fb: Move a variable assignment
 behind a null pointer check in au1100fb_setmode()
Message-ID: <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
 <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
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

On Mon, Mar 03, 2025 at 10:19:06AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Sun, Mar 02, 2025 at 07:02:12PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 13 Apr 2023 21:35:36 +0200
> > 
> > The address of a data structure member was determined before
> > a corresponding null pointer check in the implementation of
> > the function “au1100fb_setmode”.
> > 
> > Thus avoid the risk for undefined behaviour by moving the assignment
> > for the variable “info” behind the null pointer check.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Fixes: 3b495f2bb749 ("Au1100 FB driver uplift for 2.6.")
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> 
> Should also get
> 
> Cc: stable@vger.kernel.org
> 
> to ensure this is backported to stable.

It's not a bugfix, it's a cleanup.  That's not a dereference, it's
just pointer math.  It shouldn't have a Fixes tag.

Real bugs where we dereference a pointer and then check for NULL don't
last long in the kernel.  Most of the stuff Markus is sending is false
positives like this.

regards,
dan carpenter

