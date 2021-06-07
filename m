Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA0B39D775
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 10:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627F56E875;
	Mon,  7 Jun 2021 08:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21C0A6E875
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 08:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 13AAF20201B;
 Mon,  7 Jun 2021 10:32:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id zVO_89yUebqg; Mon,  7 Jun 2021 10:32:34 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id CCDC220201A;
 Mon,  7 Jun 2021 10:32:34 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1lqAgT-000RkF-HB; Mon, 07 Jun 2021 10:32:33 +0200
To: Sichem Zhou <sichem.zh@gmail.com>
References: <CAJeZQfg5fq8B7iVu6Wga+aM015o_ViiSUcJxAEtDE9-GXxgSOw@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [QUESTION] drmModeAtomicCommit returns -EINVAL on return
Message-ID: <820078f3-1adf-d561-1772-f63de6d46ed6@daenzer.net>
Date: Mon, 7 Jun 2021 10:32:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAJeZQfg5fq8B7iVu6Wga+aM015o_ViiSUcJxAEtDE9-GXxgSOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-05 6:06 a.m., Sichem Zhou wrote:
> 
> 1. Is there any way to debug when the functions like drmModeSetCrtc,
> drmModePageFlip and drmModeAtomicCommit returns non zero, besides
> getting the errno?

Enable appropriate debugging bits in /sys/module/drm/parameters/debug, reproduce problem, (disable debugging bits again), check dmesg.


> 4. Do I need to wait for vblank for modesetting? I know it will be an
> error if I tried to do drmModePageFlip before the last one is handled
> but what about drmModeSetCrtc? Do I need to wait for a vblank for the
> last pageflip?

Right now, if you don't wait for any pending page flip to complete before 
drmModeSetCrtc, the two may race, and the CRTC may end up scanning out from the FB set by the page flip.

Maybe this race should be prevented in the kernel though.

There's no need to wait for vblank.


I have to defer to others for your other questions.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
