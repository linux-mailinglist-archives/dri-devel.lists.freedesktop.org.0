Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A38C06A7
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 23:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB77511322C;
	Wed,  8 May 2024 21:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N2aWZLLw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CF61126A7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 21:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715205332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AKch4oA/eppOIE56CNYm+6BP4SPb2sY9h6SgFBB2PmA=;
 b=N2aWZLLwlY+LIRvd3xnC1fDz49hD1mqnmyJurtK1TVusoT68limMIIYcfoxIWm8qAAk0lo
 MgeMB0k4K8x9QhXWPIthz0C6o4e48mC4YTT6bPnWGdxVsig1d34LkWOL9jaW+48IyY1TtC
 MSlfBeehIHeOBaPAZPazzx66bleCoRM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-a_ko_7EzOOiL2uykrvSHhw-1; Wed, 08 May 2024 17:55:31 -0400
X-MC-Unique: a_ko_7EzOOiL2uykrvSHhw-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6a0e2e00bddso2083446d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 14:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715205330; x=1715810130;
 h=mime-version:user-agent:content-transfer-encoding:organization:date
 :to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AKch4oA/eppOIE56CNYm+6BP4SPb2sY9h6SgFBB2PmA=;
 b=btv4N1OBTtjWtiEMpUaIfOiu8Do2lSVTYXEyQNWZj/CD1j5E/9a/Kqa5P7R0iQBIZH
 6hteBS+Li5ycXJr4HrsNFT2K4mgmcpc2UjReJuoZapnixWN+SasBW1NuXwvzW5/m6CIq
 k+NzxAaEZL6g/ZksFwNm6c+Pke6LiDQ+sm7PJZorpo1bZb0FBV2IpUIW2vxF72W7h6P/
 5zRswd+Ozdo7J4dZoJb9CDwmGoY8qI/gQe3OTNED7rhxrd4+nNkJNEU9pozEi7irg/qn
 HvKot+OvuTdF1wiIgSPDy6IfwguIUTB2B3AeXTwOfhcuJwH2Oy+zgsngjP20tIvyax+/
 C6Ng==
X-Gm-Message-State: AOJu0Ywkf1blkdE+WbPZIrm69bmewsw67uwvVZCldv5AyoTudKTwb1LG
 sFsqyQ+InT2RwPKpQSYJkx0yUJBgn1Yh5jRVwnUD3Z6TLNmW69IZm/BwqWYodtONzIFSNYM3Okh
 ttk1bOQgz5KnrFSpqTzZn7GQxHUvXYY+2aEDbtVIQwVV6drYShmILHlc8eTLSvnZ1WbAGhwpYZB
 p6KQVz5y0i518eGp3fDm7H5HPx3lS+yPqt/+NuVsSXnf6dKQ==
X-Received: by 2002:ad4:5ca6:0:b0:6a0:5664:a46f with SMTP id
 6a1803df08f44-6a1514788bbmr47047026d6.26.1715205330000; 
 Wed, 08 May 2024 14:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8NsbnUiVxoJWZfczwtrsh7be9Rr22nR4qe36TCKekjl53Kt1cG4qKpUHPToSNv3gWKRr29A==
X-Received: by 2002:ad4:5ca6:0:b0:6a0:5664:a46f with SMTP id
 6a1803df08f44-6a1514788bbmr47046836d6.26.1715205329529; 
 Wed, 08 May 2024 14:55:29 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300:ded4:e2aa:1dec:4d9?
 ([2600:4040:5c6c:a300:ded4:e2aa:1dec:4d9])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f194d2esm256466d6.68.2024.05.08.14.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 14:55:28 -0700 (PDT)
Message-ID: <069ec9c5b1488e1c2f500106aa07f7aa66afef72.camel@redhat.com>
Subject: Don't forget, freedesktop.org offers free CoC training for
 inquiring projects
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, 
 members@x.org
Date: Wed, 08 May 2024 17:55:15 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey everyone! This is just a general reminder that if you're interested
in receiving professional Code of Conduct enforcement training for your
project - freedesktop.org is happy to cover the costs for doing such
training through the wonderful services of https://otter.technology/ .
All that's needed is to send an email to the board, and we can handle
setting up scheduling :).

And of course as always, the Code of Conduct team is always looking for
new volunteers.
--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

