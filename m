Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E443A8686B9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 03:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35C010E84B;
	Tue, 27 Feb 2024 02:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h8cmviwP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C0810E84B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 02:18:41 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc6cbe1ac75so3103785276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 18:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709000320; x=1709605120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/0cvRHoeBDj4WwAVW0/51nHWj3Sa52fkTHqCjmTzTQ=;
 b=h8cmviwPV4Sb1h7r0m7NehVGHyQumCe6zdSGkiGyB3X/WOlxJMDY3JStwdB5F+cWA/
 CqCd1Bai6OaYeRvwaVUpmMqPjbhs1xjxeve4AAP3pC6QjtlXpNj8rc8d5sJxZDfz4y4O
 2jLeP4+kdvh9aWhdVfyykz35uElPK52FWphNo6A5HgjAnQ7pHZAnFxC6iHOZjHP0GtsB
 /O4OR/L3TGOi/aIGapSdIWqcP7EPa7AGLzwLk7subkPWeAZIUCjTrLiRwpyWW77nALou
 uSHMvWnVJLxSWVVrzePdVVIDY1SAManz/Am9940+cbl4dJzr1jKPXZHkSB3Up18IbqLc
 1OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709000320; x=1709605120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/0cvRHoeBDj4WwAVW0/51nHWj3Sa52fkTHqCjmTzTQ=;
 b=v3p1VUaijABpG74tZV00Xfd6roxSORo4NpH2HtQ8vbd/SiIa/GeWB+m/6328Ae2jFl
 iPHyW7Gw+zjVgzmoq6V99h21bQc9iBhAbsn95AeNeLrZDULpAYml9rlPnV+A2B1GtkUF
 GYo7A0T26pGhBFlnEdqU1j7OP/fNVpNIAzypQvLIDtUj35+Rb7tzzI8Jo4c4qar005Vu
 DbHlcfbYVpDKVETll7VgnayII2BhdOppPEPXrxqva3VvtfiYqne/u1Qg53oQrHST7MST
 v75rpQt4TccHtc5/nOh1CAKQWAqxzERDB4g0wQBbRiX/OSdvnTfemrDNXFvQzsDzUt6j
 8VDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlbsiwgsDNc9IqZY9CaC5U2wLIZco5CTwWmEZZSNcL7cjkWUBXAujx8Lz7ctwE1tVRCPatfieOgcRIsOJuAZey2BBtGGPe4NcYAk4NX5ra
X-Gm-Message-State: AOJu0YxOXo0KCVMMFl+FXeMAWfCn4+HHL2sUVlzSAOcV9QFwkMkKh4il
 ZVomX11TueOBtKal8MIsO+sJ0xjgsLIPKqGCCuEJ43aNhssSNdEeU143U51l2U5CgLT2jtxbSKY
 1j7x6QwbWfglq1p9ZcSrhBrB+ISzCgXBAbETeBg==
X-Google-Smtp-Source: AGHT+IEcmheK8V87a+vvv/FdIjCu0EFJdE0B0tDEQcJVpBAHV8SGp9so8ZQQFLEoUEmqaLeQ7wW8GoVhlVhZcXH7lh4=
X-Received: by 2002:a25:680a:0:b0:dc6:ab85:ba89 with SMTP id
 d10-20020a25680a000000b00dc6ab85ba89mr671508ybc.25.1709000320490; Mon, 26 Feb
 2024 18:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <CAA8EJpre_HOY1xzOZPv5gPiJ-kEZEJiEm8oyYzXTiPj66vY8aw@mail.gmail.com>
 <CAD=FV=WjZZfHBdMVG3R_iT9bskP3AyHrRsSK6Hfw9h4tEZBHFg@mail.gmail.com>
In-Reply-To: <CAD=FV=WjZZfHBdMVG3R_iT9bskP3AyHrRsSK6Hfw9h4tEZBHFg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 27 Feb 2024 04:18:29 +0200
Message-ID: <CAA8EJpoyahPpwYdS7rLFfwcwF9Bn4gcx1VssDcnZ+suUT-ua5Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Match panel hash for overridden mode
To: Doug Anderson <dianders@chromium.org>
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

On Tue, 27 Feb 2024 at 03:00, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Feb 26, 2024 at 4:37=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Sat, 24 Feb 2024 at 00:40, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > This series is a follow up for 1a5e81de180e ("Revert "drm/panel-edp: =
Add
> > > auo_b116xa3_mode""). It's found that 2 different AUO panels use the s=
ame
> > > product id. One of them requires an overridden mode, while the other =
should
> > > use the mode directly from edid.
> > >
> > > Since product id match is no longer sufficient, EDP_PANEL_ENTRY2 is e=
xtended
> > > to check the crc hash of the entire edid base block.
> >
> > Do you have these EDIDs posted somewhere? Can we use something less
> > cryptic than hash for matching the panel, e.g. strings from Monitor
> > Descriptors?
>
> We could try it if need be. I guess I'm worried that if panel vendors
> ended up re-using the panel ID for two different panels that they
> might also re-use the name field too. Hashing the majority of the
> descriptor's base block makes us more likely not to mix two panels up.
> In general it feels like the goal is that if there is any doubt that
> we shouldn't override the mode and including more fields in the hash
> works towards that goal.

My main concern is that hash (or crc) is a non-obvious thing: even if
we have EDID in the commit message, it takes some effort to calculate
the value. If for any reason we decide to change the hashed bytes
(e.g. by dropping any of the fields) it will be an error-prone process
to update existing hash values. On the contrary, the 'strings' are
easy to check / compare without any additional tools.

>
> I guess one thing that might help would be to make it a policy that
> any time a panel is added to this list that a full EDID is included in
> the commit message. That would mean that if we ever needed to change
> things we could. What do you think?

Definitely, that sounds like a good idea.

> That being said, if everyone thinks that the "name" field is enough,
> we could do it. I think that in the one case that we ran into it would
> have been enough...

Yes, I'd suggest using the string unless at some point we see two
panels sharing both panel_id and names.

--=20
With best wishes
Dmitry
