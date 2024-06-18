Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B79090C55D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050F610E602;
	Tue, 18 Jun 2024 09:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TIAjPYas";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A939B10E602
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:33:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-423ba0ae685so1222355e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718703238; x=1719308038; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TPEz0iz9WHeWPjl5Nv/cUJ9CAO5fzlMc3ZIqCKUuBO4=;
 b=TIAjPYasF3zI08wQCbWwi1/2NaO/cJ84ZtJKlh7mRd2MpiqBkQzuaJyyFVK/ecmHA6
 9t22I0gfRNbHpGtXBW7okgm3uY9y1ribXQEBcRSBM9ltu210oONlk1bhMvKfs8s0kpwf
 20qzvnHKuwZp6bGBOQqBhkaEoKd0/TXg25Du4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718703238; x=1719308038;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TPEz0iz9WHeWPjl5Nv/cUJ9CAO5fzlMc3ZIqCKUuBO4=;
 b=XTY7oC64Ii40KlWV7JLdMNlHccjXKv1vS9kE3KVJH+Ul3wiEyFrC5PwYuvxWMIvq2y
 8ybUeYxvETkdwaPR+Ye8HE1HqdtOSYeo+UHz5fE7/Z6JRnOsRGo+p4JqANh/IzMP2sMr
 tg+GU1GMCW5Q3IsCd7Ie+7FtLsMVyL5jRF75+qQL7Zr4vpCWrChBFxVu85WIdjELPsKd
 WCMWuoZfB+VrzRnEREmllz7d6Rqstt88oJE0/5xrfDXOAmi22bqsmJUtaNa3GXwyoz8R
 LF1yUf+k6cZhnoBexukiYwEjOZDPDzOughi5kwaj8xpuqAX5zy5GSafco+U9j5QT40vN
 X1ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvAqYU40xgRCmlSiefMasRLPvlS+mjSKE8NaZyNhMGnXmxhnJ8A1Pn78XYhzLwEbdzJNXK/WU34ihEc3lQn6nVdkKTJIcawkD1cSACAnn3
X-Gm-Message-State: AOJu0Ywcg8nxjyIG/6yJBbYRdE/F2MavdhPtP+fZQtCZvqwDl2s8fg0a
 YJrNlAjLIujTncdmmtXrh191yeMv+jhmOYQ/jR6Y6xavJKO5SOEevAUVHwfaMoE=
X-Google-Smtp-Source: AGHT+IGbjv+Vb9h5gmaj+2QyHOVvtmH0b2HA2zx01MuoXQDmvnjdqSXIkVx/3yrWRhBC9BgxPNYxyg==
X-Received: by 2002:a5d:584a:0:b0:35f:1412:fa8a with SMTP id
 ffacd0b85a97d-3607a76aae3mr9083783f8f.1.1718703237820; 
 Tue, 18 Jun 2024 02:33:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-362907048b0sm278192f8f.24.2024.06.18.02.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 02:33:57 -0700 (PDT)
Date: Tue, 18 Jun 2024 11:33:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Brian Starkey <brian.starkey@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Hoosier, Matt" <Matt.Hoosier@garmin.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, nd@arm.com,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: Correct sequencing of usage of DRM writeback connector
Message-ID: <ZnFUg91URIHn_SbR@phenom.ffwll.local>
References: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
 <ZnBTVCHneR6DQPxX@phenom.ffwll.local>
 <cph4jfd7dy5mxfmnp5iaacxen7zszeiudvpyq4tebgp7fukzzc@xx5m65uwwp6n>
 <5e17dea9-e430-51f5-83f9-ce02241438f8@quicinc.com>
 <cnbiivlsrutjbxw7jeetuyrnm3luvepstlwqxxrzsfhyzlgukk@3jx64owwkv2h>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cnbiivlsrutjbxw7jeetuyrnm3luvepstlwqxxrzsfhyzlgukk@3jx64owwkv2h>
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

