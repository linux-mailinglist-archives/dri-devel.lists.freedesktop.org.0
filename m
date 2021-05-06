Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C222C3751C8
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 11:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22EB6E18E;
	Thu,  6 May 2021 09:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388626E18E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 09:46:45 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 g15-20020a9d128f0000b02902a7d7a7bb6eso4348809otg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 02:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WLw6wpF1SpPaYf9GjIKaoxywxvbZeYQGn/3BsI8vClk=;
 b=Og/8uuO5rvlegNEIJAV2UH692rEMh2YejmuuoXl3ftycXCSpZTpgjgczZGWPfdlUVD
 Adn0c4hkiTxSwipGsrOWJYWXrIWxbGuHeS0aDAubRMDOQAijkemuEbaEBCpV7SlNKzaO
 93wkjnNwohorSk8SHIoAstY38mXXtvSb6bHhBk47iB0Ekcu3G33daZWuYx8cvTTrm9JU
 Vy/MnNN0LSio50ZvLggRJG/dY0+3p3BSDtthed9YfRvepvOOrZuefuqy2g/wPUTnK+uL
 fxl2Wo7jU+/azZpFicMjpWTGterexYfptpdUD6xkjPhm/y+qgGjEaKwxFtDkpjd29nl6
 Ko9Q==
X-Gm-Message-State: AOAM532OXJMbdmbLfcs+0EjbHXa0UC5pQSAvIV7rqjBv/glgYtBnQJte
 lN5cqo7sCtPq5awWVQ+r9AWAwhKMM4B4CVPK9Ac=
X-Google-Smtp-Source: ABdhPJyAsuVo6svOMDODs74V1AcY7zQZ8HNwrp/WdernvPw059EjB7XBOZVJ1YRHznkASCdNNtLe7vGRDXaOLBJfzZI=
X-Received: by 2002:a05:6830:55b:: with SMTP id
 l27mr2800612otb.260.1620294404422; 
 Thu, 06 May 2021 02:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <CABTNMG0Y5iAD4E8XFkOwrNTBHNDcNKRt=+BLPHs4tw5O2eVBDA@mail.gmail.com>
