Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A246F512DF2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9586110E646;
	Thu, 28 Apr 2022 08:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD72D10E504
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 08:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651133612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWQrFegs4y+/AqjpDTmKtLV6ErynfS4+Zm1sxeLo25E=;
 b=DSV8vJXeribrJ4CcPlXxoTgiqMcV+qydo6CvcpLtqSBTx8HqyVub9GIeNc7I0rjlni/6T3
 Plq2IJ6idLeECoKUMNuzM/8wqMDPV6hZDAKiVN3yAIO+fz97ZMdLTzKMGF4hJ/NDQ/wjeA
 KjJjy+gO/ArjMsokHthL3WgHZkXyhn4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-kG2BA5j7N9KGQZnZT8IBqw-1; Thu, 28 Apr 2022 04:13:31 -0400
X-MC-Unique: kG2BA5j7N9KGQZnZT8IBqw-1
Received: by mail-wm1-f72.google.com with SMTP id
 125-20020a1c0283000000b003928cd3853aso3942984wmc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 01:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lWQrFegs4y+/AqjpDTmKtLV6ErynfS4+Zm1sxeLo25E=;
 b=LS0IPC79ImFo4joRgyltnZFjXMifjMW6CHsm2Xdh1iIBuDBn1sE8Wh1+tzvUG9POds
 FsDqvfDY7q+A6rD7HWSXnUyYvtYPopxR7Owk9+UoHCmhRMN5uPVAwMYLyKw9SR6qNEof
 SIaGsty49v92XG718L+DEASXQC4yTolkZ8S8s7NOUyEDUpTG95fBvTGhb+IbIJvgoRem
 G2vrhbFwXSWhbPBS4QL7DHor+ZG2IxmKOxhq0rbqauHKkW7IhaHL3u2qZoKtl5SG9tUZ
 dC9lmRW01nSUfNXw5dtPUmBgamNzlA0E/CDsG74O4IXk5KjXXYq2JETM1XpbHUVZ6rz0
 ya5w==
X-Gm-Message-State: AOAM530KbUfOFqm+jTK9nVUo4ztBH3IKrg6E7+7V1yO3oL9Ed+nHQ3rZ
 4mg/qOwOUbABcPiM8z0NBHIqio445Y6p3ot7WvVbc40E9NEGptEazVvBJRJlQnUo7sOHS/o5y4G
 uqoKs/0jtTi02/ZG0QQCjdoWcW4Zg
X-Received: by 2002:a5d:6b0e:0:b0:20a:dd17:e452 with SMTP id
 v14-20020a5d6b0e000000b0020add17e452mr14573008wrw.501.1651133610068; 
 Thu, 28 Apr 2022 01:13:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgeL9zqCpTQRUUwTrQ96T14Z4BV1IgTzEd+WfFAxKG95THdyAPR/GzuQnbUbjUr0bb123U6A==
X-Received: by 2002:a5d:6b0e:0:b0:20a:dd17:e452 with SMTP id
 v14-20020a5d6b0e000000b0020add17e452mr14572993wrw.501.1651133609861; 
 Thu, 28 Apr 2022 01:13:29 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b00393eaf94077sm4124458wmq.8.2022.04.28.01.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 01:13:29 -0700 (PDT)
Message-ID: <262043e4-feee-5540-9a43-8871cb51764a@redhat.com>
Date: Thu, 28 Apr 2022 10:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220427215528.237861-1-javierm@redhat.com>
 <46446e78-60a6-1b8c-1bb6-1c005489d58c@suse.de>
 <6f3b8d37-0a70-a035-e87b-5aa72926fff9@redhat.com>
 <af31d343-202b-ffaa-c6a9-b20247938dfd@suse.de>
 <1d456654-6d06-ef35-b9a0-519db7d5b35e@redhat.com>
 <cdad47d0-939d-9eda-feae-78cf204a0ae6@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <cdad47d0-939d-9eda-feae-78cf204a0ae6@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/28/22 10:04, Thomas Zimmermann wrote:

[snip]

>>
>> Right. So giving even more thought to this, now I think that we should just include
>> drm_dp_aux_dev.o, drm_dp_cec.o (and probably drm_dp_aux_bus.o?) unconditionally to
>> drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER).
>>
>> After all, these are not big objects and drm_display_helper can now be built as module.
>>
>> I don't see that much value to have separate user-configurable config options...
>>
> 
> I don't know the side effects of this. We're exporting another device 
> file after all.
> 
> For know I'd make them depend on DRM_DISPLAY_DP_HELPER. If someone 
> complains we can revert and fix the linker error by adding stub 
> functions for the missing symbols.
>

Ok, I'll just add the depends on then to fix the linking errors and then either
adding the stubs when disabled or just making it part of the DP_HELPER can be
done as a follow-up.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

