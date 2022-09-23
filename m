Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30F85E7C3A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 15:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B163110E7E3;
	Fri, 23 Sep 2022 13:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE4B10E7E3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:48:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so5272988wmr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 06:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=BUzRP0p1X0Mnqesdqq2xF7++oYvstTmhDzD4eVSQyhg=;
 b=SiXdDxqx+GDrm/8ZjlHEFRVwUyC85IYk9Z52voujerHdnBdPfwJRaa0DdiJC8rWP15
 sUCnMhWfYEbAJYF7Qx8vajCwQUsb8Ct2cAD5j/MYwFoODzUfy5JNawruf401Zte0BoOD
 hvXmcrMPnjdqLor2pwoCfb5LUL7E13Zfe/YuQwtkhR0W2PiqAGLeuqnmwP6iSE1JGfaf
 JnR1U8BEvLK0JG4iDvZVzXm2N+lyfkcmmK2kppo9HAE9zxwMqeZwXf4jLV66B+O8rGpO
 o+MCnTSiWe9fz1L36E/vB9UKlSBrzY6LEqvdgIKKTLzUTKmrQsSHwcDTq9LVbGxb3/Yu
 uVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BUzRP0p1X0Mnqesdqq2xF7++oYvstTmhDzD4eVSQyhg=;
 b=eFQtSuWaIRUWhoxX/tQ7OBf8fJd5jZ082fU9Zi97Iuv3eUbs1gL+OA1sIw1itQ8T7d
 +EIEOBeW2nJXtlQ4D7zkPEOLpm/80EdDDdO4yFHoh43H407PxOVDfosN9dzKa3tIrNks
 AbmLUnGraeTrPU1FXLE+STK7bRHoKrUyJoVdu7j/ri74asUXkikj74ktoH+oRajx1SY4
 5sGzBk9pdm/m4Ki4Jp3l1omSkB+ppN1zzfC1P2p8eGHzxwNmJmwhPAN4OJDy0vzXl0g/
 dJRQP+g1+svxI50B+jg0srnxyuZVvMHlpAVx9Y4zLjwSk6i6kFgTZxtvSZeLozY0K8Gz
 lcGw==
X-Gm-Message-State: ACrzQf0XAgQHx9GvrFq+cP++Xc/A/+SNrUo+O0vCOc24b9xWrXg+s4gL
 LJpXUccjD4QEASHqXKddTBM8k+ffl270fm++6HOXnw==
X-Google-Smtp-Source: AMsMyM7PJMK82vyl7ByS7j2Vrx7R/4LVO8mCaCKa5Y2qghQqx/YeAnEjZWnj+fmXqsQ6LcGtZMyUbfqS+mvspNukOkw=
X-Received: by 2002:a05:600c:524d:b0:3b4:91ee:933c with SMTP id
 fc13-20020a05600c524d00b003b491ee933cmr12517071wmb.100.1663940930533; Fri, 23
 Sep 2022 06:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220923124904.1373936-1-victor.liu@nxp.com>
In-Reply-To: <20220923124904.1373936-1-victor.liu@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 23 Sep 2022 15:48:13 +0200
Message-ID: <CAPDyKFqdHX=o4V4K8GdCr4wQ5sjr=JMG6CFAy1849=CtfoSgRQ@mail.gmail.com>
Subject: Re: [PATCH v2] PM: runtime: Return properly from rpm_resume() if
 dev->power.needs_force_resume flag is set
To: Liu Ying <victor.liu@nxp.com>
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
Cc: Len Brown <len.brown@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Sept 2022 at 14:47, Liu Ying <victor.liu@nxp.com> wrote:
>
> After a device transitions to sleep state through it's system suspend
> callback pm_runtime_force_suspend(), the device's driver may still try
> to do runtime PM for the device(runtime suspend first and then runtime
> resume) although runtime PM is disabled by that callback.  The runtime
> PM operations would not touch the device effectively and the device is
> assumed to be resumed through it's system resume callback
> pm_runtime_force_resume().

This sounds like a fragile use case to me. In principle you want to
allow the device to be runtime resumed/suspended, after the device has
already been put into a low power state through the regular system
suspend callback. Normally it seems better to prevent this from
happening, completely.

That said, in this case, I wonder if a better option would be to point
->suspend_late() to pm_runtime_force_suspend() and ->resume_early() to
pm_runtime_force_resume(), rather than using the regular
->suspend|resume() callbacks. This should avoid the problem, I think,
no?

Note that, the PM core also disables runtime PM for the device in
__device_suspend_late(). For good reasons.

[...]

Kind regards
Uffe
