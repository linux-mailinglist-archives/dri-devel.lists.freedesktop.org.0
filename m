Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE507D9AFE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 16:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B318010E9B8;
	Fri, 27 Oct 2023 14:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD2E10E9B8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 14:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698416208; x=1698675408;
 bh=QXLr3paWx80kXETZ/2S0LTcMk0s882vYeu6l5f0T+OA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=AmC2u+QUicuPUNksKKJqdubbdxzo0spQiB5eKNGSqtZkaztCHr2TjI/Dp4P7g7Xse
 3R4q77V+k+Ctf83WNtWHB6Ia4UtfqLqmTxpIkzB5DT/E010b6vTEnS9Cy7rvk3w4qW
 yrhazq9/JlEivTDYZw8DjesPTW9OFJ1FRNnDdzUilz2AXnN3dghwHgJDkbT4Z+OEgx
 +hdxsCjowvDfjaVSnZhk9jkOk3+e2iXAkBYdrHwwDeEM6J14EfDZv9I/MP2nnReCKF
 Bs9K9fjEVpso/i4Xq2jr+IGguZJMGz75LSNL7j+qGESnfJjjfaDAG0/ZpqW80Mne74
 E31EVM2KXbT7g==
Date: Fri, 27 Oct 2023 14:16:32 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH v2 01/17] drm/atomic: Allow get_value for immutable
 properties on atomic drivers
Message-ID: <h_oVqKJNaTa8Z9x3ue075PEQR0RHjf-kzo2PjNwgdcbadP0179UaEKTNvx3oFei_dFQQXyUeQC-KNGKZzBtD3VeDK9sTzDR9R4-EX-oCi70=@emersion.fr>
In-Reply-To: <20231019212133.245155-2-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-2-harry.wentland@amd.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher Braga <quic_cbraga@quicinc.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Have you seen the comment on top?

 * Atomic drivers should never call this function directly, the core will r=
ead
 * out property values through the various ->atomic_get_property callbacks.

It seems like atomic drivers shouldn't call drm_object_property_get_value()
at all?
