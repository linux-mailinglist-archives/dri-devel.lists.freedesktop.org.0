Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB81ACA5600
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 21:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03B310E9BD;
	Thu,  4 Dec 2025 20:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LS2ZjdGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C188D10E9BD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 20:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764881354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XihbxyNOWKvwzb1hOVY2xnF0q0hWz1wS+HjreADM5/Y=;
 b=LS2ZjdGAcLbklP1NBl2fr3m7XwDvlBNi4PcwHv0j/9yWwoCHe4gmGtV/WIV2+gZBx5DnPt
 /sP6xA1aoEu95Ml0C3HuHXYCQthJKGxnbQiYlCiwxnQ4qOfd5yym5bz5EF2oKOWZk8Bqty
 DI/9klHFaM1tVUYZl7LUT+I/7OmoXVU=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-yX3nlhO9MoeSHAVpwU_qfQ-1; Thu, 04 Dec 2025 15:49:13 -0500
X-MC-Unique: yX3nlhO9MoeSHAVpwU_qfQ-1
X-Mimecast-MFC-AGG-ID: yX3nlhO9MoeSHAVpwU_qfQ_1764881352
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-bde2d88e5e3so2373441a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 12:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764881352; x=1765486152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XihbxyNOWKvwzb1hOVY2xnF0q0hWz1wS+HjreADM5/Y=;
 b=ms2I61b8/NxJ9kQjaxOKBUGhJhYa02AEo/ahX7AmkL3hBT7PuR+GrAvGOe20YBRHkA
 abbNcl5ras/hr2qzIUg3c0uY9ertyf0bgJBF73Tn0IihCJcKkwl4PQCi0xG/+ZuuVWb8
 FlCUm4DzTlOvTR9QTPOEpae/8U2e3gtK9y3574notcmefMzVLwWnwSyuxBsG/sYpJMG0
 /SsA9pDeL9LSrI0jqllrWz81ZTqo1GKsem5Drma2PXZXCKidw/dMx+7bfcB4Tap1fOQ9
 IxpEKGSFomRDcPRmGc2EZg/kp5QGCkv25NccgxwMaypzF9j8PO1P8RAsxkaRJiVzweWY
 0xtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+oUWimvoi/nx0ZMorBFja+jIm34OcG2AMepeo9Oz8YFLhCOH/Dkpbbi1Y5aLpkKfD6x5bG9+tUTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwturApYBwxlKEvvi9loS/b6A4hvOH1uSTgy+D5NB4BUbIqZQEF
 r8vPhW500QG0lq0UBaEvRUMV2gc3IEudLidBOJVXvG9GVS3eEdUcwEnmBfMRQ39hFSF6+Ias7z6
 AqQEb3TjAhMxqRhIZLK73glC8tNrlCZu+AWfEbNi8myDIbYpbCizNiIhzzRkCMzVlNhJMz43b7A
 9EztBknIQZk48zsrVhUwTwpnCQCyIEGT60Ziyysx0RXtc1
X-Gm-Gg: ASbGncs1cSWKVRc8O7ZZlUgWMz7r3776sHcrX17GsPinIl6wpNAOZOn3Y6wiBWiA5MZ
 lHGwXFNYX9V+fkzQC0jAz+eAOvN8l9eNzxt3YrL6GjC1LhPgLj557WC8Reagla7FxusWl+6e70i
 d3TNER4P5mXEb5JYuWbBSPp73BQtLuocr5wyD39mXuRYjU9A1+Flaip249zZ1T9Iwq
X-Received: by 2002:a05:7301:b11:b0:2a4:3593:6451 with SMTP id
 5a478bee46e88-2ab92d77f2bmr4226722eec.1.1764881352364; 
 Thu, 04 Dec 2025 12:49:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8x9ZmXfAE2orkznNeuwgvAV+wy0YEIWZ/Ws1yH7UK9HKbPlckyoSRBNXvJzp/Axh389VW7NyFhaHGOLyoB0g=
X-Received: by 2002:a05:7301:b11:b0:2a4:3593:6451 with SMTP id
 5a478bee46e88-2ab92d77f2bmr4226708eec.1.1764881351920; Thu, 04 Dec 2025
 12:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20251204202059.326605-1-thomas.hellstrom@linux.intel.com>
 <CAHk-=wja02iemw40Sn4Vio6b1-rr3idFBcUrOV+=vodhOmZZ=Q@mail.gmail.com>
 <e3fe071073ae54dc58012c1c2d892a18be8036d8.camel@linux.intel.com>
In-Reply-To: <e3fe071073ae54dc58012c1c2d892a18be8036d8.camel@linux.intel.com>
From: David Airlie <airlied@redhat.com>
Date: Fri, 5 Dec 2025 06:48:59 +1000
X-Gm-Features: AWmQ_bkeIZHanr11IeXDa1WIAIDpNz8wVly5_2vWVXLwYP2FxSYJdAZpHExT--I
Message-ID: <CAMwc25ounBF8xxTbTdK=4GChhzNs93yWr95GP2RoKMMNQ3G6Gg@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Fix duplicated put due to merge resolution
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J0UUPrWgn7XfCMZXPI1Mxl7y10PPsv2gtjPO1Kxk3A4_1764881352
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 5, 2025 at 6:44=E2=80=AFAM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Hi, Linus
>
> On Thu, 2025-12-04 at 12:41 -0800, Linus Torvalds wrote:
> > On Thu, 4 Dec 2025 at 12:21, Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> > >
> > > An incorrect backmerge resolution resulted in an
> > > incorrect duplicate put. Fix.
> >
> > Ack. I can confirm that this seems to fix the issue for me. Thanks
> > for
> > the quick response.
> >
> > Should I just apply it directly?
> >
> >            Linus
>
> OK with me if ok with Dave.

Please do.

Acked-by: Dave Airlie <airlied@redhat.com>

>
> Thanks,
> Thomas
>

