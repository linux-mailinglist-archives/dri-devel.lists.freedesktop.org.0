Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80874761FE8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 19:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1613110E3E8;
	Tue, 25 Jul 2023 17:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B16010E3E8;
 Tue, 25 Jul 2023 17:14:56 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b9edef7993so4702470a34.2; 
 Tue, 25 Jul 2023 10:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690305295; x=1690910095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LlPyW1B+Nnb+iK3S68PwCHo32yw0TdvXi8oVQXAv0ic=;
 b=j65VVr23yiF5VnGY6kWS+6YzVVcPlItDDL7kFBCkVqJOPaA+nERASpDamyDM8d2zRv
 /FHGu07eaCxp4nMrrQ9bELtBDlEBc1GKay8ERxrhDXWjaKBkqC+KPndgp8Bo57gpoJdk
 qBRZwu9IxiMMcq2jNBzsMv7BxNgfpp0II+Mp4AKYwyfeM4djw5y3ZAQzBVk1xY8SMxNj
 vvEzg0U3L9D275VpFMcoQ1KHFyRcqilXGrnrPNSBSirySfVQkor+yDvZ9G7LG8pFrRIc
 4XZQGS+9LG7Uunr1m7ufQ72AR6rv0xbdW9ZSr+YsKQ3zQAtjKKRj580gy9FyVo0fNoae
 NVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690305295; x=1690910095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LlPyW1B+Nnb+iK3S68PwCHo32yw0TdvXi8oVQXAv0ic=;
 b=UvsRL/hzsrxk7NbSImhZyFBbrSfY0NArCqcgkIwXOTyctoBw0rNjKOyRyCDUKCQYkW
 ZpnFCVROk8mR+mz6Cvx+2gFTlbKMaWjkBOSiJitnmTUe+sua98lRL60EF86QaUmgBMRC
 7Hj9GnCTEtObn374HUHSLe24pgyuWbIDKSnxVl9CFS9c2W0BcjAp/RO1SYIJ8+gti9ti
 JTF/q1Y9980SJZ++6urcMcJU8cdRM8iMUuf5njBB+HctpmTIEh5/gTUYZ4IYTrbI1XpG
 Tn55gSuAbXHIsBF8O6eXgSF7KmlKdL2VS3UQrQN0KhmIq3fkAMX2hWv4m7SILbTgsy5c
 TLtQ==
X-Gm-Message-State: ABy/qLYFrqP7tAB/6O0BCEwLhptoqWPw/hNp+VhPty0VX5GliZc03cVp
 N9DkyQbbeBw6wnPjoh7czriXni0cgPpsBUza+sU=
X-Google-Smtp-Source: APBJJlHQoL+bV+I13AsdJoHS9f+/mt9mhCzycARA9DFPAA7VQgZNQgFCtlnutoP5ejmXKqukrVAx665/nX3TnHvVevk=
X-Received: by 2002:a05:6870:9a05:b0:1ba:1998:1d23 with SMTP id
 fo5-20020a0568709a0500b001ba19981d23mr15437466oab.35.1690305295510; Tue, 25
 Jul 2023 10:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230725130317.569535-1-yangyingliang@huawei.com>
In-Reply-To: <20230725130317.569535-1-yangyingliang@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Jul 2023 13:14:44 -0400
Message-ID: <CADnq5_MvMceUiZ+_7pqMk-U+GmxZPZPzc6iCNkXnb5Wv=9WfcA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix missing unlock in
 dm_handle_mst_sideband_msg_ready_event()
To: Yang Yingliang <yangyingliang@huawei.com>
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
Cc: haoping.liu@amd.com, daniel.wheeler@amd.com,
 dri-devel@lists.freedesktop.org, jerry.zuo@amd.com,
 amd-gfx@lists.freedesktop.org, wayne.lin@amd.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already applied the fix for this from Dan.

Thanks!

Alex

On Tue, Jul 25, 2023 at 9:21=E2=80=AFAM Yang Yingliang <yangyingliang@huawe=
i.com> wrote:
>
> Add missing mutex_unlock() in error path in
> dm_handle_mst_sideband_msg_ready_event().
>
> Fixes: 4f6d9e38c4d2 ("drm/amd/display: Add polling method to handle MST r=
eply packet")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 1abdec14344e..cddb91cf3dde 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -707,6 +707,7 @@ void dm_handle_mst_sideband_msg_ready_event(
>
>                         if (retry =3D=3D 3) {
>                                 DRM_ERROR("Failed to ack MST event.\n");
> +                               mutex_unlock(&aconnector->handle_mst_msg_=
ready);
>                                 return;
>                         }
>
> --
> 2.25.1
>
