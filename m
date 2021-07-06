Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944FB3BDBCF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 19:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217A76E049;
	Tue,  6 Jul 2021 17:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B20489E98
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 14:27:51 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4GK4dx3WRPz4wwpq
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 14:27:49 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="Y16UNDGD"
Date: Tue, 06 Jul 2021 14:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1625581663;
 bh=SgQpAsJ9mxloqctWnh+IXAOUwIaz3rNlD6raCUA59Uk=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Y16UNDGD8AS1eTSKSZ/RdlgYcyXmQ02K49BtmGG3jrfHY5m/nt4bdqVLpQ2eY5mN2
 mkMXOvhP2afg76d3JapZsQRW81eSY3Va5K1UzBrFyrlkofJkwua4+qQJoNjAXme9rL
 5fgDXI5GoIUhs55de+V09WJ1ypE1MYxmC3HbibB8=
To: "robdclark@gmail.com" <robdclark@gmail.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm: Improve the a6xx page fault handler
Message-ID: <QbrrDJ_pXCuxsLYXKZy56hDFipcbO3Ia4uGuQACpRDutDVusZak3N4GNQ2RVHH0VZHFkbsdyfcexqI1CUFFQ-f89hk4p4ZXKe6sU0vyL5rw=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Tue, 06 Jul 2021 17:00:45 +0000
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "saiprakash.ranjan@codeaurora.org" <saiprakash.ranjan@codeaurora.org>,
 "jcrouse@codeaurora.org" <jcrouse@codeaurora.org>,
 "jonathan@marek.ca" <jonathan@marek.ca>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "smasetty@codeaurora.org" <smasetty@codeaurora.org>,
 "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "akhilpo@codeaurora.org" <akhilpo@codeaurora.org>,
 "eric@anholt.net" <eric@anholt.net>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "hoegsberg@google.com" <hoegsberg@google.com>,
 "angelogioacchino.delregno@somainline.org"
 <angelogioacchino.delregno@somainline.org>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In-Reply-To: <20210610214431.539029-4-robdclark@gmail.com>

