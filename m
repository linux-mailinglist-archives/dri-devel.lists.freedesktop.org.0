Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A63371221
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 09:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6426E87E;
	Mon,  3 May 2021 07:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9706E87E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nSFrq9lFNWpRXzhrsu3gsuZbrC0Z5T4HsqbZmtnN6XU=; b=aUU/LAkqBwnF9EP0SXMakNM6Yf
 tAhiaQx7mu5dsxYzlhtFXnhF572BAXHSfv6Ib7iKoHljuyQx6bAQPs4t5T7A+bxofmi8d2cOu7vRQ
 KZEJ/JOkBrV3FH0W/ANhn5Mu4ByeCW0Uyyjqys9619oU1P8OS7oFcSM9/DHqusCkPZNNcp1gXXzUu
 tWIqnit648rtZLIXM3MpXUEqe9rU6GrlnEsw9kyodcaHBUlKCZClZWjctu3PcITd4N2j5ZaVeQCPV
 HEqEubPGW/r8jqquAJ1a90L0BGQT8eU1M7NnFsl4iP0tgijR7emA4xz0pstaw60rQ0CQefULnJ+Th
 RLyblc+Q==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:35770
 helo=localhost.localdomain)
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <primoz.fiser@norik.com>)
 id 1ldTHk-002Lfp-Qd; Mon, 03 May 2021 09:46:40 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: l.stach@pengutronix.de
Subject: Re: [PATCH 2/2] drm/etnaviv: use CMA area to compute linear window
 offset if possible
Date: Mon,  3 May 2021 09:46:40 +0200
Message-Id: <20210503074640.3412988-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20190529104312.27835-2-l.stach@pengutronix.de>
References: <20190529104312.27835-2-l.stach@pengutronix.de>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: thesven73@gmail.com, s.riedmueller@phytec.de, y.bas@phytec.de,
 s.mueller-klieser@phytec.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 linux-mm@kvack.org, huyue2@yulong.com, mina86@mina86.com,
 kernel@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 akpm@linux-foundation.org, dvyukov@google.com, m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

what happened to these patches? In thread "[REGRESSION] drm/etnaviv: command
buffer outside valid memory window" [1] it was mentioned these got "shot
down" due to layering violations, but no official correspondence has been
found? Is is due to exporting symbols from mm/cma.c in [1/2] and why is this
an issue?

We are still affected by issue these patches tried to address and we are
interested in getting the solution into mainline.

Patches were integrated (small fix required due to renamed include file header)
and tested on latest master with PHYTEC's 2GiB phyCORE SoM and cma=256M kernel
cmdline parameter.

Without patches:

[    7.892954] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
[    7.901286] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
[    7.909809] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops)
[    7.915775] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[    7.924000] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    7.930615] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[    7.936934] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[    7.948600] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on minor 1
[   16.656092] etnaviv etnaviv: command buffer outside valid memory window
[   16.695777] etnaviv etnaviv: command buffer outside valid memory window
[   16.765654] etnaviv etnaviv: command buffer outside valid memory window
[   16.800111] etnaviv etnaviv: command buffer outside valid memory window

NOTE: See "command buffer outside valid memory window" errors when trying to
use GPU.

With patches:

[    7.708159] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
[    7.716095] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
[    7.724257] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops)
[    7.730205] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[    7.738407] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    7.745039] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[    7.751365] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[    7.762876] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on minor 1

NOTE: No errors, GPU fully functional!

In the end, it looks like we are not the only ones with the same issues as
patch "drm/etnaviv: optionally set gpu linear window to cma area"  that
addresses the same issue was submitted by Sven Van Asbroeck (see [2]). 
Unfortunately, his solution was also not accepted.

Please advise what would be the best solution implementation and how to
proceed in this case?

BR,
Primoz

[1] https://lists.freedesktop.org/archives/dri-devel/2019-June/223516.html

[2] https://lore.kernel.org/dri-devel/20190619183856.467-1-TheSven73@gmail.com/

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
