Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9746F6C7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 23:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E60710E162;
	Thu,  9 Dec 2021 22:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C03510E191;
 Thu,  9 Dec 2021 18:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
 :Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rz9HthfWS5XpA9c8jhlf214xM5YUiYfJJdxPSAqbHi8=; b=YvGNVESzooPeFFuYzoPk7pwnF8
 QElZRuWPwoWCs5DGopfrD723w4yUXZhQKtnAhuLCq1Zzc0++BtViqO6TJ6IL1oysVVNui5ioFa1S+
 v3CF63KvgnR8I312MaDxkEt2gYNEtENZGosLjEUFjXvWR3HCgnfHU0JEKwl0V5Q6QSmF8lppbhrMI
 NVbQ/iEw4nYuZlqtR+PRHRsgRL3wmGCsOx7yP0KFHhySM17xdzhtdqjY0TA9UXHpzBLaaZkKE9CAP
 MyF8d6bBCcDYjEecmwSnM9Vl7Y4PjO1WJn8+cRSNrq/XXtdNaIdWfoUW5h54P+1O6EnY3iMgOYYqi
 TNEPPI9w==;
Received: from [177.103.99.151] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1mvNzZ-000Cbb-Ny; Thu, 09 Dec 2021 19:18:06 +0100
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
To: Alex Deucher <alexdeucher@gmail.com>
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
 <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
 <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
 <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Message-ID: <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
Date: Thu, 9 Dec 2021 15:17:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 09 Dec 2021 22:26:50 +0000
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
 Christian Koenig <christian.koenig@amd.com>, Vivek Goyal <vgoyal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks again Alex! Some comments inlined below:

On 09/12/2021 15:06, Alex Deucher wrote:
> Not really in a generic way.  It's asic and platform specific.  In
> addition most modern displays require link training to bring up the
> display, so you can't just save and restore registers.

Oh sure, I understand that. My question is more like: is there a way,
inside amdgpu driver, to save this state before taking
over/overwriting/reprogramming the device? So we could (again, from
inside the amdgpu driver) dump this pre-saved state in the shutdown
handler, for example, having the device in a "pre-OS" state when the new
kexec'ed kernel starts.

> 
> The drivers are asic and platform specific.  E.g., the driver for
> vangogh is different from renoir is different from skylake, etc.  The
> display programming interfaces are asic specific.

Cool, that makes sense! But if you (or anybody here) know some of these
GOP drivers, e.g. for the qemu/qxl device, I'm just curious to
see/understand how complex is the FW driver to just put the
device/screen in a usable state.

Cheers,


Guilherme
