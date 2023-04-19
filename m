Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6F6E82E5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 22:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F2D10E07D;
	Wed, 19 Apr 2023 20:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E8A10E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 20:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681937673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wvra6V6vuYIrEPb+Aoj8S3fq1oRWM8hoEJREDLbq85Y=;
 b=gYVLPOM4kNDulrtR4YEq5JLEafYkDC2qxUxTrmJpLGyFt8HlcBQxKI7etvpwsTLTcYNHsl
 M4EqgosAy1r6f4V4FFN44wJ5MKzMa0+1Zc+mfKH4d1ooWEL6JW4v2+0xDGAL0CtA0O0REm
 D3QY3op3ur+x8cyku1UvkTLs7ydezPI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-fSnCq5KEPbCQdzxTMLq9pw-1; Wed, 19 Apr 2023 16:54:33 -0400
X-MC-Unique: fSnCq5KEPbCQdzxTMLq9pw-1
Received: by mail-qk1-f198.google.com with SMTP id
 z188-20020a3765c5000000b0074cdcea5d20so631167qkb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 13:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681937672; x=1684529672;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NwC/+o9d6wvrtiLeiNvOscHp+/u8nRn/PrEmgvt3fZ8=;
 b=Nee1vPpV1xdCidrETg1zQvqBOX5gMDJAm9BQaB07+QEFjanaLGu2WnyUoh9mSN7GoS
 QfIOmJYji8a3CtqVCD+JIGtN8hQppKjLNW8XHwoK4xJ0QMCrOabZDG8ecHVv86zWbGOL
 SE+sGVbBgV/wQ7HFVBk5hxrIfldCNUKsrYeu3z2k8DZTAIdQ71fird5rQKHaQgUq10we
 JMR2lHK5B4lL3h38jTACeTrw6K4G8L7hjYiwUjT+3Z1T4qoLpHtSXhtcdiLq6PD2Zh3s
 XW9sQkNrg/ZEtjrHxZbbRn1gVeE8PBn6DV/DtaGu4afRBphhTtoJg1X8mtx5mmH7FrBb
 KsEA==
X-Gm-Message-State: AAQBX9dp2XEBKWDGk8AgGZ4O2xp8llOZHA8B9XtbRbkX3ypZcaWnJ77y
 CfICG8CyNM0EmHslMVp1cmCeoTPrIRC485jEtf0TGpDCUyxVHpak1yxpVsQ2W9UVyKpSWdunAm4
 +f4lNzvU+P3H+RHxLX+gfK3H9cDDm
X-Received: by 2002:ac8:5910:0:b0:3ee:c749:ef6a with SMTP id
 16-20020ac85910000000b003eec749ef6amr8266981qty.7.1681937672554; 
 Wed, 19 Apr 2023 13:54:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350b3829jv2r254VCx6kpqm7ULHjkMhhvujywKwLYY5dhb3sKHN4WPrlOjqpEmuMgq3oHObuJiA==
X-Received: by 2002:ac8:5910:0:b0:3ee:c749:ef6a with SMTP id
 16-20020ac85910000000b003eec749ef6amr8266967qty.7.1681937672329; 
 Wed, 19 Apr 2023 13:54:32 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 b34-20020a05620a272200b007435a646354sm4932800qkp.0.2023.04.19.13.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 13:54:31 -0700 (PDT)
Message-ID: <d0b9654c756069a6f0edcca6f4d410f7af592784.camel@redhat.com>
Subject: Re: [PATCH v2] drm: use mgr->dev in drm_dbg_kms in
 drm_dp_add_payload_part2
From: Lyude Paul <lyude@redhat.com>
To: Jeff Layton <jlayton@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 19 Apr 2023 16:54:31 -0400
In-Reply-To: <20230419112447.18471-1-jlayton@kernel.org>
References: <20230419112447.18471-1-jlayton@kernel.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne.Lin@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks!

On Wed, 2023-04-19 at 07:24 -0400, Jeff Layton wrote:
> I've been experiencing some intermittent crashes down in the display
> driver code. The symptoms are ususally a line like this in dmesg:
>=20
>     amdgpu 0000:30:00.0: [drm] Failed to create MST payload for port 0000=
00006d3a3885: -5
>=20
> ...followed by an Oops due to a NULL pointer dereference.
>=20
> Switch to using mgr->dev instead of state->dev since "state" can be
> NULL in some cases.
>=20
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2184855
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> I've been running this patch for a couple of days, but the problem
> hasn't occurred again as of yet. It seems sane though as long as we can
> assume that mgr->dev will be valid even when "state" is a NULL pointer.
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 38dab76ae69e..e2e21ce79510 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3404,7 +3404,7 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topo=
logy_mgr *mgr,
> =20
>  =09/* Skip failed payloads */
>  =09if (payload->vc_start_slot =3D=3D -1) {
> -=09=09drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed,=
 skipping part 2\n",
> +=09=09drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, s=
kipping part 2\n",
>  =09=09=09    payload->port->connector->name);
>  =09=09return -EIO;
>  =09}

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

