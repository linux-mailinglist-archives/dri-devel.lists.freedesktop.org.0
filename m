Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F6968885A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 21:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5F110E1FA;
	Thu,  2 Feb 2023 20:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AB910E1FA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 20:41:25 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso6671643pju.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 12:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tk3RaGDRfRVv0tlpJCdq6gLxpXZLUoxuYeWx+eXPzUo=;
 b=MENKp873NXo9ALLlUOUDHg9jijpviObR/IUQ29GZLl1vem82P6QA8dis0ITSUgphAB
 16LhCFBhrXHxAtYdGSTdO7GY/AjEnTjEbSdymoI1Yfj0C2ZTNP/GfGF4RqEJVb/bTGB8
 PoFwztIJQLkrroZqHl8Aj27vPM4CPJ3iICg/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tk3RaGDRfRVv0tlpJCdq6gLxpXZLUoxuYeWx+eXPzUo=;
 b=l69K+rnXQgy1hMll001ETGbanmNbQtabhr35PGYzf/Y/DSc6Cqgfo+3ioLO0EARgnI
 8VdwBsHSaP+d22FRw5eCnjYqZ/9fNKkbspRsngBZLaAjLE5wSTqZfMmU10H6X9VkQwFF
 vwqwyX6g0/cRQjKN1HZRBx95VnyPuV+DWo7WS/sotoiEe5HByrLrydHgToBdw/mIdAqR
 xNoy0B+Qw8lyi3MVgkQ1JXj5ChjGfCiakSxL/05u8rG7DcUT804O1ZnckCQlVL1enm4l
 l5tIKhuZdfyxRDRWFgNlxyWaLb6DcRVjPkonVMU09/WCQpR66/ysHK9RZjqYGNaaKb32
 QQDg==
X-Gm-Message-State: AO0yUKVG8g5BXvOpQ2jorIpT05xPAUWXDYbP5FUNOGBKDRGfoTmQ77ab
 KRF/rvQvoxdBNcWgqaQbniDMVFLMv57tZJ0APncRWg==
X-Google-Smtp-Source: AK7set+VBvRA+LsX4oN7Bw9qtjkPlQ7I5Hxc6/6dJQv4z010NW4PdMvc+7/j3zrP/NSzeXIY6tYisvZeVynKKDhRGkY=
X-Received: by 2002:a17:90a:540a:b0:22c:6223:d27a with SMTP id
 z10-20020a17090a540a00b0022c6223d27amr799859pjh.61.1675370485030; Thu, 02 Feb
 2023 12:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20230201170210.1253505-1-greenjustin@chromium.org>
 <20230201170210.1253505-2-greenjustin@chromium.org>
 <e96bd735-cf36-0dbd-cf93-446c1ab28778@gmail.com>
 <CAHC42Rf8+yS45VBUc_dDuvCydg4ttKYuGwdgFshZRUZWzGiXRQ@mail.gmail.com>
 <15711c23-43c4-86c4-0f56-4a76b5ffea46@gmail.com>
In-Reply-To: <15711c23-43c4-86c4-0f56-4a76b5ffea46@gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 2 Feb 2023 15:41:14 -0500
Message-ID: <CAHC42Rff5Xj_5bJNVozAYnG+ujjZ+R1DjDfWZn4GvsyQV+do_Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/mediatek: Refactor pixel format logic
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Yes, I had a comment on the naming in that patch. Never the less, I think if we
> don't need to "overwrite" the value, we should use just one struct for the
> values instead of copying them to the different .c files and give them SoC
> specific names.
I don't have a very strong opinion about this, and in fact that is how
v1 of the patch worked, but Chun-Kuang specifically suggested moving
that struct into the .c files a few versions back. I think it makes
sense if we expect additional skew between the different components
and what pixel formats they support.
