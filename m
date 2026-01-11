Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D092DD0F92C
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 19:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A078D10E054;
	Sun, 11 Jan 2026 18:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l6sbkXSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF16A10E054
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 18:31:25 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-88a367a1dbbso98279456d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 10:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768156284; x=1768761084; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LxHKoSi46iPA5F9rX5ZhPp9IruXA7MeRTiDagdmtDXE=;
 b=l6sbkXSryBCdAZKbfap0TUHwDmG13EFjUON/1rmscTNoTRpjOPBU2lja27/wPBcfEZ
 zGgfi7h+DYb7gYayKXkslx2MmXgiI+N8yLqiWwUgV2yWegYWzcwXFy6ctyWEx8gtWWfH
 WcqhmAvI/wl972U90IHTMKmIl3oAga9X0XNpkxNHUaesF8vwVm0HlHU1m6WR7DLPnbJE
 I3IrpCmz2npbRaIpfsCf56ckLEZuGeZEdGM1rRLTtjTo0HrwnZ/fOxdIRFiiNyFNCIE5
 RW6hd83cqg+nbKhBkTAhuAacXVGjBhDJeLWpdLYsPYLshlotNrOg3jtE/FtVzInTzTH4
 g7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768156284; x=1768761084;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LxHKoSi46iPA5F9rX5ZhPp9IruXA7MeRTiDagdmtDXE=;
 b=eUTnsu96rlAWtFz7TgbCW44vXBd81K78vt/ZH55cbeWgzutWwnLIyEHaExbDUz2q8B
 bCVfa0DZywvTImu3PCpb4Hnb4MXCAPc5cWzOFoO45IsVA29OtvFjucbx7oQMzQIwFMKy
 nxqM6iCnMoTA96CJ7nQ8aDykqK0BjaAN//W7icbfmdmUHzucd9gjKOY26M2gpjIeda32
 Oi93VEdUXbeGhtcgfd1NntrlAkz6KPPsdY4nvJQmUqalRsg5qYhZbIgJMAPun8uY7QY9
 Z5d2EeJcJ9rAHpq59O/IfU4noezqpQieyczi1mQWkKsnwjqeI10YNwtQt6Of7muorK3R
 YW8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWua4rzb/5gG/WO5/IKl4qg2Bt9Zn6xH0WGbw2uH3Vu7+Tk1gyEgVyJPQOkJHpNLVFjH0QFlZsRgFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5OoTD16iGwEFf9te/G1qo12cp++DTENMtjvLVur5YTO8z2xTK
 M3qdckzi0O8GKGZFMnRaIA5QL7yxQ4NfqT53BuOQuHcRZoezpAsZsl7pAg9ZhQ==
X-Gm-Gg: AY/fxX6iIJXRjE6OMPJmtKVrJh5aMxiDpeSOXlJ9YVCIwyatlGqcwMY1a5nwKYoe3l3
 cO2Kd+Q0XovEi6C59wbRfTwcZuxixZAa2/y271c404suFyB5FrQtnlvLbtnLItCeQxiWUwXEt4l
 VbgrZqFKgJ+hBwo2J+w6spqwM06Ia3fYCR1BlhVAdkk94+YUOeMG6S+Xqj1MRyWMibk2BDdcTQA
 Jq3jhE7Jfv6KRJoCGJJc+VoFihirM9FV3NHOxzptgU0vE6vjjdUAd7U5+Z9hnRIhNgtEowE5LB2
 2I2S7YZiYwXcqBHY27PE8F3c8JSMQxNOccoU6vj/P2y5Ydl+Cn3+dIj38DWHumGkjdrCyUpklxO
 04GlapwwCxIRBQcC3TT8JnT3UBJWIqOHT8Ea+e0zIqJExipetqauxgvaeHsQqx09o2hvW7l4I8s
 t8Www43gtNalA4GSNaA6n6indmzqvsa/pVDNufqCP0aXXOpwSq/dFHIZ665w==
X-Google-Smtp-Source: AGHT+IFr0AfQqdzuLfF2we3Zx/EJP2hZFx2oG+SaK1KaO8OqQ9sYp0F8cg/P9dtkorxfQtRFUlfUMw==
X-Received: by 2002:a17:90b:28cc:b0:33b:8ac4:1ac4 with SMTP id
 98e67ed59e1d1-34f68d3b273mr14688746a91.35.1768150214300; 
 Sun, 11 Jan 2026 08:50:14 -0800 (PST)
Received: from google.com (61-230-24-179.dynamic-ip.hinet.net. [61.230.24.179])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f7b19ebsm15175971a91.3.2026.01.11.08.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 08:50:13 -0800 (PST)
Date: Mon, 12 Jan 2026 00:50:08 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com,
 sre@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, jserv@ccns.ncku.edu.tw,
 eleanor15x@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: input:
 google,goldfish-events-keypad: Convert to DT schema
Message-ID: <aWPUwCbFoIItG7n3@google.com>
References: <20260108080836.3777829-1-visitorckw@gmail.com>
 <20260108080836.3777829-4-visitorckw@gmail.com>
 <20260109-remarkable-crane-of-exercise-6bc17f@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-remarkable-crane-of-exercise-6bc17f@quoll>
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

Hi Krzysztof,

On Fri, Jan 09, 2026 at 09:23:33AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Jan 08, 2026 at 08:08:33AM +0000, Kuan-Wei Chiu wrote:
> > +
> > +examples:
> > +  - |
> > +    keypad@9040000 {
> > +        compatible = "google,goldfish-events-keypad";
> > +        reg = <0x9040000 0x1000>;
> > +        interrupts = <0x5>;
> 
> Same comment as before. It applies everywhere, btw.

Oops, I actually had a local fixup for this but forgot to apply it
before sending. Sorry about that.

On a side note, none of your replies regarding v2 appeared in my inbox
or spam folder. I had to retrieve this message content from the lore
web interface to reply. However, your replies to v1 arrived without any
issues.

The only difference I noticed is the sender address:
v1 came from <krzk@kernel.org>,
while v2 came from <krzysztof.kozlowski@oss.qualcomm.com>.
I suspect gmail might be silently dropping the latter due to some check?

I'm not familiar with the email protocols, but perhaps it really is time
for me to start looking for a gmail alternative... even though I see many
entries in MAINTAINERS still using gmail.com addresses.

Regards,
Kuan-Wei
