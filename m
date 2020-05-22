Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C321DE075
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66BF89FA5;
	Fri, 22 May 2020 06:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2098.outbound.protection.outlook.com [40.107.243.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BFB6E970
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 03:01:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIfp0SkQD2+l28YMSwVvsX/iVqaUTVYITLBhJ01ZBFZDE7AdCG4Y7IEoc4Eqi1dvmPWLV2Cw/vXIOHmjLm5FCSGCqnNGjSrT+kbnjPSDNAdAl0E0amP755jq+hzZTsBtAxwWTeQNUFGTeZ6uzzkAGjlN7Giw6vyCp5QBDWOlzJRjUqbAb8raCvgD01tdbdJEwVmG3M5ASNrNm5J+8zThogVYGMyDA69aCz5Cq9PrI/5HIw28Jpyn8Q9lAMFsUILGybMZnLb2DT18EtF65l0wLJdyq0LiGcPVdTqtCuXHUYWfjjJzwA1/oxAOG9V02Vo1d+vUNlqq0udrUiGEw8DJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJpCCWuvvWSdPe9/bHtujvEQAVim8lFM1r7M+Ru2mUI=;
 b=ENwX+g0eZG6WTIu+BTrUDhJyBPNeVLknSALLUYWaKxYA6JYt1o2oC0xb0stoXSN3p/fBCKcRBbQkTxcYVI4GQOhI6UtMjjLvQCqInXFmRfrgFXqow1NCvvR6pFmnrmLVe3ankQgDHacKFbM+SRNVr2Bb1wredpW32ZnZnb04vVxNSHprMSZmNnRCJJA1+/TeN0bq166lVnTxo2W51RSDzG7JzfxbJhyvR9QtTtRsEX1fWz7wNBjpk47+HoK/Hf6YaduG3meBcVZXwSOOvxqSaarO8kEwRXgbLImd48LPEegvlVwL0ryO3XL1W/8lLESWUO30HHCslzb8phaf5do2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJpCCWuvvWSdPe9/bHtujvEQAVim8lFM1r7M+Ru2mUI=;
 b=ThGSVLCq8IveFlm4MqEC1PLqkuDnXraNfOwfC0cyJZtINVT7hqipKVqcq5tX0iAYevQ+nO3s8TbMK0zGN1gWZAKKFLUJIgt4jzr3xKZGsyzaZU6L4LYmGs7v41BXFzq1IKkg9J9ULIbMO315RxbhubhfkuQX6wwXhvo+ZaMvZzA=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4931.namprd06.prod.outlook.com (2603:10b6:208:69::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.26; Fri, 22 May
 2020 03:01:26 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3021.024; Fri, 22 May 2020
 03:01:25 +0000
From: Changming Liu <liu.changm@northeastern.edu>
To: "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>
Subject: [Bug Report] drivers/video/fbdev/da8xx-fb.c: undefined behavior when
 left shifting
Thread-Topic: [Bug Report] drivers/video/fbdev/da8xx-fb.c: undefined behavior
 when left shifting
Thread-Index: AdYv5RkWpz+hFb08R6GWx4Fu56twFQ==
Date: Fri, 22 May 2020 03:01:25 +0000
Message-ID: <BL0PR06MB45486287654FC3C2045A5655E5B40@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none
 header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0995c452-8375-402a-5f92-08d7fdfc6aa8
x-ms-traffictypediagnostic: BL0PR06MB4931:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB4931CB7FB0A343D59C56601DE5B40@BL0PR06MB4931.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QcCYyF8/XXqqNwC+/C00ELq8SeOQButiMm/a4KfS5pDO0mKJyMijnhCDt+o+hPlhh/3DZeREcAUYzbOx9uGmZ5TolE7dS68D6j2uOFFit5tI9BDqJZpzGwVx4e4OzeMxyzJCCKlEH19oAvRXjskmUqFWLvM+u3YVC2Ih0Te0s6btHpu6h4zykEKNzbTJgC4KTuA6CAWERWL9impTc9GIo/DFDX9t1yMhO0hpFRDbPpT1y7CKPg2lW5FrdqCgBKaq6SDC0azLg9+M8fZQyqSytk7Ani9/3dLdRAac5Aj0lwI5ZgxwEqKJaQfqZeoFmFuA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR06MB4548.namprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(26005)(75432002)(8936002)(7696005)(186003)(5660300002)(4744005)(6916009)(6506007)(478600001)(66556008)(2906002)(55016002)(9686003)(52536014)(786003)(86362001)(8676002)(66446008)(33656002)(64756008)(71200400001)(76116006)(66946007)(4326008)(316002)(54906003)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: tRhzI6uviz1jpczTWv+40E1GiHsejtitmfUu1tW1EyA8ugmOwBgClE2ovTtlK9ktCSrick25HkB1HStPEPdQF/lrmgEv7AtA7UCVTYcJR94OqLv8JiNqx81dg/iVyUqTtcPNhhJnlncvE64eGANGO2xDIjY57JGvJqRVMQc1B0UzQQ9do+NOVR0TMpHT1mp5XySLApC2dr2k+lHDI6i5A60sisjeMrkXWZ/+2NGXYVm2+PL9YLVrOD83Nz7VKyu+3bBnAuN2KTawwqQlr0f3/hA/ObVzVnGFnQXlMdT3afSdioBgUSpI5ySl7142qjd5UyZ54q9JDj9IqAwjEpVGR1Wvt1UIZD8QQKVGcWrpqMjuqMLm4GGoAe9Q1G18WkOBec7m8JPSotf0O4/D8btwqBNRSJUk7gmd2JgnFTb43g18G0TnG3dmQHi7SzR+kOv1ata5I9392k0OP7/SDIg3s5ORbYu2EOQh3B32dioQjZUQ0mIAb3Xy9DPWp0TkcmkJ
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0995c452-8375-402a-5f92-08d7fdfc6aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 03:01:25.7300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kScewwWblimoNDkO2+/TO6pUBXhShrlWMrbfI8mPykv3n4a76N66MGMtXHB1XfNWDB3iUZ/g4j9qV959WEVv+uCsDXQqBWYPMqENnJXQJy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4931
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:06 +0000
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

Hi Bartlomiej,
Greetings, it's me again, I sent you a bug report yesterday, I hope that find you well.

This time I found that in /drivers/video/fbdev/da8xx-fb.c
function lcd_cfg_vertical_sync, there might be an undefined result by left shifting.

More specifically, in function lcd_cfg_vertical_sync, line 437. back_porch is a signed integer 
which might come from user space. And it's logic AND with string literal 0xff. The result is then left shifted by 24 bits.

The problem is, since the logic AND produce a signed integer and the result of left shifting this signed integer
(whose lowest 8 bits not cleared) by 24 bits is undefined when its 8th bit is 1. Similar patterns can be found in line 410 as well.

I wonder if this bug is worth fixing? This can help me understand linux and UB a lot.

Looking forward to you valuable response.

Best regards,
Changming Liu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
