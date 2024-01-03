Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF18D82341C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 19:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9D010E14F;
	Wed,  3 Jan 2024 18:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87F010E14F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 18:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1704305307; x=1704910107; i=markus.elfring@web.de;
 bh=LArngLS54n1huul2SQS6WxIz/o3l5P7bbgnYECkKcyU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=lvgN3dZoFgac2Og0zCE/HsjD4fIKJg1sLLc4GH/yoQ8LK0rk4S9JTbegNa9mS47C
 fIeQi5EjYzBPE8csbYYcqKqkmIZefZObenzd8UfK/3b+U9uJtZs1x0F9qIsX52LEX
 de29vkfuB5UAI0Erdi34tGlgGFAIsHG1S8x+rnauoTNZAxxZS8QI2JCT6OPdDWI9M
 bHKKvcLmJlfPeXFsfF5FSd6R7B80LLfcYpiafglDuC2woXmuZgvyP82MBFl3qKf8G
 p2V6CDZydTJQZfQapMcYHNa9FvGXhZTEyGWosG6bjgqStXA+FEuMSCOMqsX02/Shs
 YgCnFivjhS3PNIpKqw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MPrLN-1rYeKm0HbP-00MizZ; Wed, 03
 Jan 2024 19:08:27 +0100
Message-ID: <93cfabee-9692-491c-8d38-dec142e90252@web.de>
Date: Wed, 3 Jan 2024 19:08:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [1/3] drm: property: One function call less in
 drm_property_create() after error detection
Content-Language: en-GB
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
 <9b1e7330-f4f6-47f8-a568-eaea1624bb6f@web.de>
 <37647c33-7f9d-4763-8bf4-cfc5c9a811de@mailbox.org>
 <c5f1a7bf-b444-4934-a205-3c2b3a045ff7@web.de>
 <dd300771-851f-4cfb-b9a2-d87d2b4399aa@mailbox.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <dd300771-851f-4cfb-b9a2-d87d2b4399aa@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A7UpQmI+NpIKUou/f/ZUndvRF+daTR/IPse9QtOowTPKTCot15T
 LQyU8oOcO2qacO1a+GqlMISx99VvbZkbbiI8V9zeVOSPNR7jVbSokXwKk17WsLPxyqT1eOK
 pyX9kaPB17BMfLYKwENquvIoBLFF262QML14cFBm2CHaMzr/8MbBJp16nenXUPk0t1NUHUn
 57wnndBHm/N5t9QG6G7vg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+NqsBawroWE=;t+9FMI+RO+msEDvKFtWJHzPOShr
 X3InvC3DPjzJ6Fpq2UUDHLtWW+jUbRbCDCE+H6xwXC3CG0J6SghC10CpEi/29d8gdMRQ3xCHf
 RzWqfAzpTJZdfkNPjl8hQ+cn/nTBU5unYiFfoBWaESzRtJBMscjBIo94NfzHiYnsB2TzBRXj+
 oEkPDZ/QxyOKIciJ0yRfGqFIj5lX2xdfWLo2HWq2rx/gY/g7aJSIoZcREerqbd9GW55g7X/Y9
 v7bfsOmQh1l6m87RDipdV7YDcwzC3fFY58Z0YzlyFvlyWtrKWFm+pLKBdDwGIwAnh0Qreu7W7
 i9rcXG3fuuXvnZAMRAABMjnVoxeWfP0wPam1GL6Uj0ptZ3PSgug2yDPU1qo66rkYS9LbXKH0w
 sleGRwWVvvOP2rQ/RZb3AeuMUuuGotqXrmPQZtBxgprT3HMYHUWnBjtY5iO2qcMOqEersGX4B
 HQSdDYyoQUGEZWXEXg2CDaWPhzdVWz+L9oPstJA8BhW+4/dIZFXf9u1R79YC+o79ZynXdyLMP
 V3g32e0v1NdBHgn/3oIbs3QJH61c4FsjmJvZs/op6jZwvI+fptURnlJFl+vAZlBEp73W0mAiz
 IO7T6HEtUuYhihDrh8fsZ6CUWe3to6BVALcD7DJ0QMzrGBV8vNusm0584GgcZN7hvH4KZKoBk
 cr4/5DCUrXSpaWORUaMLAPM/81kbj+DRWqtZrV+VDGMwD8drvduFE8716ElCJLwWp3114aXu9
 t63O+CTeZ1HF5H+cMnSdwna3PMaT6d2zsMrR5wquJuAOrN6pZ+gf6ULQGFOhruWSbv8ISunho
 xweksNSh15gnJwlqASxx50KVtKMEwL/4KLj1tFe/U8DWRNsN4sSkd/R4vuBEH++WkYqBwM/qH
 Hxw//y3yCfgYuStCxPMhz6aKQl8vEXADPg089CEgnPikOIy8vnL1J5VBN9xX8VUwENDvw/qhq
 AHCufQ==
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

>>> Out of curiosity, what exactly did Coccinelle report?
>>
>> Some SmPL scripts from my own selection tend to point questionable impl=
ementation details out.
>
> That doesn't answer my question.

It should.


> Without seeing the actual Coccinelle report,

There is no =E2=80=9Cofficial=E2=80=9D report according to the discussed p=
atch which is triggered
by known advices for the application of labels in goto chains.


> I'll assume that it didn't actually call for this change.

Software development opinions are evolving accordingly.

Regards,
Markus
