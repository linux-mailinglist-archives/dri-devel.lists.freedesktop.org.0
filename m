Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AECD0D2A7
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 08:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5F410E066;
	Sat, 10 Jan 2026 07:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="NbXy+FWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5870210E066;
 Sat, 10 Jan 2026 07:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1768029629; x=1768634429; i=markus.elfring@web.de;
 bh=u93xdEl/geOXvRqFzG0XF76EuEnfsitrG7DmzWEsw1g=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NbXy+FWmE5yStGw2p0l4DMxh4KOU/wTyJWbVg+bNP4iZqVPg6pxY6elhebQ82gHz
 Yo9ph5fiHKxf0Lr7VGMyznIjL6v4bkNGXc/UprQiKN4n4OFYPsjVyISLU8AEaUc7H
 b/sntAscmxdx0PHDZwm99CmrpKyml3zmzV19tXQDYEUplnbkmJgWbL5xve6rXCbS9
 sq6B+i5wJlbomiHs2CCIiOvxo9GjX4/A59NKTABUR/I0ZKtW2Zm5nx2zeYPqcC9uK
 tRbOb/2HfxrusA346CXtq6UJGIb9za3Zz5UIUp8JgpyGPt75GLRb8nuMaq3qt1TPC
 DhjLT3N26nyR4ppD9w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.231]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7xaT-1vrgis0jcB-00wYTm; Sat, 10
 Jan 2026 08:20:29 +0100
Message-ID: <f1c4457a-14d1-4b99-95f8-da23968d59f6@web.de>
Date: Sat, 10 Jan 2026 08:20:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm/amdkfd: fix a memory leak in device_queue_manager_init()
To: =?UTF-8?Q?Felix_K=C3=BChling?= <felix.kuehling@amd.com>,
 Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Oak Zeng <ozeng@amd.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260106015731.1906738-1-lihaoxiang@isrc.iscas.ac.cn>
 <57a9f219-2612-4a64-a9fb-44b04e09ec15@web.de>
 <cc24a955-f5b2-43e6-a4fd-ff446d699fce@amd.com>
 <e76fc27b-0742-4685-96e6-f6000bd62fa8@web.de>
 <dc26748a-3ef4-4b7c-9772-8dd7a7f03364@amd.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <dc26748a-3ef4-4b7c-9772-8dd7a7f03364@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S6NWz6ZVh5nr89qaWkQu2zlDs7YAwIXoXWSl2I/elJgQ8DF+JRp
 sFBFvB8fCJYX5/6nQFmysf7HA3kWpwA95CV2GpDBPbdCa6QGZH/gS8nL+rYUQwzNgfRSRVU
 sSSKfs/wygtBjTB32dlybJUi9woPMJa4JdXj+a9EmVsR5B4FhCECBMLZjJpj3hYcNwHoVgG
 qiBuUQqjoZazFOXSLfXTw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ozbFW73gydo=;1PopX7eR9mKy7S/a/g7TfsNQCGF
 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
 G3m89WjI=
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

>>> But=C2=A0it's=C2=A0also=C2=A0harmless.
>> How=C2=A0do=C2=A0you=C2=A0think=C2=A0about=C2=A0to=C2=A0avoid=C2=A0spec=
ial=C2=A0development=C2=A0concerns=C2=A0here?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/coding-style.rst?h=3Dv6.19-rc4#n1242
>=20
> No. I think the WARN is used exactly as it was meant to be here: to chec=
k=C2=A0for=C2=A0something=C2=A0that=C2=A0should=C2=A0never=C2=A0happen.

Do we stumble on another target conflict at such a source code place?

Would you like to avoid undefined behaviour here?
https://wiki.sei.cmu.edu/confluence/spaces/c/pages/87152449/EXP34-C.+Do+no=
t+dereference+null+pointers

Regards,
Markus
