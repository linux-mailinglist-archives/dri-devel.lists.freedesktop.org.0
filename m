Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16688C16CF2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0B210E13C;
	Tue, 28 Oct 2025 20:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="jLSmkT6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D6710E13C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1761684201; x=1762289001; i=markus.elfring@web.de;
 bh=sOsD9/m7Ajd3Ixk24l7goQfIgBqllLoWAfsAbSZ9yM8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=jLSmkT6SEEUHpDd+BzmxbX69OUKdKw3Em7VNOZBWAD7NgzjuEfzs+APuYWcHZ5bi
 2+sRf9YVphjupg/4MzGKqx/gjI+0jUM7dGNpvpvRmKMC2b4riYA7r5h4sDsHyOnRI
 v3xtQcT8I7xC0fssG6oD8T9M6uk7m4cB0F5POil/ajmiDF7WXh7DMVXKmouZvL+n+
 ANci8RlW9rkysrX9gFT7KoMsIqej7SzUKKIRSyItn0SYGzhMJSEcULyvxzeh+qpAh
 49vhVCGTG/Zy3YKjM/9cvFS4mdCdNbYjou6eG58sh5e7QFnUb8jMkszZPKSXv3Slo
 f464njik0vrJUoHabQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.187]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTvrq-1vepIp2Ec6-00RQ78; Tue, 28
 Oct 2025 21:43:21 +0100
Message-ID: <3dd7e061-8e6f-4d3d-b56c-7005da8197f6@web.de>
Date: Tue, 28 Oct 2025 21:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: accel/amdxdna: Fix incorrect command state for timed out job
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Max Zhen <max.zhen@amd.com>,
 Sonal Santan <sonal.santan@amd.com>
References: <20251028175452.2329497-1-lizhi.hou@amd.com>
 <b7a2ac2a-53c3-49ce-862d-eaba86f0b298@web.de>
 <605e6f4f-8e96-dbe4-d43d-16bcac63f94e@amd.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <605e6f4f-8e96-dbe4-d43d-16bcac63f94e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WCUG5CerxFLlxPag0J3p9+LxvHHkYoDOWwoD6L8MtHCGK4sU0JL
 wd1Y3+5h7rz5U7PxNx+qTX8HDeGdZY43WFCjJVq7tRx2E27JFH0Q2JHfLDXd8Yx5VIVpT0t
 p5xB0O4UyuYO+dAVNAJqs3dG/3FixF9hlDfa6ww5s7KBoeslW9unc6TX0FIcEfl8z/HcXkr
 aJZfeCnA11uh6zzhFmR+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ax4YhNU4mXI=;XvQJmStpYRpf0D6AfbrM+ZeJeZf
 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
 QOw10yQLNNZuJA==
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

>>> When a command times out, mark it as ERT_CMD_STATE_TIMEOUT. Any other
>>> commands that are canceled due to this timeout should be marked as
>>> ERT_CMD_STATE_ABORT.
>> Would it become helpful to use additional labels for the same state set=
tings?
>> https://elixir.bootlin.com/linux/v6.18-rc3/source/drivers/accel/amdxdna=
/aie2_ctx.c#L197-L226
>=20
> I do not fully understand your comment. Could you explain more?

Do you propose to use the same state settings in a few if branches?
How do you think about to avoid duplicate statements accordingly?

Regards,
Markus
