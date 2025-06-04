Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FEDACE3A2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 19:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8243010E146;
	Wed,  4 Jun 2025 17:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gBnCxaLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4520C10E146
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 17:29:21 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-adb2e9fd208so13738666b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749058160; x=1749662960; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LHDU+1RYiryvJb22UI+WF8Y1TTPxARJUuDw60tggXd8=;
 b=gBnCxaLrnq9pAL/gJClvev/4yaY2VHNNjpBHupOxWlj7AHYJzXJ1gpEsZMsaQYpfSL
 MmRp1GNPwsREtcN8sNOTUpD7t0SWYB6vFBzKpnyrdlzP3j2w1XaHRi9IhowMeUmWq8lM
 +g50gA60xrVgTyTR66B3hSpgGTIfgnw8gYt3WF4kq3EmLV/LWGtuRzR4mPVFvS8DxjpX
 SUcP+uGSUQpL/4w2E0k6SOsddg4SJVKFJvlM+HAWDiC1G6RAezjcLLvkAqYLTkz8RsS2
 ksLSPSCvpuB/ta3et9I20hI+1yeeFIgJUSILXv9QHo6Mk8SZClbodkdowsprfD7VkxHM
 e1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749058160; x=1749662960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHDU+1RYiryvJb22UI+WF8Y1TTPxARJUuDw60tggXd8=;
 b=NeucUAGCxgVkzT8TpJFUVIz9uqwgSSNeIH1FZW7KQJXmzgY02lUTcjewBtQ91K98kc
 /AIuTcZfoeXWi4ypNkHSI44ECEkDUJ2P2aKjfp6baXECmb/MQZnQMmaCpB3TFa8MrNGw
 pxOtYN7fVibr332/juLunQKeDPAk4N4q5XhrWjsEYXWp8FeXX9/2azXtCfjVTDf75QmK
 xMFpON44cFZhzlGKN2WTklJOi9louIsc8aOJeP2Abf8ezU/qbVAzKVCNBGMa0i2JsIlB
 VN2L+C8hzz01oCTpgc+IjwqUmou6vNiYx5lb3bMGiBXO/q3pMNnghMFmnKk0P/6UNGl4
 iMGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXN8dW6LoVS1UojyWmXi6R/DfMLy3Vkmqp6BcSAaIoopTQJVXqzmB1e9Wzdapm+IntQKkL1oU9lYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJcHN+FOgx25e66KZI1/6UipnEsO2j6/OrSeqrR7EXe57wPZ+O
 3RqmJsirq6fmRdYSM93sdBdThBtzgKdqXOuKw1RBrQcLOaSbq/9g/jd9tjRdFv0zyNE=
X-Gm-Gg: ASbGnctSqphnWyhO4UBFjn/oTY9xBZJjcENnMOHXzbSRQw+S+Qzq+o5xbO4TebHxryq
 QWapq1Vd2zf6gZBttGuku9k8CsPE6oWsSDd3+yAWFcgWPV8qBqukYEZvEqnwd887SWfW2gkJ/CB
 YpEWqpsO9c5SWCG95vhXCwcgWnZKWd7+aQxaf6XGLQf6RRutFARAAvfoM8JRveWuv4FNjerDnRH
 QKCnWrziUB455x6ReKMoOKHGmhId/4jw8+PkOLO/37McV1BoFeRxz26FziHx26PfA+aVYUk+Bs9
 6DbVxB9j7qWkbjzeabGmbjcB+lVIrkk9t7BdD7XC/yFeqmlRzDvBMvi0YXXS46xrmw==
X-Google-Smtp-Source: AGHT+IELXaQPEfNvL11HA89uAYXLtD5fjYuBkHotv6D53Ek2qhdvi41IQ3zt5wxdrPwfVnwDa0lhAQ==
X-Received: by 2002:a17:907:c12:b0:adb:2e9d:bc27 with SMTP id
 a640c23a62f3a-addf8fb2cacmr373200866b.54.1749058159647; 
 Wed, 04 Jun 2025 10:29:19 -0700 (PDT)
Received: from localhost ([41.210.155.222])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ada5d7fed8bsm1132163766b.28.2025.06.04.10.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:29:19 -0700 (PDT)
Date: Wed, 4 Jun 2025 20:29:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [bug report] drm/xe/svm: Implement prefetch support for SVM ranges
Message-ID: <aECCaCP3BGGGUUa0@stanley.mountain>
References: <aDSDfusiM8QGQwFS@stanley.mountain>
 <0183ca8d-4347-48d9-a783-361c6543db14@intel.com>
 <20250603222952.GD407166@ziepe.ca>
 <aEBeM1sWuSNWNij6@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEBeM1sWuSNWNij6@phenom.ffwll.local>
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

On Wed, Jun 04, 2025 at 04:54:43PM +0200, Simona Vetter wrote:
> On Tue, Jun 03, 2025 at 07:29:52PM -0300, Jason Gunthorpe wrote:
> > On Mon, May 26, 2025 at 10:15:17PM +0530, Ghimiray, Himal Prasad wrote:
> > > 
> > > 
> > > On 26-05-2025 20:36, Dan Carpenter wrote:
> > > > Hello Himal Prasad Ghimiray,
> > > > 
> > > > Commit 09ba0a8f06cd ("drm/xe/svm: Implement prefetch support for SVM
> > > > ranges") from May 13, 2025 (linux-next), leads to the following
> > > > Smatch static checker warning:
> > > > 
> > > > 	drivers/gpu/drm/xe/xe_vm.c:2922 prefetch_ranges()
> > > > 	warn: passing positive error code 's32min-(-96),(-94)-(-15),(-13)-(-12),(-10)-(-2),1' to 'ERR_PTR'
> > > 
> > > Hi Dan,
> > > 
> > > Thanks for pointing this out. I see there's a gap in how hmm_range_fault()
> > > adheres to its documented behavior. I believe the function should sanitize
> > > positive return values from walk_page_range() to ensure consistency.
> > > 
> > > Jason can comment further on same.
> > 
> > Yeah, I don't think it should return positive error code, whatever is
> > doing that should be fixed. Can you send a patch?
> 
> Not sure that's what's going on, from the comment and reading the code
> (albeit non-exhaustively) I think you can only get positive error return
> values from walk_page_range if the ops you provide do so. The hmm ones
> don't, so I think this should be ok without any code changes?
> 
> Maybe a WARN_ON and patching that up for paranoia, but I don't see how
> this can happen.
> 

Thanks.

A comment is enough probably.  A WARN_ON() just bloats the code and
it doesn't silence the warning.  I'm going to have to add a line to
the smatch_data/db/kernel.return_fixes to tell smatch that
hmm_range_fault() doesn't return postives.

regards,
dan carpenter

