Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA581A99094
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 17:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E453410E6DE;
	Wed, 23 Apr 2025 15:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q+tZqSog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ADE10E6E2;
 Wed, 23 Apr 2025 15:21:30 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2ff53b26af2so912107a91.0; 
 Wed, 23 Apr 2025 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745421690; x=1746026490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmyi5vZZ7mGUn2QC3T8ka63Rf5qEN3cGUQLOCWVEt1U=;
 b=Q+tZqSogVsPF1MxV0rQew5K+81EQabHmkjnweNJpzX4p10tDdAGmUbARUHRag/tL+W
 z6ubh0+ZarMATyOIe/9yqRn3/sy5nyKnlMPm76x4JEzZ8OAQ46SnM1eB2jrkmQHybRGc
 5BvMTBLUVuDiCUjZVRaCHjCH8sD1Imo7sPIzimze8Fg9cFa9iKjqNvUyUWv4SLA/jpCy
 i7flIYKl9tiKbRG5647M6KrZOvVM6jSc21SaOXwkpR4RoxktBmKJby6fhNTkbN4tPAEC
 1SY35N2DJNWDKLS4/t5AAyLOS+/FoKnz6QpVl3/qP25s5LTnERsaUZ6Qo4CFi3CKrThF
 LRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745421690; x=1746026490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fmyi5vZZ7mGUn2QC3T8ka63Rf5qEN3cGUQLOCWVEt1U=;
 b=lG8a/9c7v9WLsytc0FS6rgikNhs4NI4neHG1ceLPHgPQ6DGEczxO+EYdl8ML5sH66w
 IdRxljbhFUrtbFnvpexLB2N/Uiv2KeEjgHRwxZCWWWW136w0En2dqAAb02RhkP9ZGaBm
 NoTtuSvkp+g/1r4zqtJbAPxX64ghtSN/tcy5USx+beevYJEsTNudoUe0SVyXN+8HFDt6
 Jb3MAeuFF+pfv8HLyq5sbo0yWmG0h05LSxiaWyZgap3D8ErLyLv0+h+XDtGcnCK/pK0Y
 gJSfmsBtxDCPNnmx2n0zZVC5ACdc4zaHCQf7C8EXerbny+nZdfltHccPwfWCPA+rSVC1
 6puA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+0OwQW1b5eKAV9/h2eXR+ITym+CMZpW0DFyitzYopwzI/eJvfzCZKkkbFhSAhU0GguKW4IXRlbQI9@lists.freedesktop.org,
 AJvYcCWCa6sYSA79/pHIH7ZUhz6T6/iQ1rZNMGliL5bBKo/k1VN8GGS9Ro7hIoTdskkzjZvzJFwlIwefCiE=@lists.freedesktop.org,
 AJvYcCXA3TVqpsPmo9v5yeGU5s0XxABlSJLiL5WpR8e26a/tkL5l7q5yoweCNX1DWpvQpaGMke2RTCQTcRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbYb36HQolXS7n0BlyfJTnZ6GdB7GqhC1vEEaxOFCVQjWXK9VA
 Rg4kmm01r/M1kTuo+plxluQrqKz2C26qsHiNiy5oPFSnqxX1o79t/d4D/d0T1dtVkTt1ciaI0Pl
 NSNWElMF6KpfhhWqRWuctQ6ZlwK8=
X-Gm-Gg: ASbGncs4lJlC+TdFYzkmLPuW6L5oAM7TrwXrcErvqBzoi38vpZU1/6o4E/pNweA8yuq
 4qsBfG1fc/7ns1ZXC6lps1a00viYaNTb3Z2JYBUZgmSMF3IXkL+h2VjV3yV4BxZ1GdcqwY79lo9
 JIlS17T0JMWkxHdG+DZX+mEw==
X-Google-Smtp-Source: AGHT+IF8AjqdfMjic0pSLtgVDlsQvTB5k11mnthsWR/JGmuDXps66QWl4LK60Wb4UuTG6xr/3hPGpniN7EwidLSVCg0=
X-Received: by 2002:a17:90b:4d05:b0:306:e75e:dbc7 with SMTP id
 98e67ed59e1d1-309debc7ce6mr2004009a91.0.1745421689972; Wed, 23 Apr 2025
 08:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
 <SJ1PR11MB6129BDF34CF14847EEE77168B9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6129BDF34CF14847EEE77168B9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Apr 2025 11:21:18 -0400
X-Gm-Features: ATxdqUHW08BKqAI3d2gZcamBlcwWcvdH_ZBpx1HYv8qjGY0-e5DhpcLcGhwhjsU
Message-ID: <CADnq5_P3_usd9RDdLfjshz-o+nzkVSBrHmrqRUQThtX4X3jP9g@mail.gmail.com>
Subject: Re: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
 async flips
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 "Syrjala, Ville" <ville.syrjala@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 "Kumar, Naveen1" <naveen1.kumar@intel.com>
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

+ Harry and Leo

On Wed, Apr 16, 2025 at 2:33=E2=80=AFAM Borah, Chaitanya Kumar
<chaitanya.kumar.borah@intel.com> wrote:
>
> Hello Alexander,
>
> > -----Original Message-----
> > From: Murthy, Arun R <arun.r.murthy@intel.com>
> > Sent: Monday, April 7, 2025 11:14 AM
> > To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; i=
ntel-
> > xe@lists.freedesktop.org
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>; Borah, Chaitanya Kumar
> > <chaitanya.kumar.borah@intel.com>; Syrjala, Ville <ville.syrjala@intel.=
com>;
> > Murthy, Arun R <arun.r.murthy@intel.com>; Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com>; Kumar, Naveen1
> > <naveen1.kumar@intel.com>
> > Subject: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
> > async flips
> >
> > All of the formats/modifiers supported by the plane during synchronous =
flips
> > are nor supported by asynchronous flips. The formats/modifiers exposed =
to
> > user by IN_FORMATS exposes all formats/modifiers supported by plane and
> > this list varies for async flips. If the async flip supported formats/m=
odifiers are
> > exposed to the user, user based on this list can take decision to proce=
ed or
> > not and avoid flip failures during async flips.
> > Discussion around this can be located @
> > https://gitlab.freedesktop.org/mesa/mesa/-
> > /merge_requests/29618#note_2487123
> > Mutter implementation for IN_FORMARTS_ASYNC under review @
> > https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
> > Xorg/modesetting patch
> > https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1816
> >
>
> We have added a new drm plane property to expose the format modifier pair=
s supported by a plane for async flip.
> Can you please let us know if this implementation looks good to you? If s=
o, kindly provide an Ack.
>
> IGT implementation: https://patchwork.freedesktop.org/series/146853/

Seems reasonable to me, but I'm not as involved in the display side
anymore.  I'd defer to Harry and Leo.  @Wentland, Harry, @Leo
(Sunpeng) Li can you take a look?

Thanks,

Alex

>
> Regards
>
> Chaitanya
