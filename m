Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B53D712B11
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C920310E81A;
	Fri, 26 May 2023 16:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA9010E818
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685119887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VFnVsNyMBiLJW3sl37cQkzARH8Hl1Ri81egbddkwco=;
 b=ZEz/+ZM8VDcX+uoDE0JKmyo+N5BMNXXTk0x8bjriiLqZfB5dk4qNk6BbazjU9W9OBjuDKg
 1lrSstrIHQr0ssv+BXpyf4kiCIEUqQskEAe9TjsSETlJYHxGzzJ+LaxQr4lMalDK2nNnM5
 GwEKCCVWGOK1iOZkKH1gDbx/hDXyvvw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-s1DezMj5OTC2549QVT8Cpw-1; Fri, 26 May 2023 12:51:26 -0400
X-MC-Unique: s1DezMj5OTC2549QVT8Cpw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b02539087aso4494591fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 09:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685119884; x=1687711884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2VFnVsNyMBiLJW3sl37cQkzARH8Hl1Ri81egbddkwco=;
 b=Kx7I8QtfkunLwoOgsN0emynJdXaJgxthpxcjqdRz+3mnVLne2tQ2xpage5S1Am0tsn
 tWmVtfZEm7lDnAWHMHXtmHrCjEQP4vai9PsFfdpL98Kvtm6tisXOQ9kcxkCa0O7PgYJX
 TcCXRhz61DHCsyRs9g4NCguACn+BzAxNGVVunYGXanQGr6evTMYps3abFtJB14wkMxSO
 DWa57qJq/1FwfFdoD+fL8XSrc2tzGYSqkCX9HgX6hSePE5jNrQXC7Olic4Wqlxoqy+Be
 zvs3T1JokqlbAgD/Sv8TJfp63QAvE+XKAqTaN0+VNJ4pMreFdGxpHhHEkajcCUVIgWJH
 +b/Q==
X-Gm-Message-State: AC+VfDyFRvamMMQ0mR1M+KG9qfBPI131208chZnXNhcLPkp0EbjCdgG0
 mtFQb/3rVfPfgWog5VCl3nFTFG4RRs9hyg673W3/tdY559Axhj5ou31AjGsn2jQqJXIH+CscUBf
 4j9bBMWi51GcN2/6L4iwwWjLjsfB9K//eFd01cjq7gWoG
X-Received: by 2002:a2e:8854:0:b0:2ad:81ca:a52f with SMTP id
 z20-20020a2e8854000000b002ad81caa52fmr763460ljj.47.1685119884818; 
 Fri, 26 May 2023 09:51:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ZUJMoHaFSDdaVF/+xNH5IxF0WTKfLu7LPNiAfpaWdPUmoFLTIiIL4SovvzIkRV+BVCbVgSlO4YBgWLfITnQY=
X-Received: by 2002:a2e:8854:0:b0:2ad:81ca:a52f with SMTP id
 z20-20020a2e8854000000b002ad81caa52fmr763446ljj.47.1685119884481; Fri, 26 May
 2023 09:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230525191809.3524-1-harry.wentland@amd.com>
 <20230525191809.3524-3-harry.wentland@amd.com>
 <CA+hFU4xpYguvZi7n48xB3BS-dONShUvDOwBqpM2aZXRAH_DGwQ@mail.gmail.com>
 <oQIftfWjxOOg5ef6hQXufI_hfSvyxhX_Q54ZZSFfzxQKdXKZIwxzPLup5zcTFWzdlQ_bwIrZ5Z2WAy3VYCiI_qoPkvdP0pNUkZCT48NXCbk=@emersion.fr>
In-Reply-To: <oQIftfWjxOOg5ef6hQXufI_hfSvyxhX_Q54ZZSFfzxQKdXKZIwxzPLup5zcTFWzdlQ_bwIrZ5Z2WAy3VYCiI_qoPkvdP0pNUkZCT48NXCbk=@emersion.fr>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 26 May 2023 18:51:13 +0200
Message-ID: <CA+hFU4yzMo8J7nC7D7HkoZjRzOcdQ_XmxiM4s5sBVUB-TwDr3A@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] drm/connector: Add enum documentation to
 drm_colorspace
To: Simon Ser <contact@emersion.fr>
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
Cc: amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 6:37=E2=80=AFPM Simon Ser <contact@emersion.fr> wro=
te:
>
> On Friday, May 26th, 2023 at 18:27, Sebastian Wick <sebastian.wick@redhat=
.com> wrote:
>
> > > + * @DRM_MODE_COLORIMETRY_DEFAULT:
> > > + * Driver specific behavior.
> > > + * @DRM_MODE_COLORIMETRY_NO_DATA:
> > > + * Driver specific behavior.
> >
> > TBH this is still confusing me. Is DEFAULT really just driver specific
> > behavior? What's the difference to NO_DATA? Is NO_DATA actually not
> > driver-specific but display-specific? I.e. the default colorimetry of
> > the display?
>
> DEFAULT =3D=3D NO_DATA =3D=3D 0
>

*sight* and backwards compat... Alright, not much we can do then.

