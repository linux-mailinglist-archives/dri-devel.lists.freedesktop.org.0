Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C4BACCF90
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 00:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8924210EA24;
	Tue,  3 Jun 2025 22:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F258bsLb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E7610EA1E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 22:02:57 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so1077865466b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 15:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748988176; x=1749592976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPZroQIJAp+g2dYGO+7l7zNtR6qgCs7xRQVC5uD3Qek=;
 b=F258bsLb0sQuWj0HmqO9Pygme8Z5/2F4Eo99lYZmcvPWqr7+WowCFhL9k1LwJvDhtJ
 lEgXA9NKV028OIDNtc7oSk/iC9P/y968LRcmhVYvlhR7WUUX81DN8lrZo+Gc7d/WVNLg
 TdACL96bDiG+Rg0mroeRr+OReHDxfRidtqU1KOQpF4EEKc4EstrNpzmyem1LlNK9XmzU
 f69NdJBfFUSnbIT9ppmoerDugA5DLGrrSLqiDLbw6OF19RxAwGFJIpnWFgOuPmYIaEtz
 9myIOnjSFnxIhGHAVZc1oAqlO2+g5WOJ6iUXF2eWgQUqIe2qgCYqueyhgvLoBkbbEGCP
 ucBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748988176; x=1749592976;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPZroQIJAp+g2dYGO+7l7zNtR6qgCs7xRQVC5uD3Qek=;
 b=ccaZEO3DohZaCJCzYnZkdzs5vhS0covpE3c784Vowtc9EbQKTxtqNT/xGsglhlRk1V
 mERb7GOZNHmiBnVQbLoL3mwgU9td7PpW4L8qCljH09HqmWwFID82wIPPZKTvgz1UyZO5
 vc1KqQNWtnAuSOvZCyu/BZIQkm3TDw0WUKrngm6aDMXZhWBEjeeZb0zGuzQRSVf9koWM
 WdWHSNFA2dijtqGynDhAvaU1kJmlvLBIn9z1Vzpmiv7o5rVqF9FWBf5kAqE10pqeiGUi
 y9yq6FS4pNo8F+v2kIZmtqBlVZPnbmzE52GlLKajoX8U8/EkgOy6dC53PRk9+fKsknfo
 sY0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/j9LMJs61Z28oUvII0Uplx1letT2Q8VTPMF5jNWG8jWjM3qQCOrUA7j+plNPfjcJLdvKG4hWe1vI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVrwEWcZ2F/ghMzf5XMt65hF2sPBUGmSsed+yrzNgMmC70V9kI
 aE/kjfp6GoLLB9QrOGdrGBHoL1KYY/g44oUmOfdKnZNbdiY7+Kg1cRtfATOpWnNGWXcCMBjx1JY
 vPVNclMD+eV2sLHyevDpKDXcysZl+hXc=
X-Gm-Gg: ASbGncuVtHaCQ57D2qiHoArRf/4rYz2SmvhAB/QeXwkdnwM6IKjbKBcMbdZNTLymM7/
 gAu2MiNgroSRrypgZeRhTQU0BP4pgyqBdflzo0AWXtJ2Jd8GYOdN7QRhaYCKoLXthQk+X5yxI1B
 rObSENL8NG7QwLHcW4gzIrsubWQJew63GLhRGXcHhxPw==
X-Google-Smtp-Source: AGHT+IGaWHWOCvhSPBrJgAZ9aYgP5PYwmZhn3vq1Q1n8aZnPcreDxoOWRz8lJXyfQKYoikEari9XSXBJfsBRi9EFCDw=
X-Received: by 2002:a17:907:3e0e:b0:ad8:9b5d:2c1c with SMTP id
 a640c23a62f3a-addf8d00d76mr24265266b.19.1748988175591; Tue, 03 Jun 2025
 15:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250602204013.1104258-1-airlied@gmail.com>
 <92e31f45-1f8c-4081-8865-a2aee7a2935e@amd.com>
 <CAMwc25oAjBwnpE4CfAPu4SvUia8QRVe0Q3dN-msXVXeEw1UDtA@mail.gmail.com>
 <9f641220-9774-4072-9161-31cc0a411525@amd.com>
In-Reply-To: <9f641220-9774-4072-9161-31cc0a411525@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Jun 2025 08:02:44 +1000
X-Gm-Features: AX0GCFuVSNYhTgY_B8BFqGsFe0Du0CUUcW6kPwVTIgZvvLRkb621QCnQ9wx-Fgg
Message-ID: <CAPM=9tyhNfAtYJprivbygWsa97qdr11+jcRTm_7NDHcMpcpXUQ@mail.gmail.com>
Subject: Re: [PATCH] ttm/pool: allow debugfs dumps for numa pools.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
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

On Tue, 3 Jun 2025 at 18:50, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> On 6/3/25 09:52, David Airlie wrote:
> > On Tue, Jun 3, 2025 at 5:47=E2=80=AFPM Christian K=C3=B6nig <christian.=
koenig@amd.com> wrote:
> >>
> >> On 6/2/25 22:40, Dave Airlie wrote:
> >>> From: Dave Airlie <airlied@redhat.com>
> >>>
> >>> Currently you can't see per-device numa aware pools properly.
> >>>
> >>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Signed-off-by: Dave Airlie <airlied@redhat.com>
> >>
> >> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>
> >> Any follow up patch to wire this up in amdgpu?
> >
> > Just seems to work, at least I tested it on a 4 node MI300A system
> > this morning and
> >
> > /sys/kernel/debug/dri/*/ttm_page_pool seems to reflect the correct pool=
s.
>
> Yeah that should work, but there is also the mode where we allocated the =
pool in the driver because the MI300 has connections to multiple NUMA nodes=
.
>
> See amdgpu_ttm_tt_populate().
>
> I will take care of this after that patch here lands.
>

I've landed this in drm-misc-next.

Thanks,
Dave.
