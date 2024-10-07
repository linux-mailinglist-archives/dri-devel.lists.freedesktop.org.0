Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68FC992A5F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 13:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6594210E332;
	Mon,  7 Oct 2024 11:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="HAh/WZuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6705C10E332;
 Mon,  7 Oct 2024 11:41:47 +0000 (UTC)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497BIJnD007103;
 Mon, 7 Oct 2024 11:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
 :subject:date:message-id:content-type:to:cc
 :content-transfer-encoding:mime-version; s=pp1; bh=nNF7VnqBxEo29
 MKADQtdRLRbARsJ4XAjfkKqWI+vbjc=; b=HAh/WZuBIpn34YnemiDYdg8nMV2ad
 7SZFEPQt8TsZK+L84Bvs+uOCLi9BlKqDE0eqBuzGTnF8YT6lEVukJK9zjm2MwgcA
 6kiE1+hwQP3kwK27N4Ye6DecA4+f4cWdSb+HuFshpYxPCwEuO/3g9djKX48346pf
 FMnG5U5GEMM2kGZQMR1B7feA8Uc628fS/nIyKPryK8D2l2BpsDaCh192BLJQkUQp
 CBPKFyzMUExtEnhAo8SNMGP592e7Qh+Wx2VPt6jc8Scf9GYGaCgx2fBwkJrNoVzY
 bU0ipTU1nu9vyeMmNVK61mivvDIrTtlgDk9PAPRfL29PVwWut5qfSdt1g==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 424enc861f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 11:41:36 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 497Bc4JU029871;
 Mon, 7 Oct 2024 11:41:35 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 424enc861a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 11:41:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 497AknUA011521;
 Mon, 7 Oct 2024 11:41:34 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423g5xeecn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 11:41:34 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 497BfX1p26542776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Oct 2024 11:41:33 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A533458050;
 Mon,  7 Oct 2024 11:41:33 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D15058045;
 Mon,  7 Oct 2024 11:41:28 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  7 Oct 2024 11:41:28 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v6 0/5] treewide: Remove I/O port accessors for
 HAS_IOPORT=n
Date: Mon, 07 Oct 2024 13:40:18 +0200
Message-Id: <20241007-b4-has_ioport-v6-0-03f7240da6e5@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
X-B4-Tracking: v=1; b=H4sIAKLIA2cC/x3MTQqAIBBA4avIrBNUxEVXiQh/ppyNikYE4t2Tl
 t/ivQ4NK2GDlXWo+FCjnCbMwsBHmy7kFKZBCaWlEJo7zaNtB+WS682NsN54lAGdgdmUiie9/2/
 bx/gA4nRBSV8AAAA=
X-Change-ID: 20241004-b4-has_ioport-60ac6ce1deb6
To: Brian Cain <bcain@quicinc.com>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-serial@vger.kernel.org,
 linux-arch@vger.kernel.org, Niklas Schnelle <schnelle@linux.ibm.com>,
 Arnd Bergmann <arnd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2835;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=56Zn+untYB/86BUOrMg1tqyRhTgF3l22FcAHs6oZeLk=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGNKZTxzJ15rsYcIWk/KtyKduunlbb7DY2z0v7i99rGKV7
 MvjmbS7o5SFQYyLQVZMkWVRl7PfuoIppnuC+jtg5rAygQxh4OIUgImc2MDw37fU0d9p6dn9aj5n
 Kyb/3/d7avK9f2lZmidWG3uH5vXOdGD4K233t5tt0fPevk+Tp5yVKVSqOjkv5cn+BZY/0v/9fxB
 cxA8A
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Adc5AubR4hKNTwbscHQvyecHJvamlipo
X-Proofpoint-GUID: skSNSjYdfik1WxfIsD7PmOVu7ZXOEQYn
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-07_02,2024-10-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070081
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

Hi All,

This is a follow up in my long running effort of making inb()/outb() and
similar I/O port accessors compile-time optional. After initially
sending this as a treewide series with the latest revision at[0]
we switched to per subsystem series. Now though as we're left with only
5 patches left I'm going back to a single series with Arnd planning
to take this via the the asm-generic tree.

This series may also be viewed for your convenience on my git.kernel.org
tree[1] under the b4/has_ioport branch. As for compile-time vs runtime
see Linus' reply to my first attempt[2].

Thanks,
Niklas

[0] https://lore.kernel.org/all/20230522105049.1467313-1-schnelle@linux.ibm.com/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
[2] https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/

Changes since v5 / per subsystem patches:

drm:
- Add HAS_IOPORT dependency for GMA500
tty: serial:
- Make 8250 PCI driver emit an error message when trying to use devices
  which require I/O ports without CONFIG_HAS_IOPORT (Maciej)
- Use early returns + dead code elimination to skip inb()/outb() uses
  in quirks (Arnd)
- In 8250 PCI driver also handle fintek and moxi quirks
- In 8250 ports code handle um's defined(__i385__) &&
  defined(CONFIG_HAS_IOPORT) case
- Use IS_ENABLED() early return also in is_upf_fourport()
  __always_inline to force constant folding

Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
Niklas Schnelle (5):
      hexagon: Don't select GENERIC_IOMAP without HAS_IOPORT support
      Bluetooth: add HAS_IOPORT dependencies
      drm: handle HAS_IOPORT dependencies
      tty: serial: handle HAS_IOPORT dependencies
      asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n

 arch/hexagon/Kconfig                  |  1 -
 drivers/bluetooth/Kconfig             |  6 ++--
 drivers/gpu/drm/gma500/Kconfig        |  2 +-
 drivers/gpu/drm/qxl/Kconfig           |  1 +
 drivers/gpu/drm/tiny/bochs.c          | 17 ++++++++++
 drivers/gpu/drm/tiny/cirrus.c         |  2 ++
 drivers/gpu/drm/xe/Kconfig            |  2 +-
 drivers/tty/Kconfig                   |  4 +--
 drivers/tty/serial/8250/8250_early.c  |  4 +++
 drivers/tty/serial/8250/8250_pci.c    | 49 +++++++++++++++++++++++++++-
 drivers/tty/serial/8250/8250_pcilib.c |  4 +++
 drivers/tty/serial/8250/8250_port.c   | 47 +++++++++++++++++++++------
 drivers/tty/serial/8250/Kconfig       |  4 +--
 drivers/tty/serial/Kconfig            |  2 +-
 include/asm-generic/io.h              | 60 +++++++++++++++++++++++++++++++++++
 15 files changed, 183 insertions(+), 22 deletions(-)
---
base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
change-id: 20241004-b4-has_ioport-60ac6ce1deb6

Best regards,
-- 
Niklas Schnelle

