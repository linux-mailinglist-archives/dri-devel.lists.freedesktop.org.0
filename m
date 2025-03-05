Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF48DA4F92C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 09:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D69B10E704;
	Wed,  5 Mar 2025 08:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q7dbNbVh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4C910E206
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 08:52:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43bcf9612f4so9015585e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 00:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741164723; x=1741769523; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZC/qen37fd4vBSgLI91hwOumJ/Sl+TjsYB6y5Vr5M7A=;
 b=q7dbNbVhzlFDEAqr18EKKMqGL6NP3ylGnOyy/9Rc9dWwlU4hk4EyuaFMXRBrkE20cS
 X6Thc5AdSnlfhSaVxdQ+NpGWphxvw3og2jftgh8O8gw5Na004dy/1dz3Tx7LYuPdZ5f9
 ALTubDRvPuaMrT42pgwKX7WraxDIbPV+p+2KypuyNAWPnsHnqFzUpSTdpFsYcSkUmYum
 eJHvUUpGvIfEkgLiyh6JBcmj7cIoGEIx/M2aMQYs4qujTSuoOLn0JP9s0BJv+hHZ1drM
 Ria/zhXi5l5dnY/vVHW0vfuIekxc3Gs8tdsBbCwIazLvmP0PqPAYyl43UDdvAPdf+nyU
 c6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741164723; x=1741769523;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZC/qen37fd4vBSgLI91hwOumJ/Sl+TjsYB6y5Vr5M7A=;
 b=umlxPH2vRWy5OgM3vNkBaU2XE3IxuVh1uOU9A6xPyEVf8ip3ElTJeBFdGTe3EjzlVF
 2PvzOtLK7lvGBRJ7zePT48B0LhZAS48tVp4T0zFdT8XHEgrmogX4pgcplMDt4JMkCHbe
 xphHBwDRrRFpIJmxdLLHhkyIeSK3azHjYU3WJHUUe9hPTVMrgNaeHsmbyhhvXgI+vQ7X
 /g4aTtv8zT3HEDW3meJS9mbzXKxK5ozx7UJOB47UbIFSa9Y1lVep94SiUqEFHKe/9H+a
 NJOrW8ALHGPXvJYzO3GTvjnbgXL1/StbBob5Rzh4+Ceep3fr0auvOUCoR93/1Er8w3nx
 6UJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQWIjWq9F+AuH2IGMf+qtNJcZtbYea0YMKGdQ/Pg1na+8na2h0pESo+fL388FVa/ercO53c84CuZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+7PUzWs/0ghmZqYIqxHMivCJvGLwYVQZ1BvWG3iBngV0O8Toy
 3vrqSR/Rjb8eK+gwQUraeI5ixJZJqhHSSAhCdMdrkk25DPAIUUNslWb+gbPRYg8=
X-Gm-Gg: ASbGncuRcbA1dV4XK7t2ig5XJ7vwtzkI4v9+9//vDCWQdjBeAMhgf+Q+su2C5d+B4CS
 d7OZbMBXwfTjQOIk6G2YJGs4N8lDSQF4wR1mrCWcZ69hzJ44Ya5uuTLMZyDKSISlQGfGGqFsgut
 xX8PTumzio+s6ZEszxJfWNF+deSTVIEd44bH+mFPnCJjWymlFbiyIvk5j9iGfyDeCTKLFRey7km
 hGHXUTYkf2TBiW1esLIUUZulqbWap1iF6trvSf0u+Adz33m2cBUe3pphvKQoT2iaRpIa2a6qw/3
 uCmG44UhSUqOqCbr7FQpLWTlOo9DFUVwZdNmP+w4gtXYUY4HLQ==
X-Google-Smtp-Source: AGHT+IEnll5wrK+ucj99FN5wPB9IJR42RFtfAed9YIQq8iwKwZ5zCrl027CguxNQpWhglI/cbwh/2Q==
X-Received: by 2002:a05:600c:548c:b0:43b:c284:5bc2 with SMTP id
 5b1f17b1804b1-43bd28a3847mr16238155e9.0.1741164722999; 
 Wed, 05 Mar 2025 00:52:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-390e485d8e4sm19946896f8f.85.2025.03.05.00.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 00:52:02 -0800 (PST)
Date: Wed, 5 Mar 2025 11:51:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Clarification for =?utf-8?B?4oCc?=
 =?utf-8?Q?undefined_behaviour=E2=80=9D=3F?=
Message-ID: <4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <e665514b-5a62-4afb-b267-7c320e4872af@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e665514b-5a62-4afb-b267-7c320e4872af@web.de>
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

On Wed, Mar 05, 2025 at 09:40:43AM +0100, Markus Elfring wrote:
> >>> The address of a data structure member was determined before
> >>> a corresponding null pointer check in the implementation of
> >>> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> >>>
> >>> Thus avoid the risk for undefined behaviour by removing extra
> >>> initialisations for the variable “c” (also because it was already
> >>> reassigned with the same value behind this pointer check).
> > There is no undefined behavior here.
> 
> Is there a need to improve the wording precision?
> 
> There are words which denote a special meaning according to aspects of
> the programming language “C”.
> https://en.cppreference.com/w/c/language/behavior
> 
> Dereferences of null pointers are treated in special ways.

This not a dereference.  It's just pointer math.

regards,
dan carpenter

