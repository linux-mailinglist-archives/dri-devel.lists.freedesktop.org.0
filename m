Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68080D1B98E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 23:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46E910E55E;
	Tue, 13 Jan 2026 22:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LhyhKh0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6212D10E55E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 22:32:28 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4edb8d6e98aso112121cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:32:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768343547; cv=none;
 d=google.com; s=arc-20240605;
 b=V2tx9F9c3exOVLPzq8hhPYvHTpAjAa45hrt/YoA/8tgJO+xKaH04BhzHaD5baputbD
 vPlAFsXVWbY/WqVayZ1ad9FLJ+TPJ029SQ+HiDsOmorOHxHe2pX+Pr2rjWib1LwdKrGY
 2pygPYBxv0EpCUcnr5ZLhlu0kJz6gUBDBVpLiwVB+K88jyOKQG0Bndd8AR/UrDzYzmky
 K/wqO1GU+7cF2SalcwoDzubNrz/CAuykvf6Ccim07ORsl7Vw4uV4Y+1fFJxca6FmHiXF
 KSarCeyyXmjUCQVcO0Jdlw+RQdNnuAHNQAuUuoYy6LAJTkDQSg2xogPq7Cdx0ttfAt+o
 /O/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ab17K08SO2fM+NNrfoDXH6PR5Yemfuf3o30RLIzOWv4=;
 fh=bAE/Khaea5eMoeSCDAha7wiJiUBJwyYSYg9PQlni2II=;
 b=WrVRLrJSaAk0wwbBPuFGUTQNnGUWh0keU3WYtCkDFmmIjOgiIiTV2kQ+qCcrtIRul3
 tiZB7qIUxJlUoUkeQ0NKf27nsPa/f6EgWY7EfP79hSK2xBvh8+mVcr8Y5zrxmTljt/jm
 ulj0KWqQidqIl9nkgVvrzbbXE5mzKr+lTELPTioNt+i0Ih8+obOaGYYRuyF0tn/yKYQm
 S9eRfqJYblX/FRYiYNFGyo1bBuPKrUQ7y5EFv+n8rYKBEW7Yr8/ccSYSgBqs6jU52xT/
 SF/vnYvkbaOTC+xCK2e0MrRV2H0a83Hp7/67s44ktVD3TPuu/4UoB+rM4OjeODJ5QoE1
 FyaA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1768343547; x=1768948347;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ab17K08SO2fM+NNrfoDXH6PR5Yemfuf3o30RLIzOWv4=;
 b=LhyhKh0bsRSlxe8JMWOg/mID623reWGYjJh+gQ/2ZLjNF/PQFn4HXyc4JPZwGlvQxu
 4lHBU6zDgb4VH7f3LXzVaR2eY5pM3qf7K5sd7AMWYjth0lxPUfSR4yUGYduqk/rdIswf
 0uMWw2h2HaENSKEAx46l3dVeY0Vh+bHeWuOvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768343547; x=1768948347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ab17K08SO2fM+NNrfoDXH6PR5Yemfuf3o30RLIzOWv4=;
 b=T5/LPIiTvjjmMnMGE1TeXEHt6kqLme2X3j082gdrk6FOf/IVz4G6eqoGSKCTlMSkxX
 JT5kI/CU8j4mqc8Aq0tXlaviqpxUVeLFUiULuCBxgfOZhXQam3uoGSPGS1HzfzgE5MGB
 YC24lYUBD7gpkd58B7IQBO4EEHuBgwzOfMiS1NRHXgi8wdag5DUksx4/FaABDsS0009D
 zfjY0xzlMgb5jqRF4DAA0ZUFbalb1eZEgakV0LGbk6KFVZZ99Es9hYUILecIjKdL2Wvn
 GuKOpfNpzmzFT2Oa9sXNvlFWd0t1IdiZMG0EDFAHpUUtraYuGjn6bW6Vfo0FgKoulgQz
 NcdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhWa6+EuwmpMmkewig0e/eGAHUPgNh2k2/DuBweDid4ipnc+Z6gTH95UeNKo6vy1V9oGkdzFpN8Sg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo/+quudt52bsSdpwFFF6/7/BljKgtIz3DUA4ZnGuLPBJrv7nd
 xPptaFcHXVLQZ/rt70zXPWx6qBNbq76qZgi5WzNahGlfb8U6pTAjc0Gi1jUoPWXQLgBCrIwW32Z
 l6S3dFpLepJV6URWB0SkLcPihpy+QyW7f6Chu4uZk
