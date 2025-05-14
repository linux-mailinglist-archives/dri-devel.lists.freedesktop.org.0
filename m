Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370EBAB6F35
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADF910E66A;
	Wed, 14 May 2025 15:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="OFks2jKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6396710E67D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 15:11:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747235515; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gHhgKGMkINZRwkgtvPyk7jl+9+RGKYKOEPFZv2RmZTVwaACphhcVCC4jjsquEeM3tPfi0fxzhuqSuhcJOln237TkZbdRISVe4Due47hUcFGvZ1rpJRnUF1rdiUVx6cFdr7X/G1kpANpDXVBm+V6WbfjRUGni5g7yPfIhVW0zzBg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747235515;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=IdbOwjzl/dP/AJG9zsxUggZZiS2o7tTH2Q9ix44y1bE=; 
 b=DUl7lFdEgUN46ClmYZ3l+pphcP7iNwyhNr3dJUITnhermZH4T983bhXrMgN5dMI8kYuUypM1Y1+E3ur9N11+/tf30rsrs232n5SUVxMnv1f3EfKfkzQv+Kn3VXlXOKQUICLtne0Sr/OnlFMg7HFy82f49MfVpO888iarx7l67Us=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747235515; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=IdbOwjzl/dP/AJG9zsxUggZZiS2o7tTH2Q9ix44y1bE=;
 b=OFks2jKqEggHamUz8URxK49Mq+GHBoNdHzWDr27XEcFzFYnkKDcfTgw1C/a3YUmQ
 otK836el/bXN0V+DlmmcLb0Ymnsj6g0d97Knza5LgskdrBQc6AYJ70HAMewzxBh6Sj1
 ecMfZx52qu332qHg0Vqk2d8iwibmVXo5FMDdJ9Us=
Received: by mx.zohomail.com with SMTPS id 1747235514529417.96970363160244;
 Wed, 14 May 2025 08:11:54 -0700 (PDT)
Message-ID: <ae1c2cb0-af29-4dfc-b2d8-224a44a7c6f7@collabora.com>
Date: Wed, 14 May 2025 18:11:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Virtio-GPU suspend and resume
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20250418232949.1032604-1-dongwon.kim@intel.com>
 <7f334c99-fe86-4e53-86d6-e8473c76ff3e@collabora.com>
 <PH8PR11MB6879A6238EAD527704B8C994FA8E2@PH8PR11MB6879.namprd11.prod.outlook.com>
 <28584e91-6320-431d-afae-9f10e1eca86d@collabora.com>
 <PH8PR11MB68792B11430CF12E9B7A525CFA96A@PH8PR11MB6879.namprd11.prod.outlook.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <PH8PR11MB68792B11430CF12E9B7A525CFA96A@PH8PR11MB6879.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 5/13/25 22:23, Kim, Dongwon wrote:
> Hi Dmitry,
> 
> Can you share some details about your test setup?
> How do I replicate the problem you saw? And is "suspend and resume" working by default in your case?

My testing setup:

- QEMU staging tree
- Guest kernel 6.14.6 + your patches
- Using "-serial mon:stdio -device virtio-vga -display gtk" in QEMU cmdline

I'm booting guest into VT and running "rtcwake -mmem -s5" from serial
console. On resume from suspend I see those driver error messages.
Without your patches there are no errors.

After resume from suspend display not working in both cases with/without
your patches.

-- 
Best regards,
Dmitry
