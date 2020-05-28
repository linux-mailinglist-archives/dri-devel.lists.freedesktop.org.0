Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D261E589D
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2BB6E0A6;
	Thu, 28 May 2020 07:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67F36E0A6;
 Thu, 28 May 2020 07:30:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKjk6MUL0AbvsMrWqyWtM4bATpX6RrrbAVB/43dCmzTRq7ytXLZcruG+EFHS0PV8bD1t1QC0v0Hjt7YUImEKUNZQ5GsrCl6X3iv9Ljmz8RKtLIAOvYq+zH+9ruUql5k5LKTVohf+XKRtfTjkbhG+Pjbfh/veXqdnsT+ququVkbnzPPuQEIdVSEzs5jSOMEudzPhIhUYYQUlM9T4Gj+z9nRviWFAAV5awr/BLIF87YLYvrXwdYdfmztGVj/i1TEI1GaE7p4ifFhJ7ywJR2m3DdcwwN12NNEp04bv18ipaM0c+dxqBWlSWnVjBUyTkQPEn62rJlhhHZnOOHseR9qeJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98TzveflbfTcwFSXAZ5jgvqD0Ew7ZhXLjnZNNGsnk6I=;
 b=WMN8suAVXgXFjaYVcYRkNCER2t81TTkjKdA4Q056pbDrZJF2ySu0zFsS3+KujRwVOT8tL7XkvJbETA3QR2AtecwfHGHbOK2QysfggKhMHK9+tQpw3CceWwFzbPuCYZTbEFGO2x/bKL8eHrcMr+BPEtqTWQQUQLXocZB+y/EUFKD3Q02fYkLLOxgDVEWJ19DPUSyA1IotzoH71ImDDexFmv12jw/PEwFCGfOXJ9L7d6ECT7fM9eykBXkGoyegzk8QofphXbf2w/B+PSXENRZ2pU6x/nStdBOdDryIrQKBQo0JPd80cclukuz82O/T62GAHmdk2e9/dhOSV//+ABov2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98TzveflbfTcwFSXAZ5jgvqD0Ew7ZhXLjnZNNGsnk6I=;
 b=qL9bpDOKU91UOaDXMga4q5ziIkypgw+wz3icQKMZadQTEYRiBU1T1czfP9rKX4OFI/4xeswqJ25hrpvbjYs5Iy3sxrCsSmpvBY6UHiQhVmR5tEYeEIENlasIR2xcfYjjbSGNR79K+SAMfGw9TILdtepXgAC8dg2ksabkZG7YVKE=
Received: from MN2PR05MB6381.namprd05.prod.outlook.com (2603:10b6:208:d6::24)
 by MN2PR05MB6381.namprd05.prod.outlook.com (2603:10b6:208:d6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.7; Thu, 28 May
 2020 07:30:31 +0000
Received: from MN2PR05MB6381.namprd05.prod.outlook.com
 ([fe80::7803:13e7:2e4d:58ff]) by MN2PR05MB6381.namprd05.prod.outlook.com
 ([fe80::7803:13e7:2e4d:58ff%3]) with mapi id 15.20.3066.007; Thu, 28 May 2020
 07:30:31 +0000
From: Ashwin H <ashwinh@vmware.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v4.19.x] make 'user_access_begin()' do 'access_ok()'
Thread-Topic: [PATCH v4.19.x] make 'user_access_begin()' do 'access_ok()'
Thread-Index: AQHWKIdKPHhk+fo7OUe7+WKkK8SJkqilhT4AgABhFAD//6nZgIAAsMCggBXlzwCAAQnu4A==
Date: Thu, 28 May 2020 07:30:30 +0000
Message-ID: <MN2PR05MB63818AE71850AD653E60E517CD8E0@MN2PR05MB6381.namprd05.prod.outlook.com>
References: <d29f87f3f3abb4e496866253bd170faad976f687.1589305630.git.ashwinh@vmware.com>
 <20200513055548.GA743118@kroah.com>
 <89DE19F6-4CB0-4324-A630-C8574C8D591C@vmware.com>
 <20200513063455.GA752913@kroah.com>
 <MN2PR05MB63814CDAAF6828285929736ACDBF0@MN2PR05MB6381.namprd05.prod.outlook.com>
 <20200527153130.GA525531@kroah.com>
