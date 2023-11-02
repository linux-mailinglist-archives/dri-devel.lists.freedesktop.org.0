Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE67DECE1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 07:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1591110E076;
	Thu,  2 Nov 2023 06:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB7310E076
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 06:31:57 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d9ac9573274so588003276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698906716; x=1699511516; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=StUp8Et2C40MeeNi4V7XV6N5+td2AtmdwFbNutMfZZM=;
 b=Qvs5Gy0h2XkhbOpj1cg41P0hBRUR/yZHE9/hCPXl3lcnNQ+TUBbVakIXR24pQkBc5P
 D3DulM1UQqiQwlnqN9iOerbjJ1Tx0C7FNDlbYYhlmO2PrqlolXsEh7PzLVOt5OG0i/Q5
 htAJefX4NlWrwBPiXcGPcRGJh2Z8U4iJ9ObWvJfhXfUdLEpATyl5UqpDGmTUKBOSc88A
 av0aCMVDq08dajSYzyveKvakLzOrIJ007WhSEYuk+3aivjdiMXgHXojKaWFsvJ7LqsDH
 0Am0u81riFBjdgwaiYw24UeD/XNlPBjMggSEFHOzAmxh8dXEQx5Kx5dqTjdnpnWs1lgo
 VxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698906716; x=1699511516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=StUp8Et2C40MeeNi4V7XV6N5+td2AtmdwFbNutMfZZM=;
 b=l+nnzML2Gg37B3YKo7DHzvzF1IdmnizTs6u1qAfHH/rmUJRfpo1MNQgJyL+u+LbO9i
 zPuMtMnD1A4fBwYoMDFC43gibNEKi5Z+89Vjy7FDInNr4HNzOgA5/SCHQKJp7YF2k4qD
 3c/aog+DqFflHeISy760AnK8+7QzuuYNiZZth6fQIuP0ePaKmTM5/hmbzAV99vMM5gCt
 OWkhi0iUSDwx9or0VxGLVT8hNHssXl4n7cPVtCJNaxKa2I/FCP9VNqj8CzExtryKT8Cx
 r1YFN0dtX3q4AL9qyzVPVGdhDoeIOYN8a+6KWhnt8kWoEFBuB9dU3lwt2V4j0wsitIQP
 BPjw==
X-Gm-Message-State: AOJu0Yz5/dygQlaXEk/7/WR2ao8w06UI3auk+QD+YLcEivBjwmjhecPw
 Felmsx4I18UUDXhDfpEGvFeNUe0RH8WVRhMgsooCNQ==
X-Google-Smtp-Source: AGHT+IErkxOJ7DnSFJx36BZcxIVf1TUwHioSsB58JfzUCGvwGWx6kzJyj9h+0s3GWmFHNf2Y9+D53Hc2XaiK5h9CWiM=
X-Received: by 2002:a25:50d0:0:b0:d9a:4839:68fe with SMTP id
 e199-20020a2550d0000000b00d9a483968femr16145403ybb.43.1698906716622; Wed, 01
 Nov 2023 23:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231101212604.1636517-1-hsinyi@chromium.org>
 <20231101212604.1636517-4-hsinyi@chromium.org>
In-Reply-To: <20231101212604.1636517-4-hsinyi@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 Nov 2023 08:31:45 +0200
Message-ID: <CAA8EJpoPMkQRhCD-9SPSheiio1dH8V6BUv89MZKfZdrBzsBW-w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel-edp: Choose correct preferred mode
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 1 Nov 2023 at 23:26, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> If a non generic edp-panel is under aux-bus, the mode read from edid would
> still be selected as preferred and results in multiple preferred modes,
> which is ambiguous.
>
> If a hard-coded mode is present, unset the preferred bit of the modes read
> from edid.

Can we skip the EDID completely if the hardcoded override is present?

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/drm_modes.c       | 16 ++++++++++++++++
>  drivers/gpu/drm/panel/panel-edp.c |  7 +++++--
>  include/drm/drm_modes.h           |  1 +
>  3 files changed, 22 insertions(+), 2 deletions(-)

Anyway, this should be split into two patches. One for drm_modes.c,
another one for the panel driver.

-- 
With best wishes
Dmitry
