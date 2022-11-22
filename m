Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D4C63416B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 17:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D8410E41C;
	Tue, 22 Nov 2022 16:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECE110E419;
 Tue, 22 Nov 2022 16:25:45 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-142faa7a207so5002573fac.13; 
 Tue, 22 Nov 2022 08:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SpDZQsUJvnWdvYo0oNbLPcXET26hZK0RRCLQwmIFBxc=;
 b=VYff249eQwewSO+Tt/4uguNa1VKAvqswh4hZx+BUpNYa8if252Qvhrj52UpWy7WW2R
 ET8pLv2EJ2ZrZq7JXcr9H9BurSlC9G9DfzUdQLwLHHl0+PSV0DAjpgQCFmLzxgOWRnUH
 JuSroY8Fm+AtmYnyat2eWz8qkHIx3chscCxHW9qBR1SQAIrKC/SiTah++oDt/EOH5cVE
 GsuHkYh+jqRHIVTCu9pXfD1EJthuU+/SCxs7aRFVNGtd0vso7DTFBxPV2wsb0y/JpIjq
 ODo+68g3DCZ4d4V3N2drtgN7pXIC7QaJGIkerIL5IUoVdd8YnKHM4pGfa3Yvgs+5h1m8
 9Uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SpDZQsUJvnWdvYo0oNbLPcXET26hZK0RRCLQwmIFBxc=;
 b=LBk9IAUeh+aWCNFDOqjMNaidHTIlpZpLgiG2XwTNT8IyTvFUwaRbQUoHWwQMDvPMqK
 QNRIS27rELCMSkmElPQ12NxtC13CUkztmoRdEtthFOSl4F7Ms4SdjU+HmIvzRCwgBCeN
 5APVZlCevlmUL66wQ2wGtYnUzXyjJMsUnWKeCVjaG7bbgmdQ0kJcNKTN9NbNOVK7LFRL
 zjwD7cMQB4WnB2FxCgRFhTiFF9Hm8f8Cj4I8clpkE6JNZwlRISoPZ2IIe+zVWlUP8t3Z
 jKbtKlfOeJcaQIr/jvDiGA9oPeFKhO+RyVtadNvZs6wjyf2/eHd+NG4ONEeX9mNLu3cv
 KO2A==
X-Gm-Message-State: ANoB5pkSxH8mtot1v4xGFhc7bbGVUfbRS/oSj+0TPLpOhUGJKWMsD20K
 eN+h3rTDh1iuYB2zh/MNfGUpOnmAZkEU/T8vHjM=
X-Google-Smtp-Source: AA0mqf50yN308SWgGlJYhSiqA68vNuOjyrcxYFqwi4xaQQBMSuTquyZ7oS8N4sN7mG4DqBNbTrx8JkmTN45g60g/jN4=
X-Received: by 2002:a05:6870:b07:b0:13b:d07f:f29d with SMTP id
 lh7-20020a0568700b0700b0013bd07ff29dmr2466925oab.96.1669134344728; Tue, 22
 Nov 2022 08:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20221122113043.18715-1-wangxiongfeng2@huawei.com>
 <20221122113043.18715-2-wangxiongfeng2@huawei.com>
 <CADnq5_NxLhU+zeNv4Esm=3Wn-=qHkRCzOmqT9a208BVZUn29pw@mail.gmail.com>
 <0167740e-7581-e85d-68f0-dc3e01d2a9a5@amd.com>
In-Reply-To: <0167740e-7581-e85d-68f0-dc3e01d2a9a5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Nov 2022 11:25:33 -0500
Message-ID: <CADnq5_M1GxWpRZYVkCUmFjFzG53hRe+-6d=MOEZ1hxJisx9DwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/radeon: Fix PCI device refcount leak in
 radeon_atrm_get_bios()
To: "Lazar, Lijo" <lijo.lazar@amd.com>
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
Cc: Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 yangyingliang@huawei.com, alexander.deucher@amd.com,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 9:59 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>
>
>
> On 11/22/2022 8:19 PM, Alex Deucher wrote:
> > On Tue, Nov 22, 2022 at 6:12 AM Xiongfeng Wang
> > <wangxiongfeng2@huawei.com> wrote:
> >>
> >> As comment of pci_get_class() says, it returns a pci_device with its
> >> refcount increased and decreased the refcount for the input parameter
> >> @from if it is not NULL.
> >>
> >> If we break the loop in radeon_atrm_get_bios() with 'pdev' not NULL, we
> >> need to call pci_dev_put() to decrease the refcount. Add the missing
> >> pci_dev_put() to avoid refcount leak.
> >
> > For both patches, I think pci_dev_put() needs to go into the loops.
> > There are 2 or more GPUs on the systems where this is relevant.
> >
>
> As per the logic, the loop breaks when it finds a valid ATRM handle. So
> dev_put is required only for that device.

Sure, but what if the handle is on the second DISPLAY_VGA or
DISPLAY_OTHER class PCI device on the system?  We've already called
pci_get_class() for the first PCI device that matched.

Alex

>
> When inside the loop this happens -  "decreased the refcount for the
> input parameter @from if it is not NULL"
>
> Thanks,
> Lijo
>
> > Alex
> >
> >>
> >> Fixes: d8ade3526b2a ("drm/radeon: handle non-VGA class pci devices with ATRM")
> >> Fixes: c61e2775873f ("drm/radeon: split ATRM support out from the ATPX handler (v3)")
> >> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
> >> ---
> >>   drivers/gpu/drm/radeon/radeon_bios.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
> >> index 33121655d50b..2df6ce3e32cb 100644
> >> --- a/drivers/gpu/drm/radeon/radeon_bios.c
> >> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
> >> @@ -227,6 +227,7 @@ static bool radeon_atrm_get_bios(struct radeon_device *rdev)
> >>
> >>          if (!found)
> >>                  return false;
> >> +       pci_dev_put(pdev);
> >>
> >>          rdev->bios = kmalloc(size, GFP_KERNEL);
> >>          if (!rdev->bios) {
> >> --
> >> 2.20.1
> >>
