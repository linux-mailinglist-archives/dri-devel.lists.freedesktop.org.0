Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0141C042E9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 04:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED24810E9BB;
	Fri, 24 Oct 2025 02:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="amI7bFHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D743610E9BB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:56:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761274566; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LJA2ABNV41zIY3utHxeq8c6PDeAXksAej7Mxxw2N+ycQpU6uQtaZntEDuBUgmClLmzBsxKDqKk16LXxqQXiHeamZ1pyaAWI0K1Ond+2Yt9IEH9U4REG5JNxSzS9NG4/Bu2K/jfYcYkLZ1VAmrRr0bKzFwiK4S9xs4LHO+XQZgPI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761274566;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/mv8dm4RzElIaT09+m1z1YwB5+HyUL5t0yLE2IDW2XI=; 
 b=leqjlDTdx0uKcdYzsAMonJsQjEFQE09fyKzgNFztJszE/hVLSOJhO4O9ZOgXXtEtplqVL5CC3RFr4QuahLniQ3oYS/ANZzyfKIcflSxHscNOKeFmZH8xT3A18wG9Jl4GPw5bmMca9ziUfTqFIGD0Gidxait6zpaEaCZOJtRbgdE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761274566; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=/mv8dm4RzElIaT09+m1z1YwB5+HyUL5t0yLE2IDW2XI=;
 b=amI7bFHUiidcuH2K/kW1JLwQ5dw0JcJv4WxT96f2Wj1SStyAzux6JUjmVfoTDrYQ
 eEiH3NaUNSXohedGShradk5r62FADbIVIsTtfeoibZbWpN8vtZ3j1jYgEEKe8YFL5RK
 Q60Bsl2Z8JJ+iID3x64VpW6qfRnR28GjN/SbJBzM=
Received: by mx.zohomail.com with SMTPS id 1761274563811118.4337829556714;
 Thu, 23 Oct 2025 19:56:03 -0700 (PDT)
Message-ID: <8ac5053a-5f76-4145-a2f6-6bdd8316163e@collabora.com>
Date: Fri, 24 Oct 2025 05:55:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
 <afc6ba14-cd95-49b9-89f5-e90fd19c8927@collabora.com>
 <a2afbc13-0be6-46ef-a6da-9461fd30376b@collabora.com>
 <126a0b10-a550-430c-a1b3-7e144461a0ff@suse.de>
 <IA0PR11MB71850CA585D6E42C1E7217DDF8F3A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <c6b44524-4e44-46e8-89b4-8f90e074431b@collabora.com>
 <84de3c82-638a-412c-8e25-9ff507d59400@suse.de>
 <IA0PR11MB7185DCAF9132F2CD92E42620F8F0A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB7185DCAF9132F2CD92E42620F8F0A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/23/25 09:22, Kasireddy, Vivek wrote:
> Also, I think you might want to limit the plane sync to host mechanism to just guest
> blobs only because based on what Dmitry said the vblank timer helps in virgl/venus/
> native context use-cases. That is,
> @@ -138,7 +140,7 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
>         for (i = 0; i < new_plane_state->fb->format->num_planes; ++i) {
>                 struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(new_plane_state->fb->obj[i]);
> 
> -               if (bo->host3d_blob || bo->guest_blob) {
> +               if (bo->guest_blob && !vgdev->has_virgl_3d) {

Checking for obj->import_attach should be enough if it's only prime
sharing that doesn't work properly with vblank timer.

Please verify that only prime needs the workaround and send the updated
patch.

-- 
Best regards,
Dmitry
