Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412B1C64D56
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B4310E3C6;
	Mon, 17 Nov 2025 15:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="PgBU8UWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D555510E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1763392684; x=1763997484; i=markus.elfring@web.de;
 bh=2W5Rbwxqtq0XX/ZesOB9631VZ2GDsGyw2Vnd98tuWE4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PgBU8UWMHUapoEaBcEFOAMPokRP28jmc8OfvyNFRUAE3ZwCjiNe33AwbLMnQc69k
 OBtymeYT2a8kVyITh9t7PudhTNCGZOBCgWduxXmUqKDWfkkf9glhUJfW6KcsY4pS0
 GMEI//jJaG+VkZeNBlBAySYTz++fnbBzX5mn0XoAwRs9Le3ivMDZPodz0XflBgydO
 RTuhLQm6AbmGpltXwVE0dd4F7P2ncFsz/iCrAjNuviFB7SZ7Tm847Znt9OoFABnW+
 4hoN/If/L9omyEJT7NBeGSPKGFx0UI6OcRbjsoJxwtBNpIZK3Iq1jOc6im2joIXCD
 u83ni5oypeJYo/BI3A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.218]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MSIF2-1vjEtn3Agi-00QqYM; Mon, 17
 Nov 2025 16:18:03 +0100
Message-ID: <1822671a-5f10-43b1-b678-04f47752cd29@web.de>
Date: Mon, 17 Nov 2025 16:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: make24@iscas.ac.cn, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 David Airlie <airlied@gmail.com>, Edmund Dea <edmund.j.dea@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>
References: <20251117075708.37414-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/kmb: Fix error handling in kmb_probe
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251117075708.37414-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OUUHpJXTJ8/RDPKfSJDgjDJ46e2ecf6AeZCclxibDQKGRavmXng
 t6eDvQQde/v/+MSqbIpB5wzVEcCIPB3fWzwCCbe11mu7KWxbUQ+HS3hzeMCOd5YV/HluHJL
 eucwIFd0VkEcnjQxc4OWv05xItxHIOxk18hEo6m2jm0Dmd8IaJl6kNM09VIxosDLUNd2DB4
 x1w0D14rWVn5NO0qHAt2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KIgYaJpVs54=;PsBBNn2VcoOQ8TJLSVKzACU7/93
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

=E2=80=A6
> Add put_device() in all code paths where dsi_pdev is no longer needed,
> including error paths and the normal removal path.

How do you think about to apply the attribute =E2=80=9C__free(put_device)=
=E2=80=9D?
https://elixir.bootlin.com/linux/v6.18-rc5/source/include/linux/device.h#L=
1183

By the way:
I propose to avoid duplicate of_node_put() calls in this function implemen=
tation.


Would it be helpful to append parentheses to the function name in the summ=
ary phrase?

Regards,
Markus
