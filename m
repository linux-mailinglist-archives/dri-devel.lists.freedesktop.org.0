Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA604C0ADB2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 17:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730D610E1ED;
	Sun, 26 Oct 2025 16:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MD/9K14G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BBE10E0F1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 02:12:43 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-5d5f8e95d5eso2182644137.1
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 19:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761444761; x=1762049561; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xL6yZ/yFhmNmGvye1LiCJyEZQmyqAagjH85CK4Fh8qk=;
 b=MD/9K14G6S8AC3T3F83pWK3nzhZhcNJDe22sgQJpnSkmy3k3s7TTaZB/W4nisHRtyT
 2Jrk4KDAK0vwDRGz7KPYGmZzZhpWHBktuT5RpbwadBAyt6qyX2LxOsnuLRK31QfrLi79
 Yvx/xI2ktfuTtFkPEcahCPZ0qxWkDV+PSIUecwp3hTFKiPuX5fMnitkWD9XP7VFSsZMr
 +PKQENThhB32se2grbU3rloc+LUxOcycfIYcPCoBoSgZU2bZ41FkZ+oCxan438nLeg2F
 2TOVyG75MO0ld/WfuMWdkVu4xIwcWcunUh+gweGcQp7I7kj1X2Nk8NDToZHMWYbw7+l9
 dufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761444761; x=1762049561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xL6yZ/yFhmNmGvye1LiCJyEZQmyqAagjH85CK4Fh8qk=;
 b=fL/bQ/gSbqywha5Tk8vspOJou1dnFTWR2geLRuhwzuS6N+HHBSZQXD1oMedhalV6nh
 5UTple1saA/C96LdSry/i5UnOUaHSJu6ZZFLvTcgxmNvmJVz7+2g2v+RH0buQLTL/EQz
 OzQvFHDhf1ZyU0Oo1gpzLllv8fQvQWpatd37U31C1suUk719s1RktJUYWl6nyaprGrdW
 t4RbA1xIX6v0DhCEn56kHv+b93hKJQwBA92FT4oynTh3WObg0yyQ8eo+okXLevW82B3c
 HXVw2KIuF56wlS8bE/1lmjAYhfaLpqtOlC4Hoq9g0EggkYb+VZ7b1d6V6wxGD7qeZYXV
 haUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnOjMPCnrnXfVJzuxCCJsL7ZXYm9eQtsabXBxEfjqumb4o/g6xixkZ+xpVlwikUB3rpiSP0ElRnws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxpnZ6xyNySO5IFjV+Io9J/omhcvGGDMnurvW2/52CxyAOu1k9
 czN3Tqzx8j0l8hpMWf6SzRiT911jCAz/tSHo+DR0LAiNT9k/8oKrDzLtNnZSoPcFnu9qDb8Lcrt
 0z2kqU8p2k5OBO+QzKzrfRI3dYs9inYg=
X-Gm-Gg: ASbGncvaH2Y1EoKSAEoMzP9G6FPk0c6XTni94Q+XwnOHHNR46YHOBVvMj647bK6LPgj
 WIGPVrrCrqhRIJA9q2M6hZtbAg5AotR6+z1+nClwycD2nsTEnaK7wnGOEJKLRihTBJmtmmZnfQ3
 FlbAkTBZoZxH4c+RmBGIs+FNVqFf0q0GkjMMtkh/rdaI+l+mMOUtn90Oa+m5Jj//fHKoqjjS8Xp
 dOWU9I6tppGBRT/PMEkkUh5kOR7F36MXUu/RS0KHLt37wKRaHeKWlsp0yOwzehGz8s9nNgC
X-Google-Smtp-Source: AGHT+IE5fbA2DCFqDQtleRTLb2gV6MzX8pROJPpV+pPzqG3ajyBgO3UJ2zZrCG9BeRUsdJBQXF80eXHIzYjwMEmqU9w=
X-Received: by 2002:a05:6102:508b:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-5d7dd53f265mr10396957137.16.1761444761472; Sat, 25 Oct 2025
 19:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com>
In-Reply-To: <20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com>
From: Bjorn Andersson <andersson.kernel@gmail.com>
Date: Sat, 25 Oct 2025 21:15:12 -0500
X-Gm-Features: AWmQ_bmb0rE3ZH71wEvpaqrJgGtUrmO07lzDNNqQjT9VRL0qPatYtPlgOE8134w
Message-ID: <CAEQQ6OLaEh138CgW+OvMzt0AhYgGX5xJKXTpFLwQS7UF+qE-gQ@mail.gmail.com>
Subject: Re: [PATCH v2] accel/qaic: Add support for PM callbacks
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com, 
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com, 
 ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 26 Oct 2025 16:37:16 +0000
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

On Fri, Oct 24, 2025 at 11:29=E2=80=AFAM Youssef Samir
<youssef.abdulrahman@oss.qualcomm.com> wrote:
>
> Add initial support for suspend and hibernation PM callbacks to QAIC.

Tell me more. Say something about what needs to happen in order to
suspend etc...

