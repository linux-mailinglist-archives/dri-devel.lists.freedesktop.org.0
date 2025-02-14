Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE76A35CD3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 12:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222E210EC62;
	Fri, 14 Feb 2025 11:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Tfp4pjQ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18F910EC62
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 11:47:06 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5452e6f2999so196582e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 03:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739533625; x=1740138425; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+OQLoQ4w2P2wl26RlQhREWTqKJj63sDchzFcZ4MIw8=;
 b=Tfp4pjQ4KeTsmbULIQvk7onMpV5vt6UrzxJeZsXEFLAIQ65ookojrxTG4ITLA4tcme
 cF7CsU/AY8r8iUiKdxSidJd+5+2Z6kGfLRKNa9uL8vjwWLZ7wh6c0E6jg+We17iQsxlI
 M2yYCZJE26lJ68ymbn/4gkqEKgzE8/M+IZDddjnjiLvLrIervVO+j2rHeIoprbuU+ltV
 zlhxlX8ewVy56XIO9kQ2hOoPRoFl588wDN7Pfs3JAvtTyiBq9fD7M2jth2DkEPWLi1us
 DcYo3KVrNCQ9+leZqqN71Tcu8hELKi/eYGoMS7UgcUD3gmZ/tv21nwtqo2zY25f3rduH
 tBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739533625; x=1740138425;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+OQLoQ4w2P2wl26RlQhREWTqKJj63sDchzFcZ4MIw8=;
 b=Jc/mzKAsYlD5+nm185qGoRsD1HVxP2uFaEo3OKLJ7xmUOhKOQMN3HDdpZD8aBHu4hs
 nqUzRJA8k1PKO7yNI6vz+d0jKn55J2rhZdE4zy+G/pjSWBbknEacUh8nswxn04054AAk
 lu1EWrJvff+vEyyowT4N7bnDgacRSLzxtbfTCafRc9gbM6RtD+ySifm+esmlJAsL1Ka4
 osU7wVxJRGWAkcpKlH+h10hpg32cr28+0wyeu+efLNCEdNaoJ0mBD8FG7xvBAEFcoPTZ
 xs8CPjAzof5AEaQoX1EbxgKla0U3jNlWof7Xe+dS/mq06m7Yq+sNEGGcNkJ7WQum4Iuz
 jJ/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ+yy7pJbHYvLT6lxaAybmzW4NN4n/YcNBNHx5mg5qCNQ0HkwI4ULzc6Kjuqra2eFw5WwOp8U5Rsc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFZOfgczab7g99xjd5qPXnRg8ffqVX9bDHvb8nmWNzf4LjTmT/
 cep3zNncDx39LpAO9QJhr8yZGSyI7tUe+m+u73V+tB+97hZpZTPW8UVS5VroVdE=
X-Gm-Gg: ASbGncviwitVu2tk4F32AggI+nOAWs3ZUFNzc2fRqCiVmODs+LLoSlFdlvNjXB+DNNU
 ZdTAGJ4Ou9PNRFoEK/jPoykM+3FjimQEMAgkwVD9nFgmIxQ1Ev0SdqPlVypyYdfzuk/L7hPorWN
 kLnTKg5BmvwlOpF391k36ZGJvNB9dsPY0uRzJaM0b+eShOArAFPC4sap2B6UrN8W5HtS/zOkNx2
 na3lNmrU34wGO9E2EqWuZmoYZn1D0HKvsGfqapLZtBcgeJyUa2tUti2EfUuxaM4Koofo0ZXeOlz
 2vf9Rpi6DYiuuoiNsuykEd5PV2A6BGmQNTJapva+yESdAVI9WoR264MS6E+QUDc7D15GIDs=
X-Google-Smtp-Source: AGHT+IHKxKT40jo96mqb7NkALHmaQtXaFtWBP2ROk8yL8YBS3KSBU18a4KW3uLJNYHaNWpdoTwyNbg==
X-Received: by 2002:ac2:58c9:0:b0:545:ae6:d73f with SMTP id
 2adb3069b0e04-5451ddd9ec6mr1786235e87.46.1739533625012; 
 Fri, 14 Feb 2025 03:47:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452e44052fsm62574e87.80.2025.02.14.03.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:47:04 -0800 (PST)
Date: Fri, 14 Feb 2025 13:47:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dsi: Minor cleanups
Message-ID: <cwzxsmoykpobyn43thiyum7ncurmdhdv7qx5pqo27itls54mqt@6l3eekacxlex>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>
 <r5mq66osrzle4xbduvaqhv4ypqc5dfkjrhvqwchjmni2q32sbd@gh77gkgj3imp>
 <c5288872-31ef-427f-8438-06e1f0da1e71@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5288872-31ef-427f-8438-06e1f0da1e71@linaro.org>
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

On Fri, Feb 14, 2025 at 12:39:30PM +0100, Krzysztof Kozlowski wrote:
> On 14/02/2025 12:30, Dmitry Baryshkov wrote:
> > On Fri, Feb 14, 2025 at 11:52:14AM +0100, Krzysztof Kozlowski wrote:
> >> On 06/01/2025 09:49, Krzysztof Kozlowski wrote:
> >>> Few minor improvements/cleanups why browsing the code.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >>
> >> 5 weeks on the list. Any more comments from DRM side? Can it be merged?
> > 
> > Are you going to repost for the patch #2 commit message update?
> 
> I did not plan, but I can send v2 with that update.

Yes, please.

-- 
With best wishes
Dmitry
