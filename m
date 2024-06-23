Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C5E91394A
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 11:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8364110E01F;
	Sun, 23 Jun 2024 09:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=froggi.es header.i=joshua@froggi.es header.b="dp462EXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 905 seconds by postgrey-1.36 at gabe;
 Sun, 23 Jun 2024 09:36:12 UTC
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3025010E01F;
 Sun, 23 Jun 2024 09:36:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1719134464; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jg4pz1J7JxCUsIJ4NLlfVPom93hsXUjUUklYldn77UlW1J7vITR63f340Zjj7dP7VhhD/BbgdI7NJk+baaWW37SEBOUcb26sxcFXo1NMqwiDD2THPvLf9kyzvgbHvBaEWfaTcpF0qLQd6+Im1MRVNvX1FmZjZgHAD6wz3WGMN8o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1719134464;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IDRH7REOOmEJVw8zchCha1EpfhlNdrhZ3hVqEhf5ZDA=; 
 b=MsSiiiNraGuq7rO7jSAE5pvPrbAbhQ+RGkq8aDHqYxv4hkC4zD2iiFSyBlwR8ITo3C+F2CD7ZI+NW+eAXIC3Ma1Mv6tQ5agPMAtysLYKSk7v8ZqYfLnN+bjgE6b1tBL6JWV2RTl1t9sP4HGFL6q+LnYK4JJurS4Y8ML3Fm7Dlz4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=froggi.es;
 spf=pass  smtp.mailfrom=joshua@froggi.es;
 dmarc=pass header.from=<joshua@froggi.es>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719134464; 
 s=mail; d=froggi.es; i=joshua@froggi.es;
 h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=IDRH7REOOmEJVw8zchCha1EpfhlNdrhZ3hVqEhf5ZDA=;
 b=dp462EXwNpqN6bQk4NBsK7Y0qJQyW20U4EEY4OPuoFpZSSz17grCq5Ih0dxMkIlW
 bskDHbsJFp5QPIJ3M2boxH7yxEQ5yoRSFxGVtq4Q4Bztg3Ns/Qo6niPZr6H+1KMjTtS
 +Nll8F0KM6XmbJwuZb8gZDeTX9/0JEAH5FC8jJCw=
Received: by mx.zohomail.com with SMTPS id 1719134462217433.4917300655152;
 Sun, 23 Jun 2024 02:21:02 -0700 (PDT)
Date: Sun, 23 Jun 2024 10:20:57 +0100
From: Joshua Ashton <joshua@froggi.es>
To: amd-gfx@lists.freedesktop.org, Ma Ke <make24@iscas.ac.cn>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, srinivasan.shanmugam@amd.com,
 aurabindo.pillai@amd.com, make24@iscas.ac.cn, guchun.chen@amd.com,
 chenjiahao16@huawei.com
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: fix a possible null pointer dereference
User-Agent: K-9 Mail for Android
In-Reply-To: <20240622082219.1876200-1-make24@iscas.ac.cn>
References: <20240622082219.1876200-1-make24@iscas.ac.cn>
Message-ID: <C5F9411A-0396-4B7F-B6D8-38F2C067283E@froggi.es>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
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

Are you planning on submitting a bogus CVE for this patch too?

- Joshie =F0=9F=90=B8=E2=9C=A8

On June 22, 2024 9:22:19 AM GMT+01:00, Ma Ke <make24@iscas=2Eac=2Ecn> wrot=
e:
>In amdgpu_connector_add_common_modes(), the return value of drm_cvt_mode(=
)
>is assigned to mode, which will lead to a NULL pointer dereference on
>failure of drm_cvt_mode()=2E Add a check to avoid npd=2E
>
>Signed-off-by: Ma Ke <make24@iscas=2Eac=2Ecn>
>---
> drivers/gpu/drm/amd/amdgpu/amdgpu_connectors=2Ec | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors=2Ec b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_connectors=2Ec
>index 9caba10315a8=2E=2E6cf946adb6fe 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors=2Ec
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors=2Ec
>@@ -458,6 +458,8 @@ static void amdgpu_connector_add_common_modes(struct =
drm_encoder *encoder,
> 			continue;
>=20
> 		mode =3D drm_cvt_mode(dev, common_modes[i]=2Ew, common_modes[i]=2Eh, 6=
0, false, false, false);
>+		if (!mode)
>+			continue;
> 		drm_mode_probed_add(connector, mode);
> 	}
> }
