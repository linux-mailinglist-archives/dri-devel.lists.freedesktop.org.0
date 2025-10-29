Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0219C19CD3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 11:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C3710E785;
	Wed, 29 Oct 2025 10:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="r3xcXqMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10053 seconds by postgrey-1.36 at gabe;
 Wed, 29 Oct 2025 10:41:03 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E19B10E785
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1761734454; x=1762339254; i=markus.elfring@web.de;
 bh=VN3jy0ej5wp7rF03iAgBGIT4XUNT3E9dwbign8XbhBA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=r3xcXqMkwCa7NlYsQQuIxeK0bJi/l6cpt2ZKywi8t2eLTidc221Z5cbDRqGTu17p
 wHhwEint4jqqCDEsufEFkE9tu2t7fc3uUp9o1jE72wNhuRQfD91oL4H5wLmB9P4XF
 aqbq+P2xqHEh+MZBvv6y88GWStiH//b/glNxfI4NVJmCtF4S1SQpZRHE1nI8BNPzD
 3+AZRNlYNWn4lgmJPbkThWWvHhzF52w0ssilKlO/+J5D5TFby2RVX+eIXEyT9rODe
 xUvL3aGdNhIlFHe2SYjg9gQtRQGjV0wu9GBlPDUYRiUxo6xFzm/gWnWoQuhukoUv8
 QnyxJrWkBol5+P0EJA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.249]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N79N8-1wL7Jy0FJc-00xVVo; Wed, 29
 Oct 2025 11:40:54 +0100
Message-ID: <fe8e60ac-5cc9-415a-9b45-563b373e5873@web.de>
Date: Wed, 29 Oct 2025 11:40:42 +0100
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
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <b2cf67a4-6795-d743-e90b-db10f636db2e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1Ff2OmC0XhT58zDiS+G/QReVWAetQ40IgEcRoQzIBSKT9nN3uWa
 g89KonKOP9Hfn231X44nVzV/GPgItSRfjdrSe1Dvvjy8lLB9cuMEDvZr8e9zfogNoouABfw
 9v50LLHhDilfNFhGWJT2lMEFdbxh55mhtZfZBdXX/jLSO1tG5YagC+Uipie6j8UuWRAg5cS
 v+M7RPsO6Yw/HmgLEotSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9CLZy0zzn/k=;nMKfY8bI/oF6Bannb8cCQbx/H3c
 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
 GRIQPK7MYeddbw==
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

> Sorry=C2=A0that=C2=A0I=C2=A0am=C2=A0still=C2=A0a=C2=A0little=C2=A0confus=
ed.

By the way:
How do you think about to move the statement =E2=80=9Ccmd_abo =3D job->cmd=
_bo;=E2=80=9D
behind the applied input parameter validation?
https://elixir.bootlin.com/linux/v6.18-rc3/source/drivers/accel/amdxdna/ai=
e2_ctx.c#L197-L226

Regards,
Markus
