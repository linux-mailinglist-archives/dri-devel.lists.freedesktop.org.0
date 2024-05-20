Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A2F8CA071
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 18:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612A810E1B1;
	Mon, 20 May 2024 16:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kkL2bKW9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EE210E1B1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 16:08:15 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-792b8bf806fso252008085a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716221294; x=1716826094;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/kGm8BVTegBDF6ZtCbDHbkok7PhmOjbef+2E72+mzc=;
 b=kkL2bKW9kQnSr1vQ32zgwv4DLCxAuPe8FchMnAWOLXfyYjF3/6LE7EEPEBH5bmr9Nr
 HjvX/G9b0nykeiw8itt0f1/3kYw7xrQWHxjfWHDU96dZ9I0khcfK8n3sTx+oB7zoq3FN
 ph8Fc0cVN1jBz5LCtngm7bdXuzInSCuJuBcno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716221294; x=1716826094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/kGm8BVTegBDF6ZtCbDHbkok7PhmOjbef+2E72+mzc=;
 b=anQaRvXmsK4kQW5SF297afUy46wP3V/9AkjvQ93tp/hv9nng4Tkn6ilDhqT6kByOZ7
 6RyzWzhZiY8Dskt/+tgTU0jV21Fsy9G472vhOb2hRl7487MSKgTbKUwOmdFf7VN9ASzZ
 qu78gU8pMRsNepFtetn/f88Z29aTvCHuxxxgT7Q05zztVaUsHv0WZl8M1ogAG0LnkQuM
 hwjUDsIY2avt+tyHxg3oZp/IQWlTcnd/U1i9BcBNBbabR6IiYjEcvqaveGQH5gMogCAe
 dyyx4GtGcfl7ubXuXhMyITx9v3Q0RnS4noOQZCEc58Ex9PuM5C22mitHt2pMH8HbVB7S
 Qwpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnz7qUQkkjxLkD3zwJKHhp5sZfFU5NqqLMjODBGGuqXbqLJDla41nbE0IArbKm6tcexQN0V9GuwFCWrivfuC/HKS1arbPiSA+Sf0QXaU4U
X-Gm-Message-State: AOJu0YxGulvExWIi+vfS3IA6YtslpnQ6DIAGglGBzToQcWQMJYyL0jV3
 D5F8KSsLGOMYAKZCwS9aNiEvCj5h2AApTl8c2f2MqFEHIeuk4ZVldfx7HpZ/N55tGVx0vt/Bp4w
 =
X-Google-Smtp-Source: AGHT+IFI8fgpdBLf5BwNcCtiVKMjJ94+4MgkoJFJX4lHXjp/6PYlUX4nwUXR66GV8xhHg6v2jx8H5Q==
X-Received: by 2002:a05:620a:3c6:b0:792:ba9e:d730 with SMTP id
 af79cd13be357-792c73d1179mr3241774685a.0.1716221294082; 
 Mon, 20 May 2024 09:08:14 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79300c478ddsm523274685a.117.2024.05.20.09.08.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 09:08:13 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-43dfa9a98d2so291991cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 09:08:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWaawGsttp8sejiFBKgezPZ5Wgu/OZmdpqitwoHyUy66oXQy+p97yjSJoVq4oyThbK5OCcul5rJ1wahVuc3ia6ABO47o3JCt4upIOw+16gt
X-Received: by 2002:a05:622a:820d:b0:43f:7b35:c5e2 with SMTP id
 d75a77b69052e-43f7b35ca1dmr3103541cf.16.1716221292824; Mon, 20 May 2024
 09:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715691257.git.jani.nikula@intel.com>
 <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
 <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
In-Reply-To: <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 May 2024 09:07:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgpD_JqxpVezZ=RzudwxLJb+gN3Br8U03ONLGv9n_JmQ@mail.gmail.com>
Message-ID: <CAD=FV=XgpD_JqxpVezZ=RzudwxLJb+gN3Br8U03ONLGv9n_JmQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Sun, May 19, 2024 at 2:01=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
> > Prefer the struct drm_edid based functions for reading the EDID and
> > updating the connector.
> >
> > Simplify the flow by updating the EDID property when the EDID is read
> > instead of at .get_modes.
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > ---
>
> The patch looks good to me, I'd like to hear an opinion from Doug (added
> to CC).
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> What is the merge strategy for the series? Do you plan to pick up all
> the patches to drm-misc or should we pick up individual patches into
> driver trees?

I'm not sure I have too much to add here aside from what you guys have
already talked about. I'm OK with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
