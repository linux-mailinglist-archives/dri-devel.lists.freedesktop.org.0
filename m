Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0964BEEF8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 02:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E99610E371;
	Tue, 22 Feb 2022 01:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D97C10E25C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 01:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645494368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=96JzHwNa1B2QXjUWnZ374iz4+U14qI3CRmOmAH0GIUs=;
 b=Xc4roBB8D2fGwn4ZMxj6JqZi0T5nUrireTjP+YZwFY8kCZ5oJXHKDtfaxuAa0ifbD5mhnU
 zuMizmAiXEYR9mgPF2QYbFlg+A2U82RlqKwhBFVGrd4vAWbQLKT6L3moQMZ8CaZv0d4iSJ
 WqAessbw8OaGH56YfV4NU4YsWyHRn1g=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-ajq7fJHjPPOSaqKYN4xQKg-1; Mon, 21 Feb 2022 20:46:01 -0500
X-MC-Unique: ajq7fJHjPPOSaqKYN4xQKg-1
Received: by mail-qk1-f198.google.com with SMTP id
 p67-20020a378d46000000b0062adb7627edso11055586qkd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 17:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=96JzHwNa1B2QXjUWnZ374iz4+U14qI3CRmOmAH0GIUs=;
 b=aOHoIiOHLDldNfEcNtLWiscP/+TR6BmYHl1kcv5Dusgr4tw/sJviJMhrealqFSo979
 v+yyClVp691S34QvR6UHsOBNdKtQacs7X25aHzxeYawuXlmRngeVOsZoDHqid6WXoYYr
 xKiyap63JWB1eZrF7CO2Z3FL7kOYFJdugvZB9+ABKjOiHeKOCLlqk8EwIrWrbScwzXn2
 ZIgiaEbp/aRsTU+1FdKFzVy+Y+Nk4BH2d7UDG0U5xj/3iaaWz5IkuYD00VdgoJKNaqfh
 JwVM6O8UzmXW1DbdBck7+h6VhdbedR6nAiDT8sOzZgyvVvgWXymQTfTwYBiCEjXZmh2M
 o7Gg==
X-Gm-Message-State: AOAM532QbTmU+RhMdyPiW8cmm/HmxRALc06UI8MalWeKs3Ob+UqpOQ2C
 +/TVHoryCazOYoIsUyLDWCrhEHODTSu3Iu31LLKUFRRG264yZwfPYDdiGBtj7irSSMusxkF/aXK
 mpZqOkkL8ssUTIdwHCgdpHKFDDPa6
X-Received: by 2002:a0c:bec2:0:b0:42d:7a97:7c50 with SMTP id
 f2-20020a0cbec2000000b0042d7a977c50mr17596029qvj.64.1645494360784; 
 Mon, 21 Feb 2022 17:46:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRyX/nST1Psi3yWzhSr7BZIQG7ecyOcllTfLzjLqbPHMXIvAV7C+vXZhS0bg1zhOmNbnqosg==
X-Received: by 2002:a0c:bec2:0:b0:42d:7a97:7c50 with SMTP id
 f2-20020a0cbec2000000b0042d7a977c50mr17596017qvj.64.1645494360574; 
 Mon, 21 Feb 2022 17:46:00 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id j128sm6512810qkd.61.2022.02.21.17.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 17:46:00 -0800 (PST)
Message-ID: <e93170406e5ea46e95f44d4e33f0c86a78c0623a.camel@redhat.com>
Subject: 2022 X.Org Board of Directors Elections Nomination period is NOW
From: Lyude Paul <lyude@redhat.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 libre-soc-dev@lists.libre-soc.org
Date: Mon, 21 Feb 2022 20:45:58 -0500
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

We are seeking nominations for candidates for election to the X.Org Foundation
Board of Directors. All X.Org Foundation members are eligible for election to
the board.

Nominations for the 2022 election are now open and will remain open until
23:59 UTC on 06 March 2022.

The Board consists of directors elected from the membership. Each year, an
election is held to bring the total number of directors to eight. The four
members receiving the highest vote totals will serve as directors for two year
terms.

The directors who received two year terms starting in 2021 were Lyude Paul,
Samuel Iglesias Gonsálvez, Manasi D Navare and Daniel Vetter. They will
continue to serve until their term ends in 2023. Current directors whose term
expires in 2022 are Emma Anholt, Keith Packard, Harry Wentland and Mark
Filion.

A director is expected to participate in the fortnightly IRC meeting to
discuss current business and to attend the annual meeting of the X.Org
Foundation, which will be held at a location determined in advance by the
Board of Directors.

A member may nominate themselves or any other member they feel is qualified.
Nominations should be sent to the Election Committee at elections at x.org.

Nominees shall be required to be current members of the X.Org Foundation, and
submit a personal statement of up to 200 words that will be provided to
prospective voters. The collected statements, along with the statement of
contribution to the X.Org Foundation in the member's account page on
http://members.x.org, will be made available to all voters to help them make
their voting decisions.

Nominations, membership applications or renewals and completed personal
statements must be received no later than 23:59 UTC on 6th March 2022.

The slate of candidates will be published 14 March 2022 and candidate Q&A will
begin then. The deadline for Xorg membership applications and renewals is 17
March 2022.

Cheers, Lyude Paul, on behalf of the X.Org BoD


