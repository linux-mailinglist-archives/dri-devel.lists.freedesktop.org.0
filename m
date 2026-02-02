Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFUXG9BZgGns6wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 09:01:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C4C9710
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 09:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C071710E262;
	Mon,  2 Feb 2026 08:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B/9Gr2o3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA97B10E262
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 08:01:16 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-c65822dead7so1600517a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 00:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770019276; x=1770624076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gpa7TO42qLDaaK7rvjxkwHnmN2Z6us+3ErmDg7wFIC0=;
 b=B/9Gr2o35jGJF1Vt1eYi/C09MlZLX81f5T1SXccGD2SaQxl8iwdMey/0Z9wyTePK+O
 Ns9GHZ+TcbLAJnSrsZSup9/KARaQ4zcu4XFKQjwmLC6P7rrD8mhUHs1GQK1pnyLYT9z1
 E7YgqjQat31TdrnzeQ3MYyw+9htF6QogEI1tYKN+PVWtteuGGWcT9SrDOOTzZZnB1qXG
 v5XNfgdUMq65vmyDUu88uhQCQafLN/0zVdaKAr8P0iG4O/YJiNztuLF6hBnp1obbZGOk
 VkM/tjUtSQKrMzEU3BfJKZ0YvpVNJ2rKQSjECHIIJTSMcnXLGSB/D5fjS28l1R8OFJbO
 4AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770019276; x=1770624076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gpa7TO42qLDaaK7rvjxkwHnmN2Z6us+3ErmDg7wFIC0=;
 b=Ba/eYlVoqeOOkNVnHst+L5Wk0eKZLSjMcOcLdtW/n0nZTnAxGBX3enxMpONw8lJRsp
 pcXbB5xHQMaq/mMJnTUXftaYIue7nctl0IT+ub0MuLIxkMlz5QQggvXLcciLqWlsMVMx
 8Ru85eeEXSgW1qNuItb0mbWauR6/kiMfy1/iJJp6cmyvZosnk75qK7MQXD+Xo29lk1SE
 oGcKDtuWRM7mzD3Rvd2aG2RU8jed79x1lU/ARrQHuWJx/dCLKjj1XKXjG1GrLVByfH26
 Lt5WRauT/AVYUsgqMkBj7VUIe+z3mlA+28oTFnCfJvirNERdPOdjqNQz3XJU8XbBQNju
 czMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUKHNVmmmbIfR6kFFmBGXY/NGIABFSZmII8oZULQjU2k8MGkjXZvxuST14zEr7nhUOxfwcewMkXxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbSReIhVk0G+Nm6HEfOBLhtdfLTVWz23KCbVmX4FTWzl/gknoq
 7PQ/nRJMpmNiMlStz5c267UwhzZ9mPVPVb6oc/8bxu/cMYN79iDlN/A=
X-Gm-Gg: AZuq6aIjVGxZiMXnWdWwsISXbD8nz0zla7Ndx7V7bzHe0Ur/WuT27yi8qbymdHMo7GP
 ZxmpGNREgG229UD06okk6bQJfzqusklCCHclOA/PGAZ1eOwntBLVWMiXyy4xeCAAZgv9uW1mKL2
 9e6V3B/LJC5rxtPHzRgq7VYYVYsg3O9ipNZ5P+m/YfQGoVf3Kd6dIvBiFViZun6YRD8bfT9qXFi
 2MdNa0ulninswEScW5C9XckmPR/2ahiOLb9x4YPUeuXHHjIlH0+CzkQwMKkosqE63pBMsVFTboa
 IMvsFcHnco2hjNp8OEqBJ/fRLT5tVRolKeQDolNW1niEtBlIWo0IEuysOEMSL6oyNTzN+waPct8
 s37RkaWJljwV63CS5GpGY+td5Md3OEAHsYpWIBYBweKSZZW3AxZJMA7u6Ofg6ki2DjceZdGBki/
 srYSf5wK+Em28aI2E=
X-Received: by 2002:a17:90b:3dcb:b0:340:b912:536 with SMTP id
 98e67ed59e1d1-3543b3ad361mr9815251a91.31.1770019275904; 
 Mon, 02 Feb 2026 00:01:15 -0800 (PST)
Received: from at.. ([171.61.160.203]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3540f2f02aasm14655168a91.7.2026.02.02.00.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 00:01:15 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: airlied@gmail.com, ardb@kernel.org, atharvatiwarilinuxdev@gmail.com,
 bp@alien8.de, dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple
 devices
Date: Mon,  2 Feb 2026 08:01:06 +0000
Message-ID: <20260202080106.1093-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXovFQsk-w90wZi1@wunner.de>
References: <aXovFQsk-w90wZi1@wunner.de>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,alien8.de,lists.freedesktop.org,linux.intel.com,redhat.com,vger.kernel.org,intel.com,ffwll.ch,ursulin.net,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:airlied@gmail.com,m:ardb@kernel.org,m:atharvatiwarilinuxdev@gmail.com,m:bp@alien8.de,m:francescopompo2@gmail.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:jani.nikula@linux.intel.com,m:javierm@redhat.com,m:joonas.lahtinen@linux.intel.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lszubowi@redhat.com,m:rodrigo.vivi@intel.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E92C4C9710
X-Rspamd-Action: no action

> Maybe you could give it a spin and verify if it fixes the issue for you?

I tested it, and only tested to see if it booted.
now again i tested, and it seems my iGPU and eGPU wasnt detected?
and after futher debuging i found that setup_efi_pci only detected
dGPU, so using update_nr_gpus was useless.

and about the macbookair situation, i say we just exclude macbook from
enabling apple-set-os via a smbios quirk.
