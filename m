Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8FF6B1069
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 18:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F274210E6D0;
	Wed,  8 Mar 2023 17:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 591 seconds by postgrey-1.36 at gabe;
 Wed, 08 Mar 2023 17:49:00 UTC
Received: from out-1.mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E1810E6D0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 17:48:59 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1678297145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yVSYNjCHn8PZygOPU8FaPpzcyZxyRzar8PA59R3WlkM=;
 b=FTUuASPVjKjYV3cgR8DM7Q/D53G17nSjTRtKK5kslyagyxeCTRYYVbKDtQhi9bpH3m+ZtA
 9oHrB3kWjYVdDTETA/SNEJKa+eU8UFpHExrxk++MTgaVzb52a+0ybd1dQYV8QRbztzU9V+
 ECi9YEUuH0+actMuPHGLiHa8Nqk0iOEjLbQziYOK2/+ZeN0xmLqR5tzoikyb0lhhoSQkWg
 MrrwH48EDj11rAURsP9leymAeja4qCI04DgkljR/dqQVtrW1AmhzYa7ASmzRTyBiDLw1I4
 RwWVNA6leYb6hAGM5PLKb5yoArBe2XIqoLIl8Bp+mc3Qg4H9hlAbvAOC4/tHiw==
Date: Wed, 08 Mar 2023 17:39:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: alyssa@rosenzweig.io
Message-ID: <8e93126cfaf47ebad0dc70e038ccc92f@rosenzweig.io>
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the
 scheduler is torn down
To: "Asahi Lina" <lina@asahilina.net>,
 "=?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=" <christian.koenig@amd.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Wedson
 Almeida Filho" <wedsonaf@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, "=?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?="
 <bjorn3_gh@protonmail.com>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 "Luben Tuikov" <luben.tuikov@amd.com>, "Jarkko Sakkinen"
 <jarkko@kernel.org>, "Dave Hansen" <dave.hansen@linux.intel.com>
In-Reply-To: <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
References: <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
 <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
 <585fa052-4eff-940e-b307-2415c315686a@amd.com>
 <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
 <7b39ef96-3ec5-c492-6e1b-bf065b7c90a2@amd.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>, asahi@lists.linux.dev,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> You can't ask me for a list=0A> of pending jobs (the scheduler knows th=
is, it doesn't make any sense to=0A> duplicate that outside)=0A=0ASilly q=
uestion: could you add a new exported function to drm_sched to get the li=
st of pending jobs, to be used by the Rust abstraction internally? IDK if=
 that makes any sense.
