Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3740E510732
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E791E10E2C4;
	Tue, 26 Apr 2022 18:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E1E10E33C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 18:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650998208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U7x3WHti8mB7zSssr6dU5T2fFBWQH7ax9JH4iLf8LkU=;
 b=d9odd6x1wzf73HOPYL+LjGvCy5TRQTwMNFXtI7TiJWkb2z+0740XtXKsww5enbon1NOxeF
 BeG1IYDTzNhyXmzTw+t6NMKFraaMmw1xYNzzvnOVQgpTc3twvCLZqelVa6nWwYVLUI0dgS
 Jw9Uy9J+ihQ3S93rr9oF7tHVSIqJsL4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-UwEV8IqxMnaMjm47p1dsQg-1; Tue, 26 Apr 2022 14:36:47 -0400
X-MC-Unique: UwEV8IqxMnaMjm47p1dsQg-1
Received: by mail-qv1-f72.google.com with SMTP id
 kc11-20020a056214410b00b0044c93413b94so12895054qvb.16
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 11:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=U7x3WHti8mB7zSssr6dU5T2fFBWQH7ax9JH4iLf8LkU=;
 b=j2o0gDNDUIi+ZqDuS7HAxToaCHL/Wr23FHkrQR7EqPq3JybNCCihoBCYksofuvqkT1
 6uQxpSFpvTQzlifGOFnZ3DN6vBZ6hte95spXBCCwCmdgdbDPwZVgjKQkPGTXXeu2BISu
 0ZdGXCzUv37tR8YqK2cFLvjmU7WRf8aMyOOhD5odZ6XP3tatvWcXw5t8YW38iq5NkN2P
 TRvWH3yvsDa+M+jjSGtRcww+s1qUX5L9JEiSJBISl84UQfSNTmth/zrmcSpdxB5rz2To
 h40dE1m6VH5PYaUgj7A8+x5yLhN7V9siHRqSVQh8xwUVGuxqOHBbKQeu7eI03dDOwlQj
 CQxw==
X-Gm-Message-State: AOAM533qq+ELdoPFQmHyFaXxVvmF8NoNUVlrblngIFwttqtQvDLrs3Ks
 fxDl3AephHf774ghmdwkzY1CN41A6/nERhY/ondqLoMLXCimogs5txRPjb8fxvtlmL7uomBdsF1
 O1SjjUpn7COp8hYn0eI3X9v0WJzdb
X-Received: by 2002:a05:620a:f98:b0:648:a980:5161 with SMTP id
 b24-20020a05620a0f9800b00648a9805161mr13975230qkn.545.1650998206527; 
 Tue, 26 Apr 2022 11:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFlkV78mcoPFbdNEywIl8YhmnRu/TNzHWCRjxstF0LNzVzvVzweFee+/7HtJv0KoRQlwNbkA==
X-Received: by 2002:a05:620a:f98:b0:648:a980:5161 with SMTP id
 b24-20020a05620a0f9800b00648a9805161mr13975211qkn.545.1650998206290; 
 Tue, 26 Apr 2022 11:36:46 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 f39-20020a05622a1a2700b002f367d7a7a5sm4252542qtb.23.2022.04.26.11.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:36:45 -0700 (PDT)
Message-ID: <2be5f25b4212817ebc5e0435467848675063b45f.camel@redhat.com>
Subject: Requests For Proposals for hosting XDC 2023 are now open
From: Lyude Paul <lyude@redhat.com>
To: "events@lists.x.org" <events@lists.x.org>, 
 "xorg-devel@lists.freedesktop.org"
 <xorg-devel@lists.freedesktop.org>, wayland-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, libre-soc-dev@lists.libre-soc.org
Date: Tue, 26 Apr 2022 14:36:44 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: board@foundation.x.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone!

The X.org board is soliciting proposals to host XDC in 2023. Since
XDC 2022 is being held in North America this year, XDC 2023 is expected
to be in Europe. However, the board is open to other locations,
especially if there's an interesting co-location with another
conference.

If you're considering hosting XDC, we've assembled a wiki page with
what's generally expected and needed:

https://www.x.org/wiki/Events/RFP/

When submitting your proposal, please make sure to include at least the
key information about the potential location in question, possible
dates along with estimated costs. Proposals can be submitted to board
at foundation.x.org until the deadline of *September 1st, 2022*. 

Additionally, an quirk early heads-up to the board if you're
considering hosting would be appreciated, in case we need to adjust the
schedule a bit. Also, earlier is better since there generally will be a
bit of Q&A with organizers.

And if you just have some questions about what organizing XDC entails,
please feel free to chat with previous organizers, or someone from the
board.

Best regards,
	Lyude Paul
On behalf of X.org

