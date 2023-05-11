Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F486FEF3F
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 11:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12DB10E218;
	Thu, 11 May 2023 09:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6553210E218
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1jyXwsXVLuabwuQiSz7oK3LCRImDJ1zXmlKCN7QRGM=;
 b=gnHpHfvZYczaeuYBHoTdxzVxbiaoIPcgXPv4RY8mjtvGb4AZ3tuQVob66Lkhz5IHabU5os
 O7qz2CUL02dmFcDqNMq8/jC6wRnJe4SO8MmSyvs9uzj2MjuPqA4NTagf9PTgLNeaZrjWUk
 nBKsjUO6NWn5gE2ZgjC9RzJQaOA+YYY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-Bp90J4STNC-rT-E0Nf8sTQ-1; Thu, 11 May 2023 05:51:20 -0400
X-MC-Unique: Bp90J4STNC-rT-E0Nf8sTQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4ec8133c419so669528e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 02:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798679; x=1686390679;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x1jyXwsXVLuabwuQiSz7oK3LCRImDJ1zXmlKCN7QRGM=;
 b=gjmpp2E/rx7GyXHIiSig1oP7A2Ee4Y7qaC+RdvCIDUYh8CYkeiLVrhXx9/eQvIE+Xm
 v8eCcYgf+oC3SANFDhYIavbT2+POxCE+nUk6mOOi9jZnPPUU0cs4uaM17EODFIo825Aw
 fAOqkcuAFmA17J3q82cnXQBi6ZlNmPSfsWb3krM+a2xN9qYZ9UKX3ThDl1/iv2Z5fiMf
 XQmOW0H3ykkr4qiw6z1I0jRwff5zrHeYqZimmwkB+ZjRtZD0CIVGSnK9tZ/FiNu3NglQ
 fmo74nXQ3GLNO/hlLcRE8aG+YrIUHm0x0NxK0qga/ApBkD62oz/VG3DPMDG3ZeTIinZu
 lPSA==
X-Gm-Message-State: AC+VfDwrhoz8R/wCaOntd3ieQwb2kOrBd6X54Sb0kIHnNaHg/CZkdjVp
 MY6hLYWmGMD4ONaOb3BGrThFWwITOrX/MkcJ3/dlBvdNedEP6zMZcrRHrCu4L5ux3FW+6eXwvhZ
 zSdztnGyexQQT8r8Mvxe6XEbDSGvdu4ZibpVQto9pBJ72
X-Received: by 2002:a2e:2204:0:b0:2ac:78d3:bbf0 with SMTP id
 i4-20020a2e2204000000b002ac78d3bbf0mr5778295lji.4.1683798679436; 
 Thu, 11 May 2023 02:51:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ564mlml45SxBZ5Hz7DOsiUWy7mVGeS+CYGSOYwpvH8HHxK01eulIS4vxUv8VdMVMNY9EBK5PqtiMXbulDu2Es=
X-Received: by 2002:a2e:2204:0:b0:2ac:78d3:bbf0 with SMTP id
 i4-20020a2e2204000000b002ac78d3bbf0mr5778291lji.4.1683798679109; Thu, 11 May
 2023 02:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
 <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
 <CAPM=9tyOFhE0zC8540KBOkDaZE1c3zTtke_vX=DEkMTmo04A4Q@mail.gmail.com>
 <QL28tg_ZcXPQ1W5l8Hp3rDlvyKuMh09kjGHpj1GRKVrMqlB-hNI2F6FzRSP-NyfkMpk6tsO55t8UYF6Uk9b7IF1O1BHH1WKc88kNTgY2Ugk=@emersion.fr>
 <ZFtO2bMQOWVhRkSG@redhat.com>
In-Reply-To: <ZFtO2bMQOWVhRkSG@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 11 May 2023 11:51:07 +0200
Message-ID: <CACO55tvzdOU4hnqbpTsd=_SeP0GHt235w=NGL74Oq0Fd35V6HQ@mail.gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
To: =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Aleix Pol <aleixpol@kde.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 9:59=E2=80=AFAM Jonas =C3=85dahl <jadahl@redhat.com=
> wrote:
>
> On Tue, May 09, 2023 at 08:22:30PM +0000, Simon Ser wrote:
> > On Tuesday, May 9th, 2023 at 21:53, Dave Airlie <airlied@gmail.com> wro=
te:
> >
> > > There are also other vendor side effects to having this in userspace.
> > >
> > > Will the library have a loader?
> > > Will it allow proprietary plugins?
> > > Will it allow proprietary reimplementations?
> > > What will happen when a vendor wants distros to ship their
> > > proprietary fork of said library?
> > >
> > > How would NVIDIA integrate this with their proprietary stack?
> >
> > Since all color operations exposed by KMS are standard, the library
> > would just be a simple one: no loader, no plugin, no proprietary pieces=
,
> > etc.
> >
>
> There might be pipelines/color-ops only exposed by proprietary out of
> tree drivers; the operation types and semantics should ideally be
> defined upstream, but the code paths would in practice be vendor
> specific, potentially without any upstream driver using them. It should
> be clear whether an implementation that makes such a pipeline work is in
> scope for the upstream library.
>
> The same applies to the kernel; it must be clear whether pipeline
> elements that potentially will only be exposed by out of tree drivers
> will be acceptable upstream, at least as documented operations.
>

they aren't. All code in the kernel needs to be used by in-tree
drivers otherwise it's fair to delete it. DRM requires any UAPI change
to have a real open source user in space user.

Nvidia knows this and they went to great lengths to fulfill this
requirement in the past. They'll manage.

>
> Jonas
>

