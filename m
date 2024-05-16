Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D571D8C71A0
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 08:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE28C10E35F;
	Thu, 16 May 2024 06:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="JOFcCl99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD8610E35F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1715840812; x=1716445612; i=markus.elfring@web.de;
 bh=AhiXkddz6p5J2ObTU8vOAMVtgLyhmptM7Fpfrrb0TMk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JOFcCl99H0ff51oT5D0nAzsbXsnIK4c9uCO7EPsqPLPCT/ZKcxOC1y+JUfrs2BKR
 yipgx0OfTmmVkd4NG89wiK6+ysVigUr8ocUc9IMPaJ8H1SKrDJLaweftCLsdjnf6u
 AJ26V2bPx+QqZZZWM+YtTq2WZWUIkUOJ6ODqO77DFFR7m3qpYDT4TFL2xlMqPsU4f
 gMixLSjczZU8BarCrQy8HaqQJ0bNQRaEPukgCc3KTY/L5ur+nHXBfHNvp40US+cFQ
 yzvFQ+ABgf+WpnGYegee3E/1TBl6t/lIUblpc/hW5VimyESFCTmqrcd/N3byTVebV
 ZqtF3g05cVcq+ktkLw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MHEbq-1sKfr239bk-00DEk4; Thu, 16
 May 2024 08:26:52 +0200
Message-ID: <dc34d171-dc47-4817-a6f0-9f23a3afb8e7@web.de>
Date: Thu, 16 May 2024 08:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>
References: <20240513001243.1739336-4-sui.jingfeng@linux.dev>
Subject: Re: [PATCH 3/3] drm/loongson: Refactor lsdc device initialize and the
 output port
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240513001243.1739336-4-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Loziv5bD/koA51c/p3tvL9gE/MpR4TQk+S/VP786GZJ+8WmSCp7
 zTZth7QHAFUuzcwLIngaqOldY208Wkeo+YOoK9oCWbvNxC6tbZXLVdvdCpH28iQQVKltGSD
 vZIm535XdzKoBDaFg+wow82PQvX2tjbHvXorOHeeWour1l6i5JHFUGW1mguq4kAXeWd1Ed7
 EfgWI0VtvZmQm5uJyBp6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gx7SC3to8nQ=;LSmx9V9mEgt0EpEx3IBuuCHPNRJ
 p5swDHeF8XIY2A12qd3gh4b5WP9qrxrGiZp2UD3wuiibHW0G9AJe8N1K6FAALOFtC4VEhISgI
 4PRRE25RWUJvx3QMJ4XlwJjxbxj21iW72sBpK0qZedRKUgOTdee18ei7bawD9hrN74QmJNs4s
 SiyPHIDWjNmiS/GoNJuUZR8DCKirP2HmMs7H3BDfdsmB5JimUsWnS5ZU6WqZvCjpMA845DUrI
 4AUWDqedw0QzQImxEvhyU04XoJoqSQvPsRKOjAzfUkP7GCunTC/KGpuceYX9Yik8bs4ycL2qx
 D+JMIMLvtkfdCToxzlViMHiDpAVTux96T6ylaAhYHTSy4R2iAe1jiJhveiu9cjfkg2GAGfLR2
 39HIVEBenqHas+BcUDL96eXicBKC1pNt9d3tbpeGClm4P86psT4Hx0rioPmkxT5QkFFZUwAhd
 SU7zaYvDWYV83hZ4C+uNtyjVFgIFbNI0pvLELd/b0u2r9FRA7FdSqLPec/albTUQwkRSjkCr8
 0ylUCi9Q+Kf+n0G2uMdmfkqxoenYVzGRfBpeoW3FD2IAEt+bE4DdQ63V91W7kaTFNuCxWDdW4
 EY9of1jpTvZDmq0x4h7dD66YAM08GGmozXwxEsoE0UkLfIdjOPf79suX7npalsa+etENHimqg
 OHOMWaaoKFDYSDGvCJET4wG9tuN41BRb6pDelpcFpLfTSZqcl/ong+sb6z12dmvAZH/guXvqj
 blBgkk3UTO/U+7UW3ReA+S+Nj1+oKVOoLnhazCnP5cSBzPt4a2HNZQ4X7g1auVaqlScNylFbO
 guTCuetUgxDG2sQC3KYvC+WPPwOmC6WcBfTZgDOvEqGWc=
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
> fullfill the implement under the new framework.

fulfil the implementation?

Please improve your change descriptions another bit.

Regards,
Markus
