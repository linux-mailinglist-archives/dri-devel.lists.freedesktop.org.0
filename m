Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8514858109
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A84810EB7B;
	Fri, 16 Feb 2024 15:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Uje3dc8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83BD10EB7B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 15:30:24 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so298842566b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708097423; x=1708702223;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zqvzBEiASnSWsOyAXgOzbNtdSKBBKn93ZIiKcXFlZbY=;
 b=Uje3dc8+QAzlJq98beVXEtdCkrRodQlWQwdSEuKQb2HzUuYwkwcSxUfWQXVFIqyXX0
 N3e3/6x7AqiKS2u7vhieSzdGDgwt8ToM05xEBOnw0AUx4jftydmFyVx7qp1cw3RpuAlM
 zF1kE0JVg1j+d5Oh3fYBaLXVFKOofs8JlTDV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708097423; x=1708702223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zqvzBEiASnSWsOyAXgOzbNtdSKBBKn93ZIiKcXFlZbY=;
 b=KMSs7yHwhaDOzwH0Je8jvAqKw4UStPF38xaG8EJezrG4DnEoMDZcik1pPR5l/9TX0d
 1UX277kHLjUGKnSzMF+i6NlyIsjkZ9EBFAqKls+H3W7W9fcW3KCGBdouovtWj7ntuM3C
 Smd98AuEqYjxUv59AESpcXBhTq84y47wQVfXT9PNBmZQY+TlPAkJ/9ycYtBOgiuo+mIN
 ZPYYjthVuvfDmSKxkVm6YjVPvfuRJNzE1mLfUpsPM9V+h1As8jB5JTRJrxTzk2Drr2kE
 W2LnWXi+EYccBxsGICb3fetkEP2ja7MkZhTyxt6xn1ukK/Ap6gB5HUBB2QSnlR4VKDYY
 Ao3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXERng4qf+V6lWJSP6JQvRCGFypXpDq+veNasWdnOg3O6X+vrXhVT8a8SJfePDHQnqy4mNQAB2bXaBK5xE8BGLWWdTeyEEhVy1VYqhvtfzP
X-Gm-Message-State: AOJu0YxB7xXAlhEiGsVOaeGJ7PYidR0NvzpuO46lofFGsxQdQWDwYaSb
 kNrcTOeoVLDyvaHpbKaOzNPxKn6Y08HTreop85QHoPHw7pFz164o54J0FxwdOUYX5Nh8v+w0i2E
 HoqD/
X-Google-Smtp-Source: AGHT+IEai9hmslHzkFPb2x1DoxiwkPusBWio/R3XmtXu6JYePfKsXhrBsNqHtc6SYCCuCZPzR+w4Zw==
X-Received: by 2002:a17:906:743:b0:a3d:ca8e:d98d with SMTP id
 z3-20020a170906074300b00a3dca8ed98dmr1863276ejb.43.1708097422700; 
 Fri, 16 Feb 2024 07:30:22 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 v27-20020a17090606db00b00a3d39d2c349sm40128ejb.110.2024.02.16.07.30.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 07:30:21 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-56037115bb8so8988a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 07:30:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXrk/XUUGXLKqZY/XnM08fnSO4Awmuwqm/W9fy3H7gRQt1CH6KSCH+lYfwTmY1jqKC9bwidtKXLLvUwaJ79PgyG9tj8vp+Hz7IWW4YQI2OE
X-Received: by 2002:a50:cd8c:0:b0:562:70d:758 with SMTP id
 p12-20020a50cd8c000000b00562070d0758mr205798edi.2.1708097421181; 
 Fri, 16 Feb 2024 07:30:21 -0800 (PST)
MIME-Version: 1.0
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
 <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
 <87sf1u58k0.fsf@intel.com>
 <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
 <cbcd981f-bd5d-477e-8482-d3414be17057@linaro.org>
 <CAD=FV=UtakQZ6OEKwERW5gNeAfS88EqkuQAHkrQoN=SicDG1JA@mail.gmail.com>
 <87frxskef7.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87frxskef7.fsf@minerva.mail-host-address-is-not-set>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 Feb 2024 07:30:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WwfB=u2DVE0ux9cD3OCCccgcWCdJBxW2-9gg4qSFSv+A@mail.gmail.com>
