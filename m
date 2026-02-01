Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WZ8WDBGkf2k6vAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 20:05:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F77C7028
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 20:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4458410E0BE;
	Sun,  1 Feb 2026 19:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IlCqh/rI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4F710E0E6
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 19:05:47 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so40970175e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 11:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769972746; x=1770577546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbZr1S0wq4DvIcJzyCdoWjIoy42MmQpxH3r9aw2Tp3g=;
 b=IlCqh/rITl/hoopH4CgXtDNqbdW31H1XKX4xWHrBZBHWyh3VuZvG5QpInsRLnWoB4b
 YbvycPnFqCRyHULpzebUN8qf9zYEJBpGRGFqGRwJoDBBShHPN9XA2RNqcMN1tJKgZite
 fbLi+bRYZU8l2lHcRLf1YUFS0NSPoO5EgKI0w/t4sa6ZI18NMuRn8/E33JUP1+KVyRCL
 oaHsnc+Gnj3Lmq8ZLYYlOvuvRYdaV84jlZEoavVPVADum9Xi6SIzgvfSUIAAWRr+XKsZ
 sYR08SKa0Pr1axaqAFS1JXDw3lTjZVm69ZpW8g9kcVRu1xwS2bRMnR2UHR1vAorW9XcC
 x3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769972746; x=1770577546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EbZr1S0wq4DvIcJzyCdoWjIoy42MmQpxH3r9aw2Tp3g=;
 b=JIMQGbOaK8xR3CL5N6xZmw0Dmw+xSjHcnVJN3u8WTxGywyGNoiiDqfZwXMlt2IEfIW
 /nGnfApi5GvLFHG3Io99e8zN9rvfUZWeHfbTrGdxZ9mCMl1d0EhkOpSXjCzgtiISjkXS
 4eeuDV9ZblnlpU8i9t8RUX0UfxTYy2JBFwICK6dAZNLhrPyOySeoDXkkhOCTfL2KW8he
 sVRN3V+VNICmK8xZQ1ox1XczBZQ8i0z/9izOWm2vtD74q4jDGhv1tmPJafwjunP6c8V6
 U5/aa6DpiGRPj7Zimd9C5du5ePEu8MQzfcX9WIxQYCHm8aHVNC9xnoSo5tu0nbZDIOwu
 rmXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuIUPtXiXlJzPCjROHTY/TFI+NLSL1v2pplXt37b07LbjiW6EQxxyV6cvsQn5BHnnRvFObAagmp2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6djSH6TgaDxToE/zcRmNREIBRDD6oE9cMflG2lU/4zc+KNqjk
 yMJ3jFBu1Z5nK2CnKbyFA7Sm5HmFfZXteN9Gr+06+JD6iXlpMfFl9Agd
X-Gm-Gg: AZuq6aLT3ondsZ43+IgYbuJej+dIHyjR9JOAj5e+D67tasMFSPeZ+0uS7u4FHDKQ+3B
 mBke1CN+Q+OIQEntDCILL/WNHsaklhNlORROV15IhMyyOvHXkRQyreU4OL8K8VxVsL7kfhGMkqd
 W4fxyA1t1QK5fEZyssiDDaIddyV04M11GR7mUsg9QkVmn6h0e1bdrM9oDtlZYeAp+P2IRJwzhvu
 r1VPFz88aVTnZ/Zrrz+UOKXblPV05j9eeOCMn59oh7+q36ik4po2xXS3djV1BuxNsEoFOhVZUXz
 lUJIA9C/DaNVEfx24+Pvf0+8OpNQiM4xsYCsbdzhNXNnzKcQaYKi0jFZofipTWVGBgRnTmPT+D9
 J8SQTZhK4PfFWonBLDqN2S4CxYNqYIPENRNvpZ9T99KZhnI5W+nTRx0nk1f/bKd8DWOwFwUD8al
 Gur6ITqEjaENGGhA4Q5gJ1AWKom9yWP7rmc2V+LA==
