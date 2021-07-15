Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070983CA127
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 17:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4148B6E876;
	Thu, 15 Jul 2021 15:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90406E876
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 15:06:23 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id h9so2997161qvs.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 08:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jTXo2CnbSOMrGtpr7d+7B14wJbb3+loP0cPWwbTMyDU=;
 b=ezYOntX/pHD45q0yZXqp24ehBEFMb86vUfaw54iLZ1/BxcdOCC1T62TEyBhzIfTQMo
 rFgZ62blhb8mI+oMeumeYj9bpzjnN6x9iLRpjgz8Q45dwGTKhEWKCjp5oCYuT6r6QiYb
 YjvoaszX5rksO92uq6JnGGcagz3eNhyIYGsW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jTXo2CnbSOMrGtpr7d+7B14wJbb3+loP0cPWwbTMyDU=;
 b=XV19FgZ+i6/ikikMz6MYxspwO7ejbddT1cy6pnAW4Fhoq8EFdyxK7Cdh0M387Ht2MF
 Ds3f35OjYnqcD8yloirsrQ0W1daQIcTWiwMm6hxEtlpPTArhS9/MqSaurXd9eGubFIdg
 cx/DN/aQo6wIHrPe4BrmKvlWUvxQTu3eaV9kzngznIrpkLCXaBcuABX66VNBvY4WNmk0
 bgIr8qUXXP1hmVBmz+YKf9NfIFVw04NFCRv3a8MwruFzir5cc3Aq1GFULFfxHu8VtXmt
 ZOJuptrcFa8aNu2V/Rk97GTTEdGcAM5zhPLmD4KxbU3jkNFSK/kq9pUUhamzhH0GVgRY
 vGtg==
X-Gm-Message-State: AOAM530M44FXwuJtp3FD6byYaUcivnGTfiep9SCvIkA/Dmy5k19lHJJf
 HLX+ZeYBomEpsbMyVfMMPXmxyMp/whU0kQ==
X-Google-Smtp-Source: ABdhPJyjNE1aXFYmcmaI+X1gum6oLIjWbTAYNZrsLxcO3yC1pfupe1yoil4AaHjG9EtvmjAiQtsNbg==
X-Received: by 2002:a05:6214:21e7:: with SMTP id
 p7mr4857495qvj.27.1626361582574; 
 Thu, 15 Jul 2021 08:06:22 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id s6sm2648360qkc.125.2021.07.15.08.06.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 08:06:21 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id a16so9589697ybt.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 08:06:21 -0700 (PDT)
X-Received: by 2002:a25:b845:: with SMTP id b5mr1652895ybm.343.1626361580676; 
 Thu, 15 Jul 2021 08:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210714101744.1.Ifc22696b27930749915e383f0108b7bcdc015a6e@changeid>
In-Reply-To: <20210714101744.1.Ifc22696b27930749915e383f0108b7bcdc015a6e@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Jul 2021 08:06:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XZWKpQbG+hJkyHCViCEhgC+WmQtyKnNPuDXpi+Yrv6xQ@mail.gmail.com>
Message-ID: <CAD=FV=XZWKpQbG+hJkyHCViCEhgC+WmQtyKnNPuDXpi+Yrv6xQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: For drm_panel_dp_aux_backlight(), init backlight
 as disabled
To: Rajeev Nandan <rajeevny@codeaurora.org>, Lyude Paul <lyude@redhat.com>, 
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jingoo Han <jingoohan1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 14, 2021 at 10:17 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Even after the DP AUX backlight on my board worked OK after applying
> the patch ("drm/panel-simple: Power the panel when probing DP AUX
> backlight") [1], I still noticed some strange timeouts being reported
> by ti_sn_aux_transfer(). Digging, I realized the problem was this:
> * Even though `enabled` in `struct dp_aux_backlight` was false, the
>   base backlight structure (`base` in that structure) thought that the
>   backlight was powered on.
> * If userspace wrote to sysfs in this state then we'd try to enable
>   the backlight.
> * Unfortunatley, enabling the backlight didn't work because the panel
>   itself wasn't powered.
>
> We can only use the backlight if the panel is on and the panel is not
> officially on when we probe (it's temporarily just on enough for us to
> talk to it).
>
> The important thing we want here is to get `BL_CORE_FBBLANK` set since
> userspace can't mess with that. This will keep us disabled until
> drm_panel enables us, which means that the panel is enabled
> first. Ideally we'd just set this in our `props` before calling
> devm_backlight_device_register() but the comments in the header file
> are pretty explicit that we're not supposed to much with the `state`
> ourselves. Because of this, there may be a small window where the
> backlight device is registered and someone could try to tweak with the
> backlight. This isn't likely to happen and even if it did, I don't
> believe this causes any huge problem.
>
> [1] https://lore.kernel.org/lkml/20210714093334.1.Idb41f87e5abae4aee0705db7458b0097fc50e7ab@changeid/
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/drm_dp_helper.c | 2 ++
>  1 file changed, 2 insertions(+)

Pushed with Lyude's review to drm-misc-next:

17a1837d07be drm/dp: For drm_panel_dp_aux_backlight(), init backlight
as disabled
