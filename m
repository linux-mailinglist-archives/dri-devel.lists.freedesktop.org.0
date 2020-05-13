Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536291D1BEB
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 19:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5202E6EA7E;
	Wed, 13 May 2020 17:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB396EA7E;
 Wed, 13 May 2020 17:08:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBlHbuh9b9GZLzHFrfPZVNRYUkOP3yF815g2vbLzBEbuJISbz4HBtMzG0ijiLRcFB+Ek3ECAjvn1tNuW7vKoPnBwmXXaDk71LrkqohhwNhdHCq5vjU534fPLcWVseZjTU2JQHvEMfMAXmwz8BDK4jFCKZIba6AR/MnuL3yUmiiF8MEb5MS7hnaeDwir4gIeLlZXzwT5K1ZNv1shFlf3MAvkurcqwj2JbjYm4rdZlKaghEmlWiSiiY6IjQgW2kq+BRII4hSyxr8EM6MlK8w4ETZUtsdgX9UiqsxeddPYrRs3X4M+8wQKFQQ97TSJTjJcO6KJLxnZ2ayEH/hgxgcmsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mDzF84INkLzGBoMqqGPl8inMEBznIIn9ux4foP7EM8=;
 b=azUVBBtZX+hbtTOIvjIYx9gF+oaN6XW/8ikvBBlT6sAbW9F+/feyyVEnP9wQjHe02Pe2K7I8aHcY7Mo8a4p9DITxVW/ke1gYsAAaOrEeKKiEB6Af4NgZqqe16hm3xFHU9MuCcPWbe7n7Tx8TauvT57xB64J94N00qTXwMQQ+s03/AoBHsLc248ay1zvgK3gwZ1mVVknFsjw3E8siTbtVATaAKa75o2l4XLr0t2XCJfs0SARZOuqoki7O9iYjpfRQoYAp/QzrpC1vRaB0q+BDG5HP7+pewisyn4rvQe9MTI08QDVJCuLZdXnfRm3QyiftLeen5V6wgSm+8zF+DaSZ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mDzF84INkLzGBoMqqGPl8inMEBznIIn9ux4foP7EM8=;
 b=aD7TB2J4jXYqXAx/WdkXXKJqTySbQ12ysNT+ZLCKKzyGfZoAQRjwDz9iOAq+gxVujY0mhwOh6axO4Zg510PLdCSZBCVpuxLSmIQA/z36VTB3wID6L8Cq9nBsDZrDUJTPtTifc2Q32SFCNebzQe2rqicMrAxbAAIdtlbPuDkqbhc=
Received: from MN2PR05MB6381.namprd05.prod.outlook.com (2603:10b6:208:d6::24)
 by MN2PR05MB6653.namprd05.prod.outlook.com (2603:10b6:208:dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.15; Wed, 13 May
 2020 17:08:19 +0000
Received: from MN2PR05MB6381.namprd05.prod.outlook.com
 ([fe80::7803:13e7:2e4d:58ff]) by MN2PR05MB6381.namprd05.prod.outlook.com
 ([fe80::7803:13e7:2e4d:58ff%3]) with mapi id 15.20.3000.016; Wed, 13 May 2020
 17:08:19 +0000
From: Ashwin H <ashwinh@vmware.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v4.19.x] make 'user_access_begin()' do 'access_ok()'
Thread-Topic: [PATCH v4.19.x] make 'user_access_begin()' do 'access_ok()'
Thread-Index: AQHWKIdKPHhk+fo7OUe7+WKkK8SJkqilhT4AgABhFAD//6nZgIAAsMCg
Date: Wed, 13 May 2020 17:08:19 +0000
Message-ID: <MN2PR05MB63814CDAAF6828285929736ACDBF0@MN2PR05MB6381.namprd05.prod.outlook.com>
References: <d29f87f3f3abb4e496866253bd170faad976f687.1589305630.git.ashwinh@vmware.com>
 <20200513055548.GA743118@kroah.com>
 <89DE19F6-4CB0-4324-A630-C8574C8D591C@vmware.com>
 <20200513063455.GA752913@kroah.com>
