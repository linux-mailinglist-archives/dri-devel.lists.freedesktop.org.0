Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4077DAEE96E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 23:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC5F10E134;
	Mon, 30 Jun 2025 21:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eBxRS/vy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A6610E134
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 21:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751318631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIlAVk2ZbX8me9bLr75zHJQl1+T5+qFsLqwij11xprw=;
 b=eBxRS/vy9Luz7L1ad6Aj/2IUMrntbR5RL39uwNkTU6DJ/ETU9Wue1Ii+TgorLMd/JgcNt3
 xzNU/5VD6ewGndxoZ09kx4mmEpUVGxi3gVMtkPjbuIGwj0hicKj9EEQKSi3J1UaicKzaeW
 4U3XibDj/p2pT8hnCf6jDvjlVbd05I8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-TQ2chmLjNsmMuJdvOzunLA-1; Mon, 30 Jun 2025 17:23:50 -0400
X-MC-Unique: TQ2chmLjNsmMuJdvOzunLA-1
X-Mimecast-MFC-AGG-ID: TQ2chmLjNsmMuJdvOzunLA_1751318629
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23638e1605dso14958845ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 14:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751318629; x=1751923429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QIlAVk2ZbX8me9bLr75zHJQl1+T5+qFsLqwij11xprw=;
 b=T1usnXbIyYDlnOvEqHkfk3I04BO9txNlLEf8kebtkyFTYpwAmJd7d+Yp22AXyRtdyh
 tRNjZ4/L5kcRHmNC11mvSBmctWviYjFTKM2QHvj4F4EUDfSCcLlvPViXnxx0mPw0xUyZ
 ZNoPc8r+Xz1cRlD4QtdA++l1o7n44D04XGSYWu6Roi7Daz3HZ4RY9cF0gyK6K/fULtfO
 y49+lNrNywDBtPwPKmW5Q0CLTUQw1MNKvgXCz5uus8hGT6oJeP2Zh/+YHT+kSOqnmDa4
 8uzLe1wlLwZl5FXl5K0+wG3KwHD40U6QfZqswpxePcEZRXUXF8I+hUt/rCnRDpBRtgUG
 gMYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS/sLIO+xuFDQKLezZTXRO6JBe7gTOkVPp9xJViHV+GyWixhoA68KbHy0xPMGflzFSGssHIzo94JI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxY6PfQiytDBGLRpblCbKnpg8XhmZbSxEB4yjZrz4rQsxqQCjtA
 cvfX2OQKsaYDbV4folhHYKm0XH48agsGYRc6mETV03AkfKpGOfP7dm/DohcaNxQ/aDP5dMIFhAF
 846/TkiM/fBGLsoHvXiQHJuqWI+vOY36DcKF1OdVjdalsNniUPdJY5D2F/eY0HMZcQVMgNmvwT4
 ZujLe8CW6SC/O1BN5UEXcSMKY8EC6lK/X71MWToF0Vim0j
X-Gm-Gg: ASbGncuyDsui5QOphN/hG8a+jFCi6OETKHpCaKBw3Uf01HZKodTHIWZxhCPKzwRc2eT
 xO74QmcMGYDg5WLL7wp5B4Wj0AKDDM8lbXqMC2qgru2oGrMX0GFDgaEvREtOn6ec/ZcUbHHIth4
 lCuw==
X-Received: by 2002:a17:90b:17c6:b0:311:fc8b:31b5 with SMTP id
 98e67ed59e1d1-318c9225e5dmr24950148a91.14.1751318629126; 
 Mon, 30 Jun 2025 14:23:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcSVGR5/6EewdJ0742GvcFHSpEOt4dnLCd4+olvboeyqLSgVN+Bt0wqrQ8im5iVf1LuZbfyWrhHtraLgdKLvk=
X-Received: by 2002:a17:90b:17c6:b0:311:fc8b:31b5 with SMTP id
 98e67ed59e1d1-318c9225e5dmr24950111a91.14.1751318628774; Mon, 30 Jun 2025
 14:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-14-airlied@gmail.com>
 <3a5bf0b0-7d45-445f-b9aa-d1a884634275@amd.com>
In-Reply-To: <3a5bf0b0-7d45-445f-b9aa-d1a884634275@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 1 Jul 2025 07:23:37 +1000
X-Gm-Features: Ac12FXzrssT7zZ7b2lMjd_goCz2aoyCNvkUuWlLwQHST8htW_hkgnqGzudTaDrU
Message-ID: <CAMwc25ojWJYaEvaoW0YZF3U8eHPTbyUKyP56dJ7vdc1K5=pSuA@mail.gmail.com>
Subject: Re: [PATCH 13/17] ttm/pool: enable memcg tracking and shrinker.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BLaZIXHf9DRUTq7hhdzaOwNF2wPlLqCMnevJGkkiutA_1751318629
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

On Mon, Jun 30, 2025 at 8:23=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 30.06.25 06:49, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This enables all the backend code to use the list lru in memcg mode,
> > and set the shrinker to be memcg aware.
> >
> > It adds the loop case for when pooled pages end up being reparented
> > to a higher memcg group, that newer memcg can search for them there
> > and take them back.
>
> Again, this makes no sense at all and will break existing use cases.
>

This is the use case you raised as needing to work before:

Allocate a bunch of uncached pages to a child cgroup, destroying the
cgroup makes those uncached pages belong to the parent cgroup.
Create another child cgroup, and when it allocates uncached pages they
come from the parent cgroup first.

What existing use case will this break?

Dave.

