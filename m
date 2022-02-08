Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890424AD2BB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BBA10E16C;
	Tue,  8 Feb 2022 08:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3F010E16C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 08:07:07 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id y129so11234308ybe.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 00:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lrJ/uUGCKgoKFH52TnhTE0iJcbWnNbC2//ZX4wls2Dw=;
 b=kNP/DVt8Qf+7bUY3UT5ZfqP8u/Zt0jSOyRJstDT02WFgtxz0uQpIo4XqdFFTnYfT/M
 F2Df9FQ1s1DpZs0sKfObwDOAAXfKQ7/T2yeAjlKR3i/reWmzZVjWKP3xdxDfOd3jfA7b
 tz5+cjBNS6/V6VXodt+MN/KM9Uxi0esuP7iu1e3jkfmQt4QdsMTpVKtJq5SLYiKaO6wV
 GdLTObr64l6FVPZjPzvdKBJR2Rjj+n9hO45a68l8DCZafC6+U2M4uJdIA6MbLvDKJRJZ
 DYHtfhyDzmb+GdSk9jY5Magnd6SN2eMgQm2n0M1xh1E5HMRa0EDjVN/rUBMFIXJjqzfO
 gYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lrJ/uUGCKgoKFH52TnhTE0iJcbWnNbC2//ZX4wls2Dw=;
 b=EVPNN4qRApOrF7HIpVNMB2P/TH+j+OlFVbCB/Uj92saemFiC8mWYt5Rqe2cxYxLy5g
 Hk1YfUMKranK/TItUv3JDHNZztORYUeQ+63AFLVjma94IiYGOhOXpF0yj2qv40XLSbnW
 Z9i28xsWBBw4oSLhGSlsjQtVn3+QqFKqtW8Vue+hFccRKkT0N+tnoVOqGBp/JgJaNv8W
 02y3jSZhmQ5Dn+apQXS+Qs0DRCfo7/MuIlF/Nl8yUAg3cEn8S3xRWRb3pu0pyDJqNp9V
 MsvsEY0rZ1Qq+jCSC59UT+KevjEEZq2GDuwM4BsXQt3ka1nC38BpPT6jDRjT5R0s1Mgq
 2Qpg==
X-Gm-Message-State: AOAM533n7oHQMFBJRGwm4AtivZc+zES2WAdAE6M7oZdwpqXXAmmvOpPw
 8RwK60lDMJvCjYxEVt/d/v1mhm973CNIDgR2jrR7ng==
X-Google-Smtp-Source: ABdhPJyc0mkGJILuXoiCncxc7dUnInOYzU71tTwuAgOjc/Gz6ioJ07N3R1Qa59huN3y/0lYz2j4xsFCGHPxb7jwVlxY=
X-Received: by 2002:a25:e406:: with SMTP id b6mr3405161ybh.703.1644307626738; 
 Tue, 08 Feb 2022 00:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-2-hch@lst.de>
In-Reply-To: <20220207063249.1833066-2-hch@lst.de>
From: Muchun Song <songmuchun@bytedance.com>
Date: Tue, 8 Feb 2022 16:06:30 +0800
Message-ID: <CAMZfGtUfqoaJ7L7rLP2Vdfy_nvr30qppRX-RfTFUh8TeO3ZznA@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm: remove a pointless CONFIG_ZONE_DEVICE check in
 memremap_pages
To: Christoph Hellwig <hch@lst.de>
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 7, 2022 at 2:36 PM Christoph Hellwig <hch@lst.de> wrote:
>
> memremap.c is only built when CONFIG_ZONE_DEVICE is set, so remove
> the superflous extra check.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
