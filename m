Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C109EC7BC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFE610EABF;
	Wed, 11 Dec 2024 08:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oFVAzGtV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BA810EABC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:52:57 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53e3c47434eso3320838e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733907175; x=1734511975; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PQvn4I1rIMKsaknMKxkICyEP4l6YBY0h5q6GbALy4aI=;
 b=oFVAzGtVmMn5cH3L2iCQopJUZwa0i6Lk0JAp1iR3javRgnFtUgiO+g9L86CzEg+xDb
 Kw3bYTlFhNYciTnzgCBqcoPnUc7/pXDAxWmoRhAP3cnIzdyMI5sw3Cr3cORizwY4fyJi
 6NTW/rB4CSkZ7A0O+kXlTY7UGtJ/Uglc81OrnYLBzc2TGE/ePtoF6G6WctXkTy2vzp9i
 eHvClFURkUe1Dpj4XWW77sZq8Ja/58AQuisnML5BIqxKLL66egf658xN+7H/cQvVFGah
 +5SzgZ4fw2uOESPVELGTBPPdvAGBovtRekHQX2+SxOhUSvZ4g/yQRkbMcn4zOXkb8yMy
 qCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733907175; x=1734511975;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PQvn4I1rIMKsaknMKxkICyEP4l6YBY0h5q6GbALy4aI=;
 b=rhZNqTHGjtkds8XiVCWwb6TwoXRrnLA5No7Wi3cE4aYgkV0d707TFdJiYuV/92Ot0V
 +zq/WEfoMpBYEbcBZwIJJeYhitQk2ltOLHYXWdtQuErNwbU3XJafV357PvwaN/FCLj0D
 DpERrgU0Za14OAbIYbS9vmgOOl1nYhdNi/dThjn/PBiglAwViXMHFeuyqhcZoiWAYL1f
 lCG1IIvQU9kMYeh1qtzlbM/oY+/WQfnHnBGDeZ/zFuNzgRNwfFiikQ24LmOqME8HKGAM
 +Tiop/oRt+LoLJBizIkF5d3Pq9LjaSzh/AJYMg+dcNLid2+hk5NI6a63BaYJ6ifo5eRT
 WLqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSNa9x9bML2VZKShEGIX0eVKiew3KP/BgSBUIqvFPLV6HjCpyvPhzPOiz6ICJA+a/yxbwhTyAjt84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWuOZIccKB6Qo4rXDr8W2s1MQB4uBEYr555v+JecFHcW83+S1V
 03/KVCzeFa5VwCQoKxmTcATxoUSvygonmNGAekQCyUkAvM2t+1FCqhuykg157mE=
X-Gm-Gg: ASbGnctK4yL9je0Y3Z58rNQXfz2E1N5MI7+qwvtAzifl3lmxPoT1DvvLylFQIhLFd62
 fmyOHUMLNBzR07tY8KpHAVXkiOg2LYV7KFQyg1GXCX0eHyTp6INMgQOA3yn7PAUACa6LQdbDux6
 3Y8bxlWW8Naw3AiGeSaAXpe01brsX3gusY1Q3smSZI4rb5A9uAwbFqW5RrOYRG0x7PTkcyWn/bE
 +wPnt+TuF2N34lDHVrUx8a0WOukxRj4s+OrTufoqKGxbPygKFh9Qbnz1O5rsAae+uw5r4MweyEo
 Rjj/CUrjZH4d1fm7qfsR7W6VRk1p62oliQ==
X-Google-Smtp-Source: AGHT+IGuour6lJxXBzgCzGK78I8fo7xj6s/UcHmwFWIUOfdM9PKGmWIYOC26HeAtncqnF//cs2PKFA==
X-Received: by 2002:a05:6512:3988:b0:540:25a6:c342 with SMTP id
 2adb3069b0e04-5402a5d8e27mr581372e87.4.1733907175524; 
 Wed, 11 Dec 2024 00:52:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cacc70fsm1012887e87.5.2024.12.11.00.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:52:54 -0800 (PST)
Date: Wed, 11 Dec 2024 10:52:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Elliot Berman <quic_eberman@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <pndxbcduiwytfwkortyxpdqgwa4bm3ajnjpa5nedjtgndq6z5v@mziv5z36zeqr>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
 <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
 <1219b46d-2aea-4377-a8ca-024039ee1499@quicinc.com>
 <CAF6AEGs4EebrwyQZviNXqB2=3h2wgZpmbrdGHuEU4z1D014GRA@mail.gmail.com>
 <b47d44cc-77b7-4137-97e3-b245e1394580@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b47d44cc-77b7-4137-97e3-b245e1394580@quicinc.com>
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

On Wed, Dec 11, 2024 at 01:06:58PM +0530, Pavan Kondeti wrote:
> +devicetree
> 
> On Tue, Dec 10, 2024 at 07:43:19PM -0800, Rob Clark wrote:
> > On Tue, Dec 10, 2024 at 7:08 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > >
> > > On 12/11/2024 6:43 AM, Bjorn Andersson wrote:
> > > > On Tue, Dec 10, 2024 at 02:22:27AM +0530, Akhil P Oommen wrote:
> > > >> On 12/10/2024 1:24 AM, Rob Clark wrote:
> > > >>> On Mon, Dec 9, 2024 at 12:20 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > > >>>>
> > > >>>> When kernel is booted in EL2, SECVID registers are accessible to the
> > > >>>> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> > > >>>> on Zap firmware. Also, we can't load a secure firmware without a
> > > >>>> hypervisor that supports it.
> > > >>>
> > > >>> Shouldn't we do this based on whether zap node is in dtb (and not disabled)?
> > > >>
> > > >> This is better, isn't it? Otherwise, multiple overlays should be
> > > >> maintained for each soc/board since EL2 can be toggled from bootloader.
> > > >> And this feature is likely going to be more widely available.
> > > >>
> > > >
> > > > The DeviceTree passed to the OS needs to describe the world that said OS
> > > > is going to operate in. If you change the world you need to change the
> > > > description.
> > > > There are several other examples where this would be necessary
> > > > (remoteproc and watchdog to name two examples from the Qualcomm upstream
> > > > world).
> > >
> > > But basic things work without those changes, right? For eg: Desktop UI
> > 
> > It isn't really so much about whether certain use-cases can work with
> > a sub-optimal description of the hw (where in this case "hw" really
> > means "hw plus how the fw allows things to look to the HLOS").. It is
> > more about the hw/fw/whatever providing an accurate description of
> > what things look like to the HLOS.
> > 
> > I'm leaning more towards the hw+fw providing HLOS an accurate view...
> > and the fact that that carries over into other areas of dtb (ie. it
> > isn't the only thing that slbounce needs to patch, as I previously
> > mentioned) reinforces my view there.  This seems like a thing to fix
> > in fw/bootloader tbh.
> > 
> 
> Thanks Rob and Bjorn for your inputs. At the moment, we don't have
> capability in our bootloader to apply a *specific* overlay when Linux
> kernel is starteed in EL, this is making GPU non-functional. This patch
> from Akhil fixes the problem without depending on the bootloader.
> 
> From this discussion, I understand that it is recommended to provide
> HW+FW view in dT correctly instead of doing runtime checks in the
> kernel. We can take this as a requirement to the bootloader.
> 
> I would like to check how we should proceed with overlay. Should we
> submit dtso upstream and let bootloader apply the overlay at runtime or
> this whole overlay needs to be maintained in the bootloader. Also,
> Should we build all board dtb for EL2 as well or just leave it at compiling
> the EL2 dtbo (one per SoC)?

It doesn't have to be a dtbo. Instead you might just patch the DT
(Ideally via the https://github.com/U-Boot-EFI/EFI_DT_FIXUP_PROTOCOL).
I think the bootloader already changes the DT (by fixing memory sizes,
etc), so enabling or disabling ZAP & fixing several other bits and
pieces sounds logical.

-- 
With best wishes
Dmitry
