Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AD3944EE2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 17:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0B510E5CF;
	Thu,  1 Aug 2024 15:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X9086Yba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C3B10E5CF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 15:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722525305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6Gz03hDTttvd+7tl5OFVJE3QFtRiPUFMKGDnDxPPCM=;
 b=X9086Yba+mAGF7VIIrurHCxsdhWLkiPSkml8WOcFBQFNaIO14nbvZi/HBdU0/TVSheHIeo
 QSMv9K08Q0yFgZgR7/XwwX1KCyaPZwq+irS9a7Klx7818DvcfuEZ1VyvClmSV8wgILwhLs
 XtKxqlflZkaMqGR53y1FjQXCtbwE+wQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-0nFOPJjNN0S9bJuNTCj_NQ-1; Thu, 01 Aug 2024 11:15:04 -0400
X-MC-Unique: 0nFOPJjNN0S9bJuNTCj_NQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a7d6a72ad99so386120566b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 08:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722525303; x=1723130103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x6Gz03hDTttvd+7tl5OFVJE3QFtRiPUFMKGDnDxPPCM=;
 b=LWWEPoCtkrcyX1Kxqcp7q3GuEwrYolUw8xLMlv9sI761AYS+Q4PFqasHFV+9IJSFzY
 tdnwOgD5Jd2PHnptezMtUCEjU5WjL3+IOl4PoM3Cb/Um6XvUmfxlfHE3F++JGtPAzjt5
 udyRrdlTDFvvnOwavaB36CMzmbESqSPR7/xrTwkHeRQP6GOR7e9DDkwUaPzXuke5qT2c
 eZWkc5kv0YSW/jYtQCFheMKFrBFQ3egkt/Fz9FcBgLlAV5RGESQnuQ1bFxd8RMfoaWLm
 my5GQ6styETiURHX66QMgxuHT5CdWqsxfgKBpbh4K/3RjnHDmkg30KNZ/D6LWtoDe19u
 aLOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG/NauPwBrpPssANbYPBnYNNsmE4TaugiVlBebrMs8PSvKWPxaFIiEnIXF+oWT0k0uDmEJoAQ6sYI0IxscHCD8AlVSxmb1XTwID84HcrY6
X-Gm-Message-State: AOJu0YylHhkWmSFkbU2fB35D2wO1rjvglum4IxEG4JE1nHyanflWixHH
 koFGwUA7xNJa2hOAuW73BSyMAB8a1SLQ0508SlGPDEbOmCts7925yF9bqRPty0yI1sQ0ybRYv2U
 OgyhJRn+KTh6GILooaPUM5a72BZcPLKdr2hPulVOsAXGYIjqySLxE9GnIMaU9JxhwZg==
X-Received: by 2002:a17:907:9689:b0:a7a:b839:8583 with SMTP id
 a640c23a62f3a-a7dc51c26e5mr32397866b.66.1722525302608; 
 Thu, 01 Aug 2024 08:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh8sS8ASeCL7tbxerggOYvsOegLjh6xAqrTG3CZcz3y3qa/PkPBjyHfa+gnp10im9bRcd23g==
X-Received: by 2002:a17:907:9689:b0:a7a:b839:8583 with SMTP id
 a640c23a62f3a-a7dc51c26e5mr32395666b.66.1722525302110; 
 Thu, 01 Aug 2024 08:15:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41621sm909036366b.113.2024.08.01.08.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 08:15:01 -0700 (PDT)
Message-ID: <9d9436b3-4a6e-46cb-a98c-f168bfebbe3f@redhat.com>
Date: Thu, 1 Aug 2024 17:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Use pcim_request_region() in vboxvideo
To: Bjorn Helgaas <helgaas@kernel.org>, Philipp Stanner <pstanner@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20240731193605.GA77260@bhelgaas>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240731193605.GA77260@bhelgaas>
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

Hi Bjorn,

On 7/31/24 9:36 PM, Bjorn Helgaas wrote:
> On Mon, Jul 29, 2024 at 11:36:24AM +0200, Philipp Stanner wrote:
>> Hi everyone,
>>
>> Now that we've got the simplified PCI devres API available we can slowly
>> start using it in drivers and step by step phase the more problematic
>> API out.
>>
>> vboxvideo currently does not have a region request, so it is a suitable
>> first user.
>>
>> P.
>>
>> Philipp Stanner (2):
>>   PCI: Make pcim_request_region() a public function
>>   drm/vboxvideo: Add PCI region request
>>
>>  drivers/gpu/drm/vboxvideo/vbox_main.c | 4 ++++
>>  drivers/pci/devres.c                  | 1 +
>>  drivers/pci/pci.h                     | 2 --
>>  include/linux/pci.h                   | 1 +
>>  4 files changed, 6 insertions(+), 2 deletions(-)
> 
> Given an ack from the vboxvideo maintainers, I can apply both of these
> via the PCI tree so there's no race during the merge window.

I'm the vboxvideo maintainer, merging both through the PCI tree
sounds good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




