Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6329930D6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 17:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F3A10E3C5;
	Mon,  7 Oct 2024 15:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ckWnGuHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97F710E3C5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 15:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1728313977; x=1728918777; i=markus.elfring@web.de;
 bh=XNt8PiHSRhGOiAe8aOruShDn2RME9MmrXhLIkyUnMzM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ckWnGuHtnv3IpM55KrFLYzxF29UAtZfhL8g71qavPkkAaJsEY5w1NvYdZ2C65ZiB
 tKWUdwtRrhXp1kKzMw6jcT6BfFe9cuMTG+VGKApbHTd2qryzAcZZMrQknLy+h4ShG
 BSELoTls79wocpEpqEofbIQncphwv8ZCTudh7bRMvsl/F89OEYLUQjaGM4ekS8u/U
 sb996rvdPvcKcQm/QAoFN5mWP8Rrs5A3n5DNG18t6hA0EIwhwlmujN1/LrV1dFk+g
 EWm5ws921nGiDvqrQXZnK5F6r/o7vMBTjhfN51eY1QuYtDJ41KkBLaPOUFCvemjao
 qjGeQ1eySDD4aXtTbg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQxsD-1tK1EM2k2p-00ObJM; Mon, 07
 Oct 2024 17:12:57 +0200
Message-ID: <0fd2ab9e-66f7-44bc-915e-2a5c2d52d511@web.de>
Date: Mon, 7 Oct 2024 17:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Adam Thiede <me@adamthiede.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>
References: <20241007070101.23263-2-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v9 1/5] drm/mediatek: ovl: Fix XRGB format breakage for
 blend_modes unsupported SoCs
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241007070101.23263-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7Ba8zBh6CcOHXB4RQMIGo0IzFQsQS+XJ52yqKm/QjZ/OaWqf4cn
 Civ4p1nJVkQGwGnIf7wGGzD70wZfDfvbyVxQTzmdjXlzu1fTfEWu8TegRsuYfdHVSwkgh0N
 u3vG1L3sqnf+vHHmazZKnCPEGLwiF1sQbm0Rwn5kWHrHs54fjyEOkQJOdOy4YDCGv+F5ErM
 yR0Zaf16vNRcHG1WjrnZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NoyAAvXeFxE=;3AyKjdVXmM17V36gSbpC/Mgn84i
 GaFke1AWEV/mZ22ie5au+YVcwE0CsgarP21NqsWWnV24gLj3ADcXt3tt3X38XbfG/idcZu3+u
 j1PLb3p4TeE4A44s54kjF4na/ANddJRaCTA5ly8GuLIoWPsm72hm6BpbC29AkeIOmpceh1gjr
 MFnWO3vEf0NBFw1XudvKOPr7UeyzaHC/3InlEhSt5o63UoorPwRgiXHHb0kwE2LG0bVf+u18A
 JNMPTR/vY4YvOCdRqhlhOZ5aj7YvK1FVY7fno1t1eEcEJvbYMgSBziFS3IZZX7aTZMQp607Pb
 aR0jH44EZ6gPBXrEtW1j5l7N+tPdO1R2rIB7jSB6SLR31cKy2pgy34u0Lq/40C7ruMaqDIwRQ
 qX0wg8X/jAO0qIBJi+6wTRAvlVIjDxphbBMSp1G0bfq+CisLpgOYZIjGqiWPHEy6yEiW0vzUY
 gllKsvkRGvTntQL2hBPvXfj8Vc+2Oj5m9Z9Ubn4m0IOvo1n0YjYNmLH1xeqrFwZI2oTC5LGak
 Cen/42hJXsnw+jFwc39swZt8H1IP9eDcgLsdzISq00BStOEQkPLfJP/M2oCeAsBhbGc3x+g2Y
 Fjb2TSdrg6GqWgqS4jLWWxop96ezkV0dYx81UcZGlPqzR/z1xyqWqWO8gIqd25EBHgtnfQINF
 qdRDqUYLFjH3TvA4IlM53ViihwlS0UBePv0IUVhRuJvET4TW9HgFOPqLnUNaVl4EMpl27oZOP
 2ZvNoKzqdZTA5+ZmNRrNqIZAmhD61Pf6qabCWuMgGsAl20rLpwiVZHHkzGUZd4Bs9kLzm1dPk
 5TG1bQSGyyqcy8mFGzvmwi2g==
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

=E2=80=A6
> Make the constatnt alpha only enable when having a vliad blend_mode or
=E2=80=A6

Another wording suggestion:
Enable the constant alpha channel only when having a valid blending mode?


=E2=80=A6
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Does a dot really belong to this personal name?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc2#n396

Regards,
Markus
