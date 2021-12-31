Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2519482205
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 05:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5061910E21B;
	Fri, 31 Dec 2021 04:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8556510E21B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 04:48:23 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id kj16so23897978qvb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 20:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R53maEe/jvwfVpnz6cg55bUPaUGQxEAtSlPRSaJ2X7w=;
 b=R1yOXnIb4oliBKplgIaPGCmFfYmxfboQaJjmuYQZFquNG/rHO7k31hJ6Q4zZwHz5Fu
 LkUDe5vXTjp0eXRXRBE9A2MXZF1zCfKh74XyGGQedKrC5QQh/oMgbuldlrpKE412FfWL
 fY0JSDFERCvca8fkM1f7C71Vij/5kN+09wAHfluuJzk3kJGO2LxX30T8Gq3J8nVFayx8
 XGLrfBlWEoZUJKUDsbhx4RnSaW+Tl6u9KO0s2bRAWS8kzAZH7W4oGwNRWgYVY0PqdvH1
 dpAyO3r8wkDFZ7EE9qv87n8TstRiHiixsgElt1SRsxVwK/LWdV8C9Uc6SIYe1z5D2s3F
 rWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R53maEe/jvwfVpnz6cg55bUPaUGQxEAtSlPRSaJ2X7w=;
 b=rEiCAXs9JKwj2buvAUcMOEZ+bOv366keapr86WmdfP9792Wc2QMe0ZL5G2eNidV4Su
 gM851ZmHbJUxnSwQaHR+k8zmR6VFzzthm6he68R9QwZSupb2hZA3nyIpe7UvRDjyE3lr
 t5DArU0cC9WGQI078eG17nVfJ4OrLKmfBuMgxueJgOz32Eg8znKYldPhSnPdKLMTn8OY
 ld9dPT8FbZvxCFW6wLKiyrUTKVUewjJoyi7DYxb2TX5L/QNwMe2l4i3IvvJLw3/wQoss
 PBsXnCKGqRy90DFqLOVPDH14q7w/Lx+czd8mPQgAsLFzvQFbunkoQcnJIEIoM9glDITu
 5Oew==
X-Gm-Message-State: AOAM5338G1LvjhVDLmKJuU0/xGJNOMo2P/2SOXBoFOM4QjLlntPxeD49
 2rcgumG28DnF5h4Fn4dQ4/ehswX4z6e1T0EvqMe2ZA==
X-Google-Smtp-Source: ABdhPJw/EAiKiAXVcoRgkADJaLo/ew/8Ebw2meWTvaPQZnDXNRdQsY1jw9rc/OfqCuwE3dX/djM+8OgVD3yQJBPRAsM=
X-Received: by 2002:a05:6214:27cc:: with SMTP id
 ge12mr30123774qvb.122.1640926102469; 
 Thu, 30 Dec 2021 20:48:22 -0800 (PST)
MIME-Version: 1.0
References: <20211126023516.1108411-1-dmitry.baryshkov@linaro.org>
 <20211126023516.1108411-3-dmitry.baryshkov@linaro.org>
 <YcvgJcxWDfaSMVVg@builder.lan>
In-Reply-To: <YcvgJcxWDfaSMVVg@builder.lan>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 Dec 2021 07:48:11 +0300
Message-ID: <CAA8EJpqQrGFhD3+SCLZg5E2zzV_62v9=abcqK7LkOWDKYZo5Xg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dp: rewrite dss_module_power to use bulk
 clock functions
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: freedreno@lists.freedesktop.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI,

On Wed, 29 Dec 2021 at 07:12, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 25 Nov 20:35 CST 2021, Dmitry Baryshkov wrote:
>
> > In order to simplify DP code, drop hand-coded loops over clock arrays,
> > replacing them with clk_bulk_* functions.
> >
>
> I've yet to debug this, but applying the two patches and attaching an
> HDMI cable to my USB dongle results in the follwing splat on the 8350
> HDK.

Intersesting. The only major difference between original code and the
patches code in this function is the removal of `if (clk_arry[i].clk)`
condition in that function. Could yyou please check whether clocks are
properly parsed at the time you receive the hpd event?

If  we can not debug this issue,  I'd then propose to merge first
patch and let somebody else rewrite dp_clk_util to use clk_bulk_data.

