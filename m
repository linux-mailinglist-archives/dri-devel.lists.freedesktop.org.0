Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323594469A2
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 21:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BFA6E516;
	Fri,  5 Nov 2021 20:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6BE6E516
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 20:26:13 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id f10so10677403ilu.5
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uw0GAODwRueFvBOQE2OGWsggM53Zcuqt3yCcWbHWgkA=;
 b=ZDCN/m0tmqnKaMhe26FXs3xZ5Si8fvJfzleOAKObY1a/TB05o9H4RU9PduYZUA8Ri/
 bRLZ77CghW64RM1dj3p2bmSYjZU4v6wqLhkQcNTMlCTsLe5+9QXsX3dRNmrdyjFIUm27
 ngqeVF/UcylsMcCudABfAf4UBFkDA06ibJIaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uw0GAODwRueFvBOQE2OGWsggM53Zcuqt3yCcWbHWgkA=;
 b=Fl/aH5YeXdFCPzmRevJnNNPjLqij42Csnid3U2kIm/wsHCtKohMwPCeg0ZZ+pJqMQ1
 WZC4nHI02BggAh5zQc4R0RK/rIA8SjGHoNQZvQohbBERzRmzUpsy3cMd/I46unNF0dl2
 2vJIC3qRl89yZDRsoqu0FG1o0W4EyJ0ap9dR+cgLwAfEsC/G597C9oKpwVUjHIhNYKfy
 E9ptpNmtpjSzklwbwfLGoV71xqfmKZEETVQd86q5zk8NIqk43maOzjwhk9ScIpSuFmpm
 gH7uJ1IoMZ4wpsO69B/rGc6at0X0aH51qTekedy7zTS4YieZjgmP46kAtdzeNfrqp7ut
 xZeg==
X-Gm-Message-State: AOAM532B+savrv1ATBIV/osKAwvVA3BtiMLIjPTYhM5aLmrfM6LOFknV
 TXTsdfxuzsuqw688OArE6ydbAO8MsnmZ1A==
X-Google-Smtp-Source: ABdhPJx/PwrSF9opn7sCDYB1B8e7LRaGFoA89wCyulovvgTEn7NmKkgevnfWeywBeB9tB0sDjn6AOA==
X-Received: by 2002:a92:c112:: with SMTP id p18mr37338990ile.52.1636143972857; 
 Fri, 05 Nov 2021 13:26:12 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id m10sm5274751ila.13.2021.11.05.13.26.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 13:26:12 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id d70so11125360iof.7
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 13:26:12 -0700 (PDT)
X-Received: by 2002:a05:6602:24da:: with SMTP id
 h26mr1098936ioe.168.1636143971873; 
 Fri, 05 Nov 2021 13:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211105202021.181092-1-robdclark@gmail.com>
In-Reply-To: <20211105202021.181092-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Nov 2021 13:26:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wz0bDNUVdbsjsPv-CU-4WF1ngXT5tODSRpG9qtUqs70w@mail.gmail.com>
Message-ID: <CAD=FV=Wz0bDNUVdbsjsPv-CU-4WF1ngXT5tODSRpG9qtUqs70w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/devfreq: Fix OPP refcnt leak
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 5, 2021 at 1:15 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
