Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AA0896C7D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BB71129A6;
	Wed,  3 Apr 2024 10:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="j+A7gdKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA2D1129B0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712140322;
 bh=QCQv4SlWwu4pTHP3KZHi48pp2atYllgOS/M1veC+SRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j+A7gdKsl4qbgkvz+dyY3uNMPiP+lPeH6p0M1oF1lRq1mpjO3WCmazIKjjkN6bhL/
 5ERyifQx+RvukIa94tQyJAFDavIFOyWKyIxiJTtu5GrsuOrt7XuWPr/daII/5bNq77
 Dhp/6VnS9KMKqpCYgdrk36d0R/mNDxsNPe7CxPGT4PCjTu0Gb2nCAJRMuR1+ksTn2q
 tegKHEzdkez05aQPFbDvu+R9/rbTm5XE4M0oID3vsRN/YKxG2JAonOdVri52rO9p53
 XsqFt1p3A6CXr+mKJyC+SQPg2WiTT7hxffUXtEejvOx/ajWKWCKTv39KA8BpTj1MAM
 3KLcFDBfNWhQA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 25BD93780624;
 Wed,  3 Apr 2024 10:32:02 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v2 00/12] Remove cl in struct cmdq_pkt
Date: Wed,  3 Apr 2024 12:31:57 +0200
Message-ID: <171213938049.123698.15573779837703602591.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Feb 2024 15:41:08 +0000, Chun-Kuang Hu wrote:
> cl in struct cmdq_pkt is used to store struct cmdq_client, but every client
> driver has the struct cmdq_client information, so it's not necessary to
> store struct cmdq_client in struct cmdq_pkt. Because mailbox maintainer
> do not like to mix mailbox patch with other patches in a series, so
> mailbox patch [1] would be sent independently.
> 
> Changes in v2:
> 1. Fix typo of CMDQ_JUMP_RELATIVE
> 2. Refine cmdq_pkt_create() and cmdq_pkt_destroy()
> 3. Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
> 4. Add cmdq_pkt_jump_rel() helper function
> 5. drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
> 6. mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
> 7. mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy()
> 
> [...]

Applied to v6.9-next/soc, thanks!

[01/12] soc: mediatek: cmdq: Fix typo of CMDQ_JUMP_RELATIVE
        commit: 7349d4bdee457715308e6229a674f4cebf42be92
[02/12] soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()
        commit: e24e0ff0871b8e3287f258b76b82238b64714628
[03/12] soc: mediatek: cmdq: Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
        commit: 8a8bcf23b3e0ab333bfc827ea7ed2f9bece9bea8
[04/12] soc: mediatek: cmdq: Add cmdq_pkt_jump_rel() helper function
        commit: 78462e312e63c5bc0859934d9457155fb50da2e1
[05/12] soc: mediatek: cmdq: Add cmdq_pkt_eoc() helper function
        commit: cad76fa0221c3f8e656b56b7673ae752a65108d8
[06/12] soc: mediatek: cmdq: Remove cmdq_pkt_flush_async() helper function
        commit: 3e2b3be190ace43841011ec0bec950a28a012601
[07/12] soc: mediatek: cmdq: Refine cmdq_pkt_create() and cmdq_pkt_destroy()
        commit: 62d2fb402b132e52899f52b4d5f150fd1dfd1895

Cheers,
Angelo

