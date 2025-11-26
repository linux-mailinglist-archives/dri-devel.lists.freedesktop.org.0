Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF9C89703
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 12:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8992B10E5AE;
	Wed, 26 Nov 2025 11:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="abG9m7Kt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CD110E5C3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 11:07:40 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-8b2dec4d115so667611285a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 03:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1764155260; x=1764760060;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ySJZVvPVAtkVNPz6NA10TcVQSbkBmCkSCgqEWvBqTZ0=;
 b=abG9m7Kt8F8NjgnXFzzkXLbnECsSf+ZnJ9V3v5vPcDszzatZqekJ0sNpbTsAgmID1v
 IJt2sJ1zpV/ZDoq+tR5cxA4NiFhhXbeHRxOctLaqkpaaolUOyo7gO+OPiZ/DKZvevF8j
 mP00SDVpfxDZMf0SSP4SWZGECG2sSrBP9oJYlPwnKVBfX9m9U1BlU8pemx9vHStjzOjQ
 8hiWGYLIt330NUkbzdyVog+0rpzun2MhPK2p46ibN7fw0iiKCdzY0SsLw7+OsexjwHIg
 7BbOuc/O/eiKBECO2qYfK7kmCza4xKj5r3adTGnH9SsnTyGKovLlqTFB8P6gBq7+q06V
 OsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764155260; x=1764760060;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ySJZVvPVAtkVNPz6NA10TcVQSbkBmCkSCgqEWvBqTZ0=;
 b=b2GG21Ge85yHo/gbkIqxhpqbcFi76eSk2GMK+ZSU5lEgPVHZQ5MAsLUmpHdbU2+zAk
 g2ZcWPuFtZos2oEvIXSccLMiI4+CDpBn9/WXQ5k9tj/UHY0oRmOCIynt7xu2EsySUlVp
 9mfz34s+f3XObwcWLQ4lr9si6xfP+zLg2Yai0cHyOn/6S84zESkMx0jWb1xWr3xrJveg
 rsDCx4qK/bK5fM3Gcqk6UDFVzKAPrdsA8loMrzklTIKKCrR9iMNa3IGgaC2TQzhaHNvA
 hceaYmAVuP/rWxiofKDE+AxSTI19pkF0AJGppEqJVGYFXTp7FW1wvNZGI4YBAeEcDbjQ
 dsRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOan2uGXq+uG6dGJajuFf6+RGC2fOWil97l0Ou3cfvMBhMwF4v5VQQajdHuM0unx4a7AKlyK40/qs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXJwonYvfWALUGqZhjkMZG/446CZ/ChgUiOS0nfyhCUfExLLn2
 zsGOszuRpSk1Cn3wAXXx9zR1Xx3RzAoXowEAY3gourriacY4X2zZvH/Dmmc0ltSLmMReBgKoGcB
 HIOi4ADOoEDBWx3XFYbuZYVx3VljiyNnwf80BkBwdoQ==
X-Gm-Gg: ASbGncvjb7ossq46nu16ehguJP3/0CYSzz3TnA34m4sna/7K0ITFqYN21F7rutn+wG8
 RChJ5VwCZNxmpy7D8fM95oTsJF0uIfzFBl9oaO+VlneQ5qQRzGIA/yFtLe3VdO2fQF4h7tSyBRm
 UZTS/RAOe2L2awoFHTVvBBOQSHwTyU/vfFLdF7SEM5Hw+DzPlEpVxRIQXSUcYv5AzjCTDv1qyWv
 JNJNy3uxsp3WwJ1bOIjXFfvbRfmbwjEZp/1/hYF7f2fXwOvUiBi95HN1I6rpEXwALmr
X-Google-Smtp-Source: AGHT+IFEMRhUJ5DgUF4M36O1+CotSLgmr1pmxYhcDMz2eQI19J/ZEulHKQDG2upEFzMe0pelGzx7DUfPzYgkEkrs7pQ=
X-Received: by 2002:a05:620a:45ab:b0:8b2:f8c6:7ce6 with SMTP id
 af79cd13be357-8b33d5fcea1mr2587147985a.79.1764155259826; Wed, 26 Nov 2025
 03:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
In-Reply-To: <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 Nov 2025 11:07:27 +0000
X-Gm-Features: AWmQ_bk-XY4uko7oWn1VM70Ld-snMR_1TXIzQmZl4NZVeR2M8i3me13S5kT5F4I
Message-ID: <CAPj87rPoadOOTk0LbVb_VKFOOkSq0xG-PU8fRsLaaqO1kKFuDg@mail.gmail.com>
Subject: Re: [PATCH V13 00/51][FINAL] Color Pipeline API w/ VKMS
To: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, xaver.hugl@gmail.com, 
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
 nfraprado@collabora.com, arthurgrillo@riseup.net
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 20 Nov 2025 at 20:13, Harry Wentland <harry.wentland@amd.com> wrote:
> On 2025-11-14 19:01, Alex Hung wrote:
> > Both kernel patches and IGT patches are reviewed and the API is stable
> > for a few revisions. Does anyone have concerns if kernel and IGT patches
> > are to be merged?
>
> Xaver, are the kwin patches ready to be merged?

The Weston patches are ready - they have been for some time now - and
will be merged as soon as this series is.

It would've been nice if we could have had an MTK implementation to go
with AMD and VKMS, but that's still being worked on. I'd expect to see
that and another implementation early next year though, plus whatever
happens with Intel's.

Cheers,
Daniel
