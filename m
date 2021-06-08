Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2421E39FD21
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B396E203;
	Tue,  8 Jun 2021 17:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E48E6E1F7;
 Tue,  8 Jun 2021 17:06:03 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id x2so10516599qvo.8;
 Tue, 08 Jun 2021 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EoJCPJeppcrfpor3LbZM2DRcMtWosmdzMRz51+rh2XU=;
 b=GvUxCEN12JOoAjOqV929Kwlx26hCldND/Ini+4Dz175Gx9RKJu3J8XZgpFFGRhxP8E
 rplbjRbxfGymXfXRxpxQgI7RYoRVA+OjDKYg/OZFVUse474g0wIa+Apg9xPa3UmUcVWr
 dW2jygpb8pHSxZSHr0c5gelAe8LpDTyH5WKpweRdOhmXQ9okYajkEXSTVaxIzEciwl1I
 byWbAXxpDUUf0ytSKnPyvuyKj833oX35tuTt+mdZ3XVFZV+Q3lNIxvhWob9IW2jNqUSL
 3Hbs0Au78YhzspCYudHIMEjvYy+qtnovytgRxv88PjROyWnhLECi54fI4pZHNwazCeyH
 qGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EoJCPJeppcrfpor3LbZM2DRcMtWosmdzMRz51+rh2XU=;
 b=IfwWmYiX3yZk/HyfiGkr55nuVvuCgPLOTHP3zIAytSnT2Q4NWiEzxy5MSKfIhEqoyd
 6Rn4MVissTrTLmJJyHwuFKX+JVZV9TzfUGlCBeuBhUnFUw+/jWmtaRbt6fLqNqL3twPr
 ztpCHqOrvIAaX8VYZgAXb/7VWJaDRgYFOEbQ9pOb32eKbYiXU9PTEXgs2b0RT6XNEWZP
 9IgV5wCIcmayN9HoM3Adkh36tSmxvaiWHtBx5SfOeS+7Ov6i0UlcfAvNMu337xmkALmp
 EG20MWUxmAHEyICVBNY6o82h1pf5x5idgU3OCSDn7QsHFQhL5mDuXEI/ONAe1zT6u90x
 H+WQ==
X-Gm-Message-State: AOAM531m+YS5tmun2sejA58kiV1P2w/jPwGUuIc1rZQ+Cg5hErKBNwxp
 GZpii0/sgFjAZike57Nj0spqtUbhxIQl1E9lV7U=
X-Google-Smtp-Source: ABdhPJzcJvnJcxEeb45p7x85e3PoV0Ay/dRb9l1DCuS3u68nixW2N79wTOlSZIbbyrRvnpedbfQA/7UjC1XwWDhFX1o=
X-Received: by 2002:ad4:5fc7:: with SMTP id jq7mr1072641qvb.41.1623171962296; 
 Tue, 08 Jun 2021 10:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
 <20210608092846.64198-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210608092846.64198-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 8 Jun 2021 18:05:35 +0100
Message-ID: <CAM0jSHOp0AitoARY0HNHg6MXyJ+Ryg6-0+1VxMMYkBDk7vOP1g@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/i915: Reference objects on the ww object list
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Jun 2021 at 10:29, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Since the ww transaction endpoint easily end up far out-of-scope of
> the objects on the ww object list, particularly for contending lock
> objects, make sure we reference objects on the list so they don't
> disappear under us.
>
> This comes with a performance penalty so it's been debated whether this
> is really needed. But I think this is motivated by the fact that locking
> is typically difficult to get right, and whatever we can do to make it
> simpler for developers moving forward should be done, unless the
> performance impact is far too high.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
