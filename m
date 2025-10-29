Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15774C1CD4E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 19:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A00610E830;
	Wed, 29 Oct 2025 18:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="CWWcT4WC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4305010E21B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 18:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1761764056; x=1762368856; i=markus.elfring@web.de;
 bh=6TVk6+TU0bslC7OmscDtUb31DXjia0pUFqHx+EgaWw0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=CWWcT4WCqGSjqrfpeT7eNqjjPT+iIaCv8MoPttAiOPmZYUneALfgC1ZhKxCJCA39
 qEOYIe95xwbe6gOqa5veD5SONT7+PeYn+fLsZYzw81FLefHYZXV5KpE2EAdvUgdLE
 Z9Wv/WYU++nux21K6C9uip1yI/SE9ohLlWcjv96vpAqO0hhWv8jHVTwtwXyW796zy
 kakId+PAmNG99J8slrtpyhy8MR7xGk7O959ZianyjUmk0RK1ftzvrPCyj545chF6Q
 4B57EHOpoexYi0qLHCLE3BYOYG45ozwXLoTerr+U2rVGgoqt9JKQxRZJBtTSBDq5Q
 2m0eikGRnz+2Fr2x0g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.249]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2gkf-1vHDa326X9-00BzMZ; Wed, 29
 Oct 2025 19:54:16 +0100
Message-ID: <80fe1dd3-7541-4629-a540-021603d1f150@web.de>
Date: Wed, 29 Oct 2025 19:54:14 +0100
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
 <3dd7e061-8e6f-4d3d-b56c-7005da8197f6@web.de>
 <b2cf67a4-6795-d743-e90b-db10f636db2e@amd.com>
 <6238912a-8733-4b2c-a155-82bb081e6063@web.de>
 <e4c8b7be-588d-b0b7-00ca-e60cbde034a6@amd.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <e4c8b7be-588d-b0b7-00ca-e60cbde034a6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2jJ5bE0O9iVzpbcsUECZgwCwAbyQsP+8A7UmSGQGoBnn05oItRs
 iwHG16Now69Njlv7dd/ziryrAuPMlPbFgPs6xFLdeN+u2m39QMSP3Jrhf6rm8wv88Dcd8mr
 WKMunMGXLMJxicUck1Z72czOHV8+IPV44Z5APIK07w1hHJoeQyysi7DlfFgO8pcj9oInRSR
 myodbWIV4op6QLvFE8zEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X+Qh4MomW3Y=;5+698kBI7amT90j/py+w0kcTus5
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

>> https://elixir.bootlin.com/linux/v6.18-rc3/C/ident/amdxdna_cmd_set_stat=
e
>=20
> Sure. amdxdna_cmd_set_state() updates the return code to command buffer.=
 So application which issues the command will be able to get the return co=
de.
>=20
> The function return value "ret" is used by mailbox receiving kernel thre=
ad to deal with the error.

I miss a clearer answer for the indicated function call incidence.

Can it be helpful to determine the state value before it would be passed t=
o a concrete call?

Regards,
Markus
