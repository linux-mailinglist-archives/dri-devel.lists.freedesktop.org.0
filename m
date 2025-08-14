Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE51BB25BBA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 08:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCF510E125;
	Thu, 14 Aug 2025 06:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="XFsU9rOh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F7910E125
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1755152381; x=1755757181; i=markus.elfring@web.de;
 bh=dkXFOVtKNI21Dx8zQrVRNgj44PMQKR+Ep4pir8zV+fo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=XFsU9rOhiwoWxv8LvgZTflJEU+fUPSyQ6NFBv97Jz3A/PmdXe2SvNpqNvHJen25n
 Ew9UCmZ+AS2Wb2NKAg/W3foUjqlWRlkM0x7l/pV7H2jlOeGFumu509HKX3bSLwQ8m
 FOUofHSecV0KqaLYFnsiZm9cYd6TJMfU2PfA+cDgkfxcviPvUYk8aKZUm+oKfR/Np
 IB47fyYCq3e+9kCzm9EtiJfAFzwF9NMHo/dhB9Ood2WNYhWMpXzaaA8cLx5jqy8eG
 tZbUDQG+PzJGBbEzOLkC9WJImt4DVFpi/14fez5dcB1fmLkDf97qFU+t7NfB8Bk/v
 nvbaXceQhTKwAk1I6A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.224]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MGQGH-1unCNc3Hw5-00ARR6; Thu, 14
 Aug 2025 08:19:41 +0200
Message-ID: <1ea4b4f2-99cc-40f6-b369-c6c4746705c4@web.de>
Date: Thu, 14 Aug 2025 08:19:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: accel/rocket: Fix usages of kfree() and sizeof()
To: Brigham Campbell <me@brighamcampbell.com>,
 dri-devel@lists.freedesktop.org, lkp@intel.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall
 <julia.lawall@inria.fr>, Oded Gabbay <ogabbay@kernel.org>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
References: <20250813-rocket-free-fix-v1-1-51f00a7a1271@brighamcampbell.com>
 <65769f0a-af9f-4e96-93d4-8594e76d8e73@web.de>
 <DC1UJQKMO63Z.1ZLS5VS0OXZAE@brighamcampbell.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <DC1UJQKMO63Z.1ZLS5VS0OXZAE@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:m0N0IqqCvQQawbnD06H7Su0xoGeTSpf3E2qGklQwk/khHIK4urE
 As89PjxImSl8+Mjv07W1ZZWhT89DwTBrp6TSzYaqYaoS0uhOj5ciE8LvDQvboHP03UZZMO5
 xRLMBq8zSrZGRlORBou1Y0MNsuKE6Kva+nmd4Qg6rmbDQ8NH0PXGqkWTuuKrixgjWXUTCr6
 u0z17o/i63BRjvbWcxh4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q396eo0uxWA=;1vpGYYYWKeX/X4JQfuPOfzdkkdI
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

> I had considered splitting it into two patches, but the changes were so
> minor that I figured it wasn't worth it. Please let me know if you
> prefer separate patches and I'll gladly prep another revision.

You can distinguish mentioned change possibilities better also according to
their severity, can't you?

Regards,
Markus
