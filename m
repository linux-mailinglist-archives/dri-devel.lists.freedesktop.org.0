Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF3578D67C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E1B10E52D;
	Wed, 30 Aug 2023 14:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954B610E52D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693405394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDWeZz8lwtK2Vw963Pp4K5umQAhzGapmgVnLNgStcjo=;
 b=Akvmh1yAb35F5xpAl/Lm+uXDZo+cFqsKdiy2StQEZmcccAC70cJXdAnVjUuk5LeaplByHJ
 wa4DSAAzvLYUHpkYfInM0lyNXTbGFPeecYT72loaFmLKFg7VJtXv6dr8F2FUfqVoaMhUkn
 Rzs/QTBGrzfX6EKAxmZe4w8CMYjOx+4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-o3x8UeRkOJCS7CpokF-V1Q-1; Wed, 30 Aug 2023 10:23:13 -0400
X-MC-Unique: o3x8UeRkOJCS7CpokF-V1Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5256c3803b4so365288a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 07:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693405392; x=1694010192;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LDWeZz8lwtK2Vw963Pp4K5umQAhzGapmgVnLNgStcjo=;
 b=UnGq6mKjc9zsM3EhKS0VBuBLUJ4TGVAxWEkZtjYL/k2L6rZLitrt1qT59F33fFofMm
 Y910zrPV6hqxWjNi6RdAMEVBnU7Ykm9U/ucQQnT9jV6cgVyb7mYb7tXN3TYoUiQSg09E
 NwUXfNOp0QFncJoDJUqQ7eiAXH58DyAJsOe5zyopKwkz3yVdLbvrpYi2C0niHfQ8VTjv
 4er2KkKiDGlm5TAS49ksSE4tXba94hqAsSADecpdcGFyWuMKiTXZCujy8QRiYPYOZQxj
 QTbjIuyC91I0W/nyvHKmR5sAzG200iGUDkqWGLCMs5M0MgB7+1LbYCe7zyvSB0p/9QwP
 4g+A==
X-Gm-Message-State: AOJu0YwgOJHiBpYkFr05hZd+XZ01DP3W5jbkxi9GTX3pTeRTT092uVY7
 cLnGfp3Fbs1WAmbV71Hb3Y/6H9SSgQr72jDKhmVud8EaRhzOFnyE7HuByveVNZ5o74hQkGz6kdQ
 igXkn5kfOH/M+sz76KJ5j1X88aQqp
X-Received: by 2002:a05:6402:4404:b0:51e:34d8:f4c7 with SMTP id
 y4-20020a056402440400b0051e34d8f4c7mr2019162eda.2.1693405392370; 
 Wed, 30 Aug 2023 07:23:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEETjNW9wp/fQvTrgjMQpXcwVHdHwUrjVBdjXk8jizCaYvhqq5Q/jtzkYzdJEKBqJ9axaU5/A==
X-Received: by 2002:a05:6402:4404:b0:51e:34d8:f4c7 with SMTP id
 y4-20020a056402440400b0051e34d8f4c7mr2019152eda.2.1693405392119; 
 Wed, 30 Aug 2023 07:23:12 -0700 (PDT)
Received: from ?IPv6:2001:9e8:32e4:1500:aa40:e745:b6c9:7081?
 ([2001:9e8:32e4:1500:aa40:e745:b6c9:7081])
 by smtp.gmail.com with ESMTPSA id
 j4-20020aa7ca44000000b0052574ef0da1sm6830091edt.28.2023.08.30.07.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 07:23:11 -0700 (PDT)
Message-ID: <a79b3c34a12abc51bc5e840ae3a87ab9a47f7742.camel@redhat.com>
Subject: Re: [PATCH 1/5] string.h: add array-wrappers for (v)memdup_user()
From: pstanner@redhat.com
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Aug 2023 16:23:10 +0200
In-Reply-To: <CAHp75Vc72uuNvFxq4TGO=nXoGhbqVxyqvQ67ioL8ajtZwMUBgA@mail.gmail.com>
References: <cover.1693386602.git.pstanner@redhat.com>
 <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
 <CAHp75Vc72uuNvFxq4TGO=nXoGhbqVxyqvQ67ioL8ajtZwMUBgA@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 kexec@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 David Disseldorp <ddiss@suse.de>, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-08-30 at 17:15 +0300, Andy Shevchenko wrote:
> On Wed, Aug 30, 2023 at 4:46=E2=80=AFPM Philipp Stanner <pstanner@redhat.=
com>
> wrote:
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(check_mul_overflow(n=
, size, &nbytes)))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return ERR_PTR(-EINVAL);
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(check_mul_overflow(n=
, size, &nbytes)))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return ERR_PTR(-EINVAL);
>=20
> Btw, why not -EOVERFLOW ?
>=20

Good question, actually.
To be honest I wasn't quite sure which code to pick (-E2BIG was also
once I candidate).

-EINVAL was picked because the idea was that a request overflowing a
size_t could surely be expected to contain an invalid parameter,
because no one would ever request an array _that_ large

?

