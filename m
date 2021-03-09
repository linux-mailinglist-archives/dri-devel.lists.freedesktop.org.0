Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FE5332F11
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 20:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F57E6E939;
	Tue,  9 Mar 2021 19:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B536E939
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 19:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615318499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Efq/XdZADcIcPCwsZh2URVLR5lQJ44Ni5hT8xLHIW0=;
 b=K72x2s2HyAznseg8fx2KVVF345KOvCoAXk6ySPfsj/aKePtNWC1DiAHpa5QxjO92ZDJF33
 CW5Asapx/8EVk2DEwDmBBuuWxR54E8MyPu2sZIMBSAOzvZbfDiU8m38ysPhebFM2WiahDD
 N/FQyOOEljo3v+R9THFxrFEs3NiAeao=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-9Ew9qz47Ow2yGgl3XpkjXA-1; Tue, 09 Mar 2021 14:34:57 -0500
X-MC-Unique: 9Ew9qz47Ow2yGgl3XpkjXA-1
Received: by mail-pf1-f199.google.com with SMTP id c5so9059798pfl.22
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Mar 2021 11:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0Efq/XdZADcIcPCwsZh2URVLR5lQJ44Ni5hT8xLHIW0=;
 b=lB7da2+knrp9vjHisfCpwyqQFEFGgBFa3ziXKXLN1FntirGsMwOYAsHiw5s9tW4hz1
 kf63ZC7N94JWBH4GKDnaaNGqc81jildpdNM0vwh17/8uKvd3viFCGyOHnfyBYInoPf3t
 Oeq2kOw7RaLG8HMoTaC6ieE9TxM3gywlM2DZg4pQUpRBHmoghuT3t3RkfhUFSvFRM5b5
 Ak22U+5TYKexKk59A/DlFU5HJ7VwKe+IWMEeRCRTrnnLUwY90fSBliKhHUg0Md93wfk7
 ygFJIrSCNKc55HAvhK1m3S8e9HK4n/5GiD7gl+sWN0OcBDXquxeJamV53tu8P4ptIkFQ
 C9HQ==
X-Gm-Message-State: AOAM532YiFrEUTOOETHxh585R6z/ndPeZ4noAAwDaQQDrNgWdhstcD05
 xHwmOoi68TyBDAoZp2BpjyDQy+59NWn+tiPGiDn03vf7P/ltg6GItchprBD2g381gUxmymXna+k
 zgugw3Ta49urCdbJxvHWy30G+bZu1
X-Received: by 2002:aa7:9910:0:b029:1f1:b41b:f95c with SMTP id
 z16-20020aa799100000b02901f1b41bf95cmr16633066pff.5.1615318496365; 
 Tue, 09 Mar 2021 11:34:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEm2SCLdiAFQWg7SaJuVodSLt/bg3Ucx4zEwtP8tgO/rpA7knG+uMEuOT6zr7D47BEOpBgZw==
X-Received: by 2002:aa7:9910:0:b029:1f1:b41b:f95c with SMTP id
 z16-20020aa799100000b02901f1b41bf95cmr16633059pff.5.1615318496200; 
 Tue, 09 Mar 2021 11:34:56 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id gw20sm3591571pjb.3.2021.03.09.11.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 11:34:55 -0800 (PST)
Date: Wed, 10 Mar 2021 03:34:41 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/9] fs: add an argument-less alloc_anon_inode
Message-ID: <20210309193441.GB3958006@xiangao.remote.csb>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-3-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210309155348.974875-3-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Minchan Kim <minchan@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 09, 2021 at 04:53:41PM +0100, Christoph Hellwig wrote:
> Add a new alloc_anon_inode helper that allocates an inode on
> the anon_inode file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Gao Xiang <hsiangkao@redhat.com>

Thanks,
Gao Xiang

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
