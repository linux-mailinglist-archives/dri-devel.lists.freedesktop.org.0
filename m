Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A6543E4F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A48F113952;
	Wed,  8 Jun 2022 21:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C16311A421
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:13:30 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id s124so11546458oia.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=5k2lXIDEokraHei/3DYd5toc4NljbiupbB9a2J4ktCM=;
 b=IKyGCewybNq/ZI5ZI8rwFTQc4RMHecpFlA6Sr294bP744cAsP+FMFaE7S+Izj5Pgsr
 bi78zZngqLumr8m/yfk8rwxl4Ia6FixggXylLiikaOAyOvLZFTYDcEZrBE279aF9WHCh
 ozjGevapw8S4vym5rOMGlXpwAh88TvZ1rrnxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=5k2lXIDEokraHei/3DYd5toc4NljbiupbB9a2J4ktCM=;
 b=G4g5pmL9mPkc4/ilZJA/4+HPhWm2Jr9s4iKOPDavzFtFQHFDNfCCkb7R2940FMC3pJ
 iGcFp7v/Djlbxja+nVMIcAK1d4Mqj2vPzowGHEADv78RnzHfyUsYkWtn9RKI8bki1Njk
 mZqHOh9z8b5pkKslWL8ZzdhUm/N/KvPeN4akwcPj2r4EI7ZI5sefEyUQHVVxWrNFc0vk
 8875rdKGOkxU5kdx5PcIoQ9d6P3sx1lzLc55cGj2aEeEDdgCdSZlZxENbt43R1eBAc+e
 2l3NP8nfkA5qoe9h1c/6CKBatqYbdhwcFdzmAOyuRMxehSMtLUIbVP1mVOn73wf6/9uY
 NUIg==
X-Gm-Message-State: AOAM532/lHs1Gk5diIQk4Q04ObQHbSLkB3nI2/5x+7lka7i/npyAdBcQ
 IyigJ/ft5Tn9L/B+r2n+dzfQp1Z//0g6CVYVS9e4Nw==
X-Google-Smtp-Source: ABdhPJwFB1+veA013diaL1hpc7zDl+bDQYmdQp2R/FPuKhRGEK6UJHYtZ6FE7vIIHppzs22TjDEAh6WxjTFUaZDzHJQ=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr3389111oil.193.1654722809854; Wed, 08
 Jun 2022 14:13:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:13:29 -0700
MIME-Version: 1.0
In-Reply-To: <20220608094816.2898692-5-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
 <20220608094816.2898692-5-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:13:29 -0700
Message-ID: <CAE-0n519y4i+8RnRv0xUHuW+s3uDG4Cn8i0t5i3NCyUT-s=q-g@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] drm/panel: lvds: Implement .get_orientation
 callback
To: Douglas Anderson <dianders@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Hsin-Yi Wang (2022-06-08 02:48:12)
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
