Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D497A4301A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 23:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8A210E065;
	Mon, 24 Feb 2025 22:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HPb8hDjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6634010E065
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 22:30:11 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-220d398bea9so78500495ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 14:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740436211; x=1741041011; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8Me2tClMPt10g2IbqRw63NkEwXox0kTNxKyczDkCN+Y=;
 b=HPb8hDjXKRwvPmvG0D8JvqJUoyMEvbMvI1FCqDCJh+pDuux+ZXpOyJqODPB3cxPTWl
 QrTDxtIDvx20PfKWRiVM6p20x4Tj5IFEjw4em96XHQx7woPIo7Lv0kdzB9iw6X6/IXBi
 36dQ7aKAeTSAO90lOeASrRHFQXnNXN4brRuy1FLzCHO9l3YhRnusJ+LmTokFJIpixJyG
 SD+Qd/kw2W1le1nhodw3vAgGdeQGPSE0dCpJ5+unpyNlHL/oPTkEh7M7ToupOEclJX5b
 kwUeR0BI11lEeLZvVAJYvOrNZAGpeVG+E33ygRjEH66ZF7m5OUc4SiSUibHbELjPpF8J
 R1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740436211; x=1741041011;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Me2tClMPt10g2IbqRw63NkEwXox0kTNxKyczDkCN+Y=;
 b=bmoX6HaIMZDdTOOulGGRdg1WqmS5kQLNq103gAzMYn4KOy/Tg9L/WLsmdSTsG7BdL/
 +ys9ncns77bdtl1r5ioyV7SY8KuZJWJTpfLWtUvA4rEEuZMlp+EA+NXkbW/MmprA8oIe
 DoDs+P8w2ZURGupSj3jra/Gu9yHHHg0m+ETE5OXlS637V1O4+oDxLfSHCDnBhnLgBXD7
 HyQmjfDnfccoVbGA6L7JUh1qbTTRpDKFJ5RMhcg7wCCTioyvjz4OcnMbTT8uZvAFkXak
 zt1ZeSKvJuGGh0pL9fkxWmSBO37BHWiyTIWv+a1G1Be7viKy3AoHQ55SIPHaUDr9ciPt
 9y0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl3T3033dVVYFZfvOzD+VUFQvVS81S5fLZamDZ3CvpDCYOymNo932coFQjh87zEIU6A3u0tcr51cs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcHl9PeINxR46qH6Ak47EMrteRoXT1SKfXaicB6ZCJIYVRa+J/
 vCfvMvB+HVip0Yac3u3xfJyE9WOgCLjZ6fvjJQljV4LbzCFpiqCw
X-Gm-Gg: ASbGncuqLNw2SRKhGsbHyfPsqorqSBV870PM/Ud/kU3tNzE0mbSeTLpaUZqSGHvJ4CY
 bn2iFtDiDKB8JdVInCSBVvf1TRoUGZuZugrVle7rmYtUcZvcNWmqEgNLYgIYCQoOUrd3KzsxQ4I
 pDqrX97oRNCx7QLvgHCc8H7O/aehE8ytt1dhbN0dtPUMAuHWAxuYFRpv/x9r05OFwzPoFo6AoKp
 cDeSJvlFa74HD7lBA6wj+wuZqQ5uM/a/+Jihh1ZoFzjF9rV+622epQvIBp7C+6082pNdpNTcNKu
 QIRMrCLR8qVjBJ8eAnoBK7x6daWMshxOHQCAgftXPVsUaK4Vvw==
X-Google-Smtp-Source: AGHT+IHSWZzc6ZuJ7NuejlOnvhXRMbFaz5+ejvmVe/JbcFGg9XTfI3FePFDJqFfvVera5WJ+OS97IQ==
X-Received: by 2002:a17:902:e542:b0:220:ff3f:6cc0 with SMTP id
 d9443c01a7336-221a1191974mr248692865ad.38.1740436210908; 
 Mon, 24 Feb 2025 14:30:10 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a092fc9sm1130585ad.126.2025.02.24.14.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 14:30:10 -0800 (PST)
Date: Mon, 24 Feb 2025 17:30:08 -0500
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, mingo@kernel.org,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
Message-ID: <Z7zy8AOpAo4JQu8W@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
 <Z7zv-c4A76jeMAKf@thinkpad>
 <68F1ED19-B0C2-4E78-B504-2F7C040ACC0A@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68F1ED19-B0C2-4E78-B504-2F7C040ACC0A@zytor.com>
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

On Mon, Feb 24, 2025 at 02:21:13PM -0800, H. Peter Anvin wrote:
> On February 24, 2025 2:17:29 PM PST, Yury Norov <yury.norov@gmail.com> wrote:
> >On Mon, Feb 24, 2025 at 01:55:28PM -0800, H. Peter Anvin wrote:
> >> On 2/24/25 07:24, Uros Bizjak wrote:
> >> > 
> >> > 
> >> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> >> > > Refactor parity calculations to use the standard parity8() helper. This
> >> > > change eliminates redundant implementations and improves code
> >> > > efficiency.
> >> > 
> >> > The patch improves parity assembly code in bootflag.o from:
> >> > 
> >> >    58:    89 de                    mov    %ebx,%esi
> >> >    5a:    b9 08 00 00 00           mov    $0x8,%ecx
> >> >    5f:    31 d2                    xor    %edx,%edx
> >> >    61:    89 f0                    mov    %esi,%eax
> >> >    63:    89 d7                    mov    %edx,%edi
> >> >    65:    40 d0 ee                 shr    %sil
> >> >    68:    83 e0 01                 and    $0x1,%eax
> >> >    6b:    31 c2                    xor    %eax,%edx
> >> >    6d:    83 e9 01                 sub    $0x1,%ecx
> >> >    70:    75 ef                    jne    61 <sbf_init+0x51>
> >> >    72:    39 c7                    cmp    %eax,%edi
> >> >    74:    74 7f                    je     f5 <sbf_init+0xe5>
> >> >    76:
> >> > 
> >> > to:
> >> > 
> >> >    54:    89 d8                    mov    %ebx,%eax
> >> >    56:    ba 96 69 00 00           mov    $0x6996,%edx
> >> >    5b:    c0 e8 04                 shr    $0x4,%al
> >> >    5e:    31 d8                    xor    %ebx,%eax
> >> >    60:    83 e0 0f                 and    $0xf,%eax
> >> >    63:    0f a3 c2                 bt     %eax,%edx
> >> >    66:    73 64                    jae    cc <sbf_init+0xbc>
> >> >    68:
> >> > 
> >> > which is faster and smaller (-10 bytes) code.
> >> > 
> >> 
> >> Of course, on x86, parity8() and parity16() can be implemented very simply:
> >> 
> >> (Also, the parity functions really ought to return bool, and be flagged
> >> __attribute_const__.)
> >
> >There was a discussion regarding return type when parity8() was added.
> >The integer type was taken over bool with a sort of consideration that
> >bool should be returned as an answer to some question, like parity_odd().
> >
> >To me it's not a big deal. We can switch to boolean and describe in
> >comment what the 'true' means for the parity() function.
> 
> Bool is really the single-bit type, and gives the compiler more information. You could argue that the function really should be called parity_odd*() in general, but that's kind of excessive IMO.

Yes, I could, but I will not. :) I also feel like bool looks more
natural here.
