Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6FE9370FE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 01:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D6C10EB3D;
	Thu, 18 Jul 2024 23:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hw0S884v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED4110EB3D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 23:09:44 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-7035c367c4cso677694a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 16:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721344181; x=1721948981;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yWUpRwE/EDS0n+s4NT6R/Wf+x8/oxyYVaNKMw8i5CCg=;
 b=hw0S884vAlUnGXKxQyE2Y7UZ/vlRLLsM/sZpFqzN+ACH5t0XNnepo8ea4q7b7Fv7Ex
 28iMJtUeJp8hkgTQY8vf8AIuMcYgqDBQPsJIXdnsCr/jIjOtKILNU56tRFtjYqz10Nj0
 Gv8doF0skiexAlw72xjPSTuSVaJAeePnEnEOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721344181; x=1721948981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yWUpRwE/EDS0n+s4NT6R/Wf+x8/oxyYVaNKMw8i5CCg=;
 b=iZwoJ6aMnwn2R2ENujxrGhz2UYMQhoqs4gAvb07auKuH+kNJJUUzgNW0nV/URiFBL8
 kKEzYr/9h5Op7+D2PEM7WBnnGHuQaYe3F5F3vX4IW8d7rCsep3lFmSNS5hcuGswxZtlU
 /BQndyWfD8+3WIdVBuGBoxaXqSqs9D16NgLBonwv6gBoj4TgFGXUbltJbkqSqPc9YDsV
 quwEyr+RKNPD1XmVVqLQ5blPEJ1cKXFc5fw+xsAbuusv6+0i4dBhX2T/M1IOWlcl8Ki3
 Bym9lzaEoeSkD//T51XV859JR8h2w6paJKl81HNrE6EmdRlkbUvkKCoyc1sjsST05d1j
 edmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdQtaPWOWJRKSXmMW6r9Ph0PfdOxOjrs8bNOQdeSXXTU6pbOlVZOg8a3TCkVw/G5IKoXhI3EG+hXQVwWEGBfcLI0EXDSYdxVTPeoGcK6PX
X-Gm-Message-State: AOJu0Yybs++92ve4iuJNgYkJim2t1GQ4tTBb7/kXtMJrsJOwpU+rNTD4
 MZcc3JPwo49WYMbxutPaaA/b1BxoJm4YQcmVFOC+xFFzXKXepdMIoxnbRaIPhWDUSBVpfDynb/c
 =
X-Google-Smtp-Source: AGHT+IGf3TA5Nhm7HKcs6/wRWYTqLwLvsj/NioYs174U17QTODxMHtxsEkaIdo+de0XJOLfn6NzREA==
X-Received: by 2002:a05:6830:f95:b0:704:b695:9557 with SMTP id
 46e09a7af769-708e37a74d7mr7735429a34.16.1721344180967; 
 Thu, 18 Jul 2024 16:09:40 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a199078357sm10354985a.107.2024.07.18.16.09.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 16:09:39 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-447df43324fso65811cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 16:09:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQx8pwqf9i0i+BKYU7pc6ZGqyeTd77TKIaKaQACmqEvYNbH1d9Jk+4VuAgl5hrNaTM9Ibuz+bYjbCkU1kLpoV0y7mcJfBsGc/Z+sVNX6DL
X-Received: by 2002:a05:622a:5509:b0:447:e8a5:fb27 with SMTP id
 d75a77b69052e-44f9c86fd18mr443831cf.25.1721344179138; Thu, 18 Jul 2024
 16:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240718184434.6307-1-robdclark@gmail.com>
 <fnoc5jhpu5gwkfufm4cyyn4cjhh6dtw2if3jukk7t3tyvdwesv@pmr4j3vfgpjt>
In-Reply-To: <fnoc5jhpu5gwkfufm4cyyn4cjhh6dtw2if3jukk7t3tyvdwesv@pmr4j3vfgpjt>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jul 2024 16:09:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VURWwyLB-VZEpB3JNt-ODyxWtXZnV33GA7JkP5AGgN-A@mail.gmail.com>
Message-ID: <CAD=FV=VURWwyLB-VZEpB3JNt-ODyxWtXZnV33GA7JkP5AGgN-A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robdclark@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
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

On Thu, Jul 18, 2024 at 2:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Jul 18, 2024 at 11:44:32AM GMT, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> > existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/samsung,at=
na33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atn=
a33xc20.yaml
> > index d668e8d0d296..284a4ee79bbf 100644
> > --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc2=
0.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc2=
0.yaml
> > @@ -19,6 +19,8 @@ properties:
> >        - samsung,atna33xc20
> >        # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> >        - samsung,atna45af01
> > +      # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
> > +      - samsung,atna45dc02

Please follow what we decided in Stephan Gerhold's case and use a
fallback compatible. In other words: your patch seems to be based on
his v1 and not his v2.

> This makes me wonder if we should define a cover compatible like
> samsung,amoled-edp-panel.

I will bow to the wisdom of the DT folks, but my understanding is that
we shouldn't do that. The fallback compatible can just be the
compatible of the first panel that we supported that used the same
interface.

-Doug
