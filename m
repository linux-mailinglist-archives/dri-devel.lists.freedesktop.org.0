Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80161B2BC45
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 10:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD5010E12F;
	Tue, 19 Aug 2025 08:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="p67bTx3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A12210E12F;
 Tue, 19 Aug 2025 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1755593728; x=1756198528; i=markus.elfring@web.de;
 bh=1m93s4Gvcyqku9IbOydbUqMoNQ5hL1gcJinNcVxTYIk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=p67bTx3ZbV/aVXPdOBV19/zUDWD8n0XxY/OCEGw2PheiKwZcrSKH2h6E5deLeVhP
 BBBTz0QvBparRhuoE50zOdaozAXhG0LMfHG1P55ReU/+T8kzr8FytHBAsFavSyABs
 17xsbsVFfDe2q70UNC05NNr5vdGRuH5ckZCBbSvwM4zsT/DOimuwRq2Rkm21KnBrP
 0J24vnMu/+jU+FnyHUT9rJaSPQJmky8BacekGg80QqVOblPmenbLg6EDL0k74xf5z
 LZZacgZwbafSPw61lHXvg9CsGBuKZaCSFTH+LNr4pbr4md2BP8MkopGnb0b6m3503
 NH53IFwgh0SGE666DQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.248]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MqqTV-1uB3ZZ0ijR-00kak7; Tue, 19
 Aug 2025 10:55:28 +0200
Message-ID: <bbe3a13f-9eb8-490d-a618-19001ae69fb4@web.de>
Date: Tue, 19 Aug 2025 10:55:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Lijo Lazar <lijo.lazar@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250819082524.526572-1-liaoyuanhong@vivo.com>
Subject: Re: [PATCH] drm/amdgpu/fence: Remove redundant 0 value initialization
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250819082524.526572-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:BiTV0aTLTJkG4QfTj2/HLRZLxULfB8pR1w70AGlhpTqdrNldYBY
 kGNnQN1b6mCr5vPePOL70vevFB+NDTJ5Bl8eZKjPJF5KaToqriZLSMDDSsuxtzyAubmN05J
 uDdIgmd3VQBn5oWvE0WPdD/SUn5bZe6R0VZuv/ZRIOfH/hQdTp8c/Za5rKXu0nfc8IGokAz
 L3FcyiQNUQMxi31LZGH5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b6cUntlS6Fk=;Jlfv/w8soEbZK98JRaXLA0c+vKH
 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
 eZTxUTkYs2scWrnURo5WQMMUpmRV7lH56rY8V
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

> The amdgpu_fence struct is already zeroed by kzalloc(). It's redundant to
> initialize am_fence->context to 0.

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc2#n94

Regards,
Markus
