Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2225DC202E2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 14:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7603F10E969;
	Thu, 30 Oct 2025 13:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fQ3Ymzid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C62A10E8CE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:58:11 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-87dfba1b278so9881776d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761818290; x=1762423090;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aEL7UWndy/pGNe3nAwOeMI48IY8s4YpyPq3MFk8WULY=;
 b=fQ3YmzidU3TfuOzfp5P1HSpiS8pg03jwRfnEfrK/6JQFZHVp6efNP5zElPAgAq5Xoa
 FDFqm2V1isdtitXGjipqOVCGnUlfZCbqJvVKdVfr+2IsskeWdXHPV/l3cjRGqTAP+v9v
 FpgUK1WGunC/ew+h2o/mkUs2AdhQibkKMJ7PcaAKo093I2tOgn5FJkK6ZAcJ081GJ1cw
 G6hwH67PodDSFIH2AIm5uw1xnuPfp4qHBkUAEtYXxaSR/A2CsTEeQA4eaMsN1qPUydeg
 C808aLByIHu09hYzKB/j4qP39+C8XxcXlQX0uXBlAE4aDk3jzrkxJYabzgvez8WtfPA7
 H7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761818290; x=1762423090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aEL7UWndy/pGNe3nAwOeMI48IY8s4YpyPq3MFk8WULY=;
 b=OQwF5f4HHeZRONV68XjOIyMNGFad51eTvPxA8AjBOvr6ogzdA2UJ0REu2S25psNyVW
 HiGXreo3iz34BXGTEHyEz3IXS23wLYlCIb+AAZLtGwRLZVKfG/29zqg6Urge+JYTgGet
 LWQR0mB6IjJPM0tT5bid+fTAOnDKCOW3jFyyGMKulBQpfMAIDAjahVhZl7uNYwxieNHk
 x6pNRjNfk5o+15yMTNRg0RKSIxgFXUKsMPkZUzOcVyWdbfFSSyMw25FcU0aKirtqM40a
 og1D86YbA6oenjNIv6qyfZNilk3t+ytnZoQlT2wlSzSdtLSRkV9E8uS9gojSgz8tcSu4
 Wd5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvl/jHkA04d6CNU+lscbDZeRB2OqOtyP81UBRNa8MIRr/sFslJLjdvdFDT5i1z5rbCBTt0I2vngXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPFoWGhY4NASvcQB9T1a2pN2ZMfIOYCmEGTHigCCrUm44+EJXl
 kqKWBEPZzL4yxuXu8MvUnkz2o2skneufsmxRpC3gFloFOtNF7hFY+2rfK2kGmJLBeQM8mlQiM0n
 IwG0m//0V7EmX87XUyzYMZuUnGVvzXKCKyniX4rycWg==
X-Gm-Gg: ASbGnctsAiq0yJgrUzNIaHign0CccMpfu8aIEHO0b7PV5gS6/N5U6OxKWOfOiv+S2Vi
 Uf62QaMc+mFSEPir8TLNgq8DFcka3ajhIVUrUsQUzagYkMdVc1z+7Qa/ShJl5nfyqjLMACYNI3S
 sdt2JGYUp3KFA2FT2mxtczc/0Ov6WAQirYwz/ltcC3nnSEQgGfOxmPdcjWuXcf8ipLWQ9I2kUOV
 RF0I4P+5ddzk2xpScFST6/ehwW0CUdGVX+hiFy9McrWUAuMGbqypjTZnDJPlA==
X-Google-Smtp-Source: AGHT+IHIsI+4/h6KAHaH2OWaQbqcbxRUmhlsknjp7KUacPPetetFpCZtsE+4lda40dB4ndnWBIwuBhhs7osXnHSczJc=
X-Received: by 2002:a05:6214:2e47:b0:880:1b8a:9917 with SMTP id
 6a1803df08f44-8801b8aa667mr29220446d6.18.1761818289961; Thu, 30 Oct 2025
 02:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
 <20251029081048.162374-3-ajye_huang@compal.corp-partner.google.com>
 <CAD=FV=WbR0u_a7S1pcL-6C+sj9Kt=GOLUwJmwt8ANJbyV4JYFQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WbR0u_a7S1pcL-6C+sj9Kt=GOLUwJmwt8ANJbyV4JYFQ@mail.gmail.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Thu, 30 Oct 2025 17:57:59 +0800
X-Gm-Features: AWmQ_blMVCc12qswU2ebRXhGRocvvLNHUm_Z5F-w-j6Nwq4rqm49JiPQdsIsUzI
Message-ID: <CALprXBb=_HuwskwFP0nRKH=3zwoGbig4fWY+Q4g53Jhn985TsA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel-edp: Modify LQ116M1JW10 panel's bpc to 6
To: Doug Anderson <dianders@chromium.org>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, jazhan@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 30 Oct 2025 13:11:53 +0000
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

Hi Doug,

On Thu, Oct 30, 2025 at 7:25=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:

>
> Unless folks end up preferring EDID_QUIRK_FORCE_6BPC:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

After following your suggestion with the following, the issue goes
away during YouTube playback.
I will send a new patch for drm_edid.c, thank you so much

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e2e85345aa9a..a73d37fe7ea1 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -250,6 +250,9 @@ static const struct edid_quirk {
     EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
     EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)),

+    /* LQ116M1JW10 displays noise when 8 bpc, but display fine as 6 bpc */
+    EDID_QUIRK('S', 'H', 'P', 0x154c, EDID_QUIRK_FORCE_6BPC),
+
     /*
      * @drm_edid_internal_quirk entries end here, following with the
      * @drm_edid_quirk entries.
