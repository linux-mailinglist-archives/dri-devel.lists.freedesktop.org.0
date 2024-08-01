Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B21944EDF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 17:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA4710E14B;
	Thu,  1 Aug 2024 15:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M36sgQNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1319F10E14B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722525268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuCkGuyhUvwr7K6Rptn/zJ7I8ssejuyGxAvNdiT19Sc=;
 b=M36sgQNkx4kFUOCiWiTWWOOlJ4ftnpRCTK62qhmFWiCNMsFqz5atgTqqFPG4EHEHw5cte8
 ZxqcvtxdQqTtkbyPuZRTQ7qXvMyI4l4Mz63ZMni3r4tlp13GTohYQYitH9wnp72aG5fNrp
 s9BMdeiutYPP7yuHL2VzzuimbGelLIA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-sjtD6Sv3Mr2CUR2jl7lTfw-1; Thu, 01 Aug 2024 11:14:26 -0400
X-MC-Unique: sjtD6Sv3Mr2CUR2jl7lTfw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5a32a9788e7so2901368a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 08:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722525265; x=1723130065;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WuCkGuyhUvwr7K6Rptn/zJ7I8ssejuyGxAvNdiT19Sc=;
 b=Lzp65W4ZYcxH94oBxObr+kvASHZuX0N1ylUSPFrZKassxAiJShKbno/+o6l0ipH/GP
 W6hUf6cOBWdWrK5N3gh/NVvHzLlgm6A/tGmihLi0Dhb4FsI55OzPiqsRrRX/UuKGou+O
 e2OZjdozGF2WXslCK/w886qwgAuJBdxa4nBdV9zmpJ0CDbh1Hsab17CRE+VBbxrMfVoP
 7MwYGPc2G/b+ipWU8OOQN3ee9ojTUIZLZjHpc2b3Ctq5hXzAGXTWbs/ZCKQZXChEcgVB
 KTSlx8FYLmJrkezesn6FemXooWmP9B+8OKjcVWIsJMQVB3ZierE5UZ/Fl1Ekf0fvOHIE
 D7Tg==
X-Gm-Message-State: AOJu0YwS9js65zJlfQELwV3oWKfHQkg/F5Zy6je+JG+7oBy0ZeD6Rf0H
 p9B+6MFdvKPUCjw9OCLfyKQh9M5pIK3A636hH8VMHDgp5NigVfykZvZPDuKa3DaVWfWlMnVURs/
 XN8sJsRG3AjksPESCfxQR+RKj82RAQXeSjNbLTzztnGfmjgxizb6iw498VWivDkAvqw==
X-Received: by 2002:a05:6402:2550:b0:5a0:d5f2:1be with SMTP id
 4fb4d7f45d1cf-5b77c2907f3mr1879066a12.8.1722525265337; 
 Thu, 01 Aug 2024 08:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj4LCjAaF+V8VlhXK/sqH12Rf7Hd/3c/VAvvA4FypQ6qwCir32eUK1KIAGbf0dTmiuyK+YVA==
X-Received: by 2002:a05:6402:2550:b0:5a0:d5f2:1be with SMTP id
 4fb4d7f45d1cf-5b77c2907f3mr1879035a12.8.1722525264801; 
 Thu, 01 Aug 2024 08:14:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac6358fa5esm10285512a12.32.2024.08.01.08.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 08:14:24 -0700 (PDT)
Message-ID: <8f6cb906-fb82-4737-89b7-15ab3c92d430@redhat.com>
Date: Thu, 1 Aug 2024 17:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Use pcim_request_region() in vboxvideo
To: Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20240729093625.17561-2-pstanner@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240729093625.17561-2-pstanner@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 7/29/24 11:36 AM, Philipp Stanner wrote:
> Hi everyone,
> 
> Now that we've got the simplified PCI devres API available we can slowly
> start using it in drivers and step by step phase the more problematic
> API out.
> 
> vboxvideo currently does not have a region request, so it is a suitable
> first user.

I have given both patches a test-run on top of 6.11-rc1 in a VirtualBox
VM using the vboxsvga virtual vga card:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Also both patches look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans



