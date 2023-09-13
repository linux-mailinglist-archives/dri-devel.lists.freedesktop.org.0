Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC179F10A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 20:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534F210E4D6;
	Wed, 13 Sep 2023 18:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EFD10E4D6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 18:21:03 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9a65f9147ccso18425266b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694629260; x=1695234060;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2GTNFmg4KNiHvvcZa1WQZtY848dk0rdfmjYkArIU+oo=;
 b=i3Ueuw601Gqnk89IFj4noMj9k86L6h/rMDAJEOCUnQ9qn472b+ua4JkpRuFxrrvK1n
 zOcC0vxEr5WMOWfFQA+/XfpONLJG7YKEiWkGLBY/5Y3HjJOSTdTbzNFdjfL4NEvGpkrd
 jYdynppDVSnguIfi5h7AuK1d5tVb6RIbzumu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694629260; x=1695234060;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2GTNFmg4KNiHvvcZa1WQZtY848dk0rdfmjYkArIU+oo=;
 b=wjbIbiWtGFFA4kc1eIzZAdbqSeq25BZsLxDZuIeuglMIz+PNeK2DkX2M4S64lQZTu5
 4GsSYK75OaO4qkUH218ztLc8qbbMAs6A0mUSo6qaElwDdQXjVvQeAPFN8JnSIUorqZrx
 IgNCV+EDwi+1xklucG/q6YXYKVAZQl5k803ClQYmsMOnF1n9zQYPF0wx5MNz61oTZcqO
 GcF8UYTKsh0Fs6Yrj1JiQ2dx+jmuKblEC1Lrq062f8q9eE7UoreZpnX3rwWwUuc4tC1H
 wA3kcbzu2rTRhLVmxSHtYSefKSPeQ2OB8N/pqSj3HCaKThZDVOuZRbuXamX+cPTasvxB
 n9rw==
X-Gm-Message-State: AOJu0YxsaQJcfTb7KoDA1uzlFcJv9aujmd40tSsmY+7jHDe2RX1Oj9t9
 7W/1fXqJJbJZqMnwzm196bW0cwRkBsZfdSaP6q5VsVgi
X-Google-Smtp-Source: AGHT+IG9y54kv4TsXuaEZuOv6vXKvZgxQ6tWlFgJAbh4CIAjUdT6gkVc6dJhrhSOiLlexrSQ13yDbA==
X-Received: by 2002:a17:906:5a59:b0:9ad:7f13:4db8 with SMTP id
 my25-20020a1709065a5900b009ad7f134db8mr2801544ejc.36.1694629260767; 
 Wed, 13 Sep 2023 11:21:00 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 gi33-20020a1709070ca100b009ad81554c1bsm3037496ejc.55.2023.09.13.11.21.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 11:21:00 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso10485e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:21:00 -0700 (PDT)
X-Received: by 2002:a05:600c:1c24:b0:401:a494:2bbb with SMTP id
 j36-20020a05600c1c2400b00401a4942bbbmr160314wms.5.1694629259696; Wed, 13 Sep
 2023 11:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.3.I6a4a3c81c78acf5acdc2e5b5d936e19bf57ec07a@changeid>
In-Reply-To: <20230804140605.RFC.3.I6a4a3c81c78acf5acdc2e5b5d936e19bf57ec07a@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 11:20:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtN_Ag5JsmZGb2arPr8RjhkaBPb14j+a2-+FB-aeTeXw@mail.gmail.com>
Message-ID: <CAD=FV=WtN_Ag5JsmZGb2arPr8RjhkaBPb14j+a2-+FB-aeTeXw@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] drm/panel: otm8009a: Don't double check
 prepared/enabled
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Aug 4, 2023 at 2:07=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
>
> For the "otm8009a" driver we fully remove the storing of the "enabled"
> state and we remove the double-checking, but we still keep the storing
> of the "prepared" state since the backlight code in the driver checks
> it. This backlight code may not be perfectly safe since there doesn't
> appear to be sufficient synchronization between the backlight driver
> (which userspace can call into directly) and the code that's
> unpreparing the panel. However, this lack of safety is not new and can
> be addressed in a future patch.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> From quick inspection, I think the right way to handle the backlight
> properly is:
> 1. Start calling backlight_get_brightness() instead of directly
>    getting "bd->props.brightness" and bd->props.power. This should
>    return 0 for a disabled (or blanked or powered off) backlight.
> 2. Cache the backlight level in "struct otm8009a"
> 3. If the backlight isn't changing compared to the cached value, make
>    otm8009a_backlight_update_status() a no-op.
> 4. Remove the caching of the "prepared" value.
>
> That should work and always be safe because we always enable/disable
> the backlight in the panel's enable() and disable() functions. The
> backlight core has proper locking in this case. A disabled backlight
> will always return a level of 0 which will always make the backlight's
> update_status a no-op when the panel is disabled and keep us from
> trying to talk to the panel when it's off. Userspace can't directly
> cause a backlight to be enabled/disabled, it can only affect the other
> blanking modes.

Note: I'm not planning to take on the cleanup of making the backlight
of this driver work better. Ideally someone who uses / maintains the
affected hardware could give it a shot.


>  .../gpu/drm/panel/panel-orisetech-otm8009a.c    | 17 -----------------
>  1 file changed, 17 deletions(-)


In response to the cover letter [1], I proposed landing patches #1-#3
directly from here while we resolve the issues talked about in
response to patch #4 [2]. I didn't hear any complaints, so I took
Linus W's review tag from the cover letter and pushed this to
drm-misc-next.

1e0465eb16a4 drm/panel: otm8009a: Don't double check prepared/enabled

[1] https://lore.kernel.org/r/CAD=3DFV=3DUFuUsrrZmkL8_RL5WLvkJryDwRSAy_PWTa=
-hX_p0dF+Q@mail.gmail.com
[2] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b2=
34f89613b5cec0f14@changeid/
