Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3BB880486
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 19:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7281310FAA6;
	Tue, 19 Mar 2024 18:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="i2+/80of";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14D210EE97
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 18:16:07 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-42a0ba5098bso34624641cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 11:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710872163; x=1711476963;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TY3JC7lCg0J0NbLsthogiU7IlW38IYTYvI5MHCluIsY=;
 b=i2+/80ofZVtM05BkXt7ArvMgWjgEDj7XdQnffN/OXp24El3n/5eG5SGqa+btqBBT4B
 ErpGd8iUmQx8yEL5OtB+63GKL4b3TIXQdQFCQxuxySJmmQ8gq4siXjHvyBacUqvd1FXo
 9kUZ6fPAHISKaPo1up2ewi7lo3HUQdT0qmkIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710872163; x=1711476963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TY3JC7lCg0J0NbLsthogiU7IlW38IYTYvI5MHCluIsY=;
 b=SyOlbNEhru9nom8PKoXT96rvQz3RS+3VE5uHfSHYEYKLWMmzpWxKO+f8dwkw6MFsJ2
 EXd2yqi1TdOhbG6KzNM15k3eTQ4nQmzFoGzJ1Xbg1KdiD2fP+fHT0p50XVZSj2zkXC8d
 1DXonJbjeRzfaYi8UEiCezj39PZUXdLLj0rLEqij+x8F3S3LAANtpUPe+h9fk5Zyzngw
 IrgQoy345ClwzWGPmtRa50Fyio8UiZrSoz3sNH0jOD6xaNig0OQGMXvQJgh+WhGYVuxE
 6TFszGocB6DM+zmuTHtehkx/0UIiBMw3H36/GanojwDqVXTNCK6mxQsUUo1rtMJUfHB0
 rZ1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTJVtxkZzIQ7Nrdbdts/DRBCuHwBMwXU1OzBAr3+YA7nsDIdeOugyWyZuXSncpIKTqSKQVLMkzQSFavhs6QgwyQJ5XQwZMxuc5XWQkt6f+
X-Gm-Message-State: AOJu0YwotY5UeiKqhNDtftAarrhXsRBhfpzDwTZCQ1W879g8FPQgbCxp
 E3iV05g6TcYDR7VyUp0Rwi94EnWaJvHdfqUNhRujyFL0BdVtbg+zUWtH66Qqu0jPd8R4+xtXhww
 =
X-Google-Smtp-Source: AGHT+IE8f5O9q7pgcFhpnyAbrfDMnZ0wW6NM0DaAntOwV363Ky3WB7SRNkNT9ksdb1O9Bbj/s+9P/g==
X-Received: by 2002:a05:622a:1909:b0:430:d2ed:3bbe with SMTP id
 w9-20020a05622a190900b00430d2ed3bbemr3763414qtc.59.1710872163496; 
 Tue, 19 Mar 2024 11:16:03 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 ex9-20020a05622a518900b00430bcec5432sm4154988qtb.85.2024.03.19.11.16.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 11:16:03 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-428405a0205so42621cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 11:16:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCURE1DFj3wYox+9tG257jelBPvfmTCXHxmBQGFZBlnIHXWqe3SDpNSJQbxhdEL+9r7InEhSE+qBpGiv48F3+u6n39zZdNV16g5LUOV/mH4k
X-Received: by 2002:ac8:7f0d:0:b0:430:ed72:bc0d with SMTP id
 f13-20020ac87f0d000000b00430ed72bc0dmr39379qtk.26.1710872161807; Tue, 19 Mar
 2024 11:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
 <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com>
 <CAA8EJppau--vt3RLkH96K0SF2x-QGWz+5U8tErvLFDvz-GQN4Q@mail.gmail.com>
 <d04711c1-6df0-f988-9227-2161f4109dd1@quicinc.com>
 <CAA8EJppcuftv4hfKkZeaXCDQJ4Z5+8-P99wHc9X8WgYJbk6CjA@mail.gmail.com>
In-Reply-To: <CAA8EJppcuftv4hfKkZeaXCDQJ4Z5+8-P99wHc9X8WgYJbk6CjA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Mar 2024 11:15:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WMbqmU1q+6hJZV9a16PdPUtdDJuMmsQ1wb27jDdeQFmg@mail.gmail.com>
Message-ID: <CAD=FV=WMbqmU1q+6hJZV9a16PdPUtdDJuMmsQ1wb27jDdeQFmg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/dp: Delete the old 500 ms wait for eDP HPD
 in aux transfer
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Johan Hovold <johan@kernel.org>
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

On Tue, Mar 19, 2024 at 10:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 19 Mar 2024 at 19:13, Abhinav Kumar <quic_abhinavk@quicinc.com> w=
rote:
> >
> >
> >
> > On 3/18/2024 5:55 PM, Dmitry Baryshkov wrote:
> > > On Tue, 19 Mar 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.co=
m> wrote:
> > >>
> > >> +bjorn, johan as fyi for sc8280xp
> > >>
> > >> On 3/15/2024 2:36 PM, Douglas Anderson wrote:
> > >>> Before the introduction of the wait_hpd_asserted() callback in comm=
it
> > >>> 841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
> > >>> drm_dp_aux") the API between panel drivers and DP AUX bus drivers w=
as
> > >>> that it was up to the AUX bus driver to wait for HPD in the transfe=
r()
> > >>> function.
> > >>>
> > >>> Now wait_hpd_asserted() has been added. The two panel drivers that =
are
> > >>> DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: T=
ake
> > >>> advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
> > >>> 3b5765df375c ("drm/panel: atna33xc20: Take advantage of
> > >>> wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
> > >>> wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
> > >>> ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There=
 is
> > >>> no longer any reason for long wait in the AUX transfer() function.
> > >>> Remove it.
> > >>>
> > >>> NOTE: the wait_hpd_asserted() is listed as "optional". That means i=
t's
> > >>> optional for the DP AUX bus to implement. In the case of the MSM DP
> > >>> driver we implement it so we can assume it will be called.
> > >>>
> > >>
> > >> How do we enforce that for any new edp panels to be used with MSM, t=
he
> > >> panels should atleast invoke wait_hpd_asserted()?
> > >>
> > >> I agree that since MSM implements it, even though its listed as
> > >> optional, we can drop this additional wait. So nothing wrong with th=
is
> > >> patch for current users including sc8280xp, sc7280 and sc7180.
> > >>
> > >> But, does there need to be some documentation that the edp panels no=
t
> > >> using the panel-edp framework should still invoke wait_hpd_asserted(=
)?
> > >>
> > >> Since its marked as optional, what happens if the edp panel driver,
> > >> skips calling wait_hpd_asserted()?
> > >
> > > It is optional for the DP AUX implementations, not for the panel to b=
e called.
> > >
> >
> > Yes, I understood that part, but is there anything from the panel side
> > which mandates calling wait_hpd_asserted()?
> >
> > Is this documented somewhere for all edp panels to do:
> >
> > if (aux->wait_hpd_asserted)
> >         aux->wait_hpd_asserted(aux, wait_us);
>
> That's obviously not true, e.g. if panel-edp.c handled HPD signal via
> the GPIO pin.
>
> But the documentation explicitly says that the host will be powered up
> automatically, but the caller must ensure that the panel is powered
> on. `It's up to the caller of this code to make sure that the panel is
> powered on if getting an error back is not OK.'

It wouldn't hurt to send out a documentation patch that makes this
more explicit. OK, I sent:

https://lore.kernel.org/r/20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d=
94f5b6b41@changeid

-Doug
