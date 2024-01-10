Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A574C8297CC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D34B10E5BD;
	Wed, 10 Jan 2024 10:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE55410E596
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:44:08 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55760f84177so690542a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 02:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704883447; x=1705488247; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UMDg8vYs5fytU0eXd7i9MvEuOqrlrSDfuGIjAzp5aO8=;
 b=HO6yBTXoYJ1aYySLjxuEV0M1zQ15IwQEHWIno4iy3e2LEaM9Lb3odb9k7nME7uYHSZ
 ajuK3l8Mpsp/dr7/JYi28JOzJ/KUbBMNNUrUepblAUPD/9P6tPt7RGVBMBnHBkqqFff/
 v9vLBe01r5Ac+890uU2UXJR3RPy3UOq43Y5ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704883447; x=1705488247;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UMDg8vYs5fytU0eXd7i9MvEuOqrlrSDfuGIjAzp5aO8=;
 b=lvWM54fH+emSpGuOvKZxDA3J5qc9yyMpG0psKiKdlORbMYTVZy+Hat8N4gyskwz52E
 RQcN4PEypSx02YjPKiCcEDs8mqbG/8vRR0WituYfsO6T8nsXpYOqdrCDv/XLrSbZduvr
 GdBkn5/eOMv2DB3AJv1Wq1h9zuCu3I2jNTK2ZwBVRx+4vc6PUY2/4rRWBNGpV4HZjwLE
 HIBQY4XTe2EtUILyV0TzcA7iXU3XIkjPAPJSW/x9dRi7hiZ7wkE+pCAMjFLEmiQDrIVy
 nzSuvyJh2xIdHCdH2i0SrJfWRBSBfnmjTKd8yYiIqdIaes0buF7Rg3OxSiPo+Fw0djH3
 4TGA==
X-Gm-Message-State: AOJu0Yz54Ey6IAUDurNrBcrsXaJDS0M56RN+cjH7R7jdKyOIZyi4moj8
 FzjV2+tp3gRIX4wiq8u86QEsDY5rbakOAQ==
X-Google-Smtp-Source: AGHT+IGq5gfRJlxZlKGWvfar8Z1t60a4l9NJUielIcSGPeGv8HnSSId42vEbByEzK0cy5OcGqHFXHg==
X-Received: by 2002:a50:aacb:0:b0:557:1b89:4f01 with SMTP id
 r11-20020a50aacb000000b005571b894f01mr910339edc.2.1704883447330; 
 Wed, 10 Jan 2024 02:44:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p31-20020a056402501f00b005585049ddc9sm569130eda.45.2024.01.10.02.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 02:44:06 -0800 (PST)
Date: Wed, 10 Jan 2024 11:44:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andri Yngvason <andri@yngvason.is>
Subject: Re: [PATCH 2/7] drm/uAPI: Add "active color format" drm property as
 feedback for userspace
Message-ID: <ZZ509L_kmVC4IUBW@phenom.ffwll.local>
Mail-Followup-To: Andri Yngvason <andri@yngvason.is>,
 Daniel Stone <daniel@fooishbar.org>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>,
 Werner Sembach <wse@tuxedocomputers.com>
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-3-andri@yngvason.is>
 <CAPj87rNan8B5urDFkmD_Vti4to6p3NmvXYsTFQTNg-Ue2ieDug@mail.gmail.com>
 <CAFNQBQwiqqSRqzXAnC035UWCGF3=GGFR5SpDd=biPTOEA+cWbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFNQBQwiqqSRqzXAnC035UWCGF3=GGFR5SpDd=biPTOEA+cWbQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Werner Sembach <wse@tuxedocomputers.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 11:12:11PM +0000, Andri Yngvason wrote:
> Hi Daniel,
> 
> þri., 9. jan. 2024 kl. 22:32 skrifaði Daniel Stone <daniel@fooishbar.org>:
> 
> > On Tue, 9 Jan 2024 at 18:12, Andri Yngvason <andri@yngvason.is> wrote:
> > > + * active color format:
> > > + *     This read-only property tells userspace the color format
> > actually used
> > > + *     by the hardware display engine "on the cable" on a connector.
> > The chosen
> > > + *     value depends on hardware capabilities, both display engine and
> > > + *     connected monitor. Drivers shall use
> > > + *     drm_connector_attach_active_color_format_property() to install
> > this
> > > + *     property. Possible values are "not applicable", "rgb",
> > "ycbcr444",
> > > + *     "ycbcr422", and "ycbcr420".
> >
> > How does userspace determine what's happened without polling? Will it
> > only change after an `ALLOW_MODESET` commit, and be guaranteed to be
> > updated after the commit has completed and the event being sent?
> > Should it send a HOTPLUG event? Other?
> >
> 
> Userspace does not determine what's happened without polling. The purpose
> of this property is not for programmatic verification that the preferred
> property was applied. It is my understanding that it's mostly intended for
> debugging purposes. It should only change as a consequence of modesetting,
> although I didn't actually look into what happens if you set the "preferred
> color format" outside of a modeset.

This feels a bit irky to me, since we don't have any synchronization and
it kinda breaks how userspace gets to know about stuff.

For context the current immutable properties are all stuff that's derived
from the sink (like edid, or things like that). Userspace is guaranteed to
get a hotplug event (minus driver bugs as usual) if any of these change,
and we've added infrastructure so that the hotplug event even contains the
specific property so that userspace can avoid re-read (which can cause
some costly re-probing) them all.

As an example you can look at drm_connector_set_link_status_property,
which drivers follow by a call to drm_kms_helper_connector_hotplug_event
to make sure userspace knows about what's up. Could be optimized I think.

This thing here works entirely differently, and I think we need somewhat
new semantics for this:

- I agree it should be read-only for userspace, so immutable sounds right.

- But I also agree with Daniel Stone that this should be tied more
  directly to the modeset state.

So I think the better approach would be to put the output type into
drm_connector_state, require that drivers compute it in their
->atomic_check code (which in the future would allow us to report it out
for TEST_ONLY commits too), and so guarantee that the value is updated
right after the kms ioctl returns (and not somewhen later for non-blocking
commits).

You probably need a bit of work to be able to handle immutable properties
with the atomic state infrastructure, but I think otherwise this should
fit all rather neatly.

Cheers, Sima
> 
> The way I've implemented things in sway, calling the
> "preferred_signal_format" command triggers a modeset with the "preferred
> color format" set and calling "get_outputs", immediately queries the
> "actual color format" and displays it.
> 
> Regards,
> Andri

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
