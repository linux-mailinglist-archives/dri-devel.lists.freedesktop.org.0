Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C1074B144
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4133810E583;
	Fri,  7 Jul 2023 12:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE49710E594
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688734090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EfMknrC6+9RxXRyZ9sQNTUp5Tpq7QFsIJMh+iSfMYow=;
 b=YGYkvtaLzTHdYxT20pBi4NVjh/bZ8UfU4jFXX0NSpYJ1m08PwvLRLxnAGPJ6PRbwKaMiPE
 C0ezPnuvATFkIHekv9y5GVKESREk8Lv5jtL1/TEYUiPb3zwCyRRMm1ix3RMf3SSk1OGH8U
 TD6wY1PWOrdVXEwkYXfPww0WpdEJFT8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-T8OFoMtZNEOyBsE7TqpK0w-1; Fri, 07 Jul 2023 08:48:08 -0400
X-MC-Unique: T8OFoMtZNEOyBsE7TqpK0w-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-636073f0ebfso20271976d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 05:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688734088; x=1691326088;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EfMknrC6+9RxXRyZ9sQNTUp5Tpq7QFsIJMh+iSfMYow=;
 b=kf5kkN54MDI+Gcj6MEkLcugmhCXE2StlBpUrP0iNNYu1kSLIAOUM0abDjbcu1lqE85
 gEpEIwSvrNY3P0Jz9ZuSTsqxcCyYRMeK9PerJZ01hlrcAfJSiNQBT2Upwf88PrHyEsGK
 vh1cDzzhEClivkC77yOT6xeVMqByivMUHRU0G/9tTkc2INggE0SaBCb0QhSVyDKz4Hpj
 o7y9xcTvdpXfl+Bp1GBtDwJKYgj1PRLJw4Ue5fCjDyx+HKLSnuY6879pZHa+xsmkyHDV
 M2LaB1NZNI8T03D2fj2SNFXhyxQ8qDO6N281PXhS6JT0rM63QPFGohkwGUe1vHyJPrFQ
 Kglw==
X-Gm-Message-State: ABy/qLadpACH8yYDx+4lBipleZGzCANmDON+LZgntrSy2u8Ckq9xAjpU
 RdmIw5pqagblCchDHth9pcXbg1PQhGDXv7Bjanr1I+ER9YCOoAGkmUlBvyhHtah26XZ2DeIB9Pz
 2CP5XsloM0xBXCTqxAUh+YPyJ7mmt
X-Received: by 2002:a0c:f2cb:0:b0:62d:e82a:1146 with SMTP id
 c11-20020a0cf2cb000000b0062de82a1146mr4261589qvm.42.1688734088252; 
 Fri, 07 Jul 2023 05:48:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHKtXeUmAgSYAOgMsdgG0hLtctIuZVB3AQrB3lZ+KFKvH41Tw9xxtTSlJLqa99h2TibwwLdeQ==
X-Received: by 2002:a0c:f2cb:0:b0:62d:e82a:1146 with SMTP id
 c11-20020a0cf2cb000000b0062de82a1146mr4261577qvm.42.1688734087992; 
 Fri, 07 Jul 2023 05:48:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::5bb])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a0cda94000000b006362d4eeb6esm2022148qvj.144.2023.07.07.05.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 05:48:07 -0700 (PDT)
Date: Fri, 7 Jul 2023 14:48:06 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH v3 09/17] drm/imagination: Implement power management
Message-ID: <twmetot6wcg5j7wnqy2gqohhrwhsgaizz5psou5etur6cavjjj@fwky6irlxubt>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-10-sarah.walker@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eeov7a3u5ndf364o"
Content-Disposition: inline
In-Reply-To: <20230613144800.52657-10-sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 sumit.semwal@linaro.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eeov7a3u5ndf364o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 03:47:52PM +0100, Sarah Walker wrote:
> @@ -503,21 +506,31 @@ pvr_device_init(struct pvr_device *pvr_dev)
>       if (err)
>               goto err_device_clk_fini;
>
> +     /* Explicitly power the GPU so we can access control registers before the FW is booted. */
> +     err = pm_runtime_resume_and_get(dev);
> +     if (err)
> +             goto err_device_clk_fini;
> +
>       /* Map the control registers into memory. */
>       err = pvr_device_reg_init(pvr_dev);
>       if (err)
> -             goto err_device_clk_fini;
> +             goto err_pm_runtime_put;
>
>       /* Perform GPU-specific initialization steps. */
>       err = pvr_device_gpu_init(pvr_dev);
>       if (err)
>               goto err_device_reg_fini;
>
> +     pm_runtime_put_autosuspend(dev);
> +

You probably can use pm_runtime_put here

> @@ -532,12 +545,17 @@ pvr_device_init(struct pvr_device *pvr_dev)
>  void
>  pvr_device_fini(struct pvr_device *pvr_dev)
>  {
> +     struct drm_device *drm_dev = from_pvr_device(pvr_dev);
> +     struct device *dev = drm_dev->dev;
> +
>       /*
>        * Deinitialization stages are performed in reverse order compared to
>        * the initialization stages in pvr_device_init().
>        */
> +     pm_runtime_get_sync(dev);
>       pvr_device_gpu_fini(pvr_dev);
>       pvr_device_reg_fini(pvr_dev);

AFAIK gpu_fini releases the firmware and reg_fini drops the register
mapping address, I don't think you need the device powered up for that.

> @@ -130,6 +133,20 @@ struct pvr_device {
>
>       /** @fw_dev: Firmware related data. */
>       struct pvr_fw_device fw_dev;
> +
> +     struct {
> +             /** @work: Work item for watchdog callback. */
> +             struct delayed_work work;
> +
> +             /** @old_kccb_cmds_executed: KCCB command execution count at last watchdog poll. */
> +             u32 old_kccb_cmds_executed;
> +
> +             /** @kccb_stall_count: Number of watchdog polls KCCB has been stalled for. */
> +             u32 kccb_stall_count;
> +     } watchdog;
> +
> +     /** @lost: %true if the device has been lost. */
> +     bool lost;

The device being "lost" isn't clear to me. Does it mean it's
unresponsive or stuck somehow?

> @@ -1285,9 +1303,15 @@ pvr_probe(struct platform_device *plat_dev)
>
>       platform_set_drvdata(plat_dev, drm_dev);
>
> +     devm_pm_runtime_enable(&plat_dev->dev);
> +
> +     pm_runtime_set_autosuspend_delay(&plat_dev->dev, 50);
> +     pm_runtime_use_autosuspend(&plat_dev->dev);
> +     pvr_power_init(pvr_dev);

The name threw me off a bit. It doesn't look like it's power related but
you init the watchdog timer?

I can't really tell from that patch, but if it's not done in a later
patch you'll probably need a call to sprinkle your driver with a few
_mark_last_busy calls (at least in the job submission path?)

Maxime

--eeov7a3u5ndf364o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZKgJhgAKCRDj7w1vZxhR
xWlxAP9D4Z4qOGvU2FtRpZpUt4Hz149PslgzoR0Wzlkqufy29wEA3zRhOPu50wal
ryLC73sbR2uA3Nk4wcepMlW7vYRIkQs=
=YkOD
-----END PGP SIGNATURE-----

--eeov7a3u5ndf364o--

