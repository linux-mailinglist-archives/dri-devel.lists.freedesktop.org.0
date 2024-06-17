Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E89990B3B9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 17:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E5210E424;
	Mon, 17 Jun 2024 15:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="VGrWi9mT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF2F10E429
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 15:16:41 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ebd590a79cso4474451fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718637399; x=1719242199; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZRg32UEMT7WqZ/pKpk6skoWeG0nvoilAsxudsilcqo=;
 b=VGrWi9mTQucG4IcTOrn0wiTeWwUqt7itHu/Ts3VZz7hO25fCXkk/9TpaCgoDlqA631
 P4vXmRAE9WLFu76vl2X5jAQ2+KfRhYKP23cN/sj+bJ5FqYbWtDlRchsdaPrWlRXqlpDZ
 /dQLFH0mbhpKE7XLxIhda39l6xiSeUQKPshW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718637399; x=1719242199;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ZRg32UEMT7WqZ/pKpk6skoWeG0nvoilAsxudsilcqo=;
 b=wjGpBl3FnTjEEYulwjxw2ME0eaO5r8ipH8b972eTj/Na+0Uiqa71HW6ufeFVGxNS56
 rwn5xo0gS/GTtVviu1n/UiKdaBlIcVZAtZieZTxRHs61D//6S3EKprlKm2WXvbj4XvfT
 qhMa7C9mxDuOyodQZ0MPE8FIT9AvbptplzeFQ1XnvlEokHZ+89tsU4oGa/ZfZ0Nj+gyy
 Tibbmoo+9h2M7/fpAunS8E3F6G1e6yWZiHwPGFP0dZpT1S66+WYSecVh1YtC+mbn6LSY
 m6IAoRNbOG/MXTpmiavMXQro50Z+t2iQRXa1LaFc6U7mkYkKVJMYDo2fm/nfaKpRJJTc
 Wwww==
X-Gm-Message-State: AOJu0YxFnuRecu55N9EtFJrwA5v9Y8S4TxKF7vvq0zbnoRlyVE7EmitB
 epMQLYhZXyBEE9IVB6BpGKvkaiFKvyQ3hSSOwXTn96tNcLkjYiagSCxBehDBBSQ=
X-Google-Smtp-Source: AGHT+IE52UrrWHkVRNWb2Nh1nGikmu5+nDlZaTp5aYCJLEHCyc6qYKCYs/52BSkbwDA20oulFBmWMQ==
X-Received: by 2002:a19:520c:0:b0:52c:98bb:50ca with SMTP id
 2adb3069b0e04-52ca6e56a75mr5004158e87.1.1718637399101; 
 Mon, 17 Jun 2024 08:16:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602feb0sm158781495e9.20.2024.06.17.08.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 08:16:38 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:16:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: Correct sequencing of usage of DRM writeback connector
Message-ID: <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
References: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 17, 2024 at 01:41:59PM +0000, Hoosier, Matt wrote:
> Hi,
> 
> There is a discussion ongoing over in the compositor world about the implication of this cautionary wording found in the documentation for the DRM_MODE_CONNECTOR_WRITEBACK connectors:
> 
> >  *  "WRITEBACK_OUT_FENCE_PTR":
> >  *	Userspace can use this property to provide a pointer for the kernel to
> >  *	fill with a sync_file file descriptor, which will signal once the
> >  *	writeback is finished. The value should be the address of a 32-bit
> >  *	signed integer, cast to a u64.
> >  *	Userspace should wait for this fence to signal before making another
> >  *	commit affecting any of the same CRTCs, Planes or Connectors.
> >  *	**Failure to do so will result in undefined behaviour.**
> >  *	For this reason it is strongly recommended that all userspace
> >  *	applications making use of writeback connectors *always* retrieve an
> >  *	out-fence for the commit and use it appropriately.
> >  *	From userspace, this property will always read as zero.
> 
> The question is whether it's realistic to hope that a DRM writeback
> connector can produce results on every frame, and do so without dragging
> down the frame-rate for the connector.
> 
> The wording in the documentation above suggests that it is very likely
> the fence fd won't signal userspace until after the vblank following the
> scanout during which the writeback was applied (call that frame N). This
> would mean that the compositor driving the connector would typically be
> unable to legally queue a page flip for frame N+1.
> 
> Is this the right interpretation? Is the writeback hardware typically
> even designed with a streaming use-case in mind? Maybe it's just
> intended for occasional static screenshots.

So typically writeback hardware needs its separate crtc (at least the
examples I know of) and doesn't make a lot of guarantees that it's fast
enough for real time use. Since it's a separate crtc it shouldn't hold up
the main composition loop, and so this should be all fine.

If/when we have hardware and driver support where you can use the
writeback connector as a real-time streamout kind of thing, then we need
to change all this, because with the current implementation, there's
indeed the possibility that funny things can happen if you ignore the
notice (funny as in data corruption, not funny as the kernel crashes of
course).

If we already have devices where you can use writeback together with real
outputs, then I guess that counts as an oopsie :-/

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