X-Received: by 2002:a05:600c:4f8a:b0:477:76c2:49c9 with SMTP id
 5b1f17b1804b1-482db4568dbmr127721945e9.2.1769972745714; 
 Sun, 01 Feb 2026 11:05:45 -0800 (PST)
Received: from ionutnechita-arz2022.local
 ([2a02:2f0e:c200:300:376f:7d7f:40e7:f1de])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm39596541f8f.5.2026.02.01.11.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Feb 2026 11:05:45 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: alexdeucher@gmail.com
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 ionut_n2001@yahoo.com, linux-kernel@vger.kernel.org,
 sunlightlinux@gmail.com, superm1@kernel.org
Subject: Re: [PATCH 1/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
Date: Sun,  1 Feb 2026 21:05:36 +0200
Message-ID: <20260201190535.18575-2-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CADnq5_MSvWLVqhgkdaYn6bjPC2L2=jf5v=h3n1cx=ZYgnXLQPQ@mail.gmail.com>
References: <20260126194057.7376-2-sunlightlinux@gmail.com>
 <CADnq5_MSvWLVqhgkdaYn6bjPC2L2=jf5v=h3n1cx=ZYgnXLQPQ@mail.gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,yahoo.com,vger.kernel.org,gmail.com,kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:alexander.deucher@amd.com,m:amd-gfx@lists.freedesktop.org,m:christian.koenig@amd.com,m:ionut_n2001@yahoo.com,m:linux-kernel@vger.kernel.org,m:sunlightlinux@gmail.com,m:superm1@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sunlightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sunlightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 62F77C7028
X-Rspamd-Action: no action

Hi Alex,

Thank you for the quick response and for the information about hibernation support.

Here's the stack trace showing the call chain when the TLB flush failures occur. The issue happens in two places:

1. During resume (hibernation restore):

Call Trace:
 dump_stack_lvl+0x5b/0x80
 amdgpu_gmc_fw_reg_write_reg_wait+0x1c7/0x1d0 [amdgpu]
 gmc_v9_0_hw_init+0x2e2/0x390 [amdgpu]
 gmc_v9_0_resume+0x26/0x70 [amdgpu]
 amdgpu_ip_block_resume+0x27/0x50 [amdgpu]
 amdgpu_device_ip_resume_phase1+0x55/0x90 [amdgpu]
 amdgpu_device_resume+0x69/0x380 [amdgpu]
 amdgpu_pmops_resume+0x46/0x80 [amdgpu]
 dpm_run_callback+0x4a/0x150
 device_resume+0x1df/0x2f0
 async_resume+0x21/0x30
 async_run_entry_fn+0x36/0x160
 process_one_work+0x193/0x350
 worker_thread+0x2d7/0x410

2. Subsequent failures during command submission:

Call Trace:
 dump_stack_lvl+0x5b/0x80
 amdgpu_gmc_fw_reg_write_reg_wait+0x1c7/0x1d0 [amdgpu]
 amdgpu_gmc_flush_gpu_tlb+0xd0/0x280 [amdgpu]
 amdgpu_gart_invalidate_tlb.part.0+0x59/0x90 [amdgpu]
 amdgpu_ttm_alloc_gart+0x146/0x180 [amdgpu]
 amdgpu_cs_parser_bos.isra.0+0x5d6/0x7d0 [amdgpu]
 amdgpu_cs_ioctl+0xbd0/0x1aa0 [amdgpu]
 drm_ioctl_kernel+0xa6/0x100
 drm_ioctl+0x262/0x520
 amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]

Error message: "amdgpu 0000:04:00.0: amdgpu: failed to write reg 1a6f4 wait reg 1a706"

Full dmesg log available at: https://gitlab.freedesktop.org/-/project/4522/uploads/6a285ad2e24f4807e5d75c3f4ed5a7a1/dmesg-dump-stack.txt

Regarding the hibernation support issues you mentioned - I understand the limitations with secure boot and VRAM eviction. In my case, I have secure boot disabled and sufficient swap space, so the primary issue I'm encountering is this TLB flush failure.

I'm happy to test any patches or help with further debugging if needed.

Thanks,
Ionut
