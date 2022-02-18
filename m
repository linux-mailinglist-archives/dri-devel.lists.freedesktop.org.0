Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7824BC763
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D48A10F6A4;
	Sat, 19 Feb 2022 10:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8CC10EC3F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 13:01:17 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2d66f95f1d1so65392327b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 05:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uYyLc4IH0ANNIsB/psBxiotNSUOVb/aQHzaP0Me/9TA=;
 b=Ge1hDFkkzGp9J4GrZHJA8BCxzVqbwg2vJseoylQBv2nQnO841dVcd056S2TfrEO9kW
 3k8MmXEk67ZTxa2SZcqM2aw2H/QQBWu6bpd++xs+ma3wMTzSKjLWYrVWviXsKqScjGIy
 JBEI/zu22lbB/KleMt2ckXoj3NvwxIlz22arsXGj2Jfrq/Qm6/4wwyuCY5gkNC6iH0Ng
 C6zmSbFs0KCazV+dwBLFkK5EdyCgy9bpoQsGsbetRtUbqFsbOkJjjP6VMguZQUMJAcL+
 TUCMMWWme7Lm07sC4OMPGrU9OUzIAQM6aF6rEgkHXtTwIEUwx8M8TqKl7bVNEWL449Hi
 QOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uYyLc4IH0ANNIsB/psBxiotNSUOVb/aQHzaP0Me/9TA=;
 b=lcMQ+mDhfaOt1Qizus8EGD4Yoh8HY2jo3joPR0MPpejSbq3saU4qVP12OAsYd3n9WG
 ad1PEumZm/xRZDz5Eh69Co/oZzh8pIMOIKXi+/mq5//8Lwz2ENKiHVzrmnvNoLBOPnqW
 nx8sYKjGAJ/4iF+gRlGoybNjcrs134xNXU8Mg1qQzyjw8gjX2QW3N3t6MlAR5bByKgqI
 SPRWJVE6/ed8D/mUoxeuqVQArL4z8c9czZet+nbWQUzHmU6ht760v8yFQLSJcz0Ns6Wz
 qK8eTpZLCETRwFP1ddbPWOpSah+6FzO+yCm8RB/yYi7iEurHOlfV3X8iGy3TcFHF9qpO
 nrBw==
X-Gm-Message-State: AOAM530JueViZUk4eGzWxOwY9o9wXi47duZks92xxZ2AoaG45pnuYC6m
 zwPAJlo2tn/ZqDadxjQXypzTT6DU5fL8HEnaPyYjiw==
X-Google-Smtp-Source: ABdhPJx5BaCIdooqbWjruWTtUUDC47+tdWkDlNMYn+20tj10zAQ1ZbZrdq6HmMfOq79Xwu39p4eKXdpoFDV58JG1Sdw=
X-Received: by 2002:a81:1d5:0:b0:2d0:e2aa:1ae0 with SMTP id
 204-20020a8101d5000000b002d0e2aa1ae0mr7282027ywb.278.1645189276021; Fri, 18
 Feb 2022 05:01:16 -0800 (PST)
MIME-Version: 1.0
References: <20220217140441.1218045-1-andrzej.hajda@intel.com>
 <20220217140441.1218045-3-andrzej.hajda@intel.com>
 <CANn89iKgzztLA3y6V+vw3RiyoScC3K=1Z1_gajj8H56wGWDw6A@mail.gmail.com>
 <199aebfb-f364-cd9b-5d2b-dbe42b779a41@intel.com>
In-Reply-To: <199aebfb-f364-cd9b-5d2b-dbe42b779a41@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 18 Feb 2022 05:01:04 -0800
Message-ID: <CANn89iLS5oqOvafFy9SW0CDiyv9GGJYsE8MpE200K5NaA8h0xw@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/ref_tracker: compact stacktraces before printing
To: Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, netdev <netdev@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 2:55 AM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>

> OK, could be faster and less invasive.
> Other solution would be keeping the array in dir and update in every
> tracker alloc/free, this way we avoid iteration over potentially big
> list, but it would cost memory and since printing is rather rare I am
> not sure if it is worth.

printing is extremely rare [1]

We want to use ref_tracker in production, we need to keep the fast
path as fast as possible ;)

[1] If you think about providing access to the traces from sysfs, we
might need to make sure we do not hold the dir spinlock
during the expensive generation of the output data.
