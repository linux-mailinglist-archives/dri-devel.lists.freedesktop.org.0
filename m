Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C0924AFC8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED5C6E8EA;
	Thu, 20 Aug 2020 07:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4680F6E215
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 10:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597832581;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=iot4F9NIeNJEKxo3vS94S+e9faKTbXdWR+AZlk71Fbw=;
 b=Zdkuo6wGxeAnHq6Uz5r74SJSfCYOhN3TNDOm7Fgii3hb+yrsm5Nhk8ISRNqmaCzNz0
 28y1DbVSVBzMULPV8aVVYFnDRBNtHqI+EjA4NNv3dYSNdgyGFTurkO7aFUT1uBBsLDB9
 U5q/8ncoyC5d9peNjXHKzCTCl84rW3/M7HT+6cQseP3ZF+o0s8n+210UdZUPsPHWXW8l
 dljtRzxy74o9beOxTTcyYXgSJL487r+1XLoh1Vm0YmyyR+EzuCSrU/CeC+FSxdwQuMMr
 XKjtrJ0E/QB2YbN+sbZDzY47pmvJ0rVQ7y1+1c5bFDOnS3Y96UkjNqEA0aEYkj8MGrDV
 PmGQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4gJwhNnAyjUduDV+ZkOHUlEM0OPMli3OTXFzhrrfu"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:d00a:a116:5430:18e8:3be9:8596]
 by smtp.strato.de (RZmta 46.10.7 AUTH)
 with ESMTPSA id Y04f7aw7JAMq0hZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 19 Aug 2020 12:22:52 +0200 (CEST)
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
 <0f2434a5-edcf-e7d1-f6ae-7c912dc8d859@xenosoft.de>
 <20200819043515.saq6ey33q7p2uccz@sirius.home.kraxel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <52a15836-4e95-089e-1683-416fdbb3fd19@xenosoft.de>
Date: Wed, 19 Aug 2020 12:22:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819043515.saq6ey33q7p2uccz@sirius.home.kraxel.org>
Content-Language: de-DE
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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

On 19 August 2020 at 06:35 am, Gerd Hoffmann wrote:
> On Tue, Aug 18, 2020 at 04:41:38PM +0200, Christian Zigotzky wrote:
>> Hello Gerd,
>>
>> I compiled a new kernel with the latest DRM misc updates today. The patch is
>> included in these updates.
>>
>> This kernel works with the VirtIO-GPU in a virtual e5500 QEMU/KVM HV machine
>> on my X5000.
>>
>> Unfortunately I can only use the VirtIO-GPU (Monitor: Red Hat, Inc. 8") with
>> a resolution of 640x480. If I set a higher resolution then the guest
>> disables the monitor.
>> I can use higher resolutions with the stable kernel 5.8 and the VirtIO-GPU.
>>
>> Please check the latest DRM updates.
> https://patchwork.freedesktop.org/patch/385980/
>
> (tests & reviews & acks are welcome)
>
> HTH,
>    Gerd
>
Hello Gerd,

I compiled a new RC1 with our patches today. With these patches, the 
VirtIO-GPU works without any problems. I can use higher resolutions again.

Screenshot of the RC1-3 with the VirtIO-GPU in a virtual e5500 QEMU/KVM 
HV machine on my X5000: 
https://i.pinimg.com/originals/4f/b0/14/4fb01476edd7abe6be1e1203a8e7e152.png

Thanks a lot for your help!

Cheers,
Christian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
