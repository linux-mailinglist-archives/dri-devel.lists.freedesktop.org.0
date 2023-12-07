Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A87780855C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71CB10E1E4;
	Thu,  7 Dec 2023 10:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0296310E1E4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 10:24:49 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5d3644ca426so5309717b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 02:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701944689; x=1702549489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygq/2rNLz0TM+BQA4kbzAPsTIz5KP177CFmxxC3sVe8=;
 b=i9fOM8dXAyXzgRm4iHfBOLDoX/OuErLWt98LcVNcfbJGKKZ56Qmxci83PMicM4eBTK
 yoCSzrr/lmcEAF4F3FTLV74FzLpXgbo0faY9uJSVoOcAAIsFy3pe/1ncaMo/QJV1Wfns
 1WSpMvOCKSLPLWV/B+ptI2CUqrdm4PjiLs1vO7x8zzu4qtgF+pmihbh4YtHZJaRrgL6g
 h68hrZqcRINYP5PufCWeRfLUH+q9kWSvDgG59syrpD/W6keC4o0g/VXqMp/ZpyYJyHKA
 Sx11tsBMyDuqfswnVRKcUjdq3EmJdky79O7Y4n5UNY16rLrTLyVp4WaDyeRjZY9Or7Oz
 NVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701944689; x=1702549489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ygq/2rNLz0TM+BQA4kbzAPsTIz5KP177CFmxxC3sVe8=;
 b=aYgaJf1FEYbxavsZTDphA0KkOEgk8BkbRMviS6sUqD66O/5dsZpOOB1C4Y0C4/f4wo
 W3f03YhouNTqmP2tstEgOS/JcQtAKwLOtJTs9GNnBDv7gK8ie0dPBRs/OjZb50wa3ykx
 0Tri02U9EB6Es63fmOFUvI1LQwViaL6MR/su1TjYpMsII6NBrz6TAvnx1I2r3orP7oFn
 RIFFOrp6MtBZhBHVK8Vc0Wor9U4qj5FmmEsHOfMW+FilcgafTSQ/6pQDT6fbIHNUf4Ao
 5ywE9BJ7cel+oxxL6Cn94xKKxhHs1ZKbSjnCzK0L9nwaoBZ/AcgII66ll2xyyMGlcHNf
 2IrA==
X-Gm-Message-State: AOJu0Ywkms1c5nCvRsFHtV/Y54GZ6gmLSRZTYLZNyVDs5tK6ecskMev4
 yNudaqleyCUEUVDec5RQGDFSFx+qlLCWoSuY2zoGg/DsN0tFp+7q
X-Google-Smtp-Source: AGHT+IHoXDIwfdIo/NuhZl2SbeQcPQ0Ho9lEpXP93jrkQ8rALHlB5ofczxEUkbiGGDXh70KUWAjwC1/4Aner6m+8LA4=
X-Received: by 2002:a0d:ca82:0:b0:5d8:96c:68e7 with SMTP id
 m124-20020a0dca82000000b005d8096c68e7mr2459420ywd.45.1701944689132; Thu, 07
 Dec 2023 02:24:49 -0800 (PST)
MIME-Version: 1.0
References: <PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com>
In-Reply-To: <PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 11:24:59 +0100
Message-ID: <CACRpkdY2ZRQqvxfmVVg_MJeZvs=gOyRun6z=kfumJRCUsDv8vw@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix FD ownership check in drm_master_check_perm()
To: Lingkai Dong <Lingkai.Dong@arm.com>
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
Cc: nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 6, 2023 at 2:52=E2=80=AFPM Lingkai Dong <Lingkai.Dong@arm.com> =
wrote:

> The DRM subsystem keeps a record of the owner of a DRM device file
> descriptor using thread group ID (TGID) instead of process ID (PID), to
> ensures all threads within the same userspace process are considered the
> owner. However, the DRM master ownership check compares the current
> thread's PID against the record, so the thread is incorrectly considered =
to
> be not the FD owner if the PID is not equal to the TGID. This causes DRM
> ioctls to be denied master privileges, even if the same thread that opene=
d
> the FD performs an ioctl. Fix this by checking TGID.
>
> Fixes: 4230cea89cafb ("drm: Track clients by tgid and not tid")
> Signed-off-by: Lingkai Dong <lingkai.dong@arm.com>

Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