>
> [   39.658840] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000000
> [   39.667883] Mem abort info:
> [   39.670774]   ESR =3D 0x96000006
> [   39.673940]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [   39.679417]   SET =3D 0, FnV =3D 0
> [   39.682582]   EA =3D 0, S1PTW =3D 0
> [   39.685825]   FSC =3D 0x06: level 2 translation fault
> [   39.690851] Data abort info:
> [   39.693838]   ISV =3D 0, ISS =3D 0x00000006
> [   39.697797]   CM =3D 0, WnR =3D 0
> [   39.700864] user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000010eb8d00=
0
> [   39.707501] [0000000000000000] pgd=3D080000010f097003, p4d=3D080000010=
f097003, pud=3D080000010ba58003, pmd=3D0000000000000000
> [   39.718425] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [   39.724169] Modules linked in: pmic_glink_altmode qcom_pmic_glink_powe=
r cfg80211 rfkill 8021q garp mrp stp llc microchip lan78xx snd_soc_hdmi_cod=
ec pmic_glink pdr_interface rpmsg_char qrtr_smd qrtr fsa4480 qcom_q6v5_pas =
qcom_pil_info i2c_qcom_geni qcom_q6v5 msm qcom_sysmon qcom_stats gpu_sched =
crct10dif_ce drm_kms_helper qcom_common qcom_glink_smem gpucc_sm8350 phy_qc=
om_qmp mdt_loader typec ufs_qcom qmi_helpers qcom_rng socinfo qnoc_sm8350 r=
mtfs_mem fuse drm ipv6
> [   39.766330] CPU: 0 PID: 85 Comm: kworker/0:3 Not tainted 5.16.0-rc5-ne=
xt-20211215-00046-g2f90133452d9 #280
> [   39.776256] Hardware name: Qualcomm Technologies, Inc. SM8350 HDK (DT)
> [   39.782969] Workqueue: events pmic_glink_altmode_worker [pmic_glink_al=
tmode]
> [   39.790235] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [   39.797393] pc : __pi_strcmp+0x1c/0xf0
> [   39.801271] lr : dp_ctrl_set_clock_rate+0x8c/0xf0 [msm]
> [   39.806737] sp : ffff800008adbbc0
> [   39.810153] x29: ffff800008adbbc0 x28: 0000000000000000 x27: 000000000=
0000000
> [   39.817501] x26: ffffb60107f74270 x25: ffff297a49b33c80 x24: 000000002=
02fbf00
> [   39.824846] x23: 0000000000000001 x22: ffff297a4b400580 x21: 000000000=
0000020
> [   39.832188] x20: ffffb600e3d78068 x19: 0000000000000000 x18: fffffffff=
fffffff
> [   39.839541] x17: 6b6c63206e6f2030 x16: ffffb601063476c0 x15: 072007200=
7200720
> [   39.846893] x14: 0720072007200720 x13: ffffb60107c622c8 x12: 000000000=
0000765
> [   39.854229] x11: 0000000000000277 x10: 0101010101010101 x9 : ffffb6010=
7c622c8
> [   39.861565] x8 : 00000000ffffefff x7 : 0000000000000000 x6 : ffffb6010=
7cba2c8
> [   39.868902] x5 : 0000000000000000 x4 : ffff297cbe8619d8 x3 : 000000000=
0000000
> [   39.876240] x2 : 0000000000000000 x1 : ffffb600e3d78068 x0 : 000000000=
0000000
> [   39.883594] Call trace:
> [   39.886124]  __pi_strcmp+0x1c/0xf0
> [   39.889638]  dp_ctrl_enable_mainlink_clocks+0x98/0x110 [msm]
> [   39.895537]  dp_ctrl_on_link+0x98/0x3f0 [msm]
> [   39.900096]  dp_display_process_hpd_high+0xa8/0x100 [msm]
> [   39.905731]  dp_display_usbpd_attention_cb+0x164/0x1a4 [msm]
> [   39.911629]  dp_hpd_oob_event+0x74/0xa4 [msm]
> [   39.916195]  dp_display_oob_hotplug_event+0x1c/0x2c [msm]
> [   39.921831]  dp_oob_hotplug_event+0x18/0x24 [msm]
> [   39.926756]  drm_connector_oob_hotplug_event+0x40/0x60 [drm]
> [   39.932686]  pmic_glink_altmode_worker+0x7c/0x194 [pmic_glink_altmode]
> [   39.939398]  process_one_work+0x1d0/0x350
> [   39.943526]  worker_thread+0x13c/0x460
> [   39.947390]  kthread+0x17c/0x190
> [   39.950722]  ret_from_fork+0x10/0x20
> [   39.954416] Code: f24008ff 540003e1 f2400807 54000241 (f8408402)
> [   39.960684] ---[ end trace 0000000000000000 ]---
>
> Regards,
> Bjorn



--=20
With best wishes
Dmitry
