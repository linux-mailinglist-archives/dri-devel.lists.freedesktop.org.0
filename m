Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D01DB249EB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 14:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D72710E706;
	Wed, 13 Aug 2025 12:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="QSQGjY6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF0810E705;
 Wed, 13 Aug 2025 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1755089783; x=1755694583; i=markus.elfring@web.de;
 bh=YR2cHwG48vaURaVjOPfvmrAbBp+BMlsqQCBiWbcpSQw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QSQGjY6hv+/rBkP/FISd9eh57KWT4p/SCkIyGGQEALhiX/ulIaRN4xDKFE6uoPfG
 EQPxXVK0CTE7f0BS+QkesAOTOQbFGcROKbT/IRaZ1HB5zfnuXc+B91P3I+084Y0nq
 MU3Y69D8q7ML5KZ0fyb7syoWzg+nPg63X/euYlL0wC5G1gvqB/vdDbP2n6s4RYLZ9
 YWEBPF5tmI33kfeK7Y3YrbjvxPnhmWxJheRpJAln96VUghZhhdehZ57tLLONrX0x7
 ZLp2Dbl1CvINCbIIVFHT312FwIst8ADIr9uHicoVaCpgLiiZ1TszGnm/cLuAA973Q
 uBI4a/hGjrUuX4uqpw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.246]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MFayw-1uns6b2pxu-00DbtI; Wed, 13
 Aug 2025 14:56:23 +0200
Message-ID: <20728678-45f4-4d43-8921-b938e9e50c63@web.de>
Date: Wed, 13 Aug 2025 14:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qianfeng Rong <rongqianfeng@vivo.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>
References: <20250811091910.404659-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250811091910.404659-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qe+GLFrtjMifw1HRe/kX/7RlZN0P07tMYfZuNtQBWTYPwDwSM21
 wI+tA/EpfnijAgw1yiUfF2XiRKneZBsx1TLPorAeu7etR86js8YRpcpEDKeEAiUHImxpRCL
 7ej9AbonkTm59X7eN9usBtRvGB7dkdRhx+KW/CXYLU0+AbQ0heharQhSHDZGptxLAjWCBcD
 cGNefLDLRos6dwrqo1jbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jzydcbVKG1E=;t9cPCu3/oN1U3/wY9uluLHThBrc
 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
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

> Replace =E2=80=A6

Is there a need to adjust also the following statement combination?
https://elixir.bootlin.com/linux/v6.16/source/drivers/gpu/drm/nouveau/nvkm=
/subdev/gsp/rm/r535/rpc.c#L312-L314

=E2=80=A6
		kvfree(info.gsp_rpc_buf);
		info.gsp_rpc_buf =3D NULL;
		return buf;
=E2=80=A6

Regards,
Markus
