Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB88D868AA6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF3510E894;
	Tue, 27 Feb 2024 08:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dIlnQEKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B16F10E894
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709021801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=lOi/vo8rBjyzUEhA9inOZ5sgQfPqZBfkPLWUr0rqIWQ=;
 b=dIlnQEKTyo3u0YhPGgogFZMDw2dLmFqQprM3E5+EtJWUf65qcGRd67E+oGtfBZbvXqw/Po
 NI/2wtzCTUu6zZH1Ub1hG2H7Zwp22wReKcmaQMP7DbORCyfQkNJUKp3ICjQVdiyEJt7cgx
 AtfrySu8EIWJFM0mirqq8bVZgoMhc/s=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-bJJbYgRfOzO6O1nkm7hMCQ-1; Tue, 27 Feb 2024 03:16:38 -0500
X-MC-Unique: bJJbYgRfOzO6O1nkm7hMCQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2d29fb0dbbcso2342371fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709021796; x=1709626596;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lOi/vo8rBjyzUEhA9inOZ5sgQfPqZBfkPLWUr0rqIWQ=;
 b=f+bSE3dxov6/i6C1L/0+w5JBFr5JScSXZeVWUx5k9+Cb2o30CYQUgtHPpEupU3quZD
 PtsVQ8vCgx1cRS8X2WxQ1/6judmAFFutYJMG+pJFlKY0MbSt/nirt/u92qYXvIQ5KtoX
 O7hWTXPO/u+Es+yMwTgj3dW9D+LV33sAgBtWoxS2yw2ewcTioDQREv5J8dmxsgHcAX0D
 kAjDj7CgIJ7u/HNF+DhMSTOriS0yWuSiUDDlmplXib9BS3AHhHTqpFjRz72taIRRzZWv
 6h4Abp1VLnwrMrcGiic6m8CbM7JA10ubAIXj4FnOp9WeRqZYU4M9T1crD8uk1wimsJ84
 wSsA==
X-Gm-Message-State: AOJu0YxCAXiKa6fnDMhbPWO2NH/zehNzmojYrX+Q7IMkOJZzIbzqVxI2
 PVO49dz4ohAdgKpWiEZit9bCfUFwjDYnRiO29ck4OA5NYusD+Sm6qJM49F8J5bW8if24P8xBric
 YH394O0UOZSRBeHxDe9UZ2FSGZFoFvhr73dDiSb9iofdkT37A34Uu7vI6NT6StEEYlcTV2htt7L
 Rv5B7zz2JP8p5Aq7/AunHaDuXlj7RehkAJaPIQMXi3P1EmoUVZ
X-Received: by 2002:a2e:be87:0:b0:2d2:6200:e661 with SMTP id
 a7-20020a2ebe87000000b002d26200e661mr6831348ljr.51.1709021796171; 
 Tue, 27 Feb 2024 00:16:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHU12k6I8eBQChPT4dnJB2yX0GeF9UfnhPLBTEXa94TPE7HFw5EAeEDMFOLRYx8tw1Xm89p/w==
X-Received: by 2002:a2e:be87:0:b0:2d2:6200:e661 with SMTP id
 a7-20020a2ebe87000000b002d26200e661mr6831335ljr.51.1709021795740; 
 Tue, 27 Feb 2024 00:16:35 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c205300b004126afe04f6sm14193258wmg.32.2024.02.27.00.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 00:16:35 -0800 (PST)
Date: Tue, 27 Feb 2024 09:16:35 +0100
From: Maxime Ripard <mripard@redhat.com>
To: dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>
Subject: DRM Migration to Gitlab
Message-ID: <k555c7lj3mcj2skzrmc2ywxzz5ndtdgfpitw7fftdlyjjpmfou@7maudk3vdxuf>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="euduzbvuzb5e7xof"
Content-Disposition: inline
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


--euduzbvuzb5e7xof
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Sima, after becoming aware of the drm-misc transition to Gitlab in the
next couple of weeks, to do the same for DRM today.

This is now done and all the various bits (nightly.conf, MAINTAINERS,
doc, etc.) should be there.

If all goes well, the only thing you'll notice is that dim will complain
about the drm remote not having the right URLs.

Any dim user should update the URL with either one of the two following
commands:

git remote set-url drm ssh://git@gitlab.freedesktop.org/drm/kernel.git
git remote set-url drm https://gitlab.freedesktop.org/drm/kernel.git

And the rest should be transparent.

Maxime

--euduzbvuzb5e7xof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd2aYgAKCRDj7w1vZxhR
xTy7AP4//GeDXy2kQwcvOE82CWEsAUDFsZmvZ+3zv4pXMSQyNQEA301VnPvvRPjl
BLga1fqRVx3E8ziINah+O1en7N6jkws=
=7X28
-----END PGP SIGNATURE-----

--euduzbvuzb5e7xof--

