Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABAB1F0F1F
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC526E40B;
	Sun,  7 Jun 2020 19:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998516E435;
 Fri,  5 Jun 2020 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3NH0uxciW9wNmCNchpq6bM+XDejEEyxzy2dajdLeTWo=; b=RLBZLCNnSMgKapiRRH0snatQ9
 7hWvpFAqDlDO/6hY0S3n1zww8LPaufZjRi69WpU2U9fD/aYUcP1xk7PJe3v9/kcZ0W1PTQddayhmW
 L3B1rg7BEWjG38nnXKuA5UsVYwKI7DfJkkjkZWWRTSHvYMSMUJnSoxk4tGKj1uKugSaQbHmx8XLpR
 dzCjXFVT/n3uG5vBmyIowx3tBTerdgF9VGapd8LQmu6oMmTAFo5j9kFC8p8IeBvLrzSQsR3mm5B66
 nH5FwNMz8ulminYxmJM5+11f1wd81YnpUU0e4F8m7DDBmVu42FQfAwTb4ow24fKn6yGLGqGFro6+c
 3/0FVlvuA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jhADB-0004sx-PN; Fri, 05 Jun 2020 13:08:33 +0200
Received: from [2001:16b8:57f2:b00:9e42:55f5:e968:2436] (helo=linux.fritz.box)
 by sslproxy01.your-server.de with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jhADB-0006U5-H8; Fri, 05 Jun 2020 13:08:33 +0200
Message-ID: <15677f9958dfe4dfdbb3dda978c84a64427fa00f.camel@cyberus-technology.de>
Subject: Re: [PATCH] drm/i915/gvt: print actionable error message when gm
 runs out
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Fri, 05 Jun 2020 13:08:32 +0200
In-Reply-To: <20200605045430.GS5687@zhen-hp.sh.intel.com>
References: <20200603123321.263895-1-julian.stecklina@cyberus-technology.de>
 <20200605045430.GS5687@zhen-hp.sh.intel.com>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.3/25833/Thu Jun  4 14:45:29 2020)
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-06-05 at 12:54 +0800, Zhenyu Wang wrote:
> On 2020.06.03 14:33:21 +0200, Julian Stecklina wrote:
> > +		gvt_err("vgpu%d: failed to allocate %s gm space from host\n",
> > +			vgpu->id, high_gm ? "high" : "low");
> > +		gvt_err("vgpu%d: destroying vGPUs, decreasing vGPU memory size
> > or increasing GPU aperture size may resolve this\n",
> > +			vgpu->id);
> 
> Currently we can't decrease vGPU mem size as defined by mdev type,
> so actually you may try different vGPU type.

Yes, that's what I meant.

>  And aperture size is
> also handled for supported vGPU mdev types, so assume user should
> already be awared of that too. I just don't want us to be too chatty. :)

Our users typically hit this particular error message when they haven't
configured the GPU aperture size in the system BIOS correctly. Many laptops we
see have the aperture set to 256MB and this is simply not enough.

I don't cling to the specific wording of the error message, but any hint in the
error message that this is not an obscure, internal error or bug, but something
that the user can actually fix, would be helpful.

Julian

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
