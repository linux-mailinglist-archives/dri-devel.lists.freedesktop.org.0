Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6035FCCEACC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 07:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A1D10EE57;
	Fri, 19 Dec 2025 06:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GQN+oLG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A9D10EE4C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 06:56:10 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47d182a8c6cso2837115e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 22:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766127369; x=1766732169; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1uvUrNBTPpChg3H7Mj1KDqnB8rAwuiPMf9e+Kj7W0oA=;
 b=GQN+oLG9yTYC2ThrLSvtds+TSEtO/iCSIp2I/uOtNmcjRJESZ3eV9kLD0J/FvXeD8U
 Zti8vYXtpu9dXB+0GVAYNo5xfsDi88xQHfIfAf8tM3saQtv/LRbbTryeQvduAIkYwyQR
 6qgC99uqxjE2WnWDMpCQiKVsd9lQeXQPvsomFkPytfZZ9H5r0NathvT25wi9huTEqDw/
 uix36w1pkUIJGj7bMx5VH+j8omubDaLL/5BxulLsdIsE3Rmy+uu/vn++DN3nAtXyWMSd
 0fbrU64GwUGbkJYhnsD5ffO2ejbXR4qMVIVp1w2l7WOC12uNqQ5Bs19SA9yBi39Qax3O
 BiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766127369; x=1766732169;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1uvUrNBTPpChg3H7Mj1KDqnB8rAwuiPMf9e+Kj7W0oA=;
 b=k5m3PBWK1vAE1v24DNlzKzhjI0WeAm3+xMGgYWXHVa2PaO4KMHXJrkzSs1jFNEUGBU
 BnRo2ICVAV4cFS2W8bXVmjBvuTSFr2qDI3xDXFm7wGk9Xh1KVIadKLmaZRBYvUtzij1e
 ZKLxJnx+MmqpywF8Hgl62poOZb1ZW3P8dZUex4N55FBv/hMjePr3vbGZcEKUT3dZCw/P
 145CoB4QW+wIiVgLgdl+VEHUNuWIV7fgUAPk4Qyb8iRy2kDwC5gk4vRUUaaj+PfWqGaH
 AArFqTny7LtJ11+ujw8pB7y/TZRAlUgVzmO2X3jwYt1S1OpIZoOyvAi6c2rWHiCOYbhT
 aMbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIaTmnaK8XbfGiGn9VneBhXG8so8CFWKzeiAfQWtSMC5+PUVWSZMZDrkCOWPYo0n9ViNajfaUKbjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNqQ5X1LAqRAlFMJlL2Qc63S63lf4OZILiSPfcu7Xl0txkrCVC
 gPuWriWhQbf+AB8NckkMeZnvBhmSVIg9CgHZ6296z1+LdQ1axdP0xiKe3WA8fDbrGkM=
X-Gm-Gg: AY/fxX5fHaBXPBEG2Vo4/HlQnnAV6A9E/XHlf8cakkO7aZFxLPZ3ind34StZsH4b68r
 m8gA6jeaP8ir47D4jEusAl9hT+iy8Tu6/wc7MJckfOgl7iJu0pgU7RzuGcUghVDtez4H0wwQFMa
 ChsyxD7yLYjWVq5eKr54/GZvoL1EKM1pL/O2C+LFHT08JaXP5G9kexdSEhKV0AgVxNFUsG8VEuK
 Xf1bHI7CGt1nw8jReimzAbEQ6aXBNbNpeH9ngJTeSTptbxWk+HLW6UBw+E+Su75c1Ahv8JPs4aK
 hI1el3i2aL+TCZ4F4hrdO5Scd3AmSUsXW0U7uNIyPAcP2RH3Uf3DpnNFkxa1a7+KzBijLGBFj8F
 yJTGtVfjU+fhoRdwJlxYYWSzegZq0d9rpggEtBPcy25iZu8/U3BEQln0mFeB1xnubegXhF6fFM4
 UrAKA+aVEA8zn8+aPu
X-Google-Smtp-Source: AGHT+IETUnYjoqlX0nTA5YutvCCmQpud7Xc95qZZjrAyjw0urEK/i2B0DG8TW5LtsWwvJaxJadbpvQ==
X-Received: by 2002:a05:600c:45cf:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-47d1954a550mr12510385e9.12.1766127368714; 
 Thu, 18 Dec 2025 22:56:08 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3a0fb5bsm30212905e9.1.2025.12.18.22.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 22:56:08 -0800 (PST)
Date: Fri, 19 Dec 2025 09:56:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <aUT3BYAT1bLCk1w9@stanley.mountain>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218-remove_wtype-limits-v1-1-735417536787@kernel.org>
 <aURXpAwm-ITVlHMl@stanley.mountain>
 <480c3c06-7b3c-4150-b347-21057678f619@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <480c3c06-7b3c-4150-b347-21057678f619@kernel.org>
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

On Thu, Dec 18, 2025 at 11:31:40PM +0100, Vincent Mailhol wrote:
> Hi Dan,
> 
> On 18/12/2025 at 20:36, Dan Carpenter wrote:
> > On Thu, Dec 18, 2025 at 07:50:01PM +0100, Vincent Mailhol wrote:
> 
> (...)
> 
> >> With this, remove gcc's -Wtype-limits. People who still want to catch
> >> incorrect comparisons between unsigned integers and zero can now use
> >> sparse instead.
> >>
> >> On a side note, clang also has a -Wtype-limits warning but:
> >>
> >>   * it is not enabled in the kernel at the moment because, contrary to
> >>     gcc, clang did not include it under -Wextra.
> >>
> >>   * it does not warn if the code results from a macro expansion. So,
> >>     if activated, it would not cause as much spam as gcc does.
> >>
> >>   * -Wtype-limits is split into four sub-warnings [3] meaning that if
> >>     it were to be activated, we could select which one to keep.
> >>
> > 
> > Sounds good.  I like your Sparse check.
> 
> Does it mean I have your Reviewed-by?
> 
> > Maybe we should enable the Sparse checking as well because it sounds
> > like they are doing a lot of things right.
> 
> I am not sure to understand what do you mean by "enable the Sparse checking"?

I meant Clang...  Sorry.  Doh.

regards,
dan carpenter