>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
> Changes in v2:
> - Guard the pm callbacks with CONFIG_PM_SLEEP to fix openrisc build error
> - Add __maybe_unused to helper functions used only in PM callbacks curren=
tly
> - Link to v1: https://lore.kernel.org/all/20251022204005.3888195-1-yousse=
f.abdulrahman@oss.qualcomm.com
> ---
>  drivers/accel/qaic/qaic.h          |  2 +
>  drivers/accel/qaic/qaic_drv.c      | 93 ++++++++++++++++++++++++++++++
>  drivers/accel/qaic/qaic_timesync.c |  9 +++
>  drivers/accel/qaic/qaic_timesync.h |  3 +
>  4 files changed, 107 insertions(+)
>
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index 820d133236dd..2bfc4ce203c5 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -161,6 +161,8 @@ struct qaic_device {
>         struct mhi_device       *qts_ch;
>         /* Work queue for tasks related to MHI "QAIC_TIMESYNC" channel */
>         struct workqueue_struct *qts_wq;
> +       /* MHI "QAIC_TIMESYNC_PERIODIC" channel device */
> +       struct mhi_device       *mqts_ch;
>         /* Head of list of page allocated by MHI bootlog device */
>         struct list_head        bootlog;
>         /* MHI bootlog channel device */
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.=
c
> index e162f4b8a262..8d42866d758e 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -660,6 +660,94 @@ static const struct pci_error_handlers qaic_pci_err_=
handler =3D {
>         .reset_done =3D qaic_pci_reset_done,
>  };
>
> +static bool __maybe_unused qaic_is_under_reset(struct qaic_device *qdev)
> +{
> +       int rcu_id;
> +       bool ret;
> +
> +       rcu_id =3D srcu_read_lock(&qdev->dev_lock);
> +       ret =3D qdev->dev_state !=3D QAIC_ONLINE;
> +       srcu_read_unlock(&qdev->dev_lock, rcu_id);
> +       return ret;
> +}
> +
> +static bool __maybe_unused qaic_data_path_busy(struct qaic_device *qdev)
> +{
> +       int dev_rcu_id;
> +       bool ret;
> +       int i;
> +
> +       dev_rcu_id =3D srcu_read_lock(&qdev->dev_lock);
> +       if (qdev->dev_state !=3D QAIC_ONLINE) {
> +               srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
> +               return false;
> +       }
> +       for (i =3D 0; i < qdev->num_dbc; i++) {
> +               struct dma_bridge_chan *dbc =3D &qdev->dbc[i];
> +               unsigned long flags;
> +               int ch_rcu_id;
> +
> +               ch_rcu_id =3D srcu_read_lock(&dbc->ch_lock);
> +               if (!dbc->usr || !dbc->in_use) {
> +                       srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
> +                       continue;

Perhaps I'm missing something here, but what if you have num_dbc
number of unused dbcs?
Won't we continue until we exit the loop and then return ret, which
hasn't yet been initialized?

> +               }
> +               spin_lock_irqsave(&dbc->xfer_lock, flags);
> +               ret =3D !list_empty(&dbc->xfer_list);
> +               spin_unlock_irqrestore(&dbc->xfer_lock, flags);
> +               srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
> +               if (ret)
> +                       break;
> +       }
> +       srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
> +       return ret;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int qaic_pm_suspend(struct device *dev)
> +{
> +       struct qaic_device *qdev =3D pci_get_drvdata(to_pci_dev(dev));
> +
> +       dev_dbg(dev, "Suspending..\n");
> +       if (qaic_data_path_busy(qdev)) {
> +               dev_dbg(dev, "Device's datapath is busy. Aborting suspend=
..\n");
> +               return -EBUSY;
> +       }
> +       if (qaic_is_under_reset(qdev)) {
> +               dev_dbg(dev, "Device is under reset. Aborting suspend..\n=
");
> +               return -EBUSY;
> +       }
> +       qaic_mqts_ch_stop_timer(qdev->mqts_ch);
> +       qaic_pci_reset_prepare(qdev->pdev);
> +       pci_save_state(qdev->pdev);
> +       pci_disable_device(qdev->pdev);
> +       pci_set_power_state(qdev->pdev, PCI_D3hot);
> +       return 0;
> +}
> +
> +static int qaic_pm_resume(struct device *dev)
> +{
> +       struct qaic_device *qdev =3D pci_get_drvdata(to_pci_dev(dev));
> +       int ret;
> +
> +       dev_dbg(dev, "Resuming..\n");
> +       pci_set_power_state(qdev->pdev, PCI_D0);
> +       pci_restore_state(qdev->pdev);
> +       ret =3D pci_enable_device(qdev->pdev);
> +       if (ret) {
> +               dev_err(dev, "pci_enable_device failed on resume %d\n", r=
et);
> +               return ret;
> +       }
> +       pci_set_master(qdev->pdev);
> +       qaic_pci_reset_done(qdev->pdev);
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops qaic_pm_ops =3D {
> +       SET_SYSTEM_SLEEP_PM_OPS(qaic_pm_suspend, qaic_pm_resume)
> +};
> +#endif
> +
>  static struct pci_driver qaic_pci_driver =3D {
>         .name =3D QAIC_NAME,
>         .id_table =3D qaic_ids,
> @@ -667,6 +755,11 @@ static struct pci_driver qaic_pci_driver =3D {
>         .remove =3D qaic_pci_remove,
>         .shutdown =3D qaic_pci_shutdown,
>         .err_handler =3D &qaic_pci_err_handler,
> +       .driver =3D {
> +               #ifdef CONFIG_PM_SLEEP

No, that's not the right way, same with SET_SYSTEM_SLEEP_PM_OPS above.
See e.g. https://lore.kernel.org/all/20250708-arm-scmi-modern-pm-ops-v1-1-1=
4bc9c352888@kernel.org/

Regards,
Bjorn

> +               .pm =3D &qaic_pm_ops,
> +               #endif
> +       },
>  };
