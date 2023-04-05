Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E656D7B0F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023AB10E8DE;
	Wed,  5 Apr 2023 11:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4750F10E8DE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:20:00 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-544f7c176easo669969427b3.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 04:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680693599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVTqfRf2jpWEeoD6UNL26R0hpOD3j9XRAva3jj9aVBk=;
 b=UMTYBNcPhbAF0ABt8KophwzX/Ny6OPNn+L6EnmU5IkTiR+fwtjtTvvmlWyMYj3Pkd/
 c/AorgHXggjcy/x5fLftLDXcSRee6X3AtQ1pW2rCBk6CYlNeeb39l9Sc0PgP3d01I3hi
 qodJYbUqCHZ235SHXXOkTEXGGEHXyT2WxYP95YphXmCso64A4JEn5pUvLQzjn8+qM2mo
 ffZ5LUVWgPBrcIjs91pPf+lKHjgH0EcvEuCyvhchd69BLf5uIsTKD4aB1cF0OsfHG7q9
 zt9q5kpD8Hxo6x9MnvBm6HE/Ec1pZ6n+yeI3K4SLL9P/DBFTyptpplVjTZnPhcQNN5G2
 eRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680693599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OVTqfRf2jpWEeoD6UNL26R0hpOD3j9XRAva3jj9aVBk=;
 b=CAFCp9W7bn8G14zfKU+cerR7HbLY3PvupRN1VX8nP32vTReqvkvKXnr6OzeZ4oZyh6
 W+j80yxWP/R0xj6zru58nDn/gotQgGm/1mJWe8ZzBYJgCbhkbuSG2yq7SfR0Veg+BlEW
 PMm9at6eXJfUCwoxw+6tFBS9uW1MZ3MhoktByYc6dKX0V6NxI+YvYplq2Hx5m4fdrz4C
 4jjmWETnCodrfw+xj1FUbq3PON74/lta3TxP0f1IKMtvdz8LqGafrLRDQiZ+wGhf6tjc
 a9TY1ROpMeSmvLcQND+64FkwvSN10S22kAHpK9WYmNmy+UhBdmd634+MKZTF1Mi1bqR5
 4pFg==
X-Gm-Message-State: AAQBX9f/e1+x4B9VLDyW9CMJ340QITbF6NuM5rvFNIqh4F63GUk6obsn
 zyXUklYigOCIU94zV0ByQT/FASrmRsDRF7riOTg=
X-Google-Smtp-Source: AKy350bbnQi/kk0Ucraeyifb8HGzxmDoYIzCbR5PfgN3LBUwsGHhS/jbvYqgxE1Tugt8wPoVLCb1KVJOEW5vVrBJUTs=
X-Received: by 2002:a81:c509:0:b0:52e:e095:d840 with SMTP id
 k9-20020a81c509000000b0052ee095d840mr3519608ywi.0.1680693598783; Wed, 05 Apr
 2023 04:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-4-917ff5bc80a8@asahilina.net>
 <ZC1WwJDr1iqSQnYs@phenom.ffwll.local>
In-Reply-To: <ZC1WwJDr1iqSQnYs@phenom.ffwll.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Apr 2023 13:19:47 +0200
Message-ID: <CANiq72=h9qKrpkY2K962__rs-JLsmWxPXocx040ZeDSKGf_Brw@mail.gmail.com>
Subject: Re: [PATCH RFC 04/18] rust: drm: gem: Add GEM object abstraction
To: Asahi Lina <lina@asahilina.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Karol Herbst <kherbst@redhat.com>, Ella Stanforth <ella@iglunix.org>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Mary <mary@mary.zone>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-sgx@vger.kernel.org, 
 asahi@lists.linux.dev
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

On Wed, Apr 5, 2023 at 1:08=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> Uh all the rust helper wrappers for all the kernel in a single file does
> not sound good. Can we not split these up into each subsystem, and then
> maybe instead of sprinkling #ifdef all over a .c file Make the compilatio=
n
> of that file conditional on rust support (plus whatever other Kconfig gat=
e
> the other c files has already)?

Indeed, the plan is splitting the `kernel` crate and giving each
subsystem its own crate, bindings, helpers, etc.

Cheers,
Miguel
