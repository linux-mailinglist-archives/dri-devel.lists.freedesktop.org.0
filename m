Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F8CA0A2F5
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 11:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC0F10E1E4;
	Sat, 11 Jan 2025 10:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LPRgrgfy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494D510E1CE;
 Sat, 11 Jan 2025 05:13:22 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2ee709715d9so3847320a91.3; 
 Fri, 10 Jan 2025 21:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736572342; x=1737177142; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K84ueAXNjVODznwuqKATSnQoHcUzHnH65wfrCoGmr30=;
 b=LPRgrgfybwO08CoQw4gAFmw1uqggims35Df1/Kg2LLr+tipVSthouzmu1kypsedVw7
 JwnrRrlZ6mJQX6nm+b6Q7YpNv2d96BYCQlYgl9zp0GxNVEyWd6HRC6obB3DsPZzYJB7E
 OakbMVeY7Ll1wpX4Aa17oOaLsZ4tGJVd4656Qo4dHi+ILkFchUtuBXYnuZlXHlzN0b7q
 jq8F49292gZOBJRcuipALYFkyX6rmI2Xu0nN83l1Q3kTdq/ZKaDI9pT22SfHHCEejCPy
 OmVMWfE6Jxux3Qdlm1hwGnJ5ES7Y6vXh+8pQQdkXJ6UN3dOGDQgFjL+mqQOnCIEVFn2N
 3oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736572342; x=1737177142;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K84ueAXNjVODznwuqKATSnQoHcUzHnH65wfrCoGmr30=;
 b=wQvLo386Q/edKnfKsKDDUCtb5d1ckY1No7IUJhawTITJ1dbTRVjUKULg6A88OXhB4Q
 OVQB4nDMzo2Nw5SkbLYe5WVl52MPA7lnKFjXmImnFj1mww+iv3Sw+pjpBSeOpUaE5q1y
 Wg7B9llDuMOU2ST4lmf9JvajkOz0wXNafCr8beE56qv7VuG7FnYdKfqbKyAZPU03r9pg
 wSGcZaHRah1vhGwruAqSaAh+DVLEvBnjDZvPIFCchRqUqIFH+WqvTYjLk+OouYG9QEw9
 4ZTcnxtHBoBryJOQRc27Sx4bOtZFDNbsUr5Gp4FYzF1SsA9mVMjmcrCcIz7JzDG24KcL
 HJ6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1vTJOt7hGZZA/muFEZwSyvVwAEpGjQp/z89rD5C3ZjHUsRZjU+xgPdxZ3qtNxaHBfd5dGFwV0zaMQ@lists.freedesktop.org,
 AJvYcCXHhAR6dLCN2WxHzPwrfF/UQZ15ftloGgLk4kvhp5jCNT5kLnJahHJgCBxJNOXcBKEsZ8U/Z2+hRVw=@lists.freedesktop.org,
 AJvYcCXs2x4RiSwhsEdNVGgbql5fQlQQ5Wq6o4WWWf11v/GYx9gzG8MSoztnBhuKD1v/vkQAcSD9CypFkcXv32uabw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAlKxrsWXbXnRs7yO//rlkFD5VMR91L8usYOgAEPBsu3Wj6ELi
 8xicNlvXsfT/ePD/9sPnkw7jnbBaXSEW/y3fBmf6ex1vZId7b4Xe
X-Gm-Gg: ASbGncvN0o9FkifpeGSCV8xsuwbE7DzvqnkzHl8pTwBQS/0vW40Z5ABYjmpUDF3VD43
 2eWNCcz4VP2f4/LwcM+I1l2v+Px9KHZbLs1STsfgHUd6imvnZPH4UQ2RgAO+PEKNIeL5HmnPL03
 hYf4cZlMzajD2Y/TS8mQITPi8UxrdowROPxVLRlxBOvYOsivxlIM5TlqoSUi/E8sTrwLr8buy1B
 BhnewhzwxDFbOjtMokV1IN3zgI4DeeGrAuWqU6a09YggUDgTXvsRYgpZOlSiHm2vIPJA/iOa75h
 AnvG9ASMh/IhfYPm
X-Google-Smtp-Source: AGHT+IEA6f9Va2VvYbdrIX8aegyBhgxGLUqip/Kgmpnd87tsA5WxjB0RQ4Y/JRsp6zbllZ0TEQB4ww==
X-Received: by 2002:a17:90b:53c5:b0:2ee:a04b:92d3 with SMTP id
 98e67ed59e1d1-2f548f4272emr16579788a91.34.1736572341808; 
 Fri, 10 Jan 2025 21:12:21 -0800 (PST)
Received: from localhost (softbank126159121187.bbtec.net. [126.159.121.187])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f5593d0aaesm4453406a91.4.2025.01.10.21.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 21:12:21 -0800 (PST)
Date: Sat, 11 Jan 2025 14:12:17 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, zhi.wang.linux@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/i915/gvt: Deadcoding
Message-ID: <Z4H9sSEnhLBbZSx7@dell-wzy>
References: <20241222002043.173080-1-linux@treblig.org>
 <Z2dcZfW8eNMnxT0v@gallifrey> <Z3uGjO36tfhQsnfp@dell-wzy>
 <Z4A7QDtTrU6w2Yhv@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4A7QDtTrU6w2Yhv@intel.com>
X-Mailman-Approved-At: Sat, 11 Jan 2025 10:51:03 +0000
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

On Thu, Jan 09, 2025 at 04:10:24PM -0500, Rodrigo Vivi wrote:
> On Mon, Jan 06, 2025 at 04:30:20PM +0900, Zhenyu Wang wrote:
> > On Sun, Dec 22, 2024 at 12:25:09AM +0000, Dr. David Alan Gilbert wrote:
> > > Note: zhenyuw@linux.intel.com's address bounces:
> > > 
> > 
> > yeah, I've left Intel so can't use that box any more, looks Rodrigo hasn't
> > queue up my address change patch yet. Rodrigo?
> 
> pushed to drm-intel-next now, although I was assuming this to come
> on a gvt pull request...
> 
> what about this patch here? coming in a PR or should I take this
> directly at drm-intel-next as well?
> 

Please just include this directly. I don't really have plan to send extra PR
for gvt changes but only help to review.

Thanks!
