Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1229145E3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419B210E3C0;
	Mon, 24 Jun 2024 09:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XLuZubXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D0310E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:10:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D77BF60AD6;
 Mon, 24 Jun 2024 09:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB462C32782;
 Mon, 24 Jun 2024 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719220245;
 bh=y4xUO3jxNw/ZmGe51kYBe2wyZyl1YnzEwo1P/bPyOMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLuZubXgXhgoaBVMtSYDYH3r2PwiWkCpjlI5gAyD32fAIItFf5RZe8bCQO3U0t/do
 Ix8Afla9Z2OFAdoA4OpuHP2y2DzX4U7floyBjDGLOpAqoF1KBx2YB7VIkrqy1G9yDy
 HeYeAwlG1igADzYB1Ud5XT5B1pEJxTuOfASrMsO0tGcQPZNRWImdq8Wea34nSXSTSh
 t22sMbaq6tpqkHFbKsCRzJjAKU06/Ks8qhXQljeZ0PySy3YhJ4BV1QKF5hWptjh7aT
 v8dD8MLI166mdWzDuctPalRCNiKC56VRlDkgqFyW33IrMvKMY3VK/Pb1AMISAI05fU
 +fX5C/Zs1Ak4w==
Date: Mon, 24 Jun 2024 12:10:41 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Message-ID: <20240624091041.GB29266@unreal>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-12-oshpigelman@habana.ai>
 <20240613191828.GJ4966@unreal>
 <fbb34afa-8a38-4124-9384-9b858ce2c4e5@habana.ai>
 <20240617190429.GB4025@unreal>
 <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
 <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
 <29704025-fba4-434a-9a43-ed2184a322f9@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29704025-fba4-434a-9a43-ed2184a322f9@habana.ai>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 24, 2024 at 08:47:41AM +0000, Omer Shpigelman wrote:
