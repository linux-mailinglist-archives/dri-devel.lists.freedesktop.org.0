Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A47755961
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 04:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2A310E11C;
	Mon, 17 Jul 2023 02:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3DC10E11C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 02:06:57 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-440c368b4e2so1160371137.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jul 2023 19:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689559616; x=1692151616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJjcGeSu1yBzoQ4uVSesM2ecyKuvRbwcrty4LUDKxlU=;
 b=zxGaglwS9CAZ4msTb2quYvVyDdhCIfdP2OL8sIgGnG5ZrFeTCE1QL4ZnSKCEdj6i8U
 HDPe3D4zfgWy9P9W+agC7wGRI3sQRiTRoBug2lQICmfMxP2K0I/k5G4Fbctruv0fvLoo
 5Es07Z8HBY+N6cD6d9Vx5Wax3v/pyCywcDRYs4p0aDfCtiM98L23hfe3kCQ52wtF8ixf
 lsDh/biJ5vpGPQegdVr4JAoKaJXir25xPHbt3SuzrctZ+GQVDLm3gD31jjnfOmiY4Kpl
 GhjsXDLHLeYMFzbUcdJzXCnFuuolCnWqPKidoYZOZ6hGqJXcOcBbsDS+OGRUPsdYt+f9
 Cd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689559616; x=1692151616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJjcGeSu1yBzoQ4uVSesM2ecyKuvRbwcrty4LUDKxlU=;
 b=lO5W7k9fs0pZ3bNluxZfmwbAy6rS3VeBJlhaRgeXbOlfMf57Hhr4NGI7mwgu7Ovyqb
 KlaW6Cv569VTu9FD9zPYL61amC2cqxK70jEomFDLLE5V84CZUK4hvTX+lbe6zGneh78s
 8BD3mp9FsB5X576xQjU/dtgQBZlislrMowyO8cUxfaeO1fpnCCRW9HVPP6BPanA1GA98
 letbNW8DHXe7TqImnqF3gwra5Y+hmlV2g1VvJ8qRtoWVuAjvrgNb4XCr1Z1oFdAU2dPB
 2cS5HMS24kgPdMSqK6RLhylWYLTr6QcUA7gmyVf0ai+Ysk4YZZwOzsKGtlslAzjTuLsR
 +Oug==
X-Gm-Message-State: ABy/qLbcypNlt06wUQmA3+HKBm0uXwyNeaJ7opOCznEr9Fc8CDGCn4GB
 nZTeC9/NrxB5wvIrd4xcL94Lwiu/yOm7mJ65s6jkJg==
X-Google-Smtp-Source: APBJJlHX7G2n3fcw5u4/GzstdODdaVAWzRgj1dnNd8IYjjUYPzYGUi9QZj015F6z+NhwE8S8c+kxZ7VupF4wWL7vlS0=
X-Received: by 2002:a1f:5ed4:0:b0:471:1785:e838 with SMTP id
 s203-20020a1f5ed4000000b004711785e838mr5240616vkb.2.1689559615726; Sun, 16
 Jul 2023 19:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230710223304.1174642-1-almasrymina@google.com>
 <20230710223304.1174642-7-almasrymina@google.com>
 <73971895-6fa7-a5e1-542d-3faccbc4a830@kernel.org>
In-Reply-To: <73971895-6fa7-a5e1-542d-3faccbc4a830@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 16 Jul 2023 19:06:44 -0700
Message-ID: <CAHS8izNrbrU2EHxJvBXm4QMyO25-OqHcCm3HiJ590HCNt=N5LQ@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] net: add SO_DEVMEM_DONTNEED setsockopt to
 release RX pages
To: Andy Lutomirski <luto@kernel.org>
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
Cc: linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, jgg@ziepe.ca,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 16, 2023 at 4:57=E2=80=AFPM Andy Lutomirski <luto@kernel.org> w=
rote:
>
> On 7/10/23 15:32, Mina Almasry wrote:
> > Add an interface for the user to notify the kernel that it is done read=
ing
> > the NET_RX dmabuf pages returned as cmsg. The kernel will drop the
> > reference on the NET_RX pages to make them available for re-use.
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > ---
>
> > +             for (i =3D 0; i < num_tokens; i++) {
> > +                     for (j =3D 0; j < tokens[i].token_count; j++) {
> > +                             struct page *pg =3D xa_erase(&sk->sk_page=
pool,
> > +                                                        tokens[i].toke=
n_start + j);
> > +
> > +                             if (pg)
> > +                                     put_page(pg);
> > +                             else
> > +                                     /* -EINTR here notifies the users=
pace
> > +                                      * that not all tokens passed to =
it have
> > +                                      * been freed.
> > +                                      */
> > +                                     ret =3D -EINTR;
>
> Unless I'm missing something, this type of error reporting is
> unrecoverable -- userspace doesn't know how many tokens have been freed.
>
> I think you should either make it explicitly unrecoverable (somehow shut
> down dmabuf handling entirely) or tell userspace how many tokens were
> successfully freed.
>

Thank you, the latter suggestion sounds perfect actually. The user
can't do much if the kernel fails to free all the tokens, but at least
it can know that something wrong is happening and can log an error for
further debugging. Great suggestion! Thanks!


--=20
Thanks,
Mina