In-Reply-To: <20200527153130.GA525531@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=vmware.com;
x-originating-ip: [106.51.141.116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d88f7f6-a633-436d-9d3f-08d802d90061
x-ms-traffictypediagnostic: MN2PR05MB6381:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB63810BD4EEF2549E881B566ACD8E0@MN2PR05MB6381.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 30eYHan09ATRIk/TCdhG32ogQzu1h5okFSXu7BDdNZZC5TgdzHjxd5v35/LK8UFqUQBcHvLkj8sxg+JGg03CtPhkDOk20hVCCDWIYHYuJ3k91y2tKAKe7IdOlCPCZ13QXpQTP+jFgTuqVNtd5dtymSWGH0hqaNncrAP+JON6PB7OIPyDvYj1huArkl3TjbdgUiRvEtWrARU838fuhRreLyPQJHTfmrzzHt+vRDL5WFq0lD2pOpe5rJBT+o9c43BMKNvo105AA87Oybrd2DM/AIgYJXnJGQscyveZtZSAv1lwzn4SFxD+DcVGXjqoN523/mJgwOboEdk4vgKTrWe+MqLKKOP7k2dsR/XQSsaR3ICKch9XAcywdqyphmheeriv9oLV7iuzNLyrSaT92zD4tw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6381.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(76116006)(186003)(9686003)(8676002)(66946007)(66476007)(66556008)(64756008)(66446008)(52536014)(55016002)(478600001)(4326008)(45080400002)(83380400001)(8936002)(53546011)(55236004)(316002)(54906003)(6506007)(7696005)(966005)(26005)(6916009)(71200400001)(86362001)(5660300002)(33656002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: gXkt6fF5GSuSg8UoibAidEIcmLNH4NNFvmTq28ZRZ0KjAy/UtnO++fk2FRJC2laOVAUi6v5a8YtB7sZ03/H3BCN+P5IU6vI+5Y9X8ayf+Mo42m0Z4cf/uxBxe0slds1hT3Gsv/lRbSAHqAFH++DkHUTVELC2UgHVspOeZs8SE/h6g5iJ+sW2CjVVac8dg6lZD9Z5pS2+hfg9sVr9kAsAhrfQEYH/q+mEP3iNTsl6Vw7bXPWFnSK9uXSUc7jF8ZLn7GRijgcJ96QXDeRb2YJ+s3F3CUZ5JcZwORah5tBmo5LtHeKICZuE1XVGJwzhcXZMXT9TgK8XBu19VwX1fbcgu+FBsgBw00iIRfIvcFDCRMM5MRYMJMjY5GDQbDXvhry9S+pFwVcIcShOx0xugyoTDP6CjyiApWOU/W6+oTVADk1VYK+iifd7evVDvPJDfiyG+MmS9Z+WT8QrShxcmrpUV3lIRvxFVhpkJO8HQ16gnGwl4F0f7v0nc1QYVe9n2Sq3
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d88f7f6-a633-436d-9d3f-08d802d90061
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 07:30:30.8562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjFv6e+SesgX9iIoBw95kBUdvtKDQaFRmSn5+WHLVwAXpBSoEBgTKKxQuc3rHsHsOYgFj3E7mJAfZobO6LysNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6381
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



> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Wednesday, May 27, 2020 9:02 PM
> To: Ashwin H <ashwinh@vmware.com>
> Cc: x86@kernel.org; dri-devel@lists.freedesktop.org; intel-
> gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org; stable@kernel.org;
> Srivatsa Bhat <srivatsab@vmware.com>; srivatsa@csail.mit.edu;
> rostedt@goodmis.org; Steven Rostedt <srostedt@vmware.com>; Linus
> Torvalds <torvalds@linux-foundation.org>
> Subject: Re: [PATCH v4.19.x] make 'user_access_begin()' do 'access_ok()'
> 
> On Wed, May 13, 2020 at 05:08:19PM +0000, Ashwin H wrote:
> > > Ok, but what does that mean for us?
> > >
> > > You need to say why you are sending a patch, otherwise we will guess
> wrong.
> >
> > In drivers/gpu/drm/i915/i915_gem_execbuffer.c, ioctl functions does
> user_access_begin() without doing access_ok(Checks if a user space pointer
> is valid)  first.
> > A local attacker can craft a malicious ioctl function call to
> > overwrite arbitrary kernel memory, resulting in a Denial of Service or
> > privilege escalation (CVE-2018-20669)
> >
> > This patch makes sure that user_access_begin always does access_ok.
> > user_access_begin has been modified to do access_ok internally.
> 
> I had this in the tree, but it broke the build on alpha, sh, and maybe a few
> others :(
> 
Thanks Greg for including this patch. 
I am sorry that this patch caused the failure. As I see this is not a build failure but tests have failed.
Build results:
	total: 155 pass: 155 fail: 0
Qemu test results:
	total: 421 pass: 390 fail: 31
Failed tests:
	<all alpha>
	<all sh>
	<all sheb>

> See:
> 	https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F
> %2Flore.kernel.org%2Fr%2F20200527140225.GA214763%40roeck-
> us.net&amp;data=02%7C01%7Cashwinh%40vmware.com%7Cd8f60bb8a4584
> 7caa10f08d802530997%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C0%7C0%7
> C637261902960990057&amp;sdata=Vjv9v0QhebfcOGSq1UUDKshTDA%2FOV
> 4aKbqzKKJkEQxM%3D&amp;reserved=0
> for the details.
> 
> Can you dig out all of the needed follow-on patches as well, and send them
> all as a patch series for 4.19.y so that I can queue them all up at once?
> 

I will check for follow-on patches and get back.

> thanks,
> 
> greg k-h

Thanks,
Ashwin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