On Thu 10 Jun 16:44 CDT 2021, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
>
> Use the new adreno-smmu-priv fault info function to get more SMMU
> debug registers and print the current TTBR0 to debug per-instance
> pagetables and figure out which GPU block generated the request.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  4 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 76 +++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_iommu.c       | 11 +++-
>  drivers/gpu/drm/msm/msm_mmu.h         |  4 +-
>  4 files changed, 87 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index f46562c12022..eb030b00bff4 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1075,7 +1075,7 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ring=
buffer *ring)
>  =09return true;
>  }
>
> -static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
> +static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, =
void *data)
>  {
>  =09struct msm_gpu *gpu =3D arg;
>  =09pr_warn_ratelimited("*** gpu fault: iova=3D%08lx, flags=3D%d (%u,%u,%=
u,%u)\n",
> @@ -1085,7 +1085,7 @@ static int a5xx_fault_handler(void *arg, unsigned l=
ong iova, int flags)
>  =09=09=09gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
>  =09=09=09gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
>
> -=09return -EFAULT;
> +=09return 0;
>  }
>
>  static void a5xx_cp_err_irq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index c7f0ddb12d8f..fc19db10bff1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1032,18 +1032,88 @@ static void a6xx_recover(struct msm_gpu *gpu)
>  =09msm_gpu_hw_init(gpu);
>  }
>
> -static int a6xx_fault_handler(void *arg, unsigned long iova, int flags)
> +static const char *a6xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
> +{
> +=09static const char *uche_clients[7] =3D {
> +=09=09"VFD", "SP", "VSC", "VPC", "HLSQ", "PC", "LRZ",
> +=09};
> +=09u32 val;
> +
> +=09if (mid < 1 || mid > 3)
> +=09=09return "UNKNOWN";
> +
> +=09/*
> +=09 * The source of the data depends on the mid ID read from FSYNR1.
> +=09 * and the client ID read from the UCHE block
> +=09 */
> +=09val =3D gpu_read(gpu, REG_A6XX_UCHE_CLIENT_PF);
> +
> +=09/* mid =3D 3 is most precise and refers to only one block per client =
*/
> +=09if (mid =3D=3D 3)
> +=09=09return uche_clients[val & 7];
> +
> +=09/* For mid=3D2 the source is TP or VFD except when the client id is 0=
 */
> +=09if (mid =3D=3D 2)
> +=09=09return ((val & 7) =3D=3D 0) ? "TP" : "TP|VFD";
> +
> +=09/* For mid=3D1 just return "UCHE" as a catchall for everything else *=
/
> +=09return "UCHE";
> +}
> +
> +static const char *a6xx_fault_block(struct msm_gpu *gpu, u32 id)
> +{
> +=09if (id =3D=3D 0)
> +=09=09return "CP";
> +=09else if (id =3D=3D 4)
> +=09=09return "CCU";
> +=09else if (id =3D=3D 6)
> +=09=09return "CDP Prefetch";
> +
> +=09return a6xx_uche_fault_block(gpu, id);
> +}
> +
> +#define ARM_SMMU_FSR_TF                 BIT(1)
> +#define ARM_SMMU_FSR_PF=09=09=09BIT(3)
> +#define ARM_SMMU_FSR_EF=09=09=09BIT(4)
> +
> +static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, =
void *data)
>  {
>  =09struct msm_gpu *gpu =3D arg;
> +=09struct adreno_smmu_fault_info *info =3D data;
> +=09const char *type =3D "UNKNOWN";
>
> -=09pr_warn_ratelimited("*** gpu fault: iova=3D%08lx, flags=3D%d (%u,%u,%=
u,%u)\n",
> +=09/*
> +=09 * Print a default message if we couldn't get the data from the
> +=09 * adreno-smmu-priv
> +=09 */
> +=09if (!info) {
> +=09=09pr_warn_ratelimited("*** gpu fault: iova=3D%.16lx flags=3D%d (%u,%=
u,%u,%u)\n",
>  =09=09=09iova, flags,
>  =09=09=09gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
>  =09=09=09gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
>  =09=09=09gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
>  =09=09=09gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
>
> -=09return -EFAULT;
> +=09=09return 0;
> +=09}
> +
> +=09if (info->fsr & ARM_SMMU_FSR_TF)
> +=09=09type =3D "TRANSLATION";
> +=09else if (info->fsr & ARM_SMMU_FSR_PF)
> +=09=09type =3D "PERMISSION";
> +=09else if (info->fsr & ARM_SMMU_FSR_EF)
> +=09=09type =3D "EXTERNAL";
> +
> +=09pr_warn_ratelimited("*** gpu fault: ttbr0=3D%.16llx iova=3D%.16lx dir=
=3D%s type=3D%s source=3D%s (%u,%u,%u,%u)\n",
> +=09=09=09info->ttbr0, iova,
> +=09=09=09flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ", type,
> +=09=09=09a6xx_fault_block(gpu, info->fsynr1 & 0xff),
> +=09=09=09gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
> +=09=09=09gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
> +=09=09=09gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
> +=09=09=09gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
> +
> +=09return 0;
>  }
>
>  static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_io=
mmu.c
> index 50d881794758..6975b95c3c29 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -211,8 +211,17 @@ static int msm_fault_handler(struct iommu_domain *do=
main, struct device *dev,
>  =09=09unsigned long iova, int flags, void *arg)
>  {
>  =09struct msm_iommu *iommu =3D arg;
> +=09struct adreno_smmu_priv *adreno_smmu =3D dev_get_drvdata(iommu->base.=
dev);
> +=09struct adreno_smmu_fault_info info, *ptr =3D NULL;
> +
> +=09if (adreno_smmu->get_fault_info) {
> +=09=09adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);

Calling this on msm8996 causes a panic:

[   12.098593] [drm] Initialized msm 1.8.0 20130625 for 900000.mdss on mino=
r 0
[   12.115952] msm 900000.mdss: [drm:adreno_request_fw [msm]] loaded qcom/a=
530_pm4.fw from new location
[   12.117173] msm 900000.mdss: [drm:adreno_request_fw [msm]] loaded qcom/a=
530_pfp.fw from new location
[   12.118040] msm 900000.mdss: [drm:adreno_request_fw [msm]] loaded qcom/a=
530v3_gpmu.fw2 from new location
[   12.159807] fb0: switching to msm from simple
[   12.345745] q6asm-dai 9300000.remoteproc:smd-edge:apr:q6asm:dais: Adding=
 to iommu group 3
[   12.710132] Console: switching to colour dummy device 80x25
[   12.967929] Unable to handle kernel execute from non-executable memory a=
t virtual address ffff00008340a200
[   12.967949] Mem abort info:
[   12.967952]   ESR =3D 0x8600000f
[   12.967956]   EC =3D 0x21: IABT (current EL), IL =3D 32 bits
[   12.967962]   SET =3D 0, FnV =3D 0
[   12.967965]   EA =3D 0, S1PTW =3D 0
[   12.967969]   FSC =3D 0x0f: level 3 permission fault
[   12.967974] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000080ed20=
00
[   12.967980] [ffff00008340a200] pgd=3D180000017e548003, p4d=3D180000017e5=
48003, pud=3D180000017e1b5003, pmd=3D180000017e19a003, pte=3D006800010340af=
07
[   12.968004] Internal error: Oops: 8600000f [#1] PREEMPT SMP
[   12.968011] Modules linked in: q6asm_dai q6routing q6afe_dai q6adm q6asm=
 q6dsp_common q6afe q6core venus_enc venus_dec videobuf2_dma_contig videobu=
f2_memops panel_lgphilips_sw43101 apr ath10k_pci ath10k_core ath mac80211 l=
ibarc4 cfg80211 venus_core v4l2_mem2mem videobuf2_v4l2 videobuf2_common vid=
eodev mc hci_uart nxp_nci_i2c nxp_nci btqca nci bluetooth nfc rfkill msm pm=
i8998_haptics qcom_fg drm_kms_helper syscopyarea slim_qcom_ngd_ctrl sysfill=
rect pdr_interface sysimgblt fb_sys_fops qcom_q6v5_mss qcom_q6v5_pas qcom_p=
il_info qcom_q6v5 qcom_sysmon qcom_common qmi_helpers mdt_loader snd_soc_ap=
q8096 snd_soc_qcom_common socinfo rpmsg_char pwm_ir_tx rmtfs_mem snd_soc_wc=
d9335 regmap_slimbus snd_soc_core snd_compress slimbus snd_pcm snd_timer sn=
d soundcore atmel_mxt_ts drm drm_panel_orientation_quirks
[   12.968248] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.=
13.0+ #46
[   12.968255] Hardware name: Xiaomi Mi Note 2 (DT)
[   12.968261] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO BTYPE=3D--)
[   12.968268] pc : 0xffff00008340a200
[   12.968277] lr : msm_fault_handler+0x50/0xd0 [msm]
[   12.968381] sp : ffff800010003e30
[   12.968384] x29: ffff800010003e30 x28: ffff8000110c2ac0 x27: 00000000000=
00000
[   12.968398] x26: ffff800010d8c6e0 x25: ffff800000000000 x24: 00000000834=
01000
[   12.968412] x23: 0000000000000021 x22: ffff00008eeb2358 x21: 00000000000=
00000
[   12.968426] x20: 0000000083401000 x19: ffff00008c5a9780 x18: 00000000000=
00001
[   12.968439] x17: ffff8000ecd8b000 x16: ffff800010004000 x15: 00000000000=
04000
[   12.968453] x14: 002093508d830af8 x13: 00000000000046aa x12: 00000000000=
00040
[   12.968466] x11: ffff00008044a480 x10: ffff00008044a482 x9 : ffff0000800=
1f068
[   12.968479] x8 : ffff000080450028 x7 : 0000000000000000 x6 : ffff0000804=
50128
[   12.968492] x5 : ffff800008db1d60 x4 : ffff00008c5a9780 x3 : 00000000000=
00000
[   12.968505] x2 : ffff00008340a200 x1 : ffff800010003e60 x0 : ffff800008d=
da9b0
[   12.968519] Call trace:
[   12.968524]  0xffff00008340a200
[   12.968529]  report_iommu_fault+0x20/0x3c
[   12.968543]  arm_smmu_context_fault+0x120/0x24c
[   12.968550]  __handle_irq_event_percpu+0x54/0x170
[   12.968559]  handle_irq_event+0x64/0x140
[   12.968566]  handle_fasteoi_irq+0xa4/0x1a0
[   12.968574]  handle_domain_irq+0x60/0x90
[   12.968581]  gic_handle_irq+0xb8/0x140
[   12.968590]  call_on_irq_stack+0x2c/0x5c
[   12.968599]  do_interrupt_handler+0x54/0x60
[   12.968606]  el1_interrupt+0x30/0x80
[   12.968615]  el1h_64_irq_handler+0x18/0x24
[   12.968621]  el1h_64_irq+0x78/0x7c
[   12.968626]  cpuidle_enter_state+0x12c/0x2f0
[   12.968638]  cpuidle_enter+0x38/0x50
[   12.968645]  do_idle+0x21c/0x2ac
[   12.968655]  cpu_startup_entry+0x28/0x80
[   12.968661]  rest_init+0xe4/0xf4
[   12.968668]  arch_call_rest_init+0x10/0x1c
[   12.968676]  start_kernel+0x64c/0x68c
[   12.968682]  __primary_switched+0xc0/0xc8
[   12.968692] Code: 00000000 00000000 00000000 00000000 (08debf98)
[   12.968705] ---[ end trace f35e302241530712 ]---
[   12.975177] Kernel panic - not syncing: Oops: Fatal exception in interru=
pt
[   12.975188] SMP: stopping secondary CPUs
[   13.175353] Kernel Offset: 0x80000 from 0xffff800010000000
[   13.175359] PHYS_OFFSET: 0x80000000
[   13.175363] CPU features: 0x0c000251,20000842
[   13.175370] Memory Limit: none

It happens when I would usually get context faults caused by reserving cont=
inuous splash memory
for simplefb, like these:

[    7.830005] arm-smmu d00000.iommu: Unhandled context fault: fsr=3D0x402,=
 iova=3D0x834e0d00, fsynr=3D0x21, cbfrsynra=3D0x0, cb=3D0
[    7.836573] arm-smmu d00000.iommu: Unhandled context fault: fsr=3D0x402,=
 iova=3D0x8374e300, fsynr=3D0x21, cbfrsynra=3D0x0, cb=3D0
[    7.843071] arm-smmu d00000.iommu: Unhandled context fault: fsr=3D0x402,=
 iova=3D0x839bca00, fsynr=3D0x21, cbfrsynra=3D0x0, cb=3D0
[    7.849514] arm-smmu d00000.iommu: Unhandled context fault: fsr=3D0x402,=
 iova=3D0x835eab00, fsynr=3D0x21, cbfrsynra=3D0x0, cb=3D0
[    7.855912] arm-smmu d00000.iommu: Unhandled context fault: fsr=3D0x402,=
 iova=3D0x8384df00, fsynr=3D0x21, cbfrsynra=3D0x0, cb=3D0
[    7.862270] arm-smmu d00000.iommu: Unhandled context fault: fsr=3D0x402,=
 iova=3D0x83471f00, fsynr=3D0x21, cbfrsynra=3D0x0, cb=3D0
[    7.868568] arm-smmu d00000.iommu: Unhandled context fault: fsr=3D0x402,=
 iova=3D0x836ccf00, fsynr=3D0x21, cbfrsynra=3D0x0, cb=3D0
[    7.874846] arm-smmu d00000.iommu: Unhandled context fault: fsr=3D0x402,=
 iova=3D0x83923900, fsynr=3D0x21, cbfrsynra=3D0x0, cb=3D0
[    7.881100] arm-smmu d00000.iommu: Unhandled context fault: fsr=3D0x402,=
 iova=3D0x8353dd00, fsynr=3D0x21, cbfrsynra=3D0x0, cb=3D0
[    7.887329] arm-smmu d00000.iommu: Unhandled context fault: fsr=3D0x402,=
 iova=3D0x8378f800, fsynr=3D0x21, cbfrsynra=3D0x0, cb=3D0

But now I get a panic instead. Removing the memory reservation stops it fro=
m panicking,
although I do not think it should panic when getting any fault.

> +=09=09ptr =3D &info;
> +=09}
> +
>  =09if (iommu->base.handler)
> -=09=09return iommu->base.handler(iommu->base.arg, iova, flags);
> +=09=09return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
> +
>  =09pr_warn_ratelimited("*** fault: iova=3D%16lx, flags=3D%d\n", iova, fl=
ags);
>  =09return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.=
h
> index 61ade89d9e48..a88f44c3268d 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -26,7 +26,7 @@ enum msm_mmu_type {
>  struct msm_mmu {
>  =09const struct msm_mmu_funcs *funcs;
>  =09struct device *dev;
> -=09int (*handler)(void *arg, unsigned long iova, int flags);
> +=09int (*handler)(void *arg, unsigned long iova, int flags, void *data);
>  =09void *arg;
>  =09enum msm_mmu_type type;
>  };
> @@ -43,7 +43,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struc=
t iommu_domain *domain);
>  struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
>
>  static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *=
arg,
> -=09=09int (*handler)(void *arg, unsigned long iova, int flags))
> +=09=09int (*handler)(void *arg, unsigned long iova, int flags, void *dat=
a))
>  {
>  =09mmu->arg =3D arg;
>  =09mmu->handler =3D handler;
> --
> 2.31.1

