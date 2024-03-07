Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F26C87552E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 18:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8348310E873;
	Thu,  7 Mar 2024 17:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dJmSa48x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3C310E873
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 17:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yjv33NnLtrKGXvU8im2Fiysp5cKmGpJjJLOeYzsCHSo=; b=dJmSa48xx/KGtJQYUHKXAHww0I
 2TpS6y7zmFtLxSOUg2wuvbbyMnofWM1qtRlKmrvzCtF+igxzMHaZ/vc6TQmxQGJ052ked0oZd2YQ4
 ENCSOyuIjz9g10Ks3o6oP/sk5j0S59BGjSHBg5+fFuO4C0mwLkL0u6zxtvh/gX92XKlorY7581l8J
 nVttOiWGIzoQyoPUBlvhEx5EaYIERG8v3f5EkOZStNR+s9uMJmf7WYDq+mQMoSSDNODhnSDU21kAW
 zWULxlayCTTF8PFPqoIIjeeAuRanMl4pJhMUDsdhk1iMJwQDFV/uiQ/27zpQBMwdbV2wD9PPotijG
 BZVfQcJA==;
Received: from [177.62.247.190] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1riHZN-007MWj-6r; Thu, 07 Mar 2024 18:30:13 +0100
Message-ID: <0f8e9c87-ab40-fe49-da2c-fdcfdc9deeae@igalia.com>
Date: Thu, 7 Mar 2024 14:30:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC] How to test panic handlers, without crashing the kernel
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Michael Kelley <mhklinux@outlook.com>,
 John Ogness <john.ogness@linutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Lukas Wunner <lukas@wunner.de>,
 Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <266579a9-fde6-40ff-b13d-fb2312db406c@redhat.com>
 <87edcpn1l3.fsf@jogness.linutronix.de>
 <15015345-3068-2fb8-aa38-f32acf27e1d0@igalia.com>
 <SN6PR02MB4157AF2E765F7ED3B9487351D4222@SN6PR02MB4157.namprd02.prod.outlook.com>
 <d1d2093c-72a3-4f64-9a8f-9844dc38f0c5@redhat.com>
 <3d0c4180-aa6d-4519-d6d8-8f16b98587dc@igalia.com>
 <adeac189-87f8-4b70-9c04-3eaaf2ed7bc5@redhat.com>
Content-Language: en-US
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <adeac189-87f8-4b70-9c04-3eaaf2ed7bc5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 07/03/2024 14:22, Jocelyn Falempe wrote:
> [...]
> 
> For drm_panic, I changed the way the debugfs is calling the drm_panic 
> functions in the last version:
> https://patchwork.freedesktop.org/patch/581845/?series=122244&rev=9
> 
> It doesn't use the panic notifier list, but create a file for each plane 
> of each device directly.
> It allows to test the panic handler, not in a real panic condition, but 
> that's still better than nothing.
> 

Nice! Seems a very good idea, at least as a first step to unblock the
work you're doing.

Thanks again for the effort, much appreciated =)