In-Reply-To: <CABTNMG0Y5iAD4E8XFkOwrNTBHNDcNKRt=+BLPHs4tw5O2eVBDA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 6 May 2021 11:46:33 +0200
Message-ID: <CAJZ5v0hqU4xc8oCWXPBYhdGdG__=15+M67QWVSfFeUR3DN4Evw@mail.gmail.com>
Subject: Re: NVIDIA GPU fallen off the bus after exiting s2idle
To: Chris Chiu <chris.chiu@canonical.com>
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
Cc: Len Brown <len.brown@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 4, 2021 at 10:08 AM Chris Chiu <chris.chiu@canonical.com> wrote:
>
> Hi,
>     We have some Intel laptops (11th generation CPU) with NVIDIA GPU
> suffering the same GPU falling off the bus problem while exiting
> s2idle with external display connected. These laptops connect the
> external display via the HDMI/DisplayPort on a USB Type-C interfaced
> dock. If we enter and exit s2idle with the dock connected, the NVIDIA
> GPU (confirmed on 10de:24b6 and 10de:25b8) and the PCIe port can come
> back to D0 w/o problem. If we enter the s2idle, disconnect the dock,
> then exit the s2idle, both external display and the panel will remain
> with no output. The dmesg as follows shows the "nvidia 0000:01:00.0:
> can't change power state from D3cold to D0 (config space
> inaccessible)" due to the following ACPI error
> [ 154.446781]
> [ 154.446783]
> [ 154.446783] Initialized Local Variables for Method [IPCS]:
> [ 154.446784] Local0: 000000009863e365 <Obj> Integer 00000000000009C5
> [ 154.446790]
> [ 154.446791] Initialized Arguments for Method [IPCS]: (7 arguments
> defined for method invocation)
> [ 154.446792] Arg0: 0000000025568fbd <Obj> Integer 00000000000000AC
> [ 154.446795] Arg1: 000000009ef30e76 <Obj> Integer 0000000000000000
> [ 154.446798] Arg2: 00000000fdf820f0 <Obj> Integer 0000000000000010
> [ 154.446801] Arg3: 000000009fc2a088 <Obj> Integer 0000000000000001
> [ 154.446804] Arg4: 000000003a3418f7 <Obj> Integer 0000000000000001
> [ 154.446807] Arg5: 0000000020c4b87c <Obj> Integer 0000000000000000
> [ 154.446810] Arg6: 000000008b965a8a <Obj> Integer 0000000000000000
> [ 154.446813]
> [ 154.446815] ACPI Error: Aborting method \IPCS due to previous error
> (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
> [ 154.446824] ACPI Error: Aborting method \MCUI due to previous error
> (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
> [ 154.446829] ACPI Error: Aborting method \SPCX due to previous error
> (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
> [ 154.446835] ACPI Error: Aborting method \_SB.PC00.PGSC due to
> previous error (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
> [ 154.446841] ACPI Error: Aborting method \_SB.PC00.PGON due to
> previous error (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
> [ 154.446846] ACPI Error: Aborting method \_SB.PC00.PEG1.NPON due to
> previous error (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
> [ 154.446852] ACPI Error: Aborting method \_SB.PC00.PEG1.PG01._ON due
> to previous error (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
> [ 154.446860] acpi device:02: Failed to change power state to D0
> [ 154.690760] video LNXVIDEO:00: Cannot transition to power state D0
> for parent in (unknown)

If I were to guess, I would say that AML tries to access memory that
is not accessible while suspended, probably PCI config space.

> The IPCS is the last function called from \_SB.PC00.PEG1.PG01._ON
> which we expect it to prepare everything before bringing back the
> NVIDIA GPU but it's stuck in the infinite loop as described below.
> Please refer to
> https://gist.github.com/mschiu77/fa4f5a97297749d0d66fe60c1d421c44 for
> the full DSDT.dsl.

The DSDT alone may not be sufficient.

Can you please create a bug entry at bugzilla.kernel.org for this
issue and attach the full output of acpidump from one of the affected
machines to it?  And please let me know the number of the bug.

Also please attach the output of dmesg including a suspend-resume
cycle including dock disconnection while suspended and the ACPI
messages quoted below.

>            While (One)
>             {
>                 If ((!IBSY || (IERR == One)))
>                 {
>                     Break
>                 }
>
>                 If ((Local0 > TMOV))
>                 {
>                     RPKG [Zero] = 0x03
>                     Return (RPKG) /* \IPCS.RPKG */
>                 }
>
>                 Sleep (One)
>                 Local0++
>             }
>
> And the upstream PCIe port of NVIDIA seems to become inaccessible due
> to the messages as follows.
> [ 292.746508] pcieport 0000:00:01.0: waiting 100 ms for downstream
> link, after activation
> [ 292.882296] pci 0000:01:00.0: waiting additional 100 ms to become accessible
> [ 316.876997] pci 0000:01:00.0: can't change power state from D3cold
> to D0 (config space inaccessible)
>
> Since the IPCS is the Intel Reference Code and we don't really know
> why the never-end loop happens just because we unplug the dock while
> the system still stays in s2idle. Can anyone from Intel suggest what
> happens here?

This list is not the right channel for inquiries related to Intel
support, we can only help you as Linux kernel developers in this
venue.

> And one thing also worth mentioning, if we unplug the display cable
> from the dock before entering the s2idle, NVIDIA GPU can come back w/o
> problem even if we disconnect the dock before exiting s2idle. Here's
> the lspci information
> https://gist.github.com/mschiu77/0bfc439d15d52d20de0129b1b2a86dc4 and
> the dmesg log with ACPI trace_state enabled and dynamic debug on for
> drivers/pci/pci.c, drivers/acpi/device_pm.c for the whole s2idle
> enter/exit with IPCS timeout.
>
> Any suggestion would be appreciated. Thanks.

First, please use proper Intel support channels for BIOS-related inquiries.

Second, please open a bug as suggested above and let's use it for
further communication regarding this issue as far as Linux is
concerned.

Thanks!
