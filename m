Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0069B92E9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 15:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642D610E145;
	Fri,  1 Nov 2024 14:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="XR35uaDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2988410E145
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 14:13:20 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-37d4b0943c7so1171175f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1730470398; x=1731075198;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GRWiGGC12RSrQtSfgbhmzwhlJwATydSE7SKHKCUBjJo=;
 b=XR35uaDgm4S/rFoC9HeSVARCGqghaUT5Cm/SQ2ivOsf6Kg4v4wkVurp4R4DCKq48XR
 4vYPYxWedhCD+xImGtkrYX/lBKy/5Zwuwyn3R0bK43LFXvZeetoiIVl9RvtIHReV+SYC
 n00dikNR9HDmkaBPKSo3VHGhh/VSk/U7Hle9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730470398; x=1731075198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GRWiGGC12RSrQtSfgbhmzwhlJwATydSE7SKHKCUBjJo=;
 b=wIX0MRZK+j/sgQzUh7cJezt4tvJWeb1DYRo3Zrtvs7odq1elPJxHYUZJ3wiFqVsUKG
 a89AX/UuBWDJdGdqiDmdsWekDtMubtlf0zed0+WaYtMhUsNKaO4vzM87kHAwmfrX8w0V
 5nwM+UrNqr/T+aHvMsdlXcRgsirdE/xj5oZi/7XUayuwVBuZjnbhpEWTp7+TDFbzC6S7
 9NcGIf8B6/fET+7zHJXMhi+pF17ph8IE+NujBrXhNZCgtSKD6NLEC60Ri1WvOf9aj3iv
 +fhhDof3JlnheiGimEVZ+IyjE39YW7oJNjJ+T8N7ZdBFKddrrbiNMgf756e8JbROZD46
 voDA==
X-Gm-Message-State: AOJu0YwmiHfjeFkH+q1H5fyswhOuLAozHx+vpSQdoqv1rczGuWdoVI64
 8aJ+vPUWzInAyeehmflfWd4xfDjaVrBawabod4eKE7Tr1Ykqa1CSGfzOrlK2P106u/8Qg3FTyxh
 a8JhutpetF52MVxUH4bL43X5X5PkOQlF2kGD0
X-Google-Smtp-Source: AGHT+IHZEiFYtsQH+cgdKqZPJd+6OQjNSTY7jM1E4RN/dcllo/GDunH4hto5UnCzmevtD78Y8tsLkxW5tC1Yyz5LTjE=
X-Received: by 2002:a5d:63cf:0:b0:37c:d57d:71cd with SMTP id
 ffacd0b85a97d-380611ff862mr16501877f8f.52.1730470398369; Fri, 01 Nov 2024
 07:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240909171228.148383-1-hamza.mahfooz@amd.com>
In-Reply-To: <20240909171228.148383-1-hamza.mahfooz@amd.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Fri, 1 Nov 2024 09:13:08 -0500
Message-ID: <CAO6MGtg-+btwUk9ZkJj7Zreyk_VfyDtsc_4k05rCv+vFJRSJVQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/edid: add CTA Video Format Data Block support
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Karol Herbst <kherbst@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'd like to use the OVT modes for vmwgfx. Can you export the main OVT
function so it matches the CVT one? Something like this:

struct drm_display_mode *drm_ovt_mode(struct drm_device *dev, int rid,
int vrefresh);

On Mon, Sep 9, 2024 at 12:17=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
>
> +
> +/* OVT Algorthim as specified in CTA-861-I */
> +static struct drm_display_mode *
> +calculate_ovt_mode(struct drm_connector *connector, const struct cta_rid=
 *rid,
> +                  u16 vrate)

Also all instances of CEA should probably be replaced with CTA, not
necessarily in this series, but they changed their name ~10 years ago.

Ian,
