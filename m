Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C9D67614B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 00:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEA510E3B9;
	Fri, 20 Jan 2023 23:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D49C10E3B9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 23:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674256507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoknDUURrHLa74EzxLJ8GYuKHj7PHhY7S/GVYWdBSwk=;
 b=ZqfKHzuwe8BOFAgixeZH5YW37csqCp5P+8ET278K9n4gHdFjuJimfzguGwWNFhYfNapY8a
 zTa3N/FDs/YLZUkCbdtE8OWwvVq8xmg4DeBOGswJpTTkOd9N0JhOiZkhRJDnZRQtP92ZxX
 JzFq85TO0E3ctfT2pRcRxpuOd8ZiFo0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-drsX1suBP0KDa7fl8Pau3g-1; Fri, 20 Jan 2023 18:15:04 -0500
X-MC-Unique: drsX1suBP0KDa7fl8Pau3g-1
Received: by mail-qv1-f71.google.com with SMTP id
 y6-20020a0cec06000000b005346d388b7aso3134204qvo.6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 15:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XoknDUURrHLa74EzxLJ8GYuKHj7PHhY7S/GVYWdBSwk=;
 b=eulTbgm3EB2vzzUmOHnR0qhu6eGRB0lBBzsDys0CJbk+gWp6xV7Qh7ZadadNPdaP/G
 Om02swNJ/E1GyV0nzcmxNMnCgj9+n5pcwEFeLoPMKhjzcEg6s02DkSl7XaY+Y1nCzk7z
 1R+gbFLvUDyhRhHP4duTZaUSDI5DnZMrhBi8I+r2uKhG23xGppAIwWjHjIzAM3cDkCiq
 zWojUbH8ub22BqZkDQk/cDGkZZ4pwOGCJW3gScA8/2cMQ/IIzquB46SFuvQNRNZbVOJk
 iv+KyCU7fB0Njj1lIekM9kTFgaDq3vohh566jIzz2IyjCyWtItJWKXSEYdAcvW1E5QRG
 gt6g==
X-Gm-Message-State: AFqh2kqdSIjoyl0OA5wTuGGibGstCvHHAupeOGzIIjwoBOVanvbfyM4F
 /oOx9QH+zl83NnEhU/qaIJnKwjoA7jDKQcakgCJDoSaT7HOYDtMRiCE0AiXA1f8ZlaePC8tN8JP
 M0zFYBSpIjw4AqOTS5mjnKTTwClRr
X-Received: by 2002:ac8:4a9a:0:b0:3a7:e727:a015 with SMTP id
 l26-20020ac84a9a000000b003a7e727a015mr23249544qtq.20.1674256503676; 
 Fri, 20 Jan 2023 15:15:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuZ3OPhHyBXwLeLq03lJ8ap+cBCoJRfLsiSu+d4wxp73Gisjo99Hu0iq4zK0iczrQyF7CosDA==
X-Received: by 2002:ac8:4a9a:0:b0:3a7:e727:a015 with SMTP id
 l26-20020ac84a9a000000b003a7e727a015mr23249517qtq.20.1674256503430; 
 Fri, 20 Jan 2023 15:15:03 -0800 (PST)
Received: from ?IPv6:2607:fb91:2d97:94eb:ed0e:2784:4519:138f?
 ([2607:fb91:2d97:94eb:ed0e:2784:4519:138f])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05620a268400b006fefa5f7fcesm22371923qkp.10.2023.01.20.15.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 15:15:02 -0800 (PST)
Message-ID: <965500917008cd17b47c1be1f5eeda7ccc4eede6.camel@redhat.com>
Subject: Re: [PATCH 0/7] Fix MST on amdgpu
From: Lyude Paul <lyude@redhat.com>
To: Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Fri, 20 Jan 2023 18:15:00 -0500
In-Reply-To: <20230119235200.441386-1-harry.wentland@amd.com>
References: <20230119235200.441386-1-harry.wentland@amd.com>
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
Cc: stable@vger.kernel.org, stanislav.lisovskiy@intel.com, jerry.zuo@amd.com,
 bskeggs@redhat.com, Wayne.Lin@amd.com, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

So glad to have this fixed finally =E2=99=A5

On Thu, 2023-01-19 at 18:51 -0500, Harry Wentland wrote:
> MST has been broken on amdgpu after a refactor in drm_dp_mst
> code that was aligning drm_dp_mst more closely with the atomic
> model.
>=20
> The gitlab issue: https://gitlab.freedesktop.org/drm/amd/-/issues/2171
>=20
> This series fixes it.
>=20
> It can be found at
> https://gitlab.freedesktop.org/hwentland/linux/-/tree/mst_regression
>=20
> A stable-6.1.y rebase can be found at
> https://gitlab.freedesktop.org/hwentland/linux/-/tree/mst_regression_6.1
>=20
> Lyude Paul (1):
>   drm/amdgpu/display/mst: Fix mst_state->pbn_div and slot count
>     assignments
>=20
> Wayne Lin (6):
>   drm/amdgpu/display/mst: limit payload to be updated one by one
>   drm/amdgpu/display/mst: update mst_mgr relevant variable when long HPD
>   drm/drm_print: correct format problem
>   drm/display/dp_mst: Correct the kref of port.
>   drm/amdgpu/display/mst: adjust the naming of mst_port and port of
>     aconnector
>   drm/amdgpu/display/mst: adjust the logic in 2nd phase of updating
>     payload
>=20
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  4 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 48 +++++++++---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  4 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  2 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 16 ++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 76 +++++++++++++------
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 53 ++++++-------
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 14 +++-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |  4 +-
>  include/drm/drm_print.h                       |  2 +-
>  10 files changed, 143 insertions(+), 80 deletions(-)
>=20
> --
> 2.39.0
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

