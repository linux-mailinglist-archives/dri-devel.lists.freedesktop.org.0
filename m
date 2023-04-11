Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 909166DDC6A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 15:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F2B10E355;
	Tue, 11 Apr 2023 13:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C993D10E355;
 Tue, 11 Apr 2023 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681220572; i=markus.elfring@web.de;
 bh=OgaLLOQi3BLhTZK7PXXmygRTTkKNgw64HGqUqvj1wCI=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
 b=tUMzmmTI1st/xbVtse2EplbW74uz3t6inOCFOEszggyuD6hBerpT7oG7ITRpvVGM9
 qnU82q/OD8x+pFYX5McTqzwg50cIns2B7qTuhpcStDvR14mjIN2wMdzwLWR3b/qDsk
 g12u2b0QPUWOxKq+6VFLoqeUaflpm0UKRgLrEMqbio725PNRP9f0yrgR93liBrMA6m
 spNgNoxSzBmEpHMrDLOuU2hVPKOIDc7gjxgG5mJGWjhZGoQj5Q0+8reJrIUcZa7DFb
 9QsQlmz2UL8iagH1LvhfzsHujpBFqcYhCvBwAW00YzH1vHsFnfRiwA+o6FshSL1mGk
 FdVtz5MGjgAhw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M43KW-1pmEAw1S6a-000RFh; Tue, 11
 Apr 2023 15:36:46 +0200
Message-ID: <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
Date: Tue, 11 Apr 2023 15:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 0/5] drm/amd: Adjustments for three function implementations
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alan Liu <HaoPing.Liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Candice Li <candice.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Tom Rix <trix@redhat.com>, Victor Zhao <Victor.Zhao@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Zhan Liu <zhan.liu@amd.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Language: en-GB
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Wsv7nBnFp1BYjqo/ByyaPrBnKZPriMlSmoRCWlDHk0on2YSaRs8
 4cMs4oUIBAwmnnWXpHtRTHBSJi8QMKFcHU7avEDVgcbe0s3aEu6GupXXHhCePuqY9pdFjnS
 a3wIAMsbpUVnfSNoUATeoayKxFqUNwe9TpTbGlf3KmopmSSS3rXdhXAvfVqZzUDcM9XChah
 PbP8tgwGn68yzSPB/hATA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dG+teEJQyng=;9iP0F3ryAgH9PP87giDU1FkTcpV
 sYzTGspTxfg2QovIbQu6yOmrs91xRwJUtaIuo3yjoYXG5Pdux8eeza4J01JNLkY0E1Xo1wzzm
 RHPM+7WW9Hm023ZBADN/iYJSCIpM4pz0pwAAx0kCIYbwa+JbvhDCjzi6XXkBiOi54TlQiCilx
 8dqG4aRiPfBnQXRc7TcY2L6qNiSgPlTKnpLGa204txnulTU670oXB8licxJ0qzA10ZkThpwJl
 LRgQEkjuhISUPZKIpvyYfjBzHYcSvB7sLa2J2ba0JTnmpnNz1n3gFYhNuhKacaEWKC/1JlpFf
 4AfeaDnTvdPnM0FDqR8jKNiGlGv+M+vPVfa3/PLRnTsvuVuVkEnTZttr+0v81ghPMJtmZOn61
 o7yrayWPjyG9mhr9BrkiRTCBeXMR6J1S0XuwRv8eADte8uqgWDNsHVR80xnRGspGpbWsll6eW
 V4sQ1KeUBZWbp7NJB/LhZVymOLnpER9Fn6SjAKUf253/2RUNpXLiqEz/VWj5DuRodSgYKVMZH
 k05DYGVmBE4LvN5bo8OS7pAP8QrXioeSFR8S5VSQ3BZQQz5OAn+A9uPhdEjCZ5vOSV4s3B552
 mCVNq2rZ5yg9Phufgr6cqnipJO3tgzm6MckpmXaRVhw8QLKxdB2s2M85azIsYg6ZvXrej46L2
 RoIg9Jj/mVWNL/O2m1ZJDAXzsSRdWri270y4MsIvPvI2j5Wh8WO4N3F6Yvg4AIQkVoTniTb9F
 iP8Pj0EtwVR7v/2pVqS03pz5F/9Bgd0+JxoLdZiPyCuBl2i8ShDnLRLBdgjy7RMfw3qC/YCky
 kdv9eOl4C6+fAM2isUAZyyp5oMUwTWaN+UAhVyh+tZA1cer4CMflVZjXmfG3O/ZGRD7CPGJkK
 XtMNOi7TomIUlX6yVwr7wls5uycOjMKQSmE5iJzqzbJ9kATvZAw+RYAKR
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Tue, 11 Apr 2023 14:36:36 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (5)
  amdgpu: Move a variable assignment behind a null pointer check in amdgpu=
_ras_interrupt_dispatch()
  display: Move three variable assignments behind condition checks in trig=
ger_hotplug()
  display: Delete three unnecessary variable initialisations in trigger_ho=
tplug()
  display: Delete a redundant statement in trigger_hotplug()
  display: Move an expression into a return statement in dcn201_link_encod=
er_create()

 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |  3 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 19 ++++++++++---------
 .../amd/display/dc/dcn201/dcn201_resource.c   |  4 +---
 3 files changed, 13 insertions(+), 13 deletions(-)

=2D-
2.40.0

