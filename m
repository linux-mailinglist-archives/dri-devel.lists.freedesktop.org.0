Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DE9763A73
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 17:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5A810E487;
	Wed, 26 Jul 2023 15:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2B610E487
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 15:10:50 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fba86f069bso10732429e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690384248; x=1690989048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b/ROWfJuXH2cVv0Y621ig/G+mxiEtHeeKT7it0Legy4=;
 b=g4OVpkY5Ir5YWVBJTehv4LORcVfoZSnYQ8SHXz4X7usRpYm/V1nwK06H1DpDAopAj+
 bY0L0J4aytloCqvGBV2t2QNdeM9fM7spqBOLg3BNQohijbhWQNos6RrYW+SuPqqwM+oS
 wtrt2n9xCu1TXJehS4MoM66jTwdzk7UjRM5KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690384248; x=1690989048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/ROWfJuXH2cVv0Y621ig/G+mxiEtHeeKT7it0Legy4=;
 b=kFoVkUYLoQc1XTCe7bGXRpj+6zup4mqLivFNuzph+/WFcYVlkXLi2FmKz/PCrkMDNv
 hpX3U6ctvS+phsG/WEExg5AwLkMRbmH/OxCdizbLQNagep969JWjsckCHcsD9bMFJ9+Y
 7ztSwjeIWY6kVKfoWwqdY2mhCHFJz13wc9uwlH/2bTX6+/4amUaPh+LKMaSKJdJkdWth
 DJUO7fFgU2JM+APpZPLYVcAM+nS7OKkgeslHvgYi8NqbTy1P5uyTm+O47NL+IH6Fk08j
 4ZjvEIWM0GsVuhjyiNPIUKFSOQgIpgO2lmyHYyISWknuSZQ24C8WJG3gKwsGLp6gGD+R
 vcDQ==
X-Gm-Message-State: ABy/qLaViVunHZ1O2NDkOTQpVbBrl0MvYt4WWi9yKO5kUWEEQuqAeOEv
 BhTonyw3hbhpyM4lwDRP8UGhDrzUo6fjq38WPnjWoX4/
X-Google-Smtp-Source: APBJJlGS51o7bg1T6CzwX1NA2xKTtKSGXbji+DCSDbb6UjlwEgHeZo6ZC4P3hSeCv9C79fWT370kwQ==
X-Received: by 2002:a05:6512:3452:b0:4fe:a2e:8905 with SMTP id
 j18-20020a056512345200b004fe0a2e8905mr1583513lfr.44.1690384247922; 
 Wed, 26 Jul 2023 08:10:47 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 a9-20020a056512020900b004fdb9ac8563sm3364187lfo.125.2023.07.26.08.10.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 08:10:46 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4f58444a410so3309e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 08:10:46 -0700 (PDT)
X-Received: by 2002:ac2:5494:0:b0:4f2:7840:e534 with SMTP id
 t20-20020ac25494000000b004f27840e534mr170963lfk.0.1690384246218; Wed, 26 Jul
 2023 08:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230725203545.2260506-1-dianders@chromium.org>
 <20230725133443.v3.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
 <snx3fzvf3icauri2xuigydvpqxtzhp34mptdxvifi7jswm2evy@sx7jr7zwvjw5>
In-Reply-To: <snx3fzvf3icauri2xuigydvpqxtzhp34mptdxvifi7jswm2evy@sx7jr7zwvjw5>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Jul 2023 08:10:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VcsTik+HD11xeDM2Jq9ispcX0-j5QtK8D1qUkrGabRGg@mail.gmail.com>
Message-ID: <CAD=FV=VcsTik+HD11xeDM2Jq9ispcX0-j5QtK8D1qUkrGabRGg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] drm/panel: Check for already prepared/enabled in
 drm_panel
To: Maxime Ripard <mripard@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 26, 2023 at 5:41=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Tue, Jul 25, 2023 at 01:34:37PM -0700, Douglas Anderson wrote:
> > NOTE: arguably, the right thing to do here is actually to skip this
> > patch and simply remove all the extra checks from the individual
> > drivers. Perhaps the checks were needed at some point in time in the
> > past but maybe they no longer are? Certainly as we continue
> > transitioning over to "panel_bridge" then we expect there to be much
> > less variety in how these calls are made. When we're called as part of
> > the bridge chain, things should be pretty simple. In fact, there was
> > some discussion in the past about these checks [1], including a
> > discussion about whether the checks were needed and whether the calls
> > ought to be refcounted. At the time, I decided not to mess with it
> > because it felt too risky.
>
> Yeah, I'd agree here too. I've never found evidence that it was actually
> needed and it really looks like cargo cult to me.
>
> And if it was needed, then I'm not sure we need refcounting either. We
> don't have refcounting for atomic_enable / disable, we have a sound API
> design that makes sure we don't fall into that trap :)
>
> > Looking closer at it now, I'm fairly certain that nothing in the
> > existing codebase is expecting these calls to be refcounted. The only
> > real question is whether someone is already doing something to ensure
> > prepare()/unprepare() match and enabled()/disable() match. I would say
> > that, even if there is something else ensuring that things match,
> > there's enough complexity that adding an extra bool and an extra
> > double-check here is a good idea. Let's add a drm_warn() to let people
> > know that it's considered a minor error to take advantage of
> > drm_panel's double-checking but we'll still make things work fine.
>
> I'm ok with this, if we follow-up in a couple of releases and remove it
> and all the calls.
>
> Could you add a TODO item so that we can keep a track of it? A follow-up
> is fine if you don't send a new version of that series.

By this, I think you mean to add a "TODO" comment inline in the code?

Also: I was thinking that we'd keep the check in "drm_panel.c" with
the warning message indefinitely. You think it should be eventually
removed? If we are truly thinking of removing it eventually, this
feels like it should be a more serious warning message like a WARN(1,
...) to make it really obvious to people that they're relying on
behavior that will eventually go away.


-Doug
