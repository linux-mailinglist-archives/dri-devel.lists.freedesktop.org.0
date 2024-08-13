Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544E8950B8C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E45010E3B8;
	Tue, 13 Aug 2024 17:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="fU5jGcnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8DE10E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:40:49 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e0878971aa9so104963276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723570848; x=1724175648;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GgufDS8O1v7BR5tsZE+aldeple21s1USye3EdwP6M/4=;
 b=fU5jGcnMTRkSdVdTRGLeDdVV8LZWEHxO3bwiPQThCmcIn/RxYSEkB9UX/eqm8ZZY42
 xTFVwzqVZVTyO29n8+06NphUPW8Ctil9sTW2DZGJUWEaLl+5xFGulTEctCmPUkl4GYKA
 cp8guehy+WyR5gi5M94svDWDkreEjw/56JIUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723570848; x=1724175648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GgufDS8O1v7BR5tsZE+aldeple21s1USye3EdwP6M/4=;
 b=RjWgCvXn9WdbEHHa9HlxS4pBT/gxA8N+iAMKYsL3TMblpQb0x0crL/doX6boodIBF7
 VtE79vYHbWfWMNMgqd9n4dTMFlERa/WnpggkUrfK5Mqdgz8VVs6rTnVrJny7cREsZZ79
 qo2aXsebAxJPWcpRPYrUHnnm1e8Ylbw+UeWrz7lr8OhMIXaQI+M+gg2Ex0RRdDZ8RkBM
 VlfLbWtVyC+Sd3Xye7xU/2GMImQBbAhtwggV8QcmdUyeHs5Z/wzHpYC3gjTcmN2IqL8Y
 KV4OF4r1mteZi+CtEKHdyvTfILHG6cURx8S11Z+dqjuhcsy5X0kBjCgenDyyJDiGOfxp
 8YOw==
X-Gm-Message-State: AOJu0Yy1Ojs9rSg4s0+M1RLrtXr+STjykj3cbf5UpEnw1d3icXmOsnxA
 fTNHR4dBTcz+MyVbmdol76RpUdjGoitUEvvjOsj3VfpI/DWlJ7il3/luTdww0O3mmpSbNjab3Sc
 SAub01u8X5UaL83FJgSPfLYwss7fRU+nZrSR7Wx1gQ67G8fU=
X-Google-Smtp-Source: AGHT+IE8psTnghl+RGcXVtPTE07/3VNV/5PqLY1f9KAHCym7306ApXTEvMy/9rFaV7ye+4ns11fLC2PuIxeNCBSeU40=
X-Received: by 2002:a05:6902:2e8a:b0:e0b:ddd8:cd90 with SMTP id
 3f1490d57ef6-e1140ebffd3mr3618391276.24.1723570848659; Tue, 13 Aug 2024
 10:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240801175548.17185-1-zack.rusin@broadcom.com>
 <CAO6MGtg7MJ8fujgkA5vEk5gU9vdxV3pzO9X2jrraqHcAnOJOZA@mail.gmail.com>
In-Reply-To: <CAO6MGtg7MJ8fujgkA5vEk5gU9vdxV3pzO9X2jrraqHcAnOJOZA@mail.gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 13 Aug 2024 13:40:37 -0400
Message-ID: <CABQX2QOeWoVcJJxyQOhgO5XrsLRiUMko+Q6yUMhQbCYHY44LYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vmwgfx: Prevent unmapping active read buffers
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 martin.krastev@broadcom.com, 
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
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

On Tue, Aug 13, 2024 at 1:29=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> Remove `busy_places` now that it's unused. There's also probably a
> better place to put `map_count` in the struct layout to avoid false
> sharing with `cpu_writers`. I'd repack the whole struct if we're going
> to be adding and removing fields.

Those are not related to this change. They'd be two seperate changes.
One to remove other unused members and third to relayout the struct.

z
