Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B29B17348F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 10:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596C36EEBB;
	Fri, 28 Feb 2020 09:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152306EEBB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 09:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 235CF3F8DF;
 Fri, 28 Feb 2020 10:54:59 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="mQelTzZK";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AnuRIWrZjNLw; Fri, 28 Feb 2020 10:54:58 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 97ECF3F447;
 Fri, 28 Feb 2020 10:54:55 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id CF44B3600E5;
 Fri, 28 Feb 2020 10:54:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1582883694; bh=tqp6+K9mkAPpbwQi+jsZKLI5SGUmSp5Ve+vQDquuiMU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mQelTzZKfbo2tgQqhKUHfndb2RD0o2tObYs69vboraOahh7loZU5rJsft3sMv2uEv
 v/ADgf3PykPJwmoWFpjmKHkmqucFFlF40qIOKBFywOmyZmPZ9J4xAxuADX+zDpKTlQ
 X7iYWW49jjTk+7fudHxvrkp6HZYEpCvbgP3+k5Ic=
Subject: Re: [PATCH v5 1/3] drm/shmem: add support for per object caching
 flags.
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200226154752.24328-1-kraxel@redhat.com>
 <20200226154752.24328-2-kraxel@redhat.com>
 <f1afba4b-9c06-48a3-42c7-046695947e91@shipmail.org>
 <20200227075321.ki74hfjpnsqv2yx2@sirius.home.kraxel.org>
 <41ca197c-136a-75d8-b269-801db44d4cba@shipmail.org>
 <20200227105643.h4klc3ybhpwv2l3x@sirius.home.kraxel.org>
 <68a05ace-40bc-76d6-5464-2c96328874b9@shipmail.org>
 <20200227132137.irruicvlkxpdo3so@sirius.home.kraxel.org>
 <78eb099e-020f-91d1-672e-15176bf12cd4@shipmail.org>
 <20200228094903.g7yf73mtnbjyu4ez@sirius.home.kraxel.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <99eea905-db5c-4e07-7b93-6de3482e02f7@shipmail.org>
Date: Fri, 28 Feb 2020 10:54:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200228094903.g7yf73mtnbjyu4ez@sirius.home.kraxel.org>
Content-Language: en-US
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
Cc: Guillaume.Gardet@arm.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, yuq825@gmail.com, tzimmermann@suse.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/28/20 10:49 AM, Gerd Hoffmann wrote:
>    Hi,
>
>>> Not clue about the others (lima, tiny, panfrost, v3d).  Maybe they use
>>> write-combine just because this is what they got by default from
>>> drm_gem_mmap_obj().  Maybe they actually need that.  Trying to Cc:
>>> maintainters (and drop stable@).
>>> virtio-gpu needs it, otherwise the host can't show the virtual display.
>>> cirrus bounces everything via blits to vram, so it should be ok without
>>> decrypted.  I guess that implies we should make decrypted configurable.
>> Decrypted here is clearly incorrect and violates the SEV spec, regardless of
>> a config option.
>>
>> The only correct way is currently to use dma_alloc_coherent() and
>> mmap_coherent() to allocate decrypted memory and then use the
>> pgprot_decrypted flag.
> Hmm, virtio-gpu uses the dma api to allow the host access the gem
> object.  So I think I have to correct the statement above, if I
> understands things correctly the dma api will use (properly allocated)
> decrypted bounce buffers and the virtio-gpu shmem objects don't need
> pgprot_decrypted mappings.

Yes, that sounds more correct. I wonder whether the "pgprot_decrypted()" 
perhaps remains from mapping VRAM gem buffers...

/Thomas


>
> That leaves the question what to do about pgprot_writecombine().  Any
> comments from the driver maintainers (see first paragraph)?
>
> cheers,
>    Gerd


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
