Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280A77577F8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 11:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45B410E0AA;
	Tue, 18 Jul 2023 09:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D85E10E0AA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689672460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3cDKS9zgjIIqz/aNU3itao1eGxy44+iknQKsc8Pr6B8=;
 b=MM24BCaGSFaChVn5QjdEmztDVTJ0oY/7JvaXqa1U3U0ePrpTw3i5aZcYMRCZsLwJJJvDZl
 QWxLQq8mZiwVFbW2oMgjR8naIGQGHPaHD80VzQmRWphxyaH72YHl/4JlV8zXTpz5JHeOZi
 mUXEc4F/ZVafgIoWvhxG4nhRDVjHAKc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-y4wizo09N7ChLVbjBSLrLw-1; Tue, 18 Jul 2023 05:27:38 -0400
X-MC-Unique: y4wizo09N7ChLVbjBSLrLw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-315a03cae87so2564718f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 02:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689672457; x=1692264457;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3cDKS9zgjIIqz/aNU3itao1eGxy44+iknQKsc8Pr6B8=;
 b=T2duLLkl+Uq/hSZdm6oCErTVLzzNP1ws9shUOmggZQNvXrok0fHWQe43j3toHbUtEF
 xkSlbeRYuat4MpMPXN7E3+8AEpxvpmexZohj6at6cI09P1TqknHum+Xsr2sHFO71zL3d
 mjnZh7ODA3Cye9g8+b7F14vkHqdM8Vz3yQpGizurfrk0kSgjoV4sFU9sAmj42ZYDZ4IY
 PUhNnyfTNzWbF0pi3+bG6V1bg04dkPy3RldrYuYizhnUZDOy2kyjK4J11yf3B5uonLt1
 Cipk4Z4Qe8Ai63O2/ELv7Wcv3/32cKr93j3LuJoiB3IsOS/ovGO3Qy+JPO8dHJAtg3Oh
 9+kQ==
X-Gm-Message-State: ABy/qLZy+uHsy/2IB1ST7lwWx6BUfRlaW6BPSJiyOmAkdY82ajDpb+iQ
 izKG3QTzJ7w4Pnq1E/h/6bBjt91sw9goyVPAlTlU6E5DT4MFymLq2vZkjufJ64RrL3XUDI98K0N
 Z32//rGNdBAFFWXkkk5yeX1oO7SLa
X-Received: by 2002:a5d:5086:0:b0:314:1f0:5846 with SMTP id
 a6-20020a5d5086000000b0031401f05846mr9760537wrt.19.1689672457756; 
 Tue, 18 Jul 2023 02:27:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHNymP3WO123CXMiIsfwP++qXT2irAH2N6kIVgtwTFo3dR9Jzmh3s/wvxApZYNKINWPSZGEog==
X-Received: by 2002:a5d:5086:0:b0:314:1f0:5846 with SMTP id
 a6-20020a5d5086000000b0031401f05846mr9760527wrt.19.1689672457450; 
 Tue, 18 Jul 2023 02:27:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b0031435731dfasm1838127wrv.35.2023.07.18.02.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 02:27:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>, Michael Banack <banackm@vmware.com>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
In-Reply-To: <87wmyxipc3.fsf@minerva.mail-host-address-is-not-set>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org> <20230628104106.30360b55@eldfell>
 <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
 <20230629110348.3530f427@eldfell>
 <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
 <20230704110845.490344f5@eldfell>
 <ce7754be-8085-ffd1-93f3-a774f7fcdb87@vmware.com>
 <20230706110146.0abeda0a@eldfell>
 <247b630c-8b16-7c33-987e-8b3451be3c70@vmware.com>
 <20230707113837.1a9d31e9@eldfell>
 <6be74496-f14e-302c-329e-d865f5ee3c36@vmware.com>
 <20230710111706.209cfd55@eldfell>
 <9768c00d-536b-dd7b-c8e2-e9d920cd6959@vmware.com>
 <20230711101442.72530df5@eldfell>
 <87wmyxipc3.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 18 Jul 2023 11:27:36 +0200
Message-ID: <87ttu1in7b.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>, "zack@kde.org" <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Pekka Paalanen <ppaalanen@gmail.com> writes:
>
> Hello folks,
>
>> On Mon, 10 Jul 2023 10:46:56 -0700
>> Michael Banack <banackm@vmware.com> wrote:
>>
>>> On 7/10/23 01:17, Pekka Paalanen wrote:
>>> > On Fri, 7 Jul 2023 13:54:21 -0700
>>> > Michael Banack <banackm@vmware.com> wrote:
>>
>> ...
>>
>>> >> So I guess I would vote for trying to include something to that effect
>>> >> as context or explanation, but not try to strictly define how that works?  
>>> > Yes, exactly.  
>>> 
>>> Okay, if we can keep the mouse/input stuff on the fuzzy side then I 
>>> think we're on the same page.
>>
>> Very much of the fuzzy side, yes! All I am saying is that one cannot
>> explain the hotspot property without saying anything about it being
>> connected with input devices in some way. The very key I want to see
>> documented is that all cursor-needing pointing input devices and all
>> KMS cursor planes exposed to the guest OS are meant to be associated
>> with the same single conceptual pointer. That is all.
>>
>
> So if I understand correctly Pekka doesn't have any issues with the actual
> implementation and is just asking for better documentation ?
>
> How can we move this series forward? Maybe we can land this set and add an
> explanation / more verbose uAPI documentation as a follow-up patches ?
>

Maxime pointed out to me that is not only about more verbose uAPI but that
patch 2/8 doesn't have uAPI docs for the new HOTSPOT_{X,Y} properties, so
at the very least this should be added.

Zack said that would post a v5, we will have to wait for that.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

