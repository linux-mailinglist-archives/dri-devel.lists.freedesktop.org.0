Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F0A9FEC3A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 02:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE27E10E057;
	Tue, 31 Dec 2024 01:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zWc3ZrLa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA16110E057
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 01:55:52 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-aab9e281bc0so1638517366b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 17:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735610091; x=1736214891; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VN/PHlTdBBGpAVoKHbTwlI3UugMH1La/hOQzUtDLVnM=;
 b=zWc3ZrLaCcJ36YKlRlAJDTPzuBwR6fwR6uLNsoGvnmGvV4WHY3mbKF/ZE3m/11RZbe
 cLzPQ2EaQUSk57SJR+MITexA66wo8v7LUOiyISw+XieW0/7AfnG/z931wmOIB4xRFQZX
 31efbRPxvsI1XrxqG6sfxJSC3cDXH+3K7jzZNKf4qDZfBmSU/yL/+aomySi9+iiOGxs8
 mQ1eockJolVGdyqZIpXjD9+bWzReTk1wOB8xms6Mp9sLLAEdABzxrSrZAouVQop2juIb
 zmWuabSGXeMbJKVWhXVz2im/Ara3jfKVBzY0C3WVKjEkKUis3Npq8pxiLbC1pfaAdk/D
 TSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735610091; x=1736214891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VN/PHlTdBBGpAVoKHbTwlI3UugMH1La/hOQzUtDLVnM=;
 b=V3lA6gHmoQlTxKYm+jbvNhNzz2Gmp7w955FfOROqK6o8BGKrQlc7pFKlk3SHrGrzJW
 zizX0JsJmPLXj08vQRofYkK3G+epQDDtjYGxbXWaYavko5/8J5vTHAXv103HyXBwfUQg
 J3gcWamAFAlfX9e0uBqXyvqRkL8VWfywDYfOea+o+zwxwBxLgxgR2b6wT0DB++wnT5d/
 EVDhRhmr4KiLjWiNDo9Pb2RIZXIeZfmnAU2lREEtFl+lzMmoeVed754TPa2wVM4HlnxJ
 X1J7vMi6+3MBm9TMAWENXH1Li98EHAevrN5ihS6H7lv4XtnZ6ipQHJfVGoOz2HyA0w/E
 08fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8KmMcvl6Zmy6BhiWSnzwoSXj882VYapvQredQKVYMyrDTNx6PUVTvWeph7AKlxNrTMb4Q4hj83RA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFeiK/iIdx0Roxo9adX47KUJdMVU9ceLWdC/qkwy5Rf22zSyWA
 Z6G9OiRKidEpSBZ7jMYaoBvr0l8cWMJy2u2ckPuKhxUYN1pm/I8wTcA/BdB8dUJexhBHZ9kWM7j
 h
X-Gm-Gg: ASbGnctcBg1bsA8cp3ow12rWA7ePKepGcF4cw/ZfccrX2zlIlsKGIcutQ0VYsiooUUY
 eXz2MFFT+3Gx/qM+QZD/ch13T1VKuLXy8jUXk0OZqGMcB3jp19H0dmfDL5+VMuBRUuqfiAHni3D
 huAmpOCvA1Lgc7zX+FaXHgSF+yD8wENOhJ6Z1yZ79bbvykcyhUcnEhgAn7yUjNTBW2DG4+OLJT9
 jXSbeRBKsnyZcrm/RdEt0zoEJ2IETQP8+A8u+3FLq/rdI2qbj2k6x89NQm2x+rAfM9Q8JuK3sdd
 ckM78k5Dns1JEbWc6yCd06KuOlL6CUzhY4bP
X-Google-Smtp-Source: AGHT+IEHAzuWwFoPsiGDbIINuEZ4WyOxk6LeLernunLRlHUyizMS3uk6jY+lyVULKGUa4WS0giQACg==
X-Received: by 2002:a05:6512:3d0c:b0:540:1f7d:8b9c with SMTP id
 2adb3069b0e04-5422955fc45mr10793626e87.45.1735602686021; 
 Mon, 30 Dec 2024 15:51:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5423f9c31d1sm1722448e87.138.2024.12.30.15.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 15:51:24 -0800 (PST)
Date: Tue, 31 Dec 2024 01:51:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Ekansh Gupta <quic_ekangupt@quicinc.com>, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 0/2] Add missing fixes in fastrpc_get_args
Message-ID: <yyhd33y7rzz75ctyj2lnne7xsmcd6takrtge5ohtqdzuni7guy@sgsdbcf4iuj5>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <173557534277.273714.16861047953843054499.b4-ty@linaro.org>
 <qd32erndjbtspx4im5u2ge2vgdc4qwwvxhkoaefxwzkue5x7kc@ghk5fdkma6vm>
 <8dee006c-cc1a-4274-8691-2d58372bc022@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dee006c-cc1a-4274-8691-2d58372bc022@linaro.org>
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

On Mon, Dec 30, 2024 at 08:32:30PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 30/12/2024 18:22, Dmitry Baryshkov wrote:
> > On Mon, Dec 30, 2024 at 04:15:42PM +0000, Srinivas Kandagatla wrote:
> > > 
> > > On Wed, 18 Dec 2024 15:54:27 +0530, Ekansh Gupta wrote:
> > > > This patch series adds the listed bug fixes that have been missing
> > > > in upstream fastRPC driver:
> > > > - Page address for registered buffer(with fd) is not calculated
> > > >    properly.
> > > > - Page size calculation for non-registered buffer(copy buffer) is
> > > >    incorrect.
> > > > 
> > > > [...]
> > > 
> > > Applied, thanks!
> > 
> > May I ask, why they are being accepted with the obvious checkpatch
> > warnings?
> 
> If you are referring to this warning.
> WARNING: Invalid email format for stable: 'stable <stable@kernel.org>',
> prefer 'stable@kernel.org'
> 
> I tend to fix such small warnings before applying. These are fixed now.
> 
> > 
> > What kind of process is being followed, as those patches had review
> > comments to be implemented in the next iteration.
> 
> I apply these patches if it looks good to me. This also helps with getting
> it tested from wider audience via linux-next.
> 
> I do run TFLite workloads before it ends up in char-misc, but not for every
> patch.
> 
> sorry If I missed any blocker comments, but your comments were more on the
> cover letter content and asking about the work loads which triggers these
> bugs.
> 
> Are these patches breaking any of your test-cases?

No. But info about work-loads is the most important part: it makes sure
that none of the developers miss similar issue next time.

-- 
With best wishes
Dmitry
