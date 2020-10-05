Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F0128423D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 23:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C0989B05;
	Mon,  5 Oct 2020 21:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 741 seconds by postgrey-1.36 at gabe;
 Mon, 05 Oct 2020 21:43:51 UTC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FE189B05
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 21:43:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095LVPwt084258;
 Mon, 5 Oct 2020 16:31:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601933485;
 bh=ML9frnLI+k0f/LQx+ylDTQ0Nzzw0d5Nm8GNYXNG5hOI=;
 h=Date:From:To:CC:Subject;
 b=YpwtULBy6cY6hdsTDmp462PIIjFH+JHmLb2HkE5c1IX4pOsN+k0/4P6zO6l8fLS5W
 Sco6FtkLMu3qRvOjBJn1MON0A4MHTcdi6NkVP9MrAINLHRi4MIwnhdxrlhaW2HiSzO
 P4ccqRugGbC0CEeEYuZIWjhOgfetyXaSpyrlliA8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095LVPnf038754
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Oct 2020 16:31:25 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 16:31:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 16:31:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095LVOY1053382;
 Mon, 5 Oct 2020 16:31:24 -0500
Date: Tue, 6 Oct 2020 03:01:23 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: drm: Supporting new connector model in tidss
Message-ID: <20201005213123.o4qtfazrnexgjq7p@NiksLab>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I am trying to convert the upstream tidss drm driver to new
connector model.
The connector is getting created by the tidss driver and bridges are
attached with flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
Here are some questions, regarding this:

1) Most of the info regarding bus_format and bus flags is coming from
the bridges. Is it okay to not populate connector->display_info with
bus_format and flags?

2) The "drm_atomic_bridge_chain_select_bus_fmts" does the format
negotiation. So is it okay for the encoder to simply pick the bus_format
from the first bridge's state?

3) What is the meaning of MEDIA_BUS_FMT_FIXED? Does it mean that the
bridge does not change the format from input to output?

4) The bus_flags are available in bridge->timings->input_bus_flags and
also in bridge_state->input_bus_cfg.flags. Which one should be used?

Regards,
Nikhil D
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