X-Gm-Gg: AY/fxX5m1D+dvGFIvQaEN0WmZzQGPiz9bYeCn/CnfQauBeIu5KyOKLxb7qnWItqYRuB
 Vp6uvutSIg3AnFgQ/bRnk5mpVDhzepEV0LjdO37V0jDLUfC1D5sSm6+0vhJLVhrUkGsweD39nvt
 G/jcXQMPpehOoFzoziRCo1eRvHKf38U0D1p4/siLKye+uVxNhM1J6YJseKlpZUeR0FNS+YzLJzB
 TVwVRIcDqLrqTxR7JbOpoVLqQhWejVLieGbmvX0UO5QahmWbsoVELuxc10tXAWdtPh1TjTMMMJG
 rBwNpQMO1SPhlxmbOPJpxITPSQ==
X-Received: by 2002:ac8:5749:0:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5014929462amr1227031cf.1.1768343547085; Tue, 13 Jan 2026
 14:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-2-tzimmermann@suse.de>
 <CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com>
 <9d9015fa-aba4-4dd7-a024-563f58b7f43a@suse.de>
 <87tswvf5n3.fsf@ocarina.mail-host-address-is-not-set>
In-Reply-To: <87tswvf5n3.fsf@ocarina.mail-host-address-is-not-set>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 13 Jan 2026 14:32:14 -0800
X-Gm-Features: AZwV_QhxgOTj_PD3P3RVLyHroyuj_4kHgIHlMmfS6qcWceT2Jbt_9awD63NnODo
Message-ID: <CAODwPW-JdJh1QmyMWxoZdaXKTE-y0n5BRSZPaj8Ntszyu10OuA@mail.gmail.com>
Subject: Re: [PATCH 1/8] firmware: google: Do sysfb test before creating
 coreboot framebuffer
To: Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Julius Werner <jwerner@chromium.org>, tzungbi@kernel.org, 
 briannorris@chromium.org, maarten.lankhorst@linux.intel.com, 
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

> Another question I have is why there's a separate device for the
> coreboot-table? Couldn't the kernel just create the coreboot bus and
> then populate it with the table entries? DT does that. If the
> coreboot-table device is really just the parent for the other deivce,
> that is incorrect, as I describe above.

To be honest I didn't write this code and probably don't understand it
well enough to answer that question (we should probably CC +Samuel,
who did). I assume that it was done to get the automatic matching of
the ACPI/DT entry that tells the kernel that a coreboot table exists.
If there's a better way to achieve that, feel free to change it.

> * the check on whether the CB_TAG_FRAMEBUFFER should be used or not by the
>   kernel should also be there (what Thomas did in patch 1/8) but instead
>   of omiting registering the coreboot device in the bus, the device could
>   be marked as "unused" or "disabled" (by adding a field to coreboot_device).

This sounds like a reasonable compromise. It still feels a bit odd to
me that the check whether other framebuffers exist happens during
parsing of the table rather than at the point where the table entry is
actually used by something, but if that's the easiest way to make it
work, I guess there's no harm in doing it there. (I'm still curious,
though, why can't you just do the check in corebootdrm_probe(), and
return -ENODEV if the other framebuffer is used? Wouldn't that be
equivalent to what the old driver did?)


> * the coreboot_bus_match() function then can take this new field into
>   account and only match if (device->entry.tag == id->tag && !device->unused)
>   or something like that.
>
> That way no device will be removed from the bus and the corebootdrm driver
> will only be probed when the device has to actually be used by the kernel.
>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
