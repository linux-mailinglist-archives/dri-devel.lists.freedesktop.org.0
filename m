Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E11C3CFE
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 16:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D866E418;
	Mon,  4 May 2020 14:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1126E418
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 14:29:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 52E37804C8;
 Mon,  4 May 2020 16:29:08 +0200 (CEST)
Date: Mon, 4 May 2020 16:29:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/17] drm/mgag200: Move TAGFIFO reset into separate
 function
Message-ID: <20200504142907.GB28466@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-13-tzimmermann@suse.de>
 <20200503162529.GD23105@ravnborg.org>
 <0aa60bf9-2833-4eb7-89cf-90a796d6f0b6@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0aa60bf9-2833-4eb7-89cf-90a796d6f0b6@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=pitqBozi8Ri6JXG7c38A:9 a=CjuIK1q_8ugA:10
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

> > 
> > 
> >> +	WREG_SEQ(0x01, seq1);
> >> +
> >> +	memctl = RREG32(MGAREG_MEMCTL);
> >> +
> >> +	memctl |= RESET_FLAG;
> >> +	WREG32(MGAREG_MEMCTL, memctl);
> >> +
> >> +	udelay(1000);
> >> +
> >> +	memctl &= ~RESET_FLAG;
> >> +	WREG32(MGAREG_MEMCTL, memctl);
> >> +
> >> +	/* screen on */
> >> +	RREG_SEQ(0x01, seq1);
> >> +	seq1 &= ~0x20;
> >> +	WREG_SEQ(0x01, seq1);
> > Here seq1 is read again, the old code used the old value.
> > I think new code is better.
> 
> You mean 'the old code was better,' right?
Well, if there is no good reason to change it stick with the old code we
know works.

I was not sure what would happen with the register when reset
was performed. So maybe reading back would be better, hence my comment.
But re-using the old value gives full control of the register.
So yeah, old code was better.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
