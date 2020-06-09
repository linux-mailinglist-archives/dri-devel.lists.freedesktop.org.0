Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E834E1F4F2F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623556E417;
	Wed, 10 Jun 2020 07:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760091.outbound.protection.outlook.com [40.107.76.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715676E2C7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 16:09:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgDMiYVG3MW3hQy7Fpj/hYPgqpoctFsTqbXe4JeoPtzlxFYBtvVcNOnl3Nn8ilVo1x2c08nVYYhcH7aL5UnGc2HwfOo0wbhv7AvlNPGoHb8rrdUNatdeVImIOYxlc74f+cwMVXt3r9JISI5o1oEaw47WaZ6WPuM5YrJATkkiNWF/sonFZuB3KAvlJD2t5wDW3h/YXXCpvOkZ8LKdSTJRRRCqCGtRGbOwmqLPeFrTLgs55M4M53q+O0Lugu+zCAMPScCrOZt0V/UAVbGIPVY3060ez0wY0Pa7Zp2r8abXo3OevTc+KyN+lNZIyk/yGG2bU4hs8r8tE3Q3ssbdditwvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iI46TTQ7tYVkc4MKc7mIVcSj56gRNADd+uQfYUlVc6o=;
 b=ijqOZH9ePlcDhAcMgUMxQv4Go5SsPd8tw7f2Xq6wC2Sg1swGXgkwhGfR+iitWsxP6k+y3aAdEql28QlMIyDTIlfmToUj5YAI5sM2aD74nyI7uPxYQL3MZlonxzg26CqoSDWSVKSIBxmMQX4+tW4xSIqfaAssK04ZcLlc78DONfWYF5fl1S/C6LwbAjcP9Oz3ryR8AjKty/sagC/zOSf4bCygFF7Gryv3oFS3qZfbpXDE1v8+drQ06ny7EhMauUU0ah0JfEOKF3I/R2n6BWxUtInUWIx2bQx4n+Nl4U6IcfalLqzpR5qJRAC94mLmaMq4iFHeFpid+lkxgmPhkocw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iI46TTQ7tYVkc4MKc7mIVcSj56gRNADd+uQfYUlVc6o=;
 b=homgDN/4kJ01ytcFwW6XkCqx6rxhuhiOjhr2gyI+f/Nliu0kqa/OT41PIm/mumu+gEyEBwoIuk6374zkJ+HIJBVMftSdXrCpGSbxBu/VlsNjHtezFJWnei7P7hM+G5P/M0FQyJ1FWte35ZMKtXpPirsJUz0xqyqhN43KX0/pGwk=
Received: from BN6PR06MB2532.namprd06.prod.outlook.com (2603:10b6:404:2a::10)
 by BN6PR06MB2324.namprd06.prod.outlook.com (2603:10b6:404:2e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Tue, 9 Jun
 2020 16:09:05 +0000
Received: from BN6PR06MB2532.namprd06.prod.outlook.com
 ([fe80::e802:ad07:3832:e440]) by BN6PR06MB2532.namprd06.prod.outlook.com
 ([fe80::e802:ad07:3832:e440%11]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 16:09:05 +0000
From: Changming Liu <liu.changm@northeastern.edu>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: RE: [Bug Report] drivers/video/fbdev/kyro/fbdev.c: unsigned integer
 wrap-around might cause unexpected behavior
Thread-Topic: [Bug Report] drivers/video/fbdev/kyro/fbdev.c: unsigned integer
 wrap-around might cause unexpected behavior
Thread-Index: AdYvDPkmGOphWO3cRE+TFVL2OMV8xgPPfeAAAArgWkA=
Date: Tue, 9 Jun 2020 16:09:05 +0000
Message-ID: <BN6PR06MB2532740233C9CC536EF1F182E5820@BN6PR06MB2532.namprd06.prod.outlook.com>
References: <CGME20200521011509eucas1p240099e1e51780beeee80257bfc361e33@eucas1p2.samsung.com>
 <BL0PR06MB45489A53C61DF15BF2F95B9CE5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
 <c20a2141-1586-aeb3-abf8-385bb6e498b6@samsung.com>
In-Reply-To: <c20a2141-1586-aeb3-abf8-385bb6e498b6@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none
 header.from=northeastern.edu;
x-originating-ip: [155.33.134.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33525ed3-60f8-408d-10f1-08d80c8f6ed5
x-ms-traffictypediagnostic: BN6PR06MB2324:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR06MB23247F5C9E2FBF2F4742F770E5820@BN6PR06MB2324.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gLwbBb9Jf063oP5bAonW8530DdDyLuLagU3Pq/HfiWVYTsyzhG1N0XWsIDE/DyiQEyhOb6gdvtNKHTapZ05BYA5aqpVm7rH0IOI/yOQnAf56jVTOh37n8OMqO9RjNcEFi9QUbAdTfSMZGNaOb1ulsn3ZbLI0xLevBqqx9dlSnSyUlqgiYYaiUHPa9J10Xe7MYIh+g/NEVSwdv5ouHZqMfNhy7+mzefHhHGwYDbz/ecx6Xc1IsxWt/ixXQckUceW/xtNNr2hLGFkTz5gcmd/Jvsd6FO7oCqq2p+akm8BB3Ynv3f+wPbH0prwl/tDSWkQFirVBaiEfti818o1nicBSjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR06MB2532.namprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(54906003)(55016002)(9686003)(86362001)(66556008)(478600001)(66446008)(71200400001)(66476007)(64756008)(26005)(5660300002)(76116006)(6916009)(8936002)(33656002)(8676002)(66946007)(7696005)(2906002)(316002)(786003)(83380400001)(53546011)(75432002)(6506007)(52536014)(4326008)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Y6iixd5Pyj5S+3x7jhoWbQGk0C1Zng+pJjIfMk8ahC6NjKEOGNKfdE2SO1Uq8m7pUYqQywyf3k9NDkGWQvgewmmBFSNqzuXHjo8fyy9Ad/lnO4vp+/FqmzNlOi/RS7Gd7j3QtjDWk45Mfs9aX+S29gJGvtf9z+8FCIEM5rhsZ0o+YHwrfbzXIQv+eWORjHTKJNvPM0guVBDWNp9m/PDy4yCBF0E+CT1sS7pZFc8VsA3RPem49JtolEh6LFm0NF9Zahq5wZVVrjOunuwnMxpHCgSAqzE8ghVGA1E1UBhQ4Zwz1K3/jeCsGXThFVtRJbSg7op/bwISWxJXYM67cY8IT6bXIiiv3Du2Vt+VGXixIdaklawDgA902ZVSzS5/Zt2c01N+vx5BNJVm8fc/TCZke4q5eTWQ6JpjiQN92X1ALc7yliXnOLZysEumFV3IYcbU+8spyrOKbTs82gZQjpbLSN+VmS25CXNDD3ZZp5L7w2s=
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 33525ed3-60f8-408d-10f1-08d80c8f6ed5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 16:09:05.1239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pGdJFHBx9tRspHRQbytRNBwtStTfb8JPKezanIkEwJ4CFX6/1n9BobkGCV8qk51NOmYMvWuTeYxZ+0EXdHo1V3D0iPyfLaRXgKty4QUDwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR06MB2324
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "Lu,
 Long" <l.lu@northeastern.edu>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "yaohway@gmail.com" <yaohway@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Sent: Tuesday, June 9, 2020 6:44 AM
> To: Changming Liu <liu.changm@northeastern.edu>
> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org; Lu, Long
> <l.lu@northeastern.edu>; yaohway@gmail.com
> Subject: Re: [Bug Report] drivers/video/fbdev/kyro/fbdev.c: unsigned
> integer wrap-around might cause unexpected behavior
> 
> 
> Hi,
> 
> On 5/21/20 3:15 AM, Changming Liu wrote:
> > Hi Bartlomiej,
> > Greetings, I'm a first-year PhD student who is interested in the usage of
> UBSan for linux.
> > And after some experiments, I found that in
> > drivers/video/fbdev/kyro/fbdev.c function
> kyro_dev_overlay_viewport_set, there is an unsigned integer overflow that
> might cause unexpected behavior.
> >
> > More specifically, first at its caller, kyrofb_ioctl, after execution of
> copy_from_user at line 599, struct ol_viewport_set is filled with data from
> user space.
> > And the 4 32bit unsigned integers from it are passed into
> > kyro_dev_overlay_viewport_set. In function
> kyro_dev_overlay_viewport_set, x is added with ulWidth, y is added with
> ulHeight to transfer the length to the coordinate.
> > And the result coordinate might overflow and wrap around. And it is
> passed into function SetOverlayViewPort.
> >
> > It appears that in function SetOverlayViewPort, these values are treated as
> the coordinate of the bottom-right point and the wrap-around is not
> checked.(I might miss something).
> >
> > Due to the lack of knowledge of the interaction between this module and
> the user space, I'm not able to assess if this is a benign wrap-around or
> whether the wrap-around could happen at all.
> > I'd appreciate for you comment on this issue, this could help me
> understand linux and unsigned wrap around a lot.
> >
> > Looking forward to your valuable response!
> 
> It seems that wrap-around can indeed happen but I'm not sure what are the
> exact consequences of it (SetOverlayViewPort() is quite complicated and I
> also don't know how hardware would react to improper settings).
> 
> kyrofb driver is for legacy devices and is not actively maintained so I worry
> that without somebody with the access to hardware and time to investigate
> it further I cannot do much about the problem.
> 
Thanks for the comments! These are valuable observations which show that
hardware-driver interaction can play a role in unsigned wrap-around here.
Indeed, there is no evidence to determine the wrap around is benign or not.
Since these are just for legacy devices, I too would not take the risk to fix sth
which is not broken.

Thanks again for your feedback, I learned a lot.

Best,
Changming

> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> > Best,
> > Changming Liu
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
