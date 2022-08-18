Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F5B598FA7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 23:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A78F10F0B1;
	Thu, 18 Aug 2022 21:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D978010F0B1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660858624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lScf9Dov1eqBcZW4o7xmR0mpAM2ZlF/Ug/GDTkmjTuQ=;
 b=W3F5ut1aCy5q51EVRAxJ1a1857iK/5WT/oCmqbvy2ZxwJtUJfq2HQ35m6LYpe1mrJ2cd2R
 nPaQ+BpyX/gciuXFkgB3pMEcGly/k+5ivJ2n2QlfCwIyVqKGJ9XmElQKXtcutdSw7mAGMl
 ilFN37uoeq+PzRP7DLHKTudD5mvhGUg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-461-AmvZjM51MTq-J6c10loNDQ-1; Thu, 18 Aug 2022 17:37:03 -0400
X-MC-Unique: AmvZjM51MTq-J6c10loNDQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 m18-20020a0cf192000000b00496ac947c21so1690177qvl.4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 14:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization:date
 :to:from:subject:message-id:x-gm-message-state:from:to:cc;
 bh=lScf9Dov1eqBcZW4o7xmR0mpAM2ZlF/Ug/GDTkmjTuQ=;
 b=042Vii8A0XmwtLwvTEwgq+5D8GswhbCeL9bDfO3/VzKXaFJgzlZ9llWSA+Hb2zaqj8
 CBJbwPTrPi15lHrOAtwWmqEO0jYQYwdZHzd22N9v5q1IgG1g4C2535gEiNVKJMKuj57f
 YHbc1kDH332iprw9TM6KZSruk2nUrpjlpWrR69MpiBHCs8ZmOmwW8f6uLpREG6bcwwWh
 VOQEDjxcmoe2/kMZ6OCXkn6qNKZc+GzI9C+hU352Ht7386Gj2EhUjUxn55yP2L8hCIHh
 +krkZfNAddijqG50T0TZs1hWniPYZ/QLomyEuQo/4cZI0vYB25/pYoMKl8azhrZRWzaF
 4Jug==
X-Gm-Message-State: ACgBeo2MkvzdHGzsN99eHkLzBqYEfXP40hKq9vJqIP4j6RY6D+9gT0Zg
 wY26OjWAvSq9aIVImEYEHcV9OpQPpr3sVSDy5DgNCK7i6pVuhJYAqvcoxYnVj4NkbY5Hl5JK975
 tIjs0in3JDVp/8BSkvrHAdwB7gUvoib9MMlsKNXdta2aUpZoj2o/33DBjd5ovO2eyzx12H0YVA4
 if
X-Received: by 2002:ae9:e896:0:b0:6ba:d725:9464 with SMTP id
 a144-20020ae9e896000000b006bad7259464mr3646437qkg.755.1660858622473; 
 Thu, 18 Aug 2022 14:37:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5b+25EecLpNhY2X11wBAfxHormVviDdk9rLCmrc1s1i9/gJG+PaOFFrXb3KA5RbIv74LqEGA==
X-Received: by 2002:ae9:e896:0:b0:6ba:d725:9464 with SMTP id
 a144-20020ae9e896000000b006bad7259464mr3646423qkg.755.1660858622199; 
 Thu, 18 Aug 2022 14:37:02 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 w4-20020a05620a424400b006b6757a11fcsm2427090qko.36.2022.08.18.14.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 14:37:01 -0700 (PDT)
Message-ID: <7cbe00b0f4059228cb4560bfabafcccd3e7646d0.camel@redhat.com>
Subject: Requests For Proposals for hosting XDC 2023 are now open
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
Date: Thu, 18 Aug 2022 17:37:00 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
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

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

