Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB979AA11
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 18:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA16010E32D;
	Mon, 11 Sep 2023 16:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B93210E32E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694449024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lAgyEv8v84Vh6tDzXDpI5U6AfJ7ln7UC0vFeWtEv4VA=;
 b=Nfrrl7TSV65QbkdpkuKPQUVb+iYCjpLCKeG3Zo0J6u9pMV6Nr75+vAJD9iaO0bCHxmJALU
 vmvO79p9bGFRb+Dg3EVsiHUG/4q+JjVgyjY5vtlDxg8tRy4AUoqGHdbv4YCX+AISSag25B
 9DoEW0PJJOh44YmLVon053oxiHEBYks=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-IwjRaDNsNdW7E5oFfxVHGw-1; Mon, 11 Sep 2023 12:17:02 -0400
X-MC-Unique: IwjRaDNsNdW7E5oFfxVHGw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-502aafb8ae7so2175346e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694449021; x=1695053821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAgyEv8v84Vh6tDzXDpI5U6AfJ7ln7UC0vFeWtEv4VA=;
 b=prr4nh4t9MSkG5HDCHOAphMIG8rfa0Y0CohDiw6gPt2hV3cdLlQ8MJtcfNo4WVTlYx
 ZpnQQ8wWEpJyYvmq8jbtWLmADu7WC27bHa3OU0WFw1svOmUONDYyYoOg7XOg5ZzAuw8a
 Jg1cmSTNkygitEbW1RtMLbWet3u6Ex0vQ/D27KfTmAJzV/RkEQcJlX/CwNWoLSZ/+kSy
 fXq3ykJoz+re33YEldhrKqH3LkmDOdREABnz/fjfhvPkzvORNfw8uYeSurpCZFn2ERXP
 jtkLXtPCDlzDdCojuSuqWvrJDhs1O9ymxuZNozRNpNzsoQb9YR25z/YaLn6vM7HfmmLH
 tjiA==
X-Gm-Message-State: AOJu0Yzt3Kffs+BZXssfLSEyhcUPdfRvdW1Nlf1tVi50w7enNf02zpDx
 pZe2IGLHERp099dhn6f3mlBEADJX9FdARAvS4EibF2WOdNoR9iMkLvCmQlhzh1kX5dASmtPo4ui
 mRX3gjc5mKy/q9k601Gr4Y8dWJ834
X-Received: by 2002:a05:6512:ad3:b0:4fb:745e:dd01 with SMTP id
 n19-20020a0565120ad300b004fb745edd01mr8799043lfu.45.1694449021281; 
 Mon, 11 Sep 2023 09:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFT/b800+k5rxjo807GRz9nrW77AzB8A8eqobtwbZiaP3UyedgpDYvLTqnvwcN3x2j75AAdQ==
X-Received: by 2002:a05:6512:ad3:b0:4fb:745e:dd01 with SMTP id
 n19-20020a0565120ad300b004fb745edd01mr8799026lfu.45.1694449020980; 
 Mon, 11 Sep 2023 09:17:00 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 bm5-20020a0564020b0500b0052e7e1931e2sm4801801edb.57.2023.09.11.09.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 09:17:00 -0700 (PDT)
Date: Mon, 11 Sep 2023 18:16:58 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH drm-misc-next v3 4/7] drm/gpuvm: common dma-resv per
 struct drm_gpuvm
Message-ID: <ZP89eqnqPdvlDoZg@cassiopeiae>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-5-dakr@redhat.com>
 <20230911140035.06159577@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230911140035.06159577@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 02:00:35PM +0200, Boris Brezillon wrote:
> On Sat,  9 Sep 2023 17:31:11 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > @@ -240,9 +240,22 @@ struct drm_gpuvm {
> >  	 * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
> >  	 */
> >  	const struct drm_gpuvm_ops *ops;
> > +
> > +	/**
> > +	 * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
> > +	 * dma-resv to &drm_exec.
> > +	 */
> > +	struct drm_gem_object d_obj;
> > +
> > +	/**
> > +	 * @resv: the &dma_resv for &drm_gem_objects mapped in this GPU VA
> > +	 * space
> > +	 */
> > +	struct dma_resv *resv;
> 
> Hm, I'd be tempted to drop this field and add a drm_gpuvm_resv() helper
> returning vm->d_obj.resv;

Makes sense, will do that for V4.

> 
> >  };
> 

