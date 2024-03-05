Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3C872785
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 20:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E181112A72;
	Tue,  5 Mar 2024 19:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XzztDG0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45858112A72
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 19:25:41 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso772017066b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 11:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709666739; x=1710271539;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PI3ziWecqb71x1qdwv3LFcK01YCTBUMC8i/sCtMexTo=;
 b=XzztDG0jyh6MaGDJ7UQ3hwpzxA63pKSVe9pYZiTCy7+g9U176TmLwVFzmpHf2lF+pd
 aapRPWNJ6rtiz44TIoTwfB++FDOvlZUxbxOWQtwC/OCmLzrx9CLQsROLKRC+JR4dp+96
 SVTOmiOTMhejG0hOY/MUSXrUKtDnmcY0QMPPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709666739; x=1710271539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PI3ziWecqb71x1qdwv3LFcK01YCTBUMC8i/sCtMexTo=;
 b=GV/sMW9vh69zuWiHENb6dY0h4zlK28GVxj5v8iAqu0z/3sKV0VgR9plKmXACFRAPIO
 y6tu21j3KmcheMG9ReA6Hn93//fsgLPkIsQhRYelVVR7VE2lx9h30MsyyMzKsjDVYmGK
 RC0FAZUNMf13gqcQXapCTITcRnNx2dPt2EB39U7KgHsz6mgV41xRUTK+xt8V9vlfR8dJ
 kwQnNR+1cADT/kC/2+kEJfCNKFCiSpvsEmEGEaDbdA/H6cg6MrwYIJCSLPrnrvtDSNwU
 L/DOvuob8+Xq0KFLxZSnyH1EWeJUnDLtKN/utfYRcNpfSSa/LBTooPRS31ZWat6NjkFN
 CYCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUASCnutF3YLCLQYBKJt9jv3W11Mq0OUJdabFSIf9IHhxdKJ30DVG6B56FRPSv2QOuYrMv83mTpbqXh9k2pynFnJQRh4eYuqMqJxX8dr2Mm
X-Gm-Message-State: AOJu0Yzud7mCzCFbd6og585+Sjl0rPJcLMn++LfRlEStf2/6CsECDMpQ
 0z+L9VoKBeIUS79XJrUGTHpNIaCt5x5UF3TkgbGGolSzV/Sc9LvmCPfY1fzIPP5wwjMR+TFQX/h
 hDA==
X-Google-Smtp-Source: AGHT+IHadPJpYRcLtNuxIRYrI3eBbcXK0l23lJiziKyIhTjC0u8lB9PO/0/phInyLXyONvPyRo61Gg==
X-Received: by 2002:a17:907:367:b0:a43:6156:6e75 with SMTP id
 rs7-20020a170907036700b00a4361566e75mr8836832ejb.43.1709666738816; 
 Tue, 05 Mar 2024 11:25:38 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 ts6-20020a170907c5c600b00a443858cf78sm6372220ejc.185.2024.03.05.11.25.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 11:25:37 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-412d84ffbfaso12865e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 11:25:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUGR77gUayyNx3Aw+8moMMCx+IrY1LbEh6rIbTwNzvutFlZdqoP1IldBdvFLfW4ZxSLl7SHPTb/xDkXscH3uv8IW5wHGXOxlngc7YvhlPv
X-Received: by 2002:a7b:ce91:0:b0:412:d6be:a32b with SMTP id
 q17-20020a7bce91000000b00412d6bea32bmr209479wmj.6.1709666737510; Tue, 05 Mar
 2024 11:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20240304195214.14563-1-hsinyi@chromium.org>
 <20240304195214.14563-3-hsinyi@chromium.org>
 <87a5nd4tsg.fsf@intel.com>
 <CAJMQK-j4wGah=szyUW53hu-v6Q4QjgR7WMLKnspoFaO9oPfaQw@mail.gmail.com>
 <874jdl4k01.fsf@intel.com>
 <CAJMQK-iWHoh6s-hkcNULzZLjMg9UnTuWfjaJ=YfnHU3sQ1NBEg@mail.gmail.com>
 <CAD=FV=UOhTGnhtc9gOQ5C_aAdgVcB+K7NL9RGm4umunF91Wkpg@mail.gmail.com>
 <87y1ax2iu1.fsf@intel.com>
In-Reply-To: <87y1ax2iu1.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Mar 2024 11:25:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WzLLeEw-b0Kug-Pm-9EYm7eHvmukEUJ8VHnu-4YY3WNQ@mail.gmail.com>
Message-ID: <CAD=FV=WzLLeEw-b0Kug-Pm-9EYm7eHvmukEUJ8VHnu-4YY3WNQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/edid: Add a function to check monitor string
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Tue, Mar 5, 2024 at 12:17=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Mon, 04 Mar 2024, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Mon, Mar 4, 2024 at 4:19=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.or=
g> wrote:
> >>
> >> > > Probably change to u32 drm_edid_get_panel_id(const struct drm_edid
> >> > > *);? Given that we still need to parse id from
> >> > > drm_edid_read_base_block().
> >> >
> >> > No, we no longer need to parse the id outside of drm_edid.c. You'll =
have
> >> > the id's in panel code in the form of struct drm_edid_ident (or
> >> > whatever), and use the match function to see if the opaque drm_edid
> >> > matches.
> >> >
> >> drm_panel prints the panel_id info on whether the panel is detected or=
 not.
> >> https://elixir.bootlin.com/linux/v6.8-rc7/source/drivers/gpu/drm/panel=
/panel-edp.c#L792
> >>
> >> Is it okay to remove this information?
> >
> > Hmmm, I guess it also is exported via debugfs, actually. See
> > detected_panel_show() in panel-edp.c. We probably don't want to remove
> > that...
>
> You currently print the information via panel->detected_panel, which is
> a struct edp_panel_entry *. That doesn't change. It'll be slightly
> restructured to contain a struct drm_edid_ident, which will not be an
> opaque type.

Hmm. As Hsin-Yi pointed out to me offline. Somehow we'll need to get
the actual panel ID out. Right now in panel-edp.c we have:

dev_warn(dev,
  "Unknown panel %s %#06x, using conservative timings\n",
  vend, product_id);

Where "vend" and "product_id" come from the panel ID of a panel that
we didn't recognize. For instance:

  Unknown panel BOE 0x0731, using conservative timings

We need to still be able to print this message for unrecognized
panels. Then when we see field reports including this message we know
that somehow we ended up shipping an unrecognized panel.

Any suggestions on what abstraction you'd like to see to enable us to
print that message if everything is opaque?

-Doug
