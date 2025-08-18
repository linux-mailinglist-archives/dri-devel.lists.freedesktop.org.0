Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE13B2AC4E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B6C10E46D;
	Mon, 18 Aug 2025 15:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="SgufWMth";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F050810E42C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:50:58 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45a1b0bde14so20299895e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 03:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1755514257; x=1756119057; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OZHyg61EBWZaARHc87dfxpWntWm0nMzTS3sgcvk3T3M=;
 b=SgufWMthSOf+nbuTSWoV+UnYKlU3NjXi/EijZz8/xRmrKoWSyk3v1hrDJc1xSEKnoU
 opnN45jwQN50fu7Sdcw5GTblQ+KASNA7k6A4tarVX0+p7GiJ1oq6A8ugt08Ir8WXb5lC
 SeURmj7szjYoaWlldSmFxEf/jJucc0tDU8v9C3/o09cT0JbLtLRle/8taUWpHAiX1lW4
 9gkHiC0c0LjFiQXiA14yNsu6LMsZjZEPcr2sN7cMhckHTpx+HeutUr7F/pHTJwW5J8G3
 Uvi26FrcqT3B+1//84H2Qmiu452vmqrIpooQSsC7KaOx7ji22J2ulvolrUM+6aMTUNa0
 4YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755514257; x=1756119057;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OZHyg61EBWZaARHc87dfxpWntWm0nMzTS3sgcvk3T3M=;
 b=mwEvyk6I8a7U4ABo9Dl08v+bUvdsB4zGNl7z/ArodIQ9BbeK3qGszuR4KFTIXsTwUO
 S8k3Q7V3UNfZ2Slq1puDLsidJaqPx52fOjgVNtAEUyGoGgLIOqVCEzKcwm4LkIGiInCo
 92XkuMlcKglF77Ti2QnWCaep2ZIoIoLCwKoR4i5NINbEiYA6QRm9yJTtxpOOGVXzmlRS
 Q51+5EQI4v8hklJrQ6bTU/pP4vqPwKg53Zpe3G5SynpJLyWWKv3k1zt61ehf1VfwLgy2
 hcDF0wctKiuW3IObjJn/dO5PrOiatecdbw6/4TtJezJGfkGZ22QBQUV4CWBlfQvOx72I
 n6iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgAdX9yNK0tROH5hhMYK3fhHEtpwwpQEG4MurqTZ8ull6bho5pTCj+Qg7ulMwJVayJ+Ma40qIlXkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5XgphvxRXPsRsNCCUcP93KQu8xgdY4ukK91g3Gjpv4gB97RiR
 Ne7BCLhYittk2JTzMkeehqtTaF0ZS4VpYNPqrZ7LYj9N9TrlwM7dW3pH+EddAgxnIu0=
X-Gm-Gg: ASbGnctjOLmiN9ySK1vJTfUVAy4rGykYiwWaEu2qBPteEIZ0UozBRztr8E2nzs2vWgT
 8JJmnBTHBxq+BGEjYxGk8saCyWH1BjwZQ5q4xbjAmzAi78ms7BV6HeYXTXOGoA7AqeQTTwrnJ+a
 x4DDGnwKia5iQYl9sAdxED/yTdXuo/XdvcVRIlKMV5SdSrKTGnUQxiZxF/w8Lf4mm38L6qDCBWv
 4IQd4XsC/0YU4CeYCTB0B7m/88QkFcfru5dNbxrLbsPyWETQRwHNP/bEhNncCIfl4w1nNNdLIQd
 v48X5FTHE5674wlewf9B+5Bg8nK1BlhE/mYrViygV5EnkVqTB3F5yrHcjFpNMIkiS95sBjQYXVE
 EZNri8oQmm4dIfSuAexTNZ+KRlaLBxiscAWsYxmSKItShg8wLLOgM2tMq3WCyvaA=
X-Google-Smtp-Source: AGHT+IFtjih4o8NS4VHkcYD2Txcwmf+pFe1QNvS0DpqHsE8KLRkcgWRFJ+48VhP74+JNXQyo/iL/1w==
X-Received: by 2002:a5d:5f49:0:b0:3a4:ee40:715c with SMTP id
 ffacd0b85a97d-3bb66a3baa4mr9592468f8f.14.1755514257365; 
 Mon, 18 Aug 2025 03:50:57 -0700 (PDT)
Received: from ?IPV6:2001:a61:134f:2b01:faa4:fc57:140d:45b?
 ([2001:a61:134f:2b01:faa4:fc57:140d:45b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb6816ef48sm12090391f8f.58.2025.08.18.03.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 03:50:56 -0700 (PDT)
Message-ID: <a1cf393a-9901-469b-90f4-81211f2e1b9b@suse.com>
Date: Mon, 18 Aug 2025 12:50:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] USB: Pass PMSG_POWEROFF event to
 suspend_common() for poweroff with S4 flow
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "open list:HIBERNATION (aka Software Suspend, aka swsusp)"
 <linux-pm@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>
References: <20250818020101.3619237-1-superm1@kernel.org>
 <20250818020101.3619237-5-superm1@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250818020101.3619237-5-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 18 Aug 2025 15:16:13 +0000
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

On 8/18/25 04:00, Mario Limonciello (AMD) wrote:
> If powering off the system with the S4 flow USB wakeup sources should
> be ignored. Add a new callback hcd_pci_poweroff() which will differentiate
> whether target state is S5 and pass PMSG_POWEROFF as the message so that
> suspend_common() will avoid doing wakeups.

Hi,

how will Wake-On-LAN work with this change?

	Regards
		Oliver

