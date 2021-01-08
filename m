Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B54DB2EF7A6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 19:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC866E898;
	Fri,  8 Jan 2021 18:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594A06E8A2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 18:49:20 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id h16so4750613qvu.8
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 10:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MXFPUIE9MtzGsCGF9Js7PwExxNJpMKSgT7ZaHn20CSs=;
 b=a3vl6hO+T9l9dVZWmv0q/vinuFwZGDfpQCub9I54wZuLl8KxGXjTFG+0giarjUOcNk
 7/9gdLFkUMF9TfEfVIZfZp6vFV/kO8i/7sxVgdpygnNeuS693CncEm4YMBPFxXDATukc
 bBrT1EWQDx8G7evhuQw/xUr94lYFBIcNwES56/sWkTP4ZuagMOAe2Da9cRmLnCgYlyOw
 uNkVf38nnjdTrIX48dgVPjgz6JFMTdw4uIPTyS1HV9TvBOiOyJLlLMQVmv2GtoeMQIJT
 zpl2AWKlLjwbNtJDNKSWNVTy7tjddVhauTTlzqCxhcOKCno9HgEsGsY2FVlyCzNz3o5i
 Xspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MXFPUIE9MtzGsCGF9Js7PwExxNJpMKSgT7ZaHn20CSs=;
 b=ZVxpE5ORndVVN9fw2OUeExf78VG1lubd3YHNw/8sEHyWWNnbxSjuxsdAksa6Wk2lEi
 g2VRAOIT0Rf+fjs0cqIVJkfOFIGyDzKugg6lyHOeR7IFMe8gbU0qcq8yXf+LNA6cxu5D
 fr7Omtxn/FBYLIpBXJcKTd8QdfCtvI+8rZJv2RxSasUL3k8+M4lm07KCq1UtDCpITtg8
 3lCeGeOu6EbhEaRAfAmqXbFe7vTdiX3piE6x03q6Fhss0DvkxXiIfekaAJku4GObqyYd
 VuTubYRWvTEkashTXnitsNKsT/KgXxRVJBm/97G3QjEj4kRKUkLAK5RzfX7BZa2+nT7O
 nU0w==
X-Gm-Message-State: AOAM533dyluFvVwkz7oy1O9x/Bbh62RUDO2axA5fgIeyDT7r9fvHApgh
 rUT+SfAbrS6cfazYCqSq4CFIudk8RzjJ+uF2hGfeTg==
X-Google-Smtp-Source: ABdhPJxkPCtYO7wlJ0geE6jbL7M5x6cX2NiazCvwOiWfsS4pOVgWgp9bME6+XwzjwSBndAX8p8lZ4XMenYZG+/X/VDQ=
X-Received: by 2002:a0c:8c87:: with SMTP id p7mr5115094qvb.46.1610131758765;
 Fri, 08 Jan 2021 10:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20210105114505.38210-1-christian.koenig@amd.com>
In-Reply-To: <20210105114505.38210-1-christian.koenig@amd.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Fri, 8 Jan 2021 18:49:07 +0000
Message-ID: <CAHbf0-HnCdsGO9No1Ug+QEaz2WXm12OOJ9VXvhYF1P98_6GU=A@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: Remove pinned bos from LRU in
 ttm_bo_move_to_lru_tail() v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Lyude <cpaul@redhat.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0370854204=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0370854204==
Content-Type: multipart/alternative; boundary="000000000000875cd805b86803da"

--000000000000875cd805b86803da
Content-Type: text/plain; charset="UTF-8"

Hi

This breaks things for me on my Prime system

https://gitlab.freedesktop.org/drm/misc/-/issues/23

Cheers

Mike

--000000000000875cd805b86803da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>This breaks things for me on my Prim=
e system</div><div><br></div><div><a href=3D"https://gitlab.freedesktop.org=
/drm/misc/-/issues/23">https://gitlab.freedesktop.org/drm/misc/-/issues/23<=
/a><br></div><div><br></div><div>Cheers</div><div><br></div><div>Mike</div>=
</div>

--000000000000875cd805b86803da--

--===============0370854204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0370854204==--
