Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C822F470271
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 15:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DACA10E879;
	Fri, 10 Dec 2021 14:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C8310E87B;
 Fri, 10 Dec 2021 14:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
 :Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5yk3PMdMrly9uoExh+OEJE1DOXMyGVLKP7rSdgJVNZ0=; b=CYBEqPPI/qPh3lyUNsyrrYX2Nv
 lqhMQ6zLZOAdDzQm21vf9mkn3VErM30Lm62X5Q/f5on8aVDl7RwqADEhQT/p+AbIe07hul7Ow1YBB
 isrQ1H5dgyFsX8UHAX0SL/jKR8q7f4ZWMMBZrG19OOVqh1ZKB71ebEmulfFhy4B0ZLQXT4NNe7cwt
 acfoPnjkWqahpSAWTL+5Rky6isDgycmQmr3L7JeCpVBipGYMzf+XCcQonc25sd7+oqth/Bhr1WG3Y
 c6/QfxSyP6PDRC3P30k/H5OshUQdXWB5yKqgqWjfWxv1hJku4llANmXorT9ePwzkqm+o95hRRT6M8
 fAx27O+A==;
Received: from [177.103.99.151] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1mvgZv-0000a6-Oc; Fri, 10 Dec 2021 15:08:52 +0100
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexdeucher@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
 <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
 <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
 <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
 <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
 <6d3c7acf-a23f-3073-56ed-375ccb8cc815@suse.de>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Message-ID: <99b38881-8c63-de04-50f8-aa4119b52b25@igalia.com>
Date: Fri, 10 Dec 2021 11:08:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6d3c7acf-a23f-3073-56ed-375ccb8cc815@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 xinhui pan <Xinhui.Pan@amd.com>, Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>,
 kernel@gpiccoli.net, kexec@lists.infradead.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, pjones@redhat.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dave Young <dyoung@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks a lot Alex / Gerd and Thomas, very informative stuff! I'm glad
there are projects to collect/save the data and reuse after a kdump,
this is very useful.

I'll continue my study on the atombios thing of AMD and QXL, maybe at
least we can make it work in qemu, that'd be great (like a small
initdriver to reprogram de paravirtual device on kexec boot).

Cheers,


Guilherme
