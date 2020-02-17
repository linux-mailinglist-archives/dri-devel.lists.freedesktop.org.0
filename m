Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3798160D16
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046C76E8D9;
	Mon, 17 Feb 2020 08:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902226E446
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 03:21:29 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id z193so16890050iof.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 19:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+kmg82PrP5LICQsxhHiVbN5R5NBrtOLNvQPwne/NGOA=;
 b=t5eF1GPF6GoODdlqsDLhBm9YZ93XeswOThOt26rhz68lYQtokb/vXMws9molPaNGgn
 YCzOzoa4OJo6ampwllRBwhc5V2yPxbfiAVCz+I1MVhcXgH0sClaKrchJASLbszzXDUc5
 PcKhaD5sp2Sny4fXmTCuj6e69ZrN5k6XoHp1YwNl2Xe3sHsf1drXgW6CMzXCk6358oVS
 f5+s2M0Hr2BmZ3zq8SGg3NkgrcKyQNCwtu34tk6FDP+xLSk5ABatZ9hwybmW6g0VRCur
 0g3whXZ0pdOD5SUi4ogFS8o8RGJpUzUaOmyI1a4Pj/3IQUZLw9vKtn8equ5zxAKJwZA6
 EfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+kmg82PrP5LICQsxhHiVbN5R5NBrtOLNvQPwne/NGOA=;
 b=SHstfM6igX8Pad2GdTEzX0xN68rzSLQeoJo8CuGItwSVLzXQ/UU8YF9q3EQ97T6mk/
 TmmKba+Vo5Pn1GdImNSI7p/Oz00nIS/teg5XARasg3q4hn3GhadjwoebFciNFugdfEAK
 Y9f+X1iplmpg1X5O1Ptho0UJRZQK8ermHSzBWJbdFaHilDiQadoC5cv4p99L0C0lTqWy
 MLl4ANQv0A1L4T7Y3FjeYd332dm4B42QkZbqnjO7K4TWdvkvxln+pO/McYn4H28+Pq6/
 n76Ye45RtLvV/+H8lL8NTfw8NcOhSSwjTNgA3mW/D+GuJC1JEJmKUFGcihvWGdEEODiF
 CvJw==
X-Gm-Message-State: APjAAAV7bhNIdE63q3ej65kDzT0sC2lO+qVzt4hO0zJuJU1s1TV/K+XU
 qAP5K50NItuanKZtPBPI2UoTG7W2oGsgNiy0GxxUYg==
X-Google-Smtp-Source: APXvYqyaPVYhmq/h7UBs6n0tcjgftHnCsB9jpo4a+DwPuDtd3EIywxxxx8zFkzSw8qKGVwWf4dYIvkD+9m0g64cglr8=
X-Received: by 2002:a05:6638:538:: with SMTP id
 j24mr10587053jar.12.1581909688631; 
 Sun, 16 Feb 2020 19:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
 <1581664042.20487.4.camel@mtksdaap41>
 <CA+Px+wW0BWz0-8L_UXJ-OYbwG6W9vmCWRr7kevpk0yokp+NKKg@mail.gmail.com>
 <1581669243.29925.13.camel@mtksdaap41>
 <CA+Px+wUacX+HbgLTSjAuq0feoeYNb5pp=1w8C4_zm=0jGVcHUw@mail.gmail.com>
In-Reply-To: <CA+Px+wUacX+HbgLTSjAuq0feoeYNb5pp=1w8C4_zm=0jGVcHUw@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Feb 2020 11:21:17 +0800
Message-ID: <CA+Px+wXQGh3rX54TE8Ks8tfFhHPQXUV2PhK2qzME_LFQ+USUQg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Dylan Reid <dgreid@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 15, 2020 at 7:59 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, Feb 14, 2020 at 4:34 PM CK Hu <ck.hu@mediatek.com> wrote:
> > It looks like that even though sound driver is removed, hdmi driver
> > would still callback to sound core. This is so weird. After sound driver
> > is removed, hdmi driver would callback with codec_dev which is invalid.
> > I think this may cause some problem.
>
> Will do some tests and get back to you.

Please see https://patchwork.kernel.org/cover/11385055/ for the
proposed solution.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