On Mon, Jun 17, 2024 at 10:52:27PM +0300, Dmitry Baryshkov wrote:
> On Mon, Jun 17, 2024 at 11:28:35AM GMT, Abhinav Kumar wrote:
> > Hi
> > 
> > On 6/17/2024 9:54 AM, Brian Starkey wrote:
> > > Hi,
> > > 
> > > On Mon, Jun 17, 2024 at 05:16:36PM +0200, Daniel Vetter wrote:
> > > > On Mon, Jun 17, 2024 at 01:41:59PM +0000, Hoosier, Matt wrote:
> > > > > Hi,
> > > > > 
> > > > > There is a discussion ongoing over in the compositor world about the implication of this cautionary wording found in the documentation for the DRM_MODE_CONNECTOR_WRITEBACK connectors:
> > > > > 
> > > > > >   *  "WRITEBACK_OUT_FENCE_PTR":
> > > > > >   *	Userspace can use this property to provide a pointer for the kernel to
> > > > > >   *	fill with a sync_file file descriptor, which will signal once the
> > > > > >   *	writeback is finished. The value should be the address of a 32-bit
> > > > > >   *	signed integer, cast to a u64.
> > > > > >   *	Userspace should wait for this fence to signal before making another
> > > > > >   *	commit affecting any of the same CRTCs, Planes or Connectors.
> > > > > >   *	**Failure to do so will result in undefined behaviour.**
> > > > > >   *	For this reason it is strongly recommended that all userspace
> > > > > >   *	applications making use of writeback connectors *always* retrieve an
> > > > > >   *	out-fence for the commit and use it appropriately.
> > > > > >   *	From userspace, this property will always read as zero.
> > > > > 
> > > > > The question is whether it's realistic to hope that a DRM writeback
> > > > > connector can produce results on every frame, and do so without dragging
> > > > > down the frame-rate for the connector.
> > > > > 
> > > > > The wording in the documentation above suggests that it is very likely
> > > > > the fence fd won't signal userspace until after the vblank following the
> > > > > scanout during which the writeback was applied (call that frame N). This
> > > > > would mean that the compositor driving the connector would typically be
> > > > > unable to legally queue a page flip for frame N+1.
> > > > > 
> > > > > Is this the right interpretation? Is the writeback hardware typically
> > > > > even designed with a streaming use-case in mind? Maybe it's just
> > > > > intended for occasional static screenshots.
> > > > 
> > > > So typically writeback hardware needs its separate crtc (at least the
> > > > examples I know of) and doesn't make a lot of guarantees that it's fast
> > > > enough for real time use. Since it's a separate crtc it shouldn't hold up
> > > > the main composition loop, and so this should be all fine.
> > > 
> > > On Mali-DP and Komeda at least, you can use writeback on the same CRTC
> > > that is driving a "real" display, and it should generally work. If the
> > > writeback doesn't keep up then the HW will signal an error, but it was
> > > designed to work in-sync with real scanout, on the same pipe.
> > > 
> > 
> > Same with MSM hardware. You can use writeback with same CRTC that is driving
> > a "real" display and yes we call it concurrent writeback. So I think it is
> > correct in the documentation to expect to wait till this is signaled if the
> > same CRTC is being used.

TIL

> > > > If/when we have hardware and driver support where you can use the
> > > > writeback connector as a real-time streamout kind of thing, then we need
> > > > to change all this, because with the current implementation, there's
> > > > indeed the possibility that funny things can happen if you ignore the
> > > > notice (funny as in data corruption, not funny as the kernel crashes of
> > > > course).
> > > 
> > > Indeed, the wording was added (from what I remember from so long
> > > ago...) because it sounded like different HW made very different
> > > guarantees/non-guarantees about what data would be written when, so
> > > perhaps you'd end up with some pixels from the next frame in your
> > > buffer or something.
> > > 
> > > Taking Mali-DP/Komeda again, the writeback configuration is latched
> > > along with everything else, and writeback throughput permitting, it
> > > should "just work" if you submit a new writeback every frame. It
> > > drains out the last of the data during vblank, before starting on the
> > > next frame. That doesn't help the "general case" though.
> > > 
> > 
> > Would it be fair to summarize it like below:
> > 
> > 1) If the same CRTC is shared with the real time display, then the hardware
> > is expected to fire this every frame so userspace should wait till this is
> > signaled.
> 
> As I wrote in response to another email in this thread, IMO existing
> uAPI doesn't fully allow this. There is no way to enforce 'vblank'
> handling onto the userspace. So userspace should be able to supply at
> least two buffers and then after the vblank it should be able to enqueue
> the next buffer, while the filled buffer is automatically dequeued by
> the driver and is not used for further image output.

Yeah if you want streaming writeback we need a queue depth of at least 2
in the kms api. Will help a lot on all hardware, but on some it's required
because the time when the writeback buffer is fully flushed is after the
point of no return for the next frame (which is when the vblank event is
supposed to go out).

I think over the years we've slowly inched forward to make at least the
drm code safe for a queue depth of 2 in the atomic machinery, but the
writeback and driver code probably needs a bunch of work.
-Sima

> 
> > 
> > 2) If a different CRTC is used for the writeback, then the composition loop
> > for the real time display should not block on this unless its a mirroring
> > use-case, then we will be throttled by the lowest refresh rate anyway.
> 
> what is mirroring in this case? You have specified that a different CRTC
> is being used.
> 
> > 
> > > > 
> > > > If we already have devices where you can use writeback together with real
> > > > outputs, then I guess that counts as an oopsie :-/
> > > 
> > > Well "works fine" fits into the "undefined behaviour" bucket, just as
> > > well as "corrupts your fb" does :-)
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
