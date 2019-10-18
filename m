Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3429DC280
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 12:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDA089C0A;
	Fri, 18 Oct 2019 10:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACB789C0A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 10:16:37 +0000 (UTC)
Received: from VE1PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:803:104::48)
 by DB6PR08MB2934.eurprd08.prod.outlook.com (2603:10a6:6:19::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 18 Oct
 2019 10:16:31 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by VE1PR08CA0035.outlook.office365.com
 (2603:10a6:803:104::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.18 via Frontend
 Transport; Fri, 18 Oct 2019 10:16:31 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 10:16:29 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Fri, 18 Oct 2019 10:16:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 075ead6eb65a5547
X-CR-MTA-TID: 64aa7808
Received: from c7c900905e49.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D1198BE6-59C9-43ED-BCE5-FB2134247329.1; 
 Fri, 18 Oct 2019 10:16:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7c900905e49.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 10:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBZPuNU1lLP+mDxU9SrmhpddBL6smoN+/Wxe3IxxtSekQHSJTLPdFkubhmH72Ktpz0Ea6W9hXhrqQE8uXwvpLzJeCZUJNduCLYt6FXoAKU8r41b6h6xSpLXNxondRJQAJk2SCJnNFjcdhdLmKn0UEK9eonWKPH6hzgLR1SNNv/cmk+lcIJcVCr/Bw03xx7wUnR3QeJxOqLCR/ZZpxyYArPNRIJOsnlK4mQWH8nBMkfHdEexe7xzkep/hTdGEGS1AnrXIhLNcd4VLdcwNxIH2ZG+xQkVoIzRQyL2MgpD638RWbVgGXcPlRStSR4d+OZo6qJj8xG2RCJCa58g4nV68yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTyPv+JW84MjyhdjJpffPNM2vPRPmFYh7RbmzcD4AAM=;
 b=mB6+iCqpl0i0VAs0RrN9JCtox1yewTJOzuAahnV2fWQrk1bU5TR+ml1VVMrPPiIrfw9Gd0dGkvjM8T+j52foAgm2WWkntr+zEqRYb0PqJqfny8HcOoxDwh8ivyWTdgJ8qsqLEYswzqP4Ix5uwj+LNwwjG0cL1IctOaLrVBQsgcXG4MB8h/PO79fg1HGCckB32oXXae2ryN11JwNb93MvBKRwWtPdthx8Jiz+kpYKfUQ0IA0CLzdap8RJv8TQTNkPxntB+l9ExCAz1EuVx+o+zN3HhGTfMuCEI0LTRAbcO5v1Tmc9iUx4RRKloTp+soTzkSXQc8lIsD758VnCvAce2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5040.eurprd08.prod.outlook.com (10.255.159.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 10:16:13 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.026; Fri, 18 Oct 2019
 10:16:13 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v5 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v5 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVhA09wVtvHgqrOkmWUho1ovfOOaddGi2AgALvSoCAABu1gIAADNQA
Date: Fri, 18 Oct 2019 10:16:13 +0000
Message-ID: <20191018101606.GA26967@jamwan02-TSP300>
References: <20191016103339.25858-1-james.qian.wang@arm.com>
 <2404938.QDdPyV61sH@e123338-lin> <20191018075101.GA19928@jamwan02-TSP300>
 <4381055.oiViQHVQgJ@e123338-lin>
In-Reply-To: <4381055.oiViQHVQgJ@e123338-lin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0197.apcprd02.prod.outlook.com
 (2603:1096:201:21::33) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cf947dee-74df-46fc-df4d-08d753b43e0e
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5040:|VE1PR08MB5040:|DB6PR08MB2934:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR08MB2934D5C2523877B3D5AF35F6B36C0@DB6PR08MB2934.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(189003)(199004)(6116002)(14454004)(478600001)(54906003)(81166006)(81156014)(8676002)(8936002)(7736002)(25786009)(6486002)(256004)(3846002)(14444005)(2906002)(229853002)(1076003)(86362001)(4326008)(6436002)(11346002)(55236004)(6506007)(386003)(486006)(52116002)(99286004)(6636002)(5660300002)(476003)(33716001)(446003)(6862004)(6246003)(64756008)(6512007)(76176011)(66066001)(66946007)(71200400001)(71190400001)(66476007)(186003)(316002)(58126008)(102836004)(66446008)(33656002)(9686003)(26005)(66556008)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5040;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pn0afTntVzx1seH2VDheqprqW8HdNI77lA30GbeNngp8Mt32x+4FM/VJdw13DTX2y90BO7eLfdwNc6vi/00yKYBJXaQfMBvYfW/7WCrhDdqYJuATw8pkVGUEPfyBTRgx1yK+Zw3N045o5JYgvbiIYB/VnS505/Kl8LQ+milkNdz5gUnCWukf3uc9rv2c0d5m5BO3EWmeMZBaX5xPn6PYrNW1LKzWjoChpUOGW8/JhxQGU+a45yQj2/fono1S4XAgux/M5OMTFRZY5D0tOwMb5FpWa/M3c1ZvxR5dEnwTAFKCnt0rTSVjFE/fpk0jvXV3RkHeNrUG9UBww01rqYUIFff+Jt/KPzWUo3Now+1R1iMwe0tUdQFJY57evDDvJLyORN9OSB6ugqKRjxx+6UJwCAccxpNUJk7fA/1qzU4SVTs=
Content-ID: <2ACF7231D728B443810BFD099710F1A7@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5040
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(396003)(39860400002)(136003)(346002)(189003)(199004)(305945005)(7736002)(22756006)(6486002)(446003)(26005)(63350400001)(386003)(486006)(14454004)(11346002)(336012)(97756001)(229853002)(76176011)(6246003)(102836004)(99286004)(186003)(6506007)(126002)(476003)(5660300002)(46406003)(50466002)(107886003)(25786009)(4326008)(14444005)(8676002)(2906002)(81156014)(86362001)(23726003)(70586007)(33656002)(1076003)(76130400001)(8936002)(8746002)(81166006)(33716001)(70206006)(316002)(6512007)(54906003)(9686003)(26826003)(478600001)(66066001)(356004)(6116002)(58126008)(6862004)(3846002)(47776003)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR08MB2934;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0c8668e2-3510-48c4-548a-08d753b4341f
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y3CNmGEuVwRD6IOOeooLxVkEyozznIHH09mGXvSZMpnvboKg7K7j2G9VdmbLSnlJVCAX68C+A1Pv9o30ZQw/qani2/AGpu1nR5vY7ejsQNFQ2telEl4vDf8PuPTkGXAx7d+XiPfC4xWXT0Tox6PuHLkxkTayhcCt/kUpJagAGmYVGJpxhjaxkAIlNHs8BXp9VKuQX7qYI5N0HbGIDqc6oA35q+RPohfb2T/x2He5AdqDAgdEsswRBfadbb7mqecSp0rX9dn6uPy243fKR1daKVAM5gbE8quJRrFktuuZQXDLAeN+tkmGYEn/80SJ+uZGpChcanN0Q9yxj5BLz5ANBv9yXJRjbWlfipXMacHVKg4XfjmoIMBfwBrJBkGlA8XNVO2wdSQRY49K7zvLr06fRICrEQsAqSjTY3VNKyH+tNU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 10:16:29.5914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf947dee-74df-46fc-df4d-08d753b43e0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2934
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTyPv+JW84MjyhdjJpffPNM2vPRPmFYh7RbmzcD4AAM=;
 b=xYAEUymBNFAubRQ47LjFVvru45KKsySOepoaMviV3rkFoLTz7so03ajcpvklcLqWD4Ayii/T+X1ljQFLSPqHWsP/T+GkKXLgkcaYoR1rqRPZVbzm5yHUKgJME1j7igwruxTruUX1EmdzZ8Km6gtNIFsJ9aVWX1Cdg9DWLshUvpo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTyPv+JW84MjyhdjJpffPNM2vPRPmFYh7RbmzcD4AAM=;
 b=xYAEUymBNFAubRQ47LjFVvru45KKsySOepoaMviV3rkFoLTz7so03ajcpvklcLqWD4Ayii/T+X1ljQFLSPqHWsP/T+GkKXLgkcaYoR1rqRPZVbzm5yHUKgJME1j7igwruxTruUX1EmdzZ8Km6gtNIFsJ9aVWX1Cdg9DWLshUvpo=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDk6MzA6MTFBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBPbiBGcmlkYXksIDE4IE9jdG9iZXIgMjAxOSAwODo1MTowOSBCU1QgamFtZXMg
cWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiBPbiBXZWQsIE9jdCAx
NiwgMjAxOSBhdCAxMTowMjowM0FNICswMDAwLCBNaWhhaWwgQXRhbmFzc292IHdyb3RlOgo+ID4g
PiBPbiBXZWRuZXNkYXksIDE2IE9jdG9iZXIgMjAxOSAxMTozNDowOCBCU1QgamFtZXMgcWlhbiB3
YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiA+ID4gQWRkIGEgbmV3IGhlbHBl
ciBmdW5jdGlvbiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkgZm9yIGRyaXZlciB0bwo+
ID4gPiA+IGNvbnZlcnQgUzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIFFtLm4gMidzIGNvbXBsZW1l
bnQgdGhhdCBzdXBwb3J0ZWQgYnkKPiA+ID4gPiBoYXJkd2FyZS4KPiA+ID4gPiAKPiA+ID4gPiBW
NDogQWRkcmVzcyBNaWhhaSwgRGFuaWVsIGFuZCBJbGlhJ3MgcmV2aWV3IGNvbW1lbnRzLgo+ID4g
PiA+IFY1OiBJbmNsdWRlcyB0aGUgc2lnbiBiaXQgaW4gdGhlIHZhbHVlIG9mIG0gKFFtLm4pLgo+
ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hu
b2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiA+ID4gPiBSZXZpZXdlZC1i
eTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgo+ID4gPiA+IFJl
dmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gPiA+
IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYyB8IDI3ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICBpbmNsdWRlL2RybS9kcm1fY29sb3JfbWdt
dC5oICAgICB8ICAyICsrCj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygr
KQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9y
X21nbXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gPiA+ID4gaW5kZXgg
NGNlNWM2ZDhkZTk5Li5kMzEzZjE5NGYxZWMgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9jb2xvcl9tZ210LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2NvbG9yX21nbXQuYwo+ID4gPiA+IEBAIC0xMzIsNiArMTMyLDMzIEBAIHVpbnQzMl90IGRybV9j
b2xvcl9sdXRfZXh0cmFjdCh1aW50MzJfdCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lz
aW9uKQo+ID4gPiA+ICB9Cj4gPiA+ID4gIEVYUE9SVF9TWU1CT0woZHJtX2NvbG9yX2x1dF9leHRy
YWN0KTsKPiA+ID4gPiAgCj4gPiA+ID4gKy8qKgo+ID4gPiA+ICsgKiBkcm1fY29sb3JfY3RtX3Mz
MV8zMl90b19xbV9uCj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqIEB1c2VyX2lucHV0OiBpbnB1dCB2
YWx1ZQo+ID4gPiA+ICsgKiBAbTogbnVtYmVyIG9mIGludGVnZXIgYml0cywgaW5jbHVkZSB0aGUg
c2lnbi1iaXQsIHN1cHBvcnQgcmFuZ2UgaXMgWzEsIDMyXQo+ID4gPiAKPiA+ID4gQW55IHJlYXNv
biB3aHkgbnVtYmVycyBsaWtlIFEwLjMyIGFyZSBkaXNhbGxvd2VkPyBJbiB0aG9zZSBjYXNlcywg
dGhlCj4gPiA+ICdzaWduJyBiaXQgYW5kIHRoZSBmaXJzdCBmcmFjdGlvbmFsIGJpdCBqdXN0IGhh
cHBlbiB0byBiZSB0aGUgc2FtZSBiaXQuCj4gPiA+IFRoZSBsb25nZXIgSSBsb29rIGF0IGl0LCB0
aGUgbW9yZSBJIHRoaW5rIG1lbnRpb25pbmcgYSAnc2lnbi1iaXQnIGhlcmUKPiA+ID4gbWlnaHQg
Y29uZnVzZSBwZW9wbGUgbW9yZSwgc2luY2UgMidzIGNvbXBsZW1lbnQgZG9lc24ndCBoYXZlIGEK
PiA+ID4gZGVkaWNhdGVkIGJpdCBqdXN0IGZvciB0aGUgc2lnbi4gSG93IGFib3V0IHJlZHVjaW5n
IGl0IHNpbXBseSB0bzoKPiA+IAo+ID4gTm8sIHNpbmNlIHRoZSB2YWx1ZSBpcyBzaWduZWQgdGhl
cmUgbXVzdCBiZSBkZWRpY2F0ZWQgc2lnbi1iaXQuCj4gCj4gQXMgSSd2ZSBzYWlkIGEgZmV3IHRp
bWVzIGJlZm9yZSBpbiB0aGlzIHJldmlldywgMidzIGNvbXBsZW1lbnQgaGFzIG5vCj4gZGVkaWNh
dGVkIHNpZ24gYml0LCB0aGF0J3MgdGhlIHdob2xlIHJlYXNvbiAyJ3MgY29tcGxlbWVudCBleGlz
dHMgaW4KPiB0aGUgZmlyc3QgcGxhY2UuIFRoZSBzaWduIGlzIGltcGxlbWVudGVkIGJ5IG5lZ2F0
aW5nIHRoZSB3ZWlnaHQgb2YKPiB0aGUgbW9zdCBzaWduaWZpY2FudCBiaXQuIFRoaXMgaXNuJ3Qg
YSBkZWRpY2F0ZWQgKy8tIGZpZWxkIQo+IAo+ID4gCj4gPiBjb25zaWRlciB2ZXJ5IHNpbXBsZSAy
IGJpdCBzaWduZWQsIFExLjEKPiA+IAo+ID4gIDAuNSAgaXMgMDEKPiA+ICAwICAgIGlzIDAwCj4g
PiAtMC41ICBpcyAxMQo+ID4gLTEuMCAgaXMgMTAsIHNpZ24tYml0IGFuZCB2YWx1ZSBzaGFyZSBz
YW1lIGJpdCwgYnV0IGl0IGlzIGludGVnZXIgcGFydC4KPiAKPiBBbmQgYSB2ZXJ5IHNpbXBsZSAy
LWJpdCBzaWduZWQgUTAuMiB3b3VsZCBsb29rIGxpa2UgdGhpczoKPiAKPiB3ZWlnaHRzOiAoLTJe
LTEpKmIxICsgKDJeLTIpKmIwCj4gICAgICAgICAgIF4KPiAgICAgICAgICAgTC0+IG5vdGUgbmVn
YXRpdmUgd2VpZ2h0IGF0IG1vc3Qgc2lnbmlmaWNhbnQgYml0IHBvc2l0aW9uCj4gCj4gKy0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tKwo+IC8gYml0IHBhdHRlcm4gfCBkZWNpbWFsIHZhbHVl
IHwKPiArLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0rCj4gXCAgICAgMDAgICAgICB8ICAg
ICAwLjAgICAgICAgfAo+IC8gICAgIDAxICAgICAgfCAgICAgMC4yNSAgICAgIHwKPiBcICAgICAx
MCAgICAgIHwgICAgLTAuNSAgICAgICB8Cj4gLyAgICAgMTEgICAgICB8ICAgIC0wLjI1ICAgICAg
fAo+ICstLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLSsKPiAKPiAoQXBvbG9naWVzIGZvciB0
aGUgcmFnZ2VkIGxlZnQgYm9yZGVyIG9uIHRoZSB0YWJsZSA6LykKPiAKPiBJIGdlbnVpbmVseSBk
b24ndCBzZWUgd2h5IHlvdSByZWFsbHkgd2FudCB0byBoYXZlIHRoYXQgaW50ZWdlciBwYXJ0IGJl
Cj4gc3RyaWN0bHkgbm9uLXplcm8gaW4gc2l6ZSwgaXQgY2FuIHZlcnkgd2VsbCBiZSBhbGwgZnJh
Y3Rpb25hbC4KPiAKPiA+IAo+ID4gU2VlIHRoZSB3aWtpOgo+ID4gCj4gPiBPbmUgY29udmVudGlv
biBpbmNsdWRlcyB0aGUgc2lnbiBiaXQgaW4gdGhlIHZhbHVlIG9mIG0sWzFdWzJdIGFuZCB0aGUg
b3RoZXIgY29udmVudGlvbgo+ID4gZG9lcyBub3QuIFRoZSBjaG9pY2Ugb2YgY29udmVudGlvbiBj
YW4gYmUgZGV0ZXJtaW5lZCBieSBzdW1taW5nIG0rbi4gSWYgdGhlIHZhbHVlIGlzIGVxdWFsCj4g
PiB0byB0aGUgcmVnaXN0ZXIgc2l6ZSwgdGhlbiB0aGUgc2lnbiBiaXQgaXMgaW5jbHVkZWQgaW4g
dGhlIHZhbHVlIG9mIG0uIElmIGl0IGlzIG9uZQo+ID4gbGVzcyB0aGFuIHRoZSByZWdpc3RlciBz
aXplLCB0aGUgc2lnbiBiaXQgaXMgbm90IGluY2x1ZGVkIGluIHRoZSB2YWx1ZSBvZiBtLgo+IAo+
IFRoaXMgaXMgdmVyeSBtdWNoIG9mZiB0aGUgbWFyay4gU2VlIGFib3ZlIGZvciBteSBzaWduIGJp
dCBpbiAyJ3MKPiBjb21wbGVtZW50IHJhbnQuIFdpdGggdGhhdCBjYXZlYXQsIHdoYXQgeW91IHJl
ZmVyIHRvIGFzIHRoZSBzaWduCj4gYml0IGlzIHNpbXBseSB0aGUgdG9wIGJpdC4gSWYgbStuIGlz
IDE2LCB0aGVuIHdoYXQgeW91IHJlZmVyIHRvIGFzCj4gdGhlIHNpZ24gYml0IGlzIGluIGJpdCBw
b3NpdGlvbiAxNSB3aXRoIGEgd2VpZ2h0IG9mIC0yXihtLTEpLiBJZgo+IG0rbiBpcyBpbnN0ZWFk
IDEzLCB0aGVuIGFsbCB0aGF0IGNoYW5nZXMgaXMgdGhhdCB0aGUgYml0IHdpdGggdGhlCj4gd2Vp
Z2h0IG9mIC0yXihtLTEpIGlzIGF0IHBvc2l0aW9uIDEyLgo+IAo+IE1vc3QgaW1wb3J0YW50bHks
IHRoZXJlIGlzIG5vdGhpbmcgc3BlY2lhbCBhYm91dCBtICsgbiA9PSByZWdzaXplLAo+IHRoZSBs
YWNrIG9mIHNpZ24tZXh0ZW5zaW9uIGFzaWRlLgo+IAo+IFdoYXQgSSB0aGluayBpcyB0aGUgc291
cmNlIG9mIGNvbmZ1c2lvbiBpcyB0aGF0IHdoZW4geW91IGV4cGFuZCwgc2F5LAo+IFE0LjQgaW50
byBhIFE4LjgsIHlvdSBuZWVkIHRvIGRvIHNpZ24gZXh0ZW5zaW9uLCBzbyBiaXQgcG9zaXRpb24g
Nwo+IGluIHRoZSBvcmlnaW5hbCBRNC40IG5lZWRzIHRvIGJlIHJlcGxpY2F0ZWQgaW50byBwb3Np
dGlvbnMgMTItMTUgaW4KPiBhZGRpdGlvbiB0byBtb3ZpbmcgaXQgdG8gcG9zaXRpb24gMTEgaW4g
dGhlIGRlc3RpbmF0aW9uIGZvcm1hdC4gQnV0Cj4gdGhlbiB0aG9zZSBhcmUgbm8gbG9uZ2VyIHNp
Z24gYml0cywgdGhlIHNpZ25lZG5lc3MgaXMgZW5jb2RlZCBpbiBiaXQKPiAxNSBhcyBhIHdlaWdo
dCBvZiAtMl43IDopLgo+CgpUaGFuayB5b3UgdmVyeSBtdWNoLgoKZmluaWFsIEkgZ290IGl0LCB3
aWxsIHVwZGF0ZSB0aGUgcGF0Y2ggaW4gdGhlIG5leHQgdmVyc2lvbiAKCj4gPiAKPiA+IFNvIGZv
ciB0aGUgMzJiaXQgdmFsdWUsIGFsbCBmcmFjdGlvbmFsOgo+ID4gCj4gPiBhKSBNIGluY2x1ZGUg
c2lnbi1iaXQ6IFExLjMxCj4gCj4gVGhpcyBpcyBhIDMyLWJpdCBudW1iZXIgd2l0aCByYW5nZSBb
LTEsIDEgLSAyXi0zMV0gYW5kIHByZWNpc2lvbiAyXi0zMS4KPiBUaGUgd2VpZ2h0IG9mIGJpdCAz
MSBpcyBzaW1wbHkgLTJeMCAoaS5lLiAtMSkuIFRoaXMgaGFzIDEgaW50ZWdlciBiaXQuCj4gCj4g
PiBiKSBNIGRvZXNuJ3QgaW5jbHVkZSBzaWduLWJpdDogUTAuMzEKPiAKPiBUaGlzIGlzIGEgMzEt
Yml0IG51bWJlciB3aXRoIHJhbmdlIFstMC41LCAxIC0gMl4tMzFdLiBTYW1lIHByZWNpc2lvbiBh
cwo+IGFib3ZlIGJ1dCBzbWFsbGVyIHJhbmdlLiBUaGlzIGlzIGFsbCBmcmFjdGlvbmFsIGJ1dCBu
b3QgYSAzMi1iaXQgdmFsdWUuCj4gSSB0aGluayB5b3UncmUgbG9va2luZyBmb3IgUTAuMzIsIHdo
aWNoIGhhcyBhbG1vc3QgdGhlIHNhbWUgcmFuZ2UgYnV0Cj4gZG91YmxlIHRoZSBwcmVjaXNpb24u
Cj4gCj4gPiAKPiA+ID4gCj4gPiA+ICAqIEBtOiBudW1iZXIgb2YgaW50ZWdlciBiaXRzLCBtIDw9
IDMyLgo+ID4gPiAKPiA+ID4gPiArICogQG46IG51bWJlciBvZiBmcmFjdGlvbmFsIGJpdHMsIG9u
bHkgc3VwcG9ydCBuIDw9IDMyCj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqIENvbnZlcnQgYW5kIGNs
YW1wIFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5uIChzaWduZWQgMidzIGNvbXBsZW1lbnQp
LiBUaGUKPiA+ID4gPiArICogaGlnaGVyIGJpdHMgdGhhdCBhYm92ZSBtICsgbiBhcmUgY2xlYXJl
ZCBvciBlcXVhbCB0byBzaWduLWJpdCBCSVQobStuKS4KPiA+ID4gCj4gPiA+IFtuaXRdIEJJVCht
ICsgbiAtIDEpIGlmIHdlIGNvdW50IGZyb20gMC4KPiA+IAo+ID4gZG8gd2UgcmVhbCBuZWVkIHRv
IGNvbnNpZGVyIHRoaXMsIGNvbnZlcnQgdG8gKFExLjApIDopCj4gPiBJIHRoaW5rIGl0IGNhbiBi
ZSBlYXNpbHkgY2F1Z2h0IGJ5IHJldmlldy4KPiAKPiBRMS4wIGhhcyBhIHJhbmdlIG9mIFstMSwg
MF0gYW5kIHByZWNpc2lvbiBvZiAxLCBidXQgSSBkb24ndCBnZXQgaG93Cj4gdGhpcyBpcyByZWxl
dmFudC4gSSB3YXMganVzdCByZWZlcnJpbmcgdG8gY29udmVudGlvbiB0aGF0IGJpdHMgZ2V0Cj4g
Y291bnRlZCBmcm9tIDAsIHNvIHRoZSBtb3N0IHNpZ25pZmljYW50IGJpdCBpcyBzaW1wbHkgYXQg
cG9zaXRpb24KPiBtICsgbiAtIDEgYW5kIG5vdCBtICsgbi4KPiBtICsgbiBpbiwgc2F5LCBRMTYu
MTYgd291bGQgYmUgYml0IDMyLCB3aGljaCBpcyBqdXN0IHBhc3QgdGhlIHZhbGlkCj4gWzAuLjMx
XSBiaXRzLgo+IAo+IEkgd2FzIGhvcGluZyB0aGF0IGJ5IGV4cGxpY2l0bHkgdGFnZ2luZyB0aGUg
Y29tbWVudCB3aXRoICdbbml0XScgd291bGQKPiBoZWxwIGNvbnZleSBpdHMgbG93IGltcG9ydGFu
Y2UgOikuCj4gCj4gPiA+IAo+ID4gPiA+ICsgKi8KPiA+ID4gPiArdWludDY0X3QgZHJtX2NvbG9y
X2N0bV9zMzFfMzJfdG9fcW1fbih1aW50NjRfdCB1c2VyX2lucHV0LAo+ID4gPiA+ICsJCQkJICAg
ICAgdWludDMyX3QgbSwgdWludDMyX3QgbikKPiA+ID4gPiArewo+ID4gPiA+ICsJdTY0IG1hZyA9
ICh1c2VyX2lucHV0ICYgfkJJVF9VTEwoNjMpKSA+PiAoMzIgLSBuKTsKPiA+ID4gPiArCWJvb2wg
bmVnYXRpdmUgPSAhISh1c2VyX2lucHV0ICYgQklUX1VMTCg2MykpOwo+ID4gPiA+ICsJczY0IHZh
bDsKPiA+ID4gPiArCj4gPiA+ID4gKwlXQVJOX09OKG0gPCAxIHx8IG0gPiAzMiB8fCBuID4gMzIp
Owo+ID4gPiA+ICsKPiA+ID4gPiArCS8qIHRoZSByYW5nZSBvZiBzaWduZWQgMidzIGNvbXBsZW1l
bnQgaXMgWy0yXihtLTEpLCAyXihtLTEpIC0gMl4tbl0gKi8KPiA+ID4gPiArCXZhbCA9IGNsYW1w
X3ZhbChtYWcsIDAsIG5lZ2F0aXZlID8KPiA+ID4gPiArCQkJCUJJVF9VTEwobiArIG0gLSAxKSA6
IEJJVF9VTEwobiArIG0gLSAxKSAtIDEpOwo+ID4gPiA+ICsKPiA+ID4gPiArCXJldHVybiBuZWdh
dGl2ZSA/IC12YWwgOiB2YWw7Cj4gPiA+ID4gK30KPiA+ID4gPiArRVhQT1JUX1NZTUJPTChkcm1f
Y29sb3JfY3RtX3MzMV8zMl90b19xbV9uKTsKPiA+ID4gPiArCj4gPiA+ID4gIC8qKgo+ID4gPiA+
ICAgKiBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdCAtIGVuYWJsZSBjb2xvciBtYW5hZ2VtZW50
IHByb3BlcnRpZXMKPiA+ID4gPiAgICogQGNydGM6IERSTSBDUlRDCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggYi9pbmNsdWRlL2RybS9kcm1fY29sb3Jf
bWdtdC5oCj4gPiA+ID4gaW5kZXggZDFjNjYyZDkyYWI3Li42MGZlYTU1MDE4ODYgMTAwNjQ0Cj4g
PiA+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAo+ID4gPiA+ICsrKyBiL2lu
Y2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiA+ID4gPiBAQCAtMzAsNiArMzAsOCBAQCBzdHJ1
Y3QgZHJtX2NydGM7Cj4gPiA+ID4gIHN0cnVjdCBkcm1fcGxhbmU7Cj4gPiA+ID4gIAo+ID4gPiA+
ICB1aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWlu
dDMyX3QgYml0X3ByZWNpc2lvbik7Cj4gPiA+ID4gK3VpbnQ2NF90IGRybV9jb2xvcl9jdG1fczMx
XzMyX3RvX3FtX24odWludDY0X3QgdXNlcl9pbnB1dCwKPiA+ID4gPiArCQkJCSAgICAgIHVpbnQz
Ml90IG0sIHVpbnQzMl90IG4pOwo+ID4gPiA+ICAKPiA+ID4gPiAgdm9pZCBkcm1fY3J0Y19lbmFi
bGVfY29sb3JfbWdtdChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gPiA+ID4gIAkJCQl1aW50IGRl
Z2FtbWFfbHV0X3NpemUsCj4gPiA+ID4gCj4gPiA+IAo+ID4gPiAKPiA+IAo+IAo+IAo+IC0tIAo+
IE1paGFpbAo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
