Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01054DA91
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AC510E411;
	Thu, 16 Jun 2022 06:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA1810E411
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 06:28:49 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id bd16so804299oib.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 23:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=oHzgk00KbwIuUTHYZ9Qcy9lwARKoBhHrOAHADrH7xNM=;
 b=HVBEMJsGibu/PZCc2Oo4PzjURFnvRk506flDbSN4xwS0y2PjJf+iH41jcOp1I6Wchm
 zW3ZN+tnZIz/vQek0kPbYwYPeBGg7OJYiBdi59yRgj+nQLXeML5DGMf3e2FBgtqOXQID
 oiN3ZoTYEJwgzZ1on/qn48BPcgv7zX2ndxid0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=oHzgk00KbwIuUTHYZ9Qcy9lwARKoBhHrOAHADrH7xNM=;
 b=FMHdkwSW+URkkTirIPT6qM+KyMWjrXhWISEI6Jm2tD6yt+YyPuy4M1TEHyy/0LORS0
 AJkBWoQG6jwgyOflwWOJjXbquutr0lWregFGE9MAcj+LUvCRK1qyRkLPNHEAk9cxQ5t7
 jJm8/78v2Ia5f+Hx5g/jKSXket/KJV7Z+FXDKr9jHN4jxhldN+aiAJlkMnHFfKtbzvjW
 6wGy4e3zAWMXtEDFtDjK/wJ+chbVc0+dNNeDYoDQ8JVtto4DohJc8lM7kPx28lzihuL4
 +W1GECFnjOJDJlBqQBRkfOIipm/ukumFqRMxDGkLsB5gMbasEw4qafnSYmKFvvJHSevk
 XsdA==
X-Gm-Message-State: AJIora/gjO+VDKvn8T1kbOlZW1FrZdjvenz9XdCoKdyOzzos0NIgujy7
 0LpXnjEctDiYo9ZH6v9aVenj0nPaEP1x+mjL+U/AIA==
X-Google-Smtp-Source: AGRyM1tcwZUQ2rA8bof/saOnrh/vjmhDjc5rzhpkOThv5IvGNh6JpRcQCLoNdyIR0ePWrf6HSlrb9PxK6jNWYy09svE=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr1785243oib.63.1655360928893; Wed, 15
 Jun 2022 23:28:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jun 2022 23:28:48 -0700
MIME-Version: 1.0
In-Reply-To: <CAA8EJpq1Td71FwBP5saYTAnS5zK28om+2C79aMPii06ui2JR+w@mail.gmail.com>
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <82b09d4d-1985-519e-3657-0d15e07ccc2f@linaro.org>
 <5b35ee5a-ed94-1440-cdc2-909a82c3aa61@quicinc.com>
 <CAE-0n50gNX6XP2O9FJVJB135YUGhi5e8Gqb1FAxj20YQSvumuQ@mail.gmail.com>
 <CAA8EJpq1Td71FwBP5saYTAnS5zK28om+2C79aMPii06ui2JR+w@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 15 Jun 2022 23:28:48 -0700
Message-ID: <CAE-0n51CQKObqCmyRaZVNTpX1WWDZ-1KtzQdtU72va-gnFwJNg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-15 23:21:56)
>
> I have more or less the same setup using a longer format and using the
> git-log instead of git-show. This way I can just do a git fixes
> drivers/gpu/drm/msm and spot the commit in question.

I've long desired to have this be part of checkpatch.pl, but nobody has
done it yet. Maybe figuring out if the commit exists is harder than I
think.
