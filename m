Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37961756437
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 15:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD2610E241;
	Mon, 17 Jul 2023 13:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-4.mta0.migadu.com (out-4.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D69310E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 13:17:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------JKLfB54Qwq2eqKP1PnwIWNIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689599846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7+RliUrqICbDC830YEWOJg9bc03V4eGiVu8EeHfdt18=;
 b=DSEnU8oaOgf5lchiQaWDNUZzGcgYUikosTVblgD3dLS+JPZPFT2BACPOFSRadcjrQOjYjY
 SC1t2XRw9HeIZVN6E1npqx1bG59dkRq/djXWRuvaHGH6urb6ydIb/vWjrrUIWyMTGX5NdR
 VW+PwKyEeskNGgP0pTe14mdL3nNMsFg=
Message-ID: <ddd6430c-86c1-7aae-fd46-0f33399e0067@linux.dev>
Date: Mon, 17 Jul 2023 21:17:12 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 2/6] PCI/VGA: Deal with PCI VGA compatible devices only
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>, Bjorn Helgaas
 <bhelgaas@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230711134354.755966-1-sui.jingfeng@linux.dev>
 <20230711134354.755966-3-sui.jingfeng@linux.dev>
 <6b4ff3d5-293e-7bf3-f5df-babc14661c44@loongson.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <6b4ff3d5-293e-7bf3-f5df-babc14661c44@loongson.cn>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------JKLfB54Qwq2eqKP1PnwIWNIX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2023/7/17 17:51, suijingfeng wrote:
