Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1389574FC1E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 02:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C732710E121;
	Wed, 12 Jul 2023 00:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5B110E121
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 00:30:05 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3a38953c928so4791492b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 17:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689121804; x=1691713804;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AywlaY7x3Z/gX6am2crBJ9gOzJzowq37abxtBtmocQo=;
 b=ghdEvDcr1IFDaQljt1dRUmu0HvE8cBRXow9dvmJIaaoVnpliy0H6io9/6jVjgOiCvp
 W8ARD6eHNeqfJ+cDPA0NJgPJBqbJKcZVgnHyOUyjNKE8bjkztkk4ySHLSiUBAuECvNvG
 mb/2DywJzkaoQruchWfaALw0QTZyIhkyMl6GdGEbXU96lEG1IIKslGtkOxNFHbPJlukV
 cU3AAipN+IhHQaj7foFoecZ/dEzkn+h7hzibqavkPSnM3iQjwT1oNRd+xdvy8XXbjmLV
 /C6WF+gR5Z+E29WVX3/x1rDq3OotadtwPkAl2sIQPRWVXcg0mMjVQCSxr6vu04KG1I6/
 7Mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689121804; x=1691713804;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AywlaY7x3Z/gX6am2crBJ9gOzJzowq37abxtBtmocQo=;
 b=I3zsHW07gm2pqCmS5whuVx0MStINxoGb6ijAsgbRNdd8aupUx2yvssGzAc4FwHtm9A
 MPORx6AEi9N5lX14a3nPq0GGt3LIUuohdXMa3t0iw6OR+EZDB+XtDjT3KaRR5kB9w8mR
 B37Y2jMEi/Ja70B6oTpp+1TG2rXFvGfUcoUkweKcblVhj4kZwfPj5CkyLkMqErFOykRf
 tgQ64sYesrChSzWUA/R0koA6ni9VRDPcFJAQRyDetjH3y9XoVeLH38sZasBV2RuZXaFK
 V7mlQfQZNkrsyMOAChL2m9B9dcQEwiL8dcfZ7E2Nelh5DKubY9J5fBxU6CAby8Wg3wHH
 nNig==
X-Gm-Message-State: ABy/qLZLD+rD4Pg+v4HwPAl5jzpxFC7maXhS4La0GjiyIfy70lyKTTjD
 cjkDBv14pgTRM4FrEFTbISA=
X-Google-Smtp-Source: APBJJlERzXloivjI5bk3/nTAyrXULoGFQYQ9HeldnM+GEDq5PgIauvtfIOYiM1H16bglc4CH0JAn3w==
X-Received: by 2002:a05:6808:1aa6:b0:3a3:78dc:8c4c with SMTP id
 bm38-20020a0568081aa600b003a378dc8c4cmr15877789oib.46.1689121804077; 
 Tue, 11 Jul 2023 17:30:04 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:9374])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a62e70a000000b006687b41c4dasm2285401pfh.110.2023.07.11.17.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 17:30:03 -0700 (PDT)
Date: Tue, 11 Jul 2023 14:30:01 -1000
From: Tejun Heo <tj@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
Message-ID: <ZK30CR196rs-OWLq@slm.duckdns.org>
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
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
Cc: linux-rtc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, netdev <netdev@vger.kernel.org>,
 kernel-team@meta.com, Lai Jiangshan <jiangshanlai@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 11, 2023 at 11:39:17AM -1000, Tejun Heo wrote:
> On Tue, Jul 11, 2023 at 04:06:22PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Jul 11, 2023 at 3:55 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
...
> > workqueue: neigh_managed_work hogged CPU for >10000us 4 times,
> > consider switching to WQ_UNBOUND
> 
> I wonder whether the right thing to do here is somehow scaling the threshold
> according to the relative processing power. It's difficult to come up with a
> threshold which works well across the latest & fastest and really tiny CPUs.
> I'll think about it some more but if you have some ideas, please feel free
> to suggest.

Geert, do you mind posting the full kernel logs for the affected machines?

Thanks.

-- 
tejun
