Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786CF7E4BD4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 23:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A9310E0F3;
	Tue,  7 Nov 2023 22:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C852910E0F3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 22:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699396562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6tHKEqOiRHDQZZID2lEUPfOJKt/a/zwLoiXh+R3qUY=;
 b=GZzoWqa36xe+L2XWZd9soWInX9kaZ8p/eF3IeVgzyMFy6ShhrwnQ8bXC9xAWZ5tJg4S8yL
 Qio/SS9R+LKVNwxuQ9Pdg5KaDJoj/smTsoT+bKH1Zsrkas/Hc95l8L5GFcEJ2WqtqtPQYe
 GwbNV3/heYwHHVop2D62ojoASAcdHLU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-kIobGUTJN0yJsRoLiY6g4A-1; Tue, 07 Nov 2023 17:36:00 -0500
X-MC-Unique: kIobGUTJN0yJsRoLiY6g4A-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-41cb47713f7so66953021cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 14:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699396560; x=1700001360;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=imbkFy/HKzeGBp0rOG6gITkD4/4Qvx+Xf9l2owiSrCg=;
 b=erNM+jiei5CR0uziqsTdJEb2uG15AWQz3vqSRrCy9qpCbxeTi1Hp7vvNWTtUrzMsgX
 dowLayclER0cExorSEYLqqLFM6BCXnJF5pi2H52gdjrGHWQbb7JkSC2I9JVdKSOzHK34
 HmZ4hXg5JL0b9SdMn0dnMoVyI9Hgmo/W066rtv26WA9ZIhmCg0feDEVoEQKrsE7O0sJ9
 HfPRUm+CkVoHWogeNoRlsbH+fZnHWQgrsU8pfbphjkYFJh16OQwSGJkSRQqFCSxdf2CO
 FMsOnGkqpBSL0UW39763zXy9kKEVS0RDTIlyNkNeBMe8hRhisFodZuk/5WvY2QP6Oq8d
 EXnQ==
X-Gm-Message-State: AOJu0YxIUxW9SQjEeeukjKqP+ACBJQZDrz5r+MwKKn2egqCrbV2nvzPR
 uZ1q0XUSTSTfn4bA0ngj94c4oeIO0Zlp/PLga5ic7FNf4KFkFa8OR4D67G0Mqg2+VvgWEOjZk7L
 TSyt1PkTrvN2NeYaRGHkRMkJAiDaU
X-Received: by 2002:a05:622a:155:b0:412:f12:2398 with SMTP id
 v21-20020a05622a015500b004120f122398mr299931qtw.31.1699396560145; 
 Tue, 07 Nov 2023 14:36:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQ/EDjlmnhzm9TsLStE49AxzehX/ObB1SYNJQhsMLN3DCCtc+50dHKswgAgXaZN1VOz9h34A==
X-Received: by 2002:a05:622a:155:b0:412:f12:2398 with SMTP id
 v21-20020a05622a015500b004120f122398mr299918qtw.31.1699396559873; 
 Tue, 07 Nov 2023 14:35:59 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 n5-20020ac86745000000b0041977932fc6sm151190qtp.18.2023.11.07.14.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 14:35:59 -0800 (PST)
Message-ID: <8171b920311ed07879bbeb726f817ef9d18fc008.camel@redhat.com>
Subject: Re: [PATCH v4 07/30] drm/dp: Add DP_HBLANK_EXPANSION_CAPABLE and
 DSC_PASSTHROUGH_EN DPCD flags
From: Lyude Paul <lyude@redhat.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 07 Nov 2023 17:35:58 -0500
In-Reply-To: <20231030155843.2251023-8-imre.deak@intel.com>
References: <20231030155843.2251023-1-imre.deak@intel.com>
 <20231030155843.2251023-8-imre.deak@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2023-10-30 at 17:58 +0200, Imre Deak wrote:
> Add the DPCD flag to enable DSC passthrough in a last branch device,
> used in a follow-up i915 patch.
>=20
> Also add a flag to detect HBLANK expansion support in a branch device,
> used by a workaround in a follow-up i915 patch.
>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  include/drm/display/drm_dp.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index e69cece404b3c..763d45a612f35 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -148,6 +148,7 @@
>  #define DP_RECEIVE_PORT_0_CAP_0=09=09    0x008
>  # define DP_LOCAL_EDID_PRESENT=09=09    (1 << 1)
>  # define DP_ASSOCIATED_TO_PRECEDING_PORT    (1 << 2)
> +# define DP_HBLANK_EXPANSION_CAPABLE        (1 << 3)
> =20
>  #define DP_RECEIVE_PORT_0_BUFFER_SIZE=09    0x009
> =20
> @@ -699,6 +700,7 @@
> =20
>  #define DP_DSC_ENABLE                       0x160   /* DP 1.4 */
>  # define DP_DECOMPRESSION_EN                (1 << 0)
> +# define DP_DSC_PASSTHROUGH_EN=09=09    (1 << 1)
>  #define DP_DSC_CONFIGURATION=09=09=09=090x161=09/* DP 2.0 */
> =20
>  #define DP_PSR_EN_CFG=09=09=09=090x170   /* XXX 1.2? */

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

