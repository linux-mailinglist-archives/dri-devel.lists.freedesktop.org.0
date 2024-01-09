Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D05B8290C4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 00:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F28E10E526;
	Tue,  9 Jan 2024 23:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F86610E526
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 23:22:14 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5e7f0bf46a2so32061397b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 15:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1704842534; x=1705447334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ebXuRtZ+jV+LA1Jw2fSqPglODs+5bJfr1352MU2Bcvc=;
 b=buezkh/sz/8UH/j9wzjq8v0q2nK84OMpbU13PfWDxchWFp79gdjJ8wrcWFUkSCpptR
 0GmyN8gMxX0H8cnmf8Nzrzx+Xtr8Q0WP86C+VybnL4u2S2LHDoFbfrMteGxMnFbtHvu+
 JdxgtyZ1pHq7hevYQYba2p3yqQ5H3BLCDGmhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704842534; x=1705447334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ebXuRtZ+jV+LA1Jw2fSqPglODs+5bJfr1352MU2Bcvc=;
 b=b/5PQlQd7NqVQL79VdXrTMFUSd7NvHeg3h6E5bPVzGmb8FN5ziAi7Cbav9cywSYA7D
 xxchgV0zitZRLzgeKVUfDK5KJ4xyCaRWEO2DLsN1GQo3TeRcosENwetMzswfqm4udF9p
 asCW9eofIBU7c3beZmNy6cUcKcw6UufPweGjs5qska4kgmGjy+/SbTwwKEbst5aNDsP2
 k3Zl0qYjaBR486vJdXD6pQUMJKAs1k6M3ITHA9NMCPZRQ2A+w+QxKSYmf355N05Ua8HI
 yNXjqeiqirch+FpQTbBnZhABcPUl8cw45PjffqlfcfMwnCa+tz1TahJj3VV9BnkchVnM
 ud3w==
X-Gm-Message-State: AOJu0Yw2JwYx4euS+UzWUeo5Ri6WfWfycc6IoL3qKLJmgj+OIPpOQWJL
 hNQb3CHVxdApC8ELsFzUP5itR73MXvtZSTCNl3RqE1DVEwj34Q==
X-Google-Smtp-Source: AGHT+IE8JDGH9ecjWUCMBMUouMOhuyEPG+0LSA+8kz0oPtVDBlLstNCfdQ5skELRjOnAGKeDWrBS6QE4QfdwIuqGTVo=
X-Received: by 2002:a81:4857:0:b0:5ee:1ca0:b7ef with SMTP id
 v84-20020a814857000000b005ee1ca0b7efmr258078ywa.42.1704842533828; Tue, 09 Jan
 2024 15:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-3-andri@yngvason.is>
 <CAPj87rNan8B5urDFkmD_Vti4to6p3NmvXYsTFQTNg-Ue2ieDug@mail.gmail.com>
 <CAFNQBQwiqqSRqzXAnC035UWCGF3=GGFR5SpDd=biPTOEA+cWbQ@mail.gmail.com>
In-Reply-To: <CAFNQBQwiqqSRqzXAnC035UWCGF3=GGFR5SpDd=biPTOEA+cWbQ@mail.gmail.com>
From: Andri Yngvason <andri@yngvason.is>
Date: Tue, 9 Jan 2024 23:21:38 +0000
Message-ID: <CAFNQBQxM3dxdWRRY28jyXi4PZbgh7V+L7L6W1HQn40PwUGPNaA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/uAPI: Add "active color format" drm property as
 feedback for userspace
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Please excuse my misconfigured email client. HTML was accidentally
enabled in my previous messages, so I'll re-send it for the benefit of
mailing lists.

=C3=BEri., 9. jan. 2024 kl. 22:32 skrifa=C3=B0i Daniel Stone <daniel@fooish=
bar.org>:
>
> On Tue, 9 Jan 2024 at 18:12, Andri Yngvason <andri@yngvason.is> wrote:
> > + * active color format:
> > + *     This read-only property tells userspace the color format actual=
ly used
> > + *     by the hardware display engine "on the cable" on a connector. T=
he chosen
> > + *     value depends on hardware capabilities, both display engine and
> > + *     connected monitor. Drivers shall use
> > + *     drm_connector_attach_active_color_format_property() to install =
this
> > + *     property. Possible values are "not applicable", "rgb", "ycbcr44=
4",
> > + *     "ycbcr422", and "ycbcr420".
>
> How does userspace determine what's happened without polling? Will it
> only change after an `ALLOW_MODESET` commit, and be guaranteed to be
> updated after the commit has completed and the event being sent?
> Should it send a HOTPLUG event? Other?

Userspace does not determine what's happened without polling. The
purpose of this property is not for programmatic verification that the
preferred property was applied. It is my understanding that it's
mostly intended for debugging purposes. It should only change as a
consequence of modesetting, although I didn't actually look into what
happens if you set the "preferred color format" outside of a modeset.

The way I've implemented things in sway, calling the
"preferred_signal_format" command triggers a modeset with the
"preferred color format" set and calling "get_outputs", immediately
queries the "actual color format" and displays it.

Regards,
Andri
