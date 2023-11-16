Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C66AC7EDCA5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 09:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E4D10E249;
	Thu, 16 Nov 2023 08:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C70A10E249
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 08:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700122308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QdxgmAIHvXZQQ6jHVUpXaSiCgu9Ax2tLuylEkXqKU7s=;
 b=LPDCrJ/NnJm4tqE1HYwvabQ4pWdMxYeC8IqWY3ic2r/cnvpJxzOwjo0Nu2TKdez7KgWtUy
 tccFBxBsNfbFD/0rJ2cgDzfP/I1OAoC6nx1KjVWo9ZZ9EWRBsaE8fjdG9oTbRS7hzq6R4+
 X29m5+g2uPbTbV+rvwQGZpXNKWFkqP8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-qB9WF6C6PzSIz8ZupwS_rg-1; Thu, 16 Nov 2023 03:11:46 -0500
X-MC-Unique: qB9WF6C6PzSIz8ZupwS_rg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40839252e81so2886075e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 00:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700122305; x=1700727105;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QdxgmAIHvXZQQ6jHVUpXaSiCgu9Ax2tLuylEkXqKU7s=;
 b=Mouz08q8pu48bPiGoQsm6Q5DnSdo+HEOiFx5Zy+L61QBfM38sxaOKiI+4pf/2Ch/dr
 sK5Ee8tO3cJookxD94uZ0raYvZckeYFotMhxFchfUIrTbcOxNG7yWJzzi9wunL3Bef4O
 Wu4yuvSn+aUff9+SzvGYP+mMnoinz1p3sr2fyruuQ045rYMWBpB4MFomnlEus2i5Mjh2
 MjdxM0j7NL/hHEYtr9rGWY9ACZ8CFhfJ2fRSH2sUbKhJkKti6YfANeJOuxyfJiXs8X+k
 FS11KVgeAxqO9wov7tr9iKSBxRSrUi189d5A+syyYFyikwmWrAIHYQNJtmAQdeMJ52Dr
 QpPQ==
X-Gm-Message-State: AOJu0YyEKOc50B3+1SykZXbrZXqoIb/Q8xNuJIQjT8uRx9ka4RxEKRTk
 RRbJvxntvfW745JyvBt1gSIRp8WRc2u5GRqSdxAMgA+7a+c0wrcLqp0713C0noowQXbLU8yndzd
 xbJxDJ1XZ/V1m51DQa+8d58M7uwlQ
X-Received: by 2002:a05:600c:c14:b0:409:51c2:1192 with SMTP id
 fm20-20020a05600c0c1400b0040951c21192mr11997531wmb.38.1700122304999; 
 Thu, 16 Nov 2023 00:11:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFArIjVMDUnueoI1XD+Bo6xsKtSuttRwG0IUwtvvb5tgUEIqUlUQnkr13VMXQfIq5mmPwWJw==
X-Received: by 2002:a05:600c:c14:b0:409:51c2:1192 with SMTP id
 fm20-20020a05600c0c1400b0040951c21192mr11997506wmb.38.1700122304611; 
 Thu, 16 Nov 2023 00:11:44 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c4fd600b004064741f855sm2504399wmq.47.2023.11.16.00.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 00:11:44 -0800 (PST)
Date: Thu, 16 Nov 2023 09:11:43 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
Message-ID: <73cg637ax5cahqocscx5cjvtqkwlt4ves6cxgprbwqllasxq6v@gk6vzsqfc46j>
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
 <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
 <20231114134506.2ba0de1f@canb.auug.org.au>
 <530b6100-4f4e-4b3d-8fea-5b316e989633@gmail.com>
 <20231114140855.0b259b2d@canb.auug.org.au>
 <f1b21cbd-5bb6-4030-ae7d-a0ca2fbc76a9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7hqxyzpgktklwnyb"
Content-Disposition: inline
In-Reply-To: <f1b21cbd-5bb6-4030-ae7d-a0ca2fbc76a9@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7hqxyzpgktklwnyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 06:46:21PM -0500, Luben Tuikov wrote:
> On 2023-11-13 22:08, Stephen Rothwell wrote:
> > BTW, cherry picking commits does not avoid conflicts - in fact it can
> > cause conflicts if there are further changes to the files affected by
> > the cherry picked commit in either the tree/branch the commit was
> > cheery picked from or the destination tree/branch (I have to deal with
> > these all the time when merging the drm trees in linux-next).  Much
> > better is to cross merge the branches so that the patch only appears
> > once or have a shared branches that are merged by any other branch that
> > needs the changes.
> >=20
> > I understand that things are not done like this in the drm trees :-(
>=20
> Hi Stephen,
>=20
> Thank you for the clarification--understood. I'll be more careful in the =
future.
> Thanks again! :-)

In this case, the best thing to do would indeed have been to ask the
drm-misc maintainers to merge drm-misc-fixes into drm-misc-next.

We're doing that all the time, but we're not ubiquitous so you need to
ask us :)

Also, dim should have caught that when you pushed the branch. Did you
use it?

Maxime

--7hqxyzpgktklwnyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVXOvwAKCRDj7w1vZxhR
xSpoAP9R6u/FDuWma6CxU5HZBYqMkt5dLAFaBh09JkKgEgODsQEA+ff+2mfWZWks
JIa2770u4xDDPwvd4rX6nTK1ILbicQk=
=OXab
-----END PGP SIGNATURE-----

--7hqxyzpgktklwnyb--

