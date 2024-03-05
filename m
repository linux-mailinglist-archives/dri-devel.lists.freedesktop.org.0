Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B23871C44
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4616910E45F;
	Tue,  5 Mar 2024 10:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Jy1g5BMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD1710E45F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 10:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709636055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=xBGQevaPbKkfZEzBHZzBFZQ2yVfLSWmrdiNZnOMaYqA=;
 b=Jy1g5BMbpIOrr1ucFMj+mpk7P1+o9Sl0ejNWA7fQ9HmwUaOV+jPCTRFxRz0vwPH3VjaIvy
 d5IZrgWWLp2dgIv8eVICVzR1C5VKbYWwylMDl/hfZ3eRrzNdGG2lhWeOX/e4cmC01T42Il
 cz92NcNFdx4fs1+iS0ZFY5nmlTi9v2g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-u7A6V8EFP8iQG4yXwn0tog-1; Tue, 05 Mar 2024 05:54:13 -0500
X-MC-Unique: u7A6V8EFP8iQG4yXwn0tog-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33deb1f7afdso2804207f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 02:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709636052; x=1710240852;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xBGQevaPbKkfZEzBHZzBFZQ2yVfLSWmrdiNZnOMaYqA=;
 b=b+W1JiBRu5ssaw5eWME+rIe80Oj5jjF2mid6Vv5UMphG8XQoqa3ZfCQdB/VdjWAtl3
 FMV/veMLOSZSkmy6Sy1pzJ7IBHbCE005BNZKJ2cUTPSNVOt33kjwU9IT6kE4DZfgsOnv
 S5VhbBNZ8uMdiMmlKU7uHE4u+hQ8dF6QmsJzN7O0+4c/VN196tVY51sO1cvypLtXukOc
 UB6MuI8BCy8THqiq0kwpgzkWTltF0Egp05XqN6gQiarvnGBA2bu1wuXvPuGy3luq/dQz
 DhDBEDIeZg9ewcgi5l5kEfeTWaMQ6B8w0gUQ5Le6h+JlgRqVzKc6FN1EnN+5wraneyX4
 4wKw==
X-Gm-Message-State: AOJu0YwlpQBwa/dO0d0O4P4RphplF65bvHq1Q6sdEGttoGiX5NGtD5Gf
 42ZR9y72u/cP20Tm5mfwhYgXOroElMgtfTGDbU+UZyA7tBN8lIb1efbJUDdzWQQ1xqiueBX92Gh
 AyqzzeypFmX5RBexSfNYeVjPpXbB194+RnFuguqio9vQF6JMt722hvn4fK53nngbVbUev+SxMn9
 CwCc88Tld4wLfAUAFT2e1u3uJO5l5xvaXJduiFt9uToNZKHHN8
X-Received: by 2002:adf:a4c3:0:b0:33d:5484:e451 with SMTP id
 h3-20020adfa4c3000000b0033d5484e451mr7755802wrb.34.1709636051970; 
 Tue, 05 Mar 2024 02:54:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNgoAP+8tkeXxunL2pSz2s2pcw5HRxs8RnRVS9c3od3mh/xU66tm2745lMfTylVo1dLTKtwQ==
X-Received: by 2002:adf:a4c3:0:b0:33d:5484:e451 with SMTP id
 h3-20020adfa4c3000000b0033d5484e451mr7755781wrb.34.1709636051619; 
 Tue, 05 Mar 2024 02:54:11 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 cr14-20020a05600004ee00b0033dd06e628asm14661488wrb.27.2024.03.05.02.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 02:54:11 -0800 (PST)
Date: Tue, 5 Mar 2024 11:54:11 +0100
From: Maxime Ripard <mripard@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Daniel Stone <daniels@collabora.com>, Benjamin Tissoires <bentiss@kernel.org>
Subject: drm-tip Migration to Gitlab
Message-ID: <20240305-congenial-powerful-tench-a3d5ef@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ss4pztxfiu46qvg2"
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


--ss4pztxfiu46qvg2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

In order to prepare for the drm-misc migration that should happen next
week, Benjamin and I just migrated drm-tip to Gitlab.

It should be effective as of 5 minutes ago, the old cgit repo being
currently marked read-only, and will be setup as a mirror.

Thanks to the work done last week, we should be able to smoothly
transition any dim user after running dim ub twice.

However, this is the first time we're migrating a repository that users
write to, so it might cause some issues for people that haven't setup
their Gitlab account, and especially their SSH key.

If that's the case, you should add your SSH key in Gitlab. See the
documentation here:
https://docs.gitlab.com/ee/user/ssh.html#add-an-ssh-key-to-your-gitlab-account

If it still doesn't work, please reach out to me.

Maxime

--ss4pztxfiu46qvg2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeb50gAKCRDj7w1vZxhR
xdUHAP46+ToWptRkyZvFbQI6B+VoOuThyHbEQCX+96U5hB0i1AD+MrXwzuBc9u5h
JzQKf64wy2o2Q/RztkdHwYEiGGP3Zgg=
=bo7B
-----END PGP SIGNATURE-----

--ss4pztxfiu46qvg2--

