Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F294870E9C8
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 01:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AC710E559;
	Tue, 23 May 2023 23:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1CE10E559
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 23:53:12 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-77487fc1f16so33947839f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 16:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684885991; x=1687477991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uy/Z1ySOUfUShGzbWIcnHxdYF4h1eJNt1bs6mI3x3dY=;
 b=RMMu0iYjN0RH54dRbOjcYkiIGtPxVpoLdBriKl7PGlzeuo7IX93pv5wiUSpvxoZjF7
 b3CXGnhdl4fDegLk1UNt3KTOeC+JsO84kzFIx3LWF3/71uZScrrp0/c8QITENPJd6/Qp
 YQUNZFyPdLuN9qzqJ6W9AU9stXkaKH7SAn4LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684885991; x=1687477991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uy/Z1ySOUfUShGzbWIcnHxdYF4h1eJNt1bs6mI3x3dY=;
 b=fzTQ4LkyM1f7KtLtT4KOhs7UKuYJo+s2Qlnw0u7f65UYorBdNvUAioYfvSSMQbxFk3
 RUhNFPgqFneMx9hvdRk3FP6pPCZ0oNkWuFm4R0jFPjfhjTJU+w4J7ogtOrxWiCN/4jxV
 YRIDZEFUBgyg5Ay9i0BBwZxGkVcKyz7uz1M6WWV1UMsTuo1UhSlvlhfYTYl5KsdMWF5u
 toOws0gnXA75Yla4wfAlxp4VzlHQ0BBpd2lcqPdVjlmW0OLMr0aRzx389aSAVNqKhfzr
 KkhOU+lb+xeTRxHCNikbXQxy964Jn/vS5Kl7ZyTtutLgxDkBdO8cQDYy+7b7oyJFwrtU
 6S/Q==
X-Gm-Message-State: AC+VfDzrKGxVRjgJGsUhVc8XtQcrNJ7C/JSxnr0TKpyz9/CFa2uC5TPg
 w3It+5+LmqT1fwqta1bObaO5kGX/KAYrX7YX2Lk=
X-Google-Smtp-Source: ACHHUZ71UtCvntvCBYUY2rvX21yZ8B+fM2uI7uzjGTVSR7xTEhOd+8xqY4vWC3HEoimGIBYo/FeRTw==
X-Received: by 2002:a5e:a610:0:b0:76e:fd76:a207 with SMTP id
 q16-20020a5ea610000000b0076efd76a207mr11400628ioi.17.1684885990861; 
 Tue, 23 May 2023 16:53:10 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171]) by smtp.gmail.com with ESMTPSA id
 z16-20020a6b5c10000000b0076356c2d1acsm2803174ioh.52.2023.05.23.16.53.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 16:53:09 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-33a8f766b64so4175ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 16:53:09 -0700 (PDT)
X-Received: by 2002:a05:6e02:1949:b0:32b:7232:dac6 with SMTP id
 x9-20020a056e02194900b0032b7232dac6mr117857ilu.18.1684885989118; Tue, 23 May
 2023 16:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230523193017.4109557-1-dianders@chromium.org>
 <ZG0yjuNvhnircAxA@google.com>
In-Reply-To: <ZG0yjuNvhnircAxA@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 May 2023 16:52:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V6E_Rdrbk6SOHvaPwi=vJtRJagct71Q6TVV=ysUw5XCg@mail.gmail.com>
Message-ID: <CAD=FV=V6E_Rdrbk6SOHvaPwi=vJtRJagct71Q6TVV=ysUw5XCg@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm/panel and i2c-hid: Allow panels and touchscreens
 to power sequence together
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, hsinyi@google.com,
 Sam Ravnborg <sam@ravnborg.org>, yangcong5@huaqin.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 23, 2023 at 2:39=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Doug,
>
> On Tue, May 23, 2023 at 12:27:54PM -0700, Douglas Anderson wrote:
> >
> > The big motivation for this patch series is mostly described in the pat=
ch
> > ("drm/panel: Add a way for other devices to follow panel state"), but t=
o
> > quickly summarize here: for touchscreens that are connected to a panel =
we
> > need the ability to power sequence the two device together. This is not=
 a
> > new need, but so far we've managed to get by through a combination of
> > inefficiency, added costs, or perhaps just a little bit of brokenness.
> > It's time to do better. This patch series allows us to do better.
>
> This seems to grow a new way of building relationship between panels and
> associated devices. Can we make device_link_*() work for us?

If you know of a way to make it work, that'd be great. ...but I don't
_think_ it would be that easy. I haven't spent much time with the
device_link APIs, though, so please correct me if I'm wrong.

I guess my main issue with device_link would be that that ordering
feels backward. Specifically, the device we're acting on (the one
we're turning off and on) is the panel. We typically turn the panel
off and on at times (during a modeset, when the lid is closed, or just
if the system is idle). When this happens we'd like to remove power
from both the panel and the touchscreen. Userspace is just not setup
to power off touchscreens in tandem with the panel and sometimes (like
in the case of a modeset) it might not even know it needs to. With
device_link I believe that the "child" device is in charge of powering
the parent. I think that would mean that to use device_link we'd need
to make the panel be the child of the touchscreen. Then, I guess we'd
tell the touchscreen not to power itself on if it had children and
just wait for a child to power it on? It feels really awkward partly
because the panel doesn't feel like it should be a child of the
touchscreen and partially because it seems weird that the touchscreen
would somehow need to know not to request power for itself when it has
a child.

...if we're willing to accept the backwardness as described above and
we can find a hack to keep the touchscreen from powering itself up,
then I think things could be made to work OK-ish. I can try to
investigate that route if it doesn't feel too ugly. ...oh, except for
another problem. The initial power up of the i2c-hid device would also
be a problem here. I guess with device_link we'd need to put all the
power up work into "runtime resume". The problem is that upon initial
power up we create "HID" sub-devices and (as far as I could tell) you
can't do that during a runtime resume. :( We could put a special case
to power the touchscreen up before the panel at probe time, but that
could have other consequences?

If we don't go with the backwardness then I think we're a bit stuck
with some of the original problems. Specifically it means that unless
userspace knows to turn off the touchscreen that the touchscreen would
force the panel to never be power cycled. There's at least one panel
(the one on sc7180-trogdor-homestar) where that's known to be a
problem. It also means that we're back to drawing extra power if the
touchscreen is left "on" but the panel power is turned off.

Let me know if I'm misunderstanding.

-Doug