In-Reply-To: <20200513063455.GA752913@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=vmware.com;
x-originating-ip: [49.206.7.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3d4df3c-d6e5-410a-efe5-08d7f7603c52
x-ms-traffictypediagnostic: MN2PR05MB6653:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6653AB30C7778494E5B6DC73CDBF0@MN2PR05MB6653.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Gb16DfpxVeX6lxIOH7XtA7VcpmMQ1WsW4NB3PKPRNHGFL0/giu/KmvS/2YsbFEdfk5nBE/ZFF14Hddz2kIsX+rPBZe/voBZIcmAiRWsQscW1kuS6YpfXfYf8v13OOh0cPO1Qon1H5HythxcuJkyQRHYnlJc5jD7DILmsJCAKGReeOOp3prUlIu15p14MYbsubbV5ap2tfvfm6S/KSL0ldYWjSVLIt3QNKL14hqu3JBX1RGpWqZ9PI+cDp4iBXZZwjBsmP+XVdIFFIXcZ8/oodwe0tIKT2EndIeIP6LQ0i6KMK3Fn7L9z4gMWuaLCr+IzvJxD0F/dXC8bwJ8+XKl+xDrtaMyw2vtE3WAFxbMxwmgDhuVfsy5kWdXwK0lSd8DTgTNoGycshN+eJB/nAVWI9rSLlYfEv+PUKrXo2pqFvqfqshvKcDZ2U3NuuRhu4VcKbBUodeRBdESIaWqa/C2DAkKNHoSVB2UNSpF2QmtS4BncA2BS3nUMOAIPMoiclDVgs9tbbBXzmK86cxHQ10YBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6381.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(33430700001)(6506007)(316002)(55236004)(54906003)(66476007)(33440700001)(7696005)(76116006)(66946007)(64756008)(66556008)(66446008)(52536014)(86362001)(2906002)(55016002)(5660300002)(478600001)(9686003)(26005)(186003)(4326008)(71200400001)(8676002)(6916009)(33656002)(8936002)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: K8HSN7VVCnDxDnSR/qiPLQkGlTON2DeltziLp9hkNflU5fnqNEJRYSEZm3Jk1JY0A32EQZyLdA+KGYUuhUwKtLLDgIL/diMzUnff8JiZBij7ywCDyjsff3fQsyowiC5Jqqc5GU5sErC9GKsIpCe3Vie3QcK7bKz8mIPe9gXiUCv1XIGZbDxsGpmbQoqxsTBaiSgeDyuJjb03kMed6ouMBjcrMDlnslIXIMjtIERXZN0+DFBlsTI4QHky8TDvc66f/Xu+iB95NjUVV3r3n6OMKhBRVNNyq85rNyqRpFDClIidrF5LdINosJ2uZvAmgQ5qBFbjPMk5KFpy+nY7iBm642Qg7VQgPtYRnJeYQEyPWV6k+mFskiSyn+KdGkuKFdauLN4WXMQAz5St9hvBizaRjezx1EL6qhfQHGcjfQsQF/7CHnA1qh3zKR3tRl0Vh4Wc4rLDGuH9N/A7rYb5gkCDzSiwHvLII0OeYNzieLfX9zM=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d4df3c-d6e5-410a-efe5-08d7f7603c52
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 17:08:19.6114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q5mFC8wLOAMenw1UXT6WW/zLPbO+NhiaeeoYK+nHYBA6hkuNOuz54re56hHIlLSOPgsiJh16CKVmGrOfUU2ULQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6653
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Steven Rostedt <srostedt@vmware.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "stable@kernel.org" <stable@kernel.org>, Srivatsa Bhat <srivatsab@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Ok, but what does that mean for us?
> 
> You need to say why you are sending a patch, otherwise we will guess wrong.

In drivers/gpu/drm/i915/i915_gem_execbuffer.c, ioctl functions does user_access_begin() without doing access_ok(Checks if a user space pointer is valid)  first.
A local attacker can craft a malicious ioctl function call to overwrite arbitrary kernel memory, resulting in a Denial of Service or privilege escalation (CVE-2018-20669)

This patch makes sure that user_access_begin always does access_ok. 
user_access_begin has been modified to do access_ok internally.

Thanks,
Ashwin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
