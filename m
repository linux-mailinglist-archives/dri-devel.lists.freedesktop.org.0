Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5082DD28900
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 21:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1041810E1E4;
	Thu, 15 Jan 2026 20:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SSEvRnx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A2B10E1C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:57:01 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-5014acad6f2so22071cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:57:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768510621; cv=none;
 d=google.com; s=arc-20240605;
 b=gOz1KbtowMbidctWdFkycOY8pkD0l//tNnuD2wTXEmqvXBnC5QNSVuj1WUp+oLjCT7
 ADkwlxwkNdtzKwhysFMGTmXkvwVnn4wt0x8ANcQrz3CQpJq72uQCQBmIcXsIRRO5Z3s2
 8Iz02bKKmX8eGxv82f1lGAX94AWs4gWQa00C3NVqTf2jCfcjQpbmXWOaNLc8W83DtfMB
 7STGOxNdlRpRY8SGKZUBn3klFfNxy6cIwh7rbhcUDYROW2rrG3H/+fKTVCmyF55dzBOU
 gK9ST6GZOwqM3VpsvzacPvnJ0y3TmIJpNOdzewFvjIkn746mVi3FjluhMOx0G4/U4/7Q
 f1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6I58fF6TuVXRegMzDGdPH+1UeFbeJDUNF8oPGeWWasc=;
 fh=rmAECzOfm074slKcvvTICaqGUrvOebFUcjhISF9aCPo=;
 b=QHvs+M5PCvwgVJdsC/6oqpRW2LE8sD/YqD0bNxQ5TDKmsr4kwy3LL9FCflXEiyYr5N
 6NGC9bcg0BAFmu+3SlSJxSOgnEHxb9Sw2UU7FR2LZS8ydYGxvM5I5pqcqVHpibKI0/tx
 m2qGird1ERSvs5gBbNGtGNPCW9sSG2Cuq6xwDRbmFsCzEMlNXSONAMsYgDBN3IQrPY/c
 hh4VxYmQrX/Evxe7DvOf9RHwNsBe9GMDN1hxSSidD1gT+UEAyYRiO75RwEtiNwA6TE/m
 6XwpKtprAhSmt2ROhMRYY3VMVT03ZEG46Gp3DIQ30q0mNTAguPQ6dQF/VSkDTR2nm21Z
 IbdQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1768510621; x=1769115421;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6I58fF6TuVXRegMzDGdPH+1UeFbeJDUNF8oPGeWWasc=;
 b=SSEvRnx+pnZXXAMp+Ba83OuUftWz9jxAlLYXuKWmx56ANUWm6zSaIlp1nMklTQzKKV
 eACqoa1WTS4sqAJTsLV8upSCZCIea5u4cdstaXtRloOcKUfOR9QJ6Y2kzIhT/oJPScnd
 5vZiHwWaVhnNtC/RtyH1lOCIDnAbFXIjsG3fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768510621; x=1769115421;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6I58fF6TuVXRegMzDGdPH+1UeFbeJDUNF8oPGeWWasc=;
 b=Uj0igpGGjV2F1apzVMx88yWYlOz35d9+MSygFch3GkirIVtwrucXwvL6+tqu6NVE/S
 smgvadeVWOr/EfSZZKnI9+HgXCUuTwD8y5drn4h1XZv5kGGCfQ90/sVwDp0IqIpwMLC3
 4CRQ1jXhufixPU2bexHuEcoeLdr+SbHW0KoYTBFAa1e2RKBTOzGLxoHEy+pRCxBcjLq5
 GkBKCBuiGyAAEuXj1bIzApA/lPC2M+yr1+ifHdsVOTggMkGjnGN44mVOZ2kWbfHCJMrK
 bzOP+MTj3Sd1cfCoe1Z7biwL6JqqzkxgrFg25wVtqXGWAqGIvTK2v9gGAVToCSqfGzi+
 Ulnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrq8kMd0aU9jT0b8v0huvTGD+DzlrZn6CKrbB0OfIm6LYbmquCFKjwqouzIhN6FcjfV9TN9AroEig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdUyW1w99fVVo/AW0ttH0JCcO2T/DexsA/iaeMYvX4YdgCEfRH
 Tm/OlR6bZkqugdRc56+wulSx7eNAFHoqS+MduM78to/WNWBRrR4h/m/zLqgkmgUrRVeHhqZxAVp
 UhScHx05W4Pah7o0Nkzpns3eSQ1+iEaGSpJYR+YhL
X-Gm-Gg: AY/fxX5VenLheJue8DhzKHZJK7GOJShKN0hKA1NWyVb89MATTwvgI0Yg3ayhx9Z/Uvx
 sHP8CLXolSdOSUnnIGgv0l91VGz6Ev+FiA04vVgwm4XJh8tkwGWRzv6ENU1atKymPpxM5poGai7
 1nys9zeprVO0pkc3cOY22wSAi9UghGTzIkF2n7iEGUuzWvDeb3gCQZ8WWupA/kleInt5c4nDoFm
 7aNNc428QzW4rholpzCUkfvhAPiL4Ig2/FCPuDh1ARSvlaLEtbCy3WsJW5/r8SPNus9A2+fjOj/
 8oEu2FBvrxEvK5UH0PuuV6koww==
X-Received: by 2002:ac8:5d08:0:b0:4ff:bf96:db86 with SMTP id
 d75a77b69052e-502a23dc15emr2080621cf.16.1768510620599; Thu, 15 Jan 2026
 12:57:00 -0800 (PST)
MIME-Version: 1.0
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-10-tzimmermann@suse.de>
In-Reply-To: <20260115082128.12460-10-tzimmermann@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 15 Jan 2026 12:56:48 -0800
X-Gm-Features: AZwV_Qg5K_5_9lpK3wrMnXsEAg9k1xj0wh4ZSps8vZ_Tg0OFv5Ka7-vAGXG0iEA
Message-ID: <CAODwPW_uDHQHpcMYd-tu0Ld5e+7MQ5OVUtUgM8hnrg8crY22vA@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] firmware: google: Pack structures for coreboot
 table entries
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org, 
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Is this necessary? The coreboot table entries are 4 byte aligned, so
only the uint64_t fields are a problem. In coreboot we solve this by
not packing the structure and instead using something like this:

typedef __aligned(4) uint64_t cb_uint64_t;

I think the same solution could work in the kernel? Packing the
structure makes all alignment assumptions go away which can cause some
architectures to generate really bad code, so I've learned to try to
avoid it where possible.
