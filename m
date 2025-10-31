Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D398AC2623D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4AA10E2E7;
	Fri, 31 Oct 2025 16:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="OJUxfqYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357FD10E2E7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 16:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1761928540; x=1762533340; i=markus.elfring@web.de;
 bh=zQT9e33Ie1C1YcXUwj3H53tygxfdeKU8vAVktJ67J+4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=OJUxfqYCKVXKzNScjZzHmvHdR4irrPDnq+xJcRVionQl6q/oeHL2VzDMkXM7POuY
 evN3YljZC2QQQbPXDMAOWvpUuuvKWUKbZ1DswZsP99sVR6FD7dwOPPCVzycKKM5YK
 gksda6FAiCREBWPQCAV2FSGo38EjZmIDrfAvP+ILoZVteJS/AZN3FUiKZKHN019nt
 rkFBK/cThzACdeH32WbQ9HM4FkFqjOmbfTKcaMhW0PG257h/vG7zg8mda2LJHeTT4
 uleviDrenI7M+w2vYjCpV5XW8QaPLWCJ5f1X+yexrNqs5iCQBBjUmKoItD7g1w1/+
 04hf4zruuAJeIvQoAw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.206]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuF8x-1w6qA505JV-011EGw; Fri, 31
 Oct 2025 17:35:40 +0100
Message-ID: <31f4b885-7576-4422-b110-0ae5ceb34ff6@web.de>
Date: Fri, 31 Oct 2025 17:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use pointer from memcpy() call for assignment
 in copy_partial_exec_reqs()
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <d154d3c4-dd3e-488d-862f-5361867a70f1@web.de>
 <ce252b99-c011-428f-a89a-5792f14c2eaa@oss.qualcomm.com>
 <2dd26f37-7a42-44b3-8902-5c6b5492655a@web.de>
 <04645402-1e62-42cb-a8ff-3e5f8d852ea5@oss.qualcomm.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <04645402-1e62-42cb-a8ff-3e5f8d852ea5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zk+CyFqtlcZ09mQnICdLnqBPVg+04MbhkstEgGA6vIsFHc40Yt3
 v3FKoZ2+qz8LaiLM8h2f0YNSNv0QOAjt9HoGtU83fP03OSM04dQa/DX8LPGbEXIX/JO0z91
 pHWgZyOz3cr22VTnX1BLlDqjACGg9ihVjF3zRJSohOaVfXw4ncwSzxiwTXBghQpeDrGaC6F
 CBEEQGVOGXlXA4GZj40fA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VNn7u0rvCBQ=;p9cZfA2eKwak0tSt7nggoj8+0gP
 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
 rVuHLkjaNjvAYJPh8AgqH9WRFKuXUisQMtAlWl
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

>>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>>> Date: Fri, 31 Oct 2025 11:26:33 +0100
>>>> =E2=80=A6
>>>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>>>
>>> This does not match the address this patch was received from, therefor=
e DCO does not appear to be satisfied.=C2=A0 I cannot accept this.
>>
>> I find such a change rejection questionable.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.18-rc3#n409
>=20
> I received this patch from "Markus Elfring <Markus.Elfring@web.de>".

This can be fine.


> There is no SOB from "Markus Elfring <Markus.Elfring@web.de>" therefore =
"Markus Elfring <Markus.Elfring@web.de>" has not followed the DCO.

Are you aware how author information can be better preserved for patches?


> The resolution to this is either the author and the SOB change to "Marku=
s Elfring <Markus.Elfring@web.de>" or "Markus Elfring <Markus.Elfring@web.=
de>" adds a SOB at the end to show the path the patch took (reference the =
paragraph in the documentation you linked to, starting at line 449).

There are obviously two email addresses which refer to me.

Would you be willing to clarify the proposed change possibility another bi=
t?
(Would another patch variant become relevant for the affected software com=
ponent at all?)

Regards,
Markus
