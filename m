Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5C6580489
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 21:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF56EC1C39;
	Mon, 25 Jul 2022 19:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071EFC1C39
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 19:39:29 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id r3so21923753ybr.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 12:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MjmAtSszjPORG3A5XiFknGoj2N0qt4+ja2B7vunDDjs=;
 b=L1DoHUfpefp4AIriqH/3SdaJQjRicW/pf89mE3u3+hY/Qy47rIxMgafTMB9bk+ORkR
 l7086ec5tYGQPPtwNhv/Yi5K9Not3qMoz4pQcmm7MOio4ndkKHKXdh5J1jH07N46EVhx
 AaTic3oExla94hGGbne0dXd+ImfroIQo12BpW8qfD3lJ6/094Q2akQc2FHSng7bSJEpD
 3/cTE3zWNeP7IfluLu4VW46aS+WqmwNP5KApxK6rXG0ziA5cRcWSjDhmpY8uhRoc78de
 VA+LmZiPiiJQacN75mVMocfHel8r7UuoPZbZ5eII2k2Jt3Wex3xiLEm3u+zEWyrF9orm
 paKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MjmAtSszjPORG3A5XiFknGoj2N0qt4+ja2B7vunDDjs=;
 b=Dv6hdOlboAGfJ2jqAy/ziIP3Ut6KNTVYfaWSBudYg2UZ8kTs4rN7HUknxI57t7OYO6
 Z6jffeqnnLvFCp7/Cu37BpBTyeOF46/8tC18lUkpZB1mGwxe2jZeaVh3ojObyDrYyez6
 tsvgdX5qmVttN6MY4pGE1fkx7Svc7s9C3eKRgxEcNTVwSrhGJ7uaNnhCm0FRYdI/+yn0
 RgKHhBLZG7fmcB6V3D8kv2fjjRDbZjdOFSy2B7wsdAxeMPFFuR7U+CWRD28fuTdSUnEt
 N+1HC/RZbDqy5JBj5+xNANOwy8Ke1oVMAsKZyFuGHfydEH0/Lcs3h3E7mG/ofAgxQv3h
 E5PQ==
X-Gm-Message-State: AJIora9fjEMVBx6LTBabdSitwx8Jhq+bx91nkpZKDB4W8aJjGV2e9f3b
 hoGgyY5KdUKDNGWxQe9ap9VltNKlY5Rx3eGMJzE=
X-Google-Smtp-Source: AGRyM1shByavack30T1heH93xHXFptCXNPqes7rCn+5rAOomgi0awZb7ABBKzBPuT4go923XA0Bh0YGzYug1v2sh3gE=
X-Received: by 2002:a5b:1c8:0:b0:671:5d14:5974 with SMTP id
 f8-20020a5b01c8000000b006715d145974mr2315871ybp.123.1658777968113; Mon, 25
 Jul 2022 12:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220715132135.443675-1-windhl@126.com>
In-Reply-To: <20220715132135.443675-1-windhl@126.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 25 Jul 2022 21:39:17 +0200
Message-ID: <CAFBinCAUuX58QTE20LBGrFSBdQw2RO7KQdFcgdqnE4N0HKn52w@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Fix refcount bugs in
 meson_vpu_has_available_connectors()
To: Liang He <windhl@126.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org, jbrunet@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Jul 15, 2022 at 3:22 PM Liang He <windhl@126.com> wrote:
>
> In this function, there are two refcount leak bugs:
> (1) when breaking out of for_each_endpoint_of_node(), we need call
> the of_node_put() for the 'ep';
> (2) we should call of_node_put() for the reference returned by
> of_graph_get_remote_port() when it is not used anymore.
>
> Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
> Signed-off-by: Liang He <windhl@126.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

It's easy for me to miss patches if the linux-amlogic list is not part
of the recipient list.
Can you please re-send this patch and include the linux-amlogic
mailing list (with my acked-by added)? Then it should also show up in
Neil's inbox so he can apply this patch.


Thank you
Martin
