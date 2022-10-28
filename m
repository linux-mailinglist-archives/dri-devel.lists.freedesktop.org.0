Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F3E6116B4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 18:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38D910E86A;
	Fri, 28 Oct 2022 16:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4584410E86A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 16:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666972867; x=1698508867;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AcBp1Wg+Jj4vKs1lS363GQp9NFZYETp77zbxcs1XWxM=;
 b=dVuNjgni3nllnMcOTB9MYC4crpbLOG2+OaL5+sQraTt5OAjXz32mcbnd
 VOnSK2zUXq5C/sIX9DLbPtKk0vYLYEHnKyaVcfMF2E6QzPpouCcnPqyWS
 MkebaFWfSg76NhTbBh42z2vhWeoDUn7IS6grZmfnPU5K0CC/oIQIqpfi0
 M+eCIZ/z0GsHg9zRUZCOXNjH7HljqEA+z25JmsIIauMAQXbTEsNGerejg
 W9DmTihqva5qDlFPx7QSw6s1ay+3gx4HeXQSNyhaJeFjW5ElDhlsTgGhg
 qTxscVXJ/HBPoe/jDv0OvqwqFJkvRjUQtLAtVBcvL90225JyFcZmT/4GG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="307250747"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="307250747"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 09:01:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="610786440"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; d="scan'208";a="610786440"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.157.167])
 ([10.249.157.167])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 09:01:01 -0700
Message-ID: <5c5ff3bc-23e7-40c9-4246-283799cbcecd@linux.intel.com>
Date: Fri, 28 Oct 2022 18:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 1/7] drm/ivpu: Introduce a new DRM driver for Intel VPU
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-2-jacek.lawrynowicz@linux.intel.com>
 <21ec0e14-cac5-5f36-8e57-2a5c2e3ca4a0@suse.de>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <21ec0e14-cac5-5f36-8e57-2a5c2e3ca4a0@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, thanks for in-depth review.

