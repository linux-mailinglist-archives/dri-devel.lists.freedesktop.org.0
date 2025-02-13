Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCECA333CA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 01:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879FE10E338;
	Thu, 13 Feb 2025 00:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A3Jq0Idl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C965710E338
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 00:07:18 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so304105e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 16:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739405237; x=1740010037; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pf8gs00/4/9w7W7B+PluDcVXqKZN7oOLtPqkB411rw0=;
 b=A3Jq0IdlAhSidcHWQUIn8RlqNDiv/F7C8R0d+9YE0onuyn4jGgMKpEyZdMnwxO8eBZ
 QExABs1HRI9gk5cqpdT9fzkjWrtuUvbyh5cuCxLkA3UA9aU122sQRzoyNMneDMLW3jhJ
 F4n1JXYarSylCu5N8rAy181Pnn5x5xHaCyAR4AYd1A5QUOrcgKiPwwZrY8bhTBj4m3Qw
 Mf1SzjAerjMKYkOnwP5sUKFhRHxEEuUJwQ7q8hx1Um6Ecgea9GJXMOTXRIyWBO/OigK1
 BKK7LW/tiaMMkvFNwqqeydXesjHUw4mDl7sJkfjbpSOEKNt7hxiO5uBcjVCESsunH8mY
 Iyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739405237; x=1740010037;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pf8gs00/4/9w7W7B+PluDcVXqKZN7oOLtPqkB411rw0=;
 b=xQ3TQ8j5IGuv3AeZpya8l67EMD7Bc6ZgZSFOPAbXMmdSTlOTQKiZkHzZ0K7jKceJeA
 gtd/fGv8VgfIcHrNKnWLxQEk8qmJ3KwJ0b37bAN1QZZ6z8BYrsOv62tU9/X+wyu6AkvY
 /lgImaAj1KX+0/9HnMsSg5Hub8pgJCGRziK57qWj4BJTDUs1pY2HmcT6uOAXt6QnOfuV
 ldFt0cuQA47UpAMsfPNOljc+Kt/VGu/r8Z2LZcuQR2xSru1z81dlCXZ+qPIgklOw6fla
 QACdz9RUtLws7a01esZFGFsVmBJ2oWXA4URow/qOh2qIllF0n2fXkVMNlrxxHJ5iqnH5
 DR3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjIEwi/H8kAZ8I1l3hZrVH7qH95KuSyaI0PO0YVgDBIihhO4YJcbHXR1JepxNgyhiI47H3VJTcXKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZSM9YBMMdcYJhyfJc2IF489iqfviEvVdgOvepm7r+SBu6LsaK
 8nfvSiGDmhtx6liPhb/+VkWnKO+G+yUnjYrDLZTkr3u7yplopeQdzgm6ZRvt5Kg=
X-Gm-Gg: ASbGncszhYAcm02futvNKtoALiKzyz00Ik4tUbtl4LMzDm4AM1H8Zqgev+C3/aJuxAM
 IjBZTKKjuDvzPXtuqEoX4JjslCvcuySLC6+ezDh7OeiPxxn5xaqHwYtb9uBF73SlJimmkayzmg7
 UtXKGbwruuomXXfmeRkz7Q5eI4r7At58W9gwhcOJ629a0SnBJ2HHVtErVYox8mJZ9kNKzl9IXxK
 D0yRJ2gs581vVLE2yOpe8Ow+fauagj2TjibijatxfR5mI/VRpuuZifp45K/bXhF+Vvhp75MV39v
 beTEwECSGKIcWEX0MNLgkyvqdBl671BJ2sbMB68937t1dOhFiLdfMRzOoyXsS15kEoPgFjI=
X-Google-Smtp-Source: AGHT+IGgaIb79GOenbsc3e1MUpq7bHd0RnhtaMAeeGwuUeOTEKM4SryWszGVytnTQkm7zU/gnhk9pg==
X-Received: by 2002:ac2:4e95:0:b0:545:fdd:9ef4 with SMTP id
 2adb3069b0e04-5451e4f0750mr213183e87.8.1739405237077; 
 Wed, 12 Feb 2025 16:07:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105cdcsm13282e87.116.2025.02.12.16.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 16:07:15 -0800 (PST)
Date: Thu, 13 Feb 2025 02:07:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
Message-ID: <g2md3uz34tv7atlxm6cvkdwa35pjulwovmlyj4ausoson7wrkw@vjvfpcaejrck>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
 <87tt9pn8uu.fsf@intel.com>
 <7unkxysvdn57fp6t7sjmgqsiacg5grbrk4lp3fbfdvaht3hq4o@gqshn45sa5ww>
 <Z601HHdh2Zn62skU@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z601HHdh2Zn62skU@intel.com>
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

On Thu, Feb 13, 2025 at 01:56:12AM +0200, Ville Syrjälä wrote:
> On Thu, Jan 23, 2025 at 01:05:47PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 23, 2025 at 12:05:29PM +0200, Jani Nikula wrote:
> > > On Fri, 17 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > > Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.
> > > 
> > > This might be one of the few places where the old functions and the old
> > > return value was used in a sensible manner.
> > 
> > Well... Yes and no. What does it mean if we return less bytes? Is that
> > still a protocol error?
> 
> AFAIK short AUX replies are perfectly legal accoding to the DP
> spec, but we've not really seen them happening in any real
> use cases I suppose (although I'm not sure we have sufficient
> logging to tell whether something failed completely or only
> partially), hence why we've never really handled them
> correctly.
> 
> For aux_dev it might matter more because the common use
> case is to just dump the entire DPCD, and some displays
> violate the spec by having black holes inside the DPCD.
> What I don't rembmer is whether those black holes actually
> result in short replies, or whether the entire AUX transfer
> gets rejected when it hits one even partially.

I see. Let's keep the old interface just for the dp-aux-dev and make
everybody else switch to the new interface. This might complicate the
patchset a bit, but it seems that's how it should be done.

> 
> The other concern with not handling short replies correctly
> is that writes (and even some reads) can have side effects.
> So when a short reply arrives we may have already triggered 
> some side effects while still claiming that the access
> completely failed.
> 
> I suppose if someone was sufficiently motivated they could
> try to handle short replies more correctly and keep retrying
> the remaining bytes (assuming that is the correct way to
> handle them). Although with those black holes I guess
> you'd eventually have to give up anyway before having
> transferred all the bytes.

-- 
With best wishes
Dmitry
