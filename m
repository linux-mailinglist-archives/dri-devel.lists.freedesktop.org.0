Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAA1762A81
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 06:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D7410E40D;
	Wed, 26 Jul 2023 04:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4DB10E40D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 04:58:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57dcso63095545e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 21:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690347527; x=1690952327;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8VSCNiqtjM63gyIxgjIBJEUZn4+F4fATzLK2EYdkNIY=;
 b=KAne/S+rw2HDnpOYoq0XxAAGGDmFqVEL+4b4QaJcz22Motczt/sEQi9P3+LqtencG5
 gffk18N2un8Un3gVDBbLDRJCSvj/U8kQRXbeQ3sQi+huU3lOUDhkEacR32UfE0BX4PXh
 R5/AZ6BiObX/u6qK7p5VAxfARPx+dYhRpdGh8YMNmi7dfD3cWvKAT9kHjYSnEJ5f8VY9
 O4DK8ND7BY98sdM+l45wVaQtDojEafUaGFQgGsLdy7qT7doz5fcB77x8RhaQWCvIVbYf
 16flgyVtRYvWqtls+t8zRp/16OIRitE9lb7iBK7d3/SPlHxDXZmPwzdX6fReubLyHpoC
 4YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690347527; x=1690952327;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VSCNiqtjM63gyIxgjIBJEUZn4+F4fATzLK2EYdkNIY=;
 b=FgSyjKe1q5C309JnW2qKtVpww6US+M6nTj1dJBHQJrrKIxfMeEbdQpBgmZyhCRr9C1
 Xain3zdXdSU0hTtXLF5eWY7fiBEP4uV251XtF8g3/GcFURD5LZXxqXt/YuAZMeOpOdcE
 kUNFqRvO5Y5vpAs+cOhh3sz3uxPLLsmtUfAdpGITfv4yQP0A/rAFMbKiuZoNT7nUBoiz
 WPIbQWu9rSest/e0FHogz/m6lnVVZlraA3EUv0Uc8kQ/ZMQg8A3RnWfFUQdp3abVW7G/
 o12Bci44n4Ds1WB/vmSnZHK8dS4s7jJNvVrHbBbXwraxIiPjFDUpYdR1vAU+eAsGREaK
 FLAA==
X-Gm-Message-State: ABy/qLZ2i4a3DKRFgemxenAV9CbEtuF3HzjbYS5HhGC09sOGhGuRUfoR
 mtTAs71RiXLPnNH51ugYsRP0Yg==
X-Google-Smtp-Source: APBJJlGmyTCKXK1KhdP6dWBqtNLQ81LaRl/lodbuRe1N53MLle/JLuh+e2iJ/WFJxYTYet9lHw3Lew==
X-Received: by 2002:adf:e3c5:0:b0:317:5d1c:9719 with SMTP id
 k5-20020adfe3c5000000b003175d1c9719mr515001wrm.9.1690347527148; 
 Tue, 25 Jul 2023 21:58:47 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d6e0a000000b003141e9e2f81sm18453128wrz.4.2023.07.25.21.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 21:58:46 -0700 (PDT)
Date: Wed, 26 Jul 2023 07:58:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/tv: avoid possible division by
 zero
Message-ID: <a4350cec-4ed6-40bc-b68b-3a3a89aa08ac@kadam.mountain>
References: <5d096bcf-c394-4dad-b307-3d7e33ab6e6f@kadam.mountain>
 <630b9f2e-00e8-5b54-ad1c-3e4d404454a1@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <630b9f2e-00e8-5b54-ad1c-3e4d404454a1@nfschina.com>
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
Cc: mripard@kernel.org, tvrtko.ursulin@linux.intel.com,
 kernel-janitors@vger.kernel.org, llvm@lists.linux.dev, trix@redhat.com,
 intel-gfx@lists.freedesktop.org, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, nathan@kernel.org, andrzej.hajda@intel.com,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 09:21:50AM +0800, Su Hui wrote:
> On 2023/7/25 13:51, Dan Carpenter wrote:
> > The reason why the first five attempts had bugs is because we are
> > trying to write it in the most complicated way possible, shifting by
> > logical not what?
> Wonderful! Should I add your name as signed-of-by?

Sure.  Or you can put it as a Suggested-by.

regards,
dan carpenter

