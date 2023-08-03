Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B79676F409
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84C210E1F5;
	Thu,  3 Aug 2023 20:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE11D10E113
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 20:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691094619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3CFgGOgP9O/o8Jr9VZXMJJ8J/clTiGmzIo1gFvhvOU=;
 b=fqx5arLwJ3waVjvj/mS8nAQ3GV66HEqZSRwsSjuUyzgqwsMDQUdBpOqN3QIQ8ZniaWLcUg
 dMB7l3vEx3b1cqzYHP12EdP/CQ1o7u61cmw/QRb+SNGaqFnA+bp9oKmFfZXqMe7sBsoJXc
 Ndjn/2xhOHAyVAVGPahHe1R6EoH9RFc=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-b8T0CEUuOsmM8NhpKZuUEA-1; Thu, 03 Aug 2023 16:30:18 -0400
X-MC-Unique: b8T0CEUuOsmM8NhpKZuUEA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ba1949656bso3032971fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 13:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691094617; x=1691699417;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z3CFgGOgP9O/o8Jr9VZXMJJ8J/clTiGmzIo1gFvhvOU=;
 b=b+dTjHzeGC50hJTCbG+swI1xBKettVYTRYOdplwRgCnbHNCx/mCZpRbgOPhBJotp5P
 fC+uot+gSsyY2qlt8TTdYbwEl7qK1nq5BQBH5C5wDYCe0ATbZ3GDwyHVH+HojSHk2nMz
 kMyFC2Aw4YG0UQm/xfITE29yAG2IgWEDyLzXwNfOir+c/LXCUt1k2TnNnYzRoOhAodHi
 7H4X5LKQgo2gl2ZBAGqL7am0oOeMh62nxxMF0U1XJ3Q/lEONMhDqPvy7Ih2ZWZMiY694
 pOqgs5Ugi6w8bRJPr5TKe00lgDdw4w/s5M6k+GHPlxjX6WAjPGyQbChgjdiwBRrD39GR
 1PnA==
X-Gm-Message-State: ABy/qLZRUjzfWOYqPC8WBpYHdGA0HUo1vEDyV9Zwtvp9Gv3jLTn/Jgsr
 DR/s1aFRF7qFUVNOhcm1NgJjnchRBCjpCLP1zakIiMoYm7y3NX0Pu3vW/qfhfCQz1Nn76u2ZZEy
 z6L+0n/2nPulJUuBjOAI7GolSL/QxVxpknK0Rla7PbjVR
X-Received: by 2002:a05:651c:201:b0:2b9:ee3e:2412 with SMTP id
 y1-20020a05651c020100b002b9ee3e2412mr9032194ljn.22.1691094616904; 
 Thu, 03 Aug 2023 13:30:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFM4juzjmI/t4LIfnWZp4pccCs9/wTL0bDPxsm4o+yqeKOP9b5fXamEn0GjXpG4q5lVC9pLiWFObW4UxjOMP80=
X-Received: by 2002:a05:651c:201:b0:2b9:ee3e:2412 with SMTP id
 y1-20020a05651c020100b002b9ee3e2412mr9032184ljn.22.1691094616597; Thu, 03 Aug
 2023 13:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210905122742.86029-1-daniels@collabora.com>
 <20230803154908.105124-2-daniels@collabora.com>
In-Reply-To: <20230803154908.105124-2-daniels@collabora.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 3 Aug 2023 22:30:05 +0200
Message-ID: <CA+hFU4yAb=kx18AQpSLQGV37vTt44rmzt+n5XzPee9uWCEg_fA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] doc: uapi: Document dma-buf interop design &
 semantics
To: Daniel Stone <daniels@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For what it's worth this series is

Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>

On Thu, Aug 3, 2023 at 5:49=E2=80=AFPM Daniel Stone <daniels@collabora.com>=
 wrote:
>
> Hi all,
> This is v2 to the linked patch series; thanks to everyone for reviewing
> the initial version. I've moved this out of a pure DRM scope and into
> the general userspace-API design section. Hopefully it helps others and
> answers a bunch of questions.
>
> I think it'd be great to have input/links/reflections from other
> subsystems as well here.
>
> Cheers,
> Daniel
>
>

