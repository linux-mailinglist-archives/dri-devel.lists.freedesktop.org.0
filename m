Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E19C7EC5B4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 15:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899D910E036;
	Wed, 15 Nov 2023 14:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92B510E036;
 Wed, 15 Nov 2023 14:41:27 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507a29c7eefso9619475e87.1; 
 Wed, 15 Nov 2023 06:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700059286; x=1700664086; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tassi+FTzJA+tFwkfZiIfCitIuDh5wKNY34PFKXnhdQ=;
 b=EI3M0GQSuhOpVEDZoayw9LHaV+FTVxqLTqSvXMuAmTVbXDfsLLVRwGX8GLDeYhghfh
 aJlsR5EFgAyqa9D8zqoD1HJa4jkYtNjeknJRiGuxCOEWLy8NO9nYyx3TMnUsq6YzoR27
 X3lulbDpnhqjrNNnTRNiSNfmzsq9RheRO2nipCPbAWlYEmMrlavpW0j63cqW2/r5m6FZ
 G8OdZlU2v+XKDdy3ELKHwAC/PvUnybC0v6BGMHK4cZOB6hJSt6vXwkZPqrfUE56opTJt
 qjK3pCK0Yad6n8sBjrkFpLLm8AF/bxjBxXKZQBs5CGdijeCc7jJPiM3f5WfLUS7MrXHs
 bN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700059286; x=1700664086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tassi+FTzJA+tFwkfZiIfCitIuDh5wKNY34PFKXnhdQ=;
 b=ezWSURsNDiya+RZhQW5DUpz7RoVy8KkP4rDiHU4b6dpTybycvblGsn37KtAvC8Rouo
 z2xzjDOafRUqhEw2lkF50U658KQGxPKOvJdkgpQiQ2+h++BqscKzvVSoHVCrpXNm52pj
 jwNOfbwrzW2eGtlT8vNmZGQU6LM6hlGlYx7KK0ltlo3uwkO8n4XV3aMHjoqx3TGh30kR
 8ZwqTsp5vUj0D0obUhWr8k/5hOzDqY22IV6rLNGnpcPJVd4WTawe8buU+gyWTD+/YldT
 sAg3nojSs5ocSANCfisxaW7qlxJc2UH3WnMm864DUOT8moBbe2pF/rKbzgG+dGl06ksf
 axSA==
X-Gm-Message-State: AOJu0YxybOjjQCvikLosGiZ2+mSzdRWDvgOPu0kwS/mIxtPgRFFm27w4
 rPGZ7SIGgjoQVGyEZHLEEqS/0aTAvPF6yJByDtOvNgesX5PoTQ==
X-Google-Smtp-Source: AGHT+IEnpIXQ0xUlxPwEJJhyl2bYo/SWJiSV9GhtKCrPso/yzNTtZGcZLkn+oPhdSoo0a8kks45HCjgXrIvvf08dHzo=
X-Received: by 2002:ac2:54b3:0:b0:507:b14f:e3bc with SMTP id
 w19-20020ac254b3000000b00507b14fe3bcmr8888624lfk.33.1700059285589; Wed, 15
 Nov 2023 06:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20231105203700.2152487-1-airlied@gmail.com>
 <39561fc8-185b-4430-b051-2eebc865838d@dakr.org>
In-Reply-To: <39561fc8-185b-4430-b051-2eebc865838d@dakr.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 Nov 2023 00:41:13 +1000
Message-ID: <CAPM=9txp4v2RTupGHjJihS8rb-kfdB_r+d5XaSiy1=2p82Kr-Q@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: don't fail driver load if no display
 hw present.
To: Danilo Krummrich <me@dakr.org>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 05:54, Danilo Krummrich <me@dakr.org> wrote:
>
> On 11/5/23 21:37, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > If we get back ENODEV don't fail load.
>
> Maybe worth to note why this is OK in this case, might not be obvious
> to future readers of the code.

Sent an updated version with that fixed.
>
> >
> > Fixes: 15740541e8f0 ("drm/nouveau/devinit/tu102-: prepare for GSP-RM")
>
> Maybe I'm missing something subtle here, but did you maybe pick the wrong
> commit here? At a first glance it looks like commit 073bde453635
> ("drm/nouveau/kms/nv50-: disable dcb parsing") introduced the issue.
>

Nope this commit causes the regression, as it powers off the display
core in devinit, which means later we don't detect it because GSP
doesn't power it back on.

Dave.
