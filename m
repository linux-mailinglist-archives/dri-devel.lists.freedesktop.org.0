Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570E95EE86F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 23:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951FA10E97F;
	Wed, 28 Sep 2022 21:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C109510E97F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 21:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664401164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZVwlHkJX+CA2MdLV8ui7Hgvltct3SaTb4zc3R8SWOA=;
 b=hDjpvKT5yDwBr7sAY74SqOL5/o3gLtxO7ZLa1EGzDPKA1oR+qIu3BuXiMw/YEMVDT5vcHQ
 fFUBxLRe1Bcs7Tk5K8FSzoLLuHI9FwrOLLUfk2QFpf0V2VIrWyBAEofQonheJ4bS9g9reH
 CRziHSVT74SyQsbrQJUKWAfmWVax7f0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-X5pKDe28Ovm9ezeejh865w-1; Wed, 28 Sep 2022 17:39:20 -0400
X-MC-Unique: X5pKDe28Ovm9ezeejh865w-1
Received: by mail-qt1-f197.google.com with SMTP id
 cg13-20020a05622a408d00b0035bb2f77e7eso9845743qtb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 14:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lZVwlHkJX+CA2MdLV8ui7Hgvltct3SaTb4zc3R8SWOA=;
 b=AETfxynF+jU5ZyVAFf9nNdlyd7+wHzW5ObSRdzKoCOlJIn+YpydP14CQeP7NMsiFKW
 PwqQFuMV0HFkKGoZP06Hb1AZRm7F/DeKsORuuHbqKGse+1wPujiFVXzptPNiU0myrwkb
 JbakuV872MM2B/1/eKe4GWQ6XDzYj1D5U5+26wpnotYo1WPlgm6ckoWCv05hbNGQutlw
 G3hFPPQlDlEzbyX93Cu77FXQJ/CLk9UnOyadwyhTOHaQMrcxIpNcavqnIrKhfjmMKG9R
 j4WM/EM80bbGdieiQfgK3ezrKb25joTG2O1ztYUuuCTo3qVEO9go8+1aBW9eaoMoDxPP
 uvkQ==
X-Gm-Message-State: ACrzQf0TARpbRCqGgbX8/hM/fekqBq0Tp95ZIJ4mpSNaFlZxMoxeJW4r
 QSHOVrRbTBEnbrTCkl3fislLbn9TGEmWS6jhe3ntZZm9bcR773wJvg8ppY0QGLmhur806SYh2u+
 fQYTM0gGJDVNuMnyS/N7xga87gaaR
X-Received: by 2002:ac8:5d8b:0:b0:35b:b035:9573 with SMTP id
 d11-20020ac85d8b000000b0035bb0359573mr28229986qtx.632.1664401160193; 
 Wed, 28 Sep 2022 14:39:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+NTBF2OvbAgxteoflWFSd6erD1BpZf1mrqbddCj+mgL2acOrz19fID/cOV8yI3Qia+7pfGg==
X-Received: by 2002:ac8:5d8b:0:b0:35b:b035:9573 with SMTP id
 d11-20020ac85d8b000000b0035bb0359573mr28229957qtx.632.1664401159952; 
 Wed, 28 Sep 2022 14:39:19 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::feb? ([2600:4040:5c48:e00::feb])
 by smtp.gmail.com with ESMTPSA id
 bs13-20020a05620a470d00b006a6ebde4799sm3987020qkb.90.2022.09.28.14.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 14:39:18 -0700 (PDT)
Message-ID: <139a402b4f9a09a4e89b0c0b0e556014ae7a8b83.camel@redhat.com>
Subject: Re: [PATCH 6/7] nouveau/dmem: Evict device private memory during
 release
From: Lyude Paul <lyude@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Date: Wed, 28 Sep 2022 17:39:17 -0400
In-Reply-To: <87k05plm9j.fsf@nvdebian.thelocal>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <072e1ce590fe101a4cdbd5e91b1702efebb6d0fd.1664171943.git-series.apopple@nvidia.com>
 <881735bda9b1ba0ecf3648af201840233508f206.camel@redhat.com>
 <6ff9dcc5-c34b-963f-f5e7-7038eecae98b@nvidia.com>
 <87k05plm9j.fsf@nvdebian.thelocal>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, Michael Ellerman <mpe@ellerman.id.au>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Re comments about infinite retry: gotcha, makes sense to me.

On Tue, 2022-09-27 at 09:45 +1000, Alistair Popple wrote:
> John Hubbard <jhubbard@nvidia.com> writes:
> 
> > On 9/26/22 14:35, Lyude Paul wrote:
> > > > +	for (i = 0; i < npages; i++) {
> > > > +		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
> > > > +			struct page *dpage;
> > > > +
> > > > +			/*
> > > > +			 * _GFP_NOFAIL because the GPU is going away and there
> > > > +			 * is nothing sensible we can do if we can't copy the
> > > > +			 * data back.
> > > > +			 */
> > > 
> > > You'll have to excuse me for a moment since this area of nouveau isn't one of
> > > my strongpoints, but are we sure about this? IIRC __GFP_NOFAIL means infinite
> > > retry, in the case of a GPU hotplug event I would assume we would rather just
> > > stop trying to migrate things to the GPU and just drop the data instead of
> > > hanging on infinite retries.
> > > 
> 
> No problem, thanks for taking a look!
> 
> > Hi Lyude!
> > 
> > Actually, I really think it's better in this case to keep trying
> > (presumably not necessarily infinitely, but only until memory becomes
> > available), rather than failing out and corrupting data.
> > 
> > That's because I'm not sure it's completely clear that this memory is
> > discardable. And at some point, we're going to make this all work with
> > file-backed memory, which will *definitely* not be discardable--I
> > realize that we're not there yet, of course.
> > 
> > But here, it's reasonable to commit to just retrying indefinitely,
> > really. Memory should eventually show up. And if it doesn't, then
> > restarting the machine is better than corrupting data, generally.
> 
> The memory is definitely not discardable here if the migration failed
> because that implies it is still mapped into some userspace process.
> 
> We could avoid restarting the machine by doing something similar to what
> happens during memory failure and killing every process that maps the
> page(s). But overall I think it's better to retry until memory is
> available, because that allows things like reclaim to work and in the
> worst case allows the OOM killer to select an appropriate task to kill.
> It also won't cause data corruption if/when we have file-backed memory.
> 
> > thanks,
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

