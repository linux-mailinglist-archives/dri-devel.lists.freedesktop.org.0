Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5D4B4194B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 10:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D620810E063;
	Wed,  3 Sep 2025 08:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u2rtgHj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7697410E063
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 08:55:50 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45b804ed966so22689365e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 01:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756889749; x=1757494549; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5cV4mqPmxW1tPyF9dbost7ZwM2Dt79PTTYDkgTZFQBo=;
 b=u2rtgHj9femv9sqEtwUa/uQ7ddMtuGnQifo6kyAsz2iTv3XkGsePYbLvCJMgncj9KB
 v6+sVgWSuxWxenVYnnDmHcN5aZjw8UdaY2cuPD68f4OFKujRrLEjaQgi3ZRPaArQc+ME
 CSNyO0aLNyT09oRL3iN7S0hTcMfNMX+qDZF0VDGtlCyikklUOBH3VTJMDv1t5vGDisqi
 4yr6i/U6u263yGpwqxciDyZguu30nC+liZWMIBwzRY/Q3r6E0a1G4ehM/paTMOyZSWps
 2hu8sXIr4tFbq0iSPlsBm5xMmHSiQ/CMiErTY1dWb4KbtrEZ8pgeI4B3sgDWjMgXpF5+
 NFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756889749; x=1757494549;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5cV4mqPmxW1tPyF9dbost7ZwM2Dt79PTTYDkgTZFQBo=;
 b=SLSocdBoZaFhyLCaQI1WJuGxUrQHfjW7I9gTi8LK0z2iqfm4msw18x8HWHt7jK9giw
 +1Yapgm2udo7IFf1/Uh6naeJgOrO9GKHSzbyXue9L2yMmx1dzbAkcPEHfa3//00z8Qv4
 Dvm89JnoQqhbOUWGFXt3HdR1yrydZ1hvYr/4WS7DwtYfqHkdxm35KiTblCDOg+K6WcI5
 z4sDHv/KQYhDoS5GcxfpPmxgocTSYtDnmgIpNCHXqf3LgTFaWb3M47JHBii/naX+XeWd
 WUxL3qOyXbP5exqe9gYomjwncgDMBQs6cJcRHSGg1IelDj7gd67S6LmBF9l48jFyDR1O
 z9/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO1NHOT7wlddz+F/xu8XwqQF0t4PaE5kAlnvdOIKvehFYcRZ0YQ+Wnwc4EBJpGwxipOG2KlUQOcCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaIdKEEss7NiJutiPXBj2qqz7irv4fHKvGDjq94ShKw79NSQ4F
 zIQAIr82BVQT4vxPAHcKiXGmI1hnB/lGO6Yevn4ahsecaf+mfkSmwyKe6KeF+ojkrXDRhW3+INw
 sM0/O
X-Gm-Gg: ASbGncvCgIthbwYfbgYqzkbqfbUjsGA7P5BAOyCBlQI/UQh57jNMOCsIc+RlCw9Mgdh
 HlAb1j0e6tGpN56DzQYnzGla5+EefymLsTG9GCdeA+yVSYrdujgWm/0jD5SbdoDfRBANJENpkE4
 fkuGbA4RUBQolAv8jSIStJk/nRsNa8Ok1hL3XI2c/gFWbgmvjfmXkww1zAf/IHn8nW3dModnExF
 s+PUau1YlVnXQJD+q/97R3fTWzbjOLAiLaulP6yuP8p9TVKZuTmlCSFYS/icKRvN7u5PZmxJY8F
 uEvqbeXtQLPpB1KNdMURUho6PHBhb0R46H5x2Sc5O0G7kgtTF/bRIoTz4dOBmMyEmbC/Mj9rVTV
 xD3UWievmDupGt4KAbGTkdqRFEtcK+V7O2c/IAg==
X-Google-Smtp-Source: AGHT+IH/I5haMU97rwsp/23eXdJD7jSFORVKYid/zP+DHP9530edfSTunocGOnjSttPgmZD8RbnDJg==
X-Received: by 2002:a05:600c:1f1a:b0:45b:47e1:ef76 with SMTP id
 5b1f17b1804b1-45b8559849bmr123014385e9.37.1756889748976; 
 Wed, 03 Sep 2025 01:55:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3decf936324sm1205616f8f.9.2025.09.03.01.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 01:55:48 -0700 (PDT)
Date: Wed, 3 Sep 2025 11:55:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>, Shaoyun Liu <shaoyun.liu@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/amd/amdgpu: Fix a less than zero check on a
 uint32_t struct field
Message-ID: <aLgCkRO8jkzwuxW5@stanley.mountain>
References: <20250903082018.2702769-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903082018.2702769-1-colin.i.king@gmail.com>
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

Are you editing your CC list?  The get_maintainer.pl script gives me a
longer list.  The most important thing is that you've left off Shaoyun Liu
from the Fixes tag.  Added.

The kbuild-bot did report this bug on Friday so the AMD folks likely have
a patch kicking around on their end, but just haven't sent it out
publicly yet?
https://lore.kernel.org/all/202508290749.ti6u3cLL-lkp@intel.com/

Anyway, the patch is fine.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter
