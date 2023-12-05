Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 420B9806906
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 08:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF6D10E698;
	Wed,  6 Dec 2023 07:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C2310E622
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 22:43:28 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5c6734e0c22so1699707a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 14:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1701816208; x=1702421008;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s5PDjvnXiofAm+LfrZr5GVjzdYbiyiT62E/CMkJfzm4=;
 b=M5433PKwMxSUMDO2DGTYVmW2gRVrgFyldJEfwEOI1xts8QNAIUKnRZnjhVo7ZUxHTe
 L5CuYEFTLADX7LLpUPOo26Zofr/fboqSdwDqDHc+vR7xKlRdv1ZP+s0vYgeUR6phU50W
 Dwt6Y7ZEqW/RFCqq1GzAwvvItzW/D9Y1qSx8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701816208; x=1702421008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5PDjvnXiofAm+LfrZr5GVjzdYbiyiT62E/CMkJfzm4=;
 b=UZGVAd9NGrO7vD9l+nEf1YPdeNhV39UXxuwmVIHLR56hV9f2d+xQjoeSWf3OoHx7XT
 9j2UWd6nctLYtUdcXGbx9Jy+0uqi6TFYQg4JfdoQcH/yNhykXNz978rqF5JP8PqVHQeW
 ioYNg47ZT4cXXx5pOmZAsHtT8qXAK8vpSmoURJEIXe9r6iR3FWfbRaOK89De3Z7KjPgq
 AlICzuadhm1VB2VqJ0RHeGIo2tn7n0Ih1KFujzP6rfRXTlKvfXv3hTrvh8B7eHw3Bd4Z
 xqZtrbKrM8xHgAJeTmZifs416mbKPs5+VcKcNm7dpz3bCozIHuAG0/dB/Fd+pSnK4uit
 s4gA==
X-Gm-Message-State: AOJu0Yx6RnhuCa4Tt4HiL1WYEymnSTafKCEnrPs/l6XGaGnHwXnNkTsx
 5NFWxt2ZSTUyH0hON9O5in1IDc5075njBxmWX0889MlB9+YfWekRVajEb63Ghh46JineNh1myjN
 uXSbXxU/a1dICVL7vPmxDU7QW9MOtyKSwMEw=
X-Google-Smtp-Source: AGHT+IGLyjhmShxcrztf4iUASVXKLIZrQvbl2nOMjR/Yv9SysVtwrvaOGSlk/eSVNbluuvrw8muVoWkRUp1fFXY/kkM=
X-Received: by 2002:a05:6a20:1608:b0:18c:b6:ab4f with SMTP id
 l8-20020a056a20160800b0018c00b6ab4fmr4318468pzj.48.1701816207958; Tue, 05 Dec
 2023 14:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20231122233058.185601-8-amakhalov@vmware.com>
 <20231201232452.220355-1-amakhalov@vmware.com>
 <20231201232452.220355-7-amakhalov@vmware.com>
 <20231204103100.GYZW2qZE9tbGMtuVgY@fat_crate.local>
 <c2519c9a-8518-403a-9bca-cb79a5f2a6e9@intel.com>
 <204f743d-2901-4ad2-bbcc-a7857a8644e7@broadcom.com>
In-Reply-To: <204f743d-2901-4ad2-bbcc-a7857a8644e7@broadcom.com>
From: Tim Merrifield <tim.merrifield@broadcom.com>
Date: Tue, 5 Dec 2023 16:43:16 -0600
Message-ID: <CAJfbqWyeubVofe4BHQC+a3wacwk0kMPECa8mxZ7gkzhBJ3d5LA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] x86/vmware: Add TDX hypercall support
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 06 Dec 2023 07:57:25 +0000
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
Cc: pv-drivers@vmware.com, hpa@zytor.com, dri-devel@lists.freedesktop.org,
 Dave Hansen <dave.hansen@intel.com>, namit@vmware.com,
 Alexey Makhalov <amakhalov@vmware.com>, timothym@vmware.com,
 dave.hansen@linux.intel.co, x86@kernel.org, mingo@redhat.com,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 tzimmermann@suse.de, richardcochran@gmail.com, virtualization@lists.linux.dev,
 mripard@kernel.org, akaher@vmware.com, Borislav Petkov <bp@alien8.de>,
 jsipek@vmware.com, tglx@linutronix.de, netdev@vger.kernel.org,
 dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org, horms@kernel.org,
 zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Alexey,

Regarding VMware-specific checks, it may be beneficial to add some
additional checks
such as ensuring that the hypervisor vendor is VMware,
r12=3D=3DVMWARE_HYPERVISOR_MAGIC,
r10=3D=3DVMWARE_TDX_VENDOR_LEAF, r11=3D=3DVMWARE_TDX_HCALL_FUNC and r13 (co=
mmand) is
restricted to those few commands we expect to be invoked from the
kernel or drivers by VMware-specific
code.

If we add these checks, would folks be OK with exporting this function?


On Tue, Dec 5, 2023 at 3:41=E2=80=AFPM Alexey Makhalov
<alexey.makhalov@broadcom.com> wrote:
>
>
>
> On 12/5/23 1:24 PM, Dave Hansen wrote:
> > On 12/4/23 02:31, Borislav Petkov wrote:
> >> On Fri, Dec 01, 2023 at 03:24:52PM -0800, Alexey Makhalov wrote:
> >>> +#ifdef CONFIG_INTEL_TDX_GUEST
> >>> +/* __tdx_hypercall() is not exported. So, export the wrapper */
> >>> +void vmware_tdx_hypercall_args(struct tdx_module_args *args)
> >>> +{
> >>> +   __tdx_hypercall(args);
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(vmware_tdx_hypercall_args);
> >> Uuuh, lovely. I'd like to see what the TDX folks think about this
> >> export first.
> >
> > I don't really like it much.  This does a generic thing (make a TDX
> > hypercall) with a specific name ("vmware_").  If you want to make an
> > argument that a certain chunk of the __tdx_hypercall() space is just fo=
r
> > VMWare and you also add a VMWare-specific check and then export *that*,
> > it might be acceptable.
> >
> > But I don't want random modules able to make random, unrestricted TDX
> > hypercalls.  That's asking for trouble.
>
> Considering exporting of __tdx_hypercall for random modules is not an
> option, what VMware specific checks you are suggesting?
>
> --
> This electronic communication and the information and any files transmitt=
ed
> with it, or attached to it, are confidential and are intended solely for
> the use of the individual or entity to whom it is addressed and may conta=
in
> information that is confidential, legally privileged, protected by privac=
y
> laws, or otherwise restricted from disclosure to anyone else. If you are
> not the intended recipient or the person responsible for delivering the
> e-mail to the intended recipient, you are hereby notified that any use,
> copying, distributing, dissemination, forwarding, printing, or copying of
> this e-mail is strictly prohibited. If you received this e-mail in error,
> please return the e-mail to the sender, delete it from your computer, and
> destroy any printed copy of it.

--=20
This electronic communication and the information and any files transmitted=
=20
with it, or attached to it, are confidential and are intended solely for=20
the use of the individual or entity to whom it is addressed and may contain=
=20
information that is confidential, legally privileged, protected by privacy=
=20
laws, or otherwise restricted from disclosure to anyone else. If you are=20
not the intended recipient or the person responsible for delivering the=20
e-mail to the intended recipient, you are hereby notified that any use,=20
copying, distributing, dissemination, forwarding, printing, or copying of=
=20
this e-mail is strictly prohibited. If you received this e-mail in error,=
=20
please return the e-mail to the sender, delete it from your computer, and=
=20
destroy any printed copy of it.