> On 6/19/24 13:52, Leon Romanovsky wrote:
> > On Wed, Jun 19, 2024 at 09:27:54AM +0000, Omer Shpigelman wrote:
> >> On 6/18/24 15:58, Leon Romanovsky wrote:
> >>> On Tue, Jun 18, 2024 at 11:08:34AM +0000, Omer Shpigelman wrote:
> >>>> On 6/17/24 22:04, Leon Romanovsky wrote:
> >>>>> [Some people who received this message don't often get email from leon@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >>>>>
> >>>>> On Mon, Jun 17, 2024 at 05:43:49PM +0000, Omer Shpigelman wrote:
> >>>>>> On 6/13/24 22:18, Leon Romanovsky wrote:
> >>>>>>> [Some people who received this message don't often get email from leon@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >>>>>>>
> >>>>>>> On Thu, Jun 13, 2024 at 11:22:04AM +0300, Omer Shpigelman wrote:
> >>>>>>>> Add an RDMA driver of Gaudi ASICs family for AI scaling.
> >>>>>>>> The driver itself is agnostic to the ASIC in action, it operates according
> >>>>>>>> to the capabilities that were passed on device initialization.
> >>>>>>>> The device is initialized by the hbl_cn driver via auxiliary bus.
> >>>>>>>> The driver also supports QP resource tracking and port/device HW counters.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
> >>>>>>>> Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
> >>>>>>>> Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
> >>>>>>>> Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
> >>>>>>>> Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
> >>>>>>>> Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
> >>>>>>>> Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
> >>>>>>>> Co-developed-by: David Meriin <dmeriin@habana.ai>
> >>>>>>>> Signed-off-by: David Meriin <dmeriin@habana.ai>
> >>>>>>>> Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
> >>>>>>>> Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
> >>>>>>>> Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
> >>>>>>>> Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
> >>>>>>>
> >>>>>>> I afraid that you misinterpreted the "Co-developed-by" tag. All these
> >>>>>>> people are probably touch the code and not actually sit together at
> >>>>>>> the same room and write the code together. So, please remove the
> >>>>>>> extensive "Co-developed-by" tags.
> >>>>>>>
> >>>>>>> It is not full review yet, but simple pass-by-comments.
> >>>>>>>
> >>>>>>
> >>>>>> Actually except of two, all of the mentioned persons sat in the same room
> >>>>>> and developed the code together.
> >>>>>> The remaining two are located on a different site (but also together).
> >>>>>> Isn't that what "Co-developed-by" tag for?
> >>>>>> I wanted to give them credit for writing the code but I can remove if it's
> >>>>>> not common.
> >>>>>
> >>>>> Signed-off-by will be enough to give them credit.
> >>>>>
> >>>>
> >>>> Ok, good enough.
> >>>>
> >>>>>>
> >>>>>>>> ---
> >>>>>>>>  MAINTAINERS                              |   10 +
> >>>>>>>>  drivers/infiniband/Kconfig               |    1 +
> >>>>>>>>  drivers/infiniband/hw/Makefile           |    1 +
> >>>>>>>>  drivers/infiniband/hw/hbl/Kconfig        |   17 +
> >>>>>>>>  drivers/infiniband/hw/hbl/Makefile       |    8 +
> >>>>>>>>  drivers/infiniband/hw/hbl/hbl.h          |  326 +++
> >>>>>>>>  drivers/infiniband/hw/hbl/hbl_main.c     |  478 ++++
> >>>>>>>>  drivers/infiniband/hw/hbl/hbl_verbs.c    | 2686 ++++++++++++++++++++++
> >>>>>>>>  include/uapi/rdma/hbl-abi.h              |  204 ++
> >>>>>>>>  include/uapi/rdma/hbl_user_ioctl_cmds.h  |   66 +
> >>>>>>>>  include/uapi/rdma/hbl_user_ioctl_verbs.h |  106 +
> >>>>>>>>  include/uapi/rdma/ib_user_ioctl_verbs.h  |    1 +
> >>>>>>>>  12 files changed, 3904 insertions(+)
> >>>>>>>>  create mode 100644 drivers/infiniband/hw/hbl/Kconfig
> >>>>>>>>  create mode 100644 drivers/infiniband/hw/hbl/Makefile
> >>>>>>>>  create mode 100644 drivers/infiniband/hw/hbl/hbl.h
> >>>>>>>>  create mode 100644 drivers/infiniband/hw/hbl/hbl_main.c
> >>>>>>>>  create mode 100644 drivers/infiniband/hw/hbl/hbl_verbs.c
> >>>>>>>>  create mode 100644 include/uapi/rdma/hbl-abi.h
> >>>>>>>>  create mode 100644 include/uapi/rdma/hbl_user_ioctl_cmds.h
> >>>>>>>>  create mode 100644 include/uapi/rdma/hbl_user_ioctl_verbs.h
> >>>>>>>
> >>>>>>> <...>
> >>>>>>>
> >>>>>>>> +#define hbl_ibdev_emerg(ibdev, format, ...)  ibdev_emerg(ibdev, format, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_alert(ibdev, format, ...)  ibdev_alert(ibdev, format, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_crit(ibdev, format, ...)   ibdev_crit(ibdev, format, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_err(ibdev, format, ...)    ibdev_err(ibdev, format, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_warn(ibdev, format, ...)   ibdev_warn(ibdev, format, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_notice(ibdev, format, ...) ibdev_notice(ibdev, format, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_info(ibdev, format, ...)   ibdev_info(ibdev, format, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_dbg(ibdev, format, ...)    ibdev_dbg(ibdev, format, ##__VA_ARGS__)
> >>>>>>>> +
> >>>>>>>> +#define hbl_ibdev_emerg_ratelimited(ibdev, fmt, ...)         \
> >>>>>>>> +     ibdev_emerg_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_alert_ratelimited(ibdev, fmt, ...)         \
> >>>>>>>> +     ibdev_alert_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_crit_ratelimited(ibdev, fmt, ...)          \
> >>>>>>>> +     ibdev_crit_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_err_ratelimited(ibdev, fmt, ...)           \
> >>>>>>>> +     ibdev_err_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_warn_ratelimited(ibdev, fmt, ...)          \
> >>>>>>>> +     ibdev_warn_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_notice_ratelimited(ibdev, fmt, ...)                \
> >>>>>>>> +     ibdev_notice_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_info_ratelimited(ibdev, fmt, ...)          \
> >>>>>>>> +     ibdev_info_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> >>>>>>>> +#define hbl_ibdev_dbg_ratelimited(ibdev, fmt, ...)           \
> >>>>>>>> +     ibdev_dbg_ratelimited(ibdev, fmt, ##__VA_ARGS__)
> >>>>>>>> +
> >>>>>>>
> >>>>>>> Please don't redefine the existing macros. Just use the existing ones.
> >>>>>>>
> >>>>>>>
> >>>>>>> <...>
> >>>>>>>
> >>>>>>
> >>>>>> That's a leftover from some debug code. I'll remove.
> >>>>>>
> >>>>>>>> +     if (hbl_ib_match_netdev(ibdev, netdev))
> >>>>>>>> +             ib_port = hbl_to_ib_port_num(hdev, netdev->dev_port);
> >>>>>>>> +     else
> >>>>>>>> +             return NOTIFY_DONE;
> >>>>>>>
> >>>>>>> It is not kernel coding style. Please write:
> >>>>>>> if (!hbl_ib_match_netdev(ibdev, netdev))
> >>>>>>>     return NOTIFY_DONE;
> >>>>>>>
> >>>>>>> ib_port = hbl_to_ib_port_num(hdev, netdev->dev_port);
> >>>>>>>
> >>>>>>
> >>>>>> I'll fix the code, thanks.
> >>>>>>
> >>>>>>>> +
> >>>>>>>
> >>>>>>> <...>
> >>>>>>>
> >>>>>>>> +static int hbl_ib_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
> >>>>>>>> +{
> >>>>>>>> +     struct hbl_aux_dev *aux_dev = container_of(adev, struct hbl_aux_dev, adev);
> >>>>>>>> +     struct hbl_ib_aux_ops *aux_ops = aux_dev->aux_ops;
> >>>>>>>> +     struct hbl_ib_device *hdev;
> >>>>>>>> +     ktime_t timeout;
> >>>>>>>> +     int rc;
> >>>>>>>> +
> >>>>>>>> +     rc = hdev_init(aux_dev);
> >>>>>>>> +     if (rc) {
> >>>>>>>> +             dev_err(&aux_dev->adev.dev, "Failed to init hdev\n");
> >>>>>>>> +             return -EIO;
> >>>>>>>> +     }
> >>>>>>>> +
> >>>>>>>> +     hdev = aux_dev->priv;
> >>>>>>>> +
> >>>>>>>> +     /* don't allow module unloading while it is attached */
> >>>>>>>> +     if (!try_module_get(THIS_MODULE)) {
> >>>>>>>
> >>>>>>> This part makes wonder, what are you trying to do here? What doesn't work for you
> >>>>>>> in standard driver core and module load mechanism?
> >>>>>>>
> >>>>>>
> >>>>>> Before auxiliary bus was introduced, we used EXPORT_SYMBOLs for inter
> >>>>>> driver communication. That incremented the refcount of the used module so
> >>>>>> it couldn't be removed while it is in use.
> >>>>>> Auxiliary bus usage doesn't increment the used module refcount and hence
> >>>>>> the used module can be removed while it is in use and that's something
> >>>>>> we don't want to allow.
> >>>>>> We could solve it by some global locking or in_use atomic but the most
> >>>>>> simple and clean way is just to increment the used module refcount on
> >>>>>> auxiliary device probe and decrement it on auxiliary device removal.
> >>>>>
> >>>>> No, you was supposed to continue to use EXPORT_SYMBOLs and don't
> >>>>> invent auxiliary ops structure (this is why you lost module
> >>>>> reference counting).
> >>>>>
> >>>>
> >>>> Sorry, but according to the auxiliary bus doc, a domain-specific ops
> >>>> structure can be used.
> >>>> We followed the usage example described at drivers/base/auxiliary.c.
> >>>> What am I missing? 
> >>>
> >>> Being the one who implemented auxiliary bus in the kernel and converted
> >>> number of drivers to use it, I strongly recommend do NOT follow the example
> >>> provided there.
> >>>
> >>> So you are missing "best practice", and "best practice" is to use
> >>> EXPORT_SYMBOLs and rely on module reference counting.
> >>>
> >>
> >> It is not just the usage example but also the general feature doc before
> >> it:
> >> "The generic behavior can be extended and specialized as needed by
> >> encapsulating an auxiliary_device within other domain-specific structures
> >> and the use of .ops callbacks."
> >> It is also mentioned there that the ops structure are used for specific
> >> auxiliary device operations while EXPORT_SYMBOLs should be used for common
> >> infrastrucure the parent driver exposes:
> >> "Note that ops are intended as a way to augment instance behavior within a
> >> class of auxiliary devices, it is not the mechanism for exporting common
> >> infrastructure from the parent."
> >> All of our ops callbacks are meant to provide functionality related to the
> >> auxiliary device, they are not just general/common infrastructure.
> > 
> > Of course they are common, otherwise why did you put them in common code?
> > For example, you have callbacks to lock and unlock internal HW access,
> > how is it not common?
> >
> 
> As I saw it, the "common" functions are general capabilities the parent
> driver exposes, not necessaritly related to the auxiliary device.
> But let me revisit this and try to restructure the code so the parent
> driver will use EXPORT_SYMBOLs.
>  
> >>
> >> Why do we have this doc if we should ignore it? why wasn't the doc
> >> modified according to the "best practice" you described? the doc is
> >> misleading.
> > 
> > Because this is how upstream kernel development works. We are trying to
> > come to the agreement and get the best solution for the problem. Sometimes,
> > the outcome of the discussion is not "the best solution", but "good
> > enough". This doc can be served as an example. Everyone involved in the
> > development of auxbus and later usage of it, were focused on implementation,
> > documentation was good enough as it didn't limit anyone who actually
> > used it.
> > 
> 
> I get your point but still I think that the doc is misleading if it shows
> a usage exmaple but practically no one should follow it.
> Better to remove this usage exmaple completely IMHO.

We (developers) didn't want that example in first place. I'm not going
to argue again in order to attempt to remove it.

> 
> >>
> >> Adding gregkh here as he requested the auxiliary bus feature IIRC.
> >> Greg - isn't the doc legit? should EXPORT_SYMBOLs necessarily be used
> >> together with auxiliary bus rather than ops structure?
> > 
> > This is not what you are doing here. You completely ditched EXPORT_SYMBOLs
> > and reinvented module reference counting which overcomplicated the code
> > just to avoid using standard kernel mechanism.
> > 
> >> As we saw it, auxiliary bus gives us the flexibility to choose which
> >> modules will be loaded while EXPORT_SYMBOLs enforces the dependencies
> >> which might not be needed in some cases.
> >>  
> >>>> Moreover, we'd like to support the mode where the IB or the ETH driver is
> >>>> not loaded at all. But this cannot be achieved if we use EXPORT_SYMBOLs
> >>>> exclusively for inter driver communication.
> >>>
> >>> It is not true and not how the kernel works. You can perfectly load core
> >>> driver without IB and ETH, at some extent this is how mlx5 driver works.
> >>>
> >>
> >> mlx5 IB driver doesn't export any symbol that is used by the core driver,
> >> that's why the core driver can be loaded without the IB driver (althought
> >> you'll get circular dependency if you would export).
> > 
> > Yes, IB and ETH drivers are "users" of core driver. As RDMA maintainer,
> > I'm reluctant to accept code that exports symbols from IB drivers to
> > other subsystems. We have drivers/infiniband/core/ for that.
> > 
> 
> So we'll need to restructure the code to follow this limitation. We'll
> take care of it for the next patch set version.
> BTW if you won't allow such driver specific EXPORT_SYMBOLs, I think it is
> good to have it documented similarly to other "don't do" guideliens in the
> infiniband doc.
> That's because in the net/ethernet subsystem for exmaple it is very common
> to add such driver specific EXPORT_SYMBOLs.

Yes, this is technical limitation, it is because PCI core (driver common code)
is located in drivers/net and not because of policy to accept EXPORT_SYMBOLs
in netdev.

If you put your driver common code in other place, you won't need any EXPORT_SYMBOLs
in drivers/net.

> 
> >> If relying on exported symbols only, then our IB and ETH drivers will need
> >> to export symbols too because the core driver accesses them post probing.
> > 
> > So you should fix your core driver. This is exactly what auxbus model
> > proposes.
> > 
> >> Hence we won't be able to load the core driver without both of them (or
> >> loading anything due to circular dependency).
> >> Unless we'll use dynamic symbol lookup and I don't think that's your
> >> intention.
> > 
> > No it is not.
> > 
> >>
> >>>>
> >>>>>>
> >>>>>>>> +             dev_err(hdev->dev, "Failed to increment %s module refcount\n",
> >>>>>>>> +                     module_name(THIS_MODULE));
> >>>>>>>> +             rc = -EIO;
> >>>>>>>> +             goto module_get_err;
> >>>>>>>> +     }
> >>>>>>>> +
> >>>>>>>> +     timeout = ktime_add_ms(ktime_get(), hdev->pending_reset_long_timeout * MSEC_PER_SEC);
> >>>>>>>> +     while (1) {
> >>>>>>>> +             aux_ops->hw_access_lock(aux_dev);
> >>>>>>>> +
> >>>>>>>> +             /* if the device is operational, proceed to actual init while holding the lock in
> >>>>>>>> +              * order to prevent concurrent hard reset
> >>>>>>>> +              */
> >>>>>>>> +             if (aux_ops->device_operational(aux_dev))
> >>>>>>>> +                     break;
> >>>>>>>> +
> >>>>>>>> +             aux_ops->hw_access_unlock(aux_dev);
> >>>>>>>> +
> >>>>>>>> +             if (ktime_compare(ktime_get(), timeout) > 0) {
> >>>>>>>> +                     dev_err(hdev->dev, "Timeout while waiting for hard reset to finish\n");
> >>>>>>>> +                     rc = -EBUSY;
> >>>>>>>> +                     goto timeout_err;
> >>>>>>>> +             }
> >>>>>>>> +
> >>>>>>>> +             dev_notice_once(hdev->dev, "Waiting for hard reset to finish before probing IB\n");
> >>>>>>>> +
> >>>>>>>> +             msleep_interruptible(MSEC_PER_SEC);
> >>>>>>>> +     }
> >>>>>>>
> >>>>>>> The code above is unexpected.
> >>>>>>>
> >>>>>>
> >>>>>> We have no control on when the user insmod the IB driver.
> >>>>>
> >>>>> It is not true, this is controlled through module dependencies
> >>>>> mechanism.
> >>>>>
> >>>>
> >>>> Yeah, if we would use EXPORT_SYMBOLs for inter driver communication but
> >>>> we don't.
> >>>
> >>> So please use it and don't add complexity where it is not needed.
> >>>
> >>>>
> >>>>>> As a result it is possible that the IB auxiliary device will be probed
> >>>>>> while the compute device is under reset (due to some HW error).
> >>>>>
> >>>>> No, it is not possible. If you structure your driver right.
> >>>>>
> >>>>
> >>>> Again, it is not possible if we would use EXPORT_SYMBOLs.
> >>>> Please let me know if we misunderstood something because AFAIU we followed
> >>>> the auxiliary bus doc usage example.
> >>>
> >>> It is better to follow actual drivers that use auxiliary bus and see how
> >>> they implemented it and not rely on examples in the documentation.
> >>>
> >>
> >> But isn't that what the doc for? to explain the guidelines? and it's not
> >> that there is a big red note there of "this example should not be taken as
> >> is, please look at your subsystem guidelines".
> > 
> > At the beginning that doc was located in Documentation/ folder and no one
> > really cared about it. After moving from Documentation/ to drivers/base/auxiliary.c,
> > it became more visible, but still no one relied on it. You are first one
> > who read.
> > 
> > There is no subsystem rules here. Everyone relied on EXPORT_SYMBOLs and didn't
> > use ops structure. Kernel is evolving project, there is no need to find a rule
> > for everything.
> > 
> > Thanks
> > 
> >>
> >>> Thanks
> >>>
> >>>>
> >>>>> Thanks
