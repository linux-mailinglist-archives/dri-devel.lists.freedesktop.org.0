Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9E78ECE2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 14:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011F610E64F;
	Thu, 31 Aug 2023 12:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B9710E193
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 12:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693484219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TIPZiS5WiygpRoovt73Dy9nOHlU7oscs2x344MogyU=;
 b=QM8qKAGK9IbMC12Q/AkAwOOUxhcHEkaJE44UypwcxBVT3DZHx0zXKuJ8AqFpG+w2l1TOI7
 iBg4q95YWZKhKSkF2Wbr3fZ0ka5huN5LZP2C6jfRQUVLBCPRPK9lNTXmlV3aQl68PCnK0L
 Nzv6NTkmOEWsl0c0ltb8bjVSKkcoOJ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-biK5zC32Mwyo7aVVU02nJQ-1; Thu, 31 Aug 2023 08:16:57 -0400
X-MC-Unique: biK5zC32Mwyo7aVVU02nJQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-401b91039b4so1308625e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 05:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693484216; x=1694089016;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1TIPZiS5WiygpRoovt73Dy9nOHlU7oscs2x344MogyU=;
 b=ixEs2N1x+EHdc9qA6HQsTmDPCMD7VvW2BB3sWJO5pkxdpxXpaRcMmbLFWYdSlRvIvY
 E0DYRQe3DPuEK47JlTAaz3vl1XD2Nv3s50pzC6jZJN0Rc85rr99s6URBQzcHwGMV2Z9l
 HRZa+LjTdVwNfbOa66GBsGri6d1uCByubz0T9Yj28YtMIZpuTKN1E6BRPqZNwGXv+gdt
 It2dDnnd5+etxhFYowMCiQFpYvvUiFgVjq6+QzQkBUGdd3saePkWjlgYm16ny7j5856z
 +U7PUk6cSsdLTXUmQDYsizzskzFYYS3dYaednCM34YGr9B6eugNMFPstjnd76NjYF89s
 m6bg==
X-Gm-Message-State: AOJu0YyWraDnC4A810zaXl3PAeTp03ELaORj4P+hyj6Y+NrbxwpSmga9
 pkR/Rpeey+63M74pqC+CFIHDn4TCzm8B/QNXpOf9K0pdKlt11EZ6EppDvCBhjZoTv+F/uO8Mu1E
 HRB/9Ny87pWcJMbUCDBYebbad8htt
X-Received: by 2002:a05:600c:5113:b0:401:c392:d28d with SMTP id
 o19-20020a05600c511300b00401c392d28dmr4029831wms.2.1693484216702; 
 Thu, 31 Aug 2023 05:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGojultcfb0NIiOQPSvztdAjpKlNPabZq65nI0NSxG/DjDY/J8YCs5kvptoKVkC+FPxrHVegg==
X-Received: by 2002:a05:600c:5113:b0:401:c392:d28d with SMTP id
 o19-20020a05600c511300b00401c392d28dmr4029795wms.2.1693484216302; 
 Thu, 31 Aug 2023 05:16:56 -0700 (PDT)
Received: from [10.32.64.120] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a7bc7d1000000b003fbdbd0a7desm4922787wmk.27.2023.08.31.05.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 05:16:55 -0700 (PDT)
Message-ID: <98bf616420e4ef3c7c18a1f52fda7cd410137f7d.camel@redhat.com>
Subject: Re: [PATCH 1/5] string.h: add array-wrappers for (v)memdup_user()
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 31 Aug 2023 14:16:54 +0200
In-Reply-To: <CAHp75VdqFPJAnCm9A-S+TCChr9v9_s=Wfnb5wO2=vuwp1v+JvA@mail.gmail.com>
References: <cover.1693386602.git.pstanner@redhat.com>
 <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
 <CAHp75VfkzV-=XuEZwipYzfHNu4EXuwzbu6vfEKh1Uueseo2=wA@mail.gmail.com>
 <721a70c347d82931d12e5b75b19d132f82ee5ed2.camel@redhat.com>
 <CAHp75VdS=kSWnz8FzHcdrZPaeZKsQNbzjE9mNN7BDvZA_nQpaA@mail.gmail.com>
 <a4ba0493965ad32fcf95cd6e2439096668a9ed46.camel@redhat.com>
 <CAHp75VdqFPJAnCm9A-S+TCChr9v9_s=Wfnb5wO2=vuwp1v+JvA@mail.gmail.com>
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

On Thu, 2023-08-31 at 11:59 +0300, Andy Shevchenko wrote:
> On Wed, Aug 30, 2023 at 10:15=E2=80=AFPM <pstanner@redhat.com> wrote:
> > On Wed, 2023-08-30 at 17:29 +0300, Andy Shevchenko wrote:
> > > On Wed, Aug 30, 2023 at 5:19=E2=80=AFPM <pstanner@redhat.com> wrote:
> > > > On Wed, 2023-08-30 at 17:11 +0300, Andy Shevchenko wrote:
> > > > > On Wed, Aug 30, 2023 at 4:46=E2=80=AFPM Philipp Stanner
> > > > > <pstanner@redhat.com>
> > > Alphabetical.
> > >=20
> > > compiler.h
> > > err.h
> > > overflow.h
> > > ...the rest that is a bit unordered...
> > >=20
> > > > > > =C2=A0#include <linux/stdarg.h>
> > > > > > =C2=A0#include <uapi/linux/string.h>
> >=20
> > I mean I could include my own in a sorted manner =E2=80=93 but the exis=
ting
> > ones are not sorted:
>=20
> I know, that's why I put "(to some extent)" in my initial comment.
>=20
> > We could sort them all, but I'd prefer to do that in a separate
> > patch
> > so that this commit does not make the impression of doing anything
> > else
> > than including the two new headers
>=20
> But you can do your stuff first with better ordering than you
> proposed
> initially, so there will be less churn for any additional change
> (either that simply unifies the thing or something else).
>=20
>=20

I'll take care of those points in a v2 once I gathered some more
feedback from the other parties.

P.

