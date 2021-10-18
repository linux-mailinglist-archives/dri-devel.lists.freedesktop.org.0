Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D9343198B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 14:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB416ECC5;
	Mon, 18 Oct 2021 12:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A156EC55;
 Mon, 18 Oct 2021 12:42:31 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g10so70785968edj.1;
 Mon, 18 Oct 2021 05:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0iYdyokYod4LZcTae4ruCEjJ8TW63KspCJvOc18aEGY=;
 b=DJ+DZZJWvqJ+4q6RDg1mfZwz48wraW0kyXocBAP5Nx8CsQ6SvSlzie5M0ATmxYMYSr
 5ddXvb9oQ7nJ+07DAT9qVQYyvaO7dgKLdAVx4fy7ppmamL1CgoVOaOZc0ti4yMouxrAJ
 JQGs3E/mH8IcXzjdPUDpLhBvHkhfC176YCvJC1m8rzQ4RBGQZ4iFPZOt+51iqBw92O3s
 JUmlIijDEXLVS0HeA7vwNO/OW0QbFfJFYcRra9wpNb/3TcCNeHd8NCYn6gW1VlsG9OQ+
 AmdYOWtDf9F7R5SV1V1BDTPXZ7Ftl3T195Gi5x4aCm+mz/4TDMThJ5D7xB++j582xUoy
 KHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0iYdyokYod4LZcTae4ruCEjJ8TW63KspCJvOc18aEGY=;
 b=19el1GU0rf1D0HwZ0KDkfc99hz3lR5GCSIxOUJ1p7HWoOlLuWMJuOQkBBvPznfrYXU
 uDryWmIpU65Q+uYVbH/FIVlhkGlV8aSWI2PffXq3ajSUoc5eB5XK9nMaRrGSJsFIdws9
 NSAajz+QRUxDTyaqYvnFgaR61wOjUWF6OT1ZSMGe1D8OT69pJNcOkTS3MR50rrSSmTDV
 5iA0y9lkx/kE3YN9P1Oq03A7lbwrP9haLJIvoNBlk0w+2Iv9yGkllpx7P1lyi9A9ed9i
 EQ9c+9z5ESRtUZOQF3ZEoZjpelyITjH+j7dnirQCEhUI95Qp3oBXUGKVFozjUi/kJzEX
 +qqw==
X-Gm-Message-State: AOAM533PcrE2pZn2RxJr5afFK200/QsSHus1PAb9tmZA6hZx2WvNaTb6
 2Uj7HBJyhIWCke+WXGTkyl2yff3ZAKYOVEy22NA=
X-Google-Smtp-Source: ABdhPJx1Yr8Ty0BkPpsKqK9TDNUWSEsCZ86NgCSskCbZwziCccTqEDcX8aJvx4og7kLumF6keMezyg1srwlsiXGmd8U=
X-Received: by 2002:a17:906:9888:: with SMTP id
 zc8mr30340887ejb.504.1634560946664; 
 Mon, 18 Oct 2021 05:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <75e8ba40076ad707d47e3a3670e6b23c1b8b11bc.1633874223.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <75e8ba40076ad707d47e3a3670e6b23c1b8b11bc.1633874223.git.christophe.jaillet@wanadoo.fr>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 18 Oct 2021 14:42:15 +0200
Message-ID: <CAH9NwWdC1pV6Uwe_2NkBZGeUb_ejFH-YVYdhx0wpmZbL8CnRoA@mail.gmail.com>
Subject: Re: [PATCH] drm: Remove redundant 'flush_workqueue()' calls
To: christophe.jaillet@wanadoo.fr
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, jyri.sarha@iki.fi, tomba@kernel.org, 
 linux-graphics-maintainer@vmware.com, zackr@vmware.com, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 The etnaviv authors <etnaviv@lists.freedesktop.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am So., 10. Okt. 2021 um 16:08 Uhr schrieb Christophe JAILLET
<christophe.jaillet@wanadoo.fr>:
>
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
>
> Remove the redundant 'flush_workqueue()' calls.
>
> This was generated with coccinelle:
>
> @@
> expression E;
> @@
> -       flush_workqueue(E);
>         destroy_workqueue(E);
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

For drm/etnaviv:
Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
