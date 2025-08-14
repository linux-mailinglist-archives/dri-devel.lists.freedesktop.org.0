Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8289CB26591
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 14:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E948F10E1AE;
	Thu, 14 Aug 2025 12:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="wap323aK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C007910E1AE
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1755175270; x=1755780070; i=markus.elfring@web.de;
 bh=zVL13W91ocOwAPeHUMt2LWTdLAX5fEeuHpuxlt97lXE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=wap323aKlqZ+NvA96ZnmoF0y6Prh/3w2GIQLJZYZpw9wczNbVjD7n8YDUUh5ZRB5
 5yxxgtpimJQlQ/b8lXWrlGmIw9tEVXUZUuzEEfIIbX2wI7H6+pbQxaT5gFTtJ/CWO
 WvhYj4huHdfn4w7/J5OB8lpggQpYhQaJ60ayTden0Jzi5CjZDvTdqvyuiFu60nRmS
 Dsjav9rbbQX9bsdzE2NcNIRr+tMdmNL4P6pPcfBCY+qbWgaZaMu/jLGMjmSoBR+JI
 f7k7NScUeNLVUs/pGCfABBLUfzxdkJo4xElla9Fo/xD+qkt0W4RHjROuNbKyysh5M
 0PY0D856PwJQhq4c7Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.224]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N943B-1uYKOY3nol-015OjR; Thu, 14
 Aug 2025 14:41:09 +0200
Message-ID: <a11bd516-7ebb-4865-9e19-394ee4a5be37@web.de>
Date: Thu, 14 Aug 2025 14:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qianfeng Rong <rongqianfeng@vivo.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>
References: <20250813125412.96178-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH v2] drm/nouveau/gsp: fix mismatched alloc/free for
 kvmalloc()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250813125412.96178-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q+Ts1dLlJAnV62t7pc6QjAw+wAOIlhGEdmT/q2NUMTyS9H71FuW
 Zn8ZeIfX+Sadmqp9VbNreciASR725YvKtZeneLOYDwlBhB6XgIXSFFI65Zsd492YSVwtkaJ
 9K+O3nJ/XAs2B2OnN8vWXvKBQ6q6XgH61bCZCDwTcy3UjtCpAZe0fWZGqTzcvODqWErNkzc
 YzEYuL0oACltYDwD+LXZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wTv+xNWwUfU=;xEgkJYHE4hSq9dzvVoJzSMVMjj5
 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
 PJI1Qrjwz2c70TLQ=
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

> Replace kfree() with kvfree() for memory allocated by kvmalloc().

* Would you like to improve the exception handling by using another goto c=
hain?

* How do you think about to increase the application of scope-based resour=
ce management?
  https://elixir.bootlin.com/linux/v6.16/source/include/linux/slab.h#L1081


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
