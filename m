Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3117348424C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 14:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F7010E126;
	Tue,  4 Jan 2022 13:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A15410E126
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 13:23:56 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id v13so32218911pfi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 05:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AYl7OGgsDevZ1YhYtPUS/ameXPSP5hKBSJx5w8gtDiM=;
 b=x/sV2sBU5sFAQP3PtWeb3jrM6duOucrnjkLJuZJ+JDEO1e5QHAxjeMrgBnMOZB5ZCI
 SnmJUACk/BiWF5DhqRZJWMn3ZHQP6Ur03gdEnZjroY+nr3uA8X9BOBHkKU7PmmZoYwiF
 kjH/8q8zQytDx4PF6UTymgUAX4Lfiu34gFZCmj+xb684Dq2RVFfLLToezMpH74ck5f3l
 JDT10l4rW5FevyLLOk99Qkd9IyruDkX8y5k0Ao3kFBuASCo+RD+44Xmpn46VSC//MBJg
 +0OEwnDqbFvZaJ6oFtNbN/MyEZRT/SjMbjQt3GuGqqHiGThj4aEktfPgbJ3Tlu0VOf5S
 8sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AYl7OGgsDevZ1YhYtPUS/ameXPSP5hKBSJx5w8gtDiM=;
 b=ENbnMaw9sy6oOdOAet5wfm0moilaXKXFAaSHGYLgexIBOXmdKcHZN2G83ARktmx/iD
 Zo5Vhvpq2YChhCGmD8bvQLBbXb/G7xyGhT12pqXU4wsoEkT3lEDXpf+tFeWoR6uOOUna
 GZ3gZboiNkBQAUCXoo4pQwR0c8CqUsfzLDZmmypHahner0lTWRccdtUZ2eeGt89Tw5w1
 n7sjQqFftaI5f/arnsPJw3132Iu/FAi2vfN0s45BZAKdYtVHvlYHlZoQdWZphEb4NqFV
 Wx6vcve2NZhx4jPtkzAwYiKTP1dQAqrSJj3NDLUokZQvNj3dzpPks60rsDLpP5atlxRD
 theQ==
X-Gm-Message-State: AOAM533YZ3QKdjBkRrqWyQKuzwg0TNsg2II+wtd2FOOg+x9kbHonFjFx
 DEWmKjBnQoWxKTz1ctFlHe4KmVD4iJST7ePt+VkxcA==
X-Google-Smtp-Source: ABdhPJyYp1zio0AXqURaV2Hk5f7InCnKA8eUdY+pjgjH80ShesXc3WIrTyjkYSdGhRFhLuUSnGxGa8tVX0/c4HJlPxI=
X-Received: by 2002:a63:854a:: with SMTP id u71mr43769576pgd.201.1641302635660; 
 Tue, 04 Jan 2022 05:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20211119145325.1775046-1-jagan@amarulasolutions.com>
 <CAMty3ZBGeHHWQ9C7mJn7i3i1HFEiqNmTUVe0_3O1uNwCHeFM5w@mail.gmail.com>
In-Reply-To: <CAMty3ZBGeHHWQ9C7mJn7i3i1HFEiqNmTUVe0_3O1uNwCHeFM5w@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 14:23:44 +0100
Message-ID: <CAG3jFyvL9qkOBxa7DVrUhCRUUYZuMBoi84b-TrnGVYr6nn5ARQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: chipone-icn6211: Switch to atomic
 operations
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 19 Dec 2021 at 17:41, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Fri, Nov 19, 2021 at 8:23 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Replace atomic version of the pre_enable/enable/post_disable
> > operations to continue the transition to the atomic API.
> >
> > Also added default drm atomic operations for duplicate, destroy
> > and reset state API's in order to have smooth transition on
> > atomic API's.
> >
> > Tested on Allwinner R16/R40 DSI.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
>
> Gentle ping!

Reviewed-by: Robert Foss <robert.foss@linaro.org>
