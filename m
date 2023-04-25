Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B76EEF5D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 09:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D6510E8E9;
	Wed, 26 Apr 2023 07:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxout1.internetbrands.com (mxout1.internetbrands.com
 [98.158.192.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F1F10E2DD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 23:39:53 +0000 (UTC)
Received: from la1-kvm184.internetbrands.com (unknown [10.16.82.5])
 by mxout1.internetbrands.com (Postfix) with ESMTP id 937416737444;
 Tue, 25 Apr 2023 16:39:52 -0700 (PDT)
From: kernel@linuxace.com
To: tzimmermann@suse.de
Subject: RE: [PATCH 07/14] drm/mgag200: Replace simple-KMS with regular atomic
 helpers
Date: Tue, 25 Apr 2023 16:39:52 -0700
Message-Id: <20230425233952.5618-1-kernel@linuxace.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
References: <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Apr 2023 07:36:59 +0000
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
Cc: kernel@linuxace.com, jfalempe@redhat.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm not sure if this information is useful, but we have found one system which
works with the 6.1 kernel.  I grabbed the lspci output from a working and
non-working system, pasted below.  Same kernel and same distro.  

BAD Dell R815 AMD
0a:03.0 VGA compatible controller: Matrox Electronics Systems Ltd. MGA G200eW
        WPCM450 (rev 0a) (prog-if 00 [VGA controller])
       DeviceName: Embedded Video                           
       Subsystem: Dell Device 0444
       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
       Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
       Latency: 32 (4000ns min, 8000ns max), Cache Line Size: 64 bytes
       Interrupt: pin A routed to IRQ 5
       NUMA node: 0
       IOMMU group: 10
       Region 0: Memory at ec800000 (32-bit, prefetchable) [size=8M]
       Region 1: Memory at ef7fc000 (32-bit, non-prefetchable) [size=16K]
       Region 2: Memory at ee800000 (32-bit, non-prefetchable) [size=8M]
       Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
       Capabilities: [dc] Power Management version 1
               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
00: 2b 10 32 05 07 00 90 02 0a 00 00 03 10 20 00 00
10: 08 00 80 ec 00 c0 7f ef 00 00 80 ee 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 28 10 44 04
30: 00 00 00 00 dc 00 00 00 00 00 00 00 05 01 10 20

GOOD Dell R710 INTEL
0a:03.0 VGA compatible controller: Matrox Electronics Systems Ltd. MGA G200eW
        WPCM450 (rev 0a) (prog-if 00 [VGA controller])
       DeviceName: Embedded Video                           
       Subsystem: Dell PowerEdge R710 MGA G200eW WPCM450
       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
       Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
       Latency: 32 (4000ns min, 8000ns max), Cache Line Size: 64 bytes
       Interrupt: pin A routed to IRQ 10
       Region 0: Memory at d5000000 (32-bit, prefetchable) [size=8M]
       Region 1: Memory at deffc000 (32-bit, non-prefetchable) [size=16K]
       Region 2: Memory at df000000 (32-bit, non-prefetchable) [size=8M]
       Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
       Capabilities: [dc] Power Management version 1
               Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
00: 2b 10 32 05 07 00 90 02 0a 00 00 03 10 20 00 00
10: 08 00 00 d5 00 c0 ff de 00 00 00 df 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 28 10 35 02
30: 00 00 00 00 dc 00 00 00 00 00 00 00 0a 01 10 20

Phil