>
> Hi,
>
>
> On 2023/7/11 21:43, Sui Jingfeng wrote:
>> From: Sui Jingfeng<suijingfeng@loongson.cn>
>>
>> Currently, vgaarb only cares about PCI VGA-compatible class devices.
>>
>> While vga_arbiter_del_pci_device() gets called unbalanced when some PCI
>> device is about to be removed. This happens even during the boot process.
>>
>> Another reason is that the vga_arb_device_init() function is not efficient.
>> Since we only care about VGA-compatible devices (pdev->class == 0x030000),
>> We could filter the unqualified devices out in the vga_arb_device_init()
>> function. While the current implementation is to search all PCI devices
>> in a system, this is not necessary.
>>
>> Reviewed-by: Mario Limonciello<mario.limonciello@amd.com>
>> Signed-off-by: Sui Jingfeng<suijingfeng@loongson.cn>
>> ---
>>   drivers/pci/vgaarb.c | 25 +++++++++++++------------
>>   1 file changed, 13 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index c1bc6c983932..021116ed61cb 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -754,10 +754,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
>>   	struct pci_dev *bridge;
>>   	u16 cmd;
>>   
>> -	/* Only deal with VGA class devices */
>> -	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
>> -		return false;
>> -
>>   	/* Allocate structure */
>>   	vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
>>   	if (vgadev == NULL) {
>> @@ -1502,6 +1498,10 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>>   
>>   	vgaarb_dbg(dev, "%s\n", __func__);
>>   
>> +	/* Deal with VGA compatible devices only */
>> +	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
>> +		return 0;
>> +
>>   	/* For now we're only intereted in devices added and removed. I didn't
>>   	 * test this thing here, so someone needs to double check for the
>>   	 * cases of hotplugable vga cards. */
>> @@ -1534,8 +1534,8 @@ static struct miscdevice vga_arb_device = {
>>   
>>   static int __init vga_arb_device_init(void)
>>   {
>> +	struct pci_dev *pdev = NULL;
>>   	int rc;
>> -	struct pci_dev *pdev;
>>   
>>   	rc = misc_register(&vga_arb_device);
>>   	if (rc < 0)
>> @@ -1543,13 +1543,14 @@ static int __init vga_arb_device_init(void)
>>   
>>   	bus_register_notifier(&pci_bus_type, &pci_notifier);
>>   
>> -	/* We add all PCI devices satisfying VGA class in the arbiter by
>> -	 * default */
>> -	pdev = NULL;
>> -	while ((pdev =
>> -		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
>> -			       PCI_ANY_ID, pdev)) != NULL)
>> -		vga_arbiter_add_pci_device(pdev);
>> +	/*
>> +	 * We add all PCI VGA compatible devices in the arbiter by default
>> +	 */
>> +	do {
>> +		pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev);
>> +		if (pdev)
>> +			vga_arbiter_add_pci_device(pdev);
>> +	} while (pdev);
> I suddenly remember one more thing that I forget to explain.
>
> In a previous thread[1] of previous version of this series,
>
> Maciej seems argue that PCI_CLASS_NOT_DEFINED_VGA should be handled also.
>
> But, even I try to handled PCI_CLASS_NOT_DEFINED_VGA at here,
>
> this card still will not be annotate as boot_vga,
>
> because the pci_dev_attrs_are_visible() function only consider VGA compatible devices
>
> which (pdev->class >> 8 == PCI_CLASS_DISPLAY_VGA) is true. See [2].
>
>
> Intel integrated GPU is more intelligent,
>
> which could change their class of the PCI(e) device to 0x038000 when
>
> multiple GPU co-exist. Even though the GPU can display. This is configurable by
>
> the firmware, but this is trying to escape the arbitration by changing is PCI id.

"by changing is PCI id" -> "by changing its PCI(e) class number".

For example, the intel GPU will change their PCI class number from 0x030000 to 0x038000,

if a user choose the dGPU as primary by setting their UEFI firmware from the BIOS.


But other GPUs may not support to change their PCI class number.

>
> So, PCI devices belong to the PCI_CLASS_DISPLAY_OTHER, PCI_CLASS_DISPLAY_3D and PCI_CLASS_DISPLAY_XGA
>
> can not participate in the arbitration. They are all will be get filtered.

I means that PCI devices with their PCI class number equal  to

PCI_CLASS_DISPLAY_OTHER, PCI_CLASS_DISPLAY_3D and PCI_CLASS_DISPLAY_XGA

will get ignored by vgaarb currently.

Even we throw other devices(DISPLAY_OTHER, DISPLAY_3D, DISPLAY_XGA) into 
the arbitrator,

We still not make a meaningful progress, I need also to change the code 
in link [2]

to make the boot_vga visible to userspace. Because X server is the end 
consumer.

This already form an ABI.  So change the code here alone is not enough 
to expand vgaarb.

>
> So, this is a limitation of the vgaarb itself.
>
> While I could help to improve it in the future, what do you think?
> Is my express clear?
Am I express my thoughts clearly ?
>
> [1] 
> https://lkml.kernel.org/nouveau/alpine.DEB.2.21.2306190339590.14084@angie.orcam.me.uk/#t
>
> [2] 
> https://elixir.bootlin.com/linux/latest/source/drivers/pci/pci-sysfs.c#L1544
>
Alex acclaims that "we won't need vgaarb if the platform has no VGA devices", see [3].

while this is not 100% correct, because X server is the primary consumer of the boot_vga flag,

the convention usage of the userspace and the kernel space is already established.

So without we can craft something new easily without significant change.



[3]https://lkml.kernel.org/nouveau/CADnq5_PFoM2O8mCd6+VFfu9Nc-Hg_HTnwEMxrq0FGRpva1kKiA@mail.gmail.com/


>>   
>>   	pr_info("loaded\n");
>>   	return rc;
--------------JKLfB54Qwq2eqKP1PnwIWNIX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 2023/7/17 17:51, suijingfeng wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6b4ff3d5-293e-7bf3-f5df-babc14661c44@loongson.cn">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Hi,<br>
      </p>
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2023/7/11 21:43, Sui Jingfeng
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20230711134354.755966-3-sui.jingfeng@linux.dev">
        <pre class="moz-quote-pre" wrap="">From: Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn" moz-do-not-send="true">&lt;suijingfeng@loongson.cn&gt;</a>

Currently, vgaarb only cares about PCI VGA-compatible class devices.

While vga_arbiter_del_pci_device() gets called unbalanced when some PCI
device is about to be removed. This happens even during the boot process.

Another reason is that the vga_arb_device_init() function is not efficient.
Since we only care about VGA-compatible devices (pdev-&gt;class == 0x030000),
We could filter the unqualified devices out in the vga_arb_device_init()
function. While the current implementation is to search all PCI devices
in a system, this is not necessary.

Reviewed-by: Mario Limonciello <a class="moz-txt-link-rfc2396E" href="mailto:mario.limonciello@amd.com" moz-do-not-send="true">&lt;mario.limonciello@amd.com&gt;</a>
Signed-off-by: Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn" moz-do-not-send="true">&lt;suijingfeng@loongson.cn&gt;</a>
---
 drivers/pci/vgaarb.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index c1bc6c983932..021116ed61cb 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -754,10 +754,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 	struct pci_dev *bridge;
 	u16 cmd;
 
-	/* Only deal with VGA class devices */
-	if ((pdev-&gt;class &gt;&gt; 8) != PCI_CLASS_DISPLAY_VGA)
-		return false;
-
 	/* Allocate structure */
 	vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
 	if (vgadev == NULL) {
@@ -1502,6 +1498,10 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 
 	vgaarb_dbg(dev, "%s\n", __func__);
 
+	/* Deal with VGA compatible devices only */
+	if ((pdev-&gt;class &gt;&gt; 8) != PCI_CLASS_DISPLAY_VGA)
+		return 0;
+
 	/* For now we're only intereted in devices added and removed. I didn't
 	 * test this thing here, so someone needs to double check for the
 	 * cases of hotplugable vga cards. */
@@ -1534,8 +1534,8 @@ static struct miscdevice vga_arb_device = {
 
 static int __init vga_arb_device_init(void)
 {
+	struct pci_dev *pdev = NULL;
 	int rc;
-	struct pci_dev *pdev;
 
 	rc = misc_register(&amp;vga_arb_device);
 	if (rc &lt; 0)
@@ -1543,13 +1543,14 @@ static int __init vga_arb_device_init(void)
 
 	bus_register_notifier(&amp;pci_bus_type, &amp;pci_notifier);
 
-	/* We add all PCI devices satisfying VGA class in the arbiter by
-	 * default */
-	pdev = NULL;
-	while ((pdev =
-		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
-			       PCI_ANY_ID, pdev)) != NULL)
-		vga_arbiter_add_pci_device(pdev);
+	/*
+	 * We add all PCI VGA compatible devices in the arbiter by default
+	 */
+	do {
+		pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA &lt;&lt; 8, pdev);
+		if (pdev)
+			vga_arbiter_add_pci_device(pdev);
+	} while (pdev);
</pre>
      </blockquote>
      <pre id="b">I suddenly remember one more thing that I forget to explain.

In a previous thread[1] of previous version of this series,

Maciej seems argue that PCI_CLASS_NOT_DEFINED_VGA should be handled also.

But, even I try to handled PCI_CLASS_NOT_DEFINED_VGA at here,

this card still will not be annotate as boot_vga,

because the pci_dev_attrs_are_visible() function only consider VGA compatible devices

which (pdev-&gt;class &gt;&gt; 8 == PCI_CLASS_DISPLAY_VGA) is true. See [2].


Intel integrated GPU is more intelligent,

which could change their class of the PCI(e) device to 0x038000 when

multiple GPU co-exist. Even though the GPU can display. This is configurable by

the firmware, but this is trying to escape the arbitration by changing is PCI id. 
</pre>
    </blockquote>
    <pre id="b">"by changing is PCI id" -&gt; "by changing its PCI(e) class number".

For example, the intel GPU will change their PCI class number from 0x030000 to 0x038000,

if a user choose the dGPU as primary by setting their UEFI firmware from the BIOS.


But other GPUs may not support to change their PCI class number.

</pre>
    <blockquote type="cite"
      cite="mid:6b4ff3d5-293e-7bf3-f5df-babc14661c44@loongson.cn">
      <pre id="b">

So, PCI devices belong to the PCI_CLASS_DISPLAY_OTHER, PCI_CLASS_DISPLAY_3D and PCI_CLASS_DISPLAY_XGA

can not participate in the arbitration. They are all will be get filtered. </pre>
    </blockquote>
    <p>I means that PCI devices with their PCI class number equal  to</p>
    <p>PCI_CLASS_DISPLAY_OTHER, PCI_CLASS_DISPLAY_3D and
      PCI_CLASS_DISPLAY_XGA</p>
    <p>will get ignored by vgaarb currently.</p>
    <p>Even we throw other devices(DISPLAY_OTHER, DISPLAY_3D,
      DISPLAY_XGA) into the arbitrator,<br>
    </p>
    <p>We still not make a meaningful progress, I need also to change
      the code in link [2]</p>
    <p>to make the boot_vga visible to userspace. Because X server is
      the end consumer.<br>
    </p>
    <p>This already form an ABI.  So change the code here alone is not
      enough to expand vgaarb.<br>
    </p>
    <blockquote type="cite"
      cite="mid:6b4ff3d5-293e-7bf3-f5df-babc14661c44@loongson.cn">
      <pre id="b">

So, this is a limitation of the vgaarb itself.

While I could help to improve it in the future, what do you think?</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:6b4ff3d5-293e-7bf3-f5df-babc14661c44@loongson.cn">
      <pre id="b">
Is my express clear?
</pre>
    </blockquote>
    Am I express my thoughts clearly ?<br>
    <blockquote type="cite"
      cite="mid:6b4ff3d5-293e-7bf3-f5df-babc14661c44@loongson.cn">
      <pre id="b">
</pre>
      <p>[1]
        <a class="moz-txt-link-freetext"
href="https://lkml.kernel.org/nouveau/alpine.DEB.2.21.2306190339590.14084@angie.orcam.me.uk/#t"
          moz-do-not-send="true">https://lkml.kernel.org/nouveau/alpine.DEB.2.21.2306190339590.14084@angie.orcam.me.uk/#t</a></p>
      <p>[2]
        <a class="moz-txt-link-freetext"
href="https://elixir.bootlin.com/linux/latest/source/drivers/pci/pci-sysfs.c#L1544"
          moz-do-not-send="true">https://elixir.bootlin.com/linux/latest/source/drivers/pci/pci-sysfs.c#L1544</a><br>
      </p>
    </blockquote>
    <pre id="b">
Alex acclaims that "we won't need vgaarb if the platform has no VGA devices", see [3].

while this is not 100% correct, because X server is the primary consumer of the boot_vga flag,

the convention usage of the userspace and the kernel space is already established.

So without we can craft something new easily without significant change.



[3] <a class="moz-txt-link-freetext" href="https://lkml.kernel.org/nouveau/CADnq5_PFoM2O8mCd6+VFfu9Nc-Hg_HTnwEMxrq0FGRpva1kKiA@mail.gmail.com/">https://lkml.kernel.org/nouveau/CADnq5_PFoM2O8mCd6+VFfu9Nc-Hg_HTnwEMxrq0FGRpva1kKiA@mail.gmail.com/</a>
</pre>
    <p></p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:6b4ff3d5-293e-7bf3-f5df-babc14661c44@loongson.cn">
      <p> </p>
      <blockquote type="cite"
        cite="mid:20230711134354.755966-3-sui.jingfeng@linux.dev">
        <pre class="moz-quote-pre" wrap=""> 
 	pr_info("loaded\n");
 	return rc;
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------JKLfB54Qwq2eqKP1PnwIWNIX--
