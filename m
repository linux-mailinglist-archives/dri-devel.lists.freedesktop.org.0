Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E5B8D5C9B
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 10:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3E9112298;
	Fri, 31 May 2024 08:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RKCpivam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843DE1124CD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 08:19:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b83225088so1059310e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717143557; x=1717748357; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ko3x+z+oeuBeX+MUT+r9pNc7Ha8KawJ7XnNk7EBTEEM=;
 b=RKCpivam9F0sfMiSm24btR/npsYAT9iUbsgQc4Qoy/45vRAmzwejHHXrMDkPP7Kcf2
 Ra6iRZjGMvF1/+/r1fzwcfuBe+J11ZuvcWbKdxxphQIrcc0Igf57a6+Nvl7YmswwWXmg
 cthtQQgKAyFAoP+TcFRJEMxpR6CBYJACFwz7NRlqMnvKIq0DuE9dw3uVKqg3MpxrrZ7F
 EYQkf1EAgKlykXbBRZwGMJVMyBxAfyRkAKl22VgX9Av/n1ccR8m1AdwDs216lA6fvGTt
 D3lePn5Z9ithkEMuNy1PLJyVQ95iTMc0seg7JZB/rc7jpLJFNYIGzawi+9BREK4GTbks
 0eXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717143557; x=1717748357;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ko3x+z+oeuBeX+MUT+r9pNc7Ha8KawJ7XnNk7EBTEEM=;
 b=h7hHos31SSakA7xYpfsP3+KhbbIPjE8MLvY+J2KJLtpzb1BL5Scjorm2Fi8qE7THsq
 iRf9aN4+mH9ZAEx2lB70BG6Uu7p3zM0WOS3TB0xalVBPi5qo1ksPQKKCrMxAuug6EzLp
 5wTI9s5thuW9tzePRNWSOxDNNglbeHyBrVteFlS4lnGYYpX30FflUR9SLmh8bbx0O4//
 FhsomKtbEe9B5quSUGfxSzE4w3hiix9cVdbE2gtCH+dWB/jbhE6/0+iBBRggXdq97Jvt
 2hSf640HlkIiD4NN5qxp4GiaVXNCLyiU1kLDKSNJKpf3Hl/ZbQnpxErc72qlsto9aj24
 c7PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs1+xpa5kRahiceuLQk7WP78CJ16ArCKCOX/w6tYtz9kMikPrfgCju/SqBDyjVk2oHgxNDtvd64543La8n/wko7o88hb4pjtt62pbYSPmJ
X-Gm-Message-State: AOJu0YybO/1GquPa+exLsgFLLJnq5cVS2M6sYggsh/19Ppy28KBsPVTA
 D1WD3YLkJYmTyKpNqbcxiv1tgj132r6JsJvZggceK8DFAtR/LDTwUX9nmIGJy94=
X-Google-Smtp-Source: AGHT+IHKOALBvpP5h0AiQmZTmJVgPq3q/lJ+YsJBLy9b7uGY4oRPAaR9D6pdKC0bm/RzqJYNRG+OLg==
X-Received: by 2002:a05:6512:70:b0:523:9789:4c8b with SMTP id
 2adb3069b0e04-52b8957ff6cmr664063e87.5.1717143557411; 
 Fri, 31 May 2024 01:19:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3450bsm254800e87.45.2024.05.31.01.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 01:19:17 -0700 (PDT)
Date: Fri, 31 May 2024 11:19:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
Message-ID: <dz23snvzifgjc5dktv7sckkumpudjkumf65bc66eler3xm4atf@37nypjcwyxef>
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <87o79faq4a.fsf@meer.lwn.net>
 <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
 <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
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

On Fri, May 31, 2024 at 09:33:12AM +0200, Geert Uytterhoeven wrote:
> Hi Thierry,
> 
> On Thu, May 30, 2024 at 7:07 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > Alternatively, maybe Kconfig could be taught about build dependencies?
> 
> git grep "depends on \$(" -- "*Kconf*"
> 

I'd rather not do that. The driver option disappearing just because the
pythong vesion is incorrect might be misleading to the users. Anyway,
with the Abhinav's patch the issue should be fixed (and I'll take care
not to break it again). Sorry for all the troubles.

-- 
With best wishes
Dmitry
