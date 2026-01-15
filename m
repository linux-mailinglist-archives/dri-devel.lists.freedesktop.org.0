Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FA7D288B9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 21:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986E510E109;
	Thu, 15 Jan 2026 20:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NGlVEiA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D590710E109
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:54:39 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-5014acad6f2so20491cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768510479; cv=none;
 d=google.com; s=arc-20240605;
 b=eGxGbQ/bdiqrK/cK5YOrKEtihf3pgRmPJNTyI4ziPiz1a8ZXUZjNm48Rx1BClh3uUI
 r5WsGgnKRWjRnZ9xzE/0bZN0qMsbnIOw746LWveB+kgj0oyYfl3chMGiVfr+F2qsIJWF
 zBFdDB1Yz7r1Uwo+HmXNHT0sQaGMovYDISYx9YTuVPsh9I7qrOxytleT3/SVylCnACyK
 +8iNYXjoSYilHVaoMkVGp/b+dXXNiJ/D9x0ISnpU5wQ4B6rOqxQR7BHU6jlAT/vsns3t
 FohUnOZ30hKHNnwcLg5WcXcuLahXD7QEY54htn4OGBA3EWZr8X4D8zGXgrL9WrmskiCF
 eQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KMDCAuEpBU2j7VyBDlD6eYOZpYO2bi5WCD88B/El57s=;
 fh=9BYpF53wYyhBDqnmlildN6yedd/NTJQdc4NalNkjSWM=;
 b=M1mREv9miORZtJMaLMMs3IIC4J0wJuPpjqKwX11tSbRGUB3BVXm7N4+vuFaZKVZISt
 dftIXX9hAUDNPDKdjyg+mTSR8u5/MDLwX23qyuP8/x/8pYpjh92dTEuidKyuoo0tgRw0
 K7Xc1jQqqXkXhuqVvlbcY5dqbyhDQFqdKqezWBn/hnNbsmVyCFmMBDP57JkYWca5u+zz
 i0+CY3J7chgD2jVTmS5Te8RSSnb7VprvVS4ztRBMblAbCO8A5CuMtRuTdhPuaaPoo0Hv
 ujF4vzLfsOpwrVM3zUsL1RNjBNV9vA3QMzCAhLwgVIbG3ffEjZAxxOyxGHy/+b/bC1dP
 eNmA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1768510479; x=1769115279;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KMDCAuEpBU2j7VyBDlD6eYOZpYO2bi5WCD88B/El57s=;
 b=NGlVEiA2enM0Kc4p1fxsa25DGR6j48VeezZc0tG4/4l4nIQQYC4O5PSfsPOFVVoiq+
 4061TkzVUfqsED5TCePdbqI9NfwRkvMJHAC8cMRS/VLEPabXlwcRGrdHWXOVyPLtEuN1
 n+i0D3kvXEbX7LI1b1zITL3ypDMtEipEJHzuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768510479; x=1769115279;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KMDCAuEpBU2j7VyBDlD6eYOZpYO2bi5WCD88B/El57s=;
 b=EJzmja5k/vks3/0GFpdJP17asPv4UImDOZC4irBfCWIDvA6UV5pmGUeIHx2xGuPeha
 KdxQMP3/bqoBPTV6hmanUVVuirfCjf1MqtoVwODOXEWMGe7DeB3azaJOmr/t0sC7dHfs
 dryzdsbG5UYo6CWMFFp7X0BweaV8ixn8+QLgYnqEPaUq9vg8LSeCeAiaYrFHvrmOr1hc
 xTkQmDwu5Gm/gn7fWshxu5zNER2g8sAsa+chPDtl2qPBNDNskbS/DXyt0ndw4kqHqwvd
 Vkl7CCgWbPFfYyTvF2I0Yu8E+VzdUlblP4VY6kO6mPdXghRqR0s2ulgSbqNhsdEHT2kY
 gVDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtZ1Tlso6hJ7uQfqzG284fq6GAXbgXRLo6pfQTTonWM0US4fpQhkbDSOuK+s1MwAj0K0Z/Ll78Z+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqFVRfONHZ6F2nBskH0mAyIOumVrV/6+UJwnuOmWvjyzyUKp2w
 rsZkWPkUnZlYNtgjKkJGtPVz8nFuGUCrdj6djREKcgDo3/maSUKxI808IhKNrmohSkP6YTQO/OM
 VuAsxlCKLmC5WVyF1yariknW8dEfgumg+c+8F9ebI
X-Gm-Gg: AY/fxX50pTlRJDy45fjoCnB5sUDLDro3/Ar+zan5VKFQqrM7PdUI0QBfGye/RplY6FJ
 YxJ/Nk0CbJV8f7OdRJKoxXfhh7ZaAKga4AqMV6ja99nnjg8GZcUhRXkxgo1l1QJsBg0UmI9BTRl
 l3sttJ+P4bHe840VUPmJyKrggCnAWhb77jnxtNAT5sLggYx3QzNeFiex7k40reAXMLBMyLTTwC+
 Z1TfX/QyWvvPHjdDwWzkiLJlQO+c8af22fNrSMyiUbLXL780lOhl8zLoOSOHqy3TffbojMGE/Cb
 d/MEriVaj422Qc1FQvRfiyr5ng==
X-Received: by 2002:a05:622a:291:b0:501:4539:c81 with SMTP id
 d75a77b69052e-502a2308ca2mr2072271cf.2.1768510478470; Thu, 15 Jan 2026
 12:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-6-tzimmermann@suse.de>
In-Reply-To: <20260115082128.12460-6-tzimmermann@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 15 Jan 2026 12:54:23 -0800
X-Gm-Features: AZwV_Qhkh7OWarAssFoak5kIszzJHYAOlxl7WYMlwiaFV3xMZUkLvFfEXU3N6YE
Message-ID: <CAODwPW_n=LfW+az4v8XecrzAksFmP+0U-9ELb_TrVtLL4EGk9w@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] firmware: google: framebuffer: Fix dependencies
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

Not really sure I understand this part? The code in coreboot_table.c
creates the device that represents the entry in the table. The code in
framebuffer-coreboot.c (which this Kconfig guards) contains the code
that creates the device which will be the actual framebuffer. Doesn't
it make sense for that part to depend on a framebuffer backend being
available?
