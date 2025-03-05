Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E4CA50D8C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 22:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3A510E09E;
	Wed,  5 Mar 2025 21:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aUte/Ugy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958AD10E09E;
 Wed,  5 Mar 2025 21:35:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43bdc607c16so639295e9.1; 
 Wed, 05 Mar 2025 13:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741210504; x=1741815304; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GkfOGAJyjI2lzXCaMBa1FddJd+TtvvII6nxqC6Kgsa0=;
 b=aUte/UgyXoXl8wR90RqjIbgxDoJoFYkuazTrM7On+hIASYdW4nzNWaQvSoerjlHeJ3
 5hemr5jlQlxIfLC9XIDsERGbUR5UiYl9UPeixEufuArPNWXEU7SVKFPLtDEKdYLMG8q3
 /AfyoDIgyg8Z26yhTGMfh1QkiJQpd2AMviluntmVwbNrJU2jUueMV6NocsFy7Qh4/hSV
 8BbHGtA+KWc4K1qPpiHuQgpO27oyPMg5lCXAxhV5vNqeBN0ajnN4ahXMYYtNWrVTfbUq
 l4WmnHnU+Z/RGPC0d68EfTsjJz5gbe73M1Z+fneGMfDL+jmJSuqFDUb+cQN1SoItXLa3
 FCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741210504; x=1741815304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GkfOGAJyjI2lzXCaMBa1FddJd+TtvvII6nxqC6Kgsa0=;
 b=LDU23A6q3ONRsrQhy9X2KqCV6vgMeme9PhWX3jBJ3NaWZMIttN1O9KqFeimSIUaTDW
 N4GD+WNnp8n986tQtUzSu/tes974DOWUDm812sEl0/Wn1jK5rLF8Gk9S33DpqVCmfCIE
 8KOLA5EUvhHF8fXzHqVq7bPXlc9t2BNtprOshuVVB0xz45BSMFWNue+C9l6zeUR3t2xF
 BSfwXtkb70PeFvNFuHaqkjXoEVONWVXEj1ylnocEJVArmbNItZgI9eHLcfBG3s7Gp3BQ
 kLzrVX9X9yz95XHMSxd4ZQrqADtc1BNDvytq57lX4wok4VDCCz/pYna5J2iC0S3IYixf
 w7nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0VoFg2/7VvQ0+H28Z49MISgD5zaPmtWCLkuBznU19r87Uw/dqk8NPoHMvHIPGBy1QwLxA5cPgF6zR@lists.freedesktop.org,
 AJvYcCXLVYpVYaoh3Ipvw+PxjuvEsR2TEGaD0WpxMsRiYOIOv8SRxuAtPFjUuR/85YlnbNTc/SLOGLsbeGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr2NkIcGtUqKbFG3cr0+SBrQ4LX423h/1ZKzVDOFBfMey+yhGW
 JQ1MLTzvg/6nm+HANufDcy/LZ4DZopT3IzKgGy0+5BglkQzXBzHd
X-Gm-Gg: ASbGnctflaArNnRW3ikfKbhy2WuEkaJNC14DgdHHI2EZ0qPW3DL+WrPp0LofCZTizCD
 wYMiDA3/rL+r5D3IazA1qCYAnXmB/ib7Uro3nSdxkwZI2iHkSDMUloVyJPTi82/FUSc95ea+m+2
 Dzp6XNuClUaIzEf5XGZdTm21cua3XJ3TTFStl4tZNKTyOl+tR1eDc9/0ewGHmzgEegb9GfG2SNe
 Q1qX8TNtSPDYwyfbou9UYBqVY4yG7Zwex/R3a2z74HmPihsWwQM1lzho9M7YCF9/z4xojbJRO6b
 5QfRtxEmRaTYFsK283UPIEHDeMw7SrFfhfvXBPfSAlfLGoPAzYvchko/WlslTiHGcy3LYv8KBVA
 yoSZ1uGo=
X-Google-Smtp-Source: AGHT+IE8jxO6kdtaaWpEp4oWi8exS7NgMp++p3+pS078xL7aEkKJBfV7Vnbc8oFxX1styMXDjNOaDg==
X-Received: by 2002:a05:600c:190d:b0:43b:cf9c:6ffc with SMTP id
 5b1f17b1804b1-43bd298a59emr40252875e9.12.1741210503722; 
 Wed, 05 Mar 2025 13:35:03 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd42e6bcfsm28935975e9.32.2025.03.05.13.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 13:35:02 -0800 (PST)
Date: Wed, 5 Mar 2025 21:35:01 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jeykumar Sankaran
 <jsanka@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, Marijn
 Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, Vinod Koul
 <vkoul@kernel.org>, cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Clarification for =?UTF-8?B?4oCcdW5kZWZpbmVkIGJlaGF2?=
 =?UTF-8?B?aW91cuKAnT8=?=
Message-ID: <20250305213501.496ea4bf@pumpkin>
In-Reply-To: <ed9e65a7-6cdf-4d93-83a8-464b47a4bc1d@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <e665514b-5a62-4afb-b267-7c320e4872af@web.de>
 <4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
 <20250305141732.26b91742@pumpkin>
 <ed9e65a7-6cdf-4d93-83a8-464b47a4bc1d@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 5 Mar 2025 17:30:28 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Wed, Mar 05, 2025 at 02:17:32PM +0000, David Laight wrote:
...
> > And the 'fun' starts because NULL isn't required to use the all-zero
> > bit pattern.
> > Regardless of the bit-pattern, things like (void *)(1 - 1) are valid
> > NULL pointers.
> > 
> > Of course, while C allows this, I doubt NULL has ever been other than 0.
> > (It was 0 on a system I used many years ago where the O/S invalid pointer
> > was ~0.)  
> 
> Kernel style guidelines don't even allow if (p == NULL) so we would be
> screwed.  :P

Doesn't matter:
	if (!p) ...
	if (p == 0) ...
	if (p == (void *)0) ...
	if (p == NULL) ...
	if (p == (void *)(constant integer expression with value 0)) ...
and the equivalent assignments all behave the same regardless of the
bit-pattern use for NULL.
So:
	union { long l; void *p; } lpu;
	lpu.p = 0;
	return lpu.l;
Returns ABI (implementation) defined constant value.
I think the only requirement is that it can never be the address
of a valid variable.

	David
