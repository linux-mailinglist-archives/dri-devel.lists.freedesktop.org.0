Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A427D8BE89D
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD88112404;
	Tue,  7 May 2024 16:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="j8BFSDtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDA5112404
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:19:45 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6a04c581ee3so13303766d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715098783; x=1715703583;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrlcgV/ss0UWVmE0JQWGJQN7bh+N6Cn4d6Xqz8KuFtk=;
 b=j8BFSDtk319X4IrFuFPOT4Y+d1whu0Tr+TwlApBNNyu5gsJkqxo8PMCJ8R5IkE0R4E
 /BxO3+g4zpUqYODbQpdffgJcNFf0GEElAcLHKjE18bq1WPxDF+njJRxN0SlY1Mx5Of3c
 Q9m1n+5m0IP/VXN0UiwX/JM2GY8S5Z1vJCU/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715098783; x=1715703583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrlcgV/ss0UWVmE0JQWGJQN7bh+N6Cn4d6Xqz8KuFtk=;
 b=egOLvLd7Y7vfZZICqC00We9Rgd4FdvbQb2UYCfOWVYC4BP0lcyTvYktwvAW7sFZfYL
 UgOhimZqPbpFsrCxj6xS6xxfvGZ7KYgfWLAlirZKtXITo8UzsEjVIK0AgPooGTzmLnEa
 YxnG542fC3iC/Nu7nFtHgfFzv6Jdk9Eri6RzE09iRzXJtgYJGQdUfA1uu0gmfEwq/C98
 tzom+G0RT3M/GtHsoCtHqlniPVdb2C9cr7pHpK6ygLyjGU8ck3Nh0ZlKnEBPYOjG/Gko
 elcddwtxHW2mKqJewj7IJSlm8FPDI8vEir0MNLbj0SyAuur6jTadi1dGXNHuWffG5xPG
 S8Yw==
X-Gm-Message-State: AOJu0YyPcrbOxTXkk2EsfBAWDZ/DZD23xrFQD25QQKPNmWIW3nYa+Xa8
 7WrvbpWUsF7rZWve3VVLf8wfQIdlAFGbbFqGs39wr2GzV1GW0xhyxRqXYfsqZiGmqjABqpUsMV8
 =
X-Google-Smtp-Source: AGHT+IFzg1djw4fKml86XcHQabwzRvCc1qiyacmRT1L3sWexYXEVq3DblNVVN7L6ZPoy/pRC9uWuvA==
X-Received: by 2002:a05:6214:ace:b0:6a0:76d8:e79a with SMTP id
 6a1803df08f44-6a151453698mr3123106d6.19.1715098782756; 
 Tue, 07 May 2024 09:19:42 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 nd2-20020a056214420200b006a1006ddad2sm4794595qvb.131.2024.05.07.09.19.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 09:19:41 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-43d361a2124so415471cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:19:40 -0700 (PDT)
X-Received: by 2002:ac8:6ecf:0:b0:43a:e2ea:bfa5 with SMTP id
 d75a77b69052e-43d984d1473mr2462641cf.17.1715098779928; Tue, 07 May 2024
 09:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240502153234.1.I2052f01c8d209d9ae9c300b87c6e4f60bd3cc99e@changeid>
In-Reply-To: <20240502153234.1.I2052f01c8d209d9ae9c300b87c6e4f60bd3cc99e@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 May 2024 09:19:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWQiv8WEdjDYXV3i7RSOssnvurq_aNwGU+-EDcVGK=LQ@mail.gmail.com>
Message-ID: <CAD=FV=WWQiv8WEdjDYXV3i7RSOssnvurq_aNwGU+-EDcVGK=LQ@mail.gmail.com>
Subject: Re: [PATCH] drm/connector: Add \n to message about demoting connector
 force-probes
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Simon Ser <contact@emersion.fr>, Thomas Zimmermann <tzimmermann@suse.de>,
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

On Thu, May 2, 2024 at 3:33=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> The debug print clearly lacks a \n at the end. Add it.
>
> Fixes: 8f86c82aba8b ("drm/connector: demote connector force-probes for no=
n-master clients")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/drm_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Pushed to drm-misc-fixes:

6897204ea3df drm/connector: Add \n to message about demoting connector
force-probes
