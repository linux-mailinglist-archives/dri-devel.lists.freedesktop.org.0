Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FD68AFBAB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 00:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C91410ED1F;
	Tue, 23 Apr 2024 22:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="elqD3tFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FE2113636
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 19:51:47 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-78f056f928eso415449185a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 12:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713901906; x=1714506706; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=V34zl+LCQdGU9TsNKJvDa6HZ3KMm8IzHGaGUrzvEbv4=;
 b=elqD3tFOCok9fTLWACMgd/vCbkVY9cpSpV5sdhs8cW0KPrSTqagHKIdLNdcsvj1ifD
 zaIZDE7h2Xa0TDrND+BvSWtrmLBqkmojH/IAOMstMzL4bePhk4lQC8OhV0b3E361a7Qd
 9agPiJKo57H09OBm10GqKoieW8tWW7pQl2JYugY9sw5LmTU3hTzmqvcWJzr4p5p0gIQz
 m4oMXi9IzT77cWhA7b3R9MhNHhHWlxAnfe8ALI/9uKEO2kCEbMuxlaA2TKxI0P/XgGwZ
 asg01BFXICE0Uch/66JcsDBqv34SKXx6MBD79D0fMwFI2BR+XeeQp7ewwDtnvGIvyi8C
 Zgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713901906; x=1714506706;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V34zl+LCQdGU9TsNKJvDa6HZ3KMm8IzHGaGUrzvEbv4=;
 b=qQaevavp3JdOfG+U+3yT9+A8vtg+i7QXezaKaovSh7W0V//oSpyFFweDG70thjdoRA
 zzukwB+vs2HBn7hDjVroFiCphlzceFgoi28U3xEoLcjqmEsCiK9916mIrK4K1NSxf5xd
 PrQZwpFXjxVZAeuDb62tqtlAz4q8TK54OijG818NE0yVz6PPY/AqNgW61ISa7VLeco8W
 ZdF6M3VYmpF9srgO74VmFc++ajco4mGJ7iwwNjGG4AgeqweOm1yvJEZQpf3pMCU1dU1y
 8PZJs2xyzzfEZbMAqgL1MGoSvr6eM8cTxvHxId3P3pBuFZXNrrpsYXEc1hoA1ttGBTMa
 ZS4Q==
X-Gm-Message-State: AOJu0YxWPZJrkGoL92+ygdjB5T6+NlFbO7GQ1VEZTW5cncEkSSAkSGXy
 cOqUiZncoNnnsr45syJrUFbzBzTfQbvae5Tj7/M7HCBMBAg7NZ8c
X-Google-Smtp-Source: AGHT+IGuf9fLbBwxxwrqS2HmoJCIuqYmeIVLF5O8lXwUJqj3z9vU4JdJcMjFinDn7wiO2dozYlq/nw==
X-Received: by 2002:a05:620a:4fc:b0:78e:c836:605a with SMTP id
 b28-20020a05620a04fc00b0078ec836605amr502819qkh.34.1713901905954; 
 Tue, 23 Apr 2024 12:51:45 -0700 (PDT)
Received: from [10.104.51.83] ([67.146.146.223])
 by smtp.gmail.com with ESMTPSA id
 wh13-20020a05620a56cd00b007906ab7b0b5sm2980032qkn.11.2024.04.23.12.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 12:51:45 -0700 (PDT)
Message-ID: <8ce1e1cc351153a890b65e62fed93b54ccd43f6a.camel@gmail.com>
Subject: After suspend/resume cycle ASPEED VGA monitor suffers with "No
 Signal" state.
From: Cary Garrett <cogarre@gmail.com>
To: airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 23 Apr 2024 14:51:44 -0500
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Apr 2024 22:22:29 +0000
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

Hello,

An Aspeed VGA monitor, in my case AST 2400, after a suspend/resume=20
cycle suffers with a "No Signal" state. This is also true of a=20
IPMI/BMC remote console. To restore the "Signal" state requires
a reboot or the following workaround.

To restore the "Signal" state without rebooting issue the
following commands from a SSH session or serial console
after every suspend/resume cycle:

  sudo modprobe -r ast
  sudo modprobe ast
 =20
This a home media server which is updated infrequently, so
I am unable offer any guidance as to when this issue started=20
occurring.

Regards, Cary Garrett



Current environment:

uname -a:
Linux xxxxxx-server 6.8.7-arch1-1 #1 SMP PREEMPT_DYNAMIC Wed, 17 Apr 2024 1=
5:20:28 +0000 x86_64
GNU/Linux

modinfo:
filename:       /lib/modules/6.8.7-arch1-1/kernel/drivers/gpu/drm/ast/ast.k=
o.zst
license:        GPL and additional rights
description:    AST
author:         Dave Airlie
firmware:       ast_dp501_fw.bin
srcversion:     7E39455BCA2D11E968D8B2B
alias:          pci:v00001A03d00002010sv*sd*bc03sc*i*
alias:          pci:v00001A03d00002000sv*sd*bc03sc*i*
depends:        i2c-algo-bit
retpoline:      Y
intree:         Y
name:           ast
vermagic:       6.8.7-arch1-1 SMP preempt mod_unload=20
sig_id:         PKCS#7
signer:         Build time autogenerated kernel key
sig_key:        76:06:C7:84:BC:2F:C6:38:38:61:C1:6F:32:D5:6A:03:88:22:68:1C
sig_hashalgo:   sha512
signature:      30:66:02:31:00:AD:83:EB:D2:9B:91:E6:C3:9B:52:89:51:4B:BB:06=
:
		DE:D7:44:A6:6B:07:92:AA:75:2A:0B:20:26:73:58:09:DF:C3:86:C6:
		FC:B7:D4:13:5F:5D:35:4D:67:89:73:0E:C2:02:31:00:C3:98:99:67:
		B4:74:02:5C:6D:D3:81:13:D4:9F:B4:F4:CF:37:8A:7C:84:8C:73:BF:
		DF:4D:D5:34:B0:0A:CE:0E:59:67:28:98:07:BF:D7:FA:68:B3:37:43:
		02:1C:59:3E
parm:           modeset:Disable/Enable modesetting (int)

lspci:
04:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics =
Family (rev 30) (prog-if
00 [VGA controller])
	DeviceName: Onboard VGA
	Subsystem: Super Micro Computer Inc Device 0804
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR-
FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- <TAbort=
- <MAbort- >SERR-
<PERR- INTx-
	Interrupt: pin A routed to IRQ 16
	Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]
	Region 1: Memory at f7000000 (32-bit, non-prefetchable) [size=3D128K]
	Region 2: I/O ports at d000 [size=3D128]
	Expansion ROM at 000c0000 [virtual] [disabled] [size=3D128K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D375mA PME(D0+,D1+,D2+,D3hot+,D3c=
old+)
		Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [50] MSI: Enable- Count=3D1/4 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Kernel driver in use: ast
	Kernel modules: ast

