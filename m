Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E7A7333E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 14:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEAF10E8D0;
	Thu, 27 Mar 2025 13:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b1AHc6O/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C8C10E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 13:20:42 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso10440625e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743081640; x=1743686440; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VAC3jQYsjcnCVrZPAH4JIcMHqf1bqzRC+I0sVF5JOrQ=;
 b=b1AHc6O/peCgUDqo6lQojoM8TdnycYgtYalIe8iL0E9REyRB+rtEYtJw3v3tpsa6Ue
 sqiNdvDF6Hh7K+0su7SWsa8J4kpyFFZhcSWo4m0eo1PiQT2lXEKqpsZkkovn+hNXgWSB
 fzjf+25jX0kBhNbwbuwRl9rplep4bX8D0syUftb/u3ZSCajqQXBDV7w8pY1pFHkd+SEV
 7y7l7uFlhYcurYZg6jwlODiGJqopFvvrNTS41aZIPQvQuPi/s/7wGFAg7rI00BmYaTCt
 y2OSLhuGd0ZwhOtr2EiF7OnZ9RscbKVQOxTWCw/6rd1GhORs/OFgoQ4gkoc2akJK53mP
 Uoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743081640; x=1743686440;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VAC3jQYsjcnCVrZPAH4JIcMHqf1bqzRC+I0sVF5JOrQ=;
 b=jSZxhgMQWBM+CNCemW8UHE5j3h/aeGzFRxE1PcPO5V+HDRzkBeEWRnt6UB6n+EKbNx
 tMKP/2l8LjnWv0dtgBX0tXoEI/oh9zXLvKxGW6Xoy7trpPv6jgf8oZC0qaFC5PUHJ3p/
 FIOiYbmlx/XwSr/2VGr5EmxipsqopB0C0PrtdwBKsxS9BUjmwNY/RLonmmaXCphFIqvh
 8+CgBdI8lhYw3Y46YnQL2Zp4UDP8Sn16oqp3T3N/HhT9KuLMBk04V/8XbyQJAu8JsPma
 iFckEw1Sqai9KkDIP1h5Gzaitb9lDSxt/m2mVVMWgxNy/IMap41/MGCotWBTKaE7VDI2
 0VpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9WXg2rQe9XPRFj3feKOO8jL4gUnZm5j1pD06CkI8Qt7jl57upmyoZSYJOmM6nYkYUySiQ8befp3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtxRhWkLCL1As7sK5kPbXc1FmDGOZjHH2+ZybV2TbsI55QSIWs
 hNEyKRsZo57kgD07jdr7K0dJlJnfq71esval4ZMqconfeH2p6Iv2rpfEdFzxbscr5Heqs2nwpW6
 2an2hAJUtHSQUl7qU/WuQ4b18tfgTYBCquXYYEw==
X-Gm-Gg: ASbGncuoobYeKBNP9Xzc0KQasANutGEy2AduYiQbLxWHVtInK1yc2uVWw/aegNMIY3F
 ZYPthMkN25RYa/6iQvzjGaOd1LHzKRdquF3QqHhEwCL5vAuTtJxwMmImJXlHhBo0OYeLnrMztYG
 mSpRS+C8OT5KaJcggjRAz9sGxGH4sghmejBmUA7t8vfzx2GLBzG9HtN+DejEmpQPg3JAFLaQ==
X-Google-Smtp-Source: AGHT+IG3iVxfp4ue+UFXysXvz6DKi4QxLJqDrwxZD58TmfbCfjnNN1Hj7KqR62wJRNud2cz8gFthkm8XWf3losuWT5Q=
X-Received: by 2002:a05:600c:4e12:b0:43c:e8a5:87a with SMTP id
 5b1f17b1804b1-43d84fba8afmr37682355e9.16.1743081640372; Thu, 27 Mar 2025
 06:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>
 <Z+UDlXFKbmxCECp9@linaro.org>
In-Reply-To: <Z+UDlXFKbmxCECp9@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 13:20:29 +0000
X-Gm-Features: AQ5f1Jrcx5M9VC1f4LvGyufiYg8Yl8JGFp1ql4ekPmK5Li1CNGcCqmgS2hBtMTc
Message-ID: <CACr-zFBRC1ZGTqX_RDERk3k52hJ=kunN6Lw6Qs-5djttfTJ3ZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 LCD panel
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>,
 devicetree@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abel,

On Thu, 27 Mar 2025 at 07:51, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-03-25 19:21:27, Christopher Obbard wrote:
> > The eDP panel has an HPD GPIO. Describe it in the devicetree.
> >
> > Unfortunately I cannot test this on the non-OLED model since I
> > only have access to the model with OLED (which also uses the
> > HPD GPIO).
> >
> > I believe this could be split into two patches; one adding the
> > pinctrl node and one adding the hpd gpio to the T14s devicetree.
> > But I will wait for your comments on this ;-).
>
> You should definitely drop these two paragraphs entirely from the commit
> message. Maybe add them to the cover letter.

Of course; I will do so in v3.
But hey, it made you both reply, so in a way my comment did work ;-).

Cheers!

Chris
