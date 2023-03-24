Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E35C6C8800
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 23:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CB710ECAD;
	Fri, 24 Mar 2023 22:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7338310ECB4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 22:04:25 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id e65so3963113ybh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 15:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679695464;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kaR8KoYOCyBpa3wXhO1e69P/3ERCtiHXhKvCkKv6lXM=;
 b=dr4L4d0WroGEG20/Bi+jk8wcIAbHjq36FQoGokCOOOUiXou4/rLD630Fa7NkGfiNHM
 F8aMEsCImFl07V1c1jf32cNJnvPiYG8wxgp84ZvL0plICJY8a+0D+eMRMiiQ7qPLMYZG
 8OvLaVnZWVPlHDhe/RMyvMMnTIkOwmxjotskiL1e7IoWSnitaQPJ3CXt1+cjoa83eB51
 RQxZT0MwiMFJPIvSY9Fq5uygOeLurQoYncUXyKo8GPrftd5C+0vfotJiuvLXEzeIaM2j
 wM5O4Or/bHXwjiczKLAIiYgu/VmwSAaP8xG/W5VqwN+trJ7XFJuaUg1V8dvGXLsnAr+E
 nvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679695464;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kaR8KoYOCyBpa3wXhO1e69P/3ERCtiHXhKvCkKv6lXM=;
 b=5tEJ440tuBG0InHUQWbK3mZ8hiLUEcmREsF8jut1RBGied/0z7OufDDm1jCvjqnKRt
 GA2dnyr/n2OUsYGBuoRjaILnYt0KB2f22wh0lvd65NtGYQlobFVpY8cOUJvkQ852hP9W
 Vdx3k98F8Z/z7a8pP3Qn7GIezjIRoc5WWqZbRJ/W1CZ8CNwGxQoes6hqN48ThClPNHVD
 53eldl+Wjdj1syHobuZb1c4bSJoFxZWZ3ztJmUSeRjBXLgiwGkoXRXLjeJd7p//KNbMy
 LZWN57wxZMzQFS2zx9WvatMBu9xjM7a9if9ETNUZnvkAQLtnVF8U2vKEq04bc8Cffubm
 8zhw==
X-Gm-Message-State: AAQBX9e4ZWig1vzLMgCFPkAd4S6vHrK3g6VzgzW6lZ7FEsASrCiAT2sC
 0eDmVx3VdJ+RetRDLZts75hXb7Dp/i8Lnff1z5sbbg==
X-Google-Smtp-Source: AKy350Z4IyKzgCSsB9drN4aQZFXjzTnQ/z2hXzQ2JIAVjbZ9YcgBNEvzHIbBigw+DnHvLOMD13d24aAC6uV8Bn+RLdY=
X-Received: by 2002:a05:6902:168d:b0:b6c:2d28:b3e7 with SMTP id
 bx13-20020a056902168d00b00b6c2d28b3e7mr2295587ybb.9.1679695464535; Fri, 24
 Mar 2023 15:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-6-johan+linaro@kernel.org>
 <90264695-131e-46b7-46db-822b0aee9801@linaro.org>
 <ZBqypsYBMSr8HPxP@hovoldconsulting.com>
In-Reply-To: <ZBqypsYBMSr8HPxP@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Mar 2023 00:04:12 +0200
Message-ID: <CAA8EJprjkTdNT5P2_PTA-3wJqnQTgiwgOLWmrwCH0B94SZdvdw@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/msm: fix drm device leak on bind errors
To: Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Mar 2023 at 09:46, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Mar 21, 2023 at 04:54:51PM +0200, Dmitry Baryshkov wrote:
> > On 06/03/2023 12:07, Johan Hovold wrote:
> > > Make sure to free the DRM device also in case of early errors during
> > > bind().
> > >
> > > Fixes: 2027e5b3413d ("drm/msm: Initialize MDSS irq domain at probe time")
> > > Cc: stable@vger.kernel.org      # 5.17
> > > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >
> > Can we migrate to devm_drm_dev_alloc instead() ? Will it make code
> > simpler and/or easier to handle?
>
> I'm just fixing the bugs here. Cleanups/rework like that can be done on
> top but should not be backported as it risks introducing new issues.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
