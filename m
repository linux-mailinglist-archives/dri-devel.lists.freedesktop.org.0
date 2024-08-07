Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B6094B344
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 00:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172F110E5FE;
	Wed,  7 Aug 2024 22:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cmOhmYrv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7133B10E5FE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 22:54:27 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-44fe9aa3bfaso2481641cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 15:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723071265; x=1723676065;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZVqFjCe1vKsHofLvXgBCHjHG1J2u3TVLPJgwGDIxqc=;
 b=cmOhmYrvnUElOWdF1ZvfSMf2dsfxNOnHIOoKXgqzBicPc5T1osMOh+zX/V+mE2Mp7K
 b08FyMHSIect5CebjlzOyaReaSM1UrIFWouLdXdLULiST9hVkVuFxb9xbBZABmMOAsdA
 5lujRZMEaBswe4r/ge1TKsNBfr/h02fzjahTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723071265; x=1723676065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZZVqFjCe1vKsHofLvXgBCHjHG1J2u3TVLPJgwGDIxqc=;
 b=K5deB3BiQCtwd1HqXx7xBDa4Mfh22g5UjQggPlCJ7XhavbIBTqR4Nq068Q8C73e4pb
 vMd/DSo8yOamVsFq4AI5kdvwpZv/XaaP4b92L1J8x7jbXxhhmwxFqfozlkbm6L36YhEZ
 DHdm5MEKjo7gYOQJ0CnDLaTy+PDcAkjh1WM+wEcyTwZ+7gWmyLRsS+Vl6DtmseOeqiPp
 oRUQPUoKsmVZQN0kn2BY1/J8iA7eZLE/8n+WcZcYzBM+bVL7nNHfIKp1RJqFmczvzGag
 stnp4ZujUW3hefyUEdeOZXKKgVpJbQJjSgl5dPgDA6QHjQh1CmQ27c7pCLOAHILiqI3m
 3jOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4Q7sTZC1nwAcoWggjD64JXH2zRBXugGU/HIhIL7ul/YhQpa/FJGxuav2jznHIW1YhNvCbM0+QHZYlOo6BSr5rXcYYKGZ5FLAvxJjccsBt
X-Gm-Message-State: AOJu0YyLqg9/7I7TJ6jPFnb0AIR4gk+DkN1SQlAws2PiR08NaDQldIVi
 6Y2WB8UAbuaUkLyZC/FGkOC/n7mAUCG3xhjQSudavEU1Phj/chvTrxahX6CcqT8DonDjSFirsCH
 TdA==
X-Google-Smtp-Source: AGHT+IGKTeAg9PfLt11A0yvAm13UK7tMMtOE0bt1d75bneq3pjOh+0QHzyA4D9WYvTq/Cznbh6JefA==
X-Received: by 2002:a05:622a:a11:b0:446:45c3:b180 with SMTP id
 d75a77b69052e-451d41fdde3mr2551191cf.6.1723071265415; 
 Wed, 07 Aug 2024 15:54:25 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-451c87460eesm8273881cf.58.2024.08.07.15.54.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 15:54:24 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4518d9fa2f4so140631cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 15:54:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUfWVyL8OKOUB9nRw8fSS2p0LwXNFOXAwNUTolVlA7ONU+Qyc9WGitepL81TcZW4vwaaR+ZzD/63ZMfiDpnhdq6TKUZG7HIqSM4K2JtVPcl
X-Received: by 2002:a05:622a:653:b0:447:e423:a463 with SMTP id
 d75a77b69052e-451d37ab35amr561411cf.3.1723071264198; Wed, 07 Aug 2024
 15:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240806135949.468636-1-tejasvipin76@gmail.com>
 <20240806135949.468636-3-tejasvipin76@gmail.com>
In-Reply-To: <20240806135949.468636-3-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Aug 2024 15:54:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VDUGEZTPuPvEy-jBjW-e7EcS9_GDLwv3QbS0QVR0uhZA@mail.gmail.com>
Message-ID: <CAD=FV=VDUGEZTPuPvEy-jBjW-e7EcS9_GDLwv3QbS0QVR0uhZA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: startek-kd070fhfid015: transition to
 mipi_dsi wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Aug 6, 2024 at 7:00=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Use multi style wrapped functions for mipi_dsi in the
> startek-kd070fhfid015 panel.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  .../drm/panel/panel-startek-kd070fhfid015.c   | 115 ++++++------------
>  1 file changed, 35 insertions(+), 80 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If nobody else has any comments, I'll plan to apply this midway
through next week.
