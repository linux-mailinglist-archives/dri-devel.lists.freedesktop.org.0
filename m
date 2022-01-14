Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FD048E7CD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 10:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFAC10E174;
	Fri, 14 Jan 2022 09:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF98B10E1FA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 09:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642153712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ifGmTPTgfXrlPutnDjAfl+ozqbpclK2L/+RRVNOS1bM=;
 b=V2HSK/6jJYuwLnT67+Y/Iyo8YyIU9TlMOjJcVSn2eYFBzRflPQecTugwtYDElbzU25n605
 HLGNLCMafoOWm0tNQmWGO2+kIcRjfQSGuvqj6r6BEkcsxb+w9rrofjUpD2TTXzhlP0W04f
 FDLpxjrLakQgDwp2HH7yG0NO/4qoBKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-AdI7kpEOM-ilSbqh3ei3VQ-1; Fri, 14 Jan 2022 04:48:31 -0500
X-MC-Unique: AdI7kpEOM-ilSbqh3ei3VQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42730180CBFB;
 Fri, 14 Jan 2022 09:48:30 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4EFA7B9C6;
 Fri, 14 Jan 2022 09:48:28 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: mgag200 fix memmapsl configuration in GCTL6 register
Date: Fri, 14 Jan 2022 10:47:53 +0100
Message-Id: <20220114094754.522401-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: michel@daenzer.net, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On some server with MGA G200e (rev 42), booting with Legacy BIOS,
The hardware hangs when using kdump and kexec into the kdump kernel.
This happens when the uncompress code tries to write "Decompressing Linux"
to the VGA Console.

It can be reproduced by writing to the VGA console (0xB8000) after 
booting to graphic mode, it generates the following error:

kernel:NMI: PCI system error (SERR) for reason a0 on CPU 0.
kernel:Dazed and confused, but trying to continue

The root cause is a bad configuration of the MGA GCTL6 register

According to the GCTL6 register documentation:

bit 0 is gcgrmode:
    0: Enables alpha mode, and the character generator addressing system is activated.
    1: Enables graphics mode, and the character addressing system is not used.

bit 1 is chainodd even:
    0: The A0 signal of the memory address bus is used during system memory
    addressing.
    1: Allows A0 to be replaced by either the A16 signal of the system address (if
    memmapsl is ‘00’), or by the hpgoddev (MISC<5>, odd/even page select) field,
    described on page 3-294).

bit 3-2 are memmapsl:
    Memory map select bits 1 and 0. VGA.
    These bits select where the video memory is mapped, as shown below:
        00 => A0000h - BFFFFh
        01 => A0000h - AFFFFh
        10 => B0000h - B7FFFh
        11 => B8000h - BFFFFh

bit 7-4 are reserved.

Current driver code set it to 0x05 => memmapsl to b01 => 0xA0000
but on x86, the VGA console is at 0xB8000
arch/x86/boot/compressed/misc.c define vidmem to 0xb8000 in extract_kernel()
so it's better to configure it to b11
Thus changing the value 0x05 to 0x0d

If some other architectures require the VGA memory to be at 0xA0000, I can
write another patch which won't change the memmapsl bits, (so assuming the
BIOS or UEFI already set it to the right value).
Another solution would be to set it to 0x0d only on x86.

Let me know what you think is the best way to fix it.

