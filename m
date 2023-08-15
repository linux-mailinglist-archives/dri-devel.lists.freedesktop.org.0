Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D825D77CB64
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 12:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A7410E165;
	Tue, 15 Aug 2023 10:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB42210E243
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1692097164; x=1723633164;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cD8sRQO/Alm70YD3ArFOeYgfNjVWHlaBckW8OgwbufE=;
 b=koSRtZ1yLAbAe943D5sDKhBzRPQMirySPdhYMSbkZ7F6o8SVgewIIll2
 Mg51+PwYz30SBoKUtgakcC5VMdbKN/oPBX27dC28dwxWj/ZKPBX1ib0Wn
 CwVzoLZGhI2zd25hJBOehadypGsHvbLzJW4MRYUV8EZCEnw7CUo1myYz0
 Uimskg3cv6K2m0BGK9PP+/emegF2bkWOLwSB9YefNSoeuXfMKWBJY4PvU
 b4LLS55yxxMM+Lk08oZ7piI/WXbGqVIxhsVT9QVpwpcAod3UFCUEdn43a
 k6EELx4TR7mNmJbvhqwCLRjWCrkKCE5G81LHCKmAKDYhLGANBqEoigGOx w==;
X-IronPort-AV: E=Sophos;i="6.01,174,1684792800"; d="scan'208";a="32451671"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 15 Aug 2023 12:59:21 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4A992280075
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:59:21 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
Subject: drm_connector_state without drm_atomic_state possible?
Date: Tue, 15 Aug 2023 12:59:20 +0200
Message-ID: <2296388.ElGaqSPkdT@steina-w>
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

I'm currently trying to get the TC9595 (tc358767.c) running on my imx93=20
platform. For probing the EDID/DPCD information I need to put the DSI lanes=
=20
into LP-11 (stop) state.
=46or this I was trying to call drm_atomic_bridge_chain_pre_enable() inside=
=20
tc_connector_get_modes(), if bridge is not enabled not enabled yet. Please=
=20
refer to [1] why pre_enable has to be called.

But at that point connector->state->state is NULL, while connector->state h=
as=20
some state. Thus drm_atomic_bridge_call_pre_enable(), called from=20
drm_atomic_bridge_chain_pre_enable(), does nothing.

But this seems bogus to me, how can the backpointer to drm_atomic_state be=
=20
NULL if the drm_connector_state from drm_connector is still valid?

Maybe I do not fully grasp the data organization and lifetime to it's fulle=
st=20
yet. Maybe someone has a suggestion how to pre_enable the bridge chain whil=
e=20
get_modes is called.

Thanks and best regards,
Alexander

[1] https://lore.kernel.org/all/20221205173328.1395350-7-dave.stevenson@ras=
pberrypi.com/
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


