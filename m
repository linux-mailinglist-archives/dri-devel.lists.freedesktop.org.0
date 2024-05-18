Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E7A8C91C8
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 20:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6166210E0F6;
	Sat, 18 May 2024 18:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Avcyh/6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806EC10E0F6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 18:06:29 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6f4ed9dc7beso1669094b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716055589; x=1716660389;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eNjtPFN4gwk8FY4XhBI0pqmWHSzhdefGp6JGYF0RnSc=;
 b=Avcyh/6ZsyL2tdGHLCCILlI3iTyUEz7loAp40bS9r86tLDWc/FVZ9UtQ5ytQ8KTl/F
 BFwXbFZiXkScD6lFGqT44E/8XkGEcEGBozaTnDbjRZQgOq6A/KrqQbl2GettGK48P/Mt
 hTsx5rlyGvDkUL0KtwWFKBpVTq+Ya4VO8tJ28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716055589; x=1716660389;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNjtPFN4gwk8FY4XhBI0pqmWHSzhdefGp6JGYF0RnSc=;
 b=Q/NwoizMt1o+R4Pf7ubxqNLLCx52fpGDGa9YGY9bqe8xmZbI/cJBOd3RXMeXeASSOR
 jNnSfHVgwMIduK2dfp7wcna0kYD/wlpsnv2R8Ii/4BjshF8MfKCaCcLIkSjZ3MI7K0an
 okrvk5kwLksc73/NxptzayVNkaqkzaOD5dPRav53tUISd+xQJbgqBNcttCQ/zyTatZOv
 4BcMA5bHZ1mEMC14zfFJuml/cq9qDxcv5K0/gLpOVvmnSb8FrPDYCHCKb7Bjsb8YWrgD
 RcNRqghVgp3JFwbdNk8yoekZcSjRZPYFWZJub+BNDWiyQdUbiDZi5d8UQB8N1vuuyZsY
 votg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeLU9Ezceef0evPqSI6zoaSFyLBBoHsLSXvkLAymqoBGpKr1zt7KwnNOdtjxtieXARPY3zx7JcsTFqlJ4DyieZWMDAqDtMIas93/8J0BI2
X-Gm-Message-State: AOJu0YxeVnFjs+Z6MG5JojaKzvhjF7j3meDiHYdQgQnCGjxq7NtlZSlN
 FaddT6TBRMgSYEgP7l/VSgxdHu90dqrwVN9de4wUXFj4SntGrAyXLPejzDFxuA==
X-Google-Smtp-Source: AGHT+IHKKqnL3U4K71hLrs2mUP7g9TMCITdHz9CzBkr4YA8T0fm3oAZPwvplNN097FJEGyMYNzbtLA==
X-Received: by 2002:a05:6a00:17a7:b0:6f6:7c56:e989 with SMTP id
 d2e1a72fcca58-6f69fb7d5d7mr3783518b3a.2.1716055588805; 
 Sat, 18 May 2024 11:06:28 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f67a5ffc54sm5978034b3a.34.2024.05.18.11.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 11:06:28 -0700 (PDT)
Date: Sat, 18 May 2024 11:06:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] dma-buf/fence-array: Add flex array to struct
 dma_fence_array
Message-ID: <202405181106.99C0C03BB@keescook>
References: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3204a5b4776553455c2cfb1def72f1dae0dba25.1716054403.git.christophe.jaillet@wanadoo.fr>
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

On Sat, May 18, 2024 at 07:47:02PM +0200, Christophe JAILLET wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1][2].
> 
> The "struct dma_fence_array" can be refactored to add a flex array in order
> to have the "callback structures allocated behind the array" be more
> explicit.
> 
> Do so:
>    - makes the code more readable and safer.
>    - allows using __counted_by() for additional checks
>    - avoids some pointer arithmetic in dma_fence_array_enable_signaling()
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Yes please! :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
