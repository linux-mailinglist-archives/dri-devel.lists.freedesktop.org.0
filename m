Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C35D14153
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D4F10E418;
	Mon, 12 Jan 2026 16:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V7p+fn7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB16710E418
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 16:36:54 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so36468475e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768235813; x=1768840613;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iuN40gNIyZBuGMzBE5z0ViOghmdtoXr0DPh84HD5+v0=;
 b=V7p+fn7d0b+TkoVgSLiogWlTfS9nOOoqoJs0MO6k7tfErqWAyO4P6sN/gpTTsIG6RE
 jgDij+QdQq+zTBrax32YE1t5fGrQr6hioVhOSOOETDKwtYEVUGvoi5qIZUmWvg0KuE7U
 OyWcekJ/zmfzwG2KEPlF36qTpVb8qs+vpWgqhMPYo8DQWx0hbb6VfgBcwCKu1dRjvTcO
 T8z7ypkbYU5LfTKpHx7vJvDwc/4/3l8fmcObekMGR7E5XvnkgrLQBCIjebqDLB6l2zZ5
 jjqfWSRzn3W7x73mnNstYTztA5pk+4mwUrR7ckv2DfIdOD5nN5xI39SgiTUl9082n5Wr
 wfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768235813; x=1768840613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iuN40gNIyZBuGMzBE5z0ViOghmdtoXr0DPh84HD5+v0=;
 b=hUxcdrIvcmexPPEfEtIHxfgFpJYK/RcfGBpK8UoPglPbdZ7ug34Gr1nnQ5xeqLFTZm
 Gy8SzXAYgCfzRODEXyRUcKF2ii8bvNtl2knyWH8xFPkcF228xRUxykFb8dYiB7gl/el5
 qV3twSenicl7Ct62esQPMz02K+H7KIBu7uaIZUKDxTntLOaAQpDQG1UieQU9ZKLeOWfv
 bqD8sxghgR4+253Fpv7I6ellIk22MRTeiwlAVxpT2WW+e0hUEt5iQe/V87+qK54bGtH7
 KmOlxjULQ5xAWLV/6Lc2CUNX3M9m/Sdamd4CqeFxjLgjaCbYjc1iUVVc9Ia0T/wDaLfw
 jn5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY1261NDlwRJqXs2E9u82ORul4uYmzMVt8pR4A1jRLK1daYAOc1twA2RpUVEUahyEMJcy3etdV9PY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmhX/mAKBEtiL0THR+z+NBTjKTYvIqVyc8qLehQ4p+4sgH9jXD
 +s/6P4rRsWaIfvNDiisoZAMXFNDV6kaWuMF/gm10DO/Y105fGU5SF2EWihlPLsB/eng=
X-Gm-Gg: AY/fxX5j0J1kLLIQ78gNiQi1c8gcCiNxirDh789FdLsDqQcaf6gMw5y1KVCrwENb1M3
 RdWBnIjuba13mNHM3rgMsSRBfbGyHk4wQ/SUiHOyZaiFlpuMkSRq29F594gC08BjwJJe9/Obc4o
 W0u4xEtqpNtKPAZbsQYgQ3IanBL6KZR6bpEkrhCRDSxN7Qpg8xK0Unzmrz7BG6IgM7smdTmRl6s
 VFCfLKQeK1mnjA2mkoTwKTgBehgZDmUPYN7Zckzq9B0pS3p+5ch0jWH1aZiowkCK6JpLPBSyovR
 F0nGKlbRUYHiMC+rVNmKKcRvQpwa7/uVAPTOclZubSUY++QXXTUwLx3XcGGrnnS/Zkj0+ApLtrx
 7YFxquWeAT1ALHuZek0+wwTe16z1tjvvsV25P1Z/YtHI5/oqSt6Mp3FaRoSw2Gf9WHg+LDxcnXa
 JdCtkI5dxz/zdSqqMmd0vRsEuek39aFKzfigeeSSCDyjf4g9Pc+nTGyWPhGYTTCkeeazQpNvSi
X-Google-Smtp-Source: AGHT+IFVWjkYmspdIo+VHzJS6pc/DuMRVMtKtFY4d5NqlyFw/HXxxGZXcPwZ3d7963IvfcY0zKgJcA==
X-Received: by 2002:a05:600c:3e15:b0:477:a219:cdc3 with SMTP id
 5b1f17b1804b1-47ed7c16bb0mr245735e9.12.1768235813097; 
 Mon, 12 Jan 2026 08:36:53 -0800 (PST)
Received: from localhost
 (p200300f65f20eb047d7efe6100b35af4.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb04:7d7e:fe61:b3:5af4])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-47d7f410c6csm375182565e9.1.2026.01.12.08.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 08:36:52 -0800 (PST)
Date: Mon, 12 Jan 2026 17:36:51 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: mipi-dsi: Make use of bus callbacks
Message-ID: <hhzmdtpm7q4el36wzr2cbu2etkmsf5rcmu26n3x6jgjlux3obk@zgtlzhe2zk2q>
References: <20251219100452.3387068-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tw6ysm4htfggxdzp"
Content-Disposition: inline
In-Reply-To: <20251219100452.3387068-2-u.kleine-koenig@baylibre.com>
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


--tw6ysm4htfggxdzp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: mipi-dsi: Make use of bus callbacks
MIME-Version: 1.0

Hello,

On Fri, Dec 19, 2025 at 11:04:51AM +0100, Uwe Kleine-K=F6nig wrote:
> These are nearly identical to the respective driver callbacks. The only
> differences are that .remove() returns void instead of int and .shutdown()
> has to cope for unbound devices.
>=20
> The objective is to get rid of users of struct device_driver callbacks
> .probe(), .remove() and .shutdown() to eventually remove those.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>=20
> only build tested (on x86_64, arm64 and s390x using allmodconfig).

Gentle ping. Is this patch on someone's radar for review and/or
application?

Best regards
Uwe

--tw6ysm4htfggxdzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmllIyEACgkQj4D7WH0S
/k4HsAf/Vo2ddYTR7o29wzzWGosoDm/NWEa3/4HQRgu09//G5RN5wmLEN7QF9W7x
9zpm/0YR9S1lISnHCht3Vo23BSkJwakwHBS4Iwthm098RQMQB97QZcs8JyEKW0dH
OmPbbK7riv4X4fJE8MzO9ZDhx6HMVuYgCM6auOUS53p1uE4DaPSFTXodCE9x0V8t
rfrGZ+wc+8xp5UC7fQrurWbghTnI1Ed/UfPOVJ5AHwj81bIdVJZB3g4IDVovAnyj
55QvZt6hfojLoZr6MQ+CEFNkNXGUGDZu6NkA1QVE9sztqrt9Exk1LggamLkbMJNT
ZrpgbCi82L5xXN7LI/vaUMngLdC4iQ==
=asom
-----END PGP SIGNATURE-----

--tw6ysm4htfggxdzp--
