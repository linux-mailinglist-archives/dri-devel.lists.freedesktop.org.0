Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5CC94945E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 17:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6849110E175;
	Tue,  6 Aug 2024 15:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="hkBrdXIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459F010E175
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1722957634; x=1723562434; i=markus.elfring@web.de;
 bh=bLhzpkSHLPZnvLieT2mCYEBjfAyqjRQ+E91la7udnrc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hkBrdXIkBwnyHMFqBirYkW6NJhy0TK2OVES+eWkfGLJORcFkjBjgG2iQyVks+oK3
 J5UZrTrFkv02JqTdBx1m5UqD5bk50kNvg+qlfUeocb3lNMLkConFejCZ3cCFEwY2i
 0/r/vg7xm0G/6sJVjV8Kb5ZAO7riAxKr2zxp7v8pp+8HFHqdxsvz1kcEN46oRUZsq
 Juhl87KtHcljcWuR5DGGv2z4l895kezW10fgAlBhwzbtiNPVkUbRUcrDDedskboed
 759uk/SCdxTIH3Lt3HrL55M0AKCYL0n3459MA1EOh4vmUBHD7bY8jpxopB7AxY06C
 3GmxuSCGbWvz7iYlzA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MpCmT-1rs3IL2wal-00mucq; Tue, 06
 Aug 2024 17:20:34 +0200
Message-ID: <e518ae77-57bf-44b2-a0c7-0891ec80d03a@web.de>
Date: Tue, 6 Aug 2024 17:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20240806-omapdrm-misc-fixes-v1-3-15d31aea0831@ideasonboard.com>
Subject: Re: [PATCH 3/3] drm/omap: Fix locking in omap_gem_new_dmabuf()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240806-omapdrm-misc-fixes-v1-3-15d31aea0831@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sbEVBCwDOame7wFPdZHP4x2lqMPfgWJ11pWsTF4wmBA0PxY6t1u
 gHR9GLAtnEKBHR9MTA7eI7XxQLbnBBJDIagxOQaLhLB6cwgEBZgbAL1I/VMqiOmmGaclWFE
 0x7R17NtPn7a6xAec3YM0aR3gcknd7ZqDuB/GaUtY8/WawiHELh2t4vWpEOhUhC7DSRDQqU
 N7Qz0+21zRdLHBhacTh+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RtNFlnzJ/6s=;2slBPfpUUE6mHrHpc9apLM0R56m
 RWI5ly1k38lGCY+KQSHaPcXpdtlSZBB12suoKYySjRVHEoe3iXDMvV+Ldn1HgLWLiKEBYkg8S
 OgoIKrIeZu6Xt4IYJ/E2c991lou+Byn2Nl9hPAi5IrLPfV3arWOwXQHtvSB1+h1QJLeAcs9OL
 Zf7GG9IBBTb3F4aerXtpgimyB+8a2xLpxrRpQfqhLyMUev2cNLhs4VXgKxOdaM9Kg/AJAtQpY
 ivgIJgbCvd2s6k8+8MWaWmwTC8p07zQyWRuXJC5WY/Lky5w6XZoKniFnRRGfpMv70MjWXlh2O
 Yz4WD6d3j23xVV+6qOUpLqqTFwU1ZfXJKOVnZ9ziQZlvvpjfhhNSNjGUZTX88FvW4I8lSZl/s
 7ZjKf1BKM3002X0139M+vkFSeMVpwMXk9ZCAHq7ufyxEWhmihLyY1Pb0ROLRDL5ztryo2qdz/
 tRV/pkNnW5nD64o/ZxtIxkvkAvMIQPukOwB5FRUXPecYWM03XpStDY/rhpGyFHMDI7Jercux+
 alTGpyZqrJ+HA1KAXcYCKIZ/vSsy8rUyEv5G3GRt7fhJaNGZukUsfg/vTVKZ7dWi/xwZXDfzW
 XQC4A2YCFs6FIvuNIziBwJQHhkdeSyo8pCUfNIMveU9xohkE73GWF4GBnIfHDeLVEcU1O5xLp
 Y9XTd3T4MPA6F2ba4RhNIpzQQEr8s1mCfAoXcuHkgUSxkUA/5CFUvJkHIAxXurEc6ehRsJK8X
 i1cIKeZbxs8vka9+hGLDEvHA/aERPfd3jotkoU2ypChbTTRW2XRSm1fXVbT7nECVJ+On/8tPn
 uJgvQe9NByq/Mm+1MBp8gy8A==
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

=E2=80=A6
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
=E2=80=A6
> @@ -1418,21 +1416,17 @@ struct drm_gem_object *omap_gem_new_dmabuf(struc=
t drm_device *dev, size_t size,
>  		pages =3D kcalloc(npages, sizeof(*pages), GFP_KERNEL);
>  		if (!pages) {
>  			omap_gem_free_object(obj);
> -			obj =3D ERR_PTR(-ENOMEM);
> -			goto done;
> +			return ERR_PTR(-ENOMEM);
>  		}
>
>  		omap_obj->pages =3D pages;
>  		ret =3D drm_prime_sg_to_page_array(sgt, pages, npages);
>  		if (ret) {
>  			omap_gem_free_object(obj);
> -			obj =3D ERR_PTR(-ENOMEM);
> -			goto done;
> +			return ERR_PTR(-ENOMEM);
>  		}
=E2=80=A6

I suggest to use another goto chain instead so that a bit of exception han=
dling
can be better reused at the end of this function implementation.

Regards,
Markus
