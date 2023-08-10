Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854AF777811
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 14:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C5210E180;
	Thu, 10 Aug 2023 12:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-108.mta1.migadu.com (out-108.mta1.migadu.com
 [IPv6:2001:41d0:203:375::6c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C974410E180
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 12:18:43 +0000 (UTC)
Message-ID: <38a37d61-529b-12c6-da32-25b780318175@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691669920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqIFbhKBuUW51FybyZoKrutyLB27EyK86A0iiFShgwM=;
 b=gn0k3dfRF5lr291o4BhbOFJQDK2XZYH3WIh2gwb/mYoGmO4N/2a2frr6tS+FyuiWLh+VlV
 VQA2D1MdWplq8qygIlv/Tf7hcdaSr3OJat+UzqK2gxZCSZcZ3bxgg8spLtSiHjRN6ieWJC
 rdw1uyuARFFFjesHbd9JYCfuxuS1r2g=
Date: Thu, 10 Aug 2023 20:18:31 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 07/11] PCI/VGA: vga_client_register() return -ENODEV on
 failure, not -1
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 suijingfeng <suijingfeng@loongson.cn>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
 <20230808223412.1743176-8-sui.jingfeng@linux.dev>
 <b1a964e-a94b-2316-eeaf-fec2b2fa833b@linux.intel.com>
 <bfe424f2-6dad-c8c9-ec82-8eda70f23cdf@loongson.cn>
 <1f288175-a290-6f19-d562-cf98f613323c@linux.intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <1f288175-a290-6f19-d562-cf98f613323c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/8/10 20:13, Ilpo Järvinen wrote:
> On Thu, 10 Aug 2023, suijingfeng wrote:
>> On 2023/8/9 21:52, Ilpo Järvinen wrote:
>>> On Wed, 9 Aug 2023, Sui Jingfeng wrote:
>>>
>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>
>>> Changelog body is missing.
>>
>> I thought that probably the Fixes tag could be taken as the body of this
>> commit,
>> since there are no warnings when I check the whole series with checkpatch.pl.
>>
>>
>>>> Fixes: 934f992c763a ("drm/i915: Recognise non-VGA display devices")
>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>> ---
>>>>    drivers/pci/vgaarb.c | 15 ++++++---------
>>>>    1 file changed, 6 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>> index 811510253553..a6b8c0def35d 100644
>>>> --- a/drivers/pci/vgaarb.c
>>>> +++ b/drivers/pci/vgaarb.c
>>>> @@ -964,7 +964,7 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
>>>>     *
>>>>     * To unregister just call vga_client_unregister().
>>>>     *
>>>> - * Returns: 0 on success, -1 on failure
>>>> + * Returns: 0 on success, -ENODEV on failure
>>> So this is the true substance of this change??
>>>
>> Yes.
>>
>>
>>> It doesn't warrant Fixes tag which requires a real problem to fix. An
>>> incorrect comment is not enough.
>>>
>>> I think the shortlog is a bit misleading as is because it doesn't in any
>>> way indicate the problem is only in a comment.
>> But it's that commit(934f992c763a) alter the return value of
>> vga_client_register(),
>> which make the commit and code don't match anymore.
> This is useful information, no point in withholding it which forces
> others to figure it out by looking that commit up so put that detail into
> the changelog body.
>
>>>    I'd prefer to
>>> initialize ret = 0 instead:
>>>
>>> 	int ret = 0;
>>> 	...
>>> 	if (!vgadev) {
>>> 		err = -ENODEV;
>>> 		goto unlock;
>>> 	}
>>> 	...
>>> unlock:
>>> 	...
>>>
>> But this is same as the original coding style, no fundamental improve.
>> The key point is to make the wrapped code between the spin_lock_irqsave() and
>> spin_unlock_irqrestore() compact.
>> my patch remove the necessary 'goto' statement and the 'bail' label.
>> After apply my patch, the vga_client_register() function became as this:
>>
>> int vga_client_register(struct pci_dev *pdev,
>>          unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
>> {
>>      int ret = -ENODEV;
>>      struct vga_device *vgadev;
>>      unsigned long flags;
>>
>>      spin_lock_irqsave(&vga_lock, flags);
>>      vgadev = vgadev_find(pdev);
>>      if (vgadev) {
>>          vgadev->set_decode = set_decode;
>>          ret = 0;
>>      }
>>      spin_unlock_irqrestore(&vga_lock, flags);
>>
>>      return ret;
>> }
> I'm not too attached to either of the ways around since there's no
> correctness issues here. Feel free to ignore my alternative suggestion
> (make the separate patch out of it in anycase).


OK, will be done at the next version.

