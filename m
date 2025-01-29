Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD50A21AF7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 11:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E526B10E418;
	Wed, 29 Jan 2025 10:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yWhJdxq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A3B10E418
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 10:30:02 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-543e47e93a3so898668e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 02:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738146601; x=1738751401; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rf2z9AXXqo23L5sx+QSCftXUEAvXag8Pe4y8FtysR9w=;
 b=yWhJdxq7fI9gyIdCD4QPQknj0KxrV6Fng2T/N0YIkdFn8+W8CbFvoeMbce/Lc9zHa0
 UAWzUhV3F/T5Has8TpbY9NI0IAIYLiDkQtQWGw9ggmkW5UfKzlGg+4kTia7R23ZmqxD9
 XzYbl4bBUzbjlQQQXPtOzbR4C4IS0qyIIQzZt8b3VKMyAEaoKzWWAuLwMHPiGRUfrWgw
 5NAScsC+cmu+DHedHLSoQ1Ygy7Et42Us3UxjrfXDHfl0ZVbCUR8c1oYGFiRR3cfq5XEX
 1NQZF7go3mM/oEFVLGse23rKZeVqEGeqqnzs057w9vfdsAojJNlzdvJxEegv8o4ksJNe
 Rq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738146601; x=1738751401;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rf2z9AXXqo23L5sx+QSCftXUEAvXag8Pe4y8FtysR9w=;
 b=Je1rN4QsVJ4BPJSqwEY4b+qf3gnbYJxH7KdEqdANOxSs+fIxjKuQ1VHNWuRE3Ro/wz
 uwQWdEhmUsjM+hZ1b91k9NSUAx/A1U/S/UaRrrlwIMilGdXynUdJD09AUO5Tvu40f5WE
 S0cICVznes+fmyUMcV8TEiuX2A10b5DKj8Gt6csN5PJcX1QjTulH9qQ88q7ArxFcuQHc
 phhMMXYMbTsCu4dalTHGuRfHAn8LkIBXV2gmYXsO9WQRmO4WL1hRtmEnqkt0WLGtIYVy
 zonluc0SRloQ0g0JymG8dhW1Q1rfYdmvyj4B86GxdneG5kfwNhKpUS8JW2NChUkRtO5z
 Wj+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBiyh+mC7zb7RMm8K0qUpTccMnuEDxVprYf3+srPm3oCv+dX3wdI+oqMjfmAiF7ptmt2ePdRIpqWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFFFNw6ZkXhQt7A9fuMSk83A09dgsTu6DQlqJEjjlavHvYRsLE
 rsI7szbtQYzGaeZ4vwC8/1L3bh0hp6HvdKUmT3hDNz3onEWX8GNiXkzn7dYUpjE=
X-Gm-Gg: ASbGncvmOmD/gqKanjQFoqdfiFKIrGhOlA5ymST6isHiVCDmEBePBUFzI8VBGwLGIWn
 kjugIt8K+CIqbIUTjTM3GilW1OL8K4S+hdMA+gawShKIHdFzO/WxvySURjm48EMsst2wCW1aj4A
 1Gh+3ddFk9BH6hM50ZwYTj/vrK17N88S+RgQCciwsHv4HnOllgr4et5R96l9aAaYLSJ+/ts1MQd
 txg+Tp3q2MuP60ea47b1ydFbkmJWsRICXMvxT7RMikc5gxcbKSeYl/dcrCwk5nafAwr7uB5G8Kw
 QX7ZZFEEndHfI68TLLWcjhvnLrQmh4ibNtYSUOT4hYQ1KEHtRSjjSFfhmnYzElfAZJLFW/7iTjF
 5EHbOuw==
X-Google-Smtp-Source: AGHT+IHkpLJ8On8IDe/0sYVi8VhGBlFK7bZ6QLzqiTm3DF3uzi4M+9EKkB/RqKJcbmGZoV2De5zgyg==
X-Received: by 2002:a05:6512:4026:b0:543:e3e2:879e with SMTP id
 2adb3069b0e04-543e4c3fdfemr727073e87.51.1738146601094; 
 Wed, 29 Jan 2025 02:30:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c838166esm1932581e87.235.2025.01.29.02.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 02:30:00 -0800 (PST)
Date: Wed, 29 Jan 2025 12:29:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 2/5] misc: fastrpc: Introduce context params structure
Message-ID: <bvuexnpy4yohdbmanj77yugxn2qkwmkcsguvdfbvoyekv5yq6x@fmvwlq5uxxrr>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-3-quic_ekangupt@quicinc.com>
 <dbyrbb4q2q2hrdarprfpbg4qnctjfp4uiwp6cqq6epg42ekeba@fyipe2jrhayz>
 <fec1e345-1ebb-467c-93d1-264ad0279096@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fec1e345-1ebb-467c-93d1-264ad0279096@quicinc.com>
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

On Wed, Jan 29, 2025 at 10:27:45AM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 1/27/2025 9:13 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 27, 2025 at 10:12:36AM +0530, Ekansh Gupta wrote:
> >> Add structure to invoke context parameterms. This structure is meant
> > Nit: for invoke context parameters.
> 
> Ack.
> 
> >
> >> to carry invoke context specific data. This structure is passed to
> >> internal invocation call to save the data in context. Examples of
> >> data intended to part of this structure are: CRC user memory address,
> >> poll timeout for invoke call, call priority etc.
> >>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 138 ++++++++++++++++++++++++++++++++++-------
> >>  1 file changed, 117 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 1a936d462519..c29d5536195e 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -254,6 +254,11 @@ struct fastrpc_invoke_ctx {
> >>  	struct fastrpc_channel_ctx *cctx;
> >>  };
> >>  
> >> +struct fastrpc_ctx_args {
> >> +	struct fastrpc_invoke_args *args;
> >> +	void __user *crc;
> >> +};
> > Why do we need a separate struct? Can we use fastrpc_invoke_ctx instead?
> 
> As fastrpc_invoke_ctx structure is allocated and returned from fastrpc_context_alloc
> and getting fastrpc_context_free. I was thinking of keeping the user passed
> information in a different structure.

I think we've discussed that previously: don't store user-passed
information. Parse it as necessary and then drop the user data.
This way both old and new invocation types will use the same data struct
internally.

-- 
With best wishes
Dmitry
