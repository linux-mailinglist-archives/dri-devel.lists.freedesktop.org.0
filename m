Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEDF86EFF3
	for <lists+dri-devel@lfdr.de>; Sat,  2 Mar 2024 10:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C13310F379;
	Sat,  2 Mar 2024 09:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ptDRobg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACCB10F379
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 09:56:01 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dcd7c526cc0so3068780276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Mar 2024 01:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709373360; x=1709978160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9pRw5IAibuwYd//Aywy30xBwnKrBGpwv66EMUr4hEnk=;
 b=ptDRobg3Ee98A8jTIFjKVLYvBKOp3DQ9ujFKDxQcOjraK54jDX5B24CN/8GQXvA6LV
 lPjWBgnMCZKIZ33cLp84uWR0jzkQugPVKOxSaVcyPiycMZ8XmBB+0HxmdfLDr0cTJbMN
 3sq/veU2yI2gK6yoJ2ZqWkkaj3wSSNRgrMnjXKkUVJIskbhXEaRdwisfplXOc2989my2
 KVE1De6FhycuSrPrbHhtXC+WTAPEAyGre9P4F0KdtevXlUaD2AN9Em6t1FofoyTjrk0O
 3qW6F+fD7SJtZMa43AlVNfLMbpikyHbkHK8OIFyQ879829C2uGaovYiYzdzqwJS0+ZKi
 TEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709373360; x=1709978160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9pRw5IAibuwYd//Aywy30xBwnKrBGpwv66EMUr4hEnk=;
 b=krxCnk5TnZEPM80UGx4kHLpm2Z/hrFXn7GMq8BwoGboS2Hg9EwTcOQi5XEtSwa1W+Q
 PMPGEDsZvwrCezShOi3+WrH0tf1F6xXKFNIc13JwELsOULvyl5JkJAzKP3twyHncZ7T4
 Mm18FgzevIs+Sj9uzXtyMM7D5JC3hHjND82CHeSkZi2ZpKeuyAv5/3X5EM+ghNvy43IS
 kotdqH5C62ELYbuKTCv1w13KDk6LjX2FgUawXi8oVgU+ZvftSAHo3MyR5n0OPQFnxEtq
 WrKbmaAC0ZXE4igdF+lv6m16cSBKgwgYSZN2O/KP4BP4juZurFTK8DP1ZnwjKWMKejj2
 I7Kw==
X-Gm-Message-State: AOJu0YxgJByrqYIlkjfLVerQYiLSgJzeYKRzHUxmtW3cPBtM/Uck6vox
 GdlTa9IlYmk/nnfQypY8IBOjpTb6cXI76CRpzTklagztJ5qvGnnkly2hmZ+0rfDk/Fqjki1gnnP
 wiz38lvupvSN7DygJblXu2/dc2IU147DWcvYlBQ==
X-Google-Smtp-Source: AGHT+IHgYHYzJFJEIdWZh5wwL/xNsSGLQRTNbC/J6YMtPhVhsuFI5VNNCGT51GKgRlbEBYk2Iz5kdNozf5KKidJVVxg=
X-Received: by 2002:a25:bb85:0:b0:dc6:de64:f74 with SMTP id
 y5-20020a25bb85000000b00dc6de640f74mr3291518ybg.9.1709373360094; Sat, 02 Mar
 2024 01:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20240301152243.1670573-1-imre.deak@intel.com>
In-Reply-To: <20240301152243.1670573-1-imre.deak@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 2 Mar 2024 12:55:48 +0300
Message-ID: <CAA8EJppk+gA0g3Wn-e4C0CKKYHLwtU1+euez4VBKhB-qrt54rw@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix output poll work for drm_kms_helper_poll=n
To: Imre Deak <imre.deak@intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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

On Fri, 1 Mar 2024 at 18:22, Imre Deak <imre.deak@intel.com> wrote:
>
> If drm_kms_helper_poll=3Dn the output poll work will only get scheduled
> from drm_helper_probe_single_connector_modes() to handle a delayed
> hotplug event. Since polling is disabled the work in this case should
> just call drm_kms_helper_hotplug_event() w/o detecting the state of
> connectors and rescheduling the work.
>
> After commit d33a54e3991d after a delayed hotplug event above the
> connectors did get re-detected in the poll work and the work got
> re-scheduled periodically (since poll_running is also false if
> drm_kms_helper_poll=3Dn), in effect ignoring the drm_kms_helper_poll=3Dn
> kernel param.
>
> Fix the above by calling only drm_kms_helper_hotplug_event() for a
> delayed hotplug event if drm_kms_helper_hotplug_event=3Dn, as was done
> before d33a54e3991d.
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reported-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Fixes: d33a54e3991d ("drm/probe_helper: sort out poll_running vs poll_ena=
bled")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

--=20
With best wishes
Dmitry
