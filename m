Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58D2931028
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 10:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA7610E302;
	Mon, 15 Jul 2024 08:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jkDSK0yo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AC410E302
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 08:41:04 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-426744ca29bso2186065e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721032863; x=1721637663; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0wE9o0AoaxkCNt6yWEqEM1FfzrCaKVi8ZoRBGSgkms4=;
 b=jkDSK0yo3hvZvHp3RdTbKfko1bo7vOPnyspbzEWukLmBFUe0/8Sqn3m2t5/x9O3W41
 VnVXSV8SrfT1rHL/pxVa/SScsd9iFhVS7icTHyTo7NgzTzVPmrdOJU46kDHUE65i7mTG
 PS/fnFvPC1qCLZdglFcSEKJJZ/o3Hw/Xutb6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721032863; x=1721637663;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0wE9o0AoaxkCNt6yWEqEM1FfzrCaKVi8ZoRBGSgkms4=;
 b=cRE/KAeynUonCVOLox241YCZmgE+nnY92XGR3Xs3XgQG5ymuGM/SWVrX7RJBtB/5Ag
 OEoDstSnPmKP7y++5ESdbAvgO7oRTpiDXinlhPz8f51B783uplWEjUc+SH4q6yRGWy5U
 j4IooPF54K0gaY5YDsxwn5SpFWr1UTi15pgUXYF06xODQLEsG9oSvlRMW/JrAbkWRo1f
 Uj59y0DBLFZXotk4IWe7w6X5jTPL58qaRc6dwOyScKCEhlmmEXcmsOkQW5ODC4M3YjMm
 hR7D8C5yE8fJyXrfWyL/Le5Jtqsy7szRON8A7BdGbsO5pNK/rPzaPCOis88L4kRHAjSt
 pTOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0+UaMN+kGRrCXlwlBb6uyYzaDVCPk4xXj1qjZ+ZZBMIMz3A+PX0dKtsxSCYFKV/9V2XliEDYmVE/orrCwEKXTWD0wvePR7QhEaP6XleNk
X-Gm-Message-State: AOJu0Yw328bzEzRFfgbIpIpHjpClMp5PvRchGV2V2mA+xisjhDYaXM0O
 dA6HFmTeX7XEinmVNNSAnIBwZ2B+oVkWUO2UJzrzv2+3fnaMMrDFQPbpRgj+kG0=
X-Google-Smtp-Source: AGHT+IEnN6FOav9A3AKqXktLUvs+7f+spQpY4HMaSuJJNHw/kLWQn/dIV7dG+F9Zkj8/H4T8tKXNZA==
X-Received: by 2002:a05:600c:3b86:b0:426:5dd5:f245 with SMTP id
 5b1f17b1804b1-426708f1979mr107374755e9.2.1721032862752; 
 Mon, 15 Jul 2024 01:41:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2cc229sm112008435e9.38.2024.07.15.01.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 01:41:02 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:41:00 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: "Alexander F. Lent" <lx@xanderlent.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] accel/ivpu: Add missing MODULE_FIRMWARE metadata
Message-ID: <ZpTgnNxSNbbeEWQ8@phenom.ffwll.local>
Mail-Followup-To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 "Alexander F. Lent" <lx@xanderlent.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240709-fix-ivpu-firmware-metadata-v3-1-55f70bba055b@xanderlent.com>
 <35a7963e-e92b-4c73-b03d-a846e93adf5a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35a7963e-e92b-4c73-b03d-a846e93adf5a@linux.intel.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Wed, Jul 10, 2024 at 12:23:06PM +0200, Jacek Lawrynowicz wrote:
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

I'm assuming you'll also apply this one?
-Sima

> 
> On 09.07.2024 13:54, Alexander F. Lent wrote:
> > Modules that load firmware from various paths at runtime must declare
> > those paths at compile time, via the MODULE_FIRMWARE macro, so that the
> > firmware paths are included in the module's metadata.
> > 
> > The accel/ivpu driver loads firmware but lacks this metadata,
> > preventing dracut from correctly locating firmware files. Fix it.
> > 
> > Fixes: 9ab43e95f922 ("accel/ivpu: Switch to generation based FW names")
> > Fixes: 02d5b0aacd05 ("accel/ivpu: Implement firmware parsing and booting")
> > Signed-off-by: Alexander F. Lent <lx@xanderlent.com>
> > ---
> > Hi Jacek,
> > 
> > Thanks for catching the error, and for the more succinct comment.
> > Please find v3 attached.
> > ---
> > Changes in v3:
> > - Simplify comment, per review.
> > - Fix typo in 40xx firmware path, per review.
> > - Link to v2: https://lore.kernel.org/r/20240708-fix-ivpu-firmware-metadata-v2-1-78b953172026@xanderlent.com
> > 
> > Changes in v2:
> > - Only annotate the module with the production firmware paths, per review.
> > - Drop macros for de-duping firmware fileames, just use string literals, per review.
> > - Link to v1: https://lore.kernel.org/r/20240705-fix-ivpu-firmware-metadata-v1-1-704b73852d92@xanderlent.com
> > ---
> >  drivers/accel/ivpu/ivpu_fw.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> > index 1457300828bf..ef717802a3c8 100644
> > --- a/drivers/accel/ivpu/ivpu_fw.c
> > +++ b/drivers/accel/ivpu/ivpu_fw.c
> > @@ -58,6 +58,10 @@ static struct {
> >  	{ IVPU_HW_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
> >  };
> >  
> > +/* Production fw_names from the table above */
> > +MODULE_FIRMWARE("intel/vpu/vpu_37xx_v0.0.bin");
> > +MODULE_FIRMWARE("intel/vpu/vpu_40xx_v0.0.bin");
> > +
> >  static int ivpu_fw_request(struct ivpu_device *vdev)
> >  {
> >  	int ret = -ENOENT;
> > 
> > ---
> > base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
> > change-id: 20240704-fix-ivpu-firmware-metadata-3d02bd60768d
> > 
> > Best regards,

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
