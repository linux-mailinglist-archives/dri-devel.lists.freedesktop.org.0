Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CBE941F55
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 20:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB0910E0B7;
	Tue, 30 Jul 2024 18:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="G7dD2rog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C877210E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1722363386; x=1722968186; i=markus.elfring@web.de;
 bh=xvaAnFf6R/yIs7ZuTACqMZYriKQLJKKfZREl3DH4mqE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=G7dD2rogPow9g9kNHtx+FatgXeLLjDSKqalVfu+HzQ/sUJeUWB0BvVnEllz1WSr2
 zfskXbn02ej6IpQEQ9fn1E63nviQM8gkzFiRjidCf+akM70CokaymCBn4AHYfMCan
 8rghg2N+x1NtmNNN38BiHxJLuyu4PU0zkp3kcrUhD30bG7ERv1BUKcFUuuBO2w73V
 jz2pWzl/BIJcRL/E5iniMwddzLu2C+wmPUPgrKtBxgyDwx2VXAc7VEnr2oxEAIVIC
 f4EtgtUeeLofhW9kso9/mHcFy+XdeQ8KAdykXmniHdHT23x40cEVQqs8OpxHR3pCR
 8fuKz5deQLWNUNW3PA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgibY-1s36TW24dg-00d2Cu; Tue, 30
 Jul 2024 20:16:26 +0200
Message-ID: <5e96cb21-7b2b-4249-8be6-0822fb375808@web.de>
Date: Tue, 30 Jul 2024 20:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/loongson: Introduce component framework support
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240728152858.346211-1-sui.jingfeng@linux.dev>
 <20240728152858.346211-2-sui.jingfeng@linux.dev>
 <6dbe975a-59eb-4d4b-9fea-b930fa44e4ec@web.de>
 <7b34fb4c-abde-47e8-984b-3ea55d4475a7@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <7b34fb4c-abde-47e8-984b-3ea55d4475a7@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MYmOLp4dbwQVpqQg6VnHfEQ1GBInLKqV3JW0VHK+ykxkegfezWJ
 bQnlvSyPKJ5Br7vWJ7xzio64pzNimUg0UOBbpP6j+QIKIFtf2+4OHvLIHM3hdjLNaaamqRv
 cd8S55ECbTcc7nhwmlfVQXVGAD2xkfcyU6q7XLublLFiB12EsIBgQ/v+9CSQoY4npe9xdu7
 b3Pqf96XI9svT6uifc9Rg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xtAwTzmaKeI=;Lk0GJjW97tsk5e68pLDDGoMUlHp
 YVaLA8fZjAL9MqrMaWJTZspoCu07tMkbolGkYaQcLb/dd34KfjUkzNWsGO4tRmS/f2ZaIc4DY
 PG50THGi79+6UV73PCK4zzrvGoPXin2Mx8Pn4/M+XkXMJYQOlIaHIHIAjJMnchOFtfZPTbSLg
 WO1Sj3IeNcQTgHB1dghC/Tk1b/y3i1w2rpWi7VZJLel2gdSxaGB0j5j6ljlpczh68B3CVoRhP
 askrMKy8chc5ZCeqC0OUFSurUY2yGEaC6O1yeag0xQo8CpoUlmsoKWjkUabhZEJJf4fNYRgGC
 ytMlpkiVG5RcGJSUDwdgvk3/31+dzRkvY3XW94QVerbJraDsIQ/59z6f5Bi38hwfg+Ps+DD2r
 X2HQnCp3JHxehMyRt3PUxXJZzw4SF8BbWnkQjbxauwunLfeHvqHxtg6yRKL3uaXhkKavMguSS
 tJ99wECGkMb2EyALKTyRWo+lrE9Vgr8SoZvAFz7yBcJBNFphfWe29V4yk6de07ijGeCXwW/Xw
 6ny+rR2mworM4zweh8ZHX86voA2Q1iQfrz3Feox+2DeSDkiH8zf+Zf5fPVkRcnffKZiU4mMt+
 yjtrrOubkJZtU1bzB5TisqMdw7stu12oOQaYjfKDF4jfqEB+Q+EfWdp4655f+d/FnDcVCxZXj
 e7e8FPS58+F7lrqll3HiIC8n5g42Ipl+S45d/3SNGYmUaRN+0u63BcwHppoOD+y4R4uRgL4pN
 qS5FldPNIH9a1OXvcOVSGMGBfW4BSTrSE0+Q54mXX9LT86swkKdIMyW39YuiZQA48DJzRCaQs
 fjZ/CbOe+4hXSL7Fyros7utA==
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

>> =E2=80=A6
>>> +++ b/drivers/gpu/drm/loongson/loongson_drv.h
>>> @@ -0,0 +1,108 @@
>> =E2=80=A6
>>> +#ifndef __LOONGSON_DRV_H__
>>> +#define __LOONGSON_DRV_H__
>> =E2=80=A6
>>
>> I suggest to omit leading underscores from such identifiers.
=E2=80=A6
> I suggest add this rules to the checkpatch.pl script,
=E2=80=A6

I hope that you would also like to reduce risks according to undefined beh=
aviour
another bit.
https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+d=
efine+a+reserved+identifier#DCL37C.Donotdeclareordefineareservedidentifier=
-AutomatedDetection

Regards,
Markus