Message-ID: <CAD=FV=WwfB=u2DVE0ux9cD3OCCccgcWCdJBxW2-9gg4qSFSv+A@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: neil.armstrong@linaro.org, Jani Nikula <jani.nikula@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 dri-devel@lists.freedesktop.org, eizan@chromium.org, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Imre Deak <imre.deak@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>, 
 Steev Klimaszewski <steev@kali.org>
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

Hi,

On Fri, Feb 16, 2024 at 12:21=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> > The kernel tree we landed on was the v5.15 tree, which is currently
> > serving all Qualcomm sc7180-based Chromebooks, all Mediatek 8173
> > Chromebooks and all Mediatek 8186 Chromebooks. There are also a pile
> > of x86 Chromebooks running our v5.15 kernel. This code shouldn't
> > affect them because (unless I'm mistaken) they don't use the two
> > affected panel drivers. In any case, I haven't heard any screams from
> > them either. Given my landing plans of "the week of the 26th", this
> > still gives another 1.5 weeks for any screams to reach my ears.
> >
> > ...or are you looking for non-ChromeOS test reports? I'm not sure how
> > to encourage those. I suppose sometimes folks at Red Hat end up
> > stumbling over similar panel problems to those of us in ChromeOS.
> > Maybe +Javier would be interested in providing a Tested-by?
> >
>
> I do have a SC7180 based HP X2 Chromebook and could test your patch (not
> today but I could do it early next week), although I haven't followed so
> if you could please let me know what exactly do you want me to verify.
>
> AFAIU the problem is that the fwupd daemon tries to scan DP busses even i=
f
> the panel is turned off and that's what takes a lot of time (due retries)=
,
> and your patch makes the driver to bail out immediately ? If that's the
> case, I guess that just starting fwupd daemon with an without your patch
> while the panel is turned off could be a good test ?

Sorry! I wasn't trying to sign you up for extra work. I'm not
convinced that any extra verification on a Chromebook is all that
valuable since that's pretty covered by the fact that we've already
pushed this patch out to real users on Chromebooks. I think Neil was
hoping for some confirmation that my patch didn't break someone else's
hardware. I think maybe good enough is if you have some type of
hardware that uses eDP and that you could verify that my patch does
break anything about it?

I'm not aware of anyone with extensive DP AUX character device usage.
I guess I thought of Javier because I remembered him at least also
using fwupd and some of the fwupd plugins try to talk to DP things
over the DP AUX character device.

If someone is really in a testing mood and wanted to stress the char
device, I guess something simple like "hexdump -C /dev/drm_dp_aux*"
for whatever eDP AUX is associated with eDP would at least do some
reading. You could stress turning the display on and off while doing
that with and without my patch. Presumably it will be better (error
out more quickly) with my patch.

If you wanted to stress the i2c path, you could do something like this
(the grep assumes you're using ti-sn65dsi86 as your eDP bridge chip,
but hopefully easy to adjust):

bus=3D$(i2cdetect -l | grep sn65 | sed 's/i2c-\([0-9]*\).*$/\1/')
i2cdump ${bus} 0x50 i

That should dump your EDID. Again it should error out quickly when the
panel is off after my patch but should start working again when the
panel is on.


Hmmm, thinking about all the above, I guess there is one case that
_could_ be broken by my patch. I really hope not, though. If someone
has a panel that's on an always-on rail or on a shared rail with some
other device (like the touchscreen) that's keeping the panel power on
then without my patch it would be possible to do DP AUX transactions
even when the panel was "off" from Linux's point of view. It would
have worked mostly due to luck, but now luck will run out and it will
stop working. I really hope nobody has userspace that is relying on
this, but I suppose it's always possible that somewhere, someone's
userspace is. If you are or know of someone who is then please shout.

-Doug
