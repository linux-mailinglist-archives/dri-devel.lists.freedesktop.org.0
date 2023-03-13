Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891CE6B7ACB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 15:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAFD10E558;
	Mon, 13 Mar 2023 14:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C6B10E558
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:47:05 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id bi17so9591541oib.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678718825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=923lbrDnlGJSqSY3Xt8v6D4PUhcMD5WLpjqFY9Dv+lQ=;
 b=N6JPqulPkDgn21ORqIZqJ56J1lBbYUaeHV0aEIemOsHOhKxKuf3/iru8tdPyO7R0H1
 QFzf0lEcpgB79Bu2NByEFGGIPtq348JwvO1PfstrN1dtLTKtrA9fcIUf4yQn6S7dt02o
 jalgj97ykc1GBx0mp+fb4Uq/sAGxsPlk4+Wb3soj3besvYBfIG4PIihVtbNny4orImCN
 82LbcI35gstnU64OECe7g4KBBxw6nqQsc5CVs8s4rt4rSLRY7emXIQ8WTNpO3Qmf6SjD
 4G7MY6RfnzMXYV91AKB1wVIr23FRKpxvNMDLPvnGhfUwpr76C7JROHqze7au8tSF52pX
 /pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678718825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=923lbrDnlGJSqSY3Xt8v6D4PUhcMD5WLpjqFY9Dv+lQ=;
 b=r3NTOKtwHdBycWXfSUfDBRA+OeCS+Qiyt8gXzgIylN0GVAQfC8iAIN+QkVAaeWQPM4
 C0R0bzw0+8wpp/mejmN8mUGVmL3jLgPt9I0bYLiejnIMfYLWalrNCKFWs82lwa4upsO3
 fxLskdY0CxMbFtXeG00XHsVCOh0Gs1QFdAPbGKCY3yUevmc7cV5vSIwM/NsY/XGTyy03
 L4O6T+iRtOvmn2e42C1l34vVjp2n2lWtWYSRo79JS07uzF3TCTG1qj7owsSwRmEJMwkZ
 qLkeY2n50zNJ8kV1AkVNHZsx5iy7Pn5OjG1TsLUHphKlkpqxTFoBwPTaBbAz4DCUfIPG
 jPgg==
X-Gm-Message-State: AO0yUKXOmrXpBKQ5G18L/yycvXQ4zYlJb5UzFI0pZERoNRImdDeAuOtL
 CFueH8Ks++3NNImRIrfgPXLx55MqjyNzaeYIeD4=
X-Google-Smtp-Source: AK7set+t6Zd0ULAt1RXgYIU+6YQcPZGwFKu1FRMUu2gsq4o+CZmjaWhnRZBvBJFJVHUMQWkpBWPI8LlTbokFdPkkWH4=
X-Received: by 2002:a05:6808:220a:b0:383:db64:65 with SMTP id
 bd10-20020a056808220a00b00383db640065mr5427713oib.4.1678718824817; Mon, 13
 Mar 2023 07:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230312204150.1353517-1-robdclark@gmail.com>
 <20230312204150.1353517-11-robdclark@gmail.com>
 <CAJZ5v0gEmFj5Yrm0OZx5XhvGStHXx1OsPXGQqmbFQpeYSADkwA@mail.gmail.com>
In-Reply-To: <CAJZ5v0gEmFj5Yrm0OZx5XhvGStHXx1OsPXGQqmbFQpeYSADkwA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 13 Mar 2023 07:46:53 -0700
Message-ID: <CAF6AEGvDf0R3xhjhQn9Qub16FmP0wEM=vTO7xTmcQc4s0iY1cA@mail.gmail.com>
Subject: Re: [PATCH 10/13] PM / QoS: Teach lockdep about dev_pm_qos_mtx
 locking order
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 5:31=E2=80=AFAM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Sun, Mar 12, 2023 at 9:42=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Annotate dev_pm_qos_mtx to teach lockdep to scream about allocations
> > that could trigger reclaim under dev_pm_qos_mtx.
>
> So why is this needed?

Because it allows lockdep to warn about problems even if it hasn't
seen recursion into shrinker yet.

BR,
-R

> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/base/power/qos.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
> > index 9cba334b3729..d4addda3944a 100644
> > --- a/drivers/base/power/qos.c
> > +++ b/drivers/base/power/qos.c
> > @@ -1012,3 +1012,14 @@ void dev_pm_qos_hide_latency_tolerance(struct de=
vice *dev)
> >         pm_runtime_put(dev);
> >  }
> >  EXPORT_SYMBOL_GPL(dev_pm_qos_hide_latency_tolerance);
> > +
> > +static int __init dev_pm_qos_init(void)
> > +{
> > +       /* Teach lockdep about lock ordering wrt. shrinker: */
> > +       fs_reclaim_acquire(GFP_KERNEL);
> > +       might_lock(&dev_pm_qos_mtx);
> > +       fs_reclaim_release(GFP_KERNEL);
> > +
> > +       return 0;
> > +}
> > +early_initcall(dev_pm_qos_init);
> > --
> > 2.39.2
> >
