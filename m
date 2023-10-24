Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CF57D4725
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 07:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F6810E2DA;
	Tue, 24 Oct 2023 05:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556C510E008
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 05:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d54Mkgz9knVti1howqKS4E4piPBKh7+2uE4t5QBhWCo=; b=gX/Cyknlha9iNOiLemIQkieGN6
 fCA0cJZk4WDmZh3yrqBin8C9ruaKKPLE1eIT1rsqnW33iEqpSXFnUxnhw6K8UQRyLLqclkHubaM0g
 I8K1p6I2rSd2FETcvu+ByvhO/2TQUHGYkD6IOFSssI6l775MneMIgutQzBE+FAZ7qlyyoQi0xaYn+
 o3zcpgtM9fzyigP9c1usAjb5alER/be91RQ5Ltyf+04ECErsrNsNDximRhrmVWS2y9znJPzl+I76u
 deyzgLQPKiCskNxrneCR9uiHR1qGhB09EWqI7CgDKJnaLo4p+s5MgJNvDrlqPKnySyGLkbQgutkV5
 IXHKtwVQ==;
Received: from 242.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.242]
 helo=[192.168.0.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qvAQK-006EoT-9K; Tue, 24 Oct 2023 07:57:52 +0200
Message-ID: <807b6fd6f6100c7cd824f4aa1a80ec1421d7222c.camel@igalia.com>
Subject: Re: [PATCH 1/2] drm/v3d: wait for all jobs to finish before
 unregistering
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Emma Anholt
 <emma@anholt.net>, Melissa Wen <mwen@igalia.com>, David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 24 Oct 2023 07:57:51 +0200
In-Reply-To: <20231023105927.101502-1-mcanal@igalia.com>
References: <20231023105927.101502-1-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

El lun, 23-10-2023 a las 07:58 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> Currently, we are only warning the user if the BIN or RENDER jobs
> don't
> finish before we unregister V3D. We must wait for all jobs to finish
> before unregistering. Therefore, warn the user if TFU or CSD jobs
> are not done by the time the driver is unregistered.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_gem.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> b/drivers/gpu/drm/v3d/v3d_gem.c
> index 2e94ce788c71..afa7d170d1ff 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -1072,6 +1072,8 @@ v3d_gem_destroy(struct drm_device *dev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON(v3d->bin_job);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON(v3d->render_job);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON(v3d->tfu_job);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON(v3d->csd_job);

I guess we should do this for cache clean jobs too, right?

Iago

> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_mm_takedown(&v3d->mm)=
;
> =C2=A0

