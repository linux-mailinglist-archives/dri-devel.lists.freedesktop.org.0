Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24EFB594B5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE3A10E7B3;
	Tue, 16 Sep 2025 11:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="G7AJhiZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4018810E70E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:04:17 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4b5d5b1bfa3so47304721cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1758020656; x=1758625456;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wlsLL/pzWCNxVJt1ZqxUE1b/s1vUfyU9UMYEKy1Cqvk=;
 b=G7AJhiZc90HDIQ5nA6OhW48Lel69vKlIwDa8E0A511rreAAXvtJJoRhyyZt66UYGUK
 u8ywE0Wkuwv+4P/aPKTcWpZfgTdjyEY2+//mJ1getUNLH12DHHWQRfQBFyeUD6UT8vA4
 dyv4yDxTzaBhgzPR/Do/gyrYMGjItTEJoCtgeaFJoy2FVRKaJdTRnVaGuFhE30O1jb8n
 TsjePuanB8qmFntCoeFoSjXv91dP+pDgvqJRHcPOMQFyZKrekptY4wrhRYocHKwtGgK6
 Onw1L48qLNqjSkpstN11ci9ZaokcIEkMmDIqsFJoM3w71d8SF+WqTsEMl5hUAtSMbvfo
 396A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758020656; x=1758625456;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wlsLL/pzWCNxVJt1ZqxUE1b/s1vUfyU9UMYEKy1Cqvk=;
 b=KRVxQtmblSQGvKZBG+EcCTsfBnyHSRQ4/2+Uw+/+HDrZRwpfGe0pUBh7ksYUuwhKU1
 MFfeizWUvQjOLvl5spq8llPi/bHbsGM1aXXUt8lc31EfuLIwiwNncVKGrHEqV1IZohfA
 ipHM3hvyAC20YLCm7ME3vHJubi/8rnYn/lWj85s3Yi0GVr4Rn1RhSAV0+UDGe9SdnXjK
 v716bleWePo9pldOWuycFO9VxhskWY6k9ZPKIN2KuY6W+HForxuC/dEl/bDJnf8Ccs95
 8iepG8tNVB8CnleutbnjH7JjS83Zd2oNU8qCwAluMXq4Q3l3L7fU/gqrYfp9fRnVJX0O
 ze4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxaERJZGc5wNpSJBKoQxd2yZnvuarHm1mJHu+1OeUj3ygzgKkg2ZPPF1SVNIp9iWyHHR5GHnEErgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyATWJ/+2LBSp8dcAXeF6Tro/wJAoWAcO/A4GzphXGJ9gRlbaUP
 vMhmXn3gnjlCzAqB/F3n1bo3YKDxd3e3VLC6DNpqau+gHsAxLZZXUlpaY9wH9Ahosdx2c9dtjra
 tTXbxfFNHULmxyy70SUApnhUmG6DFEjN3MZGeP5zq/f3vbZocVzvjpDGxrg==
X-Gm-Gg: ASbGncsFb+QpI9DaIJS30oufnykMIFxjLILKhnVI/leNFfJVBvpStsEdBf5P05Kr96c
 shtT1ZvtnT7rO8uTnm2QXqQ2Wx3nZGEiiZk0tlfKTJEFhRsDBridJ7VLQKyLXXze+J8n0ca0rJU
 9JPlZU15GoBymaFgvJn++VBoHoAG5aYnd390MSZoL013XZIbMw/5egJszLk0iahuWM2Z6ByHkKx
 RxVRZ3Wy8aO3WhFLWNuvkJWwj7jv4JbljlYkcDqPw==
X-Google-Smtp-Source: AGHT+IF3vC0iMhOhwd5t5isOiIsxFWj5ZmMLunS3JGCxn4/IkmB4CaRHBCSMbUh6fLa6xTrbnEyqKLZvqJzRvV+3TB0=
X-Received: by 2002:a05:622a:1211:b0:4b7:7bf5:88b4 with SMTP id
 d75a77b69052e-4b77d03bb60mr204855551cf.54.1758020656001; Tue, 16 Sep 2025
 04:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
 <aMMDxIWN9TadgVyw@xpredator>
 <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
 <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
 <vnvjpp6makkcwxzcu3ifa767o2u7mi65rvgcwh4725smguej73@oziputg7p252>
In-Reply-To: <vnvjpp6makkcwxzcu3ifa767o2u7mi65rvgcwh4725smguej73@oziputg7p252>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 16 Sep 2025 12:04:04 +0100
X-Gm-Features: AS18NWAofNAZ8yfJSzWlmuLvFkCf16BTD0NYO_OaWPOXXSUIsQE7PA2ff_XqkwA
Message-ID: <CAPj87rN3bwyhbhMRhb1vj__L0DuRgPtVDux9MPGe6QMxAqeO9g@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org, 
 wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com, 
 mripard@kernel.org, daniel.stone@collabora.com, jani.nikula@linux.intel.com, 
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com, 
 christian.koenig@amd.com, derek.foreman@collabora.com
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

On Mon, 15 Sept 2025 at 11:46, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Mon, Sep 15, 2025 at 12:33:08PM +0200, Daniel Stone wrote:
> > But not 'now', because that's been happening for years. And not 'no
> > practical reason', because in order to support features the kernel has
> > no involvement in (colour management and HDR as a large part), you
> > need to see the full EDID.
>
> As I wrote, I completely agree regarding CM and HDR. From my POV the YUV
> part isn't that complicated. I might be wrong though.

It's not super complicated if you just want to get a splash screen up,
and you're willing to be conservative about the way in which you do it
to get _something_ up on screen. Or if you're on a laptop so you'd
rather not have your HDMI clock smashed up to max all the time. But
yeah, as soon as you get to CM and HDR usecases, userspace really
wants to have both control and visibility here.

The cable usecase is a very real one - you want to use the most
conservative setting possible to make sure you get _something_ on
screen. But then the CM usecase is a very real one too - you want to
get the best image possible on screen rather than destroying accuracy,
even at the cost of the dreaded 'Can you see this now you've changed
your display settings? [Y] [N, timeout 20sec]' dialog box.

So yeah, i'm not really seeing any way around giving userspace
explicit visibility and control here - the kernel can't 'just do the
right thing' in all cases, and creating new uAPI to abstract EDID
seems the wrong direction as a) there's already a perfectly good uAPI
for EDID, and b) it means the kernel has to do a lot of complex
interpretation and transformation-of-representation of information it
won't even do anything with.

Cheers,
Daniel
