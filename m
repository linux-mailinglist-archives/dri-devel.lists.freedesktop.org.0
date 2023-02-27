Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 322D46A4C8A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 21:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD2810E15B;
	Mon, 27 Feb 2023 20:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA25010E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 20:56:00 +0000 (UTC)
Received: from [10.0.0.182] (unknown [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id B9847161B9A;
 Mon, 27 Feb 2023 21:55:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1677531357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asQWI/0KqQ7Vskc9EMNo967uGziRnDRjnTbun9Xsibw=;
 b=UU3tgWQJlBiGN4SmpF7FcfyXOhVg5CL0CPSW88hsr0v4bwPMpywNAcyE9F9bIloot+Kfyy
 +zca8OffoaqtiDEe75NBHICli7NZAzc4uP7TRyCPlrcesgDQiNPFyjD8SGVHPiKezcGEHi
 SK6nVNWE+3aAli4ddv45LvsvHMQmUbY=
Message-ID: <cee2e3ea-14a6-c51f-7ce6-6a67dabff6f1@ixit.cz>
Date: Mon, 27 Feb 2023 21:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [RESEND v2 PATCH] init/do_mounts.c: add virtiofs root fs support
To: Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20230224143751.36863-1-david@ixit.cz> <Y/zSCarxyabSC1Zf@fedora>
 <Y/zxO9PMaES8SenN@redhat.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
In-Reply-To: <Y/zxO9PMaES8SenN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 wsa+renesas@sang-engineering.com, helen.koike@collabora.com,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you all!

We'll drop this patch in next MesaCI kernel uprev without this patch!

David

On 27/02/2023 19:06, Vivek Goyal wrote:
> On Mon, Feb 27, 2023 at 10:53:45AM -0500, Stefan Hajnoczi wrote:
>> On Fri, Feb 24, 2023 at 03:37:51PM +0100, David Heidelberg wrote:
>>> From: Stefan Hajnoczi <stefanha@redhat.com>
>>>
>>> Make it possible to boot directly from a virtiofs file system with tag
>>> 'myfs' using the following kernel parameters:
>>>
>>>    rootfstype=virtiofs root=myfs rw
>>>
>>> Booting directly from virtiofs makes it possible to use a directory on
>>> the host as the root file system.  This is convenient for testing and
>>> situations where manipulating disk image files is cumbersome.
>>>
>>> Reviewed-by: Helen Koike <helen.koike@collabora.com>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>> v2: added Reviewed-by and CCed everyone interested.
>>>
>>> We have used this option in Mesa3D CI for testing crosvm for
>>> more than one years and it's proven to work reliably.
>>>
>>> We are working on effort to removing custom patches to be able to do
>>> automated apply and test of patches from any tree.
>>>
>>> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/.gitlab-ci/crosvm-runner.sh#L85
>>>   init/do_mounts.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>> Vivek, do you remember where we ended up with boot from virtiofs? I
>> thought a different solution was merged some time ago.
> We merged a patch from Christoph Hellwig to support this.
>
> commit f9259be6a9e7c22d92e5a5000913147ae17e8321
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Wed Jul 14 16:23:20 2021 -0400
>
>      init: allow mounting arbitrary non-blockdevice filesystems as root
>
> Now one should be able to mount virtiofs using following syntax.
>
> "root=myfs rootfstype=virtiofs rw"
>
> IIUC, this patch should not be required anymore.
>
> Thanks
> Vivek
>
>> There is documentation from the virtiofs community here:
>> https://virtio-fs.gitlab.io/howto-boot.html
>>
>> Stefan
>>
>>> diff --git a/init/do_mounts.c b/init/do_mounts.c
>>> index 811e94daf0a8..11c11abe23d7 100644
>>> --- a/init/do_mounts.c
>>> +++ b/init/do_mounts.c
>>> @@ -578,6 +578,16 @@ void __init mount_root(void)
>>>   			printk(KERN_ERR "VFS: Unable to mount root fs via SMB.\n");
>>>   		return;
>>>   	}
>>> +#endif
>>> +#ifdef CONFIG_VIRTIO_FS
>>> +	if (root_fs_names && !strcmp(root_fs_names, "virtiofs")) {
>>> +		if (!do_mount_root(root_device_name, "virtiofs",
>>> +				   root_mountflags, root_mount_data))
>>> +			return;
>>> +
>>> +		panic("VFS: Unable to mount root fs \"%s\" from virtiofs",
>>> +		      root_device_name);
>>> +	}
>>>   #endif
>>>   	if (ROOT_DEV == 0 && root_device_name && root_fs_names) {
>>>   		if (mount_nodev_root() == 0)
>>> -- 
>>> 2.39.1
>>>
>
-- 
David Heidelberg
Consultant Software Engineer

