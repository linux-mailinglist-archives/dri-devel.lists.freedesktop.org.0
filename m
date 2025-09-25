Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92BAB9DBA6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 08:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38BD10E84A;
	Thu, 25 Sep 2025 06:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h54Asy1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BF810E849
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 06:51:32 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b33d785de7cso92126266b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758783091; x=1759387891; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6VaKrha5Sjvod9ZnLzt7kVvC90hBDHE0UcXwFSsoXVM=;
 b=h54Asy1e2icw1ousLavfVWDNBA9lrvfHGtWm3mHC6fSHmpMZMuCq2dbGZ/n0gTVEow
 LvwfnMKGZblAErTwqCrdGMhkadt7A0SgbJK6xk0ncSp3E7Z5q+TEY6/IvktSMjCIuP7K
 pNM+D3oITfyZzoG/yQJ7epfCyKIjeBjNjyMLPElWKbgzL1d3G0fc4QchXoHUo2VtAW2Y
 /GdES6ur/x1PbW39a4rbMGCDnhKmKexlJa6LQAjy22c3vummgWKPWZctE4h2wRizHnBE
 LKjvFjRbrlAObOvKORuFpoEVCNhkSBZnD+WhVhMv1CUIOojDfhoqH5U/+4ldLLqSlESS
 e7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783091; x=1759387891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VaKrha5Sjvod9ZnLzt7kVvC90hBDHE0UcXwFSsoXVM=;
 b=S4STpTYnmY3NkIzR5cyoD4G/IkSWq8/qFrI/t2A2LjFqOxV38Gvt3pti153cQufMow
 Vu3F4A/0Wl2kOhIc3hA1CL720+Y8PzKkoOMoeTna4bxWYocs6+uZX6ruaYnJkYvAFFL1
 uFt4VOEkaz6JHHsY2w6ZLjatgMyaM8UNmdDyAVNi/ZJ9puujsv/L5ljeGP6RjocK7i0l
 UycJPE69kd7Y8ARff/vzlQ86Tz+woCXIaQYumCb8whjVh2AUk6IPamDiXJusdLbLW+KL
 QvXYNOjOnEWy5HHuf25Go5OCj70wtBpkQe42IFXX9JwTgTLYBN9ruJuhKF2CxScoCSC0
 fGgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrpqkDFRJdRfKa4hYaaJUwZNY9mP2q7D0Pj2xn3NJLiDuyL9lN5Z2dIYyZX+GtdEz2gQJTFAAABhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgNhcuUonj+iYWYKytEy8aA8OEdSX+SVK8gGF1V11e3UHMa7AJ
 NfmO62+RE6XPsyosvAkD9nzse8TzVIx16lor6HcJvutfiBlf+e4Jv57Ils2J4P5Lvj0=
X-Gm-Gg: ASbGnctyS5eDO5o+W18fY+4MbeUZyTVRm4T+bWAhmgTz3msnH2d+UvIvqRIVL0DvoIo
 JD/XqGKrb6lgYshFOKMFZUpiWkCxM56Hslhwog0QrPNxDaH8RT5aWVN+1KrTSvEp7BfP2BO0Av4
 N2aIsY989LGgWvpELPQYNMZpBoxfztkwFPiQzJDpsJ9qvMDBe1i/rovOmM7S5VEw41abI7QUGMg
 Slxg2iy2koVG0Hymdp0XuWsqUi3fXNf49cBQ/B6ApL+NXpfstx02DWfoplzBFgQhfDpw0TGGjb5
 1qZh6/Wqra/MKiGSv9icpJQUmnkzhRKy7j22RP0oXbFQ1zpaJm0kD7yG2w/x9QaZQ9SePmCne8q
 5J6G0aa3CtSs8Sa/jEb0cRQ==
X-Google-Smtp-Source: AGHT+IGGfQ8eA5qoYaBx6N30tlw71g0bFTIZMRs/lzQfK9Y0ST7ZgWV3GMVKow4yUGkj2uKHY4Qx0Q==
X-Received: by 2002:a17:907:7283:b0:b31:5c9e:7ad3 with SMTP id
 a640c23a62f3a-b34b8da5a4fmr250151766b.29.1758783090705; 
 Wed, 24 Sep 2025 23:51:30 -0700 (PDT)
Received: from linaro.org ([86.121.170.238]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5d11a0sm102629866b.17.2025.09.24.23.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 23:51:29 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:51:28 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Message-ID: <krinjfouhgak2fvrv4runtv4kbocvfjpwxq6y53no3ajo3ykih@ooucnj5peu7j>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
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

On 25-09-23 16:03:50, Jessica Zhang wrote:
> Since 3D merge allows for larger modes to be supported across 2 layer
> mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> supported.
> 
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
