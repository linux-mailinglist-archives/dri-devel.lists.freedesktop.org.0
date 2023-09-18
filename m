Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D987A45A8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FE010E23B;
	Mon, 18 Sep 2023 09:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3402D10E237
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695028434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ySETEWMBBYemMdp3jyvFHrMDlDasjAvK3U0xoCA3NQU=;
 b=cd42VR+RzlMdxl2zq5h68JxAWA8yz9ZBAJOKiUVT3dhi3Lh3XLe7PsYjrzdRkGYwBOj9Zg
 RQ5B9x9uDHJvs+J7Ose05SKJ2WJjpmWVxfvQlBQ2QwXTknFhm9r27dysILszFa1kVglnSs
 Lg2Q1OKi5RFTi1boQdgEFkBDB2qbXMY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-Pse6RQ-xMTmWHBkcDjThyg-1; Mon, 18 Sep 2023 05:13:51 -0400
X-MC-Unique: Pse6RQ-xMTmWHBkcDjThyg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-404daa4f5a7so7379575e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 02:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695028430; x=1695633230;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ySETEWMBBYemMdp3jyvFHrMDlDasjAvK3U0xoCA3NQU=;
 b=r8jyv/0Ff9jVE6fc6GACfLf6Orax/FNplZ6ywIR9LMFTje0udNZ4rWZEPtEixAzmlE
 /ZqCUWSxIkxQoMQtIKe8OmWoTqS4HUlph5QGkb2g1/vHOPQM/Dj8Jg7S5/fhPNgDm1/2
 pJHTGTcZFJmSmshA48gCUFNi2tvFP/1jAepoh61iR3jjLwKVavspdK53aoauECWTk2Gh
 LTxEypEt9NdTPKCHRQEMB4pTVtOjJcShMjay/Pe2NCWs0UYtKyPZ3KeVGoQuJNvBwtBy
 PZmYiO9O5p69sLP4Vsle4jBazWiB1kYjfBZtZI7nf7BEONC3LqWK6yVNJ5z5fn6TPLy+
 iPSA==
X-Gm-Message-State: AOJu0Yzq/PtenL6bnShXMIV5sr2bjY499HgIK0EWZGim7OVK9YOIDXxz
 i8gfBiyloFmYW6fV9xtPyoyynkutrM24HxL+RCkC25NUGwhaB2SF3+39CfTAMa4Dn1Odbh6hcds
 qlHGWgtIdWPedx+zUS2AxdkOVavmp
X-Received: by 2002:a5d:508e:0:b0:317:73e3:cf41 with SMTP id
 a14-20020a5d508e000000b0031773e3cf41mr6416391wrt.1.1695028430603; 
 Mon, 18 Sep 2023 02:13:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB8VnbhuBBqYU4diZ/ky5juLhWgDDI8ddqsgXauCCvjjTxBkK6OXa7bUUeWyDSF9cThUqM3g==
X-Received: by 2002:a5d:508e:0:b0:317:73e3:cf41 with SMTP id
 a14-20020a5d508e000000b0031773e3cf41mr6416363wrt.1.1695028430263; 
 Mon, 18 Sep 2023 02:13:50 -0700 (PDT)
Received: from [10.32.64.2] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a05600010d000b0031aef72a021sm11830334wrx.86.2023.09.18.02.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 02:13:49 -0700 (PDT)
Message-ID: <72a444cd42629f5bdd56647e7aa24588d6964bec.camel@redhat.com>
Subject: Re: [PATCH v2 1/5] string.h: add array-wrappers for (v)memdup_user()
From: Philipp Stanner <pstanner@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Date: Mon, 18 Sep 2023 11:13:48 +0200
In-Reply-To: <b219788a-69e6-44cf-a609-91f9640967f5@moroto.mountain>
References: <cover.1694202430.git.pstanner@redhat.com>
 <93001a9f3f101be0f374080090f9c32df73ca773.1694202430.git.pstanner@redhat.com>
 <b219788a-69e6-44cf-a609-91f9640967f5@moroto.mountain>
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

On Sat, 2023-09-16 at 17:32 +0300, Dan Carpenter wrote:
> On Fri, Sep 08, 2023 at 09:59:40PM +0200, Philipp Stanner wrote:
> > +static inline void *memdup_array_user(const void __user *src,
> > size_t n, size_t size)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t nbytes;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(check_mul_overf=
low(n, size, &nbytes)))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return ERR_PTR(-EOVERFLOW);
>=20
> No need for an unlikely() because check_mul_overflow() already has
> one
> inside.

ACK. I overlooked that as it was hidden in the callstack.


> =C2=A0 I feel like -ENOMEM is more traditional but I doubt
> anyone/userspace
> cares.

I agree with Andy here. We're not allocating, so -ENOMEM makes no sense
IMO.


P.

>=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return memdup_user(src, nbyt=
es);
> > +}
>=20
> regards,
> dan carpenter
>=20

