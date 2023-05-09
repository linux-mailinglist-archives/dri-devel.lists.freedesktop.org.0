Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DD86FC3C3
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 12:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A116D10E049;
	Tue,  9 May 2023 10:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CDD10E049
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683627757; x=1715163757;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/lraKqVud+Y3XL1/i0MpoYITTWxO91ArKJtJkacLWys=;
 b=Gx8wOC8Cp9qiu9C8ysfgU2z2v972g85TPtpMnxW9zGg94DZ12JFkfjoT
 eJT+Gcl0dWppNf07gHl4WCwTXGMa2e/lWpZypKMiEPcxmtlnEmyaJOBvB
 81b+1x/t2sNqMa0vvMFDY6e8bB2sNdzQYhR5ToBWx2SXnXw9SvI3pN92x
 PxBf7urc+B8oO8r0ORsm4czhUlUNkFnmmFfHszuVct9BgTtDnVDaiWIIc
 GohKUP9wSVQAgAFAo1JJhnNjdV1R7fyTMlSrk8RgNfQ8va4kq+rtkRrcs
 EgmVaSFaVlj4MNEZbhbnxgs+4D02TzfsB/iJhL9phiSEjUgXbtoHL2bW+ Q==;
X-IronPort-AV: E=Sophos;i="5.99,261,1677538800"; d="scan'208";a="30800953"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 09 May 2023 12:22:34 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 09 May 2023 12:22:34 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 09 May 2023 12:22:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683627754; x=1715163754;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/lraKqVud+Y3XL1/i0MpoYITTWxO91ArKJtJkacLWys=;
 b=CGkRVyK6XUk6QIQvFt92A4wtMOG/3aHuuZcMD1COjfMkRGr0EsM5BVCa
 fL5PcxTBaoF/vpZkIY9W7ulWf2KmS1eoO0zrRPJf/W6E86evfNL6az25P
 g7P7PwR2KTTSLJ95OylyCCQu/e18x92o1U4midGKH5VXyaCAmj5Hw2M+8
 w3LX4n89PMk9+IKJX4G/wn0hIHaChz+vm/JxKu3FHk7/A/oGDu57weRRq
 25yaK6CZ2zVGnM2cTu2oiRffo/mP9pWHYncv3x63vHU/Wk1GFHtcdVvFl
 sHJQcZRhCZVlF3bPK/jsEE62b3RRlgdZCdkIxU6gP14Zvg54EZ3CDjmBT A==;
X-IronPort-AV: E=Sophos;i="5.99,261,1677538800"; d="scan'208";a="30800952"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 09 May 2023 12:22:34 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E43B1280056
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 12:22:33 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
Subject: MIPI-DSI: LP-11 before atomic_pre_enable?
Date: Tue, 09 May 2023 12:22:33 +0200
Message-ID: <1854583.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

after .IMX8M[MNP] support for samsung-dsim has been integrated into next, I=
'm=20
trying add support for the MIPI-DSI-to-DP bridge (TC358767) on my TQMa8MPxL/
MBa8MPxL board (imx8mp-tqma8mpql-mba8mpxl.dts).
Both, DSI host and device, probe and attach successfully.
But once lcdif is probing and tries to get modes from display I run into=20
timeouts on the aux channel. Specifically AUX_TIMEOUT is set in DP0_AUXSTAT=
US=20
after the transfer has been issued.
I've been told that for aux channel to be actually usable the clock line (a=
nd=20
D0?) has to be in LP-11. Register 0x218 (DSI_LANESTATUS1) of tc358867 is se=
t=20
to 0x1c which indicates that clock and data lane 0 are not in stop state,=20
while data lanes 1 to 3 are.
Is there a way to explicitly set a DSI host into LP-11 state before the=20
pipeline is enabled? Reading DPCD is used to get the modes needed for=20
configuring the pipeline.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


