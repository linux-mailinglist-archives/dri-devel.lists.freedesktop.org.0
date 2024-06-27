Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB3091A0F2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 09:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418CC10EA4E;
	Thu, 27 Jun 2024 07:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="izN6NA4z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B8D10EA4B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 07:56:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4247102da30so8262865e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 00:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719474963; x=1720079763; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zbRRYSMsE3x7jzz+DuxS0/G+PVyj8TpMxMrZCFeJdO8=;
 b=izN6NA4zgMZ3JFOvjpYLfvqw4Rxolf78oxVSQqu98LjribRC50dSMjioM/FmNJRx2q
 DmzlztxkKlv8N6U5YnkGWmklvkpKnpnNANEPc4Ag0n0BFHgWpz8zKvgdv+SZ92POWsCB
 HRXXSOrMFthOHoEooe9gheWFzxSf47CGLWvmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719474963; x=1720079763;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zbRRYSMsE3x7jzz+DuxS0/G+PVyj8TpMxMrZCFeJdO8=;
 b=EusGoZwXp61E5+Syu59tDR8gOx+JgAIbS8zHnkcUXkhA907vadI6ovpBbv9MCJedoN
 jBs5R5kfQ7aaQG3VRVCyzMsQ7lL8Y1/DKGYITW14RqeEODXpmTXShSoW/QlosoevMGa6
 WL33W6R7a2lxSKtTDYpY5dkxSoXGOUAfqAYLyFSlRobgHu1qwMidLQMRGGyRjNjhrDdw
 5599hklSep2MHOIBp5kjxVFvB6q96TLeIHDTiSlJkRVZaPZvzmLLqlkn5LgKLSprXMsb
 RuymyZQjtHS3JX5jFWWgXTf2wV+ySn73St7zFFe4AkF9U3NjyFVanAJXs3zoZ2Yi1H1F
 7gsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtxlLYUKPsKWSgLaTVApX96KgTMS92rUjJIKMGUJoGhaNPnSxqrPRx4Ge/tsV/Ml+6tKUuSU9Zh9TIFDoqt2vyW+UFcAH2yatNCdXvrdOv
X-Gm-Message-State: AOJu0YzAXqK8DlfBVveI3ey7OhcV1YCFzjpzuAmvBZ34AkSsvtAduZdM
 I20Gdg3VL6eJy36ZN65QyFwShkfEJeow7VcJSa86ehgewJ6CAeB48p2EhJtFUrc=
X-Google-Smtp-Source: AGHT+IGQvxwnr72q9jrzc9pPl4mSFg75qw0sFbnT2gJfss9vVHp2SS5JoT/Ulnrj/rNfl6IeiI3z+w==
X-Received: by 2002:a05:600c:5107:b0:424:7876:b6ca with SMTP id
 5b1f17b1804b1-42487ea6784mr111875865e9.1.1719474963385; 
 Thu, 27 Jun 2024 00:56:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c82519b0sm53017765e9.14.2024.06.27.00.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 00:56:02 -0700 (PDT)
Date: Thu, 27 Jun 2024 09:56:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: De-spaghettify the use of memory
 barriers
Message-ID: <Zn0bEMMam4_VPFoc@phenom.ffwll.local>
Mail-Followup-To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
 <20240625-adreno_barriers-v2-1-c01f2ef4b62a@linaro.org>
 <ZnvKa29EceUyZ62U@phenom.ffwll.local>
 <20240626212457.6io63avdbncuq6hb@hu-akhilpo-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626212457.6io63avdbncuq6hb@hu-akhilpo-hyd.qualcomm.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Thu, Jun 27, 2024 at 02:54:57AM +0530, Akhil P Oommen wrote:
> On Wed, Jun 26, 2024 at 09:59:39AM +0200, Daniel Vetter wrote:
> > On Tue, Jun 25, 2024 at 08:54:41PM +0200, Konrad Dybcio wrote:
> > > Memory barriers help ensure instruction ordering, NOT time and order
> > > of actual write arrival at other observers (e.g. memory-mapped IP).
> > > On architectures employing weak memory ordering, the latter can be a
> > > giant pain point, and it has been as part of this driver.
> > > 
> > > Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
> > > readl/writel, which include r/w (respectively) barriers.
> > > 
> > > Replace the barriers with a readback (or drop altogether where possible)
> > > that ensures the previous writes have exited the write buffer (as the CPU
> > > must flush the write to the register it's trying to read back).
> > > 
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > 
> > Some in pci these readbacks are actually part of the spec and called
> > posting reads. I'd very much recommend drivers create a small wrapper
> > function for these cases with a void return value, because it makes the
> > code so much more legible and easier to understand.
> 
> For Adreno which is configured via mmio, we don't need to do this often. GBIF_HALT
> is a scenario where we need to be extra careful as it can potentially cause some
> internal lockup. Another scenario I can think of is GPU soft reset where need to
> keep a delay on cpu side after triggering. We should closely scrutinize any
> other instance that comes up. So I feel a good justification as a comment here
> would be enough, to remind the reader. Think of it as a way to discourage the
> use by making it hard.
> 
> This is a bit subjective, I am fine if you have a strong opinion on this.

Eh it's up to you, but "we don't do this often" is a reason to make them
stand out even more. Similar reasons why cpu memory barriers must all have
a comment, to explain what they're synchronizing against.

Up to you if you just want a comment rule or make them stand out even more
with an explicit name (and still have the comment rule) that's different
from normal reads. Again comparing to cpu barriers, the nice thing is that
they're (in most cases at least, unless you do really scary stuff) very
easy to spot in the code and the ring alarm bells when doing reviews.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