On 10/25/2022 2:38 PM, Thomas Zimmermann wrote:
> Hi,
> 
> please find some review comments below.
> 
> Am 24.09.22 um 17:11 schrieb Jacek Lawrynowicz:
>> +static int ivpu_irq_init(struct ivpu_device *vdev)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
>> +    int ret;
>> +
>> +    ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
>> +    if (ret < 0) {
>> +        ivpu_err(vdev, "Failed to allocate and MSI IRQ: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    vdev->irq = pci_irq_vector(pdev, 0);
>> +
>> +    ret = request_irq(vdev->irq, vdev->hw->ops->irq_handler, IRQF_SHARED,
>> +              DRIVER_NAME, vdev);
> 
> There's devm_request_irq(). Within DRM, we have mostly adopted managed cleanup. New drivers should be written that way.

Sure, makes sense.

>> +    if (ret) {
>> +        ivpu_err(vdev, "Failed to request an IRQ %d\n", ret);
>> +        pci_free_irq_vectors(pdev);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void ivpu_irq_fini(struct ivpu_device *vdev)
> 
> All these _fini functions should be replaced by managed cleanups with the devm_, drmm_ and pcim_. There are sometimes multiple ways of supporting this, but manually calling _fini should be avoided.

Yes, with devm ivpu_irq_fini() is no longer needed.

>> +{
>> +    free_irq(vdev->irq, vdev);
>> +    pci_free_irq_vectors(to_pci_dev(vdev->drm.dev));
> 
> There's no pcim_alloc_irq_vectors(). It's better to add one or at least provide such an implementation within your driver.

It is not actually needed. pci_alloc_irq_vectors() is implicitly managed.
It calls pcim_setup_msi_release() that will free irq vectors.

>> +}
>> +
>> +static int ivpu_pci_init(struct ivpu_device *vdev)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
>> +    struct resource *bar0 = &pdev->resource[0];
>> +    struct resource *bar4 = &pdev->resource[4];
>> +    int ret;
>> +
>> +    ivpu_dbg(MISC, "Mapping BAR0 (RegV) %pR\n", bar0);
>> +    vdev->regv = devm_ioremap_resource(vdev->drm.dev, bar0);
>> +    if (IS_ERR(vdev->regv)) {
>> +        ivpu_err(vdev, "Failed to map bar 0\n");
>> +        return -ENOMEM;
> 
> Why not return PTR_ERR(vdev->regv) ?

Yes, PTR_ERR should be returned here.

>> +    }
>> +
>> +    ivpu_dbg(MISC, "Mapping BAR4 (RegB) %pR\n", bar4);
>> +    vdev->regb = devm_ioremap_resource(vdev->drm.dev, bar4);
>> +    if (IS_ERR(vdev->regb)) {
>> +        ivpu_err(vdev, "Failed to map bar 4\n");
>> +        return -ENOMEM;
> 
> Same

OK

>> +    }
>> +
>> +    ret = dma_set_mask_and_coherent(vdev->drm.dev, DMA_BIT_MASK(38));
>> +    if (ret) {
>> +        ivpu_err(vdev, "Failed to set DMA mask: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Clear any pending errors */
>> +    pcie_capability_clear_word(pdev, PCI_EXP_DEVSTA, 0x3f);
>> +
>> +    ret = pci_enable_device(pdev);
> 
> pcim_enable device()

OK

>> +static int ivpu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>> +{
>> +    struct ivpu_device *vdev;
>> +    int ret;
>> +
>> +    vdev = devm_drm_dev_alloc(&pdev->dev, &driver, struct ivpu_device, drm);
>> +    if (IS_ERR(vdev))
>> +        return PTR_ERR(vdev);
>> +
>> +    pci_set_drvdata(pdev, vdev);
>> +    vdev->drm.dev_private = vdev;
> 
> No more use of dev_private in new drivers. Your struct ivpu_device should rather embed an instance of struct drm_device and you should upcast if necessary.

OK, we are not using it anyway.

>> +
>> +    ret = ivpu_dev_init(vdev);
>> +    if (ret) {
>> +        dev_err(&pdev->dev, "Failed to initialize VPU device: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = drm_dev_register(&vdev->drm, 0);
>> +    if (ret) {
>> +        dev_err(&pdev->dev, "Failed to register DRM device: %d\n", ret);
>> +        ivpu_dev_fini(vdev);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void ivpu_remove(struct pci_dev *pdev)
>> +{
>> +    struct ivpu_device *vdev = pci_get_drvdata(pdev);
>> +
>> +    drm_dev_unregister(&vdev->drm);
>> +    ivpu_dev_fini(vdev);
>> +}
>> +
>> +static struct pci_driver ivpu_pci_driver = {
>> +    .name = KBUILD_MODNAME,
>> +    .id_table = ivpu_pci_ids,
>> +    .probe = ivpu_probe,
>> +    .remove = ivpu_remove,
>> +};
>> +
>> +static __init int ivpu_init(void)
>> +{
>> +    pr_info("Intel VPU driver version: %s", DRIVER_VERSION_STR);
> 
> No log spam please.

This is gone after using module_pci_driver().

>> +
>> +    return pci_register_driver(&ivpu_pci_driver);
>> +}
>> +
>> +static __exit void ivpu_fini(void)
>> +{
>> +    pci_unregister_driver(&ivpu_pci_driver);
>> +}
>> +
>> +module_init(ivpu_init);
>> +module_exit(ivpu_fini);
> 
> Maybe just module_pci_driver().
> 
> [1] https://elixir.bootlin.com/linux/latest/source/include/linux/pci.h#L1480

Sure, make sense.

>> +
>> +#define ivpu_err(vdev, fmt, ...) \
>> +    dev_err((vdev)->drm.dev, "[%s] ERROR: " fmt, __func__, ##__VA_ARGS__)
> 
> I see why you want your own dbg macros. But why do you duplicate DRM's print helpers?

No idea :)
I'm gonna just use drm helpers for err, warn and info.

>> +
>> +#define ivpu_err_ratelimited(vdev, fmt, ...) \
>> +    dev_err_ratelimited((vdev)->drm.dev, "[%s] ERROR: " fmt, __func__, ##__VA_ARGS__)
>> +
>> +#define ivpu_warn(vdev, fmt, ...) \
>> +    dev_warn((vdev)->drm.dev, "[%s] WARNING: " fmt, __func__, ##__VA_ARGS__)
>> +
>> +#define ivpu_warn_ratelimited(vdev, fmt, ...) \
>> +    dev_warn_ratelimited((vdev)->drm.dev, "[%s] WARNING: " fmt, __func__, ##__VA_ARGS__)
>> +
>> +#define ivpu_info(vdev, fmt, ...) dev_info((vdev)->drm.dev, fmt, ##__VA_ARGS__)
>> +
>> +#define ivpu_dbg(type, fmt, args...) do {                                      \
>> +    if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                         \
>> +        dev_dbg((vdev)->drm.dev, "[%s] " fmt, #type, ##args);          \
> 
> Why not drm_dbg()?

Mostly to control the format, so messages can be a little shorter.
We will probably switch to drm_dbg once the dyndbg implementation matures a bit.

>> +} while (0)
>> +
>> +#define IVPU_WA(wa_name) (vdev->wa.wa_name)
>> +
>> +struct ivpu_wa_table {
>> +    bool punit_disabled;
>> +    bool clear_runtime_mem;
>> +};
>> +
>> +struct ivpu_hw_info;
>> +
>> +struct ivpu_device {
>> +    struct drm_device drm; /* Must be first */
> 
> Does not really have to be the first. We use upcast helpers that convert from the DRM type to the driver types.
> 
> static inline struct ivpu_device *to_ivpu_device(struct drm_device *drm)
> {
>     return container_of(drm, struct ivpu_device, drm);
> }
> 
> Just use that to get the ipvu device.

OK

>> +
>> +struct ivpu_addr_range {
>> +    u64 start;
>> +    u64 end;
> 
> resource_size_t is the canonical type here. TBH I'm surprised that linux doesn't already have a type for address ranges. There must be plenty of drivers defining such a type.

OK, I will use resource_size_t. And yes, I'm also surprised. It is such basic type.

>> +};
>> +
>> +static void ivpu_hw_timeouts_init(struct ivpu_device *vdev)
>> +{
>> +    if (ivpu_is_simics(vdev) || ivpu_is_fpga(vdev)) {
> 
> I have seen such tests in multiple locations. Wouldn't it be better to write entirely different helpers for each?  Handling different models/revisions in the same function is usually bad advice.

I understand your point but we have just a couple usages in the whole driver and most of them affect just a single line.
We have separated all generation specific code in struct ivpu_hw_ops and have struct ivpu_wa_table to handle revision specific WAs,
so ivpu_is_*() usages are minimized.

Regards,
Jacek
