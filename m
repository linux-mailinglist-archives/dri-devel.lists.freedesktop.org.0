Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15BC869CC6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 17:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76C610E4E2;
	Tue, 27 Feb 2024 16:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LGJf1XQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB38010E4E2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 16:50:44 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5101cd91017so6601381e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709052640; x=1709657440;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZiZB7SeymVQjyoZ3I3h+TPhPreTAgThGsE/ai3dA+w=;
 b=LGJf1XQemGxzaRPyoNZhglcdw55lzNUB4ZOpjG/mf+puXHQA7bI74YCquwErk6Hzg0
 iZM1bjHNv+qAz3uZ3esc0uwPAVrDgmLCrCDhrNTVaIPxoGOFXJj8gEaJVVkBNEGjYWsc
 ruMn995935JC9dv6zVXZsxZaxdt5MrU8oKQHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709052640; x=1709657440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZiZB7SeymVQjyoZ3I3h+TPhPreTAgThGsE/ai3dA+w=;
 b=qY9HFWg+u6ktXjL2p1vVCNJYH87nLhlfq37nQdeN0HuQhpQhqPcnJlLCyk3yiyqMzU
 MRyaEnbrrveghbI47FIz+KcLOrlqJwms1XnQZ9kNeGX6UBq7icIYxzJMH24bVt0bvC/D
 SbwKvOiMg6bZdBGvJTDncPyFhrRoTbtwDmSGigZ5sPX5K8JKgaRacd1GdfNBv4WdjKQH
 8onsrHXIvJMd1f8ewNtQ3hEuB3Yp4kI5kH9r9ncNRc93Usy5e8WAVm25P3BA0xZrTGVt
 G5I0WfxGQsbU3ODxCVeAz4Uct/zUE8qfsFuwMeKSicTqTCF3iIxFkd/1O31sPSQuT3Jo
 AL3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLxShiXmPL9XCltkTcH9Ufj3GWsm8bMVjvPhIpZQwdt3NsAkIp560PR1xIa66jcJJBurdFcNqU0/t1PzVKKSRbVD5hFpErG3/cE7w4gaZI
X-Gm-Message-State: AOJu0YwUfyX6Vj/7IpRwQ35cYYKIaVR5niFWjbUlaJfZA0mgsJquieu4
 S+8SX23Jnl11JUZyNJYq0K0uVhp1rGlvJy7GUkdjrYhigU4rtI74iroNg5nNwDjZnZ1yywp+vtR
 N8VPz
X-Google-Smtp-Source: AGHT+IGcuyN2TqKGAWk3+LKkYBDg+bZF8Zc9nYkxRF0JP5sCK4KU3/36/pjd8/1b9d68B2IQ1ESkrQ==
X-Received: by 2002:a05:6512:38c5:b0:511:4253:3a8b with SMTP id
 p5-20020a05651238c500b0051142533a8bmr6570844lft.42.1709052640215; 
 Tue, 27 Feb 2024 08:50:40 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 gy22-20020a170906f25600b00a3e88f99cf1sm938622ejb.149.2024.02.27.08.50.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 08:50:39 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-412a2c2ce88so72045e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:50:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCURoSxnFimfes7vLmyCctZnBkziIofL7FGhgrxjly22dVuVhIvAW/jQF6ajVB1PGm/+EZmTjUpDOa9O5NuTGtkL1uLEj8Q1wHRR7zdgForc
X-Received: by 2002:a05:600c:1e02:b0:412:b008:fe7c with SMTP id
 ay2-20020a05600c1e0200b00412b008fe7cmr90371wmb.5.1709052639020; Tue, 27 Feb
 2024 08:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-2-hsinyi@chromium.org>
 <87wmqqjmt9.fsf@intel.com>
In-Reply-To: <87wmqqjmt9.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 Feb 2024 08:50:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W+fRDOS01LKkeq-k12mj6jnFu5LOc9jAE3LA5w2ubo5g@mail.gmail.com>
Message-ID: <CAD=FV=W+fRDOS01LKkeq-k12mj6jnFu5LOc9jAE3LA5w2ubo5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm_edid: Add a function to get EDID base block
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, Feb 27, 2024 at 1:09=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 23 Feb 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > It's found that some panels have variants that they share the same pane=
l id
> > although their EDID and names are different. Besides panel id, now we n=
eed
> > the hash of entire EDID base block to distinguish these panel variants.
> >
> > Add drm_edid_get_base_block to returns the EDID base block, so caller c=
an
> > further use it to get panel id and/or the hash.
>
> Please reconsider the whole approach here.
>
> Please let's not add single-use special case functions to read an EDID
> base block.
>
> Please consider reading the whole EDID, using the regular EDID reading
> functions, and use that instead.
>
> Most likely you'll only have 1-2 blocks anyway. And you might consider
> caching the EDID in struct panel_edp if reading the entire EDID is too
> slow. (And if it is, this is probably sensible even if the EDID only
> consists of one block.)

That makes a lot of sense! Not quite sure why I didn't just read the
whole EDID in the first place when trying to get the panel ID.

-Doug
