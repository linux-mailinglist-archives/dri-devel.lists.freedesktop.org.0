Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD00B1AA5E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 23:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238F810E0F8;
	Mon,  4 Aug 2025 21:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="S8hcJMbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E297610E0F8;
 Mon,  4 Aug 2025 21:32:47 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 886AC33C4C8;
 Mon,  4 Aug 2025 22:32:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1754343165; bh=ri6Z3M8MrO5vhZyfkInL7BZL2j6omfZd348uMVjNNiY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S8hcJMbFOaIWEbtqS8vzP/rsu3Sgc9IHa4nT1AiATnEr+G8SKR8iI75OKkbLlq45a
 aP675LzQun0XSah6qnO08L2zp38G7ccApm7R2/g2sdb5gb7zWdbbHXS7uwqQytGxZY
 l3DbTWvWpuRXi/Soh3mP3+F0poBm/HY70vIcCpCboY4ygCKBzHuFaW/kYKZ8i/wco3
 /hSCbpi3sFSzMSLafGAkB3FVDZjHSERo/k9yytS0CMxBOlj6DcLeakkKV4m/IGQ6iv
 f28NuJKJXYfrfItYoLk4fM9q0d1sQ5O1asa1fkgXlnlA3An4ALp1D6Ur86fDjGSIsM
 vpD1xQxZT1lwQ==
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-af93bcaf678so415054266b.0; 
 Mon, 04 Aug 2025 14:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVRxispOTn1jK86Q3JJfq1ZpJqUxFeFv8xyg2eCdwHTy00TXD2yfVcqRwXV0LnpqBW02bCBmH0QeKwk@lists.freedesktop.org,
 AJvYcCXMVeMtRR4uNMs7Zg0pi1CmGQDMmsxZaMXu22QWNqJQ6cz+J4eEWyG9Onmes6BlQF9nCoQACjaa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOlJ09KJMbTk3aptLteDurCVhWYWunG8Rtu2ypwFZVa5xNFVwM
 GkytTS2jY+8iEocyX5JMYr3Qc9hiW9DSqsAMMK8WVwH3JORrVnxjucjypW2VgLgrFfhA/HorLZj
 soCswtV+3SHBvNiawsacpjfVb11HrOto=
X-Google-Smtp-Source: AGHT+IF/ky9b0+aGyvxmzBA/wi9xesdjpkTkAbyZWzdSGALTO9Liu72BxrfMri8mIqXSnpI9VP4SMmyolONLGdwUBvM=
X-Received: by 2002:a17:906:f59f:b0:ae3:6cc8:e426 with SMTP id
 a640c23a62f3a-af93ffc9053mr941711966b.9.1754343162353; Mon, 04 Aug 2025
 14:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250801131053.6730-1-xaver.hugl@kde.org>
 <ad9b68cc-4a33-406a-9512-ff5f5460bf99@intel.com>
In-Reply-To: <ad9b68cc-4a33-406a-9512-ff5f5460bf99@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Mon, 4 Aug 2025 23:32:31 +0200
X-Gmail-Original-Message-ID: <CAFZQkGwviMAshk5gSF0pDmkqbfZT=6FHCfNq6PWj8srNEXjX7w@mail.gmail.com>
X-Gm-Features: Ac12FXx3qnl-ZL78AY877KImUixgVXTZBRgwxLYn8JvgBzilUH_iYdJ6TeJ9kV4
Message-ID: <CAFZQkGwviMAshk5gSF0pDmkqbfZT=6FHCfNq6PWj8srNEXjX7w@mail.gmail.com>
Subject: Re: [PATCH v3] drm: don't run atomic_async_check for disabled planes
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, andrealmeid@igalia.com, chris@kode54.net, 
 naveen1.kumar@intel.com, ville.syrjala@linux.intel.com, mdaenzer@redhat.com,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 alexdeucher@gmail.com
Content-Type: text/plain; charset="UTF-8"
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

Am Mo., 4. Aug. 2025 um 11:54 Uhr schrieb Murthy, Arun R
<arun.r.murthy@intel.com>:
>
> On 01-08-2025 18:40, Xaver Hugl wrote:
> > It's entirely valid and correct for compositors to include disabled
> > planes in the atomic commit, and doing that should not prevent async
> > flips from working. To fix that, this commit moves the plane check
> > to after all the properties of the object have been set,
> I dont think this is required. Again the plane states will have to be
> fetched outside the set_prop()
>
> Alternate approach
> @@ -1091,8 +1091,16 @@ int drm_atomic_set_property(struct
> drm_atomic_state *state,
>
>                          /* ask the driver if this non-primary plane is
> supported */
>                          if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> -                               ret = -EINVAL;
> +                               /*
> +                                * continue if no change in prop on
> non-supported async planes as well
> +                                * or when disabling the plane
> +                                */
> +                               if (ret == 0 || (prop ==
> config->prop_fb_id && prop_value == 0))
This would allow disabling a plane in an async commit that was
previously enabled, not sure that should be allowed? Also, if the
property is fb_id, ret would be used uninitialized. But you're right,
this should be fixable with smaller changes. Probably best to keep it
minimal for the bugfix.

Looking more at this code, I also notice that it currently allows you
to change *any* property on overlay planes in an async flip, which
doesn't seem right.

> +  drm_dbg_atomic(prop->dev,
> + "[PLANE:%d:%s] continue async as there is no prop change\n",
> +                                                      obj->id,
> plane->name);
> +                               else
> +                                       ret = -EINVAL;
>
>                                  if (plane_funcs &&
> plane_funcs->atomic_async_check)
>
> Thanks and Regards,
> Arun R Murthy
