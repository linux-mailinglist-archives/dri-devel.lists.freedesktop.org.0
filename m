Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E8A36DEE0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 20:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79746E141;
	Wed, 28 Apr 2021 18:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3360F6E141
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 18:16:45 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z13so19722507lft.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 11:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bQnbqIU21Yz7IsVFuLMZC9b3+5uNVTkHETJ8YPIGjUA=;
 b=Dq/BiUnK4j286jdMxydTWwCSXsnXMY6qTX9rEAcwREkRl5ZWAX6jm02gZEyeA1iIim
 LKML45U97nYBWML0zErNmL9MwW1/fZUSDqPZ4mpkhM2X7NWikuQBZT6iPxq5ADph3Eil
 L0GsmGg/AJUfTFnkGD8TfJdbECN/mbLcT6OgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQnbqIU21Yz7IsVFuLMZC9b3+5uNVTkHETJ8YPIGjUA=;
 b=YHAbGbULEc2Eryhfha7A0HE1v5niScKZlxJCpDjmIRcgUqkBR8ml1qMc7HW0UCQsGV
 /tcch3lo7Gm82xz9NRfjJ9PCrLmJQq+VqSt5+TfvVcyBbSPld4Ri4bf2uj2+x4wYbkcd
 ogA2x2DfdOgROZ/k85sPW7d2eQ/bD/9XEjdRQ0Yv+c9KLjYjXVt8o/JkdPoGbbl4bhJx
 6k6oMfs+M6ovRhN3fj2kEQGaKzx4Xj+z2bNZWU7ICgqARLmSg5k8zFHas0p8Fa8BTK1Z
 DRRNRA9nC+ymfdc4C50/kjcYswoQKEs2Wq2L9WHyMNRbLCft9rjb8fUbVKRfuDV72Dul
 K35Q==
X-Gm-Message-State: AOAM5305+0VF/pObS6iJbFAQNxUEy/dv5crjgUyE6tSptNUu3ygQfqLA
 T6+wqOc6sCeTUh9b7f69tQ8Rjs3aQp9rz5I8
X-Google-Smtp-Source: ABdhPJwMv8Infx/ji2wR7kaNzER5sAnjDxek6AT0XmQPPfcsxwWIHFNJxjrIZjEliv8QGHgtszsgQQ==
X-Received: by 2002:a05:6512:33cb:: with SMTP id
 d11mr22352828lfg.314.1619633803288; 
 Wed, 28 Apr 2021 11:16:43 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id m8sm137663lfr.55.2021.04.28.11.16.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 11:16:42 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id s9so15419533ljj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 11:16:42 -0700 (PDT)
X-Received: by 2002:a2e:1406:: with SMTP id u6mr20726288ljd.61.1619633802354; 
 Wed, 28 Apr 2021 11:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txMo5f9QvPqdzt8g3CmUpyDFf2Q_0XS4V1FyjHX8WQPRA@mail.gmail.com>
 <CAHk-=wh22MOMM5Paw-dHVvkp6W+UKx8mv_TNJ1TY9iaAMS1rLQ@mail.gmail.com>
 <CAKMK7uHn_qFrfK9Dkd41NdXd-VHFsbH4gdnX3+J=0GQ_H0C0Mw@mail.gmail.com>
In-Reply-To: <CAKMK7uHn_qFrfK9Dkd41NdXd-VHFsbH4gdnX3+J=0GQ_H0C0Mw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 Apr 2021 11:16:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=g1khafTYZH_5QhwLHv4iN=e+_F6tGzw8-+aH7wyJ8g@mail.gmail.com>
Message-ID: <CAHk-=wg=g1khafTYZH_5QhwLHv4iN=e+_F6tGzw8-+aH7wyJ8g@mail.gmail.com>
Subject: Re: [git pull] drm for 5.13-rc1
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 11:14 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Maybe we're overdoing it a bit, but we're trying to not backmerge all
> the time for no reason at all.

Oh, I'm not complaining. I think it's reasonable if some particular
issue doesn't hold up further development.

So my email was more a statement of surprise at a new pattern than
anything else.

            Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
