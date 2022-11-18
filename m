Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB862FBF6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 18:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8077D10E7A1;
	Fri, 18 Nov 2022 17:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6019610E7A4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 17:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668793683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkJx+RgAzofek0cetBCDV8S2wNiIF1AHyooRWAe/tSY=;
 b=QSAWDBmP3j6JznBssY9j+NTPLNSLTFhf9XL2P6K7nRSYocbv88/IVRdSEPIdjRmy7ErHkA
 qTTgdtQbyqYqTAEqds+ddq26hv4CyxfjWud16lG2Cg3znB0tmFP7VbowzsLbKexX7WjmO/
 TshnoSHY4L6k2t0CajlYkVC78EgXPaE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-KXpu5vQsNNCHqMJ-zOxuAA-1; Fri, 18 Nov 2022 12:47:54 -0500
X-MC-Unique: KXpu5vQsNNCHqMJ-zOxuAA-1
Received: by mail-ed1-f70.google.com with SMTP id
 l18-20020a056402255200b004633509768bso3347073edb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZkJx+RgAzofek0cetBCDV8S2wNiIF1AHyooRWAe/tSY=;
 b=XEFF6Bdph2nPaxYzX3C/MOtss5OqsjzUVQyVUGwJJBBIz1kEVgPphn0M0TpNtqojG2
 X33SlOT0hBeaKGMdZAimAzkoUjkn/Bgq6HAgxXUwX/LvwJi4QaW3UVxIcy50/0ndU3c7
 SK7kNx2fpyc7gkqCY88TpX3BEdwWfYL0EMgSKQkfrADmab9z8UzpKR5KbhPxCVCXMuM7
 QeaszFADfImhSoWv4YJ93CBAkcql2T75PszflIXJhwCz7SXZqn4930vdxZq5hKl37it7
 BtJl8LbyWjDfnRBFT7AHRCui3Gzbj9FAlQm62HS0UAYCEvI82AnZ0MMLhxAUXyGyXu5K
 3XUw==
X-Gm-Message-State: ANoB5pnt4bq7GdcwxtOWvwcSrFodI6YV6GFio8KMxfBG53sRP2OqtZpu
 c/qRbIBXUBmRray0xrHUVKZWzVdNgSux/Dbna9jlrYxAOB63wuu2YF0llKH12mx4T+CDdioIOtK
 8bi1TfjS4tGhbQpckfucJaHy85cRq
X-Received: by 2002:a17:906:36d2:b0:7ae:9c7b:4d5c with SMTP id
 b18-20020a17090636d200b007ae9c7b4d5cmr6610697ejc.598.1668793673621; 
 Fri, 18 Nov 2022 09:47:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6674asXcYMlwXIeAqeZcpNWB+Ml8RoaoS1i6tRUnXdDqv9oTJdkY86khk21Rzpsob0OPciOQ==
X-Received: by 2002:a17:906:36d2:b0:7ae:9c7b:4d5c with SMTP id
 b18-20020a17090636d200b007ae9c7b4d5cmr6610685ejc.598.1668793673439; 
 Fri, 18 Nov 2022 09:47:53 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jl24-20020a17090775d800b0073cf6ec3276sm1924617ejc.207.2022.11.18.09.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 09:47:53 -0800 (PST)
Message-ID: <c295e26b-283c-c643-f2ac-979466829227@redhat.com>
Date: Fri, 18 Nov 2022 18:47:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH drm-misc-next v3 0/5] drm/arm/malidp: use drm managed
 resources
To: Liviu Dudau <liviu.dudau@arm.com>, daniel@ffwll.ch
References: <20221026155934.125294-1-dakr@redhat.com>
 <Y3S+ZQ9gJVf9YYra@e110455-lin.cambridge.arm.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y3S+ZQ9gJVf9YYra@e110455-lin.cambridge.arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liviu, hi Daniel,

Thanks for submitting the patch series.

Unfortunately, I wasn't able to finish the work to make drm_dev_unplug() 
deal properly with non-hotunplug cases before my vacation, since I was 
working on another series. I'll finalize and submit it once I'm back in 
two weeks.

- Danilo

