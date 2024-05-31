Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42A58D66AE
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 18:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0476B10E033;
	Fri, 31 May 2024 16:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mZaj4bNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597A910E033
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 16:21:19 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6aedd5167d1so3173236d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 09:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717172477; x=1717777277;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=siXueITpdXmllfrhOnciz2l6HSxbQMeuCE6GtcEy6a8=;
 b=mZaj4bNF8banFiW1CCxSpBfzsAOTr0pDMhfuIrldklt7w2hzs1m4bKGvsHQekunDpy
 PhV984UmHlG99Va8ckatgqmp1HEgwAONrJKDWqo/OBB8eeaZhRxySTCcCfeobRW6dmcg
 eY8qJ++bMUEHd9iedHA6wr1GtFtDZ37McQAVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717172477; x=1717777277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=siXueITpdXmllfrhOnciz2l6HSxbQMeuCE6GtcEy6a8=;
 b=aDNwwBlgZBFXX2OIbTMwKlCk0xquAzUMJwTBourPkHRwLZcIQujQEWFK4WCeFYjki2
 +3p0rH/HG8kSY/FKsdjyBWSc6cawni8rlqYe7UoxurDu7iRC3HSXwxLfEF2YWe8AzBM3
 8c0DwmganP+anFtzNsp30tR004dDve2HNCLbxiPAIGA/ozIPbfERtr+0J8M07SRnIqMN
 7umZ6OQI6Tym+d47pOrfRXAupmo7+nhUcon/X6RW+o7r0Uo+v2gCrRlTReu93U+v/ZiN
 F32+0GLoe1pcL6R6FzVyyNZS48crbMfVkOm+D8ZJqob2x3Amgf97YQAWsy/zxNzRYyUl
 PprA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUv3b++DtNgIhMn2g843B2oX0bxEDx4FH8bEnhTR+6WivO7pp4ZN0sD7CY5xo++Y1uLHM7YhDlPMB2AK0SUfD7+zyGyEMRpvy4gsdOCc4I
X-Gm-Message-State: AOJu0YyzQV55flsporxlBMfTykieENr5lozTqDjdWpVh30pz+V9VK60h
 SG+AK/nkcU8K8p89UR6dLmH2jqXZaOpGR+TLBhM20RQ1xtJr9IZ8d2eRufJFP3mraUFc8uQeQ22
 1LZfl
X-Google-Smtp-Source: AGHT+IE4b1oUtxtP8DGPQPf/pjN2XfmpAep1FJHi6hw6XN1DZ/R7/QS9qnfnPhFCsWGPxAALAJ+vDQ==
X-Received: by 2002:a05:6214:568f:b0:6a9:bf6d:27f5 with SMTP id
 6a1803df08f44-6aecd56f0bdmr17606076d6.6.1717172476481; 
 Fri, 31 May 2024 09:21:16 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ae4a7463b0sm7574816d6.35.2024.05.31.09.21.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 09:21:15 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-43f87dd6866so435681cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 09:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQOygwP+JAsTQEAzwQ9U4aBKS7LJZq111hZcNzZ1QSCN/1Ow+N63AqpMzSTM/1fNZCYwDMymM5tgWwB031h0nvJ88g85FL/pDkhIH6wt80
X-Received: by 2002:a05:622a:4a14:b0:43f:b19e:d3ba with SMTP id
 d75a77b69052e-43ff2c5399bmr3052241cf.8.1717172475232; Fri, 31 May 2024
 09:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
 <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com>
In-Reply-To: <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 May 2024 09:20:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xcq-p5OxSnDJVF-Wp88ZfXOaOKJmh941ymy-f0wkhdhw@mail.gmail.com>
Message-ID: <CAD=FV=Xcq-p5OxSnDJVF-Wp88ZfXOaOKJmh941ymy-f0wkhdhw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
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

On Fri, May 31, 2024 at 9:18=E2=80=AFAM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> On 5/30/2024 5:12 PM, Dmitry Baryshkov wrote:
> > There are two ways to describe an eDP panel in device tree. The
> > recommended way is to add a device on the AUX bus, ideally using the
> > edp-panel compatible. The legacy way is to define a top-level platform
> > device for the panel.
> >
> > Document that adding support for eDP panels in a legacy way is strongly
> > discouraged (if not forbidden at all).
> >
> > While we are at it, also drop legacy compatible strings and bindings fo=
r
> > five panels. These compatible strings were never used by a DT file
> > present in Linux kernel and most likely were never used with the
> > upstream Linux kernel.
> >
> > The following compatibles were never used by the devices supported by
> > the upstream kernel and are a subject to possible removal:
> >
> > - lg,lp097qx1-spa1
> > - samsung,lsn122dl01-c01
> > - sharp,ld-d5116z01b
>
> Ok to drop the sharp one I added.  It should be able to be handled by
> the (newish) edp-panel, but I think the TI bridge driver needs some work
> for the specific platform (no I2C connection) to verify.

Is the platform supported upstream? If so, which platform is it? Is
the TI bridge chip the ti-sn65dsi86? If so, I'm confused how you could
use that bridge chip without an i2c connection, but perhaps I'm
misunderstanding. :-P

Thanks!

-Doug
