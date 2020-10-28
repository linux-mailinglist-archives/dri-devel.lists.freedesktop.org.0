Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A070A29CD77
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 03:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1866EC78;
	Wed, 28 Oct 2020 02:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5126EC78
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 02:02:59 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v19so3477941edx.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hG/V7I2zHbr42FmAJgBYe7N+Q2ImKG1ReX2uXzPeJoA=;
 b=N9tAQMYymH4T5ZoXtpmoSrDY1bI/JodGHLrybNOA4paZCQGCvRIlOPbAqrZS7lJwvF
 RGU/JuzjL+hfQYhgSDlDmlxGil9iZtitcHSsSqlNSqpTPfP1uZKFjJztJh5BYx1J4k5+
 d3bAoKORUAMlsx5sNkvcLLHcdV6UZy3HE60QquXyNl248P223QD8rgyhKOC/V4j6l3Z1
 cri4lX1Nqun+bHOdnj+lXx2viDLP45x6qUCsP0RBVWis41ikB/jlgYWZYqF824JXUSN0
 jqtOfQhQt8/Y82oEblNZVWzQWGD10xjLtsQEIvVZ+jT4OrH0ik3rTRfVA0s8OK32juTv
 YLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hG/V7I2zHbr42FmAJgBYe7N+Q2ImKG1ReX2uXzPeJoA=;
 b=AX/YLoGVrrTJIXvj7QjGtu+BQ9mEGegVG0Am/TRQLYGMDNjgvxiLlpVbhtNHakRzx0
 J6uncJeSmh9/M+49Shsh20zqjZbxHRTzUqVUFoxv38SPu1/ek5DE/ZZtIIpG66uqzf8W
 rCkpDNPvcOhxDTvCCwC+qRYmz17th+HRS+gUIIQnGKXk3746AV2eZJ+nmfnw/P8IK9ZE
 7GRyba2EQVHqzeCAiHzOlsFTQgy6ulwawDlSuK1HxRfaFqyUQWiDIQem/gh+dDEOfkF3
 Z/w7On9WlZ9AwSA5etqDGYnpY5Vai6ya1G2xbeqjBT/LNnHI7wYm275rCJfj94qqmrDG
 R0mQ==
X-Gm-Message-State: AOAM532GDtMTPIkJvxts84ku1gdMk1Gdzh2sYkxAcr+osO9YYK6fL+ha
 GqzWd5R3wWs4cr3lY1GtfwW9TWD0r6K3g9zuAdM=
X-Google-Smtp-Source: ABdhPJx/jUywXGi1tE4UQFP4qzF8ei0O2ISamJFJ3vhUsFKwVV619TKVwSW8S4Ory6R+GWtbL5C9IYH8IlMHiv8fplI=
X-Received: by 2002:a50:d987:: with SMTP id w7mr5284262edj.113.1603850578391; 
 Tue, 27 Oct 2020 19:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201021044031.1752624-1-airlied@gmail.com>
 <20201021044031.1752624-4-airlied@gmail.com>
 <20201021083320.GM401619@phenom.ffwll.local>
 <74b25de5-f0c3-62c8-d511-642e8b7a3b18@amd.com>
In-Reply-To: <74b25de5-f0c3-62c8-d511-642e8b7a3b18@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 28 Oct 2020 12:02:47 +1000
Message-ID: <CAPM=9twwnNC0kv_drCjyLxd1c81+UP32Dwufb9n_q7j4+gdUxA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/ttm: avoid multihop moves in drivers.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since I know both of you have looked at this, can someone give me an r-b?

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
