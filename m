Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4608E965CD9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 11:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA7710E137;
	Fri, 30 Aug 2024 09:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RVri375i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C9C10E137
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 09:28:57 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f401c20b56so23033531fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 02:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725010135; x=1725614935; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ttXlQxkw/eyshvA7mHo0/GktKkv+RVOKocAIyjalS/s=;
 b=RVri375iAgU1GfUurXUbNQEgYV+vZHh8YG29HkH3hSO9q3sZ6uM08xMkkMFmBZyWGF
 oqNTpRZaRm2CGbhxCmqlZ9JoUrcNwKqFWJmJPaZ8PpXFHA/cC0kO+RECrnwSbjorQGmy
 ECe7eN414Nr1jBWuebkf7TpdEY7+tlHiOZBwG4MUkS50D7yAYFlnxhvFVnNvL1PLEz95
 Uy8MDQzS40eZVFa/9yQFVVPTfMbCOQS0QsM2MvTLGOUZTPBArAdl5HX9fhM8W2W1sTV7
 2de8F+IOq9CBKbHFsxw2ojeo6LtV5HxXDkjCXsEjUXlEgPhJa3fjjDXq+iXGAc+VD9oH
 ukxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725010135; x=1725614935;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ttXlQxkw/eyshvA7mHo0/GktKkv+RVOKocAIyjalS/s=;
 b=Ai7evsI5wzYU3Pb27mfeq5f/7drKzR50muicHSsHkp1gs2NyQazilFL0cvSGvd46Re
 8qnPzbUhekZEq0xWf4IlMsZzCNq1NT2gQ+BIgYESkGhxgfAi5RtyoP+CAHzqtb/WQFxq
 7E9sC3Gmbs51l3G6fQejmH3CX8IVeqqK6REHdUcAIBgBQj+OnpBMllZ5PiisVYHm8ecT
 wHi2tpiJcb+KhoSemasoohmnoIQ6sGLhpQa0Y7Hmu/+r6nrCSKPiLbUsNXFCYRw424KT
 SeDEyHBUETmqkbyoACyJnhErtnRkbpv3rsqa+FkHgoe58D/ImWejsFHOMiEeHzCXdssT
 o8OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHGm81gb5FnRmbTEnmwnKWO9VKvy3MfWWpraEdfrN2D+VuY7D5phEevS/7gmN+9xhMbdVW+umvjIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXq5toqH4aApU50dluzvWWkrQbeuYP1IHwIF0D+n3iqXeAffyK
 2kagJvhQ9xKCTkhiuVLWEc3K9gHFXr8/9Ywpy3ETS5yyNBnwhta956MpZxK3Bcg=
X-Google-Smtp-Source: AGHT+IE1SoiT+DilSlm6txZRiM8sstmJRyCRRRasxT+bhZSb1ccsv8WB79pwNyz/gwzO8oHxrfBOjw==
X-Received: by 2002:a2e:ab0d:0:b0:2ea:ab3b:fd89 with SMTP id
 38308e7fff4ca-2f6129be3c6mr17980481fa.10.1725010134810; 
 Fri, 30 Aug 2024 02:28:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15fcsm5689041fa.16.2024.08.30.02.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 02:28:53 -0700 (PDT)
Date: Fri, 30 Aug 2024 12:28:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v1 1/3] misc: fastrpc: Save actual DMA size in
 fastrpc_map structure
Message-ID: <u3qwicfpvqmkopvzgl2f6wrzo5egvvl7sfqimnkpqopg2u4wp7@2prohvnsh2bz>
References: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
 <20240822105933.2644945-2-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822105933.2644945-2-quic_ekangupt@quicinc.com>
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

On Thu, Aug 22, 2024 at 04:29:31PM GMT, Ekansh Gupta wrote:
> For user passed fd buffer, map is created using DMA calls. The
> map related information is stored in fastrpc_map structure. The
> actual DMA size is not stored in the structure. Store the actual
> size of buffer and check it against the user passed size.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
