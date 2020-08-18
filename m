Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3407A249594
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C546E1D6;
	Wed, 19 Aug 2020 06:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BFE89CCB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597761707;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=yY8lZpT6KH3C16Gfks0UQ6yD6WQSNt9zdE+YDfsTYO4=;
 b=kHtr4cKJeQfVQ3EgsBt03EkjaH+RV7taOopbSXSsWOZ3Qk0BA9xl63fkO0IvS/ZJni
 Mi6mdyW7i83rVm46LntJB7/pkv4jN4yKXsqtk9LHeCRdrt6iUFfO7Qryqakufniu/xNA
 FIrTUAlpPl5RLLx+6dAqRz2rowiQ+sbt+4UymgVzovhAfuI4rUTvP2nD0mLeUn0Kgyqw
 b2G1hPUrMNqBM7ji6awuoGIyiJX2UOGD6vgVIZUnn41N8x7+5tbxhkgNU/Su3LVOIx4a
 s87wFivdnJNlEKzmqL6rVWJysP75xOLzxX22y2y+aFVgptJWSQFE5kXieOBf+3pCVXBw
 eWRA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0hM3BukOMWh76B1HxtPtLuZ1yU+QFTgVvLrsuJ"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b10d:7054:d092:5f3e:8032:9dca]
 by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id 60686ew7IEfcrlW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 18 Aug 2020 16:41:38 +0200 (CEST)
Subject: Re: [Virtual ppce500] virtio_gpu virtio0: swiotlb buffer is full
To: Gerd Hoffmann <kraxel@redhat.com>
References: <87h7tb4zwp.fsf@linux.ibm.com>
 <E1C071A5-19D1-4493-B04A-4507A70D7848@xenosoft.de>
 <bc1975fb-23df-09c2-540a-c13b39ad56c5@xenosoft.de>
 <51482c70-1007-1202-9ed1-2d174c1e923f@xenosoft.de>
 <9688335c-d7d0-9eaa-22c6-511e708e0d2a@linux.ibm.com>
 <9805f81d-651d-d1a3-fd05-fb224a8c2031@xenosoft.de>
 <3162da18-462c-72b4-f8f0-eef896c6b162@xenosoft.de>
 <3eee8130-6913-49d2-2160-abf0bf17c44e@xenosoft.de>
 <20200818081830.d2a2cva4hd2jzwba@sirius.home.kraxel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <0f2434a5-edcf-e7d1-f6ae-7c912dc8d859@xenosoft.de>
Date: Tue, 18 Aug 2020 16:41:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818081830.d2a2cva4hd2jzwba@sirius.home.kraxel.org>
Content-Language: de-DE
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 daniel.vetter@ffwll.ch, =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 gurchetansingh@chromium.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18 August 2020 at 10:18 am, Gerd Hoffmann wrote:
> On Mon, Aug 17, 2020 at 11:19:58AM +0200, Christian Zigotzky wrote:
>> Hello
>>
>> I compiled the RC1 of kernel 5.9 today. Unfortunately the issue with the
>> VirtIO-GPU (see below) still exists. Therefore we still need the patch (see
>> below) for using the VirtIO-GPU in a virtual e5500 PPC64 QEMU machine.
> It is fixed in drm-misc-next (commit 51c3b0cc32d2e17581fce5b487ee95bbe9e8270a).
>
> Will cherry-pick into drm-misc-fixes once the branch is 5.9-based, which
> in turn should bring it to 5.9-rc2 or -rc3.
>
> take care,
>    Gerd
>
Hello Gerd,

I compiled a new kernel with the latest DRM misc updates today. The 
patch is included in these updates.

This kernel works with the VirtIO-GPU in a virtual e5500 QEMU/KVM HV 
machine on my X5000.

Unfortunately I can only use the VirtIO-GPU (Monitor: Red Hat, Inc. 8") 
with a resolution of 640x480. If I set a higher resolution then the 
guest disables the monitor.
I can use higher resolutions with the stable kernel 5.8 and the VirtIO-GPU.

Please check the latest DRM updates.

Thanks,
Christian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
