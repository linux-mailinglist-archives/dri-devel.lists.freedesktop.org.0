Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F824A59409
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C0D10E412;
	Mon, 10 Mar 2025 12:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ChXJnTat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2132D10E412;
 Mon, 10 Mar 2025 12:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1741609077; x=1742213877; i=markus.elfring@web.de;
 bh=2tw3alwm60ny/fP6jFcsFJLqPkGHkgwJRPku5I/wZ4A=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ChXJnTat4TVo2ThVOTmQaalnnS23CPXY0QcqtXHYCOe1wTxbD+4rZPEigkubEKEu
 t1PQ6lo24RKwEXGtgr0F2fLhH8M3TFwNptGuz1J6Uekv3FDlvJhwfyBddXCdetF7n
 KMNFkV3V5S8EY+7Rj9S96jbA1CBfVCcMQTNNP80y8XjN01+uiFV/9F15jYFUyOPmU
 Ryg55oczzSIZzvfD5NfSatc7DCzphnZ+0w7Ba4f7S4OnomYZphhR9VBYodw0z3VPA
 YtXvWrcJSu6T/zRj6RwDDkjQm53MO3zuf6q+ucNsd9m6KUyJxWDwszLkbeJIrHy2o
 J1F3KWNSmXhWyIXt4A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.82]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjgXH-1tOdFG3JhD-00okj6; Mon, 10
 Mar 2025 13:17:57 +0100
Message-ID: <6f01f71b-284b-4841-bda9-a3934cb4efc8@web.de>
Date: Mon, 10 Mar 2025 13:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
References: <20250309095525.7738-1-qasdev00@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: reorder pointer operations after sanity
 checks to avoid NULL deref
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250309095525.7738-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lX4SIjOmammwLZH318S5lMgZQ2ZBxYPFrDIDt1pXOyV/U0uVq7E
 Z7zc04UG9WpoVUqiIP0mIXCzL/uLaCh8CoO9UGUUqkycLxpyqJ4qrBHI6dx1tFMs85B7KrP
 ttX8Mf3ItqtAVsxRB2C8ZV1eTemquESG2A5IGjkVe8UhJ5i06XkzMMvMpnbWPvZpTytTUfB
 y+lOk9lMq/HAJjlXtxjSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3LAlbRlWX8c=;aoZA2x/JnIUoXzfHy169i3CcSh4
 juaLuFj1kn4e/q6Pp+rwTzXzlsFblSZX2PRALGX2V8kmHKUMMu1kMszDvxF+/sK5JdKN0Hk7B
 Ov+ze3gM4c/08LaxNSSbZHdOAUrAER9lmqSyqN5cHHRUJGhVcoLcgTjHBX/fbSyWhDjimMCUc
 4U2G8Dn7lujcMvRpwwr6GgI+k79Wclr/6swVcDb29n6eEeDYD7X/1ouVs4SOUe9Q/TvM9PdC+
 W0Ekg1rNXwH0ED+X3KKz2z3iJqbS0Yrpv/yXP6FNFPuNHTEYctSgaY7n/vosIYwEC/jZNfbYW
 c6EvzlUjYWyUmQDRIeNFzrmgSIyvzSnIsuKSxsMXfgoZ6EYdYpAxohJZBXkhs8lC+ql9nYiTn
 0ZhT2jt2eUj1ZqxJAiwAF+TpIyZ7R5kYaj1mdVGkguc0sqVgjbnqsWV/tbgBFO1T8aZHnDlZc
 HgKr+tWrBKp2mt9F2nb2hHk0O5CsKwBXj4w0hthVA+Rx3lvZXdE5lCliQb87NfNqgNZxN8/o9
 d/VbxKsdZOUFQXniZM/24vajblAYg71TtP8kh/WDHh302rdVF0hi+DmVXotpFBcznolvVjHvA
 XOrbpmbULwbDLnh+PvNhQf2leBUgvG2aVeif/nHMMLBxh78pj/72SSTG6VCpivxV+cfZ1o1m8
 0S/qeO52eI1nHga2FAlDQvtPqp2HAMreOZvxxfxBw/iYBVgZIlA39GjJRYB6DCTtAS9D5MbTm
 T/7AgNkRHkO0jJ2fJ/p880LF0NS6RyUPGYIWEpec3QkBuB1bwPmD0QnaxWi6OBxRJ4Q01PBYL
 3ctoCjJhjvqrq8HhXGw9pt0W8q9x1xR+vaQ5WBYKJKqr8pc/1FgxxoMzcG9D+gV/HJ9QJ7IJL
 NLoYlcIU1YqsYu54Ne0eQcZAF/2JIdPAJa+XG2KLNZjErnwGeIIt2rM2JxeYdg3N3naI5/bC4
 r+Hgu518Gm1Z9A1tx5eNEukaDQWzTFJaidvE6MWDim7CPewLscvrXtRYe+h1euQfUGmM3U634
 iGdBWO2VxQMT0EdbKrg7XbjF2Bk8v8CBf2YYlsETkOHPXHrUWgb0XHdJK2himgkJV+gGUoAOF
 CkMCCDFPKaTVxEHf51laNOhAw9FtcZf4Vg8R3Ex9jYqjlFY1GTw11ZJ7kAiU2sQ+wYv7KW0GQ
 3Q1bMq9Y21dFQT8JHTllbZiqWxVavYtvPKSHBSZDmVLXjr8mONg7/jKzqIEBDl+WNueJ5Wzmf
 Nc57GujbE6AtnAw2fS19QT3OZTZXFZadsnhYj9xGuBRKou97sMZ3TMSbwJN/99zSYYsntdbEw
 U6VXdYEECvF5/6QcmSKzJFmQHp49Wulrb8GEn1aoR1202E+ETXmUtM2NKvp2d/plnq1ZtYN/9
 0FzQD7hvu6hNqkJR9sQrX5js1UKZRHTQxM+0zsspTttV69Rc/SDz6x/IEqR9QQxl3pVhMzz0L
 PaWLaVrjZJEeNRlZ8q/856xiIaxM=
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
> Fix this by reordering the dereference after the sanity checks.

Can another wording approach (like the following) be more appropriate?

  Thus move the assignment of the variable =E2=80=9Cdpu_enc=E2=80=9D behin=
d =E2=80=A6


Would an other summary phrase become nicer?

Regards,
Markus
