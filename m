Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C85563FCD
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1F318AF5F;
	Sat,  2 Jul 2022 11:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEC718AF40;
 Sat,  2 Jul 2022 11:42:07 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id d2so8412974ejy.1;
 Sat, 02 Jul 2022 04:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WhjM8Dp4mS9IBPn4kroy2wdgNNIdUgixClIV/mTih4M=;
 b=G5aRF3FDYzEYd2OJ5K35vT+eFEdkrmjc4c7Eyr428zyoAOxx1WuwoNBVxL5OykT9Lu
 RexthZ66BUxwMN9n+wsoTcNXyZfAWPmJtVqp8TW1NBR0a0fgCWytzFhLUCOCAAfzoi/y
 EPTkROUbArwuiq64voho2IYwp5VGYM1UQW5d7qK0MhzACkhycCA4xNkh3wfBjqpi4ZDq
 knyLD82Xsy8Q3GNqABz6Kqqd3MqaucKwLepqBbevKFMi3DBzmifbOTj8j5y4N3gQdF2A
 8hwR7Cjop8kQXTMOF5hNlmszW/Rtada7eBDmlBxAAeoxCjfRH68icS46M6HcvSmBoBuh
 C2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WhjM8Dp4mS9IBPn4kroy2wdgNNIdUgixClIV/mTih4M=;
 b=fz14tV3y4F0sFpMhKd8q09C9EYiCruJw5jrVIbh0vOo2MRO5vNk8o9kArk0pWQam2m
 8TppBR6iNzFIIErm4L2jVao4aU2nwU9nzEQj6EaegoYjAyI+WOTgt+hTJyhfYtHOul4y
 5Hn3AKf8efQTreLE6w2LkBEkd1Cf5HXCq73lGvwbKAppwjRAbDJfa0r+YqrVSfKXogZL
 rzTxkvXEoNIdVWW4mC0f8Ev8qW/AKto2ObhPWLYQ/3FBvR/BtO3qIXexXpLM24HDIeUc
 D58QlqZJqzJtWXhtbgBDVTBMygW2EOog2raXR10cfdK8n6oXnMwAbiiTtdCcIO3PdMmD
 6j8g==
X-Gm-Message-State: AJIora/hu+WRt535/cAqML8i/VVShMtPGzd5/NuAjTMYltNBuJw8XtTW
 xNtetR36UL+8A9RpNSEI+7TM2MzzMC4ITpZqOOo=
X-Google-Smtp-Source: AGRyM1sMKM+Zutej2Lk/Zoiz7uwcW9yWj8/qcDHkuNHPs5bqlatUV3f7qzNzERj7fejcIgDRX7YVW7CkMZKXqYYhmYk=
X-Received: by 2002:a17:906:4e91:b0:722:f996:fa20 with SMTP id
 v17-20020a1709064e9100b00722f996fa20mr19148286eju.733.1656762125876; Sat, 02
 Jul 2022 04:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220621072050.76229-1-christian.gmeiner@gmail.com>
 <20220621072050.76229-2-christian.gmeiner@gmail.com>
 <1a694037c631c298c6952cdf4bf54fcc6d2f08e9.camel@pengutronix.de>
In-Reply-To: <1a694037c631c298c6952cdf4bf54fcc6d2f08e9.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 2 Jul 2022 13:41:54 +0200
Message-ID: <CAH9NwWf11tcQctdQhk5AoKT-Nz-ujMRaQJjfVydNDnT==+S+_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/etnaviv: add simple moving average (SMA)
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP"
 <dri-devel@lists.freedesktop.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

>
> Am Dienstag, dem 21.06.2022 um 09:20 +0200 schrieb Christian Gmeiner:
> > This adds a SMA algorithm inspired by Exponentially weighted moving
> > average (EWMA) algorithm found in the kernel.
> >
> Still not sure about this one. I _feel_ that a simple moving average
> over a period of one second does not do a good job of reflecting the
> real GPU load for a bursty workload, where EWMA might be better suited.
> But then I also don't have a real informed opinion to offer on this.
>

I will play with EWMA and see what happens.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
