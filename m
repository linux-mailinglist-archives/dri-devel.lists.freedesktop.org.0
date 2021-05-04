Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398213726F2
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 10:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF256E1A5;
	Tue,  4 May 2021 08:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C536E1A5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 08:08:43 +0000 (UTC)
Received: from mail-oi1-f199.google.com ([209.85.167.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <chris.chiu@canonical.com>) id 1ldq6j-0004yP-Ho
 for dri-devel@lists.freedesktop.org; Tue, 04 May 2021 08:08:41 +0000
Received: by mail-oi1-f199.google.com with SMTP id
 u132-20020aca478a0000b02901e5ac10ceebso3064510oia.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 01:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7snMEmI+fhOlxdU/CfqCczjaAies3jTJlLhdo4cx9qI=;
 b=k0XUCbNxqidtnQDRtjN8v8WNv/u426XUo8rA6Unw6SEm8ljbKkbDezC0ujn5SG3+xv
 ZM6YiSmnbI8UbgaOLWylDlcmKRWMGEDE0sF5g6aGW4SUZ96s1Vnge3U9FviyPhNl7Czn
 vlIf6GuMCnU23qs1NCVML9ZPfPaGI0ThrtCCj93ilcPsLgDL2Vh/OAyhrMKpdr8yjMFo
 hmEx5/MvXj8rXNOlUM7EistwWYj3cQmTxwBfBCFxJfRsoJYz9T6V6ETzcYJyDUcxGjlv
 5HsLeNeh+TR5ErxVxkD02voVyPBzq1i2SZKGeXFED57bHNPr0yGeSc2ibwPKs1iSgAru
 Rczw==
X-Gm-Message-State: AOAM532A5w4gvkSfoBrLdgueYamXhFjBBGLU1NYWztecxjXOOZ4Bh5A3
 C4HqV1oZmhr8JuEPqo4yvVt/JrKudM17h5xTQwP4orM16qiSDGG40xJ/Eaw4Bl6mr3IhadomOqs
 WJ6Sa0yTVGYUg03ZbEeKr/JSyh/NXFE151c6GZxRHGuOYGTMnKTAtQ5o6uPVeJg==
X-Received: by 2002:a9d:68d8:: with SMTP id i24mr3800159oto.347.1620115719796; 
 Tue, 04 May 2021 01:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFR5Zm3Pe2X7d2J6AVWBHROjCyWNPofZhzx+1Jh4XHk3l+k5mzPUgFdXvmSmSgjCnR7vFlRTmxdluvN02aBdA=
X-Received: by 2002:a9d:68d8:: with SMTP id i24mr3800136oto.347.1620115719428; 
 Tue, 04 May 2021 01:08:39 -0700 (PDT)
MIME-Version: 1.0
From: Chris Chiu <chris.chiu@canonical.com>
Date: Tue, 4 May 2021 16:08:28 +0800
Message-ID: <CABTNMG0Y5iAD4E8XFkOwrNTBHNDcNKRt=+BLPHs4tw5O2eVBDA@mail.gmail.com>
Subject: NVIDIA GPU fallen off the bus after exiting s2idle
To: kherbst@redhat.com, bhelgaas@google.com, rjw@rjwysocki.net, 
 mika.westerberg@intel.com, len.brown@intel.com
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
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
    We have some Intel laptops (11th generation CPU) with NVIDIA GPU
suffering the same GPU falling off the bus problem while exiting
s2idle with external display connected. These laptops connect the
external display via the HDMI/DisplayPort on a USB Type-C interfaced
dock. If we enter and exit s2idle with the dock connected, the NVIDIA
GPU (confirmed on 10de:24b6 and 10de:25b8) and the PCIe port can come
back to D0 w/o problem. If we enter the s2idle, disconnect the dock,
then exit the s2idle, both external display and the panel will remain
with no output. The dmesg as follows shows the "nvidia 0000:01:00.0:
can't change power state from D3cold to D0 (config space
inaccessible)" due to the following ACPI error
[ 154.446781]
[ 154.446783]
[ 154.446783] Initialized Local Variables for Method [IPCS]:
[ 154.446784] Local0: 000000009863e365 <Obj> Integer 00000000000009C5
[ 154.446790]
[ 154.446791] Initialized Arguments for Method [IPCS]: (7 arguments
defined for method invocation)
[ 154.446792] Arg0: 0000000025568fbd <Obj> Integer 00000000000000AC
[ 154.446795] Arg1: 000000009ef30e76 <Obj> Integer 0000000000000000
[ 154.446798] Arg2: 00000000fdf820f0 <Obj> Integer 0000000000000010
[ 154.446801] Arg3: 000000009fc2a088 <Obj> Integer 0000000000000001
[ 154.446804] Arg4: 000000003a3418f7 <Obj> Integer 0000000000000001
[ 154.446807] Arg5: 0000000020c4b87c <Obj> Integer 0000000000000000
[ 154.446810] Arg6: 000000008b965a8a <Obj> Integer 0000000000000000
[ 154.446813]
[ 154.446815] ACPI Error: Aborting method \IPCS due to previous error
(AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
[ 154.446824] ACPI Error: Aborting method \MCUI due to previous error
(AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
[ 154.446829] ACPI Error: Aborting method \SPCX due to previous error
(AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
[ 154.446835] ACPI Error: Aborting method \_SB.PC00.PGSC due to
previous error (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
[ 154.446841] ACPI Error: Aborting method \_SB.PC00.PGON due to
previous error (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
[ 154.446846] ACPI Error: Aborting method \_SB.PC00.PEG1.NPON due to
previous error (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
[ 154.446852] ACPI Error: Aborting method \_SB.PC00.PEG1.PG01._ON due
to previous error (AE_AML_LOOP_TIMEOUT) (20200925/psparse-529)
[ 154.446860] acpi device:02: Failed to change power state to D0
[ 154.690760] video LNXVIDEO:00: Cannot transition to power state D0
for parent in (unknown)

The IPCS is the last function called from \_SB.PC00.PEG1.PG01._ON
which we expect it to prepare everything before bringing back the
NVIDIA GPU but it's stuck in the infinite loop as described below.
Please refer to
https://gist.github.com/mschiu77/fa4f5a97297749d0d66fe60c1d421c44 for
the full DSDT.dsl.
           While (One)
            {
                If ((!IBSY || (IERR == One)))
                {
                    Break
                }

                If ((Local0 > TMOV))
                {
                    RPKG [Zero] = 0x03
                    Return (RPKG) /* \IPCS.RPKG */
                }

                Sleep (One)
                Local0++
            }

And the upstream PCIe port of NVIDIA seems to become inaccessible due
to the messages as follows.
[ 292.746508] pcieport 0000:00:01.0: waiting 100 ms for downstream
link, after activation
[ 292.882296] pci 0000:01:00.0: waiting additional 100 ms to become accessible
[ 316.876997] pci 0000:01:00.0: can't change power state from D3cold
to D0 (config space inaccessible)

Since the IPCS is the Intel Reference Code and we don't really know
why the never-end loop happens just because we unplug the dock while
the system still stays in s2idle. Can anyone from Intel suggest what
happens here?

And one thing also worth mentioning, if we unplug the display cable
from the dock before entering the s2idle, NVIDIA GPU can come back w/o
problem even if we disconnect the dock before exiting s2idle. Here's
the lspci information
https://gist.github.com/mschiu77/0bfc439d15d52d20de0129b1b2a86dc4 and
the dmesg log with ACPI trace_state enabled and dynamic debug on for
drivers/pci/pci.c, drivers/acpi/device_pm.c for the whole s2idle
enter/exit with IPCS timeout.

Any suggestion would be appreciated. Thanks.

Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
